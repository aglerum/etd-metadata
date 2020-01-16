<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fs="http://www.lib.fsu.edu" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd fs" version="2.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>June 4, 2016</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Delete lines</xd:p>
        </xd:desc>
    </xd:doc>
    
    <!-- Generic identity template -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- Elements that are deleted -->
    <xsl:template match="xml/lines/line[upper-case(.) = 'BY']" priority="1"/>
    <xsl:template match="xml/lines/line[upper-case(.) = 'BY ']" priority="1"/>
    <xsl:template match="xml/lines/line[upper-case(.) = 'BY:']" priority="1"/>
    <xsl:template match="xml/lines/line[upper-case(.) = 'BY: ']" priority="1"/>
    <xsl:template match="xml/lines/line[upper-case(.) = 'BY!']" priority="1"/>
    <xsl:template match="xml/lines/line[upper-case(.) = 'BY!']" priority="1"/>
    <xsl:template match="xml/lines/line[upper-case(.) = 'RECEIVED:']" priority="1"/>
    <xsl:template match="xml/lines/line[upper-case(.) = 'MEMBERS.']" priority="1"/>
    <xsl:template match="xml/lines/line[upper-case(.) = 'ALL RIGHTS RESERVED']" priority="1"/>
    <xsl:template match="xml/lines/line[upper-case(.) = 'ALL RIGHTS RESERVED.']" priority="1"/>
    <xsl:template match="xml/lines/line[upper-case(.) = 'ACKNOWLEDGEMENTS']" priority="1"/>
    <xsl:template match="xml/lines/line[. = '11']" priority="1"/>
    <xsl:template match="xml/lines/line[. = '(signed)']" priority="1"/>
    <xsl:template match="xml/lines/line[. = 'i']" priority="1"/>
    <xsl:template match="xml/lines/line[. = 'ii']" priority="1"/>
    <xsl:template match="xml/lines/line[. = 'iii']" priority="1"/>
    <xsl:template match="xml/lines/line[. = 'iiii']" priority="1"/>
    <xsl:template match="xml/lines/line[. = 'c']" priority="1"/>
    <xsl:template match="xml/lines/line[. = '.']" priority="1"/>
    <xsl:template match="xml/lines/line[. = '–']" priority="1"/>
    <xsl:template match="xml/lines/line[. = '– ']" priority="1"/>
    <xsl:template match="xml/lines/line[starts-with(.,'_') and ends-with(.,'_')]" priority="1"/>
    <xsl:template match="xml/lines/line[. = '&#x2028;']" priority="1"/>
    <xsl:template match="xml/lines/line[starts-with(., 'The members of the supervisory committee were:')]" priority="1"/>
    <xsl:template match="xml/lines/line[starts-with(., '©')]" priority="1"/>
    <xsl:template match="xml/lines/line[starts-with(., 'Copyright ©')]" priority="1"/>
    <xsl:template match="xml/lines/line[starts-with(., 'Copyright©')]" priority="1"/>
    <xsl:template match="xml/lines/line[starts-with(., '!')]" priority="1"/>
    <xsl:template match="xml/lines/line[starts-with(., '�') and ends-with(., '�')]" priority="1"/>
    <xsl:template match="xml/lines/line[starts-with(., 'http://') and ends-with(., '/')]" priority="1"/>
    <xsl:template match="xml/lines/line[starts-with(upper-case(.), 'THE OFFICE OF GRADUATE STUDIES ')]" priority="1"/>
    <xsl:template match="xml/lines/line[starts-with(upper-case(.), 'OFFICE OF GRADUATE STUDIES ')]" priority="1"/>
    <xsl:template match="xml/lines/line[starts-with(upper-case(.), 'THE OFFICE FOR GRADUATE STUDIES ')]" priority="1"/>
    <xsl:template match="xml/lines/line[starts-with(upper-case(.), 'THE OFFICE OF GRADATE STUDIES ')]" priority="1"/>
    <xsl:template match="xml/lines/line[starts-with(upper-case(.), 'THE GRADUATE SCHOOL HAS VERIFIED')]" priority="1"/>
    <xsl:template match="xml/lines/line[starts-with(upper-case(.), 'THEGRADUATESCHOOLHASVERIFIED')]" priority="1"/>
    <xsl:template match="xml/lines/line[starts-with(upper-case(.), 'CERTIFIES THAT THE ')]" priority="1"/>
    <xsl:template match="xml/lines/line[starts-with(upper-case(.), 'TABLE OF CONTENTS')]" priority="1"/>
    <xsl:template match="xml/lines/line[starts-with(upper-case(.), 'LIST OF TABLE')]" priority="1"/>
    <xsl:template match="xml/lines/line[starts-with(upper-case(.), 'LIST OF FIGURES')]" priority="1"/>
    <xsl:template match="xml/lines/line[starts-with(upper-case(.), 'ABSTRACT')]" priority="1"/>
    <xsl:template match="xml/lines/line[starts-with(upper-case(.), 'CHAPTER I')]" priority="1"/>
    <xsl:template
        match="xml/lines/line[position() gt 8 and (matches(upper-case(.), '\DCHAIR\D') or matches(upper-case(.), '\DCHAIR\D') or matches(upper-case(.), '\DCDEAN\D') or matches(upper-case(.), '\DDEAN\D') or matches(upper-case(.), '\DCHAIRPERSON\D') or matches(upper-case(.), '\DHEAD\D') or matches(upper-case(.), '\DDIRECTOR\D') or matches(upper-case(.), '\DDIRECTOR\D'))]"
        priority="2"/>
    
    <xsl:template match="xml/lines/line[starts-with(upper-case(.), 'COPYRIGHT') and ends-with(upper-case(.), 'RESERVED.')]" priority="3"/>
    <xsl:template match="xml/lines/line[starts-with(upper-case(.), 'COPYRIGHT') and ends-with(upper-case(.), 'RESERVED')]" priority="4"/>    
    <xsl:template match="xml/lines/line[starts-with(upper-case(.), 'COPYRIGHT') and ends-with(upper-case(.), 'RESERVE')]" priority="5"/>
    <xsl:template match="xml/lines/line[ends-with(upper-case(.),'RIGHTS RESERVED.')]" priority="6"/>
    <xsl:template match="xml/lines/line[ends-with(upper-case(.),'RIGHTS RESERVED')]" priority="7"/>
    <xsl:template match="xml/lines/line[(position() gt 7) and upper-case(.) = 'APPROVED']" priority="8"/>
    <xsl:template match="xml/lines/line[(position() gt 7) and upper-case(.) = 'APPROVED:']" priority="9"/>
    <xsl:template match="xml/lines/line[(position() gt 7) and upper-case(.) = 'APPROVED BY']" priority="10"/>
    <xsl:template match="xml/lines/line[(position() gt 7) and upper-case(.) = 'APPROVED BY:']" priority="11"/>
    <xsl:template match="xml/lines/line[(position() gt 7) and upper-case(.) = 'MEMBERS.']" priority="12"/>
    <xsl:template match="xml/lines/line[(position() gt 7) and (matches(upper-case(.), 'COMMITTEE MEMBERS.'))]" priority="13"/>
    <xsl:template match="xml/lines/line[(position() gt 7) and (matches(upper-case(.), 'DEAN.'))]" priority="14"/>
    
</xsl:stylesheet>
