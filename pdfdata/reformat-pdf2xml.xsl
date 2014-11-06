<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:x="adobe:ns:meta/" 
    exclude-result-prefixes="xs xd x" 
    version="2.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>November 4, 2014</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Reformat PDF to XML</xd:p>
            <xd:p><xd:b>Title: </xd:b>Template to reformat the result of Acrobat Action Wizard's
                "pdf2xml" for extracted PDF pages 1-2.</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:template name="reformat" match="xml">
        <xml>
            <xsl:for-each select="TaggedPDF-doc">
                <lines>                  
                <position>
                    <xsl:value-of select="position()"/>
                </position> 
                    <xsl:for-each select="./*[position() gt 1]">
                    <xsl:for-each select=".//text()">
                            <line><xsl:value-of select="normalize-space(.)"/></line>
                    </xsl:for-each> </xsl:for-each>                                                                                                        
                 </lines>
            </xsl:for-each>
        </xml>
    </xsl:template>
</xsl:stylesheet>
