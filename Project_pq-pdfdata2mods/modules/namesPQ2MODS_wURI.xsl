<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:fs="http://www.lib.fsu.edu" xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:mods="http://www.loc.gov/mods/v3"
    xmlns:mads="http://www.loc.gov/mads/v2" xmlns:dcterms="http://purl.org/dc/terms/" exclude-result-prefixes="xs xd fs" version="2.0">

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>July 10, 2021</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Template for MODS names, ProQuest version</xd:p>
            <xd:p>This template is called by pq-pdfdata2mods.xsl and pulls data for author names from a semester-specific table and committee names from the local MADS file. These files are included as variables in pq-pdfdata2mods.xsl.</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:preserve-space elements="text"/>
    
    <xd:doc scope="template">
        <xd:desc>
            <xd:p><xd:b>Title: </xd:b>Author Names Template</xd:p>
        </xd:desc>
    </xd:doc>

    <!-- *Author name* -->
    <xsl:template name="author_name">
        <xsl:param name="binary"/>
        <xsl:param name="authors"/>
        <xsl:for-each select="$binary">
            <mods:name type="personal" authority="local">
                <mods:namePart type="family">
                    <xsl:value-of select="$authors[filename = current()]/*[(self::family)]"/>
                </mods:namePart>
                <mods:namePart type="given">
                    <xsl:value-of select="$authors[filename = current()]/*[(self::given)]"/>
                </mods:namePart>
                <!-- Note that in some semesters the author names may not have any suffixes -->
                <xsl:if test="$authors[filename = current()]/*[(self::suffix)] ne 'null'">
                    <mods:namePart type="termsOfAddress">
                        <xsl:value-of select="$authors[filename = current()]/*[(self::suffix)]"/>
                    </mods:namePart>
                </xsl:if>
                <mods:affiliation>Theses and Dissertations</mods:affiliation>
                <mods:role>
                    <mods:roleTerm authority="local" type="text">
                        <xsl:value-of select="'author'"/>
                    </mods:roleTerm>
                </mods:role>
            </mods:name>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc scope="template">
        <xd:desc>
            <xd:p><xd:b>Title: </xd:b>Committee Names Template</xd:p>
        </xd:desc>
    </xd:doc>

    <!-- *Committee members names* -->
    <xsl:template name="committee_names">
        <xsl:param name="binary"/>
        <xsl:param name="pdfdata"/>
        <xsl:param name="madsAuthority"/>
        <xsl:for-each select="$binary">
            <xsl:for-each select="$pdfdata[filename = current()]/*[(self::committee)]">
                <xsl:for-each select="member/uri">
                    <xsl:variable name="role" select="preceding-sibling::role"/>
                    <xsl:for-each select="$madsAuthority[mads:name/@valueURI = current()]/*[(self::mads:name)]">
                        <xsl:variable name="authority" select="@authority"/>
                        <xsl:variable name="authorityURI" select="@authorityURI"/>
                        <xsl:variable name="valueURI" select="@valueURI"/>
                        <xsl:variable name="fullerForm" select="if (mads:namePart[@type = 'fullerForm']) then mads:namePart[@type = 'fullerForm'] else ()"/>
                        <mods:name type="personal" authority="{$authority}" authorityURI="{$authorityURI}" valueURI="{$valueURI}">
                            <mods:namePart type="family">
                                <xsl:value-of select="mads:namePart[@type = 'family']"/>
                            </mods:namePart>
                            <mods:namePart type="given">
                                <xsl:value-of select="if ($fullerForm ne '') then concat(mads:namePart[@type = 'given'],' ',$fullerForm) else mads:namePart[@type = 'given']"/>
                            </mods:namePart>
                            <xsl:if test="mads:namePart[@type = 'termsOfAddress']">
                                <mods:namePart type="termsOfAddress">
                                    <xsl:value-of select="mads:namePart[@type = 'termsOfAddress']"/>
                                </mods:namePart>
                            </xsl:if>
                            <xsl:if test="mads:namePart[@type = 'date']">
                                <mods:namePart type="date">
                                    <xsl:value-of select="mads:namePart[@type = 'date']"/>
                                </mods:namePart>
                            </xsl:if>
                            <mods:affiliation>Theses and Dissertations</mods:affiliation>
                            <mods:role>
                                <mods:roleTerm authority="local" type="text">
                                    <xsl:value-of select="lower-case($role)"/>
                                </mods:roleTerm>
                            </mods:role>
                        </mods:name>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
