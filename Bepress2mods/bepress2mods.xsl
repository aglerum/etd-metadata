<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:fsul="http://www.lib.fsu.edu"
    xmlns:mods="http://www.loc.gov/mods/v3" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/" exclude-result-prefixes="xs xd fsul" version="2.0">

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>April 4, 2017</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University Libraries</xd:p>
            <xd:p><xd:b>Title: </xd:b>Bepress to MODS</xd:p>
            <xd:p>Created for migrating Bepress metadata to FLVC-Islandora.</xd:p>
            <xd:p>This metadata is based on these standards: National Digital Library Theses and Dissertations Metadata Standards (NDLTD-MS); Resource, Description, and Access (RDA); and DLF/Aquifer
                Implementation Guidelines for Shareable MODS Records.</xd:p>
        </xd:desc>
    </xd:doc>

    <!-- Configure this transformation on the folder of Bepress metadata to be processed. -->

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xsl:include href="modules/caps.xsl"/>
    <xsl:include href="modules/titleMODS.xsl"/>
    <xsl:include href="modules/namesBP2MODS.xsl"/>
    <xsl:include href="modules/disciplines.xsl"/>

    <!-- ### Global variables -->
    <xsl:variable name="bepress" select="/documents/document"/>
    
    <!-- Note: This path changes with each batch -->
    <xsl:variable name="pdfdata" select="document('/Users/Annie/etd-metadata/source_files/source_pdfdata_example.xml')/records/record"/>

    <!-- Note: This path changes with each batch -->
    <xsl:variable name="naf" select="document('modules/tables/authors.xml')/names/name"/>

    <xsl:template match="/">
        <mods:modsCollection xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://www.loc.gov/mods/v3"
            xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-4.xsd" xmlns:xlink="http://www.w3.org/1999/xlink">
            <xsl:for-each select="documents/document">

                <!-- ### Bepress metadata variables -->
                <xsl:variable name="embargo_date" select="xs:date(substring(fields/field[@name = 'embargo_date']/value, 1, 10))"/>
                <xsl:variable name="department">
                    <xsl:value-of
                        select="
                            if (fields/field[@name = 'department']) then
                                fields/field[@name = 'department']/value
                            else
                                ()"
                    />
                </xsl:variable>
                <xsl:variable name="pubDate" select="substring(publication-date, 1, 10)"/>

                <!-- ### pdfdata metadata variables -->

                <!-- If college name is needed -->
                <!-- <xsl:variable name="college">
                    <xsl:for-each select="submission-path">
                        <xsl:value-of select="$pdfdata[number=current()]/*[(self::college)]"/>
                    </xsl:for-each>
                </xsl:variable>-->

                <xsl:variable name="submitted">
                    <xsl:for-each select="submission-path">
                        <xsl:value-of select="$pdfdata[number = current()]/*[(self::submitted)]"/>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="awarded">
                    <xsl:for-each select="submission-path">
                        <xsl:value-of select="$pdfdata[number = current()]/*[(self::awarded)]"/>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="defense">
                    <xsl:for-each select="submission-path">
                        <xsl:value-of select="$pdfdata[number = current()]/*[(self::defense)]"/>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="pdf-dept">
                    <xsl:value-of select="substring-after(substring-before($submitted, ' in partial fulfillment'), 'submitted to the ')"/>
                </xsl:variable>

                <mods:mods version="3.4">
                    <mods:note displayLabel="path">
                        <xsl:value-of
                            select="
                                if (string-length(substring-after(submission-path, '/')) eq 1) then
                                    concat(substring-before(submission-path, '/'), '/000', substring-after(submission-path, '/'))
                                else
                                    if (string-length(substring-after(submission-path, '/')) eq 2) then
                                        concat(substring-before(submission-path, '/'), '/00', substring-after(submission-path, '/'))
                                    else
                                        if (string-length(substring-after(submission-path, '/')) eq 3) then
                                            concat(substring-before(submission-path, '/'), '/0', substring-after(submission-path, '/'))
                                        else
                                            submission-path"
                        />
                    </mods:note>
                    <!-- **titleInfo** -->
                    <xsl:for-each select="submission-path">
                        <xsl:variable name="title">
                            <xsl:variable name="pdfdata-title">
                                <xsl:value-of select="$pdfdata[number = current()]/*[(self::title)]"/>
                            </xsl:variable>
                            <xsl:value-of select="fsul:characters2utf8($pdfdata-title)"/>
                        </xsl:variable>
                        <xsl:call-template name="subtitle-nonsort">
                            <xsl:with-param name="title" select="$title"/>
                        </xsl:call-template>
                    </xsl:for-each>

                    <!-- **name** -->
                    <!-- *Author name* -->

                    <xsl:call-template name="author_name">
                        <xsl:with-param name="bepress" select="$bepress"/>
                        <xsl:with-param name="pdfdata" select="$pdfdata"/>
                    </xsl:call-template>

                    <!-- Committee members -->
                    <xsl:call-template name="committee_names">
                        <xsl:with-param name="bepress" select="$bepress"/>
                        <xsl:with-param name="pdfdata" select="$pdfdata"/>
                    </xsl:call-template>

                    <!-- Department names. Note that the ProQuest names are converted to Bepress names since Bepress names were the official names as of 2014. -->
                    <mods:name type="corporate" authority="local">
                        <mods:namePart>
                            <xsl:value-of select="$department"/>
                        </mods:namePart>
                        <mods:role>
                            <mods:roleTerm authority="local" type="text">degree granting department</mods:roleTerm>
                        </mods:role>
                    </mods:name>

                    <!-- Institution name -->
                    <mods:name type="corporate" authority="naf" authorityURI="http://id.loc.gov/authorities/names/" valueURI="http://id.loc.gov/authorities/names/n80126238‏">
                        <mods:namePart>Florida State University</mods:namePart>
                        <mods:role>
                            <mods:roleTerm authority="rda" type="text">degree granting institution</mods:roleTerm>
                        </mods:role>
                    </mods:name>

                    <!-- **TypeOfResource** -->
                    <mods:typeOfResource>text</mods:typeOfResource>

                    <!-- **Genre** -->
                    <!-- Is rdacontent redundant or is it useful as a standard facet? Not all TypeOfResource terms has parallel RDA Content terms and vise versa.-->
                    <mods:genre authority="rdacontent">text</mods:genre>

                    <!-- **originInfo** -->
                    <mods:originInfo>
                        <mods:place>
                            <mods:placeTerm type="text">Tallahassee, Florida</mods:placeTerm>
                        </mods:place>
                        <mods:dateIssued encoding="w3cdtf" keyDate="yes">
                            <xsl:value-of select="substring($awarded, string-length($awarded) - 3, 4)"/>
                        </mods:dateIssued>
                        <mods:publisher>Florida State University</mods:publisher>
                        <mods:issuance>monographic</mods:issuance>
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
                        <mods:extent>1 online resource</mods:extent>
                        <mods:digitalOrigin>born digital</mods:digitalOrigin>
                        <mods:internetMediaType>application/pdf</mods:internetMediaType>
                    </mods:physicalDescription>


                    <!-- **abstract** -->
                    <xsl:if test="abstract">
                        <xsl:for-each select="abstract">
                            <abstract>
                                <xsl:variable name="strip-tags-abstract">
                                    <xsl:variable name="replace-ligatures">
                                        <xsl:value-of select="fsul:replace-ligatures(.)"/>
                                    </xsl:variable>
                                    <xsl:value-of select="fsul:strip-tags($replace-ligatures)"/>
                                </xsl:variable>
                                <xsl:value-of select="normalize-space(fsul:characters2utf8(fsul:convert-curly($strip-tags-abstract)))"/>
                            </abstract>
                        </xsl:for-each>
                    </xsl:if>

                    <!-- **note** -->
                    <xsl:if test="$submitted ne ''">
                        <mods:note displayLabel="Submitted Note">
                            <xsl:value-of select="concat($submitted, '.')"/>
                        </mods:note>

                    </xsl:if>
                    <xsl:if test="$awarded ne ''">
                        <mods:note displayLabel="Degree Awarded">
                            <xsl:value-of select="concat($awarded, '.')"/>
                        </mods:note>
                    </xsl:if>

                    <mods:note displayLabel="Date of Defense">
                        <!--  Use this for converting YYYY-MM-DD to Month Day, Year.<xsl:value-of
                        select="concat('Date of Defense: ',format-date($defense_date, '[MNn] [D], [Y]', 'en', (), ()),'.')"
                    />-->
                        <xsl:value-of select="concat($defense, '.')"/>
                    </mods:note>

                    <xsl:variable name="keywords">
                        <xsl:variable name="keyword">
                            <xsl:for-each select="keywords/keyword">
                                <xsl:value-of select="concat(., ', ')"/>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:variable name="keyword-string">
                            <xsl:value-of select="substring($keyword, 1, string-length($keyword) - 2)"/>
                        </xsl:variable>
                        <xsl:variable name="keyword-convert-curly">
                            <xsl:value-of select="fsul:convert-curly($keyword-string)"/>
                        </xsl:variable>
                        <xsl:value-of select="fsul:characters2utf8($keyword-convert-curly)"/>
                    </xsl:variable>

                    <mods:note displayLabel="Keywords">
                        <xsl:value-of select="$keywords"/>
                    </mods:note>

                    <mods:note displayLabel="Bibliography Note">Includes bibliographical references.</mods:note>

                    <!-- Committee members note, if needed. Delete any HTML tags. -->
                    <xsl:for-each select="submission-path">
                        <xsl:for-each select="$pdfdata[number = current()]/*[(self::committee)]">
                            <mods:note displayLabel="Advisory Committee">
                                <xsl:value-of
                                    select="
                                        if (count(member) = 1) then
                                            concat(member[1]/name, ', ', member[1]/role, '.')
                                        else
                                            if (count(member) = 2) then
                                                concat(member[1]/name, ', ', member[1]/role, '; ', member[2]/name, ', ', member[2]/role, '.')
                                            else
                                                if (count(member) = 3) then
                                                    concat(member[1]/name, ', ', member[1]/role, '; ', member[2]/name, ', ', member[2]/role, '; ', member[3]/name, ', ', member[3]/role, '.')
                                                else
                                                    if (count(member) = 4) then
                                                        concat(member[1]/name, ', ', member[1]/role, '; ', member[2]/name, ', ', member[2]/role, '; ', member[3]/name, ', ', member[3]/role, '; ', member[4]/name, ', ', member[4]/role, '.')
                                                    else
                                                        if (count(member) = 5) then
                                                            concat(member[1]/name, ', ', member[1]/role, '; ', member[2]/name, ', ', member[2]/role, '; ', member[3]/name, ', ', member[3]/role, '; ', member[4]/name, ', ', member[4]/role, '; ', member[5]/name, ', ', member[5]/role, '.')
                                                        else
                                                            if (count(member) = 6) then
                                                                concat(member[1]/name, ', ', member[1]/role, '; ', member[2]/name, ', ', member[2]/role, '; ', member[3]/name, ', ', member[3]/role, '; ', member[4]/name, ', ', member[4]/role, '; ', member[5]/name, ', ', member[5]/role, '; ', member[6]/name, ', ', member[6]/role, '.')
                                                            else
                                                                if (count(member) = 7) then
                                                                    concat(member[1]/name, ', ', member[1]/role, '; ', member[2]/name, ', ', member[2]/role, '; ', member[3]/name, ', ', member[3]/role, '; ', member[4]/name, ', ', member[4]/role, '; ', member[5]/name, ', ', member[5]/role, '; ', member[6]/name, ', ', member[6]/role, '; ', member[7]/name, ', ', member[7]/role, '.')
                                                                else
                                                                    if (count(member) = 8) then
                                                                        concat(member[1]/name, ', ', member[1]/role, '; ', member[2]/name, ', ', member[2]/role, '; ', member[3]/name, ', ', member[3]/role, '; ', member[4]/name, ', ', member[4]/role, '; ', member[5]/name, ', ', member[5]/role, '; ', member[6]/name, ', ', member[6]/role, '; ', member[7]/name, ', ', member[7]/role, '; ', member[8]/name, ', ', member[8]/role, '.')
                                                                    else
                                                                        ()"
                                />
                            </mods:note>
                        </xsl:for-each>
                    </xsl:for-each>

                    <!-- **subject** -->
                    <!-- **classification** -->
                    <!-- Not all Bepress metadata have subjects (i.e. disciplines). In those cases, the subject is derived from the department name. -->
                    <xsl:if test="disciplines/discipline">
                        <xsl:call-template name="discipline-subject"/>
                    </xsl:if>

                    <xsl:if test="not(disciplines/discipline)">
                        <xsl:call-template name="department-subject"/>
                    </xsl:if>

                    <!-- **identifier** SYSTEM-SUPPLIED -->
                    <!-- <identifier type="IID">UNIQUE ID NUMBER - FSU ASSIGNED</identifier>-->

                    <!-- **location** SYSTEM-SUPPLIED -->
                    <!--<location displayLabel="purl">
                        <url>PURL</url>
                    </location>-->

                    <!-- **accessCondition** -->
                    <!-- If needed -->
                    <!--<accessCondition><xsl:value-of select="concat('This work was originally embargoed until ',format-date($embargo_date, '[MNn] [D], [Y]', 'en', (), ()),'.')"/></accessCondition>-->

                    <!-- **extension** -->
                    <mods:extension>
                        <!-- flvc:extension is SYSTEM-SUPPLIED -->
                        <!--                        <flvc:flvc>
                            <flvc:owningInstitution>FSU</flvc:owningInstitution>
                            <flvc:submittingInstitution>FSU</flvc:submittingInstitution>
                        </flvc:flvc>-->

                        <!-- NDLTD Extension fields -->
                        <!-- TO DO: For degree level, confirm the Treatises are doctoral -->
                        <xsl:variable name="degreeString" select="fields/field[@name = 'degree_name']/value"/>

                        <etd:degree>
                            <etd:name>
                                <xsl:value-of select="substring-after($degreeString, ', ')"/>
                            </etd:name>
                            <etd:level>
                                <xsl:value-of
                                    select="
                                        if (contains(document-type, 'dissertation')) then
                                            'Doctoral'
                                        else
                                            'Masters'"
                                />
                            </etd:level>
                            <etd:discipline>
                                <xsl:value-of select="substring-after($department, 'of ')"/>
                            </etd:discipline>
                        </etd:degree>
                    </mods:extension>

                    <!-- **recordInfo** -->
                    <mods:recordInfo>
                        <mods:recordCreationDate encoding="w3cdtf">
                            <xsl:value-of select="current-dateTime()"/>
                        </mods:recordCreationDate>
                        <mods:descriptionStandard>rda</mods:descriptionStandard>
                    </mods:recordInfo>

                </mods:mods>
            </xsl:for-each>
        </mods:modsCollection>
    </xsl:template>

</xsl:stylesheet>
