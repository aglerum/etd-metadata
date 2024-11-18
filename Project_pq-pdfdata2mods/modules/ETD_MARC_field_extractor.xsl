<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:marc="http://www.loc.gov/MARC21/slim"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xs xd" version="2.0">
    
    <xsl:output method="text" indent="yes" encoding="UTF-8" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>December 4, 2021</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University Libraries</xd:p>
            <xd:p><xd:b>Title: </xd:b>Get Alma MARC Data for Titles List</xd:p>
            <xd:p>Get key descriptive elements for review</xd:p>
        </xd:desc>
    </xd:doc>
    
    
    <xsl:template match="/">
        <xsl:text>050&#x9;100&#x9;245&#x9;502&#x9;650&#x9;856&#x9;904&#13;</xsl:text>
        <!-- Tab Delimiter -->
        <xsl:variable name="delimiter" select="'&#x9;'"/>
   
        <xsl:for-each select="marc:collection/marc:record">
           
           <!-- 050 field -->
           <xsl:variable name="field_050">
               <xsl:value-of select="marc:datafield[@tag = '050']/marc:subfield[@code = 'a']"/>
           </xsl:variable>
          
           <!-- 100 field -->
           <xsl:variable name="field_100">
               <xsl:value-of select ="marc:datafield[@tag = '100']/*"/>
           </xsl:variable> 
          
           <!-- 245 field -->
           <xsl:variable name="field_245">
               <xsl:value-of select ="marc:datafield[@tag = '245']/*"/>
           </xsl:variable>
           
           <!-- 502_field -->
           <xsl:variable name="field_502">
               <xsl:value-of select="marc:datafield[@tag = '502']/*"/>
           </xsl:variable>
           
           <!-- 650_field> -->
           <xsl:variable name="field_650">
               <xsl:value-of select="marc:datafield[@tag = '650'][1]/marc:subfield[@code = 'a']"/>
           </xsl:variable>
           
           <!-- 856_field -->
           <xsl:variable name="field_856">
               <xsl:value-of select="marc:datafield[@tag = '856']/marc:subfield[@code = 'u']"/>
           </xsl:variable>   
           
           <!-- 904_field --> 
           <xsl:variable name="field_904">
               <xsl:value-of select="marc:datafield[@tag = '904']/marc:subfield[@code = 'a']"/>
           </xsl:variable> 

           <xsl:value-of select="concat(normalize-space($field_050), $delimiter, normalize-space($field_100), $delimiter, normalize-space($field_245), $delimiter, normalize-space($field_502), $delimiter, normalize-space($field_650), $delimiter, normalize-space($field_856), $delimiter, normalize-space($field_904), '&#13;')"/>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>