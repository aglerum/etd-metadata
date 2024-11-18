from bs4 import BeautifulSoup
import collections
import re
from unidecode import unidecode

class MADsParser: 
    collections.Callable = collections.abc.Callable
    uris_names = {}
    
    # constructor initializes the iternal dict of uri/name pairs. Has a default parameter of 
    # the following XML file. User can pass in any xml file through command line instead
    def __init__(self, xml_file="../source_files/ETD-NAF_mads_20220222.xml"):
        # inits BeautifulSoup parse object with the etd-naf_mads source file
        with open(xml_file, "rb") as fp:
            soup = BeautifulSoup(fp, "xml")

        # iterating through main mads:mads tags
        for name in soup.find_all("mads:mads"):
            # grabs uri from authority -> name -> valueURI
            uri = (name.find('mads:authority')).find('mads:name').get("valueURI")

            # if no uri, continues loop (this never happens)
            if uri is None:
                continue

            # grabbing the last name from authority -> name -> namePart -> family
            l = (name.find('mads:authority').find('mads:name', type="personal")).find('mads:namePart', type='family').get_text()

            # tries to grab the variant name if it exists, if it doesn't, sets lastname2 variable to an empty string
            try:
                l2 = (name.find('mads:variant').find('mads:name', type="personal")).find('mads:namePart', type='family').get_text()
            except:
                l2 = ""
            
            # grabbing the first name
            f = (name.find('mads:authority').find('mads:name', type="personal")).find('mads:namePart', type="given").get_text()

            # same as above, trys to grab the variant first name if it exist
            try:
                f2 = (name.find('mads:variant').find('mads:name', type="personal")).find('mads:namePart', type='given').get_text()
            except:
                f2 = ""
            
            # cleaning up names
            f = re.sub(r'\([^)]*\)', '', f)
            f = f.rstrip()
            f = unidecode(f)

            f2 = re.sub(r'\([^)]*\)', '', f2)
            f2 = f2.rstrip()
            f2 = unidecode(f2)
            f2 = f2.replace("-", " ")

            l = l.replace("-", " ")
            l = unidecode(l)

            l2 = l2.replace("-", " ")
            l2 = unidecode(l2)

            # if variant last name and firstname are not empty strings, sets a string equal to the concatenation, else, empty string
            if (l2 != "" and f2 != ""):
                variant = l2 + ", " + f2
            else:
                variant = ""

            fullname = l + ", " + f

            # sets hash map key as the uri and the value as a tuple of the reg name and variant name
            self.uris_names[uri] = (fullname, variant)

    def uprint(self):
        for k,v in self.uris_names.items():
            print(v)
        
    # returns name with hyphens and commas stripped from string
    def my_strip(self, name):
        return unidecode(name.replace("-", " ").replace(".", ""))

    # given a name from OpenRefine, search the dict for the name in the value, return a list of URIs
    def search(self, name, query_type=''):
        uris = []

        # iterating through all keys/values of the hash map
        for k,v in self.uris_names.items():
            # does checking on first name in tuple (regular name)
            if self.my_strip(name) in self.my_strip(v[0]) or self.my_strip(v[0]) in self.my_strip(name):
                # perfect match = score of 1
                if self.my_strip(v[0]) in self.my_strip(name):
                    uris.append({
                        "id": k,
                        "name": v[0],
                        "score": 1,
                        "match": True
                    })

                # non perfect match, score of .8
                else:
                    uris.append({
                        "id": k,
                        "name": v[0],
                        "score": .80,
                        "match": False
                    })
            
            # if no perfect match, checks for last name prescence. Just last name match is a score of .5
            elif (re.split('\s|, ', self.my_strip(name)))[0] in (re.split('\s|, ', self.my_strip(v[0]))):
                uris.append({
                    "id": k,
                    "name": v[0],
                    "score": .5,
                    "match": False
                })
            
                # split after comma, tokenize the rest of the name
                tokens = ((self.my_strip(name))).split(',', 1)[-1].lstrip()
                tokens = tokens.split()

                # want to exclude middle initials
                for string in tokens[:]:
                    if len(string) == 1:
                        tokens.remove(string)

                # checking for presence of first name or full middle name, increases match score to .75
                if any(ext in v[0] for ext in tokens):
                    uris[-1].update({"score":.75})
                    # if you want scores of .75 to auto match, uncomment this out
                    # uris[-1].update({"match":True})
            
            # if a variant name is present in the tuple, does the exact same checking and matching as all the above code
            if (v[1] != ""):
                if self.my_strip(name) in self.my_strip(v[1]) or self.my_strip(v[1]) in self.my_strip(name):
                    if self.my_strip(v[1]) in self.my_strip(name):
                        uris.append({
                            "id": k,
                            "name": v[1],
                            "score": 1,
                            "match": True
                        })
                    else:
                        uris.append({
                            "id": k,
                            "name": v[1],
                            "score": .80,
                            "match": False
                        })
                
                # if no perfect match, checks for last name prescence. Just last name match is a score of .5
                elif (re.split('\s|, ', self.my_strip(name)))[0] in (re.split('\s|, ', self.my_strip(v[1]))):
                    uris.append({
                        "id": k,
                        "name": v[1],
                        "score": .5,
                        "match": False
                    })
                
                    # split after comma, tokenize the rest of the name
                    tokens = ((self.my_strip(name))).split(',', 1)[-1].lstrip()
                    tokens = tokens.split()

                    # want to exclude middle initials
                    for string in tokens[:]:
                        if len(string) == 1:
                            tokens.remove(string)

                    # checking for presence of first name or full middle name, increases match score to .75
                    if any(ext in v[1] for ext in tokens):
                        uris[-1].update({"score":.75})
                        # if you want scores of .75 to auto match, uncomment this out
                        # uris[-1].update({"match":True})

        # the below code handles the same names/uris being returned, gets rid of dupes, keeps highest score
        # create a hash map of occurences of the uri
        uri_oc = {}
        index = 0

        # iterating through the uris
        for uri in uris:
            if (uri.get("id") in uri_oc):
                # if the uri already exists in the dict, compare the current
                # score with the uris at the stored index (as value)
                if (uri.get("score") > uris[uri_oc[uri.get("id")]].get("score")):
                    del uris[uri_oc[uri.get('id')]]
                elif(uri.get("score") < uris[index].get("score")):
                    del uris[index]
                else:
                    uris.remove(uri)
            else:
                uri_oc[uri.get("id")] = index

            index += 1
        
            
        # if there is only one match in the list, will automatch 
        if (len(uris) == 1):
            uris[-1].update({"match":True})
        
        # if there's only two matches in the list, will automatch on the highest score
        if (len(uris) == 2):
            if (uris[0].get("score") > uris[1].get("score")):
                uris[0].update({"match":True})
            elif (uris[0].get("score") < uris[1].get("score")):
                uris[1].update({"match":True})

        # maybe right an match case for if there's a score of .8 and the rest are <=.5

        return uris


if __name__ == "__main__":
    parse = MADsParser()
