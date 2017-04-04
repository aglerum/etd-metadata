<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/xml">
        <embargoes>
            <xsl:for-each select="DISS_submission">
                <xsl:if test="@embargo_code gt '0'">
                <filename>
                    <xsl:value-of select="DISS_content/DISS_binary"/>
                </filename>
                </xsl:if>
        </xsl:for-each>
        </embargoes>    
    </xsl:template>
    
</xsl:stylesheet>