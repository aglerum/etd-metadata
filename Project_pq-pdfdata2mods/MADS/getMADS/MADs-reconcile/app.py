from flask import Flask, request, jsonify, json
from mads_parse import MADsParser
import sys

app = Flask(__name__)

refine_to_lc = list([
    {
        "id": "Names",
        "name": "MADs Name Authority File",
        "index": "/authorities/names"
    }
])

query_types = [{'id': item['id'], 'name': item['name']} for item in refine_to_lc]

metadata = {
    "name": "MADs Reconciliation Service",
    "identifierSpace" : "http://localhost/identifier",
    "schemaSpace" : "http://localhost/schema",
    "defaultTypes": query_types,
    "view": {
        "url": "{{id}}"
    },
}
xml_doc = ""
if len(sys.argv) == 2:
    xml_doc = sys.argv[1]

def jsonpify(obj):
    try:
        callback = request.args['callback']
        response = app.make_response("%s(%s)" % (callback, json.dumps(obj)))
        response.mimetype = "text/javascript"
        return response
    except KeyError:
        return jsonify(obj)

# this route is what is called when adding a recon service in openrefine
# in custom search function, we return a list of all the uris
@app.route("/reconcile/mads", methods=["POST", "GET"])
def reconcile():
    if (xml_doc == ""):
        parse = MADsParser()
    else:
        parse = MADsParser(xml_doc)

    queries = request.form.get('queries')
    # if content in queries (i.e. names), deserialize the content
    if queries: 
        # loads returns a dict
        queries = json.loads(queries)
        results = {}
        # iterates through the dict, gets the key? not sure what type is. 
        for (key, query) in queries.items():
            qtype = query.get('type')
            if qtype is None:
                return jsonpify(metadata)
            
            # limits matches to 3 if no limit is provided
            limit = 3
            if 'limit' in query:
                limit = int(query['limit'])
            
            # performing search
            data = parse.search(query['query'], query_type=qtype)

            # sorts the list in descending order of scores
            data = sorted(data, key=lambda d: d['score'], reverse=True)

            results[key] = {"result": data[:limit]}
        return jsonpify(results)
    return jsonpify(metadata)

if __name__ == "__main__":
    # defaults to localhost port 5000
    # http://127.0.0.1:5000/reconcile/mads
    app.run(debug=True, threaded=True)
