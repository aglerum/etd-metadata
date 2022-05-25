<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:fs="http://www.lib.fsu.edu" xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:mods="http://www.loc.gov/mods/v3" xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:marc="http://www.loc.gov/MARC21/slim"
    exclude-result-prefixes="xs xd fs" version="2.0">

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>January 8, 2020</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Template to split other title information from title
                proper</xd:p>
            <xd:p>This template is called by pq-pdfdata2mods.xsl. It splits other title information
                from title at ":" or "?" into subTitle and articles into nonSort. Local practice is
                to Keep opening quotes as part of the title propoer.</xd:p>
            <xd:p>Acknowledgement: Portions of this template was adapted from SplitTitleabc by Shawn
                Averkamp and Joanna Lee.</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:preserve-space elements="text"/>

    <xd:doc scope="template">
        <xd:desc>
            <xd:p><xd:b>Title: </xd:b>MODS Title Elements Template</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:template name="parse-title">
        <xsl:param name="title"/>

        <xsl:variable name="quote">
            <xsl:text>"</xsl:text>
        </xsl:variable>

        <xsl:variable name="indicator2">
            <xsl:choose>
                <xsl:when test="starts-with($title, 'A ')">
                    <xsl:value-of select="2"/>
                </xsl:when>
                <xsl:when test="starts-with($title, 'An ')">
                    <xsl:value-of select="3"/>
                </xsl:when>
                <xsl:when test="starts-with($title, 'The ')">
                    <xsl:value-of select="4"/>
                </xsl:when>
                <xsl:when test="starts-with($title, concat($quote, 'A '))">
                    <xsl:value-of select="3"/>
                </xsl:when>
                <xsl:when test="starts-with($title, concat($quote, 'An '))">
                    <xsl:value-of select="4"/>
                </xsl:when>
                <xsl:when test="starts-with($title, concat($quote, 'The '))">
                    <xsl:value-of select="5"/>
                </xsl:when>
                <!--                <xsl:when test="starts-with($title, $quote) and not(starts-with($title, concat($quote, 'A ')) or starts-with($title, concat($quote, 'An '))or starts-with($title, concat($quote, 'The ')))">
                    <xsl:value-of select="$quote"/>
                </xsl:when>-->
                <xsl:otherwise/>
            </xsl:choose>

        </xsl:variable>
        <xsl:value-of select="$indicator2"/>
        <!--<marc:datafield tag="245" ind1="1" ind2=" ">
            <xsl:choose>
                <xsl:when test="contains($title, ':')">
                    <marc:subfield code="a">
                        <xsl:value-of select="substring-before($title, ':')"/> : </marc:subfield>
                    <marc:subfield code="b">
                        <xsl:value-of select="substring-after($title, ':')"/>
                    </marc:subfield>
                </xsl:when>
                <xsl:when test="not(contains($title, ':'))">
                    <marc:subfield code="a">
                        <xsl:value-of select="$title"/>
                    </marc:subfield>
                </xsl:when>
            </xsl:choose>
            <marc:subfield code="c">
                <xsl:value-of select="$responsibility"/>
            </marc:subfield>
        </marc:datafield>-->
    </xsl:template>

</xsl:stylesheet>
