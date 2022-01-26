<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:flvc="info:flvc/manifest/v1" xmlns:fsul="http://www.lib.fsu.edu"
    xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:mods="http://www.loc.gov/mods/v3" xmlns:mads="http://www.loc.gov/mads/v2"
    xmlns:dcterms="http://purl.org/dc/terms/" exclude-result-prefixes="fsul xs xsl xd" version="2.0">

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>November 19, 2021</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University Libraries</xd:p>
            <xd:p><xd:b>Title: </xd:b>ProQuest and PDF data to MODS</xd:p>
            <xd:p>Transformation of ProQuest metadata and harvetsed PDF data into MODS for FLVC-Islandora.</xd:p>
            <xd:p>This metadata is based on these standards: National Digital Library Theses and Dissertations Metadata Standards (NDLTD-MS);
                Resource, Description, and Access (RDA); and DLF/Aquifer Implementation Guidelines for Shareable MODS Records.</xd:p>
        </xd:desc>
    </xd:doc>

    <!-- Configure this transformation on the combined ProQuest metadata. -->
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*" xml:space="preserve"/>

    <xsl:include href="modules/caps.xsl"/>
    <xsl:include href="modules/titleMODS.xsl"/>
    <xsl:include href="modules/namesPQ2MODS_wURI.xsl"/>
    <xsl:include href="modules/subjects-proquest.xsl"/>

    <!-- **Global variables** -->
    <!-- Batch Variable -->
    <xsl:variable name="batch" select="'2021_Summer'"/>

    <!-- These paths change with each semester-->
    <xsl:variable name="pdfdata" select="document('source_pdfdata/source_pdfdata_2021Su.xml')/records/record"/>
    <xsl:variable name="committee" select="document('tables/ETD-NAF_mads_20211113.xml')/mads:madsCollection/mads:mads/mads:authority"/>
    <xsl:variable name="authors" select="document('tables/author_2020Su_Fa_2021Sp.xml')/authors/name"/>

    <!-- These paths refer to data tables -->
    <xsl:variable name="PQ-FSU-dept" select="document('tables/PQ-FSUdept.xml')/departments/department"/>
    <xsl:variable name="degrees-PQ" select="document('tables/degrees-PQ.xml')/degrees/degree"/>

    <xd:doc scope="template">
        <xd:desc>
            <xd:p><xd:b>Title: </xd:b>ProQuest and PDF data to MODS</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:template match="/diss">
        <mods:modsCollection xmlns="http://www.loc.gov/mods/v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:mods="http://www.loc.gov/mods/v3" xmlns:dcterms="http://purl.org/dc/terms/"
            xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/"
            xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-4.xsd">
            <xsl:for-each select="DISS_submission">
                <xsl:variable name="binary" select="DISS_content/DISS_binary"/>
                <xsl:variable name="embargo">
                    <xsl:value-of select="@embargo_code"/>
                </xsl:variable>
                
                <xsl:variable name="orcid">
                    <xsl:value-of select="DISS_authorship/DISS_author/DISS_orcid"/>
                </xsl:variable>
              
                <xsl:variable name="defenseDate">
                    <xsl:for-each select="$binary">
                        <xsl:variable name="defended" select="$pdfdata[filename = current()]/*[(self::defense)]"/>
                        <xsl:variable name="date">
                            <xsl:value-of select="replace($defended, ',', '')"/>
                        </xsl:variable>
                        <xsl:value-of select="fsul:dateName-to-yyyy-mm-dd($date)"/>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="College">
                    <xsl:for-each select="$binary">
                        <xsl:value-of select="$pdfdata[filename = current()]/*[(self::college)]"/>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="Submitted">
                    <xsl:for-each select="$binary">
                        <xsl:value-of select="$pdfdata[filename = current()]/*[(self::submitted)]"/>
                    </xsl:for-each>
                </xsl:variable>
                
                <xsl:variable name="Department">
                    <xsl:for-each select="$binary">
                        <xsl:value-of select="$pdfdata[filename = current()]/*[(self::department)]"/>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="Published">
                    <xsl:for-each select="$binary">
                        <xsl:value-of select="$pdfdata[filename = current()]/*[(self::published)]"/>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="Defended">
                    <xsl:for-each select="$binary">
                        <xsl:value-of select="$pdfdata[filename = current()]/*[(self::defense)]"/>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="defenseDate">
                    <xsl:variable name="date">
                        <xsl:value-of select="replace($Defended, ',', '')"/>
                    </xsl:variable>
                    <xsl:value-of select="fsul:dateName-to-yyyy-mm-dd($date)"/>
                </xsl:variable>

                <!-- This conditional limits the result to embargoed ($embargo gt '0') or unembargoed records ($embargo eq '0'). This is no lnoger used because the files are parsed into embargoed and not embargoes when the collection is split into individual files. -->
                <!--<xsl:if test="$embargo gt '0'">-->

                <mods:mods>
                    <!-- Note for filename matching -->
                    <mods:note displayLabel="filename">
                        <xsl:value-of select="$binary"/>
                    </mods:note>
                    <!-- Note for embargo identification -->
                    <mods:note displayLabel="embargo">
                        <xsl:value-of select="$embargo"/>
                    </mods:note>
                    <!-- **titleInfo** -->
                    <xsl:variable name="title">
                        <xsl:for-each select="$binary">
                            <xsl:value-of select="$pdfdata[filename = current()]/*[(self::title)]"/>
                        </xsl:for-each>
                    </xsl:variable>
                    <xsl:call-template name="subtitle-nonsort">
                        <xsl:with-param name="title" select="$title"/>
                    </xsl:call-template>
                    <!-- **name** -->
                    <!-- *Author name* -->
                    <xsl:call-template name="author_name">
                        <xsl:with-param name="binary" select="$binary"/>
                        <xsl:with-param name="authors" select="$authors"/>
                        <xsl:with-param name="orcid" select="$orcid"/>
                    </xsl:call-template>
                    <!-- *Committee members* -->
                    <xsl:call-template name="committee_names">
                        <xsl:with-param name="binary" select="$binary"/>
                        <xsl:with-param name="pdfdata" select="$pdfdata"/>
                        <xsl:with-param name="madsAuthority" select="$committee"/>
                    </xsl:call-template>
                    <!-- *Institution name* -->
                    <mods:name type="corporate" authority="naf" authorityURI="http://id.loc.gov/authorities/names/"
                        valueURI="http://id.loc.gov/authorities/names/n80126238">
                        <mods:namePart>Florida State University</mods:namePart>
                        <mods:role>
                            <mods:roleTerm authority="rda" type="text">degree granting institution</mods:roleTerm>
                        </mods:role>
                    </mods:name>
                    <!-- *College name* -->
                    <mods:name type="corporate" authority="local">
                        <mods:namePart>
                            <xsl:value-of select="$College"/>
                        </mods:namePart>
                        <mods:role>
                            <mods:roleTerm authority="local" type="text">degree granting college</mods:roleTerm>
                        </mods:role>
                    </mods:name>
                    <!-- Department name -->
                    <xsl:if test="$Department ne ''">
                        <mods:name type="corporate" authority="local">
                            <mods:namePart>
                                <xsl:value-of select="$Department"/>
                            </mods:namePart>
                            <mods:role>
                                <mods:roleTerm authority="local" type="text">degree granting department</mods:roleTerm>
                                <mods:roleTerm authority="marcrelator" type="code">dgg</mods:roleTerm>
                            </mods:role>
                        </mods:name>
                    </xsl:if>

                    <!-- **TypeOfResource** -->
                    <mods:typeOfResource>text</mods:typeOfResource>

                    <!-- **Genre-RDA** -->
                    <!-- Is rdacontent redundant or is it useful as a standard facet? Not all TypeOfResource terms has parallel RDA Content terms and vise versa.-->
                    <mods:genre authority="rdacontent">text</mods:genre>

                    <!-- **Genre-COAR** -->
                    <xsl:variable name="id"
                        select="
                            if (DISS_description/@type = 'doctoral') then
                                'c_db06'
                            else
                                'c_bdcc'"/>
                    <mods:genre authority="coar" authorityURI="http://purl.org/coar/resource_type" valueURI="http://purl.org/coar/resource_type/{$id}">
                        <xsl:value-of
                            select="
                                if (DISS_description/@type = 'doctoral') then
                                    'doctoral thesis'
                                else
                                    'master thesis'"
                        />
                    </mods:genre>

                    <!-- **originInfo** -->
                    <mods:originInfo>
                        <mods:place>
                            <mods:placeTerm type="text">Tallahassee, Florida</mods:placeTerm>
                        </mods:place>
                        <mods:dateIssued encoding="w3cdtf" keyDate="yes">
                            <xsl:value-of select="$Published"/>
                        </mods:dateIssued>
                        <mods:publisher>Florida State University</mods:publisher>
                        <issuance>monographic</issuance>
                    </mods:originInfo>

                    <!-- **language** -->
                    <mods:language>
                        <mods:languageTerm type="text">English</mods:languageTerm>
                        <mods:languageTerm type="code" authority="iso639-2b">eng</mods:languageTerm>
                    </mods:language>

                    <!-- **physicalDescription** -->
                    <mods:physicalDescription>
                        <mods:form authority="rdamedia" type="RDA media terms">computer</mods:form>
                        <mods:form authority="rdacarrier" type="RDA carrier terms">online resource</mods:form>
                        <mods:extent>
                            <xsl:value-of select="concat('1 online resource (', DISS_description/@page_count, ' pages)')"/>
                        </mods:extent>
                        <mods:digitalOrigin>born digital</mods:digitalOrigin>
                        <mods:internetMediaType>application/pdf</mods:internetMediaType>
                    </mods:physicalDescription>

                    <!-- **abstract** -->
                    <!-- accounts for non UTF_8 characters. See etd-107 for example -->
                    <xsl:for-each select="DISS_content/DISS_abstract">
                        <mods:abstract>
                            <xsl:variable name="para" select="normalize-space(DISS_para)" as="xs:string"/>
                            <xsl:variable name="abstract">
                                <xsl:value-of
                                    select="
                                        if (count(DISS_para) > 1) then
                                            normalize-space(string-join((DISS_para), ' '))
                                        else
                                            $para"
                                />
                            </xsl:variable>
                            <xsl:value-of
                                select="
                                if (starts-with(upper-case($abstract), 'ABSTRACT ')) then
                                substring-after($abstract, 'ABSTRACT ') else $abstract"
                            />
                        </mods:abstract>
                    </xsl:for-each>

                    <!-- **note** -->
                    <!-- This note is needed for catalog records but not Islandora -->
                    <!-- <note displayLabel="System requirements">Adobe Reader or other PDF viewer.</note>-->

                    <mods:note displayLabel="Submitted Note">
                        <xsl:value-of select="concat($Submitted, '.')"/>
                    </mods:note>
                    <!-- Do not use as of 2020-12-18 -->
<!--                    <mods:note displayLabel="Degree Awarded">
                        <xsl:value-of select="$Awarded"/>
                        <!-\-<xsl:value-of select="concat($Awarded, '.')"/>-\->
                    </mods:note>-->
                    <mods:note displayLabel="Date of Defense">
                        <!--  Use this for converting YYYY-MM-DD to Month Day, Year.<xsl:value-of
                        select="concat('Date of Defense: ',format-date($defense_date, '[MNn] [D], [Y]', 'en', (), ()),'.')"
                    />-->
                        <xsl:value-of select="concat($Defended, '.')"/>
                    </mods:note>
                    <xsl:variable name="keywords">
                        <xsl:value-of select="normalize-space(DISS_description/DISS_categorization/DISS_keyword)"/>
                    </xsl:variable>
                    <xsl:if test="DISS_description/DISS_categorization/DISS_keyword ne ''">
                        <mods:note displayLabel="Keywords">
                            <xsl:value-of select="$keywords"/>
                        </mods:note>
                    </xsl:if>
                    <mods:note displayLabel="Bibliography Note">Includes bibliographical references.</mods:note>
                    <!-- Committee members note, if needed. Delete any HTML tags. -->
                    <xsl:for-each select="DISS_content/DISS_binary">
                        <xsl:for-each select="$pdfdata[filename = current()]/*[(self::committee)]">
                            <mods:note displayLabel="Advisory Committee">
                                <xsl:for-each select="member[position() ne last()]">
                                    <xsl:value-of select="concat(name, ', ', role, '; ')"/>
                                </xsl:for-each>
                                <xsl:for-each select="member[last()]">
                                    <xsl:value-of select="concat(name, ', ', role, '.')"/>
                                </xsl:for-each>
                            </mods:note>
                        </xsl:for-each>
                    </xsl:for-each>

                    <!-- **subject** -->
                    <xsl:call-template name="subjects_proquest"/>

                    <!-- **classification** -->

                    <!-- **identifier** -->
                    <mods:identifier type="IID">
                        <xsl:value-of select="concat($batch, '_', substring-before($binary, '.pdf'))"/>
                    </mods:identifier>


                    <!--                    
                        <!-\- DOI string is UNIX (POSIX) Timestamp  -\->
                    <xsl:variable name="timestamp"
                        select="for $i in (current-dateTime()-xs:dateTime('1970-01-01T00:00:00Z')) 
                        return ((days-from-duration($i)*86400)+(hours-from-duration($i)*3600)+(minutes-from-duration($i)*60)+(seconds-from-duration($i)))"/>-->

                    <!--    <mods:identifier type="doi"><xsl:value-of select="concat('10.17125/fsu.etd.', substring-before($binary,'.pdf'))"/></mods:identifier>-->

                    <!-- **location** SYSTEM-SUPPLIED -->
                    <!--
                        <location displayLabel="purl">
                            <url>PURL</url>
                        </location>
                    -->

                    <!-- **accessCondition** -->
                    <!-- If needed -->
                    <!--
                        <accessCondition>
                        <xsl:value-of select="concat('This work was originally embargoed until ',format-date($embargo_date, '[MNn] [D], [Y]', 'en', (), ()),'.')"/>
                        </accessCondition>
                    -->

                    <!-- **extension** -->
                    <mods:extension>

                        <!-- NDLTD Extension fields -->
                        <etd:degree>
                            <xsl:for-each select="DISS_description/DISS_degree">
                                <etd:name>
                                    <xsl:value-of select="$degrees-PQ[PQ-degree = current()]/*[(self::ETD-name)]"/>
                                </etd:name>
                            </xsl:for-each>
                            <etd:level>
                                <xsl:value-of
                                    select="concat(upper-case(substring(DISS_description/@type, 1, 1)), substring(DISS_description/@type, 2))"/>
                            </etd:level>
                            <xsl:for-each select="DISS_description/DISS_institution/DISS_inst_contact">
                                <etd:discipline>
                                    <xsl:value-of select="$PQ-FSU-dept[deptPQ = current()]/*[(self::ETD-discipline)]"/>
                                </etd:discipline>
                            </xsl:for-each>
                        </etd:degree>

                        <!-- FLVC Extension fields -->
                        <flvc:flvc>
                            <flvc:owningInstitution>FSU</flvc:owningInstitution>
                            <flvc:submittingInstitution>FSU</flvc:submittingInstitution>
                        </flvc:flvc>
                    </mods:extension>

                    <!-- **recordInfo** -->
                    <mods:recordInfo>
                        <mods:recordCreationDate encoding="w3cdtf">
                            <xsl:value-of select="current-dateTime()"/>
                        </mods:recordCreationDate>
                        <descriptionStandard>rda</descriptionStandard>
                    </mods:recordInfo>
                </mods:mods>
            </xsl:for-each>
        </mods:modsCollection>
    </xsl:template>

</xsl:stylesheet>
