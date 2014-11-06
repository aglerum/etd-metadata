<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:fs="http://www.lib.fsu.edu" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd">
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>November 1, 2014</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Functions for processing FSU metadata</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xd:doc>
        <xd:desc>
            <xd:p>
                <xd:b>fs:TitleCase</xd:b>
            </xd:p>
            <xd:p>Function to transform string from all caps to first-letter-caps title case.</xd:p>
            <xd:p>This version ignores punctuation. Also note that only titles, names, or keywords in ALL CAPS or keywords in lower-case need to be modified.</xd:p>
        </xd:desc>
    </xd:doc>
    <!--    @param $string is the string to process  -->
    <xsl:function name="fs:TitleCase">
        <xsl:param name="string" as="xs:string"/>
        <!-- Note: This regex may need the addition of more diacritics. Use Edit/Insert from Character Map. For more refernce, see http://dev.w3.org/html5/html-author/charref -->
        <xsl:analyze-string select="$string"
            regex="[a-zA-ZàèìòùÀÈÌÒÙáéíóúýÁÉÍÓÚÝâêîôûÂÊÎÔÛãñõÃÑÕäëïöüÿÄËÏÖÜŸİāēīōūĀĒĪŌŪçÇşŞßØøÅåÆæœ]+">
            <xsl:matching-substring>
                <xsl:value-of
                    select="if (matches(.,'[A-Z-[a-z]]+')) then concat(substring(.,1,1),lower-case(substring(.,2))) else
                    if (matches(.,'^[a-z]+')) then concat(upper-case(substring(.,1,1)),substring(.,2)) else '' "
                />
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="."/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:function>

    <xd:doc>
        <xd:desc>
            <xd:p>
                <xd:b>fs:strip-tags</xd:b>
            </xd:p>
            <xd:p>Function to strip HTLML tags from the title and summary fields. This is necessary for transformation to MARC21 but not for Bepress.</xd:p>
            <xd:p>Acknowledgement: Adapted from Joachim Selke: http://blog.joachim-selke.de/2011/01/stripping-html-tags-in-xslt/. Conditional
                updated to XPath 2.0.</xd:p>
        </xd:desc>
    </xd:doc>
    <!--    @param $string is the string to process  -->
    <xsl:function name="fs:strip-tags">
        <xsl:param name="string" as="xs:string"/>
        <xsl:value-of
            select="if (contains($string, '&lt;')) then concat(substring-before($string, '&lt;'),fs:strip-tags(substring-after($string, '&gt;'))) else $string"
        />
    </xsl:function>

    <xd:doc>
        <xd:desc>
            <xd:p>
                <xd:b>fs:strip-ordinal</xd:b>
            </xd:p>
            <xd:p>Function to strip ordinals from dates. A comma following the ordinal date is assumed.</xd:p>
        </xd:desc>
    </xd:doc>
    <!--    @param $string is string to process  -->
    <xsl:function name="fs:strip-ordinal">
        <xsl:param name="string" as="xs:string"/>
        <xsl:value-of
            select="
            if (contains($string,'st,')) then (replace($string,'st,',',')) else
            if (contains($string,'nd,')) then (replace($string,'nd,',',')) else 
            if (contains($string,'rd,')) then (replace($string,'rd,',',')) else
            if (contains($string,'th,')) then (replace($string,'th,',',')) else
            $string"
        />
    </xsl:function>

    <xd:doc>
        <xd:desc>
            <xd:p>
                <xd:b>fs:strip-period</xd:b>
            </xd:p>
            <xd:p>Function to strip periods from the end of the text.</xd:p>
        </xd:desc>
    </xd:doc>
    <!--    @param $string is string to process  -->
    <xsl:function name="fs:strip-period">
        <xsl:param name="string" as="xs:string"/>
        <xsl:value-of
            select="
            if (ends-with($string,'.')) then (substring($string,1,(string-length($string)-1))) else
            $string"
        />
    </xsl:function>

    <xd:doc>
        <xd:desc>
            <xd:p>
                <xd:b>fs:punct-before-article</xd:b>
            </xd:p>
            <xd:p>Function to correct capitalization issues with punctuation before initial articles.</xd:p>
        </xd:desc>
    </xd:doc>
    <!--    @param $string is the string to process  -->
    <xsl:function name="fs:punct-before-article">
        <xsl:param name="string" as="xs:string"/>
        <xsl:variable name="quotean">
            <xsl:text>&quot;an </xsl:text>
        </xsl:variable>
        <xsl:variable name="quoteAn">
            <xsl:text>&quot;An </xsl:text>
        </xsl:variable>
        <xsl:variable name="quotethe">
            <xsl:text>&quot;the </xsl:text>
        </xsl:variable>
        <xsl:variable name="quoteThe">
            <xsl:text>&quot;The </xsl:text>
        </xsl:variable>

        <xsl:value-of
            select="          
            if (matches($string,': the ')) then (replace($string,': the ',': The ')) else
            if (matches($string,': an ')) then (replace($string,': an ',': An ')) else 
            if (starts-with($string,'“an ')) then (replace($string,'“an ','“An ')) else 
            if (starts-with($string,'“the ')) then (replace($string,'“the ','“The ')) else 
            if (starts-with($string, $quotean)) then (replace($string,$quotean,$quoteAn)) else 
            if (starts-with($string, $quotethe)) then (replace($string,$quotethe,$quoteThe)) else 
            $string"
        />
    </xsl:function>

    <xd:doc>
        <xd:desc>
            <xd:p>
                <xd:b>fs:apostrophes</xd:b>
            </xd:p>
            <xd:p>Functions to correct capitalization known issues with apostrophes.</xd:p>
        </xd:desc>
    </xd:doc>
    <!--    @param $string is the string to process  -->
    <xsl:function name="fs:apostrophes">
        <xsl:param name="string" as="xs:string"/>
        <xsl:variable name="aposS">
            <xsl:text>&apos;S </xsl:text>
        </xsl:variable>
        <xsl:variable name="Dapos">
            <xsl:text>D&apos;</xsl:text>
        </xsl:variable>
        <xsl:variable name="DEapos">
            <xsl:text>De&apos;</xsl:text>
        </xsl:variable>
        <xsl:value-of
            select="
            if (contains($string, '’S ')) then (replace($string, '’S ','’s ')) else
            if (contains($string, $aposS)) then (replace($string, $aposS, lower-case($aposS))) else
            if (contains($string, 'D’')) then (replace($string, 'D’', 'd’')) else
            if (contains($string, 'De’')) then (replace($string, 'De’', 'de’')) else
            if (contains($string, $Dapos)) then (replace($string, $Dapos, lower-case($Dapos))) else        
            if (contains($string, $DEapos)) then (replace($string, $DEapos, lower-case($DEapos))) else            
            $string"
        />
    </xsl:function>
    
    <xd:doc>
        <xd:desc>
            <xd:p>
                <xd:b>fs:exclamation</xd:b>
            </xd:p>
            <xd:p>Function delete exclamation points in non-title fields.</xd:p>
        </xd:desc>
    </xd:doc>
    <!--    @param $string is the string to process  -->
    <xsl:function name="fs:exclamation">
        <xsl:param name="string" as="xs:string"/>
        <xsl:variable name="exclamation">
            <xsl:text>!</xsl:text>
        </xsl:variable>
        <xsl:value-of
            select="
            if (contains($string, $exclamation)) then (replace($string, $exclamation,'')) else          
            $string"
        />
    </xsl:function>

    <xd:doc>
        <xd:desc>
            <xd:p>
                <xd:b>fs:dateName-to-yyyy-mm-dd</xd:b>
            </xd:p>
            <xd:p>Function to transform date in 'name-of-month, date, year' format to YYYY-MM-DD.</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>
    <!--    @param $date is the string to process  -->
    <xsl:function name="fs:dateName-to-yyyy-mm-dd" as="xs:string?">
        <xsl:param name="date" as="xs:anyAtomicType?"/>
        <xsl:variable name="months"
            select="'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'"/>
        <xsl:analyze-string select="normalize-space($date)"
            regex="([A-Z][a-z]+)\s([\d]{{1,2}})\s([\d]{{4}})">
            <xsl:matching-substring>
                <date>
                    <xsl:number value="regex-group(3)"/>
                    <xsl:text>-</xsl:text>
                    <xsl:number value="index-of($months, regex-group(1))" format="01"/>
                    <xsl:text>-</xsl:text>
                    <xsl:number value="regex-group(2)" format="01"/>
                </date>
            </xsl:matching-substring>
            <xsl:non-matching-substring/>
        </xsl:analyze-string>
    </xsl:function>

    <xd:doc>
        <xd:desc>
            <xd:p>
                <xd:b>fs:dateName-to-mmddyyyy</xd:b>
            </xd:p>
            <xd:p>Function to transform date in 'name-of-month, date, year' format to
                    YYYYMMDD.</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>
    <!--    @param $date is the string to process  -->
    <xsl:function name="fs:dateName-to-mmddyyyy" as="xs:string?">
        <xsl:param name="date" as="xs:anyAtomicType?"/>
        <xsl:variable name="months"
            select="'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'"/>
        <xsl:analyze-string select="normalize-space($date)"
            regex="([A-Z][a-z]+)\s([\d]{{1,2}})\s([\d]{{4}})">
            <xsl:matching-substring>
                <date>
                    <xsl:number value="index-of($months, regex-group(1))" format="01"/>
                    <xsl:text>/</xsl:text>
                    <xsl:number value="regex-group(2)" format="01"/>
                    <xsl:text>/</xsl:text>
                    <xsl:number value="regex-group(3)"/>
                </date>
            </xsl:matching-substring>
            <xsl:non-matching-substring/>
        </xsl:analyze-string>
    </xsl:function>

    <xd:doc>
        <xd:desc>
            <xd:p>
                <xd:b>fs:entity2html</xd:b>
            </xd:p>
            <xd:p>
                <xd:b>Function to convert entity references to html references. The values are called from the characters.xml table.</xd:b>
            </xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>
    <!--    @param $string is the string to process  -->
    <xsl:function name="fs:entity2html">
        <xsl:param name="string"/>
        <xsl:variable name="character-map" select="document('tables/characters.xml')/character-map"/>

        <xsl:analyze-string select="$string" regex="&amp;#[0-9]{{3,4}};">
            <xsl:matching-substring>
                <xsl:value-of
                    select="
                    if ($character-map/character[entity = current()]) then ($character-map/character[entity = current()]/*[(self::html)]) else
                    (.)"
                />
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="."/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:function>

</xsl:stylesheet>
