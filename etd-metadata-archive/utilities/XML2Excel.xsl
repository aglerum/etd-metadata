<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="urn:schemas-microsoft-com:office:spreadsheet" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet" xmlns:html="http://www.w3.org/TR/REC-html40">
    <!-- :  /:       Edmond Woychowsky:          July 25, 2005:   The purpose of this template is to create an Excel/XML spreadsheet from a
                   simple xml document.
-->
    <xsl:output method="xml" indent="yes" encoding="utf-8" />    
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
        <Workbook>
            <xsl:call-template name="DocumentProperties"/>
            <xsl:call-template name="OfficeDocumentSettings"/>
            <xsl:call-template name="ExcelWorkbook"/>
            <xsl:call-template name="Styles"/>
            <xsl:apply-templates select="/*" mode="worksheet"/>
        </Workbook>
    </xsl:template>
    <!-- : * worksheet:   This template builds the spreadsheets individual worksheets, commonly know as
                   tabs.
-->
    <xsl:template match="*" mode="worksheet">
        <xsl:variable name="position" select="position()"/>
        <Worksheet ss:Name="{concat('Sheet', $position)}">
            <Table ss:ExpandedColumnCount="{count(./*[1]/*)}" ss:ExpandedRowCount="{count(./*) + 2}" x:FullColumns="1" x:FullRows="1">
                <xsl:apply-templates select="*" mode="row"/>
            </Table>
            <xsl:call-template name="WorksheetOptions"/>
        </Worksheet>
    </xsl:template>
    <!-- :  * row:    This template builds the worksheet's rows.
-->
    <xsl:template match="*" mode="row">
        <Row>
            <xsl:apply-templates select="*" mode="cell"/>
        </Row>
    </xsl:template>
    <!-- :  *  cells:    This template builds the row's cells.
-->
    <xsl:template match="*" mode="cell">
        <xsl:variable name="type">
            <xsl:choose>
                <xsl:when test="number(.) = .">Number</xsl:when>
                <xsl:otherwise>String</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <Cell>
            <Data ss:Type="{$type}">
                <xsl:value-of select="."/>
            </Data>
        </Cell>
    </xsl:template>
    <!-- :  * column:    This template describes a worksheet's individual columns.
-->
    <xsl:template match="*" mode="column">
        <xsl:variable name="name" select="name(.)"/>
        <xsl:variable name="length">
            <xsl:call-template name="length">
                <xsl:with-param name="nodeset" select="//parent::*/parent::*/*/*[name(.) = $name]"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="width">
            <xsl:choose>
                <xsl:when test="($length * 5.75) &lt; 56.25">56.25</xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$length * 5.75"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="style">
            <xsl:choose>
                <xsl:when test="parent::*/parent::*/*/*[name(.) = $name] = number(parent::*/parent::*/*[1]/*[name(.) = $name])">
                    <xsl:choose>
                        <xsl:when test="string-length(parent::*/parent::*/*/*[name(.) = $name][contains(.,'.')]) = 0">s23</xsl:when>
                        <xsl:otherwise>s24</xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>s22</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <Column ss:StyleID="{$style}" ss:AutoFitWidth="0" ss:Width="{$width}"/>
    </xsl:template>
    <!-- :  DocumentProperties:    This template describes the document to Excel.
-->
    <xsl:template name="DocumentProperties">
        <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
            <Author>Annie Glerum</Author>
            <Company>FSU Libraries</Company>
            <Version>10.4219</Version>
        </DocumentProperties>
    </xsl:template>
    <!-- :  OfficeDocumentSettings:    This template describes the Office document to Excel.
-->
    <xsl:template name="OfficeDocumentSettings">
        <OfficeDocumentSettings xmlns="urn:schemas-microsoft-com:office:office">
            <DownloadComponents/>
            <LocationOfComponents HRef="file:///\\phlfsnt01\DOWNLOAD\OfficeXPSrc\"/>
        </OfficeDocumentSettings>
    </xsl:template>
    <!-- :  ExcelWorkbook:    This template describes the characteristics of the wookbook to Excel.
-->
    <xsl:template name="ExcelWorkbook">
        <ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
            <WindowHeight>9210</WindowHeight>
            <WindowWidth>15195</WindowWidth>
            <WindowTopX>0</WindowTopX>
            <WindowTopY>60</WindowTopY>
            <ProtectStructure>False</ProtectStructure>
            <ProtectWindows>False</ProtectWindows>
        </ExcelWorkbook>
    </xsl:template>
    <!-- :  Styles:    This template describes the display styles to Excel.
-->
    <xsl:template name="Styles">
        <Styles>
            <Style ss:ID="Default" ss:Name="Normal">
                <Alignment ss:Vertical="Bottom"/>
                <Borders/>
                <Font/>
                <Interior/>
                <NumberFormat/>
                <Protection/>
            </Style>
        </Styles>
    </xsl:template>
    <!-- :  WorksheetOptions:    This template describes the worksheet options to Excel.
-->
    <xsl:template name="WorksheetOptions">
        <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
            <Print>
                <ValidPrinterInfo/>
                <HorizontalResolution>1200</HorizontalResolution>
                <VerticalResolution>1200</VerticalResolution>
            </Print>
            <ProtectObjects>False</ProtectObjects>
            <ProtectScenarios>False</ProtectScenarios>
        </WorksheetOptions>
    </xsl:template>
    <!-- :  length:    Determine either the length of the node name or the longest node(s), which ever is longer.
-->
    <xsl:template name="length">
        <xsl:param name="nodeset"/>
        <xsl:variable name="longest">
            <xsl:call-template name="longest">
                <xsl:with-param name="nodeset" select="$nodeset"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="string-length(name($nodeset[1])) &gt; string-length($longest)">
                <xsl:value-of select="string-length(name($nodeset[1]))"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="string-length($longest)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- :  longest:    This recursive template transverses a nodeset to find the nodes with the longest 
                    string-length. Please note that the result of this template may itself be a nodeset.
-->
    <xsl:template name="longest">
        <xsl:param name="nodeset"/>
        <xsl:param name="length" select="0"/>
        <xsl:choose>
            <xsl:when test="count($nodeset[string-length(.) &gt; $length]) &gt; 0">
                <xsl:call-template name="longest">
                    <xsl:with-param name="nodeset" select="$nodeset[string-length(.) &gt; $length]"/>
                    <xsl:with-param name="length" select="string-length($nodeset[string-length(.) &gt; $length][1])"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$nodeset"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>

