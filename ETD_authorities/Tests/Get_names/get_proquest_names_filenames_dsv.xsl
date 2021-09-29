<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    exclude-result-prefixes="xs" version="2.0">

    <xsl:output encoding="UTF-8" indent="yes" method="text"/>

    <xsl:template match="diss">
        <xsl:text>Source#File#InDirectName#FamilyName#GivenName#Suffix#Role&#13;</xsl:text>
            <xsl:variable name="delimiter" select="'#'"/>
            <xsl:for-each select="DISS_submission">               
                <xsl:for-each select="DISS_authorship/DISS_author/DISS_name">
                    <xsl:variable name="file" select="../../../DISS_content/DISS_binary"/>
                    <xsl:variable name="family" select="DISS_surname"/>
                    <xsl:variable name="first" select="DISS_fname" as="xs:string"/>
                    <xsl:variable name="middle" select="DISS_middle" as="xs:string"/>
                    <xsl:variable name="suffix" select="DISS_suffix" as="xs:string"/>
                    <xsl:variable name="given" select="if ($middle ne '') then concat($first,' ',$middle) else $first"/>
                    <xsl:variable name="indirect" select="concat($family,', ',$given)"/>
                    <xsl:variable name="role" select="'author'"/>
                    <xsl:value-of
                        select="concat('ProQuest', $delimiter,$file, $delimiter, $indirect, $delimiter, $family, $delimiter, $given, $delimiter, $suffix, $delimiter, $role, '&#13;')"
                    />
                </xsl:for-each>
            </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
