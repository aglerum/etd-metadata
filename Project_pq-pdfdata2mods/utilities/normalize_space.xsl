<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.loc.gov/mods/v3"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:mods="http://www.loc.gov/mods/v3" xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/" xmlns:flvc="info:flvc/manifest/v1" xmlns:mads="http://www.loc.gov/mads/v2"
    exclude-result-prefixes="xs xd"
    version="2.0">
    
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    
    <xsl:strip-space elements="*"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>January 27, 2020</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Normalizes whitespace in the select elements.</xd:p>
        </xd:desc>
    </xd:doc>  
    
    <!-- Indentity Template -->
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Normalize space -->
    
    <xsl:template match="/mods:modsCollection/mods:mods/mods:titleInfo/mods:title">
        <mods:title>
            <xsl:copy-of select="normalize-space(.)"/>
        </mods:title>
    </xsl:template>
    
    <xsl:template match="/mods:modsCollection/mods:mods/mods:abstract">
        <mods:abstract>
            <xsl:copy-of select="normalize-space(.)"/>
        </mods:abstract>
    </xsl:template>
    
    <xsl:template match="/mods:modsCollection/mods:mods/mods:note[@displayLabel='Submitted Note']">
        <mods:note displayLabel="Submitted Note">
            <xsl:copy-of select="normalize-space(.)"/>
        </mods:note>
    </xsl:template>
      
</xsl:stylesheet>