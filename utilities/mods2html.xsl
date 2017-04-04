<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:fs="http://www.lib.fsu.edu" xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:mods="http://www.loc.gov/mods/v3"
    xmlns:dcterms="http://purl.org/dc/terms/" exclude-result-prefixes="dcterms etd fs mods xd xlink xs xsi" version="2.0">

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>February 22, 2017</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University Libraries</xd:p>
            <xd:p><xd:b>Title: </xd:b>MODS to HTML</xd:p>
            <xd:p>Transformation of MODS data into a more user-friendly Web page</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:output encoding="UTF-8" indent="yes" method="html"/>

    <xsl:variable name="header" select="'2016 Fall ETDs'"/>

    <xsl:template match="/mods:modsCollection">
        <html>
            <head>
                <title>MODS to HTML</title>
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
                    <xsl:for-each select="mods:mods">
                        <xsl:variable name="nonSort">
                            <xsl:value-of select="if (mods:titleInfo/mods:nonSort) then mods:titleInfo/mods:nonSort else ()"/>
                        </xsl:variable>
                        <xsl:variable name="title">
                            <xsl:value-of select="mods:titleInfo/mods:title"/>
                        </xsl:variable>
                        <xsl:variable name="subTitle">
                            <xsl:value-of select="if (mods:titleInfo/mods:subTitle) then mods:titleInfo/mods:subTitle else ()"/>
                        </xsl:variable>

                        <h2>
                            <xsl:value-of select="concat('Record number: ', position())"/>
                        </h2>
                        <p>
                            <span class="label">FILENAME: </span>
                            <xsl:value-of select="mods:note[@displayLabel='filename']"/>
                        </p>
                        <p>
                            <span class="label">TITLE: </span>
                            <xsl:value-of
                                select="if (mods:titleInfo/mods:nonSort) then (
                            if (mods:titleInfo/mods:subTitle) then concat($nonSort,' ', $title,': ', $subTitle) else concat($nonSort,' ', $title)
                            ) else if (mods:titleInfo/mods:subTitle) then concat($title,': ', $subTitle) else $title"
                            />
                        </p>
                        <xsl:for-each select="mods:name[@type='personal']">
                            <xsl:variable name="role" select="mods:role/mods:roleTerm"/>
                            <xsl:variable name="roleLabel">
                                <xsl:value-of
                                    select="
                                if (@type='personal' and $role[@type='text'][text() = 'author']) then 'AUTHOR: ' else
                                if (@type='personal' and $role[@type='text'][text() != 'author']) then concat('MEMBER (', $role, '): ') else
                                ()"
                                />                                
                            </xsl:variable>
                            <xsl:variable name="family">
                                <xsl:value-of select="mods:namePart[@type='family']"/>
                            </xsl:variable>
                            <xsl:variable name="given">
                                <xsl:value-of select="mods:namePart[@type='given']"/>
                            </xsl:variable>
                            <xsl:variable name="address">
                                <xsl:value-of
                                    select="if (mods:namePart[@type='termsOfAddress']) then mods:namePart[@type='termsOfAddress'] else 'termsOfAddress'"
                                />
                            </xsl:variable>
                            <xsl:variable name="date">
                                <xsl:value-of select="if (mods:namePart[@type='date']) then mods:namePart[@type='date'] else 'date'"/>
                            </xsl:variable>
                            <p>
                                <span class="label">
                                    <xsl:value-of select="$roleLabel"/>
                                </span>
                                <xsl:value-of
                                    select="if (mods:namePart[@type='date']) then (
                                if (mods:namePart[@type='termsOfAddress']) then concat($family,', ', $given,', ', $address, ', ',$date) else concat($family,', ', $given,', ',$date)
                            ) else if (mods:namePart[@type='termsOfAddress']) then concat($family,', ', $given,', ', $address) else concat($family,', ', $given)"
                                />
                            </p>
                        </xsl:for-each>
                        <xsl:for-each select="mods:name[@type='corporate']">
                            <p>
                                <span class="label">CORPORATE NAME: </span>
                                <xsl:value-of select="mods:namePart"/>
                            </p>
                        </xsl:for-each>
                        <p>
                            <span class="label">PUBLICATION: </span>
                            <xsl:value-of
                                select="concat(mods:originInfo/mods:place/mods:placeTerm, ': ', mods:originInfo/mods:publisher, ', ', mods:originInfo/mods:dateIssued)"
                            />
                        </p>

                        <p>
                            <span class="label">PHYSICAL DESCRIPTION: </span>
                            <xsl:value-of select="mods:physicalDescription/mods:extent"/>
                        </p>
                        <p>
                            <span class="label">ABSTRACT: </span>
                            <xsl:value-of select="mods:abstract"/>
                        </p>
                        <xsl:for-each select="mods:note[position() gt 1]">
                            <p>
                                <span class="label">
                                    <xsl:value-of select="concat('NOTE (', @displayLabel, '): ')"/>
                                </span>
                                <xsl:value-of select="."/>
                            </p>
                        </xsl:for-each>
                        <xsl:for-each select="mods:subject">
                            <xsl:variable name="subjects">
                                <xsl:value-of select="./*" separator="--"/>
                            </xsl:variable>
                            <p>
                                <span class="label">SUBJECT: </span>
                                <xsl:value-of select="$subjects"/>
                            </p>
                        </xsl:for-each>
                        <p>
                            <span class="label">DEGREE: </span>
                            <xsl:value-of select="mods:extension/etd:degree/etd:level"/>
                        </p>

                    </xsl:for-each>
                </div>
            </body>
        </html>

    </xsl:template>

</xsl:stylesheet>
