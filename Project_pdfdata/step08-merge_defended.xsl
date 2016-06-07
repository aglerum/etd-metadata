<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fs="http://www.lib.fsu.edu"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xs xd fs" version="2.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>June 4, 2016</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Step 6: Merges split defense statements</xd:p>
            <xd:p>This transformation merges split defense statements.</xd:p>
        </xd:desc>
    </xd:doc>
    
    <!-- Example: Michaela I. Densmore defended this Dissertation on 12 March 2012.-->
    <xsl:template match="/">
        <xml>
            <xsl:for-each select="xml/lines">

                <xsl:variable name="line1_index">
                    <xsl:for-each select="line[1]">
                        <xsl:number level="any" from="content"/>
                    </xsl:for-each>
                </xsl:variable>

                <!-- Variables if line ends with "defended on" -->
                <xsl:variable name="position_ends-with_on_index">
                    <xsl:for-each select="line[ends-with(.,'defended on')]">
                        <xsl:number level="any" from="content"/>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="position_ends-with_on"
                    select="number($position_ends-with_on_index) - (number($line1_index) - 1)"/>

                <xsl:variable name="position_after_ends-with_on"
                    select="number($position_ends-with_on) + 1"/>

                <xsl:variable name="ends-with_on" select="line[ends-with(.,'defended on')]"/>

                <xsl:variable name="after_ends-with_on"
                    select="line[ends-with(.,'defended on')]/following-sibling::line[1]"/>

                <!-- Variables if line ends with "defended" -->
                <xsl:variable name="position_ends-with_defended_index">
                    <xsl:for-each select="line[ends-with(upper-case(.),'defended')]">
                        <xsl:number level="any" from="content"/>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="position_ends-with_defended"
                    select="number($position_ends-with_defended_index) - (number($line1_index) - 1)"/>

                <xsl:variable name="position_after_ends-with_defended"
                    select="number($position_ends-with_defended) + 1"/>

                <xsl:variable name="ends-with_defended"
                    select="line[ends-with(upper-case(.),'defended')]"/>
                <xsl:variable name="after_ends-with_defended"
                    select="line[ends-with(.,'defended')]/following-sibling::line[1]"/>

                <!-- Variables if line starts with "defended" -->
                <xsl:variable name="position_starts-with_defended_index">
                    <xsl:for-each select="line[starts-with(.,'defended')]">
                        <xsl:number level="any" from="content"/>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="position_starts-with_defended"
                    select="number($position_starts-with_defended_index) - (number($line1_index) - 1)"/>

                <xsl:variable name="position_preceding_starts-with_defended"
                    select="number($position_starts-with_defended) - 1"/>

                <xsl:variable name="starts-with_defended" select="line[starts-with(.,'defended')]"/>
                
                <xsl:variable name="preceding_starts-with_defended"
                    select="line[starts-with(.,'defended')]/preceding-sibling::line[1]"/>
                
                <!-- Variables if line starts with a date number -->             
                <!-- matches day, comma, space, year: [\d]{1,2}\W\s[\d]{4} -->
                <!-- matches day with ordinal, comma, space, year: [\d]{1,2}[a-z]{2}\W\s\d{4} -->
                                                        
                <xsl:variable name="position_starts-with_members_index">
                    <xsl:for-each select="line[(starts-with(.,'The members'))]">
                        <xsl:number level="any" from="content"/>
                    </xsl:for-each>
                </xsl:variable>
                
                <xsl:variable name="position_starts-with_members"
                    select="number($position_starts-with_members_index) - (number($line1_index) - 1)"/>
                
                <xsl:variable name="position_following_starts-with_members"
                    select="number($position_starts-with_members) + 1"/>
                
                <xsl:variable name="starts-with_members"
                    select="line[starts-with(.,'The members')]"/>
                
                <xsl:variable name="following_starts-with_members" select="$starts-with_members/following-sibling::line[1]"/>
                
                <xsl:choose>

                    <!-- Merges line following ends-with "defended on" -->
                    <xsl:when test="line[ends-with(.,'defended on')]">
                        <lines>
                                 <xsl:copy-of select="number"/> 
                                 <xsl:copy-of select="line[position() lt number($position_ends-with_on)]"/>
                                 <line><xsl:value-of select="concat($ends-with_on, ' ', $after_ends-with_on)"/></line>
                                 <xsl:copy-of select="line[position() gt number($position_after_ends-with_on)]"/>                                       
                          </lines>
                    </xsl:when>

                    <!-- Merges line following ends-with "defended" -->
                    <xsl:when test="line[ends-with(.,'defended')]">
                        <lines>
                                 <xsl:copy-of select="number"/>
                                 <xsl:copy-of select="line[position() lt number($position_ends-with_defended)]"/>
                                 <line><xsl:value-of select="concat($ends-with_defended, ' ', $after_ends-with_defended)"/></line>
                                 <xsl:copy-of select="line[position() gt number($position_after_ends-with_defended)]"/>                                       
                                 </lines>
                    </xsl:when>

                    <!-- Merges line following starts-with "defended" -->
                    <xsl:when test="line[starts-with(.,'defended')]">
                        <lines>
                                 <xsl:copy-of select="number"/>
                                 <xsl:copy-of select="line[position() lt number($position_preceding_starts-with_defended)]"/>
                                 <line><xsl:value-of select="concat($preceding_starts-with_defended, ' ', $starts-with_defended)"/></line>
                                 <xsl:copy-of select="line[position() gt number($position_starts-with_defended)]"/>                                       
                                 </lines>
                    </xsl:when>
                    
                    <!-- Merges line followed by date-number -->
                    <xsl:when test="line[(starts-with(.,'The members')) and (matches(.[starts-with(.,'The members')]/following-sibling::line[1], '[\d]{1,2}\W\s[\d]{4}'))]">
                        <lines>
                                 <xsl:copy-of select="number"/>                    
                                 <xsl:copy-of select="line[position() lt number($position_starts-with_members)]"/>
                                 <line><xsl:value-of select="concat($starts-with_members, ' ', $following_starts-with_members)"/></line>
                                 <xsl:copy-of select="line[position() gt number($position_following_starts-with_members)]"/>                                       
                                 </lines>
                    </xsl:when>
                    
                    <!-- Merges line followed by date-ordinal -->
                    <xsl:when test="line[(starts-with(.,'The members')) and (matches(.[starts-with(.,'The members')]/following-sibling::line[1], '[\d]{1,2}[a-z]{2}\W\s\d{4}'))]">
                        <lines>
                                 <xsl:copy-of select="number"/>                   
                                 <xsl:copy-of select="line[position() lt number($position_starts-with_members)]"/>
                                 <line><xsl:value-of select="concat($starts-with_members, ' ', $following_starts-with_members)"/></line>
                                 <xsl:copy-of select="line[position() gt number($position_following_starts-with_members)]"/>                                       
                                 </lines>
                    </xsl:when>
                    
                    <!-- Merges line followed by date-year -->
                    <xsl:when test="line[(starts-with(.,'The members')) and (matches(.[starts-with(.,'The members')]/following-sibling::line[1], '[\d]{4}(\.|\s)'))]">
                        <lines>
                                 <xsl:copy-of select="number"/>                    
                                 <xsl:copy-of select="line[position() lt number($position_starts-with_members)]"/>
                                 <line><xsl:value-of select="concat($starts-with_members, ' ', $following_starts-with_members)"/></line>
                                 <xsl:copy-of select="line[position() gt number($position_following_starts-with_members)]"/>                                       
                                 </lines>
                    </xsl:when>
                    
                    <!-- Merges line followed by non-standard and split date. Example: 26</line><line>July 2000.</line> -->
                    <xsl:when test="line[(starts-with(.,'The members')) and (matches(.[starts-with(.,'The members')]/following-sibling::line[1], '[A-za-z]+\s[\d]{4}(\.|\s)'))]">
                        <lines>
                                 <xsl:copy-of select="number"/>                    
                                 <xsl:copy-of select="line[position() lt number($position_starts-with_members)]"/>
                                 <line><xsl:value-of select="concat($starts-with_members, ' ', $following_starts-with_members)"/></line>
                                 <xsl:copy-of select="line[position() gt number($position_following_starts-with_members)]"/>                                       
                        </lines>
                    </xsl:when>
                             
                    <xsl:otherwise>                      
                            <xsl:copy-of select="."/>                          
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xml>
    </xsl:template>

</xsl:stylesheet>
