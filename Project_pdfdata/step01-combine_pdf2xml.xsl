<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:x="adobe:ns:meta/" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="x xd xs" version="2.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>June 4, 2016</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Combine pdf2ml</xd:p>
            <xd:p>
                <xd:ul>
                    <xd:b>Procedure: </xd:b>
                    <xd:li>Create an XML table of the filenames with this structure: filenames/filename/[FILENAME].</xd:li>
                    <xd:li>Run this XSLT on an XML document containing an empty 'xml' root element</xd:li>
                </xd:ul>
                <xd:p/>
                <xd:ul>
                    <xd:b>Root directories for files to be combined:</xd:b>
                    <xd:li> Windows file:///c:/Users/[USER]/ </xd:li>
                    <xd:li> OSX /Users/[USER]/</xd:li>
                </xd:ul>
            </xd:p>
        </xd:desc>
    </xd:doc>

    <!-- Example filename etd-0001_pdfdata.xml-->
    <!--
    "G:/CS/TechResources/Bepress-migration/Project rev2\0-1000"-->
    <!--"G:\CS\TechResources\Bepress-migration\Project_pdfdata\2001-2500\etd-2001_pdfdata.xml"-->

    <xsl:template match="xml">

        <xsl:variable name="path" select="'/Users/Annie/etd-metadata/Project_pdfdata/pdf2xml_4001-4050/'"/>

        <xml>
            <!-- Rename filenames xml  -->

            <xsl:for-each select="document('filenames.xml')/filenames/filename">
                <lines>
                    <xsl:variable name="filename">
                        <xsl:value-of select="."/>
                    </xsl:variable>
                    <xsl:variable name="label">
                        <xsl:value-of select="substring-before(., '_pdfdata.xml')"/>
                    </xsl:variable>
                    <xsl:variable name="fullpath" select="string(concat($path, $filename))"/>
                    <number>
                        <xsl:value-of select="replace($label,'-','/')"/>
                    </number>
                    <xsl:for-each select="document($fullpath)/TaggedPDF-doc/*[position() gt 1]">
                        <xsl:for-each select=".//text()">
                            <line>
                                <xsl:value-of select="normalize-space(.)"/>
                            </line>
                        </xsl:for-each>
                    </xsl:for-each>
                </lines>
            </xsl:for-each>
        </xml>

    </xsl:template>
</xsl:stylesheet>