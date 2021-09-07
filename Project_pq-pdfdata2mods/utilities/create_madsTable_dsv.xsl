<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mads="http://www.loc.gov/mads/v2"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="mads xlink xs xsi"
    version="2.0">
    
    <!-- Last Updated: July 9, 2021 -->

    <xsl:output method="text" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/mads:madsCollection">
        <xsl:text>source|file|fileFamily|familyFirst|nameString|URI|family|given|fuller|suffix</xsl:text>
        <xsl:text>&#13;</xsl:text>
        <xsl:for-each select="mads:mads/mads:authority/mads:name[@type = 'personal']">
            <xsl:variable name="family" select="mads:namePart[@type = 'family']"/>
            <xsl:variable name="given"
                select="mads:namePart[@type = 'given']"/>
            <xsl:variable name="fuller"
                select="if (mads:namePart[@type = 'fullerForm']) then mads:namePart[@type = 'fullerForm'] else ()"/>
            <xsl:variable name="suffix"
                select="if (mads:namePart[@type = 'termsOfAddress']) then mads:namePart[@type = 'termsOfAddress'] else ()"/>
            <xsl:variable name="date"
                select="if(mads:namePart[@type = 'date']) then mads:namePart[@type = 'date'] else ()"/>
            <xsl:variable name="firstname" select="tokenize($given, ' ')[1]"/>
            <xsl:variable name="delimiter" select="'|'"/>
            <xsl:value-of select="concat('madsData', $delimiter, $delimiter, $delimiter, concat($family, $firstname), $delimiter, normalize-space(concat($given, ' ', $family, ' ', $suffix, ' ', $date)), $delimiter, @valueURI, $delimiter, $family, $delimiter, $given, $delimiter,$fuller,$delimiter,$suffix,'&#13;')"/>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
