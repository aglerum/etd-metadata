<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:x="adobe:ns:meta/"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="x xs xd" version="2.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>January 15, 2019</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Step 0: Combine pdf2xml files</xd:p>
            <xd:p>
                <xd:b>Procedure: </xd:b>
                <xd:ul>
                    <xd:li>Create an XML table of the filenames with this structure: filenames/filename/[FILENAME].</xd:li>
                    <xd:li>Save as filenames_YYYYSs.xml where YYYY is the year and Ss is the abbreviation for the semester (Spring = Sp, Summer = Su, Fall = Fa).</xd:li>
                </xd:ul>
            </xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:template match="xml">
        <!-- 1. Enter the appropriate path is for the semester folder contains the pdf2xml files. -->
        <xsl:variable name="path" select="'../2019Sp/pdf2xml/'"/>
<!--        <!-\- 2. Rename the appropriate semester. -\->
        <xsl:result-document href="Results/pdf2xml_2019Sp.xml">-->
        <xml>
            <!-- 3. Rename the appropriate semester. -->
            <xsl:for-each select="document('../XML/Filenames/filenames_2019Sp.xml')/filenames/filename">
                <TaggedPDF-doc>
                <xsl:variable name="filename"><xsl:value-of select="."/></xsl:variable>
                <xsl:variable name="fullpath" select="string(concat($path,$filename))"/>
                    <file><xsl:value-of select="concat(substring-before($filename,'_pdfdata.xml'),'.pdf')"/></file>
                    <xsl:for-each select="document($fullpath)/TaggedPDF-doc/*[position() gt 1]">
                        <xsl:for-each select=".//text()">
                            <P><xsl:value-of select="normalize-space(.)"/></P>
                        </xsl:for-each>  
                    </xsl:for-each>                  
                </TaggedPDF-doc>
            </xsl:for-each>
        </xml>
<!--        </xsl:result-document>-->
    </xsl:template>
</xsl:stylesheet>
