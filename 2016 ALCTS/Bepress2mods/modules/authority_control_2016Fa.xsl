<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:mods="http://www.loc.gov/mods/v3"
    exclude-result-prefixes="xs xsi xd" version="2.0">

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>February 24, 2017</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Authority control transformation for FSU ETD metadata</xd:p>
            <xd:p>Run this on the result of pq-pdfdata2mods.xsl after ETD-NAF-[DATE_STATUS].xml has been updated with new name.s</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:preserve-space elements="text"/>

    <xsl:variable name="etd-naf" select="document('tables/ETD-NAF_2016Fa.xml')/names/name"/>

    <!-- Generic identify template -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>


    <xsl:template match="mods:modsCollection/mods:mods/mods:name[@type = 'personal']">

        <xsl:variable name="mods_filename" select="preceding-sibling::mods:note[@displayLabel = 'filename']" as="node()"/>
        <xsl:variable name="mods_family" select="mods:namePart[@type = 'family']" as="node()"/>
        <xsl:variable name="mods_given" select="mods:namePart[@type = 'given']" as="node()"/>
        <xsl:variable name="mods_role" select="mods:role" as="node()"/>

        <xsl:variable name="etd-naf_filename">
            <xsl:for-each select="$mods_filename">
                <xsl:value-of select="distinct-values($etd-naf[filename = current()]/*[(self::filename)])"/>
            </xsl:for-each>
        </xsl:variable>

        <xsl:variable name="etd-naf_family">
            <xsl:for-each select="$mods_family">
                <xsl:value-of
                    select="
                        if ($etd-naf[family = current()] and $etd-naf[filename = $mods_filename]) then
                            distinct-values($etd-naf[family = current()]/*[(self::family[following-sibling::filename = $mods_filename])])
                        else
                            'ERROR'"
                />
            </xsl:for-each>
        </xsl:variable>

        <xsl:variable name="etd-naf_given">
            <xsl:for-each select="$mods_family">
                <xsl:value-of
                    select="
                        if ($etd-naf[family = current()] and $etd-naf[filename = $mods_filename]) then
                            $etd-naf[family = current()]/*[(self::given[following-sibling::filename = $mods_filename])]
                        else
                            'ERROR'"
                />
            </xsl:for-each>
        </xsl:variable>

        <xsl:variable name="etd-naf_suffix">
            <xsl:for-each select="$mods_family">
                <xsl:value-of
                    select="
                        if ($etd-naf[family = current()] and $etd-naf[filename = $mods_filename]) then
                            $etd-naf[family = current()]/*[(self::termOfAddress[following-sibling::filename = $mods_filename])]
                        else
                            'ERROR'"
                />
            </xsl:for-each>
        </xsl:variable>

        <xsl:variable name="etd-naf_date">
            <xsl:for-each select="$mods_family">
                <xsl:value-of
                    select="
                        if ($etd-naf[family = current()] and $etd-naf[filename = $mods_filename]) then
                            $etd-naf[family = current()]/*[(self::date[following-sibling::filename = $mods_filename])]
                        else
                            'ERROR'"
                />
            </xsl:for-each>
        </xsl:variable>

        <xsl:variable name="etd-naf_authority">
            <xsl:for-each select="$mods_family">
                <xsl:value-of
                    select="
                        if ($etd-naf[family = current()] and $etd-naf[filename = $mods_filename]) then
                            $etd-naf[family = current()]/*[(self::authority[following-sibling::filename = $mods_filename])]
                        else
                            'ERROR'"
                />
            </xsl:for-each>
        </xsl:variable>

        <xsl:variable name="etd-naf_authorityURI">
            <xsl:for-each select="$mods_family">
                <xsl:value-of
                    select="
                        if ($etd-naf[family = current()] and $etd-naf[filename = $mods_filename]) then
                            $etd-naf[family = current()]/*[(self::authorityURI[following-sibling::filename = $mods_filename])]
                        else
                            'ERROR'"
                />
            </xsl:for-each>
        </xsl:variable>

        <xsl:variable name="etd-naf_valueURI">
            <xsl:for-each select="$mods_family">
                <xsl:value-of
                    select="
                        if ($etd-naf[family = current()] and $etd-naf[filename = $mods_filename]) then
                            $etd-naf[family = current()]/*[(self::valueURI[following-sibling::filename = $mods_filename])]
                        else
                            'ERROR'"
                />
            </xsl:for-each>
        </xsl:variable>

        <xsl:variable name="etd-naf_name-parts">
            <mods:namePart type="family">
                <xsl:value-of select="$etd-naf_family"/>
            </mods:namePart>
            <mods:namePart type="given">
                <xsl:value-of select="$etd-naf_given"/>
            </mods:namePart>
            <xsl:if test="$etd-naf_suffix ne ''">
                <mods:namePart type="termsOfAddress">
                    <xsl:value-of select="$etd-naf_suffix"/>
                </mods:namePart>
            </xsl:if>
            <xsl:if test="$etd-naf_date ne ''">
                <mods:namePart type="date">
                    <xsl:value-of select="concat($etd-naf_date, '-')"/>
                </mods:namePart>
            </xsl:if>
            <xsl:copy-of select="$mods_role"/>
        </xsl:variable>

        <!-- ## Variable check ## -->
        <!--<record>
            <xsl:for-each select=".">

                <mods_filename>
                    <xsl:value-of select="$mods_filename"/>
                </mods_filename>
                <mods_family>
                    <xsl:value-of select="$mods_family"/>
                </mods_family>
                <mods_given>
                    <xsl:value-of select="$mods_given"/>
                </mods_given>

                <etd-naf_filename>
                    <xsl:value-of select="$etd-naf_filename"/>
                </etd-naf_filename>
                <etd-naf_family>
                    <xsl:value-of select="$etd-naf_family"/>
                </etd-naf_family>
                <etd-naf_given>
                    <xsl:value-of select="$etd-naf_given"/>
                </etd-naf_given>
                <etd-naf_suffix>
                    <xsl:value-of select="$etd-naf_suffix"/>
                </etd-naf_suffix>
                <etd-naf_date>
                    <xsl:value-of select="$etd-naf_date"/>
                </etd-naf_date>
                <etd-naf_authority>
                    <xsl:value-of select="$etd-naf_authority"/>
                </etd-naf_authority>
                <etd-naf_authorityURI>
                    <xsl:value-of select="$etd-naf_authorityURI"/>
                </etd-naf_authorityURI>
                <etd-naf_valueURI>
                    <xsl:value-of select="$etd-naf_valueURI"/>
                </etd-naf_valueURI>

                <etd-naf_name-parts>
                    <xsl:copy-of select="$etd-naf_name-parts"/>
                </etd-naf_name-parts>
            </xsl:for-each>
        </record>-->

        <!-- ## End variable check ## -->

        <xsl:for-each select="mods:namePart[@type = 'family']">
            <xsl:for-each select="$etd-naf[family = current()]/*[(self::filename = current()/$mods_filename)]">
                <!-- NODE CHECK -->
                <!--<current_node><xsl:value-of select="."/></current_node>
                <family-unique-title><xsl:value-of select="preceding-sibling::family-unique-title"/></family-unique-title>-->
                <xsl:choose>
                    <!-- Family name is unique in title-->
                    <xsl:when test="preceding-sibling::family-unique-title = 'yes'">
                        <mods:name type="personal" authority="{$etd-naf_authority}" authorityURI="{$etd-naf_authorityURI}"
                            valueURI="{$etd-naf_valueURI}">
                            <xsl:copy-of select="$etd-naf_name-parts"/>
                        </mods:name>
                    </xsl:when>
                    <!-- Family name is NOT unique in title-->
                    <xsl:when test="preceding-sibling::family-unique-title = 'no'">
                        <mods:name type="personal" authority="{$etd-naf_authority}" authorityURI="{$etd-naf_authorityURI}"
                            valueURI="{$etd-naf_valueURI}">
                            <mods:description>Family is NOT unique in title</mods:description>
                            <mods:namePart type="family">
                                <xsl:value-of select="$etd-naf_family"/>
                            </mods:namePart>
                            <mods:namePart type="given">
                                <xsl:value-of select="$etd-naf_given"/>
                            </mods:namePart>
                            <xsl:if test="$etd-naf_suffix">
                                <mods:namePart type="termsOfAddress">
                                    <xsl:value-of select="$etd-naf_suffix"/>
                                </mods:namePart>
                            </xsl:if>
                            <xsl:if test="$etd-naf_date">
                                <mods:namePart type="date">
                                    <xsl:value-of select="$etd-naf_date"/>
                                </mods:namePart>
                            </xsl:if>
                            <xsl:copy-of select="$mods_role"/>
                        </mods:name>
                    </xsl:when>
                    <!-- No Match -->
                     <xsl:otherwise>
                        <mods:name type="personal">
                            <mods:description>NO MATCH</mods:description>
                            <xsl:copy-of select="$etd-naf_name-parts"/>
                        </mods:name>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
