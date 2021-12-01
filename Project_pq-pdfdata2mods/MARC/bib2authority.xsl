<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:marc="http://www.loc.gov/MARC21/slim"
    xmlns:mads="http://www.loc.gov/mads/v2" xmlns:fs="http://www.lib.fsu.edu"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xs xd">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>November 19, 2021</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University Libraries</xd:p>
            <xd:p><xd:b>Title:</xd:b> Create preliminary MARC Authority File</xd:p>
        </xd:desc>
    </xd:doc>

    <!-- Configure this transformation on the combined ProQuest metadata. -->
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*" xml:space="preserve"/>

    <!-- **Global variables** -->
    <!-- Batch Variable -->
    <xsl:variable name="batch" select="'2020_Summer_Fall_2021_Spring'"/>

    <xd:doc>
        <xd:desc>
            <xd:p>
                <xd:b>MARC Authority Template</xd:b>
            </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="MARC_Template" match="/marc:collection">
        <!--Container for multiple MARC Authority records-->
        <marc:collection xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd">
            <xsl:for-each select="marc:record/marc:datafield[@tag = '100']">
                <xsl:variable name="title_proper"
                    select="if(ends-with(following-sibling::marc:datafield[@tag = '245']/marc:subfield[@code = 'a'],' /') or ends-with(following-sibling::marc:datafield[@tag = '245']/marc:subfield[@code = 'a'],' :')) then substring(following-sibling::marc:datafield[@tag = '245']/marc:subfield[@code = 'a'],0,string-length(following-sibling::marc:datafield[@tag = '245']/marc:subfield[@code = 'a'])-2) else following-sibling::marc:datafield[@tag = '245']/marc:subfield[@code = 'a']"/>
                <xsl:variable name="pubdate"
                    select="following-sibling::marc:datafield[@tag = '264'][@ind2 = '1']/marc:subfield[@code = 'c']"/>
                <marc:record>
                    <marc:leader>
                        <xsl:text>00000nz  a22     ni 4500</xsl:text>
                    </marc:leader>
                    <marc:controlfield tag="008">
                        <xsl:text>       n|\azannaabn\\\\\\\\\\|n\aaa\\\\\c</xsl:text>
                    </marc:controlfield>
                    <marc:datafield tag="040" ind1=" " ind2=" ">
                        <marc:subfield code="a">FTaSU</marc:subfield>
                        <marc:subfield code="b">eng</marc:subfield>
                        <marc:subfield code="e">rda</marc:subfield>
                        <marc:subfield code="c">FTaSU</marc:subfield>
                    </marc:datafield>
                    <marc:datafield tag="100" ind1="1" ind2=" ">
                        <xsl:copy-of select="marc:subfield[@code = 'a']"/>
                        <xsl:if test="marc:subfield[@code = 'q']">
                            <xsl:copy-of select="marc:subfield[@code = 'q']"/>
                        </xsl:if>
                        <xsl:if test="marc:subfield[@code = 'c']">
                            <xsl:copy-of select="marc:subfield[@code = 'c']"/>
                        </xsl:if>
                    </marc:datafield>
                    <marc:datafield tag="670" ind1=" " ind2=" ">
                        <marc:subfield code="a">
                            <xsl:value-of select="
                                    concat(
                                    $title_proper,
                                    ' ',
                                    $pubdate,
                                    ':'
                                    )"/>
                        </marc:subfield>
                        <marc:subfield code="b">
                            <xsl:value-of
                                select="concat('title page (', following-sibling::marc:datafield[@tag = '245']/marc:subfield[@code = 'c'], ')')"
                            />
                        </marc:subfield>
                    </marc:datafield>
                </marc:record>
            </xsl:for-each>
        </marc:collection>
    </xsl:template>

</xsl:stylesheet>
