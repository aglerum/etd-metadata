<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd"
    version="2.0">   
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated:</xd:b> November 1, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> Annie Glerum</xd:p>
            <xd:p><xd:b>Organization:</xd:b> Florida State University</xd:p>
            <xd:p><xd:b>Title:</xd:b>Check elements</xd:p>
            <xd:p>Use template to check individual fields in source-pdfdata.xml.</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
        <records>
        <xsl:for-each select="records/record">
             <record>
                 <!-- Use this pattern to check elements in source-pdfdata.xml -->
                 <author><xsl:value-of select="author"/></author>
            </record>
        </xsl:for-each>
    </records>
        
    </xsl:template>
</xsl:stylesheet>