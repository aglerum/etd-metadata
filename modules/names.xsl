<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.w3.org/2005/xpath-functions" 
    xmlns:marc="http://www.loc.gov/MARC21/slim"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd">
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated:</xd:b> November 1, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> Annie Glerum</xd:p>
            <xd:p><xd:b>Organization:</xd:b> Florida State University</xd:p>
            <xd:p><xd:b>Title:</xd:b>Template for indirect names</xd:p>
            <xd:p>This template is called by trans2marc.xml.</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:preserve-space elements="text"/>
 
    <xsl:template name="indirectName">
        <xsl:param name="person" select="name"/>
        <xsl:variable name="lname" select="$person/DISS_surname"/>
        <xsl:variable name="fname" select="$person/DISS_fname"/>
        <xsl:variable name="mname" select="$person/DISS_middle"/>
        <xsl:variable name="suffix" select="$person/DISS_suffix"/>
        
        <xsl:variable name="middle">
            <xsl:value-of select="if (string-length($mname)=1) then concat($mname,'.') else $mname"
            />
        </xsl:variable>
        
        <marc:subfield code="a">
            <xsl:value-of
                select="
                if ($mname='') then (concat($lname, ', ', $fname, ',')) else
                (concat($lname, ', ', $fname, ' ', $middle, ','))          
                "
            />
        </marc:subfield>
        <!-- ***Note: Some ProQuest metadata has empty DISS_suffix elements when there is a suffix in the PDF's responsibility statement. -->
        <xsl:choose>
            <xsl:when test="$suffix!=''">
                <marc:subfield code="c">
                    <xsl:value-of select="concat($suffix,',')"/>
                </marc:subfield>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>