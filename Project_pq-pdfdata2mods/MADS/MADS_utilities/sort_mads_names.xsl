<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mads="http://www.loc.gov/mads/v2"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="xml" indent="yes" xml:space="default" encoding="UTF-8"/>
    <xsl:preserve-space elements="text"/>

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/mads:madsCollection">
        <mads:madsCollection xmlns:mads="http://www.loc.gov/mads/v2" xmlns:xlink="http://www.w3.org/1999/xlink"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://www.loc.gov/mads/v2 http://www.loc.gov/standards/mads/mads-2-1.xsd">
        <xsl:for-each select="mads:mads">
            <xsl:sort select="mads:authority/mads:name/mads:namePart[@type = 'family']"/>
            <xsl:sort select="mads:authority/mads:name/mads:namePart[@type = 'given']"/>
            <xsl:copy-of select="."/>
        </xsl:for-each>
        </mads:madsCollection>
    </xsl:template>

</xsl:stylesheet>
