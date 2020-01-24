<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xs xd" version="2.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>December 4, 2019</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Step 3: Merge split titles</xd:p>
            <xd:p><xd:b>Version: </xd:b>Proquest2MODS.</xd:p>
            <xd:p>
                <xd:b>Notes: </xd:b>
                <xd:ul>This program does not address the following errors. Delete or correct these manually: 
                    <xd:li>Only corrects split titles if the P element containing "By" is present. Add this element to the source document if needed. Correct capitalization if uppercase. This avoids matching on uppercase titles.</xd:li>
                </xd:ul>
            </xd:p>
        </xd:desc>
    </xd:doc>
    
    <!-- Generic identity template -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/">
        <xml>
            <xsl:for-each select="xml/TaggedPDF-doc[P[text() = 'By']]">
                <xsl:variable name="By_position" as="xs:int">
                    <xsl:for-each select="P[text() = 'By']">
                        <xsl:value-of select="if (count(preceding-sibling::P) + 1 ne 0) then count(preceding-sibling::P) + 1 else 0"/>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:variable name="Title" select="P[position() gt 2 and position() lt $By_position]"/>
<!--                <xsl:choose>
                    <xsl:when test="P[text() = 'By']">-->
                        <TaggedPDF-doc>
                            <xsl:copy-of select="file"/>
                            <xsl:copy-of select="P[position() lt 3]"/>
                            <P><xsl:value-of select="$Title"/></P>
                            <xsl:copy-of select="P[position() gt $By_position]"/>                   
                        </TaggedPDF-doc>  
<!--                    </xsl:when>
                    <xsl:otherwise>-->
                      <!--  <TaggedPDF-doc>
                            <xsl:copy-of select="P[position() lt 3]"/>
                            <P><xsl:value-of select="$Title"/></P>
                            <P><xsl:value-of select="substring-after(P[starts-with(.,'By') and ends-with(.,'By')],'By ')"/></P> 
                            <xsl:copy-of select="P[position() gt $By_position]"/>
                        </TaggedPDF-doc>  -->
<!--                    </xsl:otherwise>
                </xsl:choose>-->
            
            </xsl:for-each>
        </xml>
    </xsl:template>

</xsl:stylesheet>
