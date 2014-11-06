<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:fs="http://www.lib.fsu.edu" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd fs" version="2.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

   <xsl:include href="modules/caps.xsl"/>

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>November 4, 2014</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Reformatted PDF-XML to Source</xd:p>
            <xd:p>Template to transform the reformatted PDF-XML to a common source document for both trans2bepress.xsl and trans2marc.xsl.</xd:p>
        </xd:desc>
    </xd:doc>
    
    <!-- This cleanup does not address honorifics such as "Dr." preceding the advisory committees names. Correct these manually. -->
   
    <xsl:template match="xml">
        <records>
            <xsl:for-each select="lines">
                <record>
                    <xsl:copy-of select="position"/>
                    
                    <college><xsl:call-template name="capitalization">                          
                        <xsl:with-param name="element" select="line[2]"/>
                        </xsl:call-template>  
                   </college>

                    <title>                       
                        <xsl:variable name="Title">
                            <xsl:call-template name="capitalization">
                                <xsl:with-param name="element" select="line[3]"/>
                            </xsl:call-template>
                        </xsl:variable>
                        <xsl:value-of select="
                            if (contains($Title,' A ') and not(matches($Title,': A '))) then (replace(fs:punct-before-article(fs:apostrophes($Title)),' A ',' a ')) else
                            fs:punct-before-article(fs:apostrophes($Title))"/>                       
                    </title>
                   
                    <author>
                        <xsl:variable name="author">
                            <xsl:call-template name="capitalization">
                                <xsl:with-param name="element" select="concat('By ',line[4])"/>
                            </xsl:call-template>
                        </xsl:variable>
                        <xsl:value-of
                            select="               
                        if (contains($author,' a. ')) then replace($author,' a. ',' A. ') else               
                        $author"
                        />
                    </author>
                    <submitted><xsl:value-of select="fs:exclamation(line[5])"/></submitted>
                    <awarded><xsl:value-of select="line[6]"/></awarded>
                    <defense>
                        <!-- This does not account for phrases that lack the word "on". Correct these manually -->
                        <xsl:variable name="datePeriod"
                            select="fs:strip-period(line[7])"/> 
                        <xsl:variable name="dateString"
                            select="fs:strip-ordinal($datePeriod)"/>
                        <xsl:variable name="date"
                            select="substring-after($dateString,' on ')"/>                       
                        <xsl:value-of select="$date"/>
                    </defense>
                    <committee>
                        <xsl:for-each select="line[position() gt 7]">
                            <xsl:variable name="function1"
                                select="'Professor Directing Dissertation'"/>
                            <xsl:variable name="function2"
                                select="'Professor Co-Directing Dissertation'"/>
                            <xsl:variable name="function3" select="'Professor Directing Thesis'"/>
                            <xsl:variable name="function4" select="'Professor Co-Directing Thesis'"/>                            
                            <xsl:variable name="function5"
                                select="'Professor Directing Treatise'"/>
                            <xsl:variable name="function6"
                                select="'Professor Co-Directing Treatise'"/>
                            <xsl:variable name="function7" select="'University Representative'"/>
                            <xsl:variable name="function8" select="'Committee Member'"/>
                            <member>
                                <xsl:choose>
                                    <xsl:when test="contains(., $function1)">                                      
                                        <xsl:value-of
                                            select="
                                            (concat(normalize-space(substring-before(., $function1)),', ',$function1))"
                                        />
                                    </xsl:when>
                                    <xsl:when test="contains(., $function2)">
                                        <xsl:value-of
                                            select="
                                            (concat(normalize-space(substring-before(., $function2)),', ',$function2))"
                                        />
                                    </xsl:when>
                                    <xsl:when test="contains(., $function3)">
                                        <xsl:value-of
                                            select="
                                            (concat(normalize-space(substring-before(., $function3)),', ',$function3))"
                                        />
                                    </xsl:when>
                                    <xsl:when test="contains(., $function4)">
                                        <xsl:value-of
                                            select="
                                            (concat(normalize-space(substring-before(., $function4)),', ',$function4))"
                                        />
                                    </xsl:when>
                                    <xsl:when test="contains(., $function5)">
                                        <xsl:value-of
                                            select="
                                            (concat(normalize-space(substring-before(., $function5)),', ',$function5))"
                                        />
                                    </xsl:when>
                                    <xsl:when test="contains(., $function6)">
                                        <xsl:value-of
                                            select="
                                            (concat(normalize-space(substring-before(., $function6)),', ',$function6))"
                                        />
                                    </xsl:when>
                                    <xsl:when test="contains(., $function7)">
                                        <xsl:value-of
                                            select="
                                            (concat(normalize-space(substring-before(., $function7)),', ',$function7))"
                                        />
                                    </xsl:when>
                                    <xsl:when test="contains(., $function8)">
                                        <xsl:value-of
                                            select="
                                            (concat(normalize-space(substring-before(., $function8)),', ',$function8))"
                                        />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="."/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </member> </xsl:for-each>
                    </committee>
                </record>
            </xsl:for-each>
        </records>
    </xsl:template>
</xsl:stylesheet>
