<?xml version="1.0" encoding="UTF-8"?> 

<!--  
Last updated: November 5, 2014
Author: Annie Glerum
Organization: Florida State University
Title: Pipeline for reformatting PDF to XML data
-->
<!-- NOTES:
     If the final result has less than the original number of records, review each step's result to identify the missing elements or record(s). Modify the xslt or manually correct the original pdf2xml xml file as appropriate.
     
     reformat_cleanup1.xsl does not address the following errors. 
     Delete or correct these manually in the input file:
        * Copyright statements without ©
        * Unwanted character entities within the text, such as '&#x2028;'
        * Unintended exclamation points in titles        
        * Elements that contains text lacking spaces such as "INTHEILLUSTRATEDHARLEYAPOCALYPSE..."
        * Some elements have hidden characters; delete those elements then rekey into the input file.
            
     reformat_cleanup3.xsl does not address the following errors. 
     Correct these manually in the input file:
        * Misspellings such as "Disseration"
    -->

<!-- PROCEDURE -->
<!-- 
    1. Convert pages 1-2 of PDFs to XML. Save result as pdf2xml-YYYYAa.xml where YYYY is the year and Aa is the semester abbreviation. Example: pdf2xml-2014Sp.xml. 
    2. Configure an XProc transformation in oXygen with pdf2xml-YYYYAa.xml as Input and reformat2source-result.xml as Output.
    3. Run the XProc transformation.
    4. Review the output file then modify each step's xslt or manually correct the original pdf2xml xml file as appropriate.
        - If the output file has less than the original number of records (i.e. the number of <lines> should equal the number of <records>), review each step's result to identify the missing record(s). 
        - If the output file has missing elements or missing or incorrect data, review each step's result to identify which record(s) has these issues.
        - Check for capitalization errors. Add terms to caps.xml if appropriate.
    5. Resave the corrected output file as source-pdfdata-YYYYAa.xml.
-->


<p:declare-step 
    xmlns:p="http://www.w3.org/ns/xproc" 
    xmlns:c="http://www.w3.org/ns/xproc-step"
    version="1.0">

    <p:input port="source" sequence="false"/>
    <p:input port="parameters" kind="parameter"/>
    <p:output port="result" sequence="false"/>
    <p:serialization port="result" indent="true"/>

    <p:xslt name="process1">
        <p:input port="source"/>
        <p:input port="stylesheet">
            <p:document href="pdfdata/reformat-pdf2xml.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>

    <p:store indent="true" href="pdfdata/reformat-pdf2xml-result.xml"/>
    
    <p:xslt name="process2">
        <p:input port="source">
            <p:pipe port="result" step="process1"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="pdfdata/reformat-cleanup1.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>

    <p:store indent="true" href="pdfdata/reformat-cleanup1-result.xml"/>

    <p:xslt name="process3">
        <p:input port="source">
            <p:pipe port="result" step="process2"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="pdfdata/reformat-cleanup2.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>

    <p:store indent="true" href="pdfdata/reformat-cleanup2-result.xml"/>

    <p:xslt name="process4">
        <p:input port="source">
            <p:pipe port="result" step="process3"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="pdfdata/reformat-cleanup3.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>

    <p:store indent="true" href="pdfdata/reformat-cleanup3-result.xml"/>

    <p:xslt name="process5">
        <p:input port="source">
            <p:pipe port="result" step="process4"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="reformat2source.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>

</p:declare-step>
