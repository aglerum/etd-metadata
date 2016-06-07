<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/documents">
        <records>
            <xsl:for-each select="document">
                <document>
                   <!-- <title>
                        <xsl:value-of select="title"/>
                    </title>
                   <date>
                        <xsl:value-of select="publication-date"/>
                    </date>
                  <xsl:for-each select="authors/author">
                        <author>
                            <xsl:value-of select="concat(lname, ', ', fname, ' ', mname) "/>
                        </author>
                    </xsl:for-each>
                    <keywords>
                        <xsl:for-each select="keywords/keyword">
                            <keyword>                                
                                <xsl:value-of select="."/>
                            </keyword>
                        </xsl:for-each>
                    </keywords>

                  <advisors>
                        <xsl:value-of select="advisors/advisor"/>
                    </advisors>
                   <abstract>
                        <xsl:value-of select="abstract/p"/>
                    </abstract>
                    <fulltext>
                        <xsl:value-of select="fulltext-url"/>
                    </fulltext>
                    <url>
                        <xsl:value-of select="concat('http://diginole.lib.fsu.edu/etd/',label)"/>
                    </url>-->
                  <type>
                        <xsl:value-of select="document-type"/>
                    </type>
                   <degree>
                        <xsl:value-of select="fields/field[@name='degree_name']"/>
                    </degree>
                    <department>
                        <xsl:value-of select="fields/field[@name='department']"/>
                    </department>
                    <embargo>
                        <xsl:value-of select="fields/field[@name='embargo_date']"/>
                    </embargo>
                    <availibility>
                        <xsl:value-of select="fields/field[@name='availability']"/>
                  </availibility>
                </document>
            </xsl:for-each>
        </records>
    </xsl:template>

</xsl:stylesheet>
