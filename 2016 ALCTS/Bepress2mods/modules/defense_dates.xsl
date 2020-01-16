<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fs="http://www.lib.fsu.edu"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xs xd fs" version="2.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>February 24, 2015</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Defense statements</xd:p>
            <xd:p>Template to standardize defense statements and extract the defense date.</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:template name="defense_date">
        <xsl:param name="line"/>


        <xsl:variable name="date_after"
            select="if (matches($line,'defended ')) then substring-after($line,'defended ') else ('No defended on')"/>

        <xsl:variable name="date_phrase">
            <xsl:value-of
                select="if (contains($date_after,', ') or contains($date_after,'. ')) then replace($date_after,'[,.]\s',' ') else $date_after"
            />
        </xsl:variable>

        <xsl:variable name="date_no_abbrev">
            <xsl:value-of
                select="if (contains($date_phrase,'Jan ')) then replace($date_phrase,'Jan ','January ') else
                           if (contains($date_phrase,'Feb ')) then  replace($date_phrase,'Feb ','February ') else
                           if (contains($date_phrase,'Mar ')) then  replace($date_phrase,'Mar ','March ') else
                           if (contains($date_phrase,'Apr ')) then  replace($date_phrase,'Apr ','April ') else
                           if (contains($date_phrase,'Aug ')) then  replace($date_phrase,'Aug ','August ') else
                           if (contains($date_phrase,'Sept ')) then  replace($date_phrase,'Sept ','September ') else
                           if (contains($date_phrase,'Oct ')) then  replace($date_phrase,'Oct ','October ') else
                           if (contains($date_phrase,'Nov ')) then  replace($date_phrase,'Nov ','November ') else
                           if (contains($date_phrase,'Dec ')) then  replace($date_phrase,'Dec ','December ') else
                          
                           ($date_phrase)
                        "
            />
        </xsl:variable>
        
        <xsl:variable name="date_no_ordinal">
            <xsl:analyze-string select="normalize-space($date_no_abbrev)"
                regex="[\d]{{1,2}}[a-z]{{2}}">
                <xsl:matching-substring>
                    <xsl:value-of select="substring(.,1,string-length(.)-2)"/>                             
                </xsl:matching-substring>
                <xsl:non-matching-substring>
                    <xsl:value-of select="."/>
                </xsl:non-matching-substring>
            </xsl:analyze-string>       
        </xsl:variable>
        
        <xsl:variable name="date"
            select="if (ends-with($date_no_ordinal,'.')) then (substring($date_no_ordinal,1,(string-length($date_no_ordinal)-1))) else
            $date_no_ordinal"/>

        <xsl:variable name="w3cdtf">
            <xsl:choose>
                <xsl:when test="matches($date,'[\d]{1,2}\D[\d]{1,2}\D[\d]{2,4}')">
                    <xsl:analyze-string select="$date"
                        regex="([\d]{{1,2}})\D([\d]{{1,2}})\D([\d]{{2,4}})">
                        <xsl:matching-substring>
                            <xsl:value-of
                                select="xs:date(concat(if (string-length(regex-group(3)) eq 2) then concat('20', regex-group(3)) else (regex-group(3)),'-',if (string-length(regex-group(1)) eq 1) then concat('0', regex-group(1)) else (regex-group(1)),'-',if (string-length(regex-group(2)) eq 1) then concat('0', regex-group(2)) else (regex-group(2))))"
                            />
                        </xsl:matching-substring>
                    </xsl:analyze-string>
                </xsl:when>
                <xsl:otherwise/>
            </xsl:choose>
        </xsl:variable>

        <xsl:choose>
            <!-- Standard date format, example: March 4, 2011 -->
            <xsl:when
                test="matches($date,'[A-Za-z]+\s[\d]{1,2}\s[\d]{4}') and not(matches($date,'[A-Za-z]+\s[A-Za-z]+\s[\d]{1,2}\s[\d]{4}'))">
                <xsl:analyze-string select="$date" regex="([A-Za-z]+)\s([\d]{{1,2}})\s([\d]{{4}})">
                    <xsl:matching-substring>
                        <xsl:value-of
                            select="concat(regex-group(1),' ',regex-group(2),', ',regex-group(3))"/>
                    </xsl:matching-substring>
                </xsl:analyze-string>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <!-- Example dates:  1 November 2005;  12 December 2006; 8, June 2007 (4075) -->
                    <xsl:when test="matches($date,'[\d]{1,2}\W{1,2}[A-Za-z]+\W[\d]{4}')">
                        <xsl:analyze-string select="$date"
                            regex="([\d]{{1,2}})\W{{1,2}}([A-Za-z]+)\W{{1,2}}([\d]{{4}})">
                            <xsl:matching-substring>
                                <xsl:value-of
                                    select="concat(regex-group(2),' ',regex-group(1),', ',regex-group(3))"
                                />
                            </xsl:matching-substring>
                        </xsl:analyze-string>
                    </xsl:when>
                    <!-- Example dates: Monday, October 23, 2006 -->
                    <xsl:when
                        test="matches($date,'[A-Za-z]+\W{1,2}[A-Za-z]+\W{1,2}[\d]{1,2}\W{1,2}[\d]{4}')">
                        <xsl:analyze-string select="$date"
                            regex="[A-Za-z]+\W{{1,2}}([A-Za-z]+)\W{{1,2}}([\d]{{1,2}})\W{{1,2}}([\d]{{4}})">
                            <xsl:matching-substring>
                                <xsl:value-of
                                    select="concat(regex-group(1),' ',regex-group(2),', ',regex-group(3))"
                                />
                            </xsl:matching-substring>
                        </xsl:analyze-string>
                    </xsl:when>
                    <!-- Example dates: the 23 day of April, 2007 -->
                    <xsl:when
                        test="matches($date,'the\s[\d]{1,2}\sday\sof\s[A-Za-z]+\W{1,2}[\d]{4}')">
                        <xsl:analyze-string select="$date"
                            regex="the\s([\d]{{1,2}})\sday\sof\s([A-Za-z]+)\W{{1,2}}([\d]{{4}})">
                            <xsl:matching-substring>
                                <xsl:value-of
                                    select="concat(regex-group(2),' ',regex-group(1),', ',regex-group(3))"
                                />
                            </xsl:matching-substring>
                        </xsl:analyze-string>
                    </xsl:when>
                    <!-- Example dates: the 16 of March 2005 -->
                    <xsl:when test="matches($date,'the\s[\d]{1,2}\sof\s[A-Za-z]+\W{1,2}[\d]{4}')">
                        <xsl:analyze-string select="$date"
                            regex="the\s([\d]{{1,2}})\sof\s([A-Za-z]+)\W{{1,2}}([\d]{{4}})">
                            <xsl:matching-substring>
                                <xsl:value-of
                                    select="concat(regex-group(2),' ',regex-group(1),', ',regex-group(3))"
                                />
                            </xsl:matching-substring>
                        </xsl:analyze-string>
                    </xsl:when>
                    <!-- Example dates: January17, 2008 -->
                    <xsl:when test="matches($date,'[A-Za-z]+[\d]{1,2}\W{1,2}[\d]{4}')">
                        <xsl:analyze-string select="$date"
                            regex="([A-Za-z]+)([\d]{{1,2}})\W{{1,2}}([\d]{{4}})">
                            <xsl:matching-substring>
                                <xsl:value-of
                                    select="concat(regex-group(1),' ',regex-group(2),', ',regex-group(3))"
                                />
                            </xsl:matching-substring>
                        </xsl:analyze-string>
                    </xsl:when>
                    <!-- Example dates: April 7 , 2006 -->
                    <xsl:when test="matches($date,'[A-Za-z]+\W{1,2}[\d]{1,2}\W{2,3}[\d]{4}')">
                        <xsl:analyze-string select="$date"
                            regex="([A-Za-z]+)\W{{1,2}}([\d]{{1,2}})\W{{2,3}}([\d]{{4}})">
                            <xsl:matching-substring>
                                <xsl:value-of
                                    select="concat(regex-group(1),' ',regex-group(2),', ',regex-group(3))"
                                />
                            </xsl:matching-substring>
                        </xsl:analyze-string>
                    </xsl:when>
                    <!-- Example date: Apr 18,2005 -->
                    <xsl:when test="matches($date,'[A-Za-z]+\W{1,2}[\d]{1,2},[\d]{4}')">
                        <xsl:analyze-string select="$date"
                            regex="([A-Za-z]+)\W{{1,2}}([\d]{{1,2}}),([\d]{{4}})">
                            <xsl:matching-substring>
                                <xsl:value-of
                                    select="concat(regex-group(1),' ',regex-group(2),', ',regex-group(3))"
                                />
                            </xsl:matching-substring>
                        </xsl:analyze-string>
                    </xsl:when>
                    <!-- Example dates:  4/2/2007, 4.2.2007, 04/02/2007, 04.02.2007 -->
                    <xsl:when test="matches($date,'[\d]{1,2}\D[\d]{1,2}\D[\d]{2,4}')">
                        <xsl:value-of select="format-date($w3cdtf, '[MNn] [D], [Y]', 'en', (), ())"
                        />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="'ERROR'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>


    </xsl:template>

</xsl:stylesheet>
