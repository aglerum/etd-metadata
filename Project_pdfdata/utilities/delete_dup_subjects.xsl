<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:mods="http://www.loc.gov/mods/v3" xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/"
    exclude-result-prefixes="xs xsi xlink mods dcterms etd" version="2.0">
    
    <!-- Last Updated: December 5, 2017 -->

    <xsl:output encoding="UTF-8" indent="yes" method="xml"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template
        match="mods:modsCollection/mods:mods/mods:subject[. = following-sibling::mods:subject]"/>

</xsl:stylesheet>
