<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:fsul="http://www.lib.fsu.edu" exclude-result-prefixes="fsul xs xd" version="2.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xsl:include href="../../modules/caps.xsl"/>

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>January 15, 2020</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Step 8: Reformat PDF-XML to Source</xd:p>
        </xd:desc>
    </xd:doc>
  
    <xd:doc scope="template">
        <xd:desc>
            <xd:p><xd:b>Title: </xd:b>Primary transformation for XML PDF data to PDF data source.</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:template match="/">
        <records>
            <xsl:for-each select="xml/TaggedPDF-doc">
                <!-- Variables -->
                <xsl:variable name="title">
                    <xsl:call-template name="capitalization">
                        <xsl:with-param name="element" select="normalize-space(P[3])"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:variable name="Title">
                    <xsl:value-of select="
                        if (contains($title,': a ')) then replace($title,': a ',': A ') else 
                        if (contains($title,'? a ')) then replace($title,'\? a ','? A ') else
                        if (contains($title,' A ')) then replace($title,' A ',' a ') else
                        $title"/>
                </xsl:variable> 
                <xsl:variable name="author">
                    <xsl:call-template name="capitalization">
                        <xsl:with-param name="element"
                            select="normalize-space(if (not(ends-with(P[4],'Jr.') or ends-with(P[4], 'Sr.'))) then fsul:strip-period(P[4]) else P[4])"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:variable name="submitted">
                    <xsl:value-of select="fsul:replace-ligatures(normalize-space(fsul:strip-period(P[5])))"/>
                </xsl:variable>
                <xsl:variable name="awarded">
                    <xsl:value-of
                        select="normalize-space(P[6])"
                    />
                </xsl:variable>
                <xsl:variable name="defense">
                    <xsl:call-template name="defense_date">
                        <xsl:with-param name="P">
                            <xsl:value-of
                                select="fsul:strip-period(P[7])"
                            />
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:variable name="date"
                    select="xs:date(fsul:dateName-to-yyyy-mm-dd($defense))"/>
                <!-- PDF Data -->
                <record>
                    <xsl:copy-of select="file"/>
                    <college>
                        <xsl:variable name="college">
                        <xsl:call-template name="capitalization">
                            <xsl:with-param name="element" select="normalize-space(P[2])"/>
                        </xsl:call-template>
                        </xsl:variable>
                        <xsl:value-of
                            select="
                            if (starts-with($college, 'The ')) then substring-after($college, 'The ') else         
                            $college
                            "/>
                    </college>
                        <department>
                            <xsl:value-of
                                select="
                                substring-after(substring-before($submitted, ' in partial fulfillment'), 'submitted to the ')
                                "
                            />
                        </department>                        
                    <title>                     
                        <xsl:value-of select="if (not(ends-with(P[4],'Jr.') or ends-with(P[4], 'Sr.') or ends-with(P[4], 'U.S.'))) then fsul:strip-period(fsul:apostrophes(fsul:punct-before-article($Title))) else ('ERROR')"/>
                    </title>
                    <author>
                        <xsl:call-template name="clean-pdfdata-name">
                            <xsl:with-param name="name" select="$author"/>
                        </xsl:call-template>
                    </author>
                    <submitted>
                        <xsl:value-of select="$submitted"/>
                    </submitted>                    
                    <awarded>
                        <xsl:choose>
                            <xsl:when test="starts-with($awarded,'Degree')">
                                <xsl:value-of select="fsul:strip-period($awarded)"/>
                            </xsl:when>
                            <xsl:when test="starts-with($awarded,'201')">
                                <xsl:value-of
                                    select="
                                    if ($date ge xs:date('2013-12-13') and $date lt xs:date('2014-05-02')) then ('Spring Semester 2014') else
                                    if ($date ge xs:date('2014-05-02') and $date lt xs:date('2014-08-01')) then ('Summer Semester 2014') else
                                    if ($date ge xs:date('2014-08-01') and $date lt xs:date('2014-12-12')) then ('Fall Semester 2014') else 
                                    if ($date ge xs:date('2014-12-12') and $date lt xs:date('2015-05-01')) then ('Spring Semester 2015') else 
                                    if ($date ge xs:date('2015-05-01') and $date lt xs:date('2015-07-02')) then ('Summer Semester 2015') else
                                    if ($date ge xs:date('2015-07-02') and $date lt xs:date('2015-12-15')) then ('Fall Semester 2015') else 
                                    if ($date ge xs:date('2015-12-15') and $date lt xs:date('2016-04-30')) then ('Spring Semester 2016') else
                                    if ($date ge xs:date('2016-04-29') and $date lt xs:date('2016-08-06')) then ('Summer Semester 2016') else
                                    if ($date ge xs:date('2016-08-05') and $date lt xs:date('2016-12-17')) then ('Fall Semester 2016') else
                                    if ($date ge xs:date('2016-12-16') and $date lt xs:date('2017-04-28')) then ('Spring Semester 2017') else  
                                    if ($date ge xs:date('2017-04-27') and $date lt xs:date('2017-08-05')) then ('Summer Semester 2017') else  
                                    if ($date ge xs:date('2017-08-04') and $date lt xs:date('2017-12-16')) then ('Fall Semester 2017') else
                                    if ($date ge xs:date('2017-12-15') and $date lt xs:date('2018-04-28')) then ('Spring Semester 2018') else  
                                    if ($date ge xs:date('2018-04-27') and $date lt xs:date('2018-08-05')) then ('Summer Semester 2018') else  
                                    if ($date ge xs:date('2018-08-04') and $date lt xs:date('2018-12-15')) then ('Fall Semester 2018') else
                                    if ($date ge xs:date('2018-12-14') and $date lt xs:date('2019-04-26')) then ('Spring Semester 2019') else  
                                    if ($date ge xs:date('2019-04-25') and $date lt xs:date('2019-08-03')) then ('Summer Semester 2019') else  
                                    if ($date ge xs:date('2019-08-02') and $date lt xs:date('2019-12-14')) then ('Fall Semester 2019') else
                                    ('ERROR')"/>
                            </xsl:when>
                            <xsl:otherwise/>
                        </xsl:choose>
                    </awarded>
                    <defense>
                        <xsl:value-of select="$defense"/>
                    </defense>
                    <committee>
                        <xsl:for-each select="P[position() gt 7]">
                            <xsl:variable name="function1" select="'Professor Directing Dissertation'"/>
                            <xsl:variable name="function2" select="'Professor Co-Directing Dissertation'"/>
                            <xsl:variable name="function3" select="'Professor Directing Thesis'"/>
                            <xsl:variable name="function4" select="'Professor Co-Directing Thesis'"/>
                            <xsl:variable name="function5" select="'Professor Directing Treatise'"/>
                            <xsl:variable name="function6" select="'Professor Co-Directing Treatise'"/>
                            <xsl:variable name="function7" select="'University Representative'"/>
                            <xsl:variable name="function8" select="'Outside Committee Member'"/>
                            <xsl:variable name="function9" select="'Committee Member'"/>
                            <xsl:variable name="function10" select="'Committee Chair'"/>
                            <member>
                                <xsl:choose>
                                    <xsl:when test="contains(., $function1)">
                                        <name>
                                            <xsl:call-template name="clean-pdfdata-name">
                                                <xsl:with-param name="name" select="normalize-space(substring-before(., $function1))"/>
                                            </xsl:call-template>
                                        </name>
                                        <role>
                                            <xsl:value-of select="$function1"/>
                                        </role>
                                    </xsl:when>
                                    <xsl:when test="contains(., $function2)">
                                        <name>
                                            <xsl:call-template name="clean-pdfdata-name">
                                                <xsl:with-param name="name" select="normalize-space(substring-before(., $function2))"/>
                                            </xsl:call-template>
                                        </name>
                                        <role>
                                            <xsl:value-of select="$function2"/>
                                        </role>
                                    </xsl:when>
                                    <xsl:when test="contains(., $function3)">
                                        <name>
                                            <xsl:call-template name="clean-pdfdata-name">
                                                <xsl:with-param name="name" select="normalize-space(substring-before(., $function3))"/>
                                            </xsl:call-template>
                                        </name>
                                        <role>
                                            <xsl:value-of select="$function3"/>
                                        </role>
                                    </xsl:when>
                                    <xsl:when test="contains(., $function4)">
                                        <name>
                                            <xsl:call-template name="clean-pdfdata-name">
                                                <xsl:with-param name="name" select="normalize-space(substring-before(., $function4))"/>
                                            </xsl:call-template>
                                        </name>
                                        <role>
                                            <xsl:value-of select="$function4"/>
                                        </role>
                                    </xsl:when>
                                    <xsl:when test="contains(., $function5)">
                                        <name>
                                            <xsl:call-template name="clean-pdfdata-name">
                                                <xsl:with-param name="name" select="normalize-space(substring-before(., $function5))"/>
                                            </xsl:call-template>
                                        </name>
                                        <role>
                                            <xsl:value-of select="$function5"/>
                                        </role>
                                    </xsl:when>
                                    <xsl:when test="contains(., $function6)">
                                        <name>
                                            <xsl:call-template name="clean-pdfdata-name">
                                                <xsl:with-param name="name" select="normalize-space(substring-before(., $function6))"/>
                                            </xsl:call-template>
                                        </name>
                                        <role>
                                            <xsl:value-of select="$function6"/>
                                        </role>
                                    </xsl:when>
                                    <xsl:when test="contains(., $function7)">
                                        <name>
                                            <xsl:call-template name="clean-pdfdata-name">
                                                <xsl:with-param name="name" select="normalize-space(substring-before(., $function7))"/>
                                            </xsl:call-template>
                                        </name>
                                        <role>
                                            <xsl:value-of select="$function7"/>
                                        </role>
                                    </xsl:when>
                                    <xsl:when test="contains(., $function8)">
                                        <name>
                                            <xsl:call-template name="clean-pdfdata-name">
                                                <xsl:with-param name="name" select="normalize-space(substring-before(., $function8))"/>
                                            </xsl:call-template>
                                        </name>
                                        <role>
                                            <xsl:value-of select="$function8"/>
                                        </role>
                                    </xsl:when>
                                    <xsl:when test="contains(., $function9)">
                                        <name>
                                            <xsl:call-template name="clean-pdfdata-name">
                                                <xsl:with-param name="name" select="normalize-space(substring-before(., $function9))"/>
                                            </xsl:call-template>
                                        </name>
                                        <role>
                                            <xsl:value-of select="$function9"/>
                                        </role>
                                    </xsl:when>
                                    <xsl:when test="contains(., $function10)">
                                        <name>
                                            <xsl:call-template name="clean-pdfdata-name">
                                                <xsl:with-param name="name" select="normalize-space(substring-before(., $function10))"/>
                                            </xsl:call-template>
                                        </name>
                                        <role>
                                            <xsl:value-of select="$function10"/>
                                        </role>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="'ERROR'"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </member>
                        </xsl:for-each>
                    </committee>
                </record>
            </xsl:for-each>
        </records>
    </xsl:template>
    
    <xd:doc scope="template">
        <xd:desc>
            <xd:p><xd:b>Title: </xd:b>Adjunct transformation to remediate common name formatting errors.</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:template name="clean-pdfdata-name">
        <xsl:param name="name"/>
        <xsl:variable name="degree-name"
            select="          
            if (ends-with($name,' M.A.') and not(ends-with($name,', M.A.'))) then substring-before($name,' M.A.') else
            if (ends-with($name,', M.A.')) then substring-before($name,', M.A.') else
            if (ends-with($name,' PhD') and not(ends-with($name,', PhD'))) then substring-before($name,' PhD') else
            if (ends-with($name,', PhD')) then substring-before($name,', Ph.D.') else
            if (ends-with($name,' PhD.') and not(ends-with($name,', PhD.'))) then substring-before($name,' PhD.') else
            if (ends-with($name,', PhD.')) then substring-before($name,', PhD.') else
            if (ends-with($name,' Ph.D.') and not(ends-with($name,', Ph.D.'))) then substring-before($name,' Ph.D.') else
            if (ends-with($name,', Ph.D.')) then substring-before($name,', Ph.D.') else           
            $name"/>
        <xsl:variable name="suffix-name"
            select="
            if (ends-with($degree-name,' Jr.') and not(ends-with($degree-name,', Jr.'))) then replace($degree-name,' Jr.',', Jr.') else
            if (ends-with($degree-name,' Jr') and not(ends-with($degree-name,', Jr'))) then replace($degree-name,' Jr',', Jr.') else
            if (ends-with($degree-name,' Sr.') and not(ends-with($degree-name,', Sr.'))) then replace($degree-name,' Sr.',', Sr.') else
            if (ends-with($degree-name,' Sr') and not(ends-with($degree-name,', Sr'))) then replace($degree-name,' Sr',', Sr.') else
            if (ends-with($degree-name,' II') and not(ends-with($degree-name,', II'))) then replace($degree-name,' II',', II') else
            if (ends-with($degree-name,' III') and not(ends-with($degree-name,', III'))) then replace($degree-name,' III',', III') else
            if (ends-with($degree-name,' IV') and not(ends-with($degree-name,', IV'))) then replace($degree-name,' IV',', IV') else
            $degree-name"/>

        <xsl:variable name="honorific-name"
            select="
            if (starts-with($suffix-name,'Dr. ')) then substring-after($suffix-name,'Dr. ') else
            if (starts-with($suffix-name,'Professor ')) then substring-after($suffix-name,'Professor ') else
            if (starts-with($suffix-name,'Prof. ')) then substring-after($suffix-name,'Prof. ') else
            $suffix-name"/>

        <xsl:variable name="initial-name">
            <xsl:analyze-string select="$honorific-name" regex="(\s[A-Z]\.\s)|(\s[A-Z]\s)|(\s[A-Z]\.[A-Z]\.\s)">
                <xsl:matching-substring>
                    <xsl:value-of
                        select="
                        if (regex-group(1)) then (.) else
                        if (regex-group(2)) then concat(' ', normalize-space(regex-group(2)),'.',' ') else
                        if (regex-group(3)) then concat(substring-before(regex-group(3),'.'),'. ',substring-after(regex-group(3),'.')) else
                        ()"
                    />
                </xsl:matching-substring>
                <xsl:non-matching-substring>
                    <xsl:value-of select="."/>
                </xsl:non-matching-substring>
            </xsl:analyze-string>
        </xsl:variable>
        <xsl:variable name="strip-period-name"
            select="if (not(ends-with($initial-name,'Jr.') or ends-with($initial-name, 'Sr.'))) then (fsul:strip-period($initial-name)) else $initial-name"/>

        <xsl:value-of
            select="               
            if (contains($strip-period-name,' a. ')) then replace($strip-period-name,' a. ',' A. ') else               
            $strip-period-name"/>
    </xsl:template>
    
    <!-- 
    Standard phrase as of Summer 2017:
    <P>Filiz Aktan defended this Dissertation on July 17, 2017.</P>   
    -->
    
    <xd:doc scope="template">
        <xd:desc>
            <xd:p><xd:b>Title: </xd:b>Adjunct transformation for formatting the defense date.</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template name="defense_date">
        <xsl:param name="P"/>
        
        <xsl:variable name="date_after"
            select="if (matches($P,'defended this')) then (substring-after($P,'on ')) else ('NO DEFENSE DATE')"/>
        <!--
        <xsl:variable name="date_phrase">
            <xsl:value-of
                select="if (contains($date_after,', ') or contains($date_after,'. ')) then replace($date_after,'[,.]\s',' ') else $date_after"
            />
        </xsl:variable>-->
        
        <xsl:variable name="date_no_abbrev">
            <xsl:value-of
                select="fsul:strip-period(if (contains($date_after,'Jan ')) then replace($date_after,'Jan ','January ') else
                if (contains($date_after,'Feb ')) then  replace($date_after,'Feb ','February ') else
                if (contains($date_after,'Mar ')) then  replace($date_after,'Mar ','March ') else
                if (contains($date_after,'Apr ')) then  replace($date_after,'Apr ','April ') else
                if (contains($date_after,'Aug ')) then  replace($date_after,'Aug ','August ') else
                if (contains($date_after,'Sept ')) then  replace($date_after,'Sept ','September ') else
                if (contains($date_after,'Oct ')) then  replace($date_after,'Oct ','October ') else
                if (contains($date_after,'Nov ')) then  replace($date_after,'Nov ','November ') else
                if (contains($date_after,'Dec ')) then  replace($date_after,'Dec ','December ') else                          
                ($date_after))
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
