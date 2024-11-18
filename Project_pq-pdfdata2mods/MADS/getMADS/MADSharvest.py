import requests

'''
# requests - http://docs.python-requests.org/en/master/
# the simplest HTTP GET/POST utility I've found (Matthew Miquez)
'''
from lxml import etree

'''
# http://lxml.de
# an XML library written in C
'''

NS = {None: "http://www.loc.gov/mads/v2",
      "mads": "http://www.loc.gov/mads/v2",
      "xlink": "http://www.w3.org/1999/xlink",
      "xsi": "http://www.w3.org/2001/XMLSchema-instance"}
# above we're storing all the namespace definitions we'll need as a python dictionary

in_file = open('source/2023DSuEmbargoed_2023EFaStrag_2024BSu.txt', 'r')  # create and open a file object. the 'r' flag is for read

with open('result/2023DSuEmbargoed_2023EFaStrag_2024BSu.xml', 'w') as out_file:  # create another file object, this time in
    # 'w'=write mode

    madsRoot = etree.Element('{http://www.loc.gov/mads/v2}madsCollection',
                             # use the lxml.etree.Element method to create our root
                             version="2.1",  # attributes can be added as keyword=value arguments
                             nsmap=NS)  # apply all namespaces from our dict to this element
    for uri in in_file:  # using our in_file object, let's iterate over each line in the file

        MADSrequest = requests.get(
            uri.rstrip('\r\n') + '.madsxml.xml')  # str.rstrip cleans up any errant newline characters
        '''
        # here we make the actual http request
        # since many types of files live at our URI
        # we just add the extension of the one we
        # want to the end, i.e. +'.html', +'.json',
        # +'.rdf', etc.
        '''
        if MADSrequest.status_code == 200:  # check if we actually got something by HTTP status code
            madsChild = etree.XML(MADSrequest.text)  # parse the received text as XML
            madsRoot.append(madsChild)  # lxml stores parent/child relationships as lists.
            # to add our new XML as a child to root, we use
            # use the list.append() method

    out_file.write(etree.tostring(madsRoot,
                                  pretty_print=True,
                                  xml_declaration=True).decode(
        'utf-8'))  # let's overkill it on the utf-8... b/c I really want it to be utf-8 encoded
in_file.close()
'''
# out_file notes: write to our out_file object the results of lxml.etree.tostring passing in our root element
# the very first thing we did was open in_file. it's good practice to close
# everything you open. 
# the out_file object does not need to be closed. sinced we called it in a
# while loop, python will close it automatically when the loop is exited
'''
