<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="2.0">
    
    <xsl:output method="xml" indent="yes" encoding="utf-8" />

    <xsl:strip-space elements="*"/>  
    
<xsl:template match="/">
        <root>
            <xsl:for-each select="doc/text">
                <rows>
                    <xsl:for-each select="line">
                        <column>
                            <xsl:value-of select="normalize-space(.)"/>
                        </column>
                    </xsl:for-each>
                </rows>
            </xsl:for-each>
        </root>
</xsl:template>
        
</xsl:stylesheet>