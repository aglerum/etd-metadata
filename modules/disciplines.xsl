<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:mods="http://www.loc.gov/mods/v3" xmlns="http://www.loc.gov/mods/v3" exclude-result-prefixes="xs xd mods" version="2.0">

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>June 6, 2016</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: Bepress Disciplines to LCSH</xd:b></xd:p>
            <xd:p>This template is called by bepress2mods.xsl.</xd:p>
            <xd:p>Note: This module works, but organizing the disciplines.xml table by department did not scale well.</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:preserve-space elements="text"/>

    <xsl:variable name="subject" select="document('tables/disciplines.xml')/subjects/department"/>

    <!-- **Matches on Bepress Discipline** -->
    <xsl:template name="discipline-subject">        
        <xsl:for-each select="disciplines/discipline">
            <xsl:for-each select="$subject[bepress_discipline = current()]/*[(self::lcsh[@discipline1='yes'])]">
                <xsl:choose>
                    <xsl:when test="contains(.,'--')">
                        <xsl:choose>
                            <xsl:when test=".[@type='complex_subject']">
                                <mods:subject authority="lcsh" authorityURI="{@id}">
                                    <mods:topic>
                                        <xsl:value-of select="substring-before(.,'--')"/>
                                    </mods:topic>
                                    <mods:topic>
                                        <xsl:value-of select="substring-after(.,'--')"/>
                                    </mods:topic>
                                </mods:subject>
                            </xsl:when>
                            <xsl:when test=".[@type='geographic_complex_subject']">
                                <mods:subject authority="lcsh" authorityURI="{@id}">
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
                                <mods:subject authority="lcsh" authorityURI="{@id}">
                                    <mods:topic>
                                        <xsl:value-of select="."/>
                                    </mods:topic>
                                </mods:subject>
                            </xsl:when>
                            <xsl:when test=".[@type='general_subdivision']">
                                <mods:topic>
                                    <xsl:value-of select="."/>
                                </mods:topic>
                            </xsl:when>
                            <xsl:when test=".[@type='geographic']">
                                <mods:subject authority="lcsh" authorityURI="{@id}">
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

    <!-- **Matches on Department** -->
    <xsl:template name="department-subject">
        <xsl:for-each select="fields/field[@name='department']/value">
            <xsl:for-each select="$subject[bepress_dept = current()]/*[(self::lcsh[@dept='yes'])]">
                <xsl:choose>
                    <xsl:when test="contains(.,'--')">
                        <xsl:choose>
                            <xsl:when test=".[@type='complex_subject']">
                                <mods:subject authority="lcsh" authorityURI="{@id}">
                                    <mods:topic>
                                        <xsl:value-of select="substring-before(.,'--')"/>
                                    </mods:topic>
                                    <mods:topic>
                                        <xsl:value-of select="substring-after(.,'--')"/>
                                    </mods:topic>
                                </mods:subject>
                            </xsl:when>
                            <xsl:when test=".[@type='geographic_complex_subject']">
                                <mods:subject authority="lcsh" authorityURI="{@id}">
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
                                <mods:subject authority="lcsh" authorityURI="{@id}">
                                    <mods:topic>
                                        <xsl:value-of select="."/>
                                    </mods:topic>
                                </mods:subject>
                            </xsl:when>
                            <xsl:when test=".[@type='general_subdivision']">
                                <mods:topic>
                                    <xsl:value-of select="."/>
                                </mods:topic>
                            </xsl:when>
                            <xsl:when test=".[@type='geographic']">
                                <mods:subject authority="lcsh" authorityURI="{@id}">
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
