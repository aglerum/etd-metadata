<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:marc="http://www.loc.gov/MARC21/slim"
    xmlns:mads="http://www.loc.gov/mads/v2" xmlns:fsul="http://www.lib.fsu.edu"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="fsul xs xsl xd">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>November 16, 2021</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University Libraries</xd:p>
            <xd:p><xd:b>Title:</xd:b> Transformation of extracted ETD PDF text data and ProQuest
                metadata to MARC21XML for FSU ETDs</xd:p>
        </xd:desc>
    </xd:doc>

    <!-- Configure this transformation on the combined ProQuest metadata. -->
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*" xml:space="preserve"/>

    <xsl:include href="modules/caps.xsl"/>
    <xsl:include href="modules/titleMARC.xsl"/>
    <xsl:include href="modules/namesPQ2MARC_wURI.xsl"/>
    <xsl:include href="modules/subjects-proquestMARC.xsl"/>


    <!-- **Global variables** -->
    <!-- Batch Variable -->
    <xsl:variable name="batch" select="'2020_Summer_Fall_2021_Spring'"/>

    <!-- These paths change with each semester-->
    <xsl:variable name="pdfdata"
        select="document('source_pdfdata/source_pdfdata_2020Su_Fa_2021Sp_w_URL.xml')/records/record"/>
    <xsl:variable name="committee"
        select="document('tables/ETD-NAF_mads_20211113.xml')/mads:madsCollection/mads:mads/mads:authority"/>
    <xsl:variable name="authors" select="document('tables/author_2020Su_Fa_2021Sp_qualifiers.xml')/authors/name"/>

    <!-- These paths refer to data tables -->
    <xsl:variable name="PQ-FSU-dept"
        select="document('tables/PQ-FSUdept.xml')/departments/department"/>
    <xsl:variable name="degrees-PQ" select="document('tables/degrees-PQ.xml')/degrees/degree"/>

    <xd:doc>
        <xd:desc>
            <xd:p>
                <xd:b>MARC template</xd:b>
            </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="MARC_Template" match="/diss">
        <!--Container for multiple MARC records-->
        <marc:collection xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd">
            <xsl:for-each select="DISS_submission">
                <xsl:variable name="binary" select="DISS_content/DISS_binary"/>
                <xsl:variable name="embargo">
                    <xsl:value-of select="@embargo_code"/>
                </xsl:variable>

                <xsl:variable name="orcid">
                    <xsl:value-of select="DISS_authorship/DISS_author/DISS_orcid"/>
                </xsl:variable>

                <!-- <xsl:variable name="department" select="DISS_description/DISS_institution/DISS_inst_contact"/>-->

                <xsl:variable name="defenseDate">
                    <xsl:for-each select="$binary">
                        <xsl:variable name="defended"
                            select="$pdfdata[filename = current()]/*[(self::defense)]"/>
                        <xsl:variable name="date">
                            <xsl:value-of select="replace($defended, ',', '')"/>
                        </xsl:variable>
                        <xsl:value-of select="fsul:dateName-to-yyyy-mm-dd($date)"/>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="College">
                    <xsl:for-each select="$binary">
                        <xsl:value-of select="$pdfdata[filename = current()]/*[(self::college)]"/>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="Submitted">
                    <xsl:for-each select="$binary">
                        <xsl:value-of select="$pdfdata[filename = current()]/*[(self::submitted)]"/>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="Department">
                    <xsl:for-each select="$binary">
                        <xsl:value-of select="$pdfdata[filename = current()]/*[(self::department)]"
                        />
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="Published">
                    <xsl:for-each select="$binary">
                        <xsl:value-of select="$pdfdata[filename = current()]/*[(self::published)]"/>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="Defended">
                    <xsl:for-each select="$binary">
                        <xsl:value-of select="$pdfdata[filename = current()]/*[(self::defense)]"/>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="defenseDate">
                    <xsl:variable name="date">
                        <xsl:value-of select="replace($Defended, ',', '')"/>
                    </xsl:variable>
                    <xsl:value-of select="fsul:dateName-to-yyyy-mm-dd($date)"/>
                </xsl:variable>

                <marc:record>
                    <!--  Leader and control fields<-->
                    <marc:leader>
                        <xsl:text>     nam  22     Ki 4500</xsl:text>
                    </marc:leader>
                    <marc:controlfield tag="006">
                        <xsl:text>m     o  d        </xsl:text>
                    </marc:controlfield>
                    <marc:controlfield tag="007">
                        <xsl:text>cr |||||||||||</xsl:text>
                    </marc:controlfield>
                    <marc:controlfield tag="008">

                        <xsl:variable name="lang">
                            <xsl:for-each select="lang">
                                <xsl:value-of
                                    select="document('tables/languages.xml')/*/*[diss_lang = current()]/*[(self::oclc_lang)]"
                                />
                            </xsl:for-each>
                        </xsl:variable>

                        <xsl:text>      </xsl:text>
                        <xsl:value-of select="concat('s', $Published)"/>
                        <xsl:text>    flu     obm   000 0 </xsl:text>
                        <xsl:value-of select="$lang"/>
                        <xsl:text> d</xsl:text>
                    </marc:controlfield>

                    <!--040 field: Cataloging source-->
                    <marc:datafield tag="040" ind1=" " ind2=" ">
                        <marc:subfield code="a">FDA</marc:subfield>
                        <marc:subfield code="b">eng</marc:subfield>
                        <marc:subfield code="e">rda</marc:subfield>
                        <marc:subfield code="c">FDA</marc:subfield>
                    </marc:datafield>

                    <!--090 field: Local LC-type call number-->
                    <!--<marc:datafield tag="090" ind1=" " ind2=" ">
                            <marc:subfield code="a">LD1773.F965</marc:subfield>
                            <xsl:variable name="degreeType">
                                <xsl:value-of select="DISS_description/@type"/>
                            </xsl:variable>
                            <marc:subfield code="b">
                                <xsl:value-of select="
                                        if ($degreeType = 'doctoral') then
                                            (concat('Z993 ', $year))
                                        else
                                            if ($degreeType = 'masters') then
                                                (concat('Z995 ', $year))
                                            else
                                                ''"/>
                            </marc:subfield>
                        </marc:datafield>-->

                    <!--100 field: Personal name main entry-->
                    <xsl:call-template name="author_name">
                        <xsl:with-param name="binary" select="$binary"/>
                        <xsl:with-param name="authors" select="$authors"/>
                        <xsl:with-param name="orcid" select="$orcid"/>
                    </xsl:call-template>

                    <!--245 field: Title and responsibility statement-->
                    <!--Calls parse+title template to set correct indicator, split subtitle into $b and add responsibility to $c.-->

                    <xsl:variable name="title">
                        <xsl:for-each select="$binary">
                            <xsl:value-of select="$pdfdata[filename = current()]/*[(self::title)]"/>
                        </xsl:for-each>
                    </xsl:variable>

                    <xsl:variable name="responsibility">
                        <xsl:for-each select="$binary">
                            <xsl:value-of select="$pdfdata[filename = current()]/*[(self::author)]"
                            />
                        </xsl:for-each>
                    </xsl:variable>

                    <xsl:call-template name="parse_title">
                        <xsl:with-param name="title" select="$title"/>
                        <xsl:with-param name="responsibility" select="$responsibility"/>
                    </xsl:call-template>

                    <!-->264 field: Publication statement-->
                    <marc:datafield tag="264" ind1=" " ind2="1">
                        <marc:subfield code="a">Tallahassee, Florida :</marc:subfield>
                        <marc:subfield code="b">Florida State University</marc:subfield>
                        <marc:subfield code="c">
                            <xsl:value-of select="$Published"/>
                        </marc:subfield>
                    </marc:datafield>

                    <!--300 field: Physical description-->
                    <!--If adding PDF pages as extent (incorrect RDA practice), use this code inside of marc:subfield a: <xsl:variable name="pageCount" select="DISS_description/@page_count"/> <xsl:value-of select="concat('1 online resource (', $pageCount, ' pages)')"-->
                    <marc:datafield tag="300" ind1=" " ind2=" ">
                        <xsl:variable name="pageCount" select="DISS_description/@page_count"/>
                        <marc:subfield code="a">
                            <xsl:value-of
                                select="concat('1 online resource (', $pageCount, ' pages)')"/>
                        </marc:subfield>
                    </marc:datafield>

                    <!--336 field: Content type-->
                    <marc:datafield tag="336" ind1=" " ind2=" ">
                        <marc:subfield code="a">text</marc:subfield>
                        <marc:subfield code="b">txt</marc:subfield>
                        <marc:subfield code="2">rdacontent</marc:subfield>
                    </marc:datafield>

                    <!--337 field: Media type-->
                    <marc:datafield tag="337" ind1=" " ind2=" ">
                        <marc:subfield code="a">computer</marc:subfield>
                        <marc:subfield code="b">c</marc:subfield>
                        <marc:subfield code="2">rdamedia</marc:subfield>
                    </marc:datafield>

                    <!--338 field: Carrier type-->
                    <marc:datafield tag="338" ind1=" " ind2=" ">
                        <marc:subfield code="a">online resource</marc:subfield>
                        <marc:subfield code="b">cr</marc:subfield>
                        <marc:subfield code="2">rdacarrier</marc:subfield>
                    </marc:datafield>

                    <!--347 field: Digital file characteristics-->
                    <marc:datafield tag="347" ind1=" " ind2=" ">
                        <marc:subfield code="a">text file</marc:subfield>
                        <marc:subfield code="b">PDF</marc:subfield>
                        <marc:subfield code="2">rda</marc:subfield>
                    </marc:datafield>

                    <!--538 field: System details note-->
                    <marc:datafield tag="538" ind1=" " ind2=" ">
                        <marc:subfield code="a">
                            <xsl:value-of
                                select="'System requirements: Adobe Reader or other PDF viewer.'"/>
                        </marc:subfield>
                    </marc:datafield>

                    <!--588 field: Source of description note-->
                    <!--If adding'(viewed on $today)', use <xsl:variable name="today" select="format-date(current-date(),'[MNn] [D], [Y]')"/>-->
                    <marc:datafield tag="588" ind1=" " ind2=" ">
                        <marc:subfield code="a">
                            <xsl:value-of
                                select="'Description based on online resource; title from PDF title page.'"
                            />
                        </marc:subfield>
                    </marc:datafield>

                    <marc:datafield tag="500" ind1=" " ind2=" ">
                        <marc:subfield code="a">Extent pagination is PDF page count.</marc:subfield>
                    </marc:datafield>

                    <!--500 field: General note-->
                    <!--This field is used for the Advisory Committee: note -->
                    <xsl:for-each select="DISS_content/DISS_binary">
                        <xsl:for-each select="$pdfdata[filename = current()]/*[(self::committee)]">
                            <marc:datafield tag="500" ind1=" " ind2=" ">
                                <marc:subfield code="a">
                                    <xsl:value-of select="'Advisory committee: '"/>
                                    <xsl:for-each select="member[position() ne last()]">
                                        <xsl:value-of select="concat(name, ', ', role, '; ')"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="member[last()]">
                                        <xsl:value-of select="concat(name, ', ', role, '.')"/>
                                    </xsl:for-each>
                                </marc:subfield>
                            </marc:datafield>
                        </xsl:for-each>
                    </xsl:for-each>

                    <!--500 field: General note-->
                    <!--This field is used for the "Submitted to" note -->
                    <marc:datafield tag="500" ind1=" " ind2=" ">
                        <marc:subfield code="a">
                            <xsl:for-each select="$binary">
                                <xsl:value-of
                                    select="normalize-space(concat($pdfdata[filename = current()]/*[(self::submitted)], '.'))"
                                />
                            </xsl:for-each>
                        </marc:subfield>
                    </marc:datafield>

                    <!--500 field: General note-->
                    <!--This field is used for the "Defended on" note -->
                    <xsl:variable name="defense">
                        <xsl:for-each select="$binary">
                            <xsl:value-of
                                select="normalize-space($pdfdata[filename = current()]/*[(self::defense)])"
                            />
                        </xsl:for-each>
                    </xsl:variable>
                    <marc:datafield tag="500" ind1=" " ind2=" ">
                        <marc:subfield code="a">
                            <xsl:value-of
                                select="normalize-space(concat('Date of Defense: ', $defense))"/>
                        </marc:subfield>
                    </marc:datafield>
                    
                    <!-- Keywords -->
                    <xsl:variable name="keywords">
                        <xsl:value-of select="normalize-space(DISS_description/DISS_categorization/DISS_keyword)"/>
                    </xsl:variable>
                    <xsl:if test="DISS_description/DISS_categorization/DISS_keyword ne ''">
                        <marc:datafield tag="500" ind1=" " ind2=" ">
                            <marc:subfield code="a">
                                <xsl:value-of
                                    select="concat('Keywords: ',$keywords)"/>
                            </marc:subfield>
                        </marc:datafield>
                    </xsl:if>
                   


                    <!--502 field: Dissertation note-->
                    <marc:datafield tag="502" ind1=" " ind2=" ">
                        <marc:subfield code="b">
                            <xsl:value-of select="DISS_description/DISS_degree"/>
                        </marc:subfield>
                        <marc:subfield code="c">
                            <xsl:value-of select="'Florida State University'"/>
                        </marc:subfield>
                        <marc:subfield code="d">
                            <xsl:value-of select="concat($Published, '.')"/>
                        </marc:subfield>
                    </marc:datafield>

                    <!--520 field: Summary note-->
                    <xsl:for-each select="DISS_content/DISS_abstract">
                        <marc:datafield tag="520" ind1="3" ind2=" ">
                            <marc:subfield code="a">
                                <xsl:variable name="para" select="normalize-space(DISS_para)"
                                    as="xs:string"/>
                                <xsl:variable name="abstract">
                                    <xsl:value-of select="
                                            if (count(DISS_para) > 1) then
                                                normalize-space(string-join((DISS_para), ' '))
                                            else
                                                $para"/>
                                </xsl:variable>
                                <xsl:value-of select="
                                        if (starts-with(upper-case($abstract), 'ABSTRACT ')) then
                                            substring-after($abstract, 'ABSTRACT ')
                                        else
                                            $abstract"/>
                            </marc:subfield>
                        </marc:datafield>
                    </xsl:for-each>

                    <!--504 field: Bibliography note-->
                    <marc:datafield tag="504" ind1=" " ind2=" ">
                        <marc:subfield code="a">
                            <xsl:value-of select="'Includes bibliographical references.'"/>
                        </marc:subfield>
                    </marc:datafield>

                    <!-- 506 field: Restrictions on Access note -->
                    <xsl:choose>
                        <xsl:when test="$embargo != '0'">
                            <marc:datafield tag="506" ind1=" " ind2=" ">
                                <marc:subfield code="a">
                                    <xsl:value-of
                                        select="'This thesis/dissertation may be embargoed for a limited time. Click access link to check availability.'"
                                    />
                                </marc:subfield>
                            </marc:datafield>
                        </xsl:when>
                        <xsl:otherwise/>
                    </xsl:choose>

                    <!--650 field: Library of Congress subject heading-->
                    <xsl:call-template name="subjects_proquest">
                        <xsl:with-param name="DISS_cat_code"
                            select="DISS_description/DISS_categorization/DISS_category/DISS_cat_code"
                        />
                    </xsl:call-template>

                    <!--655 field: Genre/form index term-->
                    <marc:datafield tag="655" ind1=" " ind2="7">
                        <marc:subfield code="a">
                            <xsl:value-of select="'Electronic Thesis or Dissertation.'"/>
                        </marc:subfield>
                        <marc:subfield code="2">dct</marc:subfield>
                    </marc:datafield>

                    <!--690 field: Local FSU subject -->

                    <marc:datafield tag="690" ind1=" " ind2="7">
                        <marc:subfield code="a">FSU Dissertations.</marc:subfield>
                        <marc:subfield code="2">local</marc:subfield>
                        <marc:subfield code="9">LOCAL</marc:subfield>
                    </marc:datafield>

                    <!--710 field: Corporate name-->
                    <marc:datafield tag="710" ind1="2" ind2=" ">
                        <marc:subfield code="a">
                            <xsl:value-of select="'Florida State University.'"/>
                        </marc:subfield>
                        <marc:subfield code="e">degree granting instution.</marc:subfield>
                        <marc:subfield code="0"
                            >http://id.loc.gov/authorities/names/n80126238</marc:subfield>
                    </marc:datafield>

                    <!--931 field: Uncontrolled personal name-->
                    <!-- *Committee members* -->
                    <xsl:call-template name="committee_names">
                        <xsl:with-param name="binary" select="$binary"/>
                        <xsl:with-param name="pdfdata" select="$pdfdata"/>
                        <xsl:with-param name="madsAuthority" select="$committee"/>
                    </xsl:call-template>

                    <!-- 932 field: Uncontrolled corporate name-->
                    <marc:datafield tag="932" ind1="2" ind2=" ">
                        <marc:subfield code="a">
                            <xsl:value-of select="concat($Department, '.')"/>
                        </marc:subfield>
                        <marc:subfield code="9">LOCAL</marc:subfield>
                    </marc:datafield>

                    <!--856 field: Electronic location and access-->

                    <!--<marc:datafield tag="856" ind1="4" ind2="0">
                            <marc:subfield code="u">
                                <xsl:for-each select="$binary">
                                    <xsl:value-of
                                        select="$pdfdata[filename = current()]/*[(self::url)]"/>
                                </xsl:for-each>
                            </marc:subfield>
                            <marc:subfield code="y">Connect to online content</marc:subfield>
                        </marc:datafield>-->

                    <!-- 903 field: locally defined -->
                    <!--This field can be used for identifying a record's embargo status. It would not remain on the OCLC master record and can be deleted when exported to Aleph -->
                    <marc:datafield tag="904" ind1=" " ind2=" ">
                        <marc:subfield code="a">
                            <xsl:value-of select="$embargo"/>
                        </marc:subfield>
                        <marc:subfield code="9">LOCAL</marc:subfield>
                    </marc:datafield>
                </marc:record>
            </xsl:for-each>
        </marc:collection>
    </xsl:template>

</xsl:stylesheet>
