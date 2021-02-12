<?xml version="1.0" encoding="UTF-8"?> 

<!--  
Last updated: July 19, 2020
Author: Annie Glerum
Organization: Florida State University
Title: Pipeline for reformatting PDF to XML data
-->
<!-- NOTES:
     If the final result has less than the original number of records, review each step's result to identify the missing elements or record(s). 
     Modify the xslt or manually correct the original pdf2xml.xml file as appropriate.
     
     This program does not address the all errors. Delete or correct these manually in the input file:
        * Copyright statements without ©
        * Unwanted character entities within the text, such as '&#x2028;'
        * Unintended exclamation points in titles        
        * Text that contains text lacking spaces such as "INTHEILLUSTRATEDHARLEYAPOCALYPSE..."
        * Some text may have hidden characters. Examine the pdf2xml.xml file in Vim then delete those elements then re-key into the input file.
    -->

<!-- PROCEDURE -->
<!-- 
    1. Convert pages 1-2 of PDFs to XML.
    2. Configure an XProc transformation in oXygen with XML/empty.xml (an XML document containing an empty <xml> element) as Input and reformat2source_result.xml as Output.
    3. Run the XProc transformation.
    4. Review the output file. Modify each step's xslt or manually correct the original pdf2xml xml file as appropriate.
        - If the output file has less elements than the original number of records (i.e. the number of pdf2xml,xml files should equal the number of <records>), review each step's result to identify the missing record(s). 
        - If the output file has missing elements or missing or incorrect data, review each step's result to identify which record(s) has these issues. oXygen's Compare function is very useful for this.
        - Check for capitalization errors. Add terms to caps.xml if appropriate. 
    5. Resave the final output file as source_pdfdata_[YYYYSs].xml where Ss is the first to letter of the semester. For example, source_pdfdata_2016Fa.xml. Correct any capitalization errors that could not be addressed by caps.xsl, or any other errors, and resave.
-->


<p:declare-step 
    xmlns:p="http://www.w3.org/ns/xproc" 
    xmlns:c="http://www.w3.org/ns/xproc-step"
    version="1.0">

    <p:input port="source" sequence="false"/>
    <p:input port="parameters" kind="parameter"/>
    <p:output port="result" sequence="false"/>
    <p:serialization port="result" indent="true"/>
    
    <p:xslt name="step00">
        <p:input port="source"/>
        <p:input port="stylesheet">
            <p:document href="XSL/step00_combine_pdf2xml.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>
    
    <p:store indent="true" href="XML/XProc_results/step00_pdf2xml_2019Fa.xml"/>

    <p:xslt name="step01">
        <p:input port="source">
            <p:pipe port="result" step="step00"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="XSL/step01_delete_edit.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>
    
    <p:store indent="true" href="XML/XProc_results/step01_delete_edit_result.xml"/>
    
    <p:xslt name="step02">
        <p:input port="source">
            <p:pipe port="result" step="step01"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="XSL/step02_split_department.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>

    <p:store indent="true" href="XML/XProc_results/step02_split_department_result.xml"/>
    
    <p:xslt name="step03">
        <p:input port="source">
            <p:pipe port="result" step="step02"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="XSL/step03_merge_titles.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>
    
    <p:store indent="true" href="XML/XProc_results/step03_merge_titles_result.xml"/>
 
    <p:xslt name="step04">
        <p:input port="source">
            <p:pipe port="result" step="step03"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="XSL/step04_merge_submitted.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>
 
    <p:store indent="true" href="XML/XProc_results/step04_merge_submitted_result.xml"/>
    
    <p:xslt name="step05">
        <p:input port="source">
            <p:pipe port="result" step="step04"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="XSL/step05_merge_defended.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>
    
    <p:store indent="true" href="XML/XProc_results/step05_merge_defended_result.xml"/>
    
    <p:xslt name="step06">
        <p:input port="source">
            <p:pipe port="result" step="step05"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="XSL/step06_merge_members.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>
    
    <p:store indent="true" href="XML/XProc_results/step06_merge_members_result.xml"/>

    <p:xslt name="step07">
        <p:input port="source">
            <p:pipe port="result" step="step06"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="XSL/step07_reformat2source.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>
    
</p:declare-step>
