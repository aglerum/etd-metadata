(: 
Last updated: November 5, 2014>
Author: Annie Glerum
Organization: Florida State University
Title: Check bepress
Use these patterns to check individual elements in the source-pdfdata.xml file.
:)

declare boundary-space preserve;
  
<records>{
for $documents in documents return
    <record>{
for $document in $documents/document
let $title := $document/title
(: Create other variables as needed :)
(:
let $author := $document/authors/author[concat(lname,', ', fname,' ' mname)]
:)
return 
        <title>{string($title)}</title>
(: Create other elements as needed :)
(:
        <author>{string($author)}</author>
:)
}   </record>
}</records>