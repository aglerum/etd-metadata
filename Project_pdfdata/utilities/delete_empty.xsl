<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
    exclude-result-prefixes="xs xd"
    version="2.0">
    
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>April 5, 2019</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Step 4: Delete empty line elements and copyright lines</xd:p>
            <xd:p><xd:b>Version: </xd:b>This version includes elements matching commonly found errors in the pdf2xml files for the 
                Bepress to Islandora migration project and may be unnecessary for ProQuest to MODS.</xd:p>
        </xd:desc>
    </xd:doc>  
    
    <!-- Deletes empty lines -->
    <xsl:template match="node()|@*" priority="1">
        <xsl:if test="normalize-space(string(.)) != ''">
            <xsl:copy>
                <xsl:apply-templates select="node()|@*"/>
            </xsl:copy>
        </xsl:if>
    </xsl:template>
      
</xsl:stylesheet>