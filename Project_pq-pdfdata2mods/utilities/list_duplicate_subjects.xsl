<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:mods="http://www.loc.gov/mods/v3"
    xmlns:dcterms="http://purl.org/dc/terms/" xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/" xmlns:flvc="info:flvc/manifest/v1"
    xmlns:mads="http://www.loc.gov/mads/v2" exclude-result-prefixes="xs" version="2.0">

    <xsl:output encoding="UTF-8" indent="yes" method="text"/>

    <xsl:template match="/mods:modsCollection">
        <xsl:text>File#Subjects&#13;</xsl:text>
        <xsl:variable name="delimiter" select="'#'"/>
        <xsl:for-each select="mods:mods[mods:subject[. = following-sibling::mods:subject]]">

            <xsl:variable name="file" select="mods:note[@displayLabel = 'filename']"/>
            <xsl:variable name="subject">
                <xsl:for-each select="mods:subject">
                    <xsl:value-of select="*" separator="^"/> 
                </xsl:for-each>
            </xsl:variable>
            
            <xsl:value-of select="concat('File: ', $file, $delimiter, 'Dup Subjects: ', $subject, '&#13;')"/>

        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
