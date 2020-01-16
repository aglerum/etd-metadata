<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xs xd" version="2.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>December 4, 2019</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Step 5: Merge split awarded statements</xd:p>
            <xd:p><xd:b>Version: </xd:b>Proquest2MODS.</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:template match="/">
        <xml>
            <xsl:for-each select="xml/TaggedPDF-doc">
                <xsl:variable name="P6" select="P[6]"/>
                <xsl:variable name="P7" select="P[7]"/>

                <xsl:choose>
                    <xsl:when test="P[6][ends-with(.,'Awarded:')]">
                        <TaggedPDF-doc>
                                 <xsl:copy-of select="file"/>
                                 <xsl:copy-of select="P[position() lt 6]"/>
                                 <P><xsl:value-of select="concat($P6, ' ', $P7)"/></P>
                                 <xsl:copy-of select="P[position() gt 7]"/>  
                         </TaggedPDF-doc>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy-of select="."/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xml>
    </xsl:template>

</xsl:stylesheet>
