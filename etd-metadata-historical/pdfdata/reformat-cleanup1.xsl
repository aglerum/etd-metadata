<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:fs="http://www.lib.fsu.edu"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
    exclude-result-prefixes="xs xd fs"
    version="2.0">
    
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>November 4, 2014</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Process 1: Delete and edit</xd:p>
            <xd:p>Templates to cleanup the reformatted PDF-XML. This program does not address the following errors. 
                Delete or correct these manually:
                * Copyright statements without ©
                * Unwanted character entities within the text, such as '&#x2028;'
                * Unintended exclamation points in titles        
                * Elements that contains text lacking spaces such as "INTHEILLUSTRATEDHARLEYAPOCALYPSE..."
                * Some elements have hidden characters. If the result has less than the original number of records, 
                identify the missing record then re-key elements into pdf2xml-result.xml</xd:p>
        </xd:desc>
    </xd:doc>  
    
    <!-- This program does not address the following errors. Delete or correct these manually:
        * Copyright statements without ©
        * Unwanted special character within the text, such as '&#x2028;'
        * Elements that contains text lacking spaces such as "INTHEILLUSTRATEDHARLEYAPOCALYPSE..."
    -->
    
    <!-- Generic identity template -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Elements that are deleted -->
    <xsl:template match="xml/lines/line[text()='By']"/>
    <xsl:template match="xml/lines/line[text()='By ']"/>
    <xsl:template match="xml/lines/line[text()='By!']"/>
    <xsl:template match="xml/lines/line[text()='BY']"/>
    <xsl:template match="xml/lines/line[starts-with(.,'The Graduate School has ')]"/>
    <xsl:template match="xml/lines/line[starts-with(.,'The graduate school has ')]"/>
    <xsl:template match="xml/lines/line[starts-with(.,'certifies that the ')]"/>   
    <xsl:template match="xml/lines/line[text()='ii']"/>
    <xsl:template match="xml/lines/line[text()='c']"/>
    <xsl:template match="xml/lines/line[starts-with(.,'!')]"/>
    <xsl:template match="xml/lines/line[(contains(.,'©') or contains(.,'All Rights Reserved')) and not(contains(.,'Degree'))]"/>
    <xsl:template match="xml/lines/line[text()='&#x2028;']"/>  
    
    <!-- Elements that are edited -->
    
    <xsl:template
        match="xml/lines/line[starts-with(.,'THE FLORIDA STATE UNIVERSITY')]">        
      <line>
          <xsl:copy-of select="replace(.,'THE FLORIDA','FLORIDA')"/> 
      </line>                          
    </xsl:template>

    <xsl:template
        match="xml/lines/line[ends-with(.,'. The members of the supervisory committee were:') or ends-with(.,'.The members of the supervisory committee were:')]">
        <xsl:choose>
            <xsl:when test="not(starts-with(.,'The members of the supervisory committee were:'))">
                <line>
                    <xsl:copy-of
                        select="replace(.,' The members of the supervisory committee were:','')"/>
                </line>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="xml/lines/line[contains(.,'Degree Awarded')]">
        <xsl:choose>
            <xsl:when test="contains(.,'©') and starts-with(.,'Degree Awarded')">
                <line>
                    <xsl:copy-of
                        select="substring-before(.,' ©')"/>
                </line>
            </xsl:when>
            <xsl:when test="contains(.,'©') and not(starts-with(.,'Degree Awarded'))">
                <line>
                    <xsl:copy-of
                        select="substring-after(.,substring-before(.,'Degree Awarded'))"/>
                </line>
            </xsl:when>
            <xsl:when test="not(contains(.,'Degree Awarded:'))">
                <line>
                    <xsl:copy-of
                        select="replace(.,'Awarded','Awarded:')"/>
                </line>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- Elements that need to be split into two elements -->
    <xsl:template
        match="xml/lines/line[starts-with(.,'FLORIDA STATE UNIVERSITY ') and contains(.,' COLLEGE')]">        
        <line>
            <xsl:copy-of select="substring-before(.,' COLLEGE')"/> 
        </line>
        <line>
            <xsl:copy-of select="substring-after(.,'FLORIDA STATE UNIVERSITY ')"/> 
        </line>
    </xsl:template>
    
</xsl:stylesheet>