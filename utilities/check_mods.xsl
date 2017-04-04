<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:fs="http://www.lib.fsu.edu" xmlns:etd="http://www.ndltd.org/standards/metadata/etdms/1.0/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:mods="http://www.loc.gov/mods/v3"
    xmlns:dcterms="http://purl.org/dc/terms/" exclude-result-prefixes="dcterms etd fs mods xd xlink xs xsi" version="2.0">

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>April 14, 2016</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University Libraries</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:output encoding="UTF-8" indent="yes" method="xml"/>
    
    <xsl:template match="/mods:modsCollection">      
        <root>
            <xsl:for-each select="mods:mods">            
                <row>
                    <column>
                        <xsl:value-of select="mods:note[@displayLabel='filename']"/>
                    </column>
                    <xsl:for-each select="mods:name[@type='personal'][mods:role/mods:roleTerm[@type = 'text'] eq 'author']">
                    <column>
                        <xsl:value-of select="mods:namePart[@type='family']"/>
                    </column>
                    <column>
                        <xsl:value-of select="mods:namePart[@type='given']"/>
                    </column>
                    <column>
                        <xsl:value-of select="mods:namePart[@type='termsOfAddress']"/>
                    </column>
                    </xsl:for-each>
                </row>
            </xsl:for-each>
        </root>
        
        <!--
        <records>
            <xsl:for-each select="mods:mods">
                <record>
                    <xsl:for-each select="mods:subject">
                        <subjects>
                            <xsl:for-each select="./*">
                                <terms>
                                    <xsl:value-of select="."/>
                                </terms>
                            </xsl:for-each>
                        </subjects>
                    </xsl:for-each>
                </record>
            </xsl:for-each>
        </records> 
        -->
        
        <!--    
        <records>
            <xsl:for-each select="mods:mods">
                <record>
                    <xsl:for-each select="mods:name[mods:role/mods:roleTerm[@type='text'][text() = 'author']]">
                    <name>
                        <xsl:value-of select="concat(mods:namePart[@type='family'], ', ', mods:namePart[@type='given'])"/>
                    </name>                
                </xsl:for-each>
                </record>
            </xsl:for-each>
        </records>
    -->
    </xsl:template>
</xsl:stylesheet>
