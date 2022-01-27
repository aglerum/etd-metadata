<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mads="http://www.loc.gov/mads/v2"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="mads xlink xs xsi"
    version="2.0">

    <!-- Last Updated: January 27, 2022 -->

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xsl:variable name="authority" select="doc('pdfdata_names_2020_BC_Su_Fa.xml')/names/name"/>

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>


    <!-- 
    Source Example
    <names>
         <name>
            <file>Dorai_fsu_0071E_15523.pdf</file>
            <direct>Sudhir Aggarwal</direct>
            <role>Professor Directing Dissertation</role>
            <URI>http://id.loc.gov/authorities/names/nr92012137</URI>
        </name>
</names>

    
    -->

    <xsl:template match="/records/record/committee">
        <xsl:variable name="file" select="../filename"/>
        <xsl:for-each select=".">
            <committee>
                <xsl:for-each select="member">
                    <xsl:variable name="Name" select="name"/>
                    <xsl:variable name="uri">
                        <xsl:for-each select="$authority[file = $file and direct = $Name]">
                            <xsl:value-of select="URI"/>
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
