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
    
    <xsl:template match="/mads:madsCollection/mads:mads/mads:variant/mads:name/mads:namePart[not(@type = 'family')][not(@type = 'given')][not(@type = 'date')][not(@type = 'termsOfAddress')][not(@type = 'fullerForm')]">
        
        <xsl:variable name="surname" select="substring-before(., ',')"/>
        <xsl:variable name="given_string" select="normalize-space(substring-after(., concat($surname, ', ')))"/>
        <xsl:variable name="given"
            select="
            if (contains($given_string, ' (')) then
            substring-before($given_string, ' (')
            else
            $given_string"/>
       
        <mads:namePart type="family">
            <xsl:value-of select="$surname"/>
        </mads:namePart>
        <mads:namePart type="given">
            <xsl:value-of select="$given"/>
        </mads:namePart>

    </xsl:template>

</xsl:stylesheet>
