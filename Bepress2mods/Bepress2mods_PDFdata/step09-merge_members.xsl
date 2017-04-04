<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fs="http://www.lib.fsu.edu"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xs xd fs" version="2.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

<xsl:include href="../modules/functions.xsl"/>

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>June 4, 2016</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Step 6: Merges split committee members statements</xd:p>
            <xd:p>This transformation merges split committee members statements.</xd:p>
        </xd:desc>
    </xd:doc>

    <!--   Example of desired format
    <lines>
      <file>Zhang_fsu_0071E_12509_pdfdata.xml</file>
      <line>FLORIDA STATE UNIVERSITY</line>
      <line>COLLEGE OF ARTS AND SCIENCES</line>
      <line>GEOMETRIC APPROACHES FOR ANALYSIS OF IMAGES, DENSITIES AND TRAJECTORIES ON MANIFOLDS</line>
      <line>ZHENGWU ZHANG</line>
      <line>A Dissertation submitted to the Department of Statistics in partial fulﬁllment of the requirements for the degree of Doctor of Philosophy</line>
      <line>Degree Awarded: Spring Semester, 2015</line>
      <line>Zhengwu Zhang defended this Dissertation on March 18, 2015.</line>
      <line>Anuj Srivastava Professor Directing Dissertation</line>
      <line>Eric Klassen University Representative</line>
      <line>Wei Wu Committee Member</line>
      <line>Debdeep Pati Committee Member</line>
   </lines>
   
   Example of lines to be merged
<lines>
      <file>Zahn_fsu_0071E_12431_pdfdata.xml</file>
      <line>FLORIDA STATE UNIVERSITY</line>
      <line>COLLEGE OF HUMAN SCIENCES</line>
      <line>COUPLES’ PRIOR QUALITY OF RELATIONSHIP, PRESENT ATTACHMENT, ADJUSTMENT, AND DEPRESSIVE SYMPTOMS WITH EARLY STAGE ALZHEIMER’S</line>
      <line>SHIRLEY J. ZAHN</line>
      <line>A Dissertation submitted to the Department of Family and Child Sciencesin partial fulfillment of the Doctor of Philosophy</line>
      <line>Degree Awarded: Spring Semester, 2015</line>
      <line>© 2015, Shirley J. Zahn</line>
      <line>Shirley J. Zahn defended this Dissertation on March 23, 2015.</line>
      <line>Wayne H. Denton</line>
      <line>Professor Directing Dissertation</line>
      <line>Robert L. Glueckauf</line>
      <line>University Representative</line>
      <line>Marsha L. Rehm</line>
      <line>Committee Member</line>
      <line>Kendal N. Holtrop</line>
      <line>Committee Member</line>
   </lines> 
    -->
    
    <xsl:template match="/" priority="2">
        <xml>
            <xsl:for-each select="xml/lines">
        
                <!-- All degree types -->
                <xsl:variable name="starts-with_university"
                    select="line[starts-with(.,'University Representative')]"/>
                <xsl:variable name="starts-with_outside"
                    select="line[starts-with(.,'Outside Committee Member')]"/>
                <xsl:variable name="starts-with_committee"
                    select="line[starts-with(.,'Committee Member')]"/>
                <xsl:variable name="ends-with_university"
                    select="line[ends-with(.,' University Representative')]"/>
                <xsl:variable name="ends-with_outside"
                    select="line[ends-with(.,' Outside Committee Member')]"/>
                <xsl:variable name="ends-with_committee"
                    select="line[ends-with(.,' Committee Member') and not(contains(.,'Outside'))]"/>


                <!-- Dissertations -->
                <xsl:variable name="dissertation_defended"
                    select="line[7][contains(upper-case(.),'DISSERTATION')]"/>
                <xsl:variable name="starts-with_diss_professor_direct"
                    select="line[starts-with(.,'Professor Directing Dissertation')]"/>
                <xsl:variable name="starts-with_diss_professor_co-direct"
                    select="line[starts-with(.,'Professor Co-Directing Dissertation')]"/>
                <xsl:variable name="ends-with_diss_professor_direct"
                    select="line[ends-with(.,' Professor Directing Dissertation')]"/>
                <xsl:variable name="ends-with_diss_professor_co-direct"
                    select="line[ends-with(.,' Professor Co-Directing Dissertation')]"/>
                
                <xsl:for-each select=".[matches(upper-case(line[7]),'DISSERTATION')]">

                <xsl:choose>
                        <xsl:when
                            test="line[not($starts-with_diss_professor_direct or $starts-with_diss_professor_co-direct or $starts-with_university or $starts-with_outside or $starts-with_committee)]">
                            <xsl:copy-of select="."/>
                        </xsl:when>
                        <xsl:when
                            test="line[$starts-with_diss_professor_direct or $starts-with_diss_professor_co-direct or $starts-with_university or $starts-with_outside or $starts-with_committee]">
                            <lines>
                            <xsl:copy-of select="number"/>
                            <xsl:copy-of select="$dissertation_defended/preceding-sibling::line[position() lt 7]"/>
                            <xsl:copy-of select="$dissertation_defended"/>
                           
                            <xsl:if test="line[8]">
                             
                                    <xsl:if test="$starts-with_diss_professor_direct">
                                        <line>
                                            <xsl:value-of select="concat($starts-with_diss_professor_direct/preceding-sibling::line[1],' ','Professor Directing Dissertation')"/>
                                        </line>
                                    </xsl:if> 
                                    <xsl:if test="$ends-with_diss_professor_direct">
                                            <xsl:copy-of select="$ends-with_diss_professor_direct"/>                                        
                                    </xsl:if> 
                                    <xsl:if test="$starts-with_diss_professor_co-direct">
                                        <xsl:for-each select="$starts-with_diss_professor_co-direct/preceding-sibling::line[1]">
                                            <xsl:variable name="diss_professor_co-direct_name">
                                                <xsl:value-of select="."/>
                                            </xsl:variable>
                                         <line>
                                            <xsl:value-of select="concat($diss_professor_co-direct_name,' ','Professor Co-Directing Dissertation')"/>
                                        </line>
                                        </xsl:for-each>
                                    </xsl:if>
                                    <xsl:if test="$ends-with_diss_professor_co-direct">
                                            <xsl:copy-of select="$ends-with_diss_professor_co-direct"/>                                     
                                    </xsl:if> 
                                   <xsl:if test="$starts-with_outside">
                                        <line>
                                            <xsl:value-of select="concat($starts-with_outside/preceding-sibling::line[1],' ','Outside Committee Member')"/>            
                                        </line>
                                    </xsl:if>
                                    <xsl:if test="$ends-with_outside">                                           
                                            <xsl:copy-of select="$ends-with_outside"/>                                        
                                    </xsl:if>
                                    <xsl:if test="$starts-with_committee">
                                        <xsl:for-each select="$starts-with_committee/preceding-sibling::line[1]">
                                            <xsl:variable name="committee_name">
                                                <xsl:value-of select="."/>
                                            </xsl:variable>
                                         <line>
                                            <xsl:value-of select="concat($committee_name,' ','Committee Member')"/>
                                        </line>
                                        </xsl:for-each>
                                    </xsl:if>
                                         <xsl:if test="$ends-with_committee">
                                            <xsl:copy-of select="$ends-with_committee"/>                                                                                   
                                    </xsl:if>                              
                               </xsl:if>                                
                            </lines>
                        </xsl:when>
                        <xsl:otherwise/>
                    </xsl:choose>
          
                </xsl:for-each>

                <!-- Theses -->
                     <xsl:variable name="thesis_defended"
                    select="line[7][contains(upper-case(.),'THESIS')]"/>
                <xsl:variable name="starts-with_thesis_professor_direct"
                    select="line[starts-with(.,'Professor Directing Thesis')]"/>
                <xsl:variable name="starts-with_thesis_professor_co-direct"
                    select="line[starts-with(.,'Professor Co-Directing Thesis')]"/>
                <xsl:variable name="ends-with_thesis_professor_direct"
                    select="line[ends-with(.,' Professor Directing Thesis')]"/>
                <xsl:variable name="ends-with_thesis_professor_co-direct"
                    select="line[ends-with(.,' Professor Co-Directing Thesis')]"/>
                
                <xsl:for-each select=".[matches(upper-case(line[7]),'THESIS')]">

                <xsl:if test="$thesis_defended">
                    <xsl:choose>
                        <xsl:when
                            test="line[not($starts-with_thesis_professor_direct or $starts-with_thesis_professor_co-direct or $starts-with_university or $starts-with_outside or $starts-with_committee)]">
                            <xsl:copy-of select="."/>
                        </xsl:when>
                        <xsl:when
                            test="line[$starts-with_thesis_professor_direct or $starts-with_thesis_professor_co-direct or $starts-with_university or $starts-with_outside or $starts-with_committee]">
                            <lines>
                            <xsl:copy-of select="number"/>
                            <xsl:copy-of select="$thesis_defended/preceding-sibling::line[position() lt 7]"/>
                            <xsl:copy-of select="$thesis_defended"/>
                           
                            <xsl:if test="line[8]">
                             
                                    <xsl:if test="$starts-with_thesis_professor_direct">
                                        <line>
                                            <xsl:value-of select="concat($starts-with_thesis_professor_direct/preceding-sibling::line[1],' ','Professor Directing Thesis')"/>
                                        </line>
                                    </xsl:if> 
                                    <xsl:if test="$ends-with_thesis_professor_direct">
                                            <xsl:copy-of select="$ends-with_thesis_professor_direct"/>                                        
                                    </xsl:if> 
                                    <xsl:if test="$starts-with_thesis_professor_co-direct">
                                        <xsl:for-each select="$starts-with_thesis_professor_co-direct/preceding-sibling::line[1]">
                                            <xsl:variable name="thesis_professor_co-direct_name">
                                                <xsl:value-of select="."/>
                                            </xsl:variable>
                                         <line>
                                            <xsl:value-of select="concat($thesis_professor_co-direct_name,' ','Professor Co-Directing Thesis')"/>
                                        </line>
                                        </xsl:for-each>
                                    </xsl:if>
                                    <xsl:if test="$ends-with_thesis_professor_co-direct">
                                            <xsl:copy-of select="$ends-with_thesis_professor_co-direct"/>                                     
                                    </xsl:if> 
                                   <xsl:if test="$starts-with_outside">
                                        <line>
                                            <xsl:value-of select="concat($starts-with_outside/preceding-sibling::line[1],' ','Outside Committee Member')"/>
                                        </line>
                                    </xsl:if> 
                                    <xsl:if test="$ends-with_outside">
                                            <xsl:copy-of select="$ends-with_outside"/>                                        
                                    </xsl:if>
                                    <xsl:if test="$starts-with_committee">
                                        <xsl:for-each select="$starts-with_committee/preceding-sibling::line[1]">
                                            <xsl:variable name="committee_name">
                                                <xsl:value-of select="."/>
                                            </xsl:variable>
                                         <line>
                                            <xsl:value-of select="concat($committee_name,' ','Committee Member')"/>
                                        </line>
                                        </xsl:for-each>
                                    </xsl:if>
                                         <xsl:if test="$ends-with_committee">
                                            <xsl:copy-of select="$ends-with_committee"/>                                                                                   
                                    </xsl:if>                              
                               </xsl:if>                                
                            </lines>
                        </xsl:when>
                        <xsl:otherwise/>
                    </xsl:choose>
                </xsl:if>
                    
                </xsl:for-each>


                <!-- Treatises -->
                      <xsl:variable name="treatise_defended"
                    select="line[7][contains(upper-case(.),'TREATISE')]"/>
                <xsl:variable name="starts-with_treatise_professor_direct"
                    select="line[starts-with(.,'Professor Directing Treatise')]"/>
                <xsl:variable name="starts-with_treatise_professor_co-direct"
                    select="line[starts-with(.,'Professor Co-Directing Treatise')]"/>
                <xsl:variable name="ends-with_treatise_professor_direct"
                    select="line[ends-with(.,' Professor Directing Treatise')]"/>
                <xsl:variable name="ends-with_treatise_professor_co-direct"
                    select="line[ends-with(.,' Professor Co-Directing Treatise')]"/>
                
                <xsl:for-each select=".[matches(upper-case(line[7]),'TREATISE')]">
                    <xsl:if test="$treatise_defended">
                    <xsl:choose>
                        <xsl:when
                            test="line[not($starts-with_treatise_professor_direct or $starts-with_treatise_professor_co-direct or $starts-with_university or $starts-with_outside or $starts-with_committee)]">
                            <xsl:copy-of select="."/>
                        </xsl:when>
                        <xsl:when
                            test="line[$starts-with_treatise_professor_direct or $starts-with_treatise_professor_co-direct or $starts-with_university or $starts-with_outside or $starts-with_committee]">
                            <lines>
                            <xsl:copy-of select="number"/>
                            <xsl:copy-of select="$treatise_defended/preceding-sibling::line[position() lt 7]"/>
                            <xsl:copy-of select="$treatise_defended"/>
                           
                            <xsl:if test="line[8]">
                             
                                    <xsl:if test="$starts-with_treatise_professor_direct">
                                        <line>
                                            <xsl:value-of select="concat($starts-with_treatise_professor_direct/preceding-sibling::line[1],' ','Professor Directing Treatise')"/>
                                        </line>
                                    </xsl:if> 
                                    <xsl:if test="$ends-with_treatise_professor_direct">
                                            <xsl:copy-of select="$ends-with_treatise_professor_direct"/>                                        
                                    </xsl:if> 
                                    <xsl:if test="$starts-with_treatise_professor_co-direct">
                                        <xsl:for-each select="$starts-with_treatise_professor_co-direct/preceding-sibling::line[1]">
                                            <xsl:variable name="treatise_professor_co-direct_name">
                                                <xsl:value-of select="."/>
                                            </xsl:variable>
                                         <line>
                                            <xsl:value-of select="concat($treatise_professor_co-direct_name,' ','Professor Co-Directing Treatise')"/>
                                        </line>
                                        </xsl:for-each>
                                    </xsl:if>
                                    <xsl:if test="$ends-with_treatise_professor_co-direct">
                                            <xsl:copy-of select="$ends-with_treatise_professor_co-direct"/>                                     
                                    </xsl:if> 
                                   <xsl:if test="$starts-with_outside">
                                        <line>
                                            <xsl:value-of select="concat($starts-with_outside/preceding-sibling::line[1],' ','Outside Committee Member')"/>            
                                        </line>
                                    </xsl:if>
                                    <xsl:if test="$ends-with_outside">                                           
                                            <xsl:copy-of select="$ends-with_outside"/>                                        
                                    </xsl:if>
                                    <xsl:if test="$starts-with_committee">
                                        <xsl:for-each select="$starts-with_committee/preceding-sibling::line[1]">
                                            <xsl:variable name="committee_name">
                                                <xsl:value-of select="."/>
                                            </xsl:variable>
                                         <line>
                                            <xsl:value-of select="concat($committee_name,' ','Committee Member')"/>
                                        </line>
                                        </xsl:for-each>
                                    </xsl:if>
                                         <xsl:if test="$ends-with_committee">
                                            <xsl:copy-of select="$ends-with_committee"/>                                                                                   
                                    </xsl:if>                              
                               </xsl:if>                                
                            </lines>
                        </xsl:when>
                        <xsl:otherwise/>
                    </xsl:choose>
                </xsl:if>
                
                </xsl:for-each>

                
            </xsl:for-each>
        </xml>
    </xsl:template>

</xsl:stylesheet>
