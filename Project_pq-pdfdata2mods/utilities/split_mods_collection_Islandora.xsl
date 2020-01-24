<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    xmlns:mods="http://www.loc.gov/mods/v3"
    exclude-result-prefixes="xs xsi" version="2.0">

    <!-- Last updated: March 28, 2019 -->
    <!-- 
        1. Delete all namespaces and schema in the modsCollection element except for xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/" and xmlns:flvc="info:flvc/manifest/v1". 
        2. Delete all instances of mods: in element tags.
        3. Edit the directory of the output file to the appropriate semester. e.g "2017Su" in <xsl:result-document href="split_mods/2017Su/mods_not-embargoed/{$filename}">
        4. Run this xslt to transform that MODS collection to conform to Islandora namespace requirements. 
        5. After spliting the files, use Find/Replace in Files on each embargoed and not-embargoed folder to delete all instances of ' xmlns=""'.
    -->

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*" xml:space="preserve"/>
    
    <xsl:template match="/">
        <xsl:for-each select="modsCollection/mods">
            <!--<xsl:variable name="filename" select="concat(substring-before(note[@displayLabel = 'filename'], '.pdf'), '.xml')"/>-->
            <xsl:variable name="filename" select="concat(note[@displayLabel = 'filename'], '.xml')"/>
            <xsl:for-each select=".[note[@displayLabel = 'embargo'] = 0]">
                <xsl:result-document href="split_mods_Islandora/2019Sp/mods_not-embargoed/{$filename}">
                    <mods:mods xmlns="http://www.loc.gov/mods/v3" 
                        xmlns:flvc="info:flvc/manifest/v1"
                        xmlns:dcterms="http://purl.org/dc/terms/"
                        xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/"
                        xmlns:mods="http://www.loc.gov/mods/v3"
                        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                        xmlns:xlink="http://www.w3.org/1999/xlink"
                        xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-4.xsd"
                        version="3.4">
                        <xsl:copy-of select="./*[position() gt 2]" copy-namespaces="no"/>
                    </mods:mods>
                </xsl:result-document>
            </xsl:for-each>
            <xsl:for-each select=".[note[@displayLabel = 'embargo'] != 0]">
                <xsl:result-document href="split_mods_Islandora/2019Sp/mods_embargoed/{$filename}">
                    <mods:mods xmlns="http://www.loc.gov/mods/v3" 
                        xmlns:flvc="info:flvc/manifest/v1"
                        xmlns:dcterms="http://purl.org/dc/terms/"
                        xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/"
                        xmlns:mods="http://www.loc.gov/mods/v3"
                        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                        xmlns:xlink="http://www.w3.org/1999/xlink"
                        xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-4.xsd"
                        version="3.4">
                        <xsl:copy-of select="./*[position() gt 2]" copy-namespaces="no"/>
                    </mods:mods>
                </xsl:result-document>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
