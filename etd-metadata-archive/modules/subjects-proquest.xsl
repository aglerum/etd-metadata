<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:fs="http://www.lib.fsu.edu"
    exclude-result-prefixes="xs xd fs" version="2.0">

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>April 4, 2015</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>MODS subjects template: Proquest version</xd:p>
            <xd:p>This template is called by ProQuest-to-MODS XSLT to access values in a table of ProQuest category codes and terms.</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:preserve-space elements="text"/>

    <xsl:variable name="subject" select="document('tables/subjects4proquest.xml')/subjects/subject"/>

    <!-- *Author name* -->
    <xsl:template name="subjects_proquest">

        <xsl:for-each select="DISS_description/DISS_categorization/DISS_category/DISS_cat_code">
            <xsl:for-each select="$subject[diss_code = current()]/*[(self::lcsh)]">
                <xsl:choose>
                    <xsl:when test="contains(., '--')">
                        <xsl:choose>
                            <xsl:when test=".[@type = 'complex_topic-topic']">
                                <subject authority="lcsh" authorityURI="{@id}">
                                    <topic>
                                        <xsl:value-of select="substring-before(., '--')"/>
                                    </topic>
                                    <topic>
                                        <xsl:value-of select="substring-after(., '--')"/>
                                    </topic>
                                </subject>
                            </xsl:when>
                            <xsl:when test=".[@type = 'complex_topic-topic-topic']">
                                <subject authority="lcsh" authorityURI="{@id}">
                                    <topic>
                                        <xsl:value-of select="tokenize(., '--')[1]"/>
                                    </topic>
                                    <topic>
                                        <xsl:value-of select="tokenize(., '--')[2]"/>
                                    </topic>
                                    <topic>
                                        <xsl:value-of select="tokenize(., '--')[3]"/>
                                    </topic>
                                </subject>
                            </xsl:when>
                            <xsl:when test=".[@type = 'complex_geographic-topic']">
                                <subject authority="lcsh" authorityURI="{@id}">
                                    <geographic>
                                        <xsl:value-of select="substring-before(., '--')"/>
                                    </geographic>
                                    <topic>
                                        <xsl:value-of select="substring-after(., '--')"/>
                                    </topic>
                                </subject>
                            </xsl:when>
                            <xsl:otherwise/>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="not(contains(., '--'))">
                        <xsl:choose>
                            <xsl:when test=".[@type = 'topic']">
                                <subject authority="lcsh" authorityURI="{@id}">
                                    <topic>
                                        <xsl:value-of select="."/>
                                    </topic>
                                </subject>
                            </xsl:when>
                            <xsl:when test=".[@type = 'general_subdivision']">
                                <subject authority="lcsh" authorityURI="{@id}">
                                    <topic>
                                        <xsl:value-of select="."/>
                                    </topic>
                                </subject>
                            </xsl:when>
                            <xsl:when test=".[@type = 'geographic']">
                                <subject authority="lcsh" authorityURI="{@id}">
                                    <geographic>
                                        <xsl:value-of select="."/>
                                    </geographic>
                                </subject>
                            </xsl:when>
                            <xsl:otherwise/>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise/>
                </xsl:choose>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
