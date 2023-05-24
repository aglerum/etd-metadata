<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:fs="http://www.lib.fsu.edu" xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:mods="http://www.loc.gov/mods/v3" xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:marc="http://www.loc.gov/MARC21/slim" exclude-result-prefixes="xs xd fs" version="2.0">

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>October 18, 2022</xd:p>
            <xd:p><xd:b>Author: </xd:b>Alex Chisum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>MARC subject class template: Proquest version</xd:p>
            <xd:p>This template is refers to subjects4proquest.xml, a table of Proquest category
                codes and their corresponding Library of Congress Shubject Headings, which is called
                by pq-pdfdta2marc.xsl.</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:preserve-space elements="text"/>

    <xsl:variable name="subject1"
        select="document('../tables/subjects4proquest.xml')/subjects/subject"/>

    <xd:doc scope="template">
        <xd:desc>
            <xd:p><xd:b>Title: </xd:b>ProQuest Categorization Code to Library of Congress Subject
                Heading Classifications</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:template name="class_subjects_proquest">
        <xsl:for-each select="DISS_description/DISS_categorization/DISS_category/DISS_cat_code">
            <xsl:for-each select="$subject1[diss_code = current()][1]/*[(self::lcsh)]">
                <xsl:choose>
                    <xsl:when
                        test="@classification and @classification-range">
                        <xsl:choose>
                            <xsl:when test="not(@classification = '')">
                                <marc:datafield tag="050" ind1=" " ind2="4">
                                    <marc:subfield code="a">
                                        <xsl:value-of select="normalize-space(@classification)"/>
                                    </marc:subfield>
                                </marc:datafield>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>
                                    <xsl:when test="not(@classification-range = '')">
                                        <xsl:choose>
                                            <xsl:when
                                                test="
                                                    contains(@classification-range, '(')
                                                    and contains(@classification-range, '-')
                                                    and contains(@classification-range, ' or')">
                                                <marc:datafield tag="050" ind1=" " ind2="4">
                                                  <marc:subfield code="a">FLAG: REVIEW CLASS NUMBER:
                                                      <xsl:value-of select="normalize-space(@classification-range)"
                                                  /></marc:subfield>
                                                </marc:datafield>
                                            </xsl:when>
                                            <xsl:when
                                                test="
                                                    contains(@classification-range, '(')
                                                    and contains(@classification-range, ' or')">
                                                <marc:datafield tag="050" ind1=" " ind2="4">
                                                  <marc:subfield code="a">FLAG: REVIEW CLASS NUMBER:
                                                      <xsl:value-of select="normalize-space(@classification-range)"
                                                  /></marc:subfield>
                                                </marc:datafield>
                                            </xsl:when>
                                            <xsl:when
                                                test="
                                                    contains(@classification-range, '(')
                                                    and contains(@classification-range, '-')">
                                                <marc:datafield tag="050" ind1=" " ind2="4">
                                                  <marc:subfield code="a">FLAG: REVIEW CLASS NUMBER:
                                                      <xsl:value-of select="normalize-space(@classification-range)"
                                                  /></marc:subfield>
                                                </marc:datafield>
                                            </xsl:when>
                                            <xsl:when
                                                test="
                                                    contains(@classification-range, ' or')
                                                    and contains(@classification-range, '-')">
                                                <marc:datafield tag="050" ind1=" " ind2="4">
                                                  <marc:subfield code="a">FLAG: REVIEW CLASS NUMBER:
                                                      <xsl:value-of select="normalize-space(@classification-range)"
                                                  /></marc:subfield>
                                                </marc:datafield>
                                            </xsl:when>
                                            <xsl:when test="contains(@classification-range, '(')">
                                                <marc:datafield tag="050" ind1=" " ind2="4">
                                                  <marc:subfield code="a">
                                                  <xsl:value-of
                                                      select="normalize-space(substring-before(@classification-range, ' ('))"
                                                  />
                                                  </marc:subfield>
                                                </marc:datafield>
                                            </xsl:when>
                                            <xsl:when test="contains(@classification-range, '-')">
                                                <marc:datafield tag="050" ind1=" " ind2="4">
                                                  <marc:subfield code="a">
                                                  <xsl:value-of
                                                      select="normalize-space(substring-before(@classification-range, '-'))"
                                                  />
                                                  </marc:subfield>
                                                </marc:datafield>
                                            </xsl:when>
                                            <xsl:when test="contains(@classification-range, ' or')">
                                                <marc:datafield tag="050" ind1=" " ind2="4">
                                                  <marc:subfield code="a">
                                                  <xsl:value-of
                                                      select="normalize-space(substring-before(@classification-range, ' or'))"
                                                  />
                                                  </marc:subfield>
                                                </marc:datafield>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="@classification">
                        <xsl:choose>
                            <xsl:when test="not(@classification = '')">
                                <marc:datafield tag="050" ind1=" " ind2="4">
                                    <marc:subfield code="a">
                                        <xsl:value-of select="normalize-space(@classification)"/>
                                    </marc:subfield>
                                </marc:datafield>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="@classification-range">
                        <xsl:choose>
                            <xsl:when test="not(@classification-range = '')">
                                <xsl:choose>
                                    <xsl:when
                                        test="
                                            contains(@classification-range, '(')
                                            and contains(@classification-range, '-')
                                            and contains(@classification-range, ' or')">
                                        <marc:datafield tag="050" ind1=" " ind2="4">
                                            <marc:subfield code="a">FLAG: REVIEW CLASS NUMBER:
                                                <xsl:value-of select="normalize-space(@classification-range)"
                                                /></marc:subfield>
                                        </marc:datafield>
                                    </xsl:when>
                                    <xsl:when
                                        test="
                                            contains(@classification-range, '(')
                                            and contains(@classification-range, ' or')">
                                        <marc:datafield tag="050" ind1=" " ind2="4">
                                            <marc:subfield code="a">FLAG: REVIEW CLASS NUMBER:
                                                <xsl:value-of select="normalize-space(@classification-range)"
                                                /></marc:subfield>
                                        </marc:datafield>
                                    </xsl:when>
                                    <xsl:when
                                        test="
                                            contains(@classification-range, '(')
                                            and contains(@classification-range, '-')">
                                        <marc:datafield tag="050" ind1=" " ind2="4">
                                            <marc:subfield code="a">FLAG: REVIEW CLASS NUMBER:
                                                <xsl:value-of select="normalize-space(@classification-range)"
                                                /></marc:subfield>
                                        </marc:datafield>
                                    </xsl:when>
                                    <xsl:when
                                        test="
                                            contains(@classification-range, ' or')
                                            and contains(@classification-range, '-')">
                                        <marc:datafield tag="050" ind1=" " ind2="4">
                                            <marc:subfield code="a">FLAG: REVIEW CLASS NUMBER:
                                                <xsl:value-of select="normalize-space(@classification-range)"
                                                /></marc:subfield>
                                        </marc:datafield>
                                    </xsl:when>
                                    <xsl:when test="contains(@classification-range, '(')">
                                        <marc:datafield tag="050" ind1=" " ind2="4">
                                            <marc:subfield code="a">
                                                <xsl:value-of
                                                    select="normalize-space(substring-before(@classification-range, ' ('))"
                                                />
                                            </marc:subfield>
                                        </marc:datafield>
                                    </xsl:when>
                                    <xsl:when test="contains(@classification-range, '-')">
                                        <marc:datafield tag="050" ind1=" " ind2="4">
                                            <marc:subfield code="a">
                                                <xsl:value-of
                                                    select="normalize-space(substring-before(@classification-range, '-'))"
                                                />
                                            </marc:subfield>
                                        </marc:datafield>
                                    </xsl:when>
                                    <xsl:when test="contains(@classification-range, ' or')">
                                        <marc:datafield tag="050" ind1=" " ind2="4">
                                            <marc:subfield code="a">
                                                <xsl:value-of
                                                    select="normalize-space(substring-before(@classification-range, ' or'))"
                                                />
                                            </marc:subfield>
                                        </marc:datafield>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
