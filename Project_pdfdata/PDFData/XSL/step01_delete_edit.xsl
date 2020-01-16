<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:x="adobe:ns:meta/" exclude-result-prefixes="x xs xd" version="2.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>January 15, 2019</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Step 1: Delete extraneous lines; edit to correct commons errors</xd:p>
            <xd:p><xd:b>Version: </xd:b>This version includes elements matching commonly found errors in the pdf2xml files.</xd:p>
            <xd:p>
                <xd:b>Notes: </xd:b>
                <xd:ul>Check for: <xd:li>Copyright statements without ©</xd:li>
                    <xd:li>Unwanted special character within the text, such as '&#x2028;'</xd:li>
                    <xd:li>Elements that contains text lacking spaces such as "INTHEILLUSTRATEDHARLEYAPOCALYPSE..."</xd:li>
                </xd:ul>
            </xd:p>
        </xd:desc>
    </xd:doc>

    <!-- Generic identity template -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Normalize space -->
    <xsl:template match="xml/TaggedPDF-doc/P" priority="1">
        <P>
            <xsl:value-of select="normalize-space(.)"/>
        </P>
    </xsl:template>  

    <!-- Elements that are deleted -->
    
    <xsl:template match="xml/TaggedPDF-doc/x:xmpmeta"/>
    <xsl:template match="xml/TaggedPDF-doc/P[text() = '']" priority="2"/>
    <xsl:template match="xml/TaggedPDF-doc/P[text() = 'ii' or text() = 'ii ']" priority="3"/>
    <xsl:template match="xml/TaggedPDF-doc/P[starts-with(.,'The members of the supervisory committee were:')]" priority="4"/>
    <xsl:template match="xml/TaggedPDF-doc/P[starts-with(.,'©')]" priority="5"/>
    <xsl:template match="xml/TaggedPDF-doc/P[starts-with(.,'Copyright ')]" priority="6"/>
    <xsl:template match="xml/TaggedPDF-doc/P[starts-with(upper-case(.),'THE GRADUATE SCHOOL ')]" priority="7"/>
    
    <!-- Capitalization -->
    
    <xsl:template match="xml/TaggedPDF-doc/P[matches(.,'Co-directing')]" priority="9">
        <P>
            <xsl:value-of select="normalize-space(replace(.,'Co-directing','Co-Directing'))"/>
        </P>
    </xsl:template>
    
    <xsl:template match="xml/TaggedPDF-doc/P[text()='BY']" priority="9">
        <P>
            <xsl:value-of select="normalize-space(replace(.,'BY','By'))"/>
        </P>
    </xsl:template>
    
    <!-- Punctuation -->
    
    <xsl:variable name="apos">
        <xsl:text>'</xsl:text>
    </xsl:variable>
    
    <xsl:template match="xml/TaggedPDF-doc/P[contains(.,'’')]" priority="10">
        <P>
            <xsl:value-of select="normalize-space(replace(.,'’',$apos))"/>
        </P>
    </xsl:template>
    
    <xsl:template
        match="xml/TaggedPDF-doc/P[contains(.,' In partial ')]" priority="11">       
        <P>
            <xsl:value-of select="replace(.,' In partial ',' in partial ')"/> 
        </P>                          
    </xsl:template>
    
    
    <!-- Spacing -->
    
    <xsl:template
        match="xml/TaggedPDF-doc/P[starts-with(.,'FLORIDASTATEUNIVERSITY')]" priority="12">      
        <P>
            <xsl:value-of select="replace(.,'FLORIDASTATEUNIVERSITY','FLORIDA STATE UNIVERSITY')"/> 
        </P>                          
    </xsl:template>
    
    <xsl:template
        match="xml/TaggedPDF-doc/P[starts-with(.,'FAMU-FSUCOLLEGEOFENGINEERING')]" priority="13">     
        <P>
            <xsl:value-of select="replace(.,'FAMU-FSUCOLLEGEOFENGINEERING','FAMU-FSU COLLEGE OF ENGINEERING')"/> 
        </P>                          
    </xsl:template>
    
    <xsl:template
        match="xml/TaggedPDF-doc/P[contains(.,'OFARTSANDSCIENCES')]" priority="14">      
        <P>
            <xsl:value-of select="replace(.,'OFARTSANDSCIENCES','OF ARTS AND SCIENCES')"/> 
        </P>                          
    </xsl:template>
    
    <xsl:template
        match="xml/TaggedPDF-doc/P[contains(.,'onNovember')]" priority="15">      
        <P>
            <xsl:value-of select="replace(.,'onNovember','on November')"/> 
        </P>                          
    </xsl:template>
    
    <xsl:template match="xml/TaggedPDF-doc/P[matches(.,'onOctober')]" priority="16">
        <P>
            <xsl:value-of select="normalize-space(replace(.,'onOctober','on October'))"/>
        </P>
    </xsl:template>
    
    <!-- Typos -->
    
    <xsl:template match="xml/TaggedPDF-doc/P[matches(upper-case(.),'UNIVERISTY')]" priority="17">
        <P>
            <xsl:value-of select="normalize-space(replace(upper-case(.),'UNIVERISTY','UNIVERSITY'))"/>
        </P>
    </xsl:template>
    
    <xsl:template match="xml/TaggedPDF-doc/P[matches(upper-case(.),'DISSERATION')]" priority="18">
        <P>
            <xsl:value-of select="normalize-space(replace(upper-case(.),'Disseration','Dissertation'))"/>
        </P>
    </xsl:template>
    
    <xsl:template match="xml/TaggedPDF-doc/P[matches(.,'UniversityRepresentative')]" priority="19">
        <P>
            <xsl:value-of select="normalize-space(replace(upper-case(.),'UniversityRepresentative','University Representative'))"/>
        </P>
    </xsl:template>
    
    <xsl:template match="xml/TaggedPDF-doc/P[matches(.,'College of Arts and Science') and not(matches(.,'College of Arts and Sciences'))]" priority="20">
        <P>
            <xsl:value-of select="normalize-space(replace(upper-case(.),'College of Arts and Science','College of Arts and Sciences'))"/>
        </P>
    </xsl:template>
    
    <xsl:template match="xml/TaggedPDF-doc/P[matches(.,'College of Social Science and Public Policy')]" priority="21">
        <P>
            <xsl:value-of select="normalize-space(replace(upper-case(.),'College of Social Science and Public Policy','College of Social Sciences and Public Policy'))"/>
        </P>
    </xsl:template>
    
    <xsl:template match="xml/TaggedPDF-doc/P[matches(.,'College of Social Sciences') and not(matches(.,'College of Social Sciences and Public Policy'))]" priority="22">
        <P>
            <xsl:value-of select="normalize-space(replace(upper-case(.),'College of Social Sciences','College of Social Sciences and Public Policy'))"/>
        </P>
    </xsl:template>
    
    <xsl:template
        match="xml/TaggedPDF-doc/P[ends-with(.,'. The members of the supervisory committee were:') or ends-with(.,'.The members of the supervisory committee were:')]"
        priority="23">
        <P>
            <xsl:value-of
                select="replace(.,' The members of the supervisory committee were:','')"/>
        </P>  
    </xsl:template>
    
    <xsl:template
        match="xml/TaggedPDF-doc/P[contains(.,'COLLEGE OFMUSIC')]"
        priority="23">
        <P>
            <xsl:value-of
                select="replace(.,'COLLEGE OFMUSIC','COLLEGE OF MUSIC')"/>
        </P>  
    </xsl:template>
    
    
    
</xsl:stylesheet>
