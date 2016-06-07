<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:fsul="http://www.lib.fsu.edu" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xs xd">

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>June 4, 2016</xd:p>
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
                <xd:b>fsul:TitleCase</xd:b>
            </xd:p>
            <xd:p>Function to transform string from all caps to first-letter-caps title case.</xd:p>
            <xd:p>This version ignores punctuation. Also note that only titles, names, or keywords in ALL CAPS or keywords in lower-case need to be modified.</xd:p>
            <xd:p><xd:i>Example pattern for UTF-8 code: </xd:i> [a-zA-Z\u00C0-\u017F]</xd:p>
            <xd:p><xd:i>Use double escape to validate in xslt regex: </xd:i>\\u([0-9|abcdefABCDEF]{{4}}) </xd:p>
        </xd:desc>
    </xd:doc>

    <!--    @param $string is the string to process  -->
    <xsl:function name="fsul:TitleCase">
        <xsl:param name="string" as="xs:string"/>
        <xsl:variable name="letters"
            select="'[a-zA-ZÀÁĀĂĄǍǞǠǢǺǼȀȂĆĈĊČÐĎÉÊĒĔĖĘĚȄĜĞĠĢǤǦǴĤĦÍĨĪĬĮİĲǏĴĶǨĹĻĽĿŁŃŅŇŊǸÒÓÔÕÖØŌŎŐŒǑǪǬǾŔŖŘŚŜŞŠŢŤŦÙÚÛÜŨŪŬŮŰŲǓǕǗǙǛŴÝŶŸŹŻŽàáãäåæāăąǎǟǡǣǻǽȁȃçćĉċčďđèéêëēĕėęěȅĝğġģǥǧǵĥħìíîïĩīĭįıĳǐĵķĸǩĺļľŀłńņňŋǹðñòóôõöøōŏőœǒǫǭǿŕŗřśŝşšţťŧùúûüũūŭůűųǔǖǘǚǜŵýÿŷźżž]+'"
            as="xs:string"/>
        <xsl:analyze-string select="$string" regex="{$letters}">
            <xsl:matching-substring>
                <xsl:value-of
                    select="
                        if (matches(., $letters))
                        then
                            concat(substring(., 1, 1), lower-case(substring(., 2)))
                        else
                            if (matches(., '^[a-zàáâãäåæāăąǎǟǡǣǻǽȁȃçćĉċčďđèéêëēĕėęěȅĝğġģǥǧǵĥħìíîïĩīĭįıĳǐĵķĸǩĺļľŀłńņňŋǹðñòóôõöøōŏőœǒǫǭǿŕŗřśŝşšţťŧùúûüũūŭůűųǔǖǘǚǜŵýÿŷźżž]+'))
                            then
                                concat(upper-case(substring(., 1, 1)), substring(., 2))
                            else
                                ()
                        "
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
                <xd:b>fsul:strip-tags</xd:b>
            </xd:p>
            <xd:p>Function to strip HTLML tags from the title and summary fields. This is necessary for transformation to MODS and MARC21 but not Bepress.</xd:p>
            <xd:p>Acknowledgement: Adapted from Joachim Selke: http://blog.joachim-selke.de/2011/01/stripping-html-tags-in-xslt/. Conditional updated to XPath 2.0.</xd:p>
        </xd:desc>
    </xd:doc>
    <!--    @param $string is the string to process  -->
    <xsl:function name="fsul:strip-tags">
        <xsl:param name="string" as="xs:string"/>
        <xsl:analyze-string select="$string" regex="(&lt;[A-Za-z]+&gt;)|(&lt;/[A-Za-z]+&gt;)|(&lt;br\s/&gt;)">
            <xsl:matching-substring>
                <xsl:value-of
                    select="
                        if (regex-group(1)) then
                            replace(regex-group(1), '&lt;[A-Za-z]+>', '')
                        else
                            if (regex-group(2)) then
                                replace(regex-group(2), '&lt;/[A-Za-z]+>', '')
                            else
                                if (regex-group(2)) then
                                    replace(regex-group(3), '&lt;br\s/>', '')
                                else
                                    ()"
                />
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="."/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:function>

    <!--
        ** Work in Progress. Sometimes fsul:strip-tags does not stripp all tags. **
        <xd:doc>
        <xd:desc>
            <xd:p>
                <xd:b>fsul:strip-specific-tags</xd:b>
            </xd:p>
            <xd:p>Function to strip specific HTLML tags from the title and summary fields. This is necessary for transformation to MODS and MARC21 but not Bepress.</xd:p>
       </xd:desc>
    </xd:doc>
    <!-\-    @param $string is the string to process  -\->
    <xsl:function name="fsul:strip-specific-tags">
        <xsl:param name="string" as="xs:string"/>
        <xsl:value-of
            select="
                if (contains($string, '&lt;p')) then
                    concat(substring-before($string, '&lt;p'), fsul:strip-specific-tags(substring-after($string, 'p>')))
                else
                    if (contains($string, '&lt;/p')) then
                        concat(substring-before($string, '&lt;/p'), fsul:strip-specific-tags(substring-after($string, '/p>')))
                    else
                        if (contains($string, '&lt;b')) then
                            concat(substring-before($string, '&lt;b'), fsul:strip-specific-tags(substring-after($string, 'b>')))
                        else
                            if (contains($string, '&lt;/b')) then
                                concat(substring-before($string, '&lt;/b'), fsul:strip-specific-tags(substring-after($string, '/b>')))
                            else
                                if (contains($string, '&lt;i')) then
                                    concat(substring-before($string, '&lt;i'), fsul:strip-specific-tags(substring-after($string, 'i>')))
                                else
                                    if (contains($string, '&lt;/i')) then
                                        concat(substring-before($string, '&lt;/i'), fsul:strip-specific-tags(substring-after($string, '/i>')))
                                    else
                                        if (contains($string, '&lt;em')) then
                                            concat(substring-before($string, '&lt;em'), fsul:strip-specific-tags(substring-after($string, 'em>')))
                                        else
                                            if (contains($string, '&lt;/em')) then
                                                concat(substring-before($string, '&lt;/em'), fsul:strip-specific-tags(substring-after($string, '/em>')))
                                            else
                                                if (contains($string, '&lt;strong')) then
                                                    concat(substring-before($string, '&lt;strong'), fsul:strip-specific-tags(substring-after($string, 'strong>')))
                                                else
                                                    if (contains($string, '&lt;/strong')) then
                                                        concat(substring-before($string, '&lt;/strong'), fsul:strip-specific-tags(substring-after($string, '/strong>')))
                                                    else
                                                        
                                                        $string"
        />
    </xsl:function>
-->
    <xd:doc>
        <xd:desc>
            <xd:p>
                <xd:b>fsul:strip-ordinal</xd:b>
            </xd:p>
            <xd:p>Function to strip ordinals from dates regardless of following punctuation</xd:p>
        </xd:desc>
    </xd:doc>
    <!--    @param $string is string to process  -->
    <xsl:function name="fsul:strip-ordinal">
        <xsl:param name="string" as="xs:string"/>
        <xsl:analyze-string select="normalize-space($string)" regex="[\d]{{1,2}}[a-z]{{2}}">
            <xsl:matching-substring>
                <xsl:value-of select="substring(., 1, string-length(.) - 2)"/>
                <!--<xsl:value-of select="substring(substring(.,2),1,string-length(substring(.,2))-1)"/>-->
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="."/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:function>

    <xd:doc>
        <xd:desc>
            <xd:p>
                <xd:b>fsul:strip-period</xd:b>
            </xd:p>
            <xd:p>Function to strip periods from the end of a text string.</xd:p>
        </xd:desc>
    </xd:doc>
    <!--    @param $string is string to process  -->
    <xsl:function name="fsul:strip-period">
        <xsl:param name="string" as="xs:string"/>
        <xsl:value-of
            select="
                if (ends-with($string, '.')) then
                    (substring($string, 1, (string-length($string) - 1)))
                else
                    $string
                "
        />
    </xsl:function>

    <xd:doc>
        <xd:desc>
            <xd:p>
                <xd:b>fsul:punct-before-article</xd:b>
            </xd:p>
            <xd:p>Function to correct capitalization issues with punctuation before initial articles.</xd:p>
        </xd:desc>
    </xd:doc>
    <!--    @param $string is the string to process  -->
    <xsl:function name="fsul:punct-before-article">
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
                if (matches($string, ': the ')) then
                    (replace($string, ': the ', ': The '))
                else
                    if (matches($string, ': an ')) then
                        (replace($string, ': an ', ': An '))
                    else
                        if (starts-with($string, '“an ')) then
                            (replace($string, '“an ', '“An '))
                        else
                            if (starts-with($string, '“the ')) then
                                (replace($string, '“the ', '“The '))
                            else
                                if (starts-with($string, $quotean)) then
                                    (replace($string, $quotean, $quoteAn))
                                else
                                    if (starts-with($string, $quotethe)) then
                                        (replace($string, $quotethe, $quoteThe))
                                    else
                                        $string"
        />
    </xsl:function>

    <xd:doc>
        <xd:desc>
            <xd:p>
                <xd:b>fsul:apostrophes</xd:b>
            </xd:p>
            <xd:p>Functions to correct known capitalization issues with apostrophes.</xd:p>
        </xd:desc>
    </xd:doc>
    <!--    @param $string is the string to process  -->
    <xsl:function name="fsul:apostrophes">
        <xsl:param name="string" as="xs:string"/>
        <xsl:variable name="aposS">
            <xsl:text>&apos;S </xsl:text>
        </xsl:variable>
        <xsl:variable name="aposT">
            <xsl:text>&apos;T </xsl:text>
        </xsl:variable>
        <xsl:variable name="Dapos">
            <xsl:text>D&apos;</xsl:text>
        </xsl:variable>
        <xsl:variable name="DEapos">
            <xsl:text>De&apos;</xsl:text>
        </xsl:variable>
        <xsl:value-of
            select="
                if (contains($string, '’S ')) then
                    (replace($string, '’S ', '’s '))
                else
                    if (contains($string, $aposS)) then
                        (replace($string, $aposS, lower-case($aposS)))
                    else
                        if (contains($string, '’T ')) then
                            (replace($string, '’T ', '’t '))
                        else
                            if (contains($string, $aposT)) then
                                (replace($string, $aposT, lower-case($aposT)))
                            else
                                if (contains($string, 'D’')) then
                                    (replace($string, 'D’', 'd’'))
                                else
                                    if (contains($string, 'De’')) then
                                        (replace($string, 'De’', 'de’'))
                                    else
                                        if (contains($string, $Dapos)) then
                                            (replace($string, $Dapos, lower-case($Dapos)))
                                        else
                                            if (contains($string, $DEapos)) then
                                                (replace($string, $DEapos, lower-case($DEapos)))
                                            else
                                                $string"
        />
    </xsl:function>

    <xd:doc>
        <xd:desc>
            <xd:p>
                <xd:b>fsul:dateName-to-yyyy-mm-dd</xd:b>
            </xd:p>
            <xd:p>Function to transform date in 'name-of-month, date, year' format to YYYY-MM-DD.</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>
    <!--    @param $date is the string to process  -->
    <xsl:function name="fsul:dateName-to-yyyy-mm-dd" as="xs:string?">
        <xsl:param name="date" as="xs:anyAtomicType?"/>
        <xsl:variable name="months"
            select="
                'January',
                'February',
                'March',
                'April',
                'May',
                'June',
                'July',
                'August',
                'September',
                'October',
                'November',
                'December'"/>
        <xsl:analyze-string select="normalize-space($date)" regex="([A-Z][a-z]+)\s([\d]{{1,2}}),\s([\d]{{4}})">
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
                <xd:b>fsul:dateName-to-mmddyyyy</xd:b>
            </xd:p>
            <xd:p>Function to transform date in 'name-of-month, date, year' format to YYYYMMDD.</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>
    <!--    @param $date is the string to process  -->
    <xsl:function name="fsul:dateName-to-mmddyyyy" as="xs:string?">
        <xsl:param name="date" as="xs:anyAtomicType?"/>
        <xsl:variable name="months"
            select="
                'January',
                'February',
                'March',
                'April',
                'May',
                'June',
                'July',
                'August',
                'September',
                'October',
                'November',
                'December'"/>
        <xsl:analyze-string select="normalize-space($date)" regex="([A-Z][a-z]+)\s([\d]{{1,2}})\s([\d]{{4}})">
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
                <xd:b>fsul:entity2html</xd:b>
            </xd:p>
            <xd:p>
                <xd:b>Function to convert entity references to html references. The values are called from the characters.xml table.</xd:b>
            </xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>

    <!--    @param $string is the string to process  -->
    <xsl:function name="fsul:entity2html">
        <xsl:param name="string"/>
        <xsl:variable name="character-map" select="document('tables/characters.xml')/character-map"/>

        <xsl:analyze-string select="$string" regex="&amp;#[0-9]{{3,4}};">
            <xsl:matching-substring>
                <xsl:value-of
                    select="
                        if ($character-map/character[entity = current()]) then
                            ($character-map/character[entity = current()]/*[(self::html)])
                        else
                            (.)
                        "
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
                <xd:b>fsul:replace-ligatures</xd:b>
            </xd:p>
            <xd:p>
                <xd:b>Function to convert entity references to html references. The values are called from the characters.xml table.</xd:b>
            </xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>

    <!--    @param $string is the string to process  -->

    <xsl:function name="fsul:replace-ligatures">
        <!-- bad coding:  ï¬&#x81; = fi (\xef\xac\x81) ;  ï¬&#x82; = fl (\xef\xac\x82) ; ï¬&#x83; = ffi (\xef\xac\x83)-->
        <xsl:param name="string"/>
        <xsl:analyze-string select="$string" regex="ï¬&#x81;|ï¬&#x82;|ï¬&#x83;|ﬁ|ﬂ|ﬃ">
            <xsl:matching-substring>
                <xsl:value-of
                    select="
                        if ('ï¬&#x81;' = current()) then
                            replace(., ., 'fi')
                        else
                            if ('ﬁ' = current()) then
                                replace(., ., 'fi')
                            else
                                if ('ï¬&#x82;' = current()) then
                                    replace(., ., 'fl')
                                else
                                    if ('ﬂ' = current()) then
                                        replace(., ., 'fl')
                                    else
                                        if ('ï¬&#x83;' = current()) then
                                            replace(., ., 'ffi')
                                        else
                                            if ('ﬃ' = current()) then
                                                replace(., ., 'ffi')
                                            else
                                                ()
                        "
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
                <xd:b>fsul:convert-curly</xd:b>
            </xd:p>
            <xd:p>
                <xd:b>Function to convert utf8 curly quotes characters found in Bepress metadata to straight qotes.</xd:b>
            </xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>

    <!--    @param $string is the string to process  -->
    <xsl:function name="fsul:convert-curly">
        <xsl:param name="string"/>
        <xsl:variable name="quote">
            <xsl:text>&quot;</xsl:text>
        </xsl:variable>
        <xsl:variable name="apos">
            <xsl:text>&apos;</xsl:text>
        </xsl:variable>

        <xsl:variable name="single-entity">
            <xsl:analyze-string select="$string" regex="â&#x80;&#x98;|â&#x80;&#x99;|â&#x80;&#x9a;|â&#x80;&#x9b;">
                <xsl:matching-substring>
                    <xsl:value-of select="
                            translate(., ., $apos)
                            "/>
                </xsl:matching-substring>
                <xsl:non-matching-substring>
                    <xsl:value-of select="."/>
                </xsl:non-matching-substring>
            </xsl:analyze-string>
        </xsl:variable>

        <xsl:variable name="single-character">
            <xsl:analyze-string select="$single-entity" regex="(‘|’|`)">
                <xsl:matching-substring>
                    <xsl:value-of select="replace(., '.', $apos)"/>
                </xsl:matching-substring>
                <xsl:non-matching-substring>
                    <xsl:value-of select="."/>
                </xsl:non-matching-substring>
            </xsl:analyze-string>
        </xsl:variable>

        <xsl:variable name="double-entity">
            <xsl:analyze-string select="$single-character" regex="â&#x80;&#x9c;|â&#x80;&#x9d;|â&#x80;&#x9e;|â&#x80;&#x9f;">
                <xsl:matching-substring>
                    <xsl:value-of select="
                            translate(., ., $quote)
                            "/>
                </xsl:matching-substring>
                <xsl:non-matching-substring>
                    <xsl:value-of select="."/>
                </xsl:non-matching-substring>
            </xsl:analyze-string>
        </xsl:variable>

        <xsl:variable name="double-characters">
            <xsl:analyze-string select="$double-entity" regex="(“|”)">
                <xsl:matching-substring>
                    <xsl:value-of select="replace(., '.', $quote)"/>
                </xsl:matching-substring>
                <xsl:non-matching-substring>
                    <xsl:value-of select="."/>
                </xsl:non-matching-substring>
            </xsl:analyze-string>
        </xsl:variable>

        <xsl:analyze-string select="$double-characters" regex="(\s¡°|¡±\s)">
            <xsl:matching-substring>
                <xsl:value-of select="replace(., '.', $quote)"/>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="."/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:function>

    <xd:doc>
        <xd:desc>
            <xd:p>
                <xd:b>fsul:characters2utf8</xd:b>
            </xd:p>
            <xd:p>
                <xd:b>Function to convert ISO characters and entity references found in Bepress metadata to UTF-8.</xd:b>
            </xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>

    <!-- Other character reference (whether bepress or mods result is not consistent)   
    ¢ª = °
    Â¡Ã&#x9c; = ≤
    Ã[space] = à
    Ã­ = ì
    ¨¹ = ü
    ã = γ
    â = β
    ¨C = — [EM Dash]
    Æ&#x92;Ã[space]  = π
    Â¡Â§ = “
    Â¡Â¨ = ”
    Â¡Ã&#x9d; = ≥
    Ã¡ = 
    Ã¢ = 
    Â¨Â¹ = ü
    Â¡Â¦ = ’
    -->

    <!--    @param $string is the string to process  -->
    <!--Add to table: â&#x80;¦|â&#x89;[¤¥]|-->
    <xsl:function name="fsul:characters2utf8">
        <xsl:param name="string"/>
        <xsl:variable name="unicode-map" select="document('tables/unicode_map.xml')/characters"/>
        <!-- ** Matches to <latin-literal> ** -->
        <!-- Starts a character then two entity references. Example: â&#x80;&#x94; â&#x80;&#x93;-->
        <xsl:variable name="entities-double">
            <xsl:analyze-string select="$string"
                regex="â&#x80;&#x83;|â&#x80;&#x90;|â&#x80;&#x93;|â&#x80;&#x94;|â&#x80;&#x95;|â&#x80;&#x96;|â&#x80;&#x89;|â&#x82;&#x82;|â&#x84;&#x83;|â&#x84;&#x93;|â&#x86;&#x90;|â&#x86;&#x91;|â&#x86;&#x92;|â&#x86;&#x93;|â&#x88;&#x82;|â&#x88;&#x86;|â&#x88;&#x92;|â&#x88;&#x92;|â&#x88;&#x99;|â&#x88;&#x9a;|â&#x88;&#x9b;|â&#x88;&#x9c;|â&#x88;&#x9d;|â&#x88;&#x9e;|â&#x8b;&#x85;|â&#x8b;&#x86;|â&#x89;&#x88;|â&#x94;&#x80;|Â¦Ã&#x81;|Â¦Ã&#x82;|Â¦Ã&#x8b;|Â¡Ã&#x96;|Â¡Ã&#x9c;|Â¡Ã&#x9d;|á¹&#x87;|ï¼&#x8d;">

                <xsl:matching-substring>
                    <xsl:value-of
                        select="
                            if ($unicode-map/unicode[latin-literal = current()]) then
                                ($unicode-map/unicode[latin-literal = current()]/*[(self::character)])
                            else
                                (.)
                            "
                    />
                </xsl:matching-substring>
                <xsl:non-matching-substring>
                    <xsl:value-of select="."/>
                </xsl:non-matching-substring>
            </xsl:analyze-string>
        </xsl:variable>

        <!-- Starts a character then an entity references then a character. Example: â&#x88;¼. Note the space necessary in "Æ&#x92;Ã "  -->
        <!--add â&#x80;°' = '‰' | ï&#x81;¡ = ?? |-->
        <xsl:variable name="entities-double-character">
            <xsl:analyze-string select="$entities-double"
                regex="â&#x88;¼|â&#x80;¦|â&#x89;¥|â&#x89;¤|â&#x80;¢|Æ&#x92;Ý|â&#x84;¢|â&#x84;«|â&#x80;°|ï&#x81;¡|Æ&#x92;¢|â&#x81;°|Ã&#x83;Â¶|Ã&#x83;Â±|Æ&#x92;Ã|â&#x80;²|Ã&#x82;Â°">
                <xsl:matching-substring>
                    <xsl:value-of
                        select="
                            if ($unicode-map/unicode[latin-literal = current()]) then
                                replace(., ., $unicode-map/unicode[latin-literal = current()]/*[(self::character)])
                            else
                                (.)
                            "
                    />
                </xsl:matching-substring>
                <xsl:non-matching-substring>
                    <xsl:value-of select="."/>
                </xsl:non-matching-substring>
            </xsl:analyze-string>
        </xsl:variable>

        <!-- Starts with specific class of character then entity reference. Example: Ã&#x80; -->
        <xsl:variable name="entity-single">
            <!--Add to table: 
            Ï&#x88;
            Å&#x8f;
            -->
            <xsl:analyze-string select="$entities-double-character"
                regex="â&#x89;|Ã&#x80;|Ã&#x81;|Ã&#x82;|Ã&#x83;|Ã&#x84;|Ã&#x85;|Ã&#x86;|Ã&#x87;|Ã&#x88;|Ã&#x89;|Ã&#x8a;|Ã&#x8b;|Ã&#x8c;|Ã&#x8d;|Ã&#x8e;|Ã&#x8f;|Ã&#x90;|Ã&#x91;|Ã&#x92;|Ã&#x93;|Ã&#x94;|Ã&#x95;|Ã&#x96;|Ã&#x97;|Ã&#x98;|Ã&#x99;|Ã&#x9a;|Ã&#x9b;|Ã&#x9c;|Ã&#x9d;|Ã&#x9e;|Ã&#x9f;|Ä&#x80;|Ä&#x81;|Ä&#x82;|Ä&#x83;|Ä&#x84;|Ä&#x85;|Ä&#x86;|Ä&#x87;|Ä&#x88;|Ä&#x89;|Ä&#x8a;|Ä&#x8b;|Ä&#x8c;|Ä&#x8d;|Ä&#x8e;|Ä&#x8f;|Ä&#x90;|Ä&#x91;|Ä&#x92;|Ä&#x93;|Ä&#x94;|Ä&#x95;|Ä&#x96;|Ä&#x97;|Ä&#x98;|Ä&#x99;|Ä&#x9a;|Ä&#x9b;|Ä&#x9c;|Ä&#x9d;|Ä&#x9e;|Ä&#x9f;|Å&#x80;|Å&#x81;|Å&#x82;|Å&#x83;|Å&#x84;|Å&#x85;|Å&#x86;|Å&#x87;|Å&#x88;|Å&#x89;|Å&#x8a;|Å&#x8b;|Å&#x8c;|Å&#x8d;|Å&#x8e;|Å&#x8f;|Å&#x90;|Å&#x91;|Å&#x92;|Å&#x93;|Å&#x94;|Å&#x95;|Å&#x96;|Å&#x97;|Å&#x98;|Å&#x99;|Å&#x9a;|Å&#x9b;|Å&#x9c;|Å&#x9d;|Å&#x9e;|Å&#x9f;|Ë&#x86;|Ë&#x87;|Ë&#x98;|Ë&#x99;|Ë&#x9a;|Ë&#x9b;|Ë&#x9c;|Ë&#x9d;|É&#x94;|Ì&#x91;|Î&#x91;|Î&#x92;|Î&#x93;|Î&#x94;|Î&#x95;|Î&#x96;|Î&#x97;|Î&#x98;|Î&#x99;|Î&#x9a;|Î&#x9b;|Î&#x9c;|Î&#x9d;|Î&#x9e;|Î&#x9f;|Ï&#x80;|Ï&#x81;|Ï&#x82;|Ï&#x83;|Ï&#x84;|Ï&#x85;|Ï&#x86;|Ï&#x87;|Ï&#x87;|Ï&#x88;|Ï&#x89;|Ï&#x91;|Ï&#x92;|Ï&#x95;|Ï&#x96;|Ï&#x87;|Ï&#x9c;|Ï&#x9d;|Ð&#x81;|Ð&#x82;|Ð&#x83;|Ð&#x84;|Ð&#x85;|Ð&#x86;|Ð&#x87;|Ð&#x88;|Ð&#x89;|Ð&#x8a;|Ð&#x8b;|Ð&#x8c;|Ð&#x8d;|Ð&#x8e;|Ð&#x8f;|Ð&#x90;|Ð&#x91;|Ð&#x92;|Ð&#x93;|Ð&#x94;|Ð&#x95;|Ð&#x96;|Ð&#x97;|Ð&#x98;|Ð&#x99;|Ð&#x9a;|Ð&#x9b;|Ð&#x9c;|Ð&#x9d;|Ð&#x9e;|Ð&#x9f;|Ñ&#x80;|Ñ&#x81;|Ñ&#x82;|Ñ&#x83;|Ñ&#x84;|Ñ&#x85;|Ñ&#x86;|Ñ&#x87;|Ñ&#x88;|Ñ&#x89;|Ñ&#x8a;|Ñ&#x8b;|Ñ&#x8c;|Ñ&#x8d;|Ñ&#x8e;|Ñ&#x8f;|Ñ&#x91;|Ñ&#x92;|Ñ&#x93;|Ñ&#x94;|Ñ&#x95;|Ñ&#x96;|Ñ&#x97;|Ñ&#x98;|Ñ&#x99;|Ñ&#x9a;|Ñ&#x9b;|Ñ&#x9c;|Ñ&#x9d;|Ñ&#x9e;|Ñ&#x9f;">
                <!-- Unknown why 'Ï&#x87;' doesn't convert on Paper 0058 
                                  Ä&#x9b; on Paper 2734
                -->
                <xsl:matching-substring>
                    <xsl:for-each select=".">
                        <xsl:value-of
                            select="
                                if ($unicode-map/unicode[latin-literal = current()]) then
                                    replace(., ., $unicode-map/unicode[latin-literal = current()]/*[(self::character)])
                                else
                                    (.)
                                "
                        />
                    </xsl:for-each>
                </xsl:matching-substring>
                <xsl:non-matching-substring>
                    <xsl:value-of select="."/>
                </xsl:non-matching-substring>
            </xsl:analyze-string>
        </xsl:variable>

        <!-- Starts with specific class of characters followed by another class of characters. Example: Ã¡  -->
        <xsl:variable name="latin-double">
            <!-- Unkown why Ã¡ and Ã¢ do not convert in bepress etd-2842. Both are present in unicode table. 
                Note that in the xml that didn't transform, these corresond to α,β not á,â as is on the table -->
            <xsl:analyze-string select="$entity-single" regex="[ÂÃÅÄÆÇÈÉÌÎÏÐ]{{1}}[¡¢£¤¥¦§¨©ª«¬®¯°±¹²³´µ¶·¸¹º»¼½¾¿­]{{1}}">
                <xsl:matching-substring>
                    <xsl:value-of
                        select="
                            if ($unicode-map/unicode[latin-literal = current()]) then
                                ($unicode-map/unicode[latin-literal = current()]/*[(self::character)])
                            else
                                (.)
                            "
                    />
                </xsl:matching-substring>
                <xsl:non-matching-substring>
                    <xsl:value-of select="."/>
                </xsl:non-matching-substring>
            </xsl:analyze-string>
        </xsl:variable>

        <xsl:value-of select="$latin-double"/>

    </xsl:function>

</xsl:stylesheet>
