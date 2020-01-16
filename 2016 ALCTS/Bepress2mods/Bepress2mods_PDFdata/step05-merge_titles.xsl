<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fs="http://www.lib.fsu.edu"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xs xd fs" version="2.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>January 21, 2015</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Process 3: Merge Split Titles</xd:p>
            <xd:p>This transformation merges split title lines in the reformated PDF-XML.</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template match="/">
        <xml>
            <xsl:for-each select="xml/lines">
                <xsl:variable name="line3" select="line[3]"/>
                <xsl:variable name="line4" select="line[4]"/>
                <xsl:variable name="line5" select="line[5]"/>
                <xsl:variable name="line6" select="line[6]"/>
                <xsl:variable name="line7" select="line[7]"/>
                <xsl:variable name="line8" select="line[8]"/>
                <xsl:variable name="line9" select="line[9]"/>

                <xsl:choose>
                    
                    <!-- Dissertations -->
                    <xsl:when test="line[matches(upper-case(.),'DISSERTATION SUBMITTED')]">
                        <xsl:choose>
                            <xsl:when
                                test="starts-with(upper-case($line5),'A DISSERTATION ') or starts-with(upper-case($line5),'DISSERTATION SUBMITTED')">
                                <xsl:copy-of select="."/>
                            </xsl:when>
                            <xsl:when
                                test="not(starts-with(upper-case(upper-case($line5)),'A DISSERTATION ') or starts-with(upper-case($line5),'DISSERTATION SUBMITTED' ))">
                                <lines>
                                 <xsl:copy-of select="number"/>
                                <xsl:choose>
                                    <xsl:when test="starts-with(upper-case($line6),'A DISSERTATION ') or starts-with(upper-case($line6),'DISSERTATION SUBMITTED ')">
                                        <xsl:copy-of select="line[position() lt 3]"/>
                                        <line><xsl:value-of select="concat($line3, ' ', $line4)"/></line>
                                        <xsl:copy-of select="line[position() gt 4]"/>
                                    </xsl:when>
                                    <xsl:when test="starts-with(upper-case($line7),'A DISSERTATION ') or starts-with(upper-case($line7),'DISSERTATION SUBMITTED ')">
                                        <xsl:copy-of select="line[position() lt 3]"/>
                                        <line><xsl:value-of select="concat($line3, ' ', $line4, ' ', $line5)"/></line>
                                        <xsl:copy-of select="line[position() gt 5]"/>
                                    </xsl:when>
                                    <xsl:when test="starts-with(upper-case($line8),'A DISSERTATION ') or starts-with(upper-case($line8),'DISSERTATION SUBMITTED ')">
                                        <xsl:copy-of select="line[position() lt 3]"/>
                                        <line><xsl:value-of select="concat($line3, ' ', $line4, ' ', $line5, ' ', $line6)"/></line>
                                        <xsl:copy-of select="line[position() gt 6]"/>
                                    </xsl:when>
                                    <xsl:when test="starts-with(upper-case($line9),'A DISSERTATION ') or starts-with(upper-case($line9),'DISSERTATION SUBMITTED ')">
                                        <xsl:copy-of select="line[position() lt 3]"/>
                                        <line><xsl:value-of select="concat($line3, ' ', $line4, ' ', $line5, ' ', $line6, ' ', $line7)"/></line>
                                        <xsl:copy-of select="line[position() gt 7]"/>
                                    </xsl:when>
                                </xsl:choose>
                                 </lines>
                            </xsl:when>
                            <xsl:otherwise/>
                        </xsl:choose>
                    </xsl:when>
                    
                    <!-- Theses -->
                    <xsl:when test="line[matches(upper-case(.),'THESIS SUBMITTED')]">
                        <xsl:choose>
                            <xsl:when
                                test="starts-with(upper-case($line5),'A THESIS ') or starts-with(upper-case($line5),'THESIS SUBMITTED ')">
                                <xsl:copy-of select="."/>
                            </xsl:when>
                            <xsl:when
                                test="not(starts-with(upper-case($line5),'A THESIS ') or starts-with(upper-case($line5),'THESIS SUBMITTED '))">
                                <lines>
                                    <xsl:copy-of select="number"/>
                                <xsl:choose>
                                    <xsl:when test="starts-with(upper-case($line6),'A THESIS ') or starts-with(upper-case($line6),'THESIS SUBMITTED ')">
                                        <xsl:copy-of select="line[position() lt 3]"/>
                                        <line><xsl:value-of select="concat($line3, ' ', $line4)"/></line>
                                        <xsl:copy-of select="line[position() gt 4]"/>
                                    </xsl:when>
                                    <xsl:when test="starts-with(upper-case($line7),'A THESIS ') or starts-with(upper-case($line5),'THESIS SUBMITTED ')">
                                        <xsl:copy-of select="line[position() lt 3]"/>
                                        <line><xsl:value-of select="concat($line3, ' ', $line4, ' ', $line5)"/></line>
                                        <xsl:copy-of select="line[position() gt 5]"/>
                                    </xsl:when>
                                    <xsl:when test="starts-with(upper-case($line8),'A THESIS ') or starts-with(upper-case($line8),'THESIS SUBMITTED ')">
                                        <xsl:copy-of select="line[position() lt 3]"/>
                                        <line><xsl:value-of select="concat($line3, ' ', $line4, ' ', $line5, ' ', $line6)"/></line>
                                        <xsl:copy-of select="line[position() gt 6]"/>
                                    </xsl:when>
                                    <xsl:when test="starts-with(upper-case($line9),'A THESIS ') or starts-with(upper-case($line9),'THESIS SUBMITTED ')">
                                        <xsl:copy-of select="line[position() lt 3]"/>
                                        <line><xsl:value-of select="concat($line3, ' ', $line4, ' ', $line5, ' ', $line6, ' ', $line7)"/></line>
                                        <xsl:copy-of select="line[position() gt 7]"/>
                                    </xsl:when>
                                </xsl:choose>
                                 </lines>
                            </xsl:when>
                            <xsl:otherwise/>
                        </xsl:choose>
                    </xsl:when>
                    
                    <!-- Treatises -->
                    <xsl:when test="line[matches(upper-case(.),'TREATISE SUBMITTED')]">
                        <xsl:choose>
                            <xsl:when
                                test="starts-with(upper-case($line5),'A TREATISE ') or starts-with(upper-case($line5),'TREATISE SUBMITTED ')">
                                <xsl:copy-of select="."/>
                            </xsl:when>
                            <xsl:when
                                test="not(starts-with(upper-case($line5),'A TREATISE ') or starts-with(upper-case($line5),'TREATISE SUBMITTED '))">
                                <lines>
                                    <xsl:copy-of select="number"/>
                                <xsl:choose>
                                    <xsl:when test="starts-with(upper-case($line6),'A TREATISE ') or starts-with(upper-case($line6),'TREATISE SUBMITTED ')">
                                        <xsl:copy-of select="line[position() lt 3]"/>
                                        <line><xsl:value-of select="concat($line3, ' ', $line4)"/></line>
                                        <xsl:copy-of select="line[position() gt 4]"/>
                                    </xsl:when>
                                    <xsl:when test="starts-with(upper-case($line7),'A TREATISE ') or starts-with(upper-case($line5),'TREATISE SUBMITTED ')">
                                        <xsl:copy-of select="line[position() lt 3]"/>
                                        <line><xsl:value-of select="concat($line3, ' ', $line4, ' ', $line5)"/></line>
                                        <xsl:copy-of select="line[position() gt 5]"/>
                                    </xsl:when>
                                    <xsl:when test="starts-with(upper-case($line8),'A TREATISE ') or starts-with(upper-case($line8),'TREATISE SUBMITTED ')">
                                        <xsl:copy-of select="line[position() lt 3]"/>
                                        <line><xsl:value-of select="concat($line3, ' ', $line4, ' ', $line5, ' ', $line6)"/></line>
                                        <xsl:copy-of select="line[position() gt 6]"/>
                                    </xsl:when>
                                    <xsl:when test="starts-with(upper-case($line9),'A TREATISE ') or starts-with(upper-case($line9),'TREATISE SUBMITTED ')">
                                        <xsl:copy-of select="line[position() lt 3]"/>
                                        <line><xsl:value-of select="concat($line3, ' ', $line4, ' ', $line5, ' ', $line6, ' ', $line7)"/></line>
                                        <xsl:copy-of select="line[position() gt 7]"/>
                                    </xsl:when>
                                </xsl:choose>
                                 </lines>
                            </xsl:when>
                            <xsl:otherwise/>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise/>
                </xsl:choose>
            </xsl:for-each>
        </xml>
    </xsl:template>

</xsl:stylesheet>
