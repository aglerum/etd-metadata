<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:mods="http://www.loc.gov/mods/v3"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/"
    exclude-result-prefixes="xs xsi xlink mods dcterms etd" version="2.0">
    
    <xsl:output encoding="UTF-8" indent="yes" method="xml"/>
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
<!--  Use this program with caution: It deletes subdivisions found multiple times in a record such as "Study and teaching."
    -->
    <xsl:template match="mods:modsCollection/mods:mods/mods:subject[. = following-sibling::mods:subject]"/>
    
</xsl:stylesheet>