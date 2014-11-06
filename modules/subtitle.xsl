<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.w3.org/2005/xpath-functions" 
    xmlns:marc="http://www.loc.gov/MARC21/slim"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd">
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated:</xd:b> November 1, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> Annie Glerum</xd:p>
            <xd:p><xd:b>Organization:</xd:b> Florida State University</xd:p>
            <xd:p><xd:b>Title:</xd:b>Template to split other title information from title proper</xd:p>
            <xd:p>This template is called by trans2marc.xml. It splits other title information from title at ":", "?", or"?:" into 245  subfield b.</xd:p>
            <xd:p>Acknowledgement: This template was adapted from SplitTitleabc by Shawn Averkamp and Joanna Lee.</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:preserve-space elements="text"/>

    <xsl:template name="SplitTitle">
        <xsl:param name="Title"/>
        <xsl:param name="Responsibility"/>
        
        <xsl:choose>
            <xsl:when test="contains($Title,':')">
                <marc:subfield code="a">
                    <xsl:value-of select="substring-before($Title, ':')"/>
                    <xsl:text> :</xsl:text>
                </marc:subfield>
                <marc:subfield code="b">
                    <xsl:variable name="subtitle"
                        select="normalize-space(substring-after($Title, ':'))"/>
                    <xsl:value-of select="concat($subtitle, ' /')"/>
                </marc:subfield>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="contains($Title, '?')">
                        <marc:subfield code="a">
                            <xsl:value-of select="(substring-before($Title, '?'))"/>
                            <xsl:text>? :</xsl:text>
                        </marc:subfield>
                        <marc:subfield code="b">
                            <xsl:variable name="subtitle" select="(substring-after($Title, '?'))"/>
                            <xsl:value-of select="concat($subtitle, ' /')"/>
                        </marc:subfield>
                    </xsl:when>
                    <xsl:otherwise>
                        <marc:subfield code="a">
                            <xsl:value-of select="concat($Title, ' /')"/>
                        </marc:subfield>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
        <marc:subfield code="c">
            <xsl:value-of select="$Responsibility"/>
        </marc:subfield>
    </xsl:template>   
    
</xsl:stylesheet>