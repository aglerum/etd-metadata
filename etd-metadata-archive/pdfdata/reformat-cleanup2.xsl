<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:fs="http://www.lib.fsu.edu" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd fs" version="2.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>November 4, 2014</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Process 2: Merge split titles</xd:p>
            <xd:p>Templates to merge split title lines in the reformated PDF-XML.</xd:p>
        </xd:desc>
    </xd:doc>

    <!-- This program only corrects split phrases if the "submitted to the" line is split.. -->
    <!-- This program does not address titles that are split. Correct these manually. -->
    <!-- This program does not address honorifics such as "Dr." preceding the advisory committees names. Correct these manually. -->

    <xsl:template match="/">
        <xml>
            <xsl:for-each select="xml/lines">
                <xsl:variable name="line3" select="line[3]"/>
                <xsl:variable name="line4" select="line[4]"/>
                <xsl:variable name="line5" select="line[5]"/>
                <xsl:variable name="line6" select="line[6]"/>
                <xsl:variable name="line7" select="line[7]"/>
                <xsl:variable name="line8" select="line[8]"/>
                
                <xsl:choose>
                    <xsl:when test=".[matches(.,'Dissertation')]">
                        <xsl:choose>
                        <xsl:when test="starts-with($line5,'A Dissertation submitted')">
                            <xsl:copy-of select="."/>
                        </xsl:when>
                         <xsl:when test="not(starts-with($line5,'A Dissertation submitted'))"> 
                             <lines>
                                <xsl:choose>
                                    <xsl:when test="starts-with($line6,'A Dissertation submitted')">
                                        <xsl:copy-of select="position"/>
                                        <xsl:copy-of select="line[position() lt 3]"/>
                                        <line><xsl:value-of select="concat($line3, ' ', $line4)"/></line>
                                        <xsl:copy-of select="line[position() gt 4]"/>
                                    </xsl:when>
                                    <xsl:when test="starts-with($line7,'A Dissertation submitted')">
                                        <xsl:copy-of select="position"/>
                                        <xsl:copy-of select="line[position() lt 3]"/>
                                        <line><xsl:value-of select="concat($line3, ' ', $line4, ' ', $line5)"/></line>
                                        <xsl:copy-of select="line[position() > 5]"/>
                                    </xsl:when>
                                    <xsl:when test="starts-with($line8,'A Dissertation submitted')">
                                        <xsl:copy-of select="position"/>
                                        <xsl:copy-of select="line[position() lt 3]"/>
                                        <line><xsl:value-of select="concat($line3, ' ', $line4, ' ', $line5, ' ', $line6)"/></line>
                                        <xsl:copy-of select="line[position() > 6]"/>
                                    </xsl:when>
                                </xsl:choose>
                                 </lines>
                        </xsl:when>
                     </xsl:choose>                    
                    </xsl:when>
                    <xsl:when test=".[matches(.,'Thesis')]">
                        <xsl:choose>
                        <xsl:when test="starts-with($line5,'A Thesis submitted')">
                            <xsl:copy-of select="."/>
                        </xsl:when>
                         <xsl:when test="not(starts-with($line5,'A Thesis submitted'))">                                                   
                                <lines><xsl:choose>
                                    <xsl:when test="starts-with($line6,'A Thesis submitted')">
                                        <xsl:copy-of select="position"/>
                                        <xsl:copy-of select="line[position() lt 3]"/>
                                        <line><xsl:value-of select="concat($line3, ' ', $line4)"/></line>
                                        <xsl:copy-of select="line[position() gt 4]"/>
                                    </xsl:when>
                                    <xsl:when test="starts-with($line7,'A Thesis submitted')">
                                        <xsl:copy-of select="position"/>
                                        <xsl:copy-of select="line[position() lt 3]"/>
                                        <line><xsl:value-of select="concat($line3, ' ', $line4, ' ', $line5)"/></line>
                                        <xsl:copy-of select="line[position() > 5]"/>
                                    </xsl:when>
                                    <xsl:when test="starts-with($line8,'A Thesis submitted')">
                                        <xsl:copy-of select="position"/>
                                        <xsl:copy-of select="line[position() lt 3]"/>
                                        <line><xsl:value-of select="concat($line3, ' ', $line4, ' ', $line5, ' ', $line6)"/></line>
                                        <xsl:copy-of select="line[position() > 6]"/>
                                    </xsl:when>
                                </xsl:choose> 
                               </lines>
                        </xsl:when>
                     </xsl:choose>                    
                    </xsl:when>
                    <xsl:when test=".[matches(.,'Treatise')]">
                        <xsl:choose>
                        <xsl:when test="starts-with($line5,'A Treatise submitted')">
                            <xsl:copy-of select="."/>
                        </xsl:when>
                         <xsl:when test="not(starts-with($line5,'A Treatise submitted'))">                                                   
                                <lines>
                                    <xsl:choose>
                                    <xsl:when test="starts-with($line6,'A Treatise submitted')">
                                        <xsl:copy-of select="position"/>
                                        <xsl:copy-of select="line[position() lt 3]"/>
                                        <line><xsl:value-of select="concat($line3, ' ', $line4)"/></line>
                                        <xsl:copy-of select="line[position() gt 4]"/>
                                    </xsl:when>
                                    <xsl:when test="starts-with($line7,'A Treatise submitted')">
                                        <xsl:copy-of select="position"/>
                                        <xsl:copy-of select="line[position() lt 3]"/>
                                        <line><xsl:value-of select="concat($line3, ' ', $line4, ' ', $line5)"/></line>
                                        <xsl:copy-of select="line[position() > 5]"/>
                                    </xsl:when>
                                        <xsl:when test="starts-with($line8,'A Treatise submitted')">
                                        <xsl:copy-of select="position"/>
                                        <xsl:copy-of select="line[position() lt 3]"/>
                                        <line><xsl:value-of select="concat($line3, ' ', $line4, ' ', $line5, ' ', $line6)"/></line>
                                        <xsl:copy-of select="line[position() > 6]"/>
                                    </xsl:when>
                                </xsl:choose>
                                    </lines>
                        </xsl:when>
                     </xsl:choose>                    
                    </xsl:when>
                </xsl:choose>
                
            </xsl:for-each>
        </xml>
    </xsl:template>

</xsl:stylesheet>
