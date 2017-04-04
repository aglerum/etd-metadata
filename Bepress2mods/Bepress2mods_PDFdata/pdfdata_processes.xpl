<?xml version="1.0" encoding="UTF-8"?> 
<!--  
Last updated: June 4, 2016
Author: Annie Glerum
Organization: Florida State University
Title: Pipeline for reformatting PDF to XML data
-->

<!-- PROCEDURE -->
<!-- 
    1. Convert pages 1-2 of PDFs to XML. 
    2. Configure an XProc transformation in oXygen an XML document containing an empty <xml> element as Input and reformat2source-result.xml as Output.
    3. Run the XProc transformation.
    4. Use the queries in the check directory to review the output file. Modify each step's xslt or manually correct the original pdf2xml xml file as appropriate.
        - If the output file has less than the original number of records (i.e. the number of <lines> should equal the number of <records>), review each step's result to identify the missing record(s). 
        - If the output file has missing elements or missing or incorrect data, review each step's result to identify which record(s) has these issues.
        - Check for capitalization errors. Add terms to caps.xml if appropriate. 
    5. Resave the final output file as source-pdfdata_[number range].xml. Correct any capitalization errors that could not be addressed by caps.xsl, or any other errors, and resave.
-->

<p:declare-step 
    xmlns:p="http://www.w3.org/ns/xproc" 
    xmlns:c="http://www.w3.org/ns/xproc-step"
    version="1.0">

    <p:input port="source" sequence="false"/>
    <p:input port="parameters" kind="parameter"/>
    <p:output port="result" sequence="false"/>
    <p:serialization port="result" indent="true"/>

    <p:xslt name="step01">
        <p:input port="source"/>
        <p:input port="stylesheet">
            <p:document href="step01-combine_pdf2xml.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>
    
    <p:store indent="true" href="step01-combine_pdf2xml_result.xml"/>
    
    <p:xslt name="step02">
        <p:input port="source">
            <p:pipe port="result" step="step01"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="step02-delete_lines.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>

    <p:store indent="true" href="step02-delete_lines_result.xml"/>
    
    <p:xslt name="step03">
        <p:input port="source">
            <p:pipe port="result" step="step02"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="step03-edit_data.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>
    
    <p:store indent="true" href="step03-edit_data_result.xml"/>
    
    <p:xslt name="step04">
        <p:input port="source">
            <p:pipe port="result" step="step03"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="step04-split_college.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>
    
    <p:store indent="true" href="step04-split_college_result.xml"/>
    
    <p:xslt name="step05">
        <p:input port="source">
            <p:pipe port="result" step="step04"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="step05-merge_titles.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>

    <p:store indent="true" href="step05-merge_titles_result.xml"/>
    
    <p:xslt name="step06">
        <p:input port="source">
            <p:pipe port="result" step="step05"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="step06-merge_submitted.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>
    
    <p:store indent="true" href="step06-merge_submitted_result.xml"/>
 
    <p:xslt name="step07">
        <p:input port="source">
            <p:pipe port="result" step="step06"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="step07-merge_awarded.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>
 
    <p:store indent="true" href="step07-merge_awarded_result.xml"/>
    
    <p:xslt name="step08">
        <p:input port="source">
            <p:pipe port="result" step="step07"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="step08-merge_defended.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>
    
    <p:store indent="true" href="step08-merge_defended_result.xml"/>
    
    <p:xslt name="step09">
        <p:input port="source">
            <p:pipe port="result" step="step08"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="step09-merge_members.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>
    
    <p:store indent="true" href="step09-merge_members_result.xml"/>
    
    <p:xslt name="step10">
        <p:input port="source">
            <p:pipe port="result" step="step09"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="step10_reformat2source.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>

</p:declare-step>
