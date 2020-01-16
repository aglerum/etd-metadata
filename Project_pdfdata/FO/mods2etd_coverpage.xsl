<?xml version="1.0" encoding="UTF-8"?>
<!-- Last updated: April 17, 2019. Annie Glerum -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mods="http://www.loc.gov/mods/v3" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-4.xsd" version="2.0" exclude-result-prefixes="xs">

    <xsl:output indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/mods:mods">
        <xsl:variable name="title" select="mods:titleInfo[1]/mods:title"/>
        <xsl:variable name="subtitle"
            select="
            if (mods:titleInfo[1]/mods:subTitle) then
            mods:titleInfo[1]/mods:subTitle
                else
                    ()"/>
        <xsl:variable name="nonsort"
            select="
                if (mods:titleInfo[1]/mods:nonSort) then
                    mods:titleInfo[1]/mods:nonSort
                else
                    ()"/>
        <xsl:variable name="title-string">
            <xsl:value-of
                select="
                if (mods:titleInfo[1]/mods:nonSort and mods:titleInfo[1]/mods:subTitle) then
                concat($nonsort, ' ', $title, if (not(ends-with($title,'?') or ends-with($title,'!'))) then ': ' else '', $subtitle)
                    else
                    if (mods:titleInfo[1]/mods:nonSort) then
                            concat($nonsort, ' ', $title)
                        else
                        if (mods:titleInfo[1]/mods:subTitle) then
                                concat($title, ': ', $subtitle)
                            else
                                $title
                    "
            />
        </xsl:variable>
        <xsl:variable name="author-string">
            <xsl:for-each select="mods:name[mods:role/mods:roleTerm[text() = 'author']]">
                <xsl:variable name="given"
                    select="
                        if (mods:namePart[@type = 'given']) then
                            mods:namePart[@type = 'given']
                        else
                            ''"
                    as="xs:string"/>
                <xsl:variable name="family"
                    select="
                        if (mods:namePart[@type = 'family']) then
                            mods:namePart[@type = 'family']
                        else
                            ''"
                    as="xs:string"/>
                <xsl:variable name="suffix"
                    select="
                        if (mods:namePart[@type = 'termsOfAddress']) then
                            mods:namePart[@type = 'termsOfAddress']
                        else
                            ''"
                    as="xs:string"/>
                <xsl:value-of
                    select="
                        if (mods:namePart[@type = 'termsOfAddress']) then
                            concat($given, ' ', $family, ' ', $suffix)
                        else
                            concat($given, ' ', $family)"
                />
            </xsl:for-each>
        </xsl:variable>

        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

            <fo:layout-master-set>
                <fo:simple-page-master page-height="11in" page-width="8.5in" master-name="coverpage">
                    <fo:region-body region-name="title" margin="1in"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="coverpage">
                <!--<fo:flow flow-name="title" font-family="'any'" font-style="normal" text-indent="0pt">-->
                <fo:flow flow-name="title" font-family="'Cambria'" font-style="normal" text-indent="0pt">
                     
                    <!--<fo:block-container >-->
                        <fo:block color="#782F40" padding-top="0.25in" margin-left="0" text-align-last="left">
                            <fo:inline font-size="32pt" font-weight="bold" text-decoration="none">Florida State University Libraries</fo:inline>
                        </fo:block>
                    <!--</fo:block-container>-->
                    <fo:block color="#782F40" padding-left="0pt" >
                        <fo:leader leader-length="100%" leader-pattern="rule" rule-style="solid"
                            rule-thickness=".2mm"/>
                    </fo:block>

                    <!-- ETDs only -->
                    <fo:block color="black" font-size="12pt" font-weight="normal" padding-top="7pt" text-align-last="justify">
                        <fo:inline>Electronic Theses, Treatises and Dissertations</fo:inline>
                        <fo:leader leader-pattern="space"/>
                        <fo:inline>The Graduate School</fo:inline>
                    </fo:block>
                    <fo:block color="#782F40" padding-left="0pt" >
                        <fo:leader leader-length="100%" leader-pattern="rule" rule-style="solid"
                            rule-thickness=".2mm"/>
                    </fo:block>
                    <!--<fo:block>
                        <fo:leader color="#782F40" leader-length="100%" leader-pattern="rule" padding-left="0pt" rule-style="solid"
                            rule-thickness=".2mm"/>
                    </fo:block>-->
                    <fo:block-container color="black" padding-top="20pt" padding-left="15pt">
                        <fo:block font-size="13pt"><xsl:value-of select="mods:originInfo/mods:dateIssued"/></fo:block>
                        <fo:block font-size="26pt" line-height="24pt" padding-top="10pt"><xsl:value-of select="$title-string"/></fo:block>
                        <fo:block font-size="13pt" padding-top="11pt"><xsl:value-of select="$author-string"/></fo:block>
                    </fo:block-container>
                    <fo:block-container absolute-position="fixed" top="220mm" left="28mm" right="28mm">
                        <fo:block text-align="center" padding-bottom="0.25in">
                            <fo:external-graphic content-height="1.00in" content-width="scale-to-fit" src="assets/fsuseal.png"/>
                        </fo:block>
                        <fo:block>
                            <fo:leader color="#782F40" leader-length="100%" leader-pattern="rule" padding-left="0pt" rule-style="solid"
                                rule-thickness=".2mm"/>
                        </fo:block>
                        <fo:block font-size="8pt" padding-left="15pt" text-align="center">Follow this and additional works at the <fo:basic-link
                                color="#782F40" external-destination="http://diginole.lib.fsu.edu/">DigiNole: FSU's Digital
                            Repository</fo:basic-link>. For more information, please contact <fo:basic-link color="#782F40"
                                external-destination="mailto:lib-ir@fsu.edu">lib-ir@fsu.edu</fo:basic-link>
                        </fo:block>
                    </fo:block-container>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>

    </xsl:template>
</xsl:stylesheet>
