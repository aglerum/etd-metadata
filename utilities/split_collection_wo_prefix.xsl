<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
    xmlns:fs="http://www.lib.fsu.edu" 
    xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    xmlns:xlink="http://www.w3.org/1999/xlink" 
    xmlns:mods="http://www.loc.gov/mods/v3"
    xmlns:dcterms="http://purl.org/dc/terms/" 
    xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-4.xsd"
    exclude-result-prefixes="fs xs xd" version="2.0">

    <!-- Last updated: March 29, 2017 -->
    <!-- 
        1. Delete all namespaces in the modsCollection element except for xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/" and xmlns:flvc="info:flvc/manifest/v1". 
        2. Delete all instances of mods: in element tags.
        3. Run this xslt to transform that MODS collection to conform to Islandora namespace requirements.
    -->

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*" xml:space="preserve"/>
    
    <xsl:template match="/">
        <xsl:for-each select="modsCollection/mods">
            <xsl:variable name="filenumber" select="substring-before(note[@displayLabel = 'filename'], '.pdf')"/>
            <xsl:variable name="filename" select="concat($filenumber, '.xml')"/>
            <xsl:for-each select=".[note[@displayLabel = 'embargo'] = 0]">
                <xsl:result-document href="2016Fa_MODS/mods_not-embargoed_test_namespaces/{$filename}">
                    <mods:mods xmlns:flvc="info:flvc/manifest/v1" xmlns:dcterms="http://purl.org/dc/terms/"
                        xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/" xmlns:mods="http://www.loc.gov/mods/v3"
                        xmlns="http://www.loc.gov/mods/v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                        xmlns:xlink="http://www.w3.org/1999/xlink" version="3.4"
                        xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-4.xsd">
                        <xsl:copy-of select="./*[position() gt 2]" copy-namespaces="no"/>
                    </mods:mods>
                </xsl:result-document>
            </xsl:for-each>
            <xsl:for-each select=".[note[@displayLabel = 'embargo'] != 0]">
                <xsl:result-document href="2016Fa_MODS/mods_embargoed_test_namespaces/{$filename}">
                    <mods:mods xmlns:flvc="info:flvc/manifest/v1" xmlns:dcterms="http://purl.org/dc/terms/"
                        xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/" xmlns:mods="http://www.loc.gov/mods/v3"
                        xmlns="http://www.loc.gov/mods/v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                        xmlns:xlink="http://www.w3.org/1999/xlink" version="3.4"
                        xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-4.xsd">
                        <xsl:copy-of select="./*[position() gt 2]" copy-namespaces="no"/>
                    </mods:mods>
                </xsl:result-document>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
