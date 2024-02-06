<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mads="http://www.loc.gov/mads/v2"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="xs" version="2.0">
    <!-- Written by Alex Chisum on 11/20/2023 from XSLT originally written by Annie Glerum.
    
    INSTRUCTIONS 
    Update the source document location in the xsl:variable. This should be an XML file
    converted from a spreadsheet that has the URIs and ORCIDs you want to add.
    
    Run this transformation on your most recent ETD-NAF mads file. The result should 
    include output to the "Enhancement" folder and include the full file 
    plus any ORCIDs for faculty who didn't have them before.
    -->
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:variable name="orcid" select="document('../Enhancement/ETD-NAF_mads_20231117_enhancement.xml')/collection/mads"/>

    <xsl:template match="mads:madsCollection/mads:mads/mads:identifier[@type = 'etd-naf']">
        <xsl:variable name="Value_URI" select="preceding-sibling::mads:authority/mads:name/@valueURI"/>
        <xsl:copy-of select="."/>
        <xsl:for-each select="$Value_URI">
            <xsl:choose>
                <xsl:when test="not(../../../mads:identifier[@type = 'orcid'])">
                    <mads:identifier type="orcid"><xsl:value-of select="$orcid[URI = current()]/*[(self::Identifier_ORCID)]"/></mads:identifier>
                </xsl:when>
            </xsl:choose> 
        </xsl:for-each>                         
    </xsl:template>
</xsl:stylesheet>
