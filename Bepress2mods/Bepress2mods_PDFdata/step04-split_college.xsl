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
            <xd:p><xd:b>Last updated: </xd:b>June 4, 2016</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Split University Line</xd:p>
            <xd:p>This transformation deletes empty elements</xd:p>
        </xd:desc>
    </xd:doc>
    
    <!-- Generic identity template -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Split into two elements -->
    <xsl:template match="xml/lines/line[starts-with(upper-case(.), 'FLORIDA STATE UNIVERSITY ') and contains(upper-case(.), ' COLLEGE')]" priority="1">
        <line>
            <xsl:copy-of select="substring-before(upper-case(.), ' COLLEGE')"/>
        </line>
        <line>
            <xsl:copy-of select="substring-after(upper-case(.), 'FLORIDA STATE UNIVERSITY ')"/>
        </line>
    </xsl:template>
    
    <xsl:template match="xml/lines/line[starts-with(upper-case(.), 'FLORIDA STATE UNIVERSITY ') and contains(upper-case(.), ' SCHOOL')]" priority="2">
        <line>
            <xsl:copy-of select="substring-before(upper-case(.), ' SCHOOL')"/>
        </line>
        <line>
            <xsl:copy-of select="substring-after(upper-case(.), 'FLORIDA STATE UNIVERSITY ')"/>
        </line>
    </xsl:template>
    
    <xsl:template match="xml/lines/line[starts-with(upper-case(.), 'FLORIDA STATE UNIVERSITY ') and contains(upper-case(.), ' DEPARTMENT')]" priority="3">
        <line>
            <xsl:copy-of select="substring-before(upper-case(.), ' DEPARTMENT')"/>
        </line>
        <line>
            <xsl:copy-of select="substring-after(upper-case(.), 'FLORIDA STATE UNIVERSITY ')"/>
        </line>
    </xsl:template>
    
</xsl:stylesheet>