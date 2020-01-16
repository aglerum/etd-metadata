<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xs xd" version="2.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>December 4, 2019</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Step 6: Merge split defense statements</xd:p>
        </xd:desc>
    </xd:doc>
    
    <!-- Example: Michaela I. Densmore defended this Dissertation on 12 March 2012.-->
    <xsl:template match="/">
        <xml>
            <xsl:for-each select="xml/TaggedPDF-doc">
                <xsl:variable name="P1_index">
                    <xsl:for-each select="P[1]">
                        <xsl:number level="any" from="content"/>
                    </xsl:for-each>
                </xsl:variable>

                <!-- Variables if P ends with "defended on" -->
                <xsl:variable name="position_ends-with_on_index">
                    <xsl:for-each select="P[ends-with(.,'defended on')]">
                        <xsl:number level="any" from="content"/>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="position_ends-with_on"
                    select="number($position_ends-with_on_index) - (number($P1_index) - 1)"/>

                <xsl:variable name="position_after_ends-with_on"
                    select="number($position_ends-with_on) + 1"/>

                <xsl:variable name="ends-with_on" select="P[ends-with(.,'defended on')]"/>

                <xsl:variable name="after_ends-with_on"
                    select="P[ends-with(.,'defended on')]/following-sibling::P[1]"/>

                <!-- Variables if P ends with "defended" -->
                <xsl:variable name="position_ends-with_defended_index">
                    <xsl:for-each select="P[ends-with(upper-case(.),'defended')]">
                        <xsl:number level="any" from="content"/>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="position_ends-with_defended"
                    select="number($position_ends-with_defended_index) - (number($P1_index) - 1)"/>

                <xsl:variable name="position_after_ends-with_defended"
                    select="number($position_ends-with_defended) + 1"/>

                <xsl:variable name="ends-with_defended"
                    select="P[ends-with(upper-case(.),'defended')]"/>
                <xsl:variable name="after_ends-with_defended"
                    select="P[ends-with(.,'defended')]/following-sibling::P[1]"/>

                <!-- Variables if P starts with "defended" -->
                <xsl:variable name="position_starts-with_defended_index">
                    <xsl:for-each select="P[starts-with(.,'defended')]">
                        <xsl:number level="any" from="content"/>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="position_starts-with_defended"
                    select="number($position_starts-with_defended_index) - (number($P1_index) - 1)"/>

                <xsl:variable name="position_preceding_starts-with_defended"
                    select="number($position_starts-with_defended) - 1"/>

                <xsl:variable name="starts-with_defended" select="P[starts-with(.,'defended')]"/>
                
                <xsl:variable name="preceding_starts-with_defended"
                    select="P[starts-with(.,'defended')]/preceding-sibling::P[1]"/>
                
                <!-- Variables if P starts with a date number -->             
                <!-- matches day, comma, space, year: [\d]{1,2}\W\s[\d]{4} -->
                <!-- matches day with ordinal, comma, space, year: [\d]{1,2}[a-z]{2}\W\s\d{4} -->
                                                        
                <xsl:variable name="position_starts-with_members_index">
                    <xsl:for-each select="P[(starts-with(.,'The members'))]">
                        <xsl:number level="any" from="content"/>
                    </xsl:for-each>
                </xsl:variable>
                
                <xsl:variable name="position_starts-with_members"
                    select="number($position_starts-with_members_index) - (number($P1_index) - 1)"/>
                
                <xsl:variable name="position_following_starts-with_members"
                    select="number($position_starts-with_members) + 1"/>
                
                <xsl:variable name="starts-with_members"
                    select="P[starts-with(.,'The members')]"/>
                
                <xsl:variable name="following_starts-with_members" select="$starts-with_members/following-sibling::P[1]"/>
                
                <xsl:choose>

                    <!-- Merges P following ends-with "defended on" -->
                   <!-- <xsl:when test="P[ends-with(.,'defended on')]">
                        <TaggedPDF-doc>
                                 <xsl:copy-of select="file"/> 
                                 <xsl:copy-of select="P[position() lt number($position_ends-with_on)]"/>
                                 <P><xsl:value-of select="concat($ends-with_on, ' ', $after_ends-with_on)"/></P>
                                 <xsl:copy-of select="P[position() gt number($position_after_ends-with_on)]"/>                                       
                          </TaggedPDF-doc>
                    </xsl:when>-->

                    <!-- Merges P following ends-with "defended" -->
                    <xsl:when test="P[ends-with(.,'defended')]">
                        <TaggedPDF-doc>
                                 <xsl:copy-of select="file"/>
                                 <xsl:copy-of select="P[position() lt number($position_ends-with_defended)]"/>
                                 <P><xsl:value-of select="concat($ends-with_defended, ' ', $after_ends-with_defended)"/></P>
                                 <xsl:copy-of select="P[position() gt number($position_after_ends-with_defended)]"/>                                       
                                 </TaggedPDF-doc>
                    </xsl:when>

                    <!-- Merges P following starts-with "defended" -->
                    <xsl:when test="P[starts-with(.,'defended')]">
                        <TaggedPDF-doc>
                                 <xsl:copy-of select="file"/>
                                 <xsl:copy-of select="P[position() lt number($position_preceding_starts-with_defended)]"/>
                                 <P><xsl:value-of select="concat($preceding_starts-with_defended, ' ', $starts-with_defended)"/></P>
                                 <xsl:copy-of select="P[position() gt number($position_starts-with_defended)]"/>                                       
                                 </TaggedPDF-doc>
                    </xsl:when>
                    
                    <!-- Merges P followed by date-number -->
                    <xsl:when test="P[(starts-with(.,'The members')) and (matches(.[starts-with(.,'The members')]/following-sibling::P[1], '[\d]{1,2}\W\s[\d]{4}'))]">
                        <TaggedPDF-doc>
                                 <xsl:copy-of select="file"/>                    
                                 <xsl:copy-of select="P[position() lt number($position_starts-with_members)]"/>
                                 <P><xsl:value-of select="concat($starts-with_members, ' ', $following_starts-with_members)"/></P>
                                 <xsl:copy-of select="P[position() gt number($position_following_starts-with_members)]"/>                                       
                                 </TaggedPDF-doc>
                    </xsl:when>
                    
                    <!-- Merges P followed by date-ordinal -->
                    <xsl:when test="P[(starts-with(.,'The members')) and (matches(.[starts-with(.,'The members')]/following-sibling::P[1], '[\d]{1,2}[a-z]{2}\W\s\d{4}'))]">
                        <TaggedPDF-doc>
                                 <xsl:copy-of select="file"/>                   
                                 <xsl:copy-of select="P[position() lt number($position_starts-with_members)]"/>
                                 <P><xsl:value-of select="concat($starts-with_members, ' ', $following_starts-with_members)"/></P>
                                 <xsl:copy-of select="P[position() gt number($position_following_starts-with_members)]"/>                                       
                                 </TaggedPDF-doc>
                    </xsl:when>
                    
                    <!-- Merges P followed by date-year -->
                    <xsl:when test="P[(starts-with(.,'The members')) and (matches(.[starts-with(.,'The members')]/following-sibling::P[1], '[\d]{4}(\.|\s)'))]">
                        <TaggedPDF-doc>
                                 <xsl:copy-of select="file"/>                    
                                 <xsl:copy-of select="P[position() lt number($position_starts-with_members)]"/>
                                 <P><xsl:value-of select="concat($starts-with_members, ' ', $following_starts-with_members)"/></P>
                                 <xsl:copy-of select="P[position() gt number($position_following_starts-with_members)]"/>                                       
                                 </TaggedPDF-doc>
                    </xsl:when>
                    
                    <!-- Merges P followed by non-standard and split date. Example: 26</P><P>July 2000.</P> -->
                    <xsl:when test="P[(starts-with(.,'The members')) and (matches(.[starts-with(.,'The members')]/following-sibling::P[1], '[A-za-z]+\s[\d]{4}(\.|\s)'))]">
                        <TaggedPDF-doc>
                                 <xsl:copy-of select="file"/>                    
                                 <xsl:copy-of select="P[position() lt number($position_starts-with_members)]"/>
                                 <P><xsl:value-of select="concat($starts-with_members, ' ', $following_starts-with_members)"/></P>
                                 <xsl:copy-of select="P[position() gt number($position_following_starts-with_members)]"/>                                       
                        </TaggedPDF-doc>
                    </xsl:when>
                             
                    <xsl:otherwise>                      
                            <xsl:copy-of select="."/>                          
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xml>
    </xsl:template>

</xsl:stylesheet>
