<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:mods="http://www.loc.gov/mods/v3" exclude-result-prefixes="xs xsi" version="2.0">

    <!-- Last updated: November 6, 2019 -->
    <!-- 
        Run this transformation on valid MODS with namspaces to split modsCollection files into separate mods:mods files for creating PDF coverpages with mods2etd_coverpage.xsl.
        Change the path in each xsl:result-document
    -->

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*" xml:space="preserve"/>

    <xsl:template match="/">
        <!-- Use this template when files does not need to be split file into Embargoed and not embargoed -->
        <!--<xsl:for-each select="mods:modsCollection/mods:mods">
            <xsl:variable name="filename" select="concat(mods:note[@displayLabel = 'filename'], '.xml')"/>
                <xsl:result-document href="../split_mods_namespaces/2019Sp/{$filename}">
                    <mods:mods xmlns="http://www.loc.gov/mods/v3" 
                        xmlns:flvc="info:flvc/manifest/v1"
                        xmlns:dcterms="http://purl.org/dc/terms/"
                        xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/"
                        xmlns:mods="http://www.loc.gov/mods/v3"
                        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                        xmlns:xlink="http://www.w3.org/1999/xlink"
                        xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-6.xsd"
                        version="3.6">
                        <xsl:copy-of select="./*[position() gt 2]" copy-namespaces="no"/>
                    </mods:mods>
                </xsl:result-document>
            </xsl:for-each>-->

        <!-- Use these templates for spliting the modsCollection file into Embargoed and not embargoed -->
        <xsl:for-each select="mods:modsCollection/mods:mods">
            <xsl:variable name="filename" select="concat(substring-before(mods:note[@displayLabel = 'filename'], '.pdf'), '.xml')"/>
            <xsl:for-each select=".[mods:note[@displayLabel = 'embargo'] = 0]">
                <xsl:result-document href="file:/C:/Users/achisum.FSU/OneDrive%20-%20Florida%20State%20University/Documents/GitHub/etd-metadata/Project_pq-pdfdata2mods/MODS/split_mods_namespaces/2021Su/mods_not_embargoed/{$filename}">
                    <mods:mods xmlns="http://www.loc.gov/mods/v3" xmlns:flvc="info:flvc/manifest/v1" xmlns:dcterms="http://purl.org/dc/terms/"
                        xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/" xmlns:mods="http://www.loc.gov/mods/v3"
                        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xlink="http://www.w3.org/1999/xlink"
                        xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-6.xsd" version="3.6">
                        <xsl:copy-of select="./*[position() gt 2]" copy-namespaces="no"/>
                    </mods:mods>
                </xsl:result-document>
            </xsl:for-each>
            <xsl:for-each select=".[mods:note[@displayLabel = 'embargo'] != 0]">
                <xsl:result-document href="file:/C:/Users/achisum.FSU/OneDrive%20-%20Florida%20State%20University/Documents/GitHub/etd-metadata/Project_pq-pdfdata2mods/MODS/split_mods_namespaces/2021Su/mods_embargoed/{$filename}">
                    <mods:mods xmlns="http://www.loc.gov/mods/v3" xmlns:flvc="info:flvc/manifest/v1" xmlns:dcterms="http://purl.org/dc/terms/"
                        xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/" xmlns:mods="http://www.loc.gov/mods/v3"
                        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xlink="http://www.w3.org/1999/xlink"
                        xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-6.xsd" version="3.6">
                        <xsl:copy-of select="./*[position() gt 2]" copy-namespaces="no"/>
                    </mods:mods>
                </xsl:result-document>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
