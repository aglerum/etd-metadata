<!-- 

    Created 3/16/2022 by Alex Chisum
    Derived from MARCbib2MARCauthority.xsl by Annie Glerum and DACS OpenRefineTemplate_withNamesAsSubjects by Matthew Miguez
            
-->

<!-- For Prefix -->

<?xml version="1.0" encoding="UTF-8"?>
<marc:collection xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:marc="http://www.loc.gov/MARC21/slim"
    xmlns:mads="http://www.loc.gov/mads/v2"
    xmlns:fs="http://www.lib.fsu.edu"
    xsi:schemaLocation="http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd">
    
    <!-- For Row Template -->
    <marc:record>
        <marc:leader>00000nz  a22     ni 4500</marc:leader>
        <marc:controlfield tag="008">       n|\azannaabn\\\\\\\\\\|n\aaa\\\\\c</marc:controlfield>
        <marc:datafield tag="040" ind1=" " ind2=" ">
            <marc:subfield code="a">FTaSU</marc:subfield>
            <marc:subfield code="b">eng</marc:subfield>
            <marc:subfield code="e">rda</marc:subfield>
            <marc:subfield code="c">FTaSU</marc:subfield>
        </marc:datafield>
        <marc:datafield tag="100" ind1="1" ind2=" ">
            <marc:subfield code="a">{{cells["Last_Name"].value}}, {{cells["First_Name"].value}}</marc:subfield>
            <marc:subfield code="c">{{cells["Name_Title"].value}}</marc:subfield>
            <marc:subfield code="q">{{cells["Fuller_Form_of_Name"].value}}</marc:subfield>
            <marc:subfield code="d">{{cells["Name_Dates"].value}}</marc:subfield>
        </marc:datafield>   
        <marc:datafield tag="370" ind1=" " ind2=" ">
            <marc:subfield code="c">United States</marc:subfield>
            <marc:subfield code="f">Tallahassee (Fla.)</marc:subfield>
            <marc:subfield code="2">naf</marc:subfield>
        </marc:datafield>
        <marc:datafield tag="373" ind1=" " ind2=" ">
            <marc:subfield code="a">Florida State University</marc:subfield>
            <marc:subfield code="2">naf</marc:subfield>
            <marc:subfield code="t">{{cells["Date"].value}}</marc:subfield>
        </marc:datafield>
        <marc:datafield tag="670" ind1=" " ind2=" ">
            <marc:subfield code="a">{{cells["Last_Name"].value}}, {{cells["First_Name_No_Period"].value}}. {{cells["Title"].value}}, {{cells["Date"].value}}:</marc:subfield>
            <marc:subfield code="b">PDF title page ({{cells["First_Name"].value}} {{cells["Last_Name"].value}})</marc:subfield>
        </marc:datafield>
            
<!-- HEY!!! IMPORTANT!!! CHANGE THE DATE IN SUBFIELD A TO MATCH TODAY'S DATE!!! -->
            
        <marc:datafield tag="670" ind1=" " ind2=" ">
            <marc:subfield code="a">DigiNole: FSU's Digital Repository, Electronic Theses, Treatises and Dissertations, March 18, 2022:</marc:subfield>
            <marc:subfield code="b">DigiNole landing page ({{cells["DigiNole_Name"].value}})</marc:subfield>
            <marc:subfield code="u">{{cells["URLs"].value}}</marc:subfield>
        </marc:datafield>
    </marc:record>
    
    <!-- Don't put anything in Row Separator -->
    
    
    <!-- For Suffix -->

</marc:collection>
