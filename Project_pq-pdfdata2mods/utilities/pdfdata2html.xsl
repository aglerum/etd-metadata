<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:fs="http://www.lib.fsu.edu" xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:mods="http://www.loc.gov/mods/v3"
    xmlns:dcterms="http://purl.org/dc/terms/" exclude-result-prefixes="dcterms etd fs mods xd xlink xs xsi" version="2.0">

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>August 12, 2019</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University Libraries</xd:p>
            <xd:p><xd:b>Title: </xd:b>PDF Data to HTML</xd:p>
            <xd:p>Transformation of PDF data into a more user-friendly Web page</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:output encoding="UTF-8" indent="yes" method="html"/>

    <xsl:variable name="header" select="'PDF Data for 2020 Spring ETDs'"/>


    <xsl:template match="/records">
        <html>
            <head>
                <title>PDF Data to HTML</title>
                <style>
                    #container{
                        width:1000px;
                        position:relative;
                        left:50px;
                    }
                    h1{
                        font-size:36px;
                    }
                    h2{
                        color:#782F40;
                        font-size:18px;
                    }
                    p{
                        font-size:14px;
                    }
                    .label{
                        font-weight:bold;
                    }</style>
            </head>
            <body>
                <div id="container">
                    <h1>
                        <xsl:value-of select="$header"/>
                    </h1>
                    <xsl:for-each select="record">
                        <h2>
                            <xsl:value-of select="concat('Record number: ', position())"/>
                        </h2>
                        <p>
                            <span class="label">FILENAME: </span>
                            <xsl:value-of select="file"/>
                        </p>
                        <p>
                            <span class="label">COLLEGE: </span>
                            <xsl:value-of select="college"/>
                        </p>
                        <p>
                            <span class="label">TITLE: </span>
                            <xsl:value-of select="title"/>
                        </p>
                        <p>
                            <span class="label">AUTHOR: </span>
                            <xsl:value-of select="author"/>
                        </p>
                        <p>
                            <span class="label">SUBMITTED: </span>
                            <xsl:value-of select="submitted"/>
                        </p>
                        <p>
                            <span class="label">AWARDED: </span>
                            <xsl:value-of select="awarded"/>
                        </p>
                        <p>
                            <span class="label">DEFENSE DATE: </span>
                            <xsl:value-of select="defense"/>
                        </p>
                        <p>
                            <span class="label">COMMITTEE: </span>
                            <ul>
                                <xsl:for-each select="committee/member">
                                    <li>
                                        <xsl:value-of select="concat(name,', ',role)"/>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </p>
                    </xsl:for-each>
                </div>
            </body>
        </html>

    </xsl:template>

</xsl:stylesheet>
