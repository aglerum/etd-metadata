<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    version="2.0">

    <xsl:output encoding="UTF-8" indent="yes" method="text"/>

    <xsl:template match="records">
        <xsl:text>Source#File#InDirectName#FamilyName#GivenName#Suffix#Role&#13;</xsl:text>
        <xsl:for-each select="record/author">
                <xsl:variable name="delimiter" select="'#'"/>
                <xsl:variable name="file" select="../filename"/>
            <xsl:variable name="last_token" select="tokenize(., ' ')[last()]"/>
                <xsl:variable name="suffix"
                    select="if (contains(.,',')) then substring-after(.,', ') else ()"/>
                <xsl:variable name="family"
                    select="
                    if ($suffix ne '') then
                    tokenize(substring-before(.,', '), ' ')[last()]
                    else
                    $last_token"/>
                 <xsl:variable name="given" select="normalize-space(substring-before(., $family))"/>
                <xsl:variable name="role" select="'author'"/>
                <xsl:variable name="indirect"
                    select="
                    concat($family, ', ', $given, if ($suffix != '') then
                    ', '
                    else
                    (), $suffix)"/>
            <xsl:variable name="direct" select="."/>
                <xsl:value-of
                    select="concat('PDFdata', $delimiter,$file, $delimiter, $indirect, $delimiter, $family, $delimiter, $given, $delimiter, $suffix, $delimiter, $role, '&#13;')"
                />
<!--            <variable_check>
                <direct><xsl:value-of select="$direct"/></direct>
                <suffix><xsl:value-of select="$suffix"/></suffix>
                <last_token><xsl:value-of select="$last_token"/></last_token>
                <family><xsl:value-of select="$family"/></family>
                <given><xsl:value-of select="$given"/></given>
                <indirect><xsl:value-of select="$indirect"/></indirect>
            </variable_check>-->
            
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
