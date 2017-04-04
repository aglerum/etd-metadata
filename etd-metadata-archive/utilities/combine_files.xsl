<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
        
    <!-- Run this  on a dummy XML containing only the <xml> root element. Relearn how to do this with script (have done this before!) --> 
    <xsl:template match="/">
        <xml>
<!-- Revised Example Windows-->
<!-- <xsl:copy-of select="document('file:///c:/Users/aglerum/Dropbox/ETDs/extract_2014SP/Alexander_fsu_0071E_11702_info.xml')"/>-->

<!-- Example Windows-->
<!--<xsl:copy-of select="document('C:\Users\aglerum\Documents\Annie\ETD cataloging\Su-Fa2013_ETDs\Su-Fa 2013 metadata\Absher_fsu_0071N_11160_DATA.xml')"/>-->

<!-- Example Mac-->
<!--<xsl:copy-of select="document('/Users/Annie/Desktop/ETDS-Fall2013/DATA/Afaq_fsu_0071E_11478_DATA.xml')"/>-->
            
                        
        </xml>
        
        <xsl:result-document method="xml" href="combined-files.xml"/>
    </xsl:template>
 </xsl:stylesheet>