<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fs="http://www.lib.fsu.edu" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd fs" version="2.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>June 4, 2016</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Edit Data</xd:p>
            <xd:p>This transformation edits data to delete unwanted data, add missing data, or correct known capitalization and spelling errors</xd:p>
        </xd:desc>
    </xd:doc>

    <!-- Generic identity template -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- **Delete unwanted data** -->

    <xsl:template match="xml/lines/line[starts-with(upper-case(.), 'DR.')]" priority="4">
        <line>
            <xsl:value-of select="substring-after(upper-case(.), 'DR. ')"/>
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[starts-with(upper-case(.), 'THE FLORIDA STATE UNIVERSITY')]" priority="5">
        <line>
            <xsl:value-of
                select="
                    if (starts-with(., 'THE ')) then
                        replace(., 'THE FLORIDA ', 'FLORIDA ')
                    else
                        replace(., 'The Florida ', 'Florida ')"
            />
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[matches(., '_+')]" priority="6">
        <line>
            <xsl:value-of select="normalize-space(replace(., '_', ''))"/>
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[starts-with(., '(signed) ')]" priority="7">
        <line>
            <xsl:value-of select="normalize-space(replace(., '(signed) ', ''))"/>
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[contains(., ' Reserved The members ')]" priority="8">
        <line>
            <xsl:value-of select="substring-after(., 'Reserved ')"/>
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[matches(., 'Professor Directing the')]" priority="9">
        <line>
            <xsl:value-of select="normalize-space(replace(., 'Professor Directing the', 'Professor Directing'))"/>
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[starts-with(upper-case(.), 'COPYRIGHT') and contains(upper-case(.), 'MEMBERS')]" priority="10">
        <line>
            <xsl:value-of select="normalize-space(replace(., substring-before(., 'The members'), ''))"/>
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[starts-with(upper-case(.), 'BY ')]" priority="11">
        <line>
            <xsl:value-of
                select="
                    if (starts-with(., 'BY ')) then
                        substring-after(., 'BY ')
                    else
                        substring-after(., 'By ')"
            />
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[ends-with(., '. The members of the supervisory committee were:')]" priority="12">
        <line>
            <xsl:value-of select="replace(., ' The members of the supervisory committee were:', '')"/>
        </line>
    </xsl:template>

    <!-- **Add missing data** -->

    <xsl:template match="xml/lines/line[starts-with(upper-case(.), 'THE MEMBERS OF THE COMMITTEE') and (contains(., ' on') and not(contains(., ' defended')))]" priority="13">
        <line>
            <xsl:value-of select="replace(., ' on', ' defended on')"/>
        </line>
    </xsl:template>

    <!-- **Standardize roles** -->

    <xsl:template match="xml/lines/line[matches(., 'Major Professor, Dissertation Director')]" priority="14">
        <line>
            <xsl:value-of select="normalize-space(replace(., 'Major Professor, Dissertation Director', 'Professor Directing Dissertation'))"/>
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[matches(., 'Major Professor')]" priority="15">
        <line>
            <xsl:value-of select="normalize-space(replace(., 'Major Professor', 'Professor Directing Dissertation'))"/>
        </line>
    </xsl:template>

    <!-- **Correct capitatization** -->

    <xsl:template match="xml/lines/line[2]" priority="16">
        <line>
            <xsl:copy-of select="upper-case(.)"/>
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[matches(., 'Degree awarded')]" priority="17">
        <line>
            <xsl:value-of select="normalize-space(replace(., 'awarded', 'Awarded'))"/>
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[contains(., ' In partial ')]" priority="18">
        <line>
            <xsl:value-of select="replace(., ' In partial ', ' in partial ')"/>
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[contains(., ' Submitted ')]" priority="19">
        <line>
            <xsl:value-of select="replace(., ' Submitted ', ' submitted ')"/>
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[starts-with(., 'a Dissertation ')]" priority="20">
        <line>
            <xsl:value-of select="replace(., 'a Dissertation ', 'A Dissertation ')"/>
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[starts-with(., 'a Thesis ')]" priority="21">
        <line>
            <xsl:value-of select="replace(., 'a Thesis ', 'A Thesis ')"/>
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[starts-with(., 'a Treatise')]" priority="22">
        <line>
            <xsl:value-of select="replace(., 'a Treatise', 'A Treatise')"/>
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[contains(., ' dissertation ')]" priority="23">
        <line>
            <xsl:value-of select="replace(., ' dissertation ', ' Dissertation ')"/>
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[contains(., ' thesis ')]" priority="24">
        <line>
            <xsl:value-of select="replace(., ' thesis ', ' Thesis ')"/>
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[contains(., ' treatise ')]" priority="25">
        <line>
            <xsl:value-of select="replace(., ' treatise ', ' Treatise ')"/>
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[matches(., 'Co-directing')]" priority="26">
        <line>
            <xsl:value-of select="normalize-space(replace(., 'Co-directing', 'Co-Directing'))"/>
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[contains(upper-case(.), 'IN PARTICULAR FULFILLMENT')]" priority="27">
        <line>
            <xsl:value-of
                select="
                    if (contains(., 'In particular')) then
                        replace(., 'In particular', 'in partial')
                    else
                        if (contains(., 'in particular')) then
                            replace(., 'particular', 'partial')
                        else
                            ()"
            />
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[contains(upper-case(.), 'IN FULFILLMENT')]" priority="28">
        <line>
            <xsl:value-of select="replace(., 'in fulfillment', 'in partial fulfillment')"/>
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[contains(upper-case(.), 'DISSERTATION TO BE')]" priority="29">
        <line>
            <xsl:value-of
                select="
                    if (contains(., 'Dissertation to be')) then
                        replace(., 'Dissertation to be', 'Dissertation')
                    else
                        if (contains(., 'dissertation to be')) then
                            replace(., 'dissertation to be', 'Dissertation')
                        else
                            ()"
            />
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[contains(upper-case(.), 'DISSERTATION PRESENTED')]" priority="30">
        <line>
            <xsl:value-of
                select="
                    if (contains(., 'Dissertation presented')) then
                        replace(., 'presented', 'submitted')
                    else
                        if (contains(., 'dissertation presented')) then
                            replace(., 'dissertation presented', 'Dissertation submitted')
                        else
                            ()"
            />
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[contains(upper-case(.), 'DISSERTATION IN PRESS')]" priority="31">
        <line>
            <xsl:value-of
                select="
                    if (contains(., 'Dissertation in press')) then
                        replace(., 'in press', 'submitted')
                    else
                        if (contains(., 'dissertation in press')) then
                            replace(., 'dissertation in press', 'Dissertation submitted')
                        else
                            ()"
            />
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[contains(upper-case(.), 'THESIS TO BE')]" priority="32">
        <line>
            <xsl:value-of
                select="
                    if (contains(., 'Thesis to be')) then
                        replace(., 'Thesis to be', 'Thesis')
                    else
                        if (contains(., 'thesis to be')) then
                            replace(., 'thesis to be', 'Thesis')
                        else
                            ()"
            />
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[contains(upper-case(.), 'THESIS PRESENTED')]" priority="33">
        <line>
            <xsl:value-of
                select="
                    if (contains(., 'Thesis presented')) then
                        replace(., 'presented', 'submitted')
                    else
                        if (contains(., 'thesis presented')) then
                            replace(., 'thesis presented', 'Thesis submitted')
                        else
                            ()"
            />
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[contains(upper-case(.), 'THESIS IN PRESS')]" priority="34">
        <line>
            <xsl:value-of
                select="
                    if (contains(., 'Thesis in press')) then
                        replace(., 'in press', 'submitted')
                    else
                        if (contains(., 'thesis in press')) then
                            replace(., 'thesis in press', 'Thesis submitted')
                        else
                            ()"
            />
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[contains(upper-case(.), 'TREATISE TO BE')]" priority="35">
        <line>
            <xsl:value-of
                select="
                    if (contains(., 'Treatise to be')) then
                        replace(., 'Treatise to be', 'Treatise')
                    else
                        if (contains(., 'treatise to be')) then
                            replace(., 'treatise to be', 'Treatise')
                        else
                            ()"
            />
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[contains(upper-case(.), 'TREATISE PRESENTED')]" priority="36">
        <line>
            <xsl:value-of
                select="
                    if (contains(., 'Treatise presented')) then
                        replace(., 'presented', 'submitted')
                    else
                        if (contains(., 'treatise presented')) then
                            replace(., 'treatise presented', 'Treatise submitted')
                        else
                            ()"
            />
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[contains(upper-case(.), 'TREATISE IN PRESS')]" priority="37">
        <line>
            <xsl:value-of
                select="
                    if (contains(., 'Treatise in press')) then
                        replace(., 'in press', 'submitted')
                    else
                        if (contains(., 'treatise in press')) then
                            replace(., 'treatise in press', 'Treatise submitted')
                        else
                            ()"
            />
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[contains(., 'Semester Approved:')]" priority="38">
        <line>
            <xsl:value-of select="replace(., 'Semester Approved:', 'Semester Awarded:')"/>
        </line>
    </xsl:template>

    <!-- **Correct misspellings** -->

    <xsl:template match="xml/lines/line[matches(., 'Tretise')]" priority="39">
        <line>
            <xsl:value-of select="normalize-space(replace(., 'Tretise', 'Treatise'))"/>
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[matches(upper-case(.), 'UNIVERISTY')]" priority="40">
        <line>
            <xsl:value-of select="normalize-space(replace(upper-case(.), 'UNIVERISTY', 'UNIVERSITY'))"/>
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[matches(., 'Disseration')]" priority="41">
        <line>
            <xsl:value-of select="normalize-space(replace(., 'Disseration', 'Dissertation'))"/>
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[matches(., 'Committtee')]" priority="42">
        <line>
            <xsl:value-of select="normalize-space(replace(., 'Committte', 'Committee'))"/>
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[matches(upper-case(.), 'UNIVESITY')]" priority="43">
        <line>
            <xsl:value-of select="normalize-space(replace(upper-case(.), 'UNIVESITY', 'UNIVERSITY'))"/>
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[matches(., 'CoDirecting')]" priority="44">
        <line>
            <xsl:value-of select="normalize-space(replace(., 'CoDirecting', 'Co-Directing'))"/>
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[matches(., 'Commitee')]" priority="45">
        <line>
            <xsl:value-of select="normalize-space(replace(., 'Commitee', 'Committee'))"/>
        </line>
    </xsl:template>

    <xsl:template match="xml/lines/line[matches(., 'onOctober')]" priority="46">
        <line>
            <xsl:value-of select="normalize-space(replace(., 'onOctober', 'on October'))"/>
        </line>
    </xsl:template>

</xsl:stylesheet>
