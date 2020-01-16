<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mads="http://www.loc.gov/mads/v2"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="mads xlink xs xsi"
    version="2.0">

    <!-- Last Updated: October 13, 2019 -->

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xsl:variable name="authority" select="doc('../modules/tables/committee_2019Sp.xml')/names/name"/>
  
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/records/record/committee">
        <xsl:variable name="file" select="../file"/>
        <xsl:for-each select=".">
            <committee>
                <xsl:for-each select="member">                               
                    <xsl:variable name="position" select="string(position())"/>
                        <xsl:variable name="uri">
                            <xsl:for-each select="$authority[File = $file and Position = $position]">
                                <xsl:value-of select="ID"/>
                            </xsl:for-each>
                        </xsl:variable>
                    <member>
                        <xsl:copy-of select="name"/>
                        <xsl:copy-of select="role"/>
                        <uri>
                            <xsl:value-of select="$uri"/>
                        </uri>
                    </member>
                </xsl:for-each>
            </committee>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
