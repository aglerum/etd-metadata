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
            <xd:p><xd:b>Title: </xd:b>Step 7: Merge split member statements</xd:p>           
            <xd:p><xd:b>Version: </xd:b>Proquest2MODS</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template match="/">
        <xml>
            <xsl:for-each select="xml/TaggedPDF-doc">

                <!-- All degree types -->
                <xsl:variable name="starts-with_university"
                    select="P[starts-with(.,'University Representative')]"/>
                <xsl:variable name="starts-with_outside"
                    select="P[starts-with(.,'Outside Committee Member')]"/>
                <xsl:variable name="starts-with_committee"
                    select="P[starts-with(.,'Committee Member')]"/>
                <xsl:variable name="ends-with_university"
                    select="P[ends-with(.,' University Representative')]"/>
                <xsl:variable name="ends-with_outside"
                    select="P[ends-with(.,' Outside Committee Member')]"/>
                <xsl:variable name="ends-with_committee"
                    select="P[ends-with(.,' Committee Member') and not(contains(.,'Outside'))]"/>

                <!-- Dissertations -->
                <xsl:variable name="dissertation_defended"
                    select="P[7][contains(upper-case(.),'DISSERTATION')]"/>
                <xsl:variable name="starts-with_diss_professor_direct"
                    select="P[starts-with(.,'Professor Directing Dissertation')]"/>
                <xsl:variable name="starts-with_diss_professor_co-direct"
                    select="P[starts-with(.,'Professor Co-Directing Dissertation')]"/>
                <xsl:variable name="ends-with_diss_professor_direct"
                    select="P[ends-with(.,' Professor Directing Dissertation')]"/>
                <xsl:variable name="ends-with_diss_professor_co-direct"
                    select="P[ends-with(.,' Professor Co-Directing Dissertation')]"/>

                <xsl:for-each select=".[matches(upper-case(P[7]),'DISSERTATION')]">
                    <xsl:choose>
                        <xsl:when
                            test="P[not($starts-with_diss_professor_direct or $starts-with_diss_professor_co-direct or $starts-with_university or $starts-with_outside or $starts-with_committee)]">
                            <xsl:copy-of select="."/>
                        </xsl:when>
                        <xsl:when
                            test="P[$starts-with_diss_professor_direct or $starts-with_diss_professor_co-direct or $starts-with_university or $starts-with_outside or $starts-with_committee]">
                            <TaggedPDF-doc>
                            <xsl:copy-of select="file"/>
                            <xsl:copy-of select="$dissertation_defended/preceding-sibling::P[position() lt 7]"/>
                            <xsl:copy-of select="$dissertation_defended"/>
                           
                            <xsl:if test="P[8]">
                             
                                    <xsl:if test="$starts-with_diss_professor_direct">
                                        <P>
                                            <xsl:value-of select="concat($starts-with_diss_professor_direct/preceding-sibling::P[1],' ','Professor Directing Dissertation')"/>
                                        </P>
                                    </xsl:if> 
                                    <xsl:if test="$ends-with_diss_professor_direct">
                                            <xsl:copy-of select="$ends-with_diss_professor_direct"/>                                        
                                    </xsl:if> 
                                    <xsl:if test="$starts-with_diss_professor_co-direct">
                                        <xsl:for-each select="$starts-with_diss_professor_co-direct/preceding-sibling::P[1]">
                                            <xsl:variable name="diss_professor_co-direct_name">
                                                <xsl:value-of select="."/>
                                            </xsl:variable>
                                         <P>
                                            <xsl:value-of select="concat($diss_professor_co-direct_name,' ','Professor Co-Directing Dissertation')"/>
                                        </P>
                                        </xsl:for-each>
                                    </xsl:if>
                                    <xsl:if test="$ends-with_diss_professor_co-direct">
                                            <xsl:copy-of select="$ends-with_diss_professor_co-direct"/>                                     
                                    </xsl:if> 
                                   <xsl:if test="$starts-with_outside">
                                        <P>
                                            <xsl:value-of select="concat($starts-with_outside/preceding-sibling::P[1],' ','Outside Committee Member')"/>            
                                        </P>
                                    </xsl:if>
                                    <xsl:if test="$ends-with_outside">                                           
                                            <xsl:copy-of select="$ends-with_outside"/>                                        
                                    </xsl:if>
                                    
                                    <xsl:if test="$starts-with_university">
                                        <P>
                                            <xsl:value-of select="concat($starts-with_university/preceding-sibling::P[1],' ','University Representative')"/>            
                                        </P>
                                    </xsl:if>
                                    <xsl:if test="$ends-with_university">                                           
                                            <xsl:copy-of select="$ends-with_university"/>                                        
                                    </xsl:if>
                                
                                    <xsl:if test="$starts-with_committee">
                                        <xsl:for-each select="$starts-with_committee/preceding-sibling::P[1]">
                                            <xsl:variable name="committee_name">
                                                <xsl:value-of select="."/>
                                            </xsl:variable>
                                         <P>
                                            <xsl:value-of select="concat($committee_name,' ','Committee Member')"/>
                                        </P>
                                        </xsl:for-each>
                                    </xsl:if>
                                         <xsl:if test="$ends-with_committee">
                                            <xsl:copy-of select="$ends-with_committee"/>                                                                                   
                                    </xsl:if>                              
                               </xsl:if>                                
                            </TaggedPDF-doc>
                        </xsl:when>
                        <xsl:otherwise/>
                    </xsl:choose>
                </xsl:for-each>

                <!-- Theses -->
                <xsl:variable name="thesis_defended"
                    select="P[7][contains(upper-case(.),'THESIS')]"/>
                <xsl:variable name="starts-with_thesis_professor_direct"
                    select="P[starts-with(.,'Professor Directing Thesis')]"/>
                <xsl:variable name="starts-with_thesis_professor_co-direct"
                    select="P[starts-with(.,'Professor Co-Directing Thesis')]"/>
                <xsl:variable name="ends-with_thesis_professor_direct"
                    select="P[ends-with(.,' Professor Directing Thesis')]"/>
                <xsl:variable name="ends-with_thesis_professor_co-direct"
                    select="P[ends-with(.,' Professor Co-Directing Thesis')]"/>

                <xsl:for-each select=".[matches(upper-case(P[7]),'THESIS')]">
                    <xsl:if test="$thesis_defended">
                        <xsl:choose>
                            <xsl:when
                                test="P[not($starts-with_thesis_professor_direct or $starts-with_thesis_professor_co-direct or $starts-with_university or $starts-with_outside or $starts-with_committee)]">
                                <xsl:copy-of select="."/>
                            </xsl:when>
                            <xsl:when
                                test="P[$starts-with_thesis_professor_direct or $starts-with_thesis_professor_co-direct or $starts-with_university or $starts-with_outside or $starts-with_committee]">
                                <TaggedPDF-doc>
                            <xsl:copy-of select="file"/>
                            <xsl:copy-of select="$thesis_defended/preceding-sibling::P[position() lt 7]"/>
                            <xsl:copy-of select="$thesis_defended"/>
                           
                            <xsl:if test="P[8]">
                             
                                    <xsl:if test="$starts-with_thesis_professor_direct">
                                        <P>
                                            <xsl:value-of select="concat($starts-with_thesis_professor_direct/preceding-sibling::P[1],' ','Professor Directing Thesis')"/>
                                        </P>
                                    </xsl:if> 
                                    <xsl:if test="$ends-with_thesis_professor_direct">
                                            <xsl:copy-of select="$ends-with_thesis_professor_direct"/>                                        
                                    </xsl:if> 
                                    <xsl:if test="$starts-with_thesis_professor_co-direct">
                                        <xsl:for-each select="$starts-with_thesis_professor_co-direct/preceding-sibling::P[1]">
                                            <xsl:variable name="thesis_professor_co-direct_name">
                                                <xsl:value-of select="."/>
                                            </xsl:variable>
                                         <P>
                                            <xsl:value-of select="concat($thesis_professor_co-direct_name,' ','Professor Co-Directing Thesis')"/>
                                        </P>
                                        </xsl:for-each>
                                    </xsl:if>
                                    <xsl:if test="$ends-with_thesis_professor_co-direct">
                                            <xsl:copy-of select="$ends-with_thesis_professor_co-direct"/>                                     
                                    </xsl:if> 
                                   <xsl:if test="$starts-with_outside">
                                        <P>
                                            <xsl:value-of select="concat($starts-with_outside/preceding-sibling::P[1],' ','Outside Committee Member')"/>
                                        </P>
                                    </xsl:if> 
                                    <xsl:if test="$ends-with_outside">
                                            <xsl:copy-of select="$ends-with_outside"/>                                        
                                    </xsl:if>
                                <xsl:if test="$starts-with_university">
                                        <P>
                                            <xsl:value-of select="concat($starts-with_university/preceding-sibling::P[1],' ','University Representative')"/>            
                                        </P>
                                    </xsl:if>
                                    <xsl:if test="$ends-with_university">                                           
                                            <xsl:copy-of select="$ends-with_university"/>                                        
                                    </xsl:if>
                                    <xsl:if test="$starts-with_committee">
                                        <xsl:for-each select="$starts-with_committee/preceding-sibling::P[1]">
                                            <xsl:variable name="committee_name">
                                                <xsl:value-of select="."/>
                                            </xsl:variable>
                                         <P>
                                            <xsl:value-of select="concat($committee_name,' ','Committee Member')"/>
                                        </P>
                                        </xsl:for-each>
                                    </xsl:if>
                                         <xsl:if test="$ends-with_committee">
                                            <xsl:copy-of select="$ends-with_committee"/>                                                                                   
                                    </xsl:if>                              
                               </xsl:if>                                
                            </TaggedPDF-doc>
                            </xsl:when>
                            <xsl:otherwise/>
                        </xsl:choose>
                    </xsl:if>

                </xsl:for-each>

                <!-- Treatises -->
                <xsl:variable name="treatise_defended"
                    select="P[7][contains(upper-case(.),'TREATISE')]"/>
                <xsl:variable name="starts-with_treatise_professor_direct"
                    select="P[starts-with(.,'Professor Directing Treatise')]"/>
                <xsl:variable name="starts-with_treatise_professor_co-direct"
                    select="P[starts-with(.,'Professor Co-Directing Treatise')]"/>
                <xsl:variable name="ends-with_treatise_professor_direct"
                    select="P[ends-with(.,' Professor Directing Treatise')]"/>
                <xsl:variable name="ends-with_treatise_professor_co-direct"
                    select="P[ends-with(.,' Professor Co-Directing Treatise')]"/>

                <xsl:for-each select=".[matches(upper-case(P[7]),'TREATISE')]">
                    
                    <xsl:choose>
                        <xsl:when
                            test="P[not($starts-with_treatise_professor_direct or $starts-with_treatise_professor_co-direct or $starts-with_university or $starts-with_outside or $starts-with_committee)]">
                            <xsl:copy-of select="."/>
                        </xsl:when>
                        <xsl:when
                            test="P[$starts-with_treatise_professor_direct or $starts-with_treatise_professor_co-direct or $starts-with_university or $starts-with_outside or $starts-with_committee]">
                            <TaggedPDF-doc>
                            <xsl:copy-of select="file"/>
                            <xsl:copy-of select="$treatise_defended/preceding-sibling::P[position() lt 7]"/>
                            <xsl:copy-of select="$treatise_defended"/>
                           
                            <xsl:if test="P[8]">
                             
                                    <xsl:if test="$starts-with_treatise_professor_direct">
                                        <P>
                                            <xsl:value-of select="concat($starts-with_treatise_professor_direct/preceding-sibling::P[1],' ','Professor Directing Treatise')"/>
                                        </P>
                                    </xsl:if> 
                                    <xsl:if test="$ends-with_treatise_professor_direct">
                                            <xsl:copy-of select="$ends-with_treatise_professor_direct"/>                                        
                                    </xsl:if> 
                                    <xsl:if test="$starts-with_treatise_professor_co-direct">
                                        <xsl:for-each select="$starts-with_treatise_professor_co-direct/preceding-sibling::P[1]">
                                            <xsl:variable name="treatise_professor_co-direct_name">
                                                <xsl:value-of select="."/>
                                            </xsl:variable>
                                         <P>
                                            <xsl:value-of select="concat($treatise_professor_co-direct_name,' ','Professor Co-Directing Treatise')"/>
                                        </P>
                                        </xsl:for-each>
                                    </xsl:if>
                                    <xsl:if test="$ends-with_treatise_professor_co-direct">
                                            <xsl:copy-of select="$ends-with_treatise_professor_co-direct"/>                                     
                                    </xsl:if> 
                                   <xsl:if test="$starts-with_outside">
                                        <P>
                                            <xsl:value-of select="concat($starts-with_outside/preceding-sibling::P[1],' ','Outside Committee Member')"/>            
                                        </P>
                                    </xsl:if>
                                    <xsl:if test="$ends-with_outside">                                           
                                            <xsl:copy-of select="$ends-with_outside"/>                                        
                                    </xsl:if>
                                    
                                    <xsl:if test="$starts-with_university">
                                        <P>
                                            <xsl:value-of select="concat($starts-with_university/preceding-sibling::P[1],' ','University Representative')"/>            
                                        </P>
                                    </xsl:if>
                                    <xsl:if test="$ends-with_university">                                           
                                            <xsl:copy-of select="$ends-with_university"/>                                        
                                    </xsl:if>
                                
                                    <xsl:if test="$starts-with_committee">
                                        <xsl:for-each select="$starts-with_committee/preceding-sibling::P[1]">
                                            <xsl:variable name="committee_name">
                                                <xsl:value-of select="."/>
                                            </xsl:variable>
                                         <P>
                                            <xsl:value-of select="concat($committee_name,' ','Committee Member')"/>
                                        </P>
                                        </xsl:for-each>
                                    </xsl:if>
                                         <xsl:if test="$ends-with_committee">
                                            <xsl:copy-of select="$ends-with_committee"/>
                                    </xsl:if>                              
                               </xsl:if>                                
                            </TaggedPDF-doc>
                        </xsl:when>
                        <xsl:otherwise/>
                    </xsl:choose>
                    
                </xsl:for-each>


            </xsl:for-each>
        </xml>
    </xsl:template>

</xsl:stylesheet>
