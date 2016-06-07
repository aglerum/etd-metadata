<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:str="http://www.metaphoricalweb.org/xmlns/string-utilities"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:functx="http://www.functx.com"
    xmlns:fs="http://www.lib.fsu.edu" exclude-result-prefixes="xs xd" version="2.0">

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated:</xd:b> November 1, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> Annie Glerum</xd:p>
            <xd:p><xd:b>Organization:</xd:b> Florida State University Libraries</xd:p>
            <xd:p><xd:b>Title:</xd:b> Transformation for FSU ETDs in DigiNole.</xd:p>
            <xd:p>Transformation of extracted PDF text data and ProQuest
                metadata to Bepress's Digital Commons XML Schema.</xd:p>
            <xd:p>Acknowledgement and thanks to Shawn Averkamp and Joanna Lee for freely sharing
                ETD-ProQuestXML2bepressXML.xsl which was used as a reference for the ProQuest to
                Bepress transformations.</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xsl:include href="modules/caps.xsl"/>
    <xsl:include href="modules/names.xsl"/>

    <!-- Node variables -->
    <!-- Note: This path changes depending upon the source document -->
    <xsl:variable name="pdfdata" select="document('example-source-files/source-pdfdata-2014Sp.xml')/records/record"/>

    <xsl:template match="/">
        <documents xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:noNamespaceSchemaLocation="http://www.bepress.com/document-import.xsd">
            <xsl:for-each select="xml/DISS_submission">
                <xsl:variable name="binary" select="DISS_content/DISS_binary"/>
                <xsl:variable name="embargo">
                    <xsl:value-of select="@embargo_code"/>
                </xsl:variable>
                <xsl:variable name="department"
                    select="DISS_description/DISS_institution/DISS_inst_contact"/>

                <xsl:variable name="defenseDate">
                    <xsl:for-each select="position()">
                        <xsl:variable name="defended"
                            select="$pdfdata[position=current()]/*[(self::defense)]"/>
                        <xsl:variable name="date">
                            <xsl:value-of select="replace($defended,',','')"/>
                        </xsl:variable>
                        <xsl:value-of select="fs:dateName-to-yyyy-mm-dd($date)"/>
                    </xsl:for-each>
                </xsl:variable>

                <document>
                    <title>
                        <xsl:for-each select="position()">
                            <xsl:value-of select="$pdfdata[position=current()]/*[(self::title)]"/>
                        </xsl:for-each>
                    </title>

                    <!-- This is the defense date formatted as YYYY-MM-DD. (For the Excel upload, the format is MM/DD/YYYY.) -->
                    <!-- HISTORICAL: Previous transformations used DISS_comp_date as publication date, which was transformed to (yyyy-mm-dd).  -->
                    <publication-date>
                        <xsl:value-of select="$defenseDate"/>
                    </publication-date>

                    <!-- Author names -->
                    <!-- HISTORICAL: Previous loads included "The" before Florida State University which was the official name at that time. -->
                    <authors>
                        <xsl:for-each select="DISS_authorship/DISS_author/DISS_name">
                            <author xsi:type="individual">
                                <email> </email>
                                <institution>Florida State University</institution>
                                <lname>
                                    <xsl:call-template name="capitalization">
                                        <xsl:with-param name="element" select="DISS_surname"/>
                                    </xsl:call-template>
                                </lname>
                                <fname>
                                    <xsl:call-template name="capitalization">
                                        <xsl:with-param name="element" select="DISS_fname"/>
                                    </xsl:call-template>
                                </fname>
                                <mname>
                                    <xsl:variable name="mname">
                                        <xsl:variable name="middle">
                                            <xsl:call-template name="capitalization">
                                                <xsl:with-param name="element" select="DISS_middle"
                                                />
                                            </xsl:call-template>
                                        </xsl:variable>
                                        <xsl:value-of
                                            select="               
                                        if (contains($middle,' a. ')) then replace($middle,' a. ',' A. ') else               
                                        $middle"
                                        />
                                    </xsl:variable>

                                    <xsl:value-of
                                        select="if (string-length($mname)=1) then concat($mname,'.') else $mname"
                                    />
                                </mname>
                                <suffix>
                                    <xsl:call-template name="capitalization">
                                        <xsl:with-param name="element" select="DISS_suffix"/>
                                    </xsl:call-template>
                                </suffix>
                            </author>
                        </xsl:for-each>
                    </authors>

                    <!-- Outputs each keyword into its own keyword element -->
                    <keywords>
                        <xsl:variable name="keywords"
                            select="DISS_description/DISS_categorization/DISS_keyword"
                            as="xs:string"/>
                        <xsl:for-each select="tokenize($keywords,',')">
                            <keyword>
                                <xsl:choose>
                                    <xsl:when test=".=upper-case(.) or .=lower-case(.)">
                                        <xsl:call-template name="capitalization">
                                            <xsl:with-param name="element"
                                                select="normalize-space(.)"/>
                                        </xsl:call-template>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </keyword>
                        </xsl:for-each>
                    </keywords>

                    <!-- Advisory Committte, up to 7 members. Includes the advisors, university representatives, and committee members' names and their role on the committee in one field. -->                
                    <!-- NOTE: Even though the Bepress editor properly displays using "&lt;br/&gt;" that tag does not display correctly in DigiNole. Use "&lt;br&gt;" in the transformation. -->
                    <!-- HISTORICAL: For Fall 2013 embargoed, only 4 advisors were transformed since Bepress only accepted up to field name="advisor4". -->
                    <xsl:for-each select="position()">
                        <xsl:for-each select="$pdfdata[position=current()]/*[(self::committee)]">
                            <xsl:choose>
                                <xsl:when test="count(member)=1">
                                    <advisors>
                                        <advisor>
                                            <xsl:value-of select="member[1]"/>
                                        </advisor>
                                    </advisors>
                                </xsl:when>
                                <xsl:when test="count(member)=2">
                                    <advisors>
                                        <advisor>
                                            <xsl:value-of
                                                select="concat(member[1],'&lt;br&gt;',member[2])"/>
                                        </advisor>
                                    </advisors>
                                </xsl:when>
                                <xsl:when test="count(member)=3">
                                    <advisors>
                                        <advisor>
                                            <xsl:value-of
                                                select="concat(member[1],'&lt;br&gt;',member[2],'&lt;br&gt;',member[3])"
                                            />
                                        </advisor>
                                    </advisors>
                                </xsl:when>
                                <xsl:when test="count(member)=4">
                                    <advisors>
                                        <advisor>
                                            <xsl:value-of
                                                select="concat(member[1],'&lt;br&gt;',member[2],'&lt;br&gt;',member[3],'&lt;br&gt;',member[4])"
                                            />
                                        </advisor>
                                    </advisors>
                                </xsl:when>
                                <xsl:when test="count(member)=5">
                                    <advisors>
                                        <advisor>
                                            <xsl:value-of
                                                select="concat(member[1],'&lt;br&gt;',member[2],'&lt;br&gt;',member[3],'&lt;br&gt;',member[4],'&lt;br&gt;',member[5])"
                                            />
                                        </advisor>
                                    </advisors>
                                </xsl:when>
                                <xsl:when test="count(member)=6">
                                    <advisors>
                                        <advisor>
                                            <xsl:value-of
                                                select="concat(member[1],'&lt;br&gt;',member[2],'&lt;br&gt;',member[3],'&lt;br&gt;',member[4],'&lt;br&gt;',member[5],'&lt;br&gt;',member[6])"
                                            />
                                        </advisor>
                                    </advisors>
                                </xsl:when>
                                <xsl:when test="count(member)=7">
                                    <advisors>
                                        <advisor>
                                            <xsl:value-of
                                                select="concat(member[1],'&lt;br&gt;',member[2],'&lt;br&gt;',member[3],'&lt;br&gt;',member[4],'&lt;br&gt;',member[5],'&lt;br&gt;',member[6],'&lt;br&gt;',member[6])"
                                            />
                                        </advisor>
                                    </advisors>
                                </xsl:when>
                                <xsl:otherwise/>
                            </xsl:choose>
                        </xsl:for-each>
                    </xsl:for-each>

                    <!-- NOTE: Some records have <DISS_para> elements that break in mid-sentence. For that reason, this transformation conbines all <p> into one paragraph. This is caused by issues with greater than symbols.-->
                    <!-- Schema note: "The abstract is essentially a chunk of HTML within the import document." Entity references are converted to HTML references
                            with the fs:entity2html function. -->
                    <abstract>
                        <xsl:for-each select="DISS_content/DISS_abstract">
                            <xsl:variable name="para" select="normalize-space(DISS_para)"
                                as="xs:string"/>
                            <p>
                                <xsl:variable name="abstract">
                                    <xsl:choose>
                                        <xsl:when test="count(DISS_para)>1">
                                            <xsl:value-of
                                                select="normalize-space(string-join((DISS_para),' '))"
                                            />
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="$para"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                              <xsl:value-of select="fs:entity2html($abstract)"/>                                                            
                            </p>
                        </xsl:for-each>
                    </abstract>

                    <!-- Constructs the filepath for the server location of the pdf.  -->
                    <fulltext-url>
                        <xsl:variable name="pdfpath">
                            <xsl:value-of select="DISS_content/DISS_binary"/>
                        </xsl:variable>
                        <xsl:value-of
                            select="concat('http://lib-srv-etd01.lib.fsu.edu/etd/', $pdfpath)"/>
                    </fulltext-url>

                    <!-- Forces bepress article id on each ETD in order to construct the access URL for use in MARC21XML transformation
                                **Note: This number has to be updated for each new batch with the highest paper number currently in DigiNole 
                                (Fall 2013 is 8517; Fall 2013 missed is 8676, 2014 Spring is 8721. 2014 Summer is 8925) -->
                    <label>
                        <xsl:value-of select="position()+8925"/>
                    </label>

                    <!-- DISS_Description type attribute. Displays as "Degree Type" in DigiNole. Affects whether the PDF is accessible for 
                            Open Access (open _treatise, open_thesis, open_dissertation) or not (i.e. embargoed). -->
                    <document-type>
                        <xsl:for-each select="DISS_description/@type">
                            <xsl:variable name="document_type">
                                <xsl:value-of select="."/>
                            </xsl:variable>
                            <xsl:choose>
                                <xsl:when test="$department eq 'College of Music'">
                                    <xsl:choose>
                                        <xsl:when test="$embargo='0'">
                                            <xsl:value-of select="'open _treatise'"/>
                                        </xsl:when>
                                        <xsl:when test="$embargo gt '0'">
                                            <xsl:value-of select="'restricted_treatise'"/>
                                        </xsl:when>
                                        <xsl:otherwise/>
                                    </xsl:choose>

                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:choose>
                                        <xsl:when test="$embargo='0' and $document_type='masters'">
                                            <xsl:value-of select="'open_thesis'"/>
                                        </xsl:when>
                                        <xsl:when test="$embargo='0' and $document_type='doctoral'">
                                            <xsl:value-of select="'open_dissertation'"/>
                                        </xsl:when>
                                        <xsl:when
                                            test="$embargo gt '0' and $document_type='masters'">
                                            <xsl:value-of select="'restricted_thesis'"/>
                                        </xsl:when>
                                        <xsl:when
                                            test="$embargo gt '0' and $document_type='doctoral'">
                                            <xsl:value-of select="'restricted_dissertation'"/>
                                        </xsl:when>
                                        <xsl:otherwise/>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </document-type>

                    <fields>
                        <!-- Normalizes degree names removing punctuation and converting to upper-case. -->
                        <xsl:for-each select="DISS_description/DISS_degree">
                            <field name="degree_name" type="string">
                                <value>
                                    <xsl:value-of
                                        select="
                                        if (document('modules/tables/degrees.xml')/*/*[initials = current()]) then document('modules/tables/degrees.xml')/*/*[initials = current()]/*[(self::degreeName)] else ''"
                                    />
                                </value>
                            </field>
                        </xsl:for-each>

                        <!-- Converts ProQuest department names to Bepress department names. -->
                        <field name="department" type="string">
                            <value>
                                <xsl:for-each
                                    select="DISS_description/DISS_institution/DISS_inst_contact">
                                    <xsl:variable name="bepressName">
                                        <xsl:value-of
                                            select="document('modules/tables/dept.xml')/*/*[deptPQ = current()]/*[(self::deptBP)]"
                                        />
                                    </xsl:variable>
                                    <xsl:value-of select="$bepressName"/>
                                </xsl:for-each>
                            </value>
                        </field>

                        <!-- embargo date -->
                        <!-- Valid values are: 0; 720; 2190. -->
                        <!-- Per the graduate school, no embargoes should be set for longer than two years, so both embargo codes 3 and 4 are set to two years. -->
                        <field name="embargo_date" type="date">
                            <xsl:choose>
                                <xsl:when test="$embargo eq '0'">
                                    <value>
                                        <xsl:value-of select="'0'"/>
                                    </value>
                                </xsl:when>
                                <xsl:when test="$embargo='3' or $embargo='4'">
                                    <value>
                                        <xsl:value-of select="'720'"/>
                                    </value>
                                </xsl:when>
                                <xsl:otherwise/>
                            </xsl:choose>
                        </field>

                        <!-- availibility -->
                        <field name="availability" type="string">
                            <xsl:choose>
                                <xsl:when test="$embargo eq '0'">
                                    <value>
                                        <xsl:value-of select="'Open Access'"/>
                                    </value>
                                </xsl:when>
                                <xsl:when test="$embargo gt '0'">
                                    <value>
                                        <xsl:value-of select="'Embargo'"/>
                                    </value>
                                </xsl:when>
                                <xsl:otherwise/>
                            </xsl:choose>
                        </field>
                    </fields>
                </document>
                
            </xsl:for-each>
        </documents>
    </xsl:template>

</xsl:stylesheet>
