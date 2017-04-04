<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fs="http://www.lib.fsu.edu"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xs xd fs" version="2.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>June 4, 2016</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Step 6: Merges Split Awarded Statements</xd:p>
            <xd:p>This transformation merges split award statements.</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:template match="/">
        <xml>
            <xsl:for-each select="xml/lines">
                <xsl:variable name="line6" select="line[6]"/>
                <xsl:variable name="line7" select="line[7]"/>
                
                <xsl:choose>               
                    <xsl:when test="line[6][ends-with(.,'Awarded:')]">                        
                        <lines>
                                 <xsl:copy-of select="label"/>
                                 <xsl:copy-of select="number"/>
                                 <xsl:copy-of select="line[position() lt 6]"/>
                                 <line><xsl:value-of select="concat($line6, ' ', $line7)"/></line>
                                 <xsl:copy-of select="line[position() gt 7]"/>  
                                 </lines>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy-of select="."/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xml>
    </xsl:template>

</xsl:stylesheet>
