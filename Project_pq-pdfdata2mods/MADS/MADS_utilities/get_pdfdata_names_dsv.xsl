<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mads="http://www.loc.gov/mads/v2"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="mads xlink xs xsi"
    version="2.0">
    
    <!-- Last Updated: July 2, 2021 -->

    <xsl:output method="text" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/records">
        <xsl:text>File|NameKey|IndirectName|Family|Given|Terms|Role</xsl:text>
        <xsl:text>&#13;</xsl:text>
        <xsl:for-each select="record/committee/member/name">
                <xsl:variable name="suffix">
                    <xsl:value-of
                        select="
                        if (contains(., ', ')) then
                        substring-after(., ', ')
                        else
                        ()"
                    />
                </xsl:variable>
                <xsl:variable name="nameBase">
                    <xsl:value-of
                        select="
                        if (contains(., ', ')) then
                        substring-before(., ', ')
                        else
                        ."
                    />
                </xsl:variable>
                <xsl:variable name="family"
                    select="
                    if (contains($nameBase, ' Van ') or contains($nameBase, ' van ')) then
                    concat('Van ', tokenize($nameBase, ' ')[last()])
                    else
                    if (contains($nameBase, ' Von ') or contains($nameBase, ' von ')) then
                    concat('Von ', tokenize($nameBase, ' ')[last()])
                    else
                    if (contains($nameBase, ' De ') or contains($nameBase, ' de ')) then
                    concat('De ', tokenize($nameBase, ' ')[last()])
                    else
                    tokenize($nameBase, ' ')[last()]"/>
                
                <xsl:variable name="given"
                    select="
                    if (contains($nameBase, ' Van ')) then
                    substring-before($nameBase, ' Van')
                    else
                    if (contains($nameBase, ' van ')) then
                    substring-before($nameBase, ' van')
                    else
                    if (contains($nameBase, ' Von ')) then
                    substring-before($nameBase, ' Von')
                    else
                    if (contains($nameBase, ' von ')) then
                    substring-before($nameBase, ' von')
                    else
                    if (contains($nameBase, ' De ')) then
                    substring-before($nameBase, ' De')
                    else
                    if (contains($nameBase, ' de ')) then
                    substring-before($nameBase, ' de')
                    else
                    substring-before($nameBase, concat(' ', $family))"/>
            <xsl:variable name="firstname" select="tokenize($given, ' ')[1]"/>
            <xsl:variable name="namekey">
                <xsl:value-of select="concat($family,substring($given,1,1))"/>
            </xsl:variable>
            <xsl:variable name="file" select="../../../filename"/> 
            <xsl:variable name="role" select="following-sibling::role"/>
            <xsl:variable name="delimiter" select="'|'"/>
            
            <xsl:value-of select="concat($file, $delimiter, $namekey, $delimiter, concat($family, ', ',$given), $delimiter, $family, $delimiter, $given, $delimiter, $suffix, $delimiter, $role, '&#13;')"/>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
