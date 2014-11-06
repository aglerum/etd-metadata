(: 
Last updated: November 5, 2014>
Author: Annie Glerum
Organization: Florida State University
Title: Check lines
Use these patterns to check individual elements in the source-pdfdata.xml file.
:)

declare boundary-space preserve;
  
<records>{
for $records in records/record return
    <record>{
for $record in $records 
let $record := $records/record
let $title := $record/title
(: Create other variables as needed :)
(:
let $author := $record/author
let $awarded := $record/awarded
:)
return 
        <title>{string($title)}</title>
(: Create other elements as needed :)
(:
        <author>{string($author)}</author>
        <awarded>{string($awarded)}</awarded>
:)
}   </record>
}</records>