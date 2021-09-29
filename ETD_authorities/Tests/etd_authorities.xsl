<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:marc="http://www.loc.gov/MARC21/slim" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd" exclude-result-prefixes="xs xd marc" version="2.0">

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>September 29, 2021</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University Libraries</xd:p>
            <xd:p><xd:b>Title: </xd:b>ProQuest and PDF names to MARC authority file</xd:p>
        </xd:desc>
    </xd:doc>

    <!-- Configure this transformation on the folder of ProQuest metadata to be processed. -->
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*" xml:space="preserve"/>

    <xd:doc scope="template">
        <xd:desc>
            <xd:p><xd:b>Title: </xd:b>ProQuest and PDF names to MARC authority file</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:variable name="batch" select="'2020_Spring'"/>

    <xsl:template match="/authors">
        <marc:collection xmlns:marc="http://www.loc.gov/MARC21/slim" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd">
            <xsl:for-each select="name">
                <xsl:variable name="indirect_name" select="concat(family, ', ',given)"/>
                <xsl:variable name="IID">
                    <xsl:value-of select="concat($batch, '_', substring-before(filename, '.pdf'))"/>
                </xsl:variable>
                <marc:record>
                    <marc:leader>     ntm  22     ua 4500</marc:leader>
                    <marc:controlfield tag="008">000000n| azannaabn          |n aaa     c</marc:controlfield>
                    <marc:datafield tag="040" ind1=" " ind2=" ">
                        <marc:subfield code="a">FTaSU</marc:subfield>
                        <marc:subfield code="b">eng</marc:subfield>
                        <marc:subfield code="e">rda</marc:subfield>
                        <marc:subfield code="c">FTaSU</marc:subfield>
                    </marc:datafield>
                    <marc:datafield tag="100" ind1="1" ind2=" ">
                        <marc:subfield code="a"><xsl:value-of select="$indirect_name"/></marc:subfield>
                    </marc:datafield>
                    <marc:datafield tag="370" ind1=" " ind2=" ">
                        <marc:subfield code="a">[PLACE]</marc:subfield>
                    </marc:datafield>
                    <marc:datafield tag="372" ind1=" " ind2=" ">
                        <marc:subfield code="a">[FIELD]</marc:subfield>
                    </marc:datafield>
                    <marc:datafield tag="373" ind1=" " ind2=" ">
                        <marc:subfield code="a">Florida State University</marc:subfield>
                        <marc:subfield code="2">naf</marc:subfield>
                    </marc:datafield>
                    <marc:datafield tag="377" ind1=" " ind2=" ">
                        <marc:subfield code="a">eng</marc:subfield>
                    </marc:datafield>
                    <marc:datafield tag="670" ind1=" " ind2=" ">
                        <marc:subfield code="a"><xsl:value-of select="concat(title,' 2020:')"/></marc:subfield>
                        <marc:subfield code="b"><xsl:value-of select="concat('title page', substring-after(pdf_name,'Source PDFdata:'))"/></marc:subfield>
                        <marc:subfield code="u"><xsl:value-of select="concat('http://purl.flvc.org/fsu/fd/',$IID)"/></marc:subfield>
                    </marc:datafield>
                    <marc:datafield tag="670" ind1=" " ind2=" ">
                        <marc:subfield code="a"><xsl:value-of select="'Proquest metadata file received at FSU, 2020:'"/></marc:subfield>
                        <marc:subfield code="b"><xsl:value-of select="concat('author name in metadata', substring-after(pq_name,'Source ProQuest:'))"/></marc:subfield>
                    </marc:datafield>
                </marc:record>
                
            </xsl:for-each>
        </marc:collection>
    </xsl:template>

</xsl:stylesheet>
