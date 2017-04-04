(: 
Last updated: November 5, 2014>
Author: Annie Glerum
Organization: Florida State University
Title: Check lines
Use these patterns to check individual lines in the result of the pdf2xml formatting transformations.
:)

declare boundary-space preserve;
  
<records>{
for $lines in xml/lines return
    <record>{
for $line in $lines 
let $line := $lines/line
return            
        <line>{string($line[3])}</line>
(: Create other elements as needed
        <line>{string($line[4])}</line>
        <line>{string($line[last()])}</line> 
:)
}   </record>
}</records>