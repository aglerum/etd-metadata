<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:fs="http://www.lib.fsu.edu" xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:mods="http://www.loc.gov/mods/v3"
    xmlns:dcterms="http://purl.org/dc/terms/" exclude-result-prefixes="xs xd fs" version="2.0">

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>February 25, 2017</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Template for MODS names, ProQuest version</xd:p>
            <xd:p>This template is called by pq-pdfdata2mods.xsl.</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:preserve-space elements="text"/>

    <!-- *Author name* -->
    <xsl:template name="author_name">
        <xsl:param name="binary"/>
        <xsl:param name="pdfdata"/>
        <xsl:for-each select="$binary">
            <xsl:for-each select="$pdfdata[file = current()]/*[(self::author)]">
                <xsl:variable name="nameSuffix">
                    <xsl:value-of
                        select="
                            if (contains(., ', ')) then
                                substring-after(., ', ')
                            else
                                ()"
                    />
                </xsl:variable>
                <xsl:variable name="nameBase">
                    <xsl:value-of
                        select="
                            if (contains(., ', ')) then
                                substring-before(., ', ')
                            else
                                ."
                    />
                </xsl:variable>
                <xsl:variable name="nameFamily"
                    select="
                        if (contains($nameBase, ' Van ') or contains($nameBase, ' van ')) then
                            concat('Van ', tokenize($nameBase, ' ')[last()])
                        else
                            if (contains($nameBase, ' Von ') or contains($nameBase, ' von ')) then
                                concat('Van ', tokenize($nameBase, ' ')[last()])
                            else
                                if (contains($nameBase, ' De ') or contains($nameBase, ' de ')) then
                                    concat('De ', tokenize($nameBase, ' ')[last()])
                                else
                                    tokenize($nameBase, ' ')[last()]"/>

                <xsl:variable name="nameGiven"
                    select="
                        if (contains($nameBase, ' Van ')) then
                            substring-before($nameBase, ' Van')
                        else
                            if (contains($nameBase, ' van ')) then
                                substring-before($nameBase, ' van')
                            else
                                if (contains($nameBase, ' Von ')) then
                                    substring-before($nameBase, ' Von')
                                else
                                    if (contains($nameBase, ' von ')) then
                                        substring-before($nameBase, ' von')
                                    else
                                        if (contains($nameBase, ' De ')) then
                                            substring-before($nameBase, ' De')
                                        else
                                            if (contains($nameBase, ' de ')) then
                                                substring-before($nameBase, ' de')
                                            else
                                                substring-before($nameBase, concat(' ', $nameFamily))"/>
                
                <mods:name type="personal">
                    <mods:namePart type="family">
                        <xsl:value-of select="normalize-space($nameFamily)"/>
                    </mods:namePart>
                    <mods:namePart type="given">
                        <xsl:value-of select="normalize-space($nameGiven)"/>
                    </mods:namePart>
                    <xsl:if test="$nameSuffix ne ''">
                        <mods:namePart type="termsOfAddress">
                            <xsl:value-of select="normalize-space($nameSuffix)"/>
                        </mods:namePart>
                    </xsl:if>
                    <mods:role>
                        <mods:roleTerm authority="rda" type="text">author</mods:roleTerm>
                        <mods:roleTerm authority="marcrelator" type="code">aut</mods:roleTerm>
                    </mods:role>
                </mods:name>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    <!-- Committee members -->
    <xsl:template name="committee_names">
        <xsl:param name="binary"/>
        <xsl:param name="pdfdata"/>
        <xsl:for-each select="$binary">
            <xsl:for-each select="$pdfdata[file = current()]/*[(self::committee)]">
                <xsl:for-each select="member">
                    <xsl:variable name="nameSuffix">
                        <xsl:value-of
                            select="
                                if (contains(name, ', ')) then
                                    substring-after(name, ', ')
                                else
                                    ()"
                        />
                    </xsl:variable>
                    <xsl:variable name="nameBase">
                        <xsl:value-of
                            select="
                                if (contains(name, ', ')) then
                                    substring-before(name, ', ')
                                else
                                    name"
                        />
                    </xsl:variable>
                    <xsl:variable name="nameFamily"
                        select="
                            if (contains($nameBase, ' Van ') or contains($nameBase, ' van ')) then
                                concat('Van ', tokenize($nameBase, ' ')[last()])
                            else
                                if (contains($nameBase, ' Von ') or contains($nameBase, ' von ')) then
                                    concat('Van ', tokenize($nameBase, ' ')[last()])
                                else
                                    if (contains($nameBase, ' De ') or contains($nameBase, ' de ')) then
                                        concat('De ', tokenize($nameBase, ' ')[last()])
                                    else
                                        tokenize($nameBase, ' ')[last()]"/>

                    <xsl:variable name="nameGiven"
                        select="
                            if (contains($nameBase, ' Van ')) then
                                substring-before($nameBase, ' Van')
                            else
                                if (contains($nameBase, ' van ')) then
                                    substring-before($nameBase, ' van')
                                else
                                    if (contains($nameBase, ' Von ')) then
                                        substring-before($nameBase, ' Von')
                                    else
                                        if (contains($nameBase, ' von ')) then
                                            substring-before($nameBase, ' von')
                                        else
                                            if (contains($nameBase, ' De ')) then
                                                substring-before($nameBase, ' De')
                                            else
                                                if (contains($nameBase, ' de ')) then
                                                    substring-before($nameBase, ' de')
                                                else
                                                    substring-before($nameBase, concat(' ', $nameFamily))"/>

                    <mods:name type="personal">
                        <mods:namePart type="family">
                            <xsl:value-of select="normalize-space($nameFamily)"/>
                        </mods:namePart>
                        <mods:namePart type="given">
                            <xsl:value-of select="normalize-space($nameGiven)"/>
                        </mods:namePart>
                        <xsl:if test="$nameSuffix ne ''">
                            <mods:namePart type="termsOfAddress">
                                <xsl:value-of select="normalize-space($nameSuffix)"/>
                            </mods:namePart>
                        </xsl:if>
                        <mods:role>
                            <mods:roleTerm authority="local" type="text">
                                <xsl:value-of select="lower-case(role)"/>
                            </mods:roleTerm>
                        </mods:role>
                    </mods:name>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
