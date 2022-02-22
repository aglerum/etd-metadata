<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mads="http://www.loc.gov/mads/v2"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:variable name="orcid" select="document('../Enhancement/ETD-NAF_mads_20211116_enhancement_20220222.xml')/collection/mads"/>
    
   <!-- <mads:identifier type="etd-naf">qwu3</mads:identifier>-->
    <!--<mads:identifier type="orcid">0000-0002-4812-1181</mads:identifier>-->
    
    <!--URI
    Identifier_ORCID-->
<!--    
    <xsl:for-each select="$binary">
        <xsl:variable name="defended" select="$pdfdata[filename = current()]/*[(self::defense)]"/>
        <xsl:variable name="date">
            <xsl:value-of select="replace($defended, ',', '')"/>
        </xsl:variable>
        <xsl:value-of select="fsul:dateName-to-yyyy-mm-dd($date)"/>
    </xsl:for-each>
-->
    <xsl:template match="mads:madsCollection/mads:mads/mads:identifier[@type = 'etd-naf']">
        <xsl:variable name="Value_URI" select="preceding-sibling::mads:authority/mads:name/@valueURI"/>
            <xsl:copy-of select="."/>
            <xsl:for-each select="$Value_URI">
                <mads:identifier type="orcid"><xsl:value-of select="$orcid[URI = current()]/*[(self::Identifier_ORCID)]"/></mads:identifier>
            </xsl:for-each>                         
    </xsl:template>
</xsl:stylesheet>
