<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:x="adobe:ns:meta/"
   exclude-result-prefixes="x xs" version="2.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="xml">
        <!-- 1. Enter the appropriate path is for the semester folder contains the pdf2xml files. -->
        <xsl:variable name="path" select="'../NEW_COMBINED_2023DSuEmbargoed_2023EFaStrag_2024BSu/pdf2xml/'"/>
<!--        <!-\- 2. Rename the appropriate semester. -\->
        <xsl:result-document href="Results/2023A_Sp">-->
        <xml>
            <!-- 3. Rename the appropriate semester. -->
            <xsl:for-each select="document('../XML/Filenames/NEW_COMBINED_2023DSuEmbargoed_2023EFaStrag_2024BSu.xml')/filenames/filename">
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
