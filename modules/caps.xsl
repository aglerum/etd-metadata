<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fsul="http://www.lib.fsu.edu"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xd xs">
   
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>June 4, 2016</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Proper Capitalization</xd:p>
            <xd:p>Calls data from caps.xml.</xd:p>
            <xd:p>Template to convert select English articles, conjunctions, and short prepositions in titles from capitalized to lower-case and to change acronyms to original capitalization </xd:p>
     </xd:desc>
    </xd:doc>
    
    <xsl:include href="functions.xsl"/>
    
    <!-- Global variables -->
    <xsl:variable name="list" select="document('tables/caps.xml')/dictionary"/>    

    <!-- Note: This template does not properly process  the intial " A. ", this should be done after the template is called.-->
    <xsl:template name="capitalization">
        <xsl:param name="element"/>        
        
        <xsl:variable name="Element">
            <xsl:value-of select="fsul:TitleCase($element)" />
        </xsl:variable>        
        <xsl:variable name="article" select="$list/terms/term[@category='article'][@ambiguous='no']"/>
        <xsl:variable name="conjunction" select="$list/terms/term[@category='conjunction'][@ambiguous='no']"/>
        <xsl:variable name="preposition" select="$list/terms/term[@category='preposition'][@ambiguous='no']"/>
        <xsl:variable name="acronym" select="$list/terms/term[@category='acronym'][@ambiguous='no']"/>
        
        <xsl:analyze-string select="$Element" regex="\w+" flags="i">
            <xsl:matching-substring>
                <xsl:value-of select="
                    if (.=$article and not(position()=1))  then (lower-case(.)) else 
                    if (.=$conjunction and not(position()=1)) then (lower-case(.)) else
                    if (.=$preposition and not(position()=1)) then (lower-case(.)) else 
                    if (upper-case(.)=$acronym) then (upper-case(.)) else                  
                    if ($list/mixed/pair[term1 = current()]) then ($list/mixed/pair[term1 = current()]/*[(self::term2)]) else
                    if ($list/names/pair[name1 = current()]) then ($list/names/pair[name1 = current()]/*[(self::name2)]) else
                    (.)
                    "/>                            
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="."/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>        
    </xsl:template>
</xsl:stylesheet>