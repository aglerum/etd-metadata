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
            <xd:p><xd:b>Title: </xd:b>Step 2: Split merged department names</xd:p>
            <xd:p><xd:b>Version: </xd:b>ProQuest to MODS.</xd:p>
        </xd:desc>
    </xd:doc>

    <!-- Generic identity template -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- Elements that need to be split into two elements -->
    <xsl:template
        match="xml/TaggedPDF-doc/P[starts-with(upper-case(.),'FLORIDA STATE UNIVERSITY ') and contains(upper-case(.),' COLLEGE')]"
        priority="22">
        <P>
            <xsl:copy-of select="substring-before(upper-case(.),' COLLEGE')"/>
        </P>
        <P>
            <xsl:copy-of select="substring-after(upper-case(.),'FLORIDA STATE UNIVERSITY ')"/>
        </P>
    </xsl:template>

    <xsl:template
        match="xml/TaggedPDF-doc/P[starts-with(upper-case(.),'FLORIDA STATE UNIVERSITY ') and contains(upper-case(.),' SCHOOL')]"
        priority="23">
        <P>
            <xsl:copy-of select="substring-before(upper-case(.),' SCHOOL')"/>
        </P>
        <P>
            <xsl:copy-of select="substring-after(upper-case(.),'FLORIDA STATE UNIVERSITY ')"/>
        </P>
    </xsl:template>

    <xsl:template
        match="xml/TaggedPDF-doc/P[starts-with(upper-case(.),'FLORIDA STATE UNIVERSITY ') and contains(upper-case(.),' DEPARTMENT')]"
        priority="24">
        <P>
            <xsl:copy-of select="substring-before(upper-case(.),' DEPARTMENT')"/>
        </P>
        <P>
            <xsl:copy-of select="substring-after(upper-case(.),'FLORIDA STATE UNIVERSITY ')"/>
        </P>
    </xsl:template>
    
    <!-- Splits elements with "By [Author] -->
    
    <xsl:template
        match="xml/TaggedPDF-doc/P[starts-with(.,'By ')]">
        <P>By</P>
        <P>
            <xsl:copy-of select="normalize-space(substring-after(.,'By '))"/>
        </P>
    </xsl:template>
    
</xsl:stylesheet>
