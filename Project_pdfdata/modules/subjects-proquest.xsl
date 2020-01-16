<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:fs="http://www.lib.fsu.edu"
    xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:mods="http://www.loc.gov/mods/v3"
    xmlns:dcterms="http://purl.org/dc/terms/"
    exclude-result-prefixes="xs xd fs" version="2.0">
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>January 15, 2020</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>MODS subjects template: Proquest version</xd:p>
            <xd:p>This template is refers to subjects4proquest.xml, a table of Proquest category codes and their corresponding Library of Congress Shubject Headings, which is called by pq-pdfdta2mods.xsl.</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:preserve-space elements="text"/>

    <xsl:variable name="subject" select="document('../tables/subjects4proquest.xml')/subjects/subject"/>

    <xd:doc scope="template">
        <xd:desc>
            <xd:p><xd:b>Title: </xd:b>ProQuest Categorization Code to Library of Congress Subject Heading</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template name="subjects_proquest">
        <xsl:for-each select="DISS_description/DISS_categorization/DISS_category/DISS_cat_code">
            <xsl:for-each select="$subject[diss_code = current()]/*[(self::lcsh)]">
                <xsl:choose>
                    <xsl:when test="contains(.,'--')">
                        <xsl:choose>
                            <xsl:when test=".[@type='complex_topic-topic']">
                                <mods:subject authority="lcsh" authorityURI="http://id.loc.gov/authorities/subjects/" valueURI="{@id}">
                                    <mods:topic>
                                        <xsl:value-of select="substring-before(.,'--')"/>
                                    </mods:topic>
                                    <mods:topic>
                                        <xsl:value-of select="substring-after(.,'--')"/>
                                    </mods:topic>
                                </mods:subject>
                            </xsl:when>
                            <xsl:when test=".[@type='complex_topic-topic-topic']">
                                <mods:subject authority="lcsh" authorityURI="http://id.loc.gov/authorities/subjects/" valueURI="{@id}">
                                    <mods:topic>
                                        <xsl:value-of select="tokenize(.,'--')[1]"/>
                                    </mods:topic>
                                    <mods:topic>
                                        <xsl:value-of select="tokenize(.,'--')[2]"/>
                                    </mods:topic>
                                    <mods:topic>
                                        <xsl:value-of select="tokenize(.,'--')[3]"/>
                                    </mods:topic>
                                </mods:subject>
                            </xsl:when>
                            <xsl:when test=".[@type='complex_geographic-topic']">
                                <mods:subject authority="lcsh" authorityURI="http://id.loc.gov/authorities/subjects/" valueURI="{@id}">
                                    <mods:geographic>
                                        <xsl:value-of select="substring-before(.,'--')"/>
                                    </mods:geographic>
                                    <mods:topic>
                                        <xsl:value-of select="substring-after(.,'--')"/>
                                    </mods:topic>
                                </mods:subject>
                            </xsl:when>
                            <xsl:otherwise/>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="not(contains(.,'--'))">
                        <xsl:choose>
                            <xsl:when test=".[@type='topic']">
                                <mods:subject authority="lcsh" authorityURI="http://id.loc.gov/authorities/subjects/" valueURI="{@id}">
                                    <mods:topic>
                                        <xsl:value-of select="."/>
                                    </mods:topic>
                                </mods:subject>
                            </xsl:when>
                            <xsl:when test=".[@type='general_subdivision']">
                                <mods:subject authority="lcsh" authorityURI="http://id.loc.gov/authorities/subjects/" valueURI="{@id}">
                                    <mods:topic>
                                        <xsl:value-of select="."/>
                                    </mods:topic>
                                </mods:subject>
                            </xsl:when>
                            <xsl:when test=".[@type='geographic']">
                                <mods:subject authority="lcsh" authorityURI="http://id.loc.gov/authorities/subjects/" valueURI="{@id}">
                                    <mods:geographic>
                                        <xsl:value-of select="."/>
                                    </mods:geographic>
                                </mods:subject>
                            </xsl:when>
                            <xsl:otherwise/>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise/>
                </xsl:choose>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
