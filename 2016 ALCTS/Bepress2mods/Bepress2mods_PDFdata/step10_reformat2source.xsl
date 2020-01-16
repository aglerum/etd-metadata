<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fs="http://www.lib.fsu.edu"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xs xd fs" version="2.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xsl:include href="../modules/caps.xsl"/>
    <xsl:include href="../modules/defense_dates.xsl"/>

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>June 4, 2016</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Reformat PDF-XML Data to PDF Data Source</xd:p>
            <xd:p>This transformation reformats PDF to XML to a transcribed data source document</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:template match="/">
        <records>
            <xsl:for-each select="xml/lines">
                <record>
                    <xsl:copy-of select="number"/>
                    <college>
                        <xsl:call-template name="capitalization">
                            <xsl:with-param name="element" select="normalize-space(if (starts-with(line[2], 'The ')) then substring-after(line[2], 'The ') else line[2])"/>
                        </xsl:call-template>
                    </college>

                    <title>
                        <xsl:variable name="title">
                            <xsl:call-template name="capitalization">
                                <xsl:with-param name="element" select="normalize-space(line[3])"/>
                            </xsl:call-template>
                        </xsl:variable>
                         <xsl:variable name="Title">
                             <xsl:value-of select="
                                 if (contains($title,': a ')) then replace($title,': a ',': A ') else 
                                 if (contains($title,'? a ')) then replace($title,'\? a ','? A ') else
                                 if (contains($title,' A ')) then replace($title,' A ',' a ') else
                                 $title"/>
                        </xsl:variable>                       
                        <xsl:value-of select="
                            if (not(ends-with(title,'Jr.') or ends-with(title, 'Sr.'))) then fs:strip-period(fs:apostrophes(fs:punct-before-article($Title))) else 
                            fs:apostrophes(fs:punct-before-article($Title))"/>
                    </title>

                    <author>
                        <xsl:variable name="author">
                            <xsl:call-template name="capitalization">
                                <xsl:with-param name="element"
                                    select="normalize-space(if (not(ends-with(line[4],'Jr.') or ends-with(line[4], 'Sr.'))) then fs:strip-period(line[4]) else line[4])"/>
                            </xsl:call-template>
                        </xsl:variable>

                        <xsl:call-template name="clean-pdfdata-name">
                            <xsl:with-param name="name" select="$author"/>
                        </xsl:call-template>

                    </author>
                    
                    <xsl:for-each select="line[5]">
                    <submitted>
                        <xsl:value-of select="fs:replace-ligatures(normalize-space(.))"/>
                    </submitted>                       
                    </xsl:for-each>

                    <awarded>
                        <xsl:value-of
                            select="normalize-space(fs:strip-period(if (not(starts-with(line[6],'Degree Awarded:'))) then concat('Degree Awarded:', substring-after(line[6], ':'))  else line[6]))"
                        />
                    </awarded>
                    <defense>
                        <xsl:call-template name="defense_date">
                            <xsl:with-param name="line">
                                <xsl:value-of
                                    select="fs:strip-period(line[7])"
                                />
                            </xsl:with-param>
                        </xsl:call-template>
                    </defense>
                    <committee>
                        <xsl:for-each select="line[position() gt 7]">
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
            select="if (not(ends-with($initial-name,'Jr.') or ends-with($initial-name, 'Sr.'))) then (fs:strip-period($initial-name)) else $initial-name"/>

        <xsl:value-of
            select="               
            if (contains($strip-period-name,' a. ')) then replace($strip-period-name,' a. ',' A. ') else               
            $strip-period-name"/>

    </xsl:template>
</xsl:stylesheet>
