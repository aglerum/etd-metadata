<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:fs="http://www.lib.fsu.edu" xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:mods="http://www.loc.gov/mods/v3" xmlns:mads="http://www.loc.gov/mads/v2"
    xmlns:dcterms="http://purl.org/dc/terms/" exclude-result-prefixes="xs xd fs" version="2.0"
    xmlns:oasis="http://www.niso.org/standards/z39-96/ns/oasis-exchange/table"
    xmlns:marc="http://www.loc.gov/MARC21/slim">

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>July 10, 2021</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Template for MODS names, ProQuest version</xd:p>
            <xd:p>This template is called by pq-pdfdata2mods.xsl and pulls data for author names
                from a semester-specific table and committee names from the local MADS file. These
                files are included as variables in pq-pdfdata2mods.xsl.</xd:p>
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
            <marc:datafield tag="100" ind1="1" ind2=" ">
                <marc:subfield code="a">
                    <xsl:value-of select="$authors[filename = current()]/*[(self::family)]"/>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="$authors[filename = current()]/*[(self::given)]"/>
                    <xsl:choose>
                        <xsl:when test="$authors[filename = current()]/*[(self::fuller)] = ''">
                            <xsl:text>,</xsl:text>
                        </xsl:when>
                    </xsl:choose>
                </marc:subfield>
                <!-- Note that in some semesters the author names may not have any suffixes -->
                <xsl:if test="$authors[filename = current()]/*[(self::suffix)] ne ''">
                    <marc:subfield code="c">
                        <xsl:value-of select="$authors[filename = current()]/*[(self::suffix)]"/>
                        <xsl:text>,</xsl:text>
                    </marc:subfield>
                </xsl:if>
                <xsl:if test="$authors[filename = current()]/*[(self::fuller)] ne ''">
                    <marc:subfield code="q">
                        <xsl:value-of select="$authors[filename = current()]/*[(self::fuller)]"/>
                        <xsl:text>,</xsl:text>
                    </marc:subfield>
                </xsl:if>
                <marc:subfield code="e">
                    <xsl:value-of select="'author'"/>
                </marc:subfield>
            </marc:datafield>
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
                    <xsl:for-each
                        select="$madsAuthority[mads:name/@valueURI = current()]/*[(self::mads:name)]">
                        <xsl:variable name="family" select="mads:namePart[@type = 'family']"/>
                        <xsl:variable name="given" select="mads:namePart[@type = 'given']"/>
                        <xsl:variable name="fullerForm"
                            select="
                                if (mads:namePart[@type = 'fullerForm']) then
                                    mads:namePart[@type = 'fullerForm']
                                else
                                    ''"/>
                        <xsl:variable name="termsOfAddress"
                            select="
                                if (mads:namePart[@type = 'termsOfAddress']) then
                                    mads:namePart[@type = 'termsOfAddress']
                                else
                                    ''"/>
                        <xsl:variable name="nameDate"
                            select="
                                if (mads:namePart[@type = 'date']) then
                                    mads:namePart[@type = 'date']
                                else
                                    ''"/>
                        <marc:datafield tag="931" ind1="1" ind2=" ">
                            <marc:subfield code="a">
                                <xsl:value-of select="$family"/>
                                <xsl:text>, </xsl:text>
                                <xsl:value-of select="$given"/>
                                <xsl:choose>
                                    <!-- When fuller form is empty, AND... -->
                                    <xsl:when test="$fullerForm = ''">
                                        <xsl:choose>
                                            <!-- When terms of address is empty, add comma to subfield a -->
                                            <xsl:when test="$termsOfAddress = ''">
                                                <xsl:text>,</xsl:text>
                                            </xsl:when>
                                            <!-- When terms of address is NOT empty, AND... -->
                                            <xsl:otherwise>
                                                <xsl:choose>
                                                  <!-- When terms of address does NOT start with parentheses, add comma to subfield a -->
                                                  <xsl:when
                                                  test="not(starts-with($termsOfAddress, '('))">
                                                  <xsl:text>,</xsl:text>
                                                  </xsl:when>
                                                  <!-- When terms of address DOES start with parentheses, do not add comma to subfield a -->
                                                  <xsl:otherwise/>
                                                </xsl:choose>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:choose>
                                            <!-- When fuller form is not empty, AND... -->
                                            <xsl:when test="not($fullerForm = '')">
                                                <xsl:choose>
                                                  <!-- When terms of address is not empty, AND... -->
                                                  <xsl:when test="not($termsOfAddress = '')">
                                                    <xsl:choose>
                                                        <!-- When terms of address does NOT start with parentheses, add comma to subfield a -->
                                                        <xsl:when test="not(starts-with($termsOfAddress, '('))">
                                                            <xsl:text>,</xsl:text>
                                                        </xsl:when>
                                                        <!-- When terms of address DOES start with parentheses, do not add comma to subfield a -->
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                  </xsl:when>
                                                  <!-- When terms of address IS empty, do not add comma to subfield a -->
                                                  <xsl:otherwise/>
                                                </xsl:choose>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </marc:subfield>
                            <xsl:if test="mads:namePart[@type = 'termsOfAddress']">
                                <marc:subfield code="c">
                                    <xsl:value-of select="$termsOfAddress"/>
                                    <xsl:choose>
                                        <!-- When fuller form is empty, add comma to subfield c -->
                                        <xsl:when test="$fullerForm = ''">
                                            <xsl:text>,</xsl:text>
                                        </xsl:when>
                                        <!-- When fuller form is NOT empty, do NOT add comma to subfield c -->
                                        <xsl:otherwise/>
                                    </xsl:choose>
                                </marc:subfield>
                            </xsl:if>
                            <xsl:if test="mads:namePart[@type = 'fullerForm']">
                                <marc:subfield code="q">
                                    <xsl:value-of select="$fullerForm"/>
                                    <xsl:text>,</xsl:text>
                                </marc:subfield>
                            </xsl:if>
                            <xsl:if test="mads:namePart[@type = 'date']">
                                <marc:subfield code="d">
                                    <xsl:value-of select="$nameDate"/>
                                    <xsl:choose>
                                        <!-- When date does NOT end in a hyphen, add a comma to subfield d -->
                                        <xsl:when test="not(ends-with($nameDate, '-'))">
                                            <xsl:text>,</xsl:text>
                                        </xsl:when>
                                        <!-- When date DOES end in a hypen, do NOT add comma to subfield d -->
                                        <xsl:otherwise/>
                                    </xsl:choose>
                                </marc:subfield>
                            </xsl:if>
                            <marc:subfield code="e">
                                <xsl:value-of select="lower-case($role)"/>
                            </marc:subfield>
                            <marc:subfield code="9">LOCAL</marc:subfield>
                        </marc:datafield>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>



</xsl:stylesheet>
