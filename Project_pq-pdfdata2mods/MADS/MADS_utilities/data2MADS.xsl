<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mads="http://www.loc.gov/mads/v2"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="xs" version="2.0">

    <!-- Last Updated: June 24, 2021 -->

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <!-- 
        February 3, 2019 version
        <record>
            <Indirect_Name>Abdel-Razig, Yassir [Variant]</Indirect_Name>
            <FSUID>yabdelrazig</FSUID>
            <URI>https://authorities.lib.fsu.edu/etd-naf/yabdelrazig</URI>
            <Organization>Florida State University</Organization>
            <Department>Civil and Environmental Engineering</Department>
            <Email>abdelrazig@eng.famu.fsu.edu</Email>
            <Position>Assistant Professor</Position>
            <Cataloger_Notes>Prefer Yassir AbdelRazig</Cataloger_Notes>
    </record>-->

    <!--
        June 24, 2021 version. Added Indirect and Variant Names to original spreadsheet.
        <record>
        <Indirect_Name>Abichou, Tarek</Indirect_Name>
        <Variant_Name/>
        <pdfdata_name>Abichou, Tarek</pdfdata_name>
        <URI>Not in LCNAF</URI> [transformation creates the local URI]
        <vita_name>Tarek Abichou</vita_name>
        <Vita_URL>https://web1.eng.famu.fsu.edu/~abichou/ABICHOU%20FINAL%20CV%282%29.pdf</Vita_URL>
        <Website_URL>https://web1.eng.famu.fsu.edu/~abichou/</Website_URL>
        <Organization>FAMU-FSU College of Engineering</Organization>
        <Department>Department of Civil and Environmental Engineering</Department>
        <Position>Professor</Position>
        <FSUID>tabichou</FSUID>
        <Email>abichou@eng.fsu.edu </Email>
        <Education>1999: Ph.D., University Of Wisconsin, Madison. Major: Civil Engineering; 1993: M.S., University of Wisconsin, Madison. Major: Civil and Environmental Engineering; 1989: B.S., University of Wisconsin, Madison. Major: Civil and Environmental Engineering.</Education>
        <Experience>2014–present: Professor, Civil and Environmental Engineering, FAMU - Florida State University College of Engineering; 2006–2014: Associate Professor, Civil and Environmental Engineering, FAMU - Florida State University College of Engineering; 2000–2006: Assistant Professor, FAMU - Florida State University College of Engineering; 1996–1999: Research Assistant, University of Wisconsin, Madison; 1994–1996: Geoenvironmental Engineer, Andrews Environmental Engineering; 1990–1991: Resident Project Engineer, Extension of Airport Djerba-Zarzis, Tunisia, Entreprise Youssef Eltaief; 1989–1990: Resident Engineer/Geotechnical Engineer, Bouchammaoui Petroleum Activities, Marathon Oil Project, Tunisia.</Experience>
        <FSU_Start_Year>2000</FSU_Start_Year>
        <Addl_Source/>
        <Notes/>
    </record>
        -->
    
    <!-- November 2021 Version changed to match above -->
    
<!--    <record>
        <Established_Name>Guedes Duque, Marina</Established_Name>
        <Variant_Name>Guedes, Marina; Duque, Marina</Variant_Name>
        <Name_found_on_Vita>Marina Guedes Duque</Name_found_on_Vita>
        <Name_found_on_webpage>Marina Guedes</Name_found_on_webpage>
        <Variations_on_ETDs></Variations_on_ETDs>
        <FEAS_vita_filename>MGDUQUE.rtf</FEAS_vita_filename>
        <Faculty_webpage>http://marinagduque.com/</Faculty_webpage>
        <Education>2016 PHD, The Ohio State University, Columbus OH. Major: Political Science.</Education>
        <Experience>NULL</Experience>
        <Date_Started>NULL</Date_Started>
        <Email>marina.duque@fsu.edu</Email>
        <FSUID>mgduque</FSUID>
        <Position>Assistant Professor</Position>
        <Department>Political Science</Department>
    </record>
-->
    <xsl:template match="records">
<!--        <xsl:if test="not(starts-with(LCNAF, 'Not '))">-->
            <mads:madsCollection xmlns:mads="http://www.loc.gov/mads/v2" xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xsi:schemaLocation="http://www.loc.gov/mads/v2 http://www.loc.gov/standards/mads/mads-2-1.xsd">
                <xsl:for-each select="record">
                    <xsl:variable name="Authority" select="'etd-naf'"/>
                    <!-- For Local Names -->
                    <xsl:variable name="authorityURI" select="'https://authorities.lib.fsu.edu/etd-naf/'"/>
                    <xsl:variable name="ID" select="lower-case(FSUID)"/>
                    <xsl:variable name="valueURI" select="concat($authorityURI, $ID)"/>
                    <xsl:variable name="name" select="Indirect_Name"/>
                    <xsl:variable name="family" select="replace(normalize-space(tokenize($name, ',')[1]), ',', '')"/>
                    <xsl:variable name="fullerForm" select="
                            normalize-space(if (contains($name, ' (')) then
                                concat('(', substring-after($name, '('))
                            else
                                ())"/>
                    <xsl:variable name="termsAddress" select="
                            normalize-space(if (string-length($name) - string-length(translate($name, ',', '')) = 2) then
                                tokenize($name, ',')[last()]
                            else
                                ())"/>
                    <xsl:variable name="given" select="
                            if ($termsAddress = '') then
                                substring-after($name, $family)
                            else
                                substring-after(substring-before($name, $termsAddress), $family)"/>

                    <xsl:variable name="variant_name" select="Variant_Name"/>
                    <xsl:variable name="variant_family" select="replace(normalize-space(tokenize($variant_name, ',')[1]), ',', '')"/>
                    <xsl:variable name="variant_fullerForm" select="
                            normalize-space(if (contains($variant_name, ' (')) then
                                concat('(', substring-after($variant_name, '('))
                            else
                                ())"/>
                    <xsl:variable name="variant_termsAddress" select="
                            normalize-space(if (string-length($name) - string-length(translate($variant_name, ',', '')) = 2) then
                                tokenize($variant_name, ',')[last()]
                            else
                                ())"/>
                    <xsl:variable name="variant_given" select="
                            if ($variant_termsAddress = '') then
                                substring-after($variant_name, $variant_family)
                            else
                                substring-after(substring-before($name, $termsAddress), $family)"/>
                    <xsl:variable name="source">
                        <xsl:choose>
                            <xsl:when test="starts-with(Vita_URL, 'No ')">
                                <xsl:choose>
                                    <xsl:when test="starts-with(Website_URL, 'No ')">
                                        <xsl:choose>
                                            <xsl:when test="Addl_Source != ''">
                                                <xsl:value-of select="concat('No faculty vita or website. Found: ', Addl_Source, '.')"/>
                                            </xsl:when>
                                            <xsl:when test="Addl_Source = ''">NEEDS SOURCE</xsl:when>
                                            <xsl:otherwise/>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:when test="not(starts-with(Website_URL, 'No '))">
                                        <xsl:choose>
                                            <xsl:when test="Addl_Source != ''">
                                                <xsl:value-of select="concat('Faculty website: ', Website_URL, '; Found: ', Addl_Source, '.')"/>
                                            </xsl:when>
                                            <xsl:when test="Addl_Source = ''">
                                                <xsl:value-of select="concat('Faculty website: ', Website_URL, '.')"/>
                                            </xsl:when>
                                            <xsl:otherwise/>
                                        </xsl:choose>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test="not(starts-with(Vita_URL, 'No '))">
                                <xsl:choose>
                                    <xsl:when test="starts-with(Website_URL, 'No ')">
                                        <xsl:choose>
                                            <xsl:when test="Addl_Source != ''">
                                                <xsl:value-of select="concat('Faculty vita: ', Vita_URL, '; ', Addl_Source, '.')"/>
                                            </xsl:when>
                                            <xsl:when test="Addl_Source = ''">
                                                <xsl:value-of select="concat('Faculty vita: ', Vita_URL, '.')"/>
                                            </xsl:when>
                                            <xsl:otherwise/>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:when test="not(starts-with(Website_URL, 'No '))">
                                        <xsl:choose>
                                            <xsl:when test="Addl_Source != ''">
                                                <xsl:value-of
                                                    select="concat('Faculty vita: ', Vita_URL, '; Faculty website: ', Website_URL, '; Found: ', Addl_Source), '.'"
                                                />
                                            </xsl:when>
                                            <xsl:when test="Addl_Source = ''">
                                                <xsl:value-of select="concat('Faculty vita: ', Vita_URL, '; Faculty website: ', Website_URL, '.')"/>
                                            </xsl:when>
                                            <xsl:otherwise/>
                                        </xsl:choose>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:otherwise>ERROR</xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>

                    <!-- For VIAF Names -->
                    <!-- <xsl:variable name="authorityURI" select="'http://viaf.org/viaf/'"/>              
                <xsl:variable name="ID" select="substring-after(valueURI,$authorityURI)"/>
                <xsl:variable name="valueURI" select="concat($authorityURI,$ID)"/>-->

                    <mads:mads version="2.1">
                        <mads:authority geographicSubdivision="not applicable">
                            <mads:name type="personal" authority="{$Authority}" authorityURI="{$authorityURI}" valueURI="{$valueURI}">
                                <mads:namePart type="family">
                                    <xsl:value-of select="$family"/>
                                </mads:namePart>
                                <!--, Yassir
                            , David G., -->
                                <mads:namePart type="given">
                                    <xsl:value-of select="normalize-space(translate($given, ',', ''))"/>
                                </mads:namePart>
                                <xsl:if test="contains($name, ' (')">
                                    <mads:namePart type="fullerForm">
                                        <xsl:value-of select="$fullerForm"/>
                                    </mads:namePart>
                                </xsl:if>
                                <!--           <xsl:if test="contains($name, ', ')">
                                    <mads:namePart type="termsOfAddress">
                                        <xsl:value-of select="$termsAddress"/>
                                    </mads:namePart>
                                </xsl:if>-->
                                <!--   <xsl:if test="matches($name, '[0-9]{4}\-?')">
                                <mads:namePart type="date">
                                    <xsl:value-of select="matches($name, '[0-9]{4}\-?')"/>
                                </mads:namePart>
                            </xsl:if>-->
                            </mads:name>
                        </mads:authority>
                        <xsl:if test="Variant_Name != ''">
                            <mads:variant type="other">
                                <mads:name type="personal">
                                    <mads:namePart type="family">
                                        <xsl:value-of select="$variant_family"/>
                                    </mads:namePart>
                                    <mads:namePart type="given">
                                        <xsl:value-of select="normalize-space(translate($variant_given, ',', ''))"/>
                                    </mads:namePart>
                                    <xsl:if test="contains($variant_name, ' (')">
                                        <mads:namePart type="fullerForm">
                                            <xsl:value-of select="$variant_fullerForm"/>
                                        </mads:namePart>
                                    </xsl:if>
                                    <!--                                    <xsl:if test="contains($variant_name, ', ')">
                                        <mads:namePart type="termsOfAddress">
                                            <xsl:value-of select="$variant_termsAddress"/>
                                        </mads:namePart>
                                    </xsl:if>-->
                                </mads:name>
                            </mads:variant>
                        </xsl:if>
                        <mads:affiliation>
                            <xsl:choose>
                                <xsl:when test="Organization = 'Florida State University'">
                                    <mads:organization authority="naf" authorityURI="http://id.loc.gov/authorities/names/"
                                        valueURI="http://id.loc.gov/authorities/names/n80126238"><xsl:value-of select="'Florida State University'"/></mads:organization>
                                </xsl:when>
                                <xsl:when test="Organization = 'FAMU-FSU College of Engineering'">
                                    <mads:organization authority="naf" authorityURI="http://id.loc.gov/authorities/names/"
                                        valueURI="http://id.loc.gov/authorities/names/no2008023817"><xsl:value-of select="'FAMU-FSU College of Engineering (Tallahassee, Fla.)'"/></mads:organization>
                                </xsl:when>
                                <xsl:otherwise/>
                            </xsl:choose>
                            <mads:position>
                                <xsl:value-of select="Position"/>
                            </mads:position>
                            <mads:email>
                                <xsl:value-of select="Email"/>
                            </mads:email>
                            <mads:dateValid encoding="edtf" point="start">
                                <xsl:value-of select="FSU_Start_Year"/>
                            </mads:dateValid>
                            <mads:dateValid encoding="edtf" point="end"/>
                        </mads:affiliation>
                        <mads:fieldOfActivity>
                            <xsl:value-of select="
                                    if (starts-with(Department, 'College of')) then
                                        normalize-space(substring-after(Department, 'College of '))
                                    else
                                        if (starts-with(Department, 'Department of')) then
                                            normalize-space(substring-after(Department, 'Department of '))
                                        else
                                            if (starts-with(Department, 'School of')) then
                                                normalize-space(substring-after(Department, 'School of '))
                                            else
                                                if (starts-with(Department, 'Center for ')) then
                                                    normalize-space(substring-after(Department, 'Center for '))
                                                else
                                                    if (starts-with(Department, 'Program in')) then
                                                        normalize-space(substring-after(Department, 'Program in '))
                                                    else
                                                        if (contains(Department, '
                                        Institute')) then
                                                            normalize-space(replace(Department, '
                                        Institute', ''))
                                                        else
                                                            normalize-space(Department)"/>
                        </mads:fieldOfActivity>
                        <mads:fieldOfEndeavor>
                            <mads:profession>College teachers</mads:profession>
                        </mads:fieldOfEndeavor>
                        <mads:identifier type="{$Authority}">
                            <xsl:value-of select="$ID"/>
                        </mads:identifier>
                        <mads:note type="source">
                            <xsl:value-of select="$source"/>
                        </mads:note>
                        <mads:note type="department">
                            <xsl:value-of select="Department"/>
                        </mads:note>
                        <xsl:if test="Education != ''">
                            <mads:note type="biographical">
                                <xsl:value-of select="normalize-space(concat('Education. ', Education))"/>
                            </mads:note>
                        </xsl:if>
                        <xsl:if test="Experience != ''">
                            <mads:note type="biographical">
                                <xsl:value-of select="normalize-space(concat('Professional Experience. ', Experience))"/>
                            </mads:note>
                        </xsl:if>
                        <xsl:if test="Cataloger_Notes != ''">
                            <mads:note type="cataloging">
                                <xsl:value-of select="Cataloger_Notes"/>
                            </mads:note>
                        </xsl:if>
                        <mads:recordInfo>
                            <mads:recordOrigin>Transformed from 2020_BC_spring_summer_faculty_data.xml</mads:recordOrigin>
                            <mads:recordIdentifier source="etd-naf">
                                <xsl:value-of select="$ID"/>
                            </mads:recordIdentifier>
                            <mads:descriptionStandard>rda</mads:descriptionStandard>
                        </mads:recordInfo>
                    </mads:mads>
                </xsl:for-each>
            </mads:madsCollection>
        <!--</xsl:if>-->
    </xsl:template>
</xsl:stylesheet>
<!-- Code from previous version: -->
<!--<xsl:variable name="valueURI" select="concat($authorityURI,$ID)"/>-->
<!--        <mads:variant type="other">
            <mads:name>
                <mads:namePart>FAMILY, GIVEN (FULLER FORM)</mads:namePart>
                <mads:namePart type="termsOfAddress">SUFFIX</mads:namePart>
                <mads:namePart type="date">DATE</mads:namePart>
            </mads:name>
        </mads:variant>-->
<!--        <mads:personInfo>
            <mads:birthDate>YYYY</mads:birthDate>
            <mads:deathDate>YYYY</mads:deathDate>
        </mads:personInfo> -->
<!--                    
    <xsl:if test="field ne 'null'">
                        <xsl:for-each select="tokenize(field,';')">
                            <mads:fieldOfActivity><xsl:value-of select="normalize-space(.)"/></mads:fieldOfActivity>
                        </xsl:for-each>
                    </xsl:if>-->
<!-- <mads:note type="history">Biographical note about NAME.</mads:note>-->
<!--<mads:recordContentSource authority="marcorg">DLC</mads:recordContentSource>
            <mads:recordChangeDate encoding="iso8601"></mads:recordChangeDate>-->
