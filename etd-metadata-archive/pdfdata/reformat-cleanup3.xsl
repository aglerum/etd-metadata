<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:fs="http://www.lib.fsu.edu" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd fs" version="2.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>November 4, 2014</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University</xd:p>
            <xd:p><xd:b>Title: </xd:b>Process 3: Merge split dissertation statements</xd:p>
            <xd:p>Templates to merge split dissertation statements in the reformatted PDF-XML. 
                This program does not address the following errors. 
                Delete or correct these manually:
                * Misspellings such as "Disseration".</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:template match="/">
        <xml>
            <xsl:for-each select="xml/lines">
                <xsl:variable name="diss_submit"
                    select="line[. = 'A Dissertation submitted to the']"/>
                <xsl:variable name="thesis_submit" select="line[. = 'A Thesis submitted to the']"/>
                <xsl:variable name="treatise_submit"
                    select="line[. = 'A Treatise submitted to the']"/>

                <xsl:variable name="dept_diss"
                    select="line[. = 'A Dissertation submitted to the']/following-sibling::line[1]"/>
                <xsl:variable name="dept_thesis"
                    select="line[. = 'A Thesis submitted to the']/following-sibling::line[1]"/>
                <xsl:variable name="dept_treatise"
                    select="line[. = 'A Treatise submitted to the']/following-sibling::line[1]"/>

                <xsl:variable name="partial" select="line[. = 'in partial fulfillment of the']"/>
                <xsl:variable name="requirements"
                    select="line[. = 'requirements for the degree of']"/>
                <xsl:variable name="degree"
                    select="line[. = 'requirements for the degree of']/following-sibling::line[1]"/>
                <xsl:variable name="awarded" select="'Degree Awarded:'"/>
                <xsl:variable name="semester"
                    select="line[contains(.,'Degree Awarded')]/following-sibling::line[1]"/>

                <xsl:variable name="direct_dissertation"
                    select="line[. = 'Professor Directing Dissertation']"/>
                <xsl:variable name="direct_dissertation_name"
                    select="line[. = 'Professor Directing Dissertation']/preceding-sibling::line[1]"/>
                <xsl:variable name="co-direct_dissertation">
                    <xsl:value-of select="'Professor Co-Directing Dissertation'"/>
                </xsl:variable>
                <xsl:variable name="co-direct_dissertation_name">
                    <xsl:value-of
                        select="line[. = 'Professor Co-Directing Dissertation']/preceding-sibling::line[1]"
                    />
                </xsl:variable>

                <xsl:variable name="direct_thesis" select="line[. = 'Professor Directing Thesis']"/>
                <xsl:variable name="direct_thesis_name"
                    select="line[. = 'Professor Directing Thesis']/preceding-sibling::line[1]"/>
                <xsl:variable name="co-direct_thesis">
                    <xsl:value-of select="'Professor Co-Directing Thesis'"/>
                </xsl:variable>
                <xsl:variable name="co-direct_thesis_name">
                    <xsl:value-of
                        select="line[. = 'Professor Co-Directing Thesis']/preceding-sibling::line[1]"
                    />
                </xsl:variable>

                <xsl:variable name="direct_treatise"
                    select="line[. = 'Professor Directing Treatise']"/>
                <xsl:variable name="direct_treatise_name"
                    select="line[. = 'Professor Directing Treatise']/preceding-sibling::line[1]"/>
                
                <xsl:variable name="co-direct_treatise">
                    <xsl:value-of select="'Professor Co-Directing Treatise'"/>
                </xsl:variable>
                <xsl:variable name="co-direct_treatise_name">
                    <xsl:value-of
                        select="line[. = 'Professor Co-Directing Treatise']/preceding-sibling::line[1]"
                    />
                </xsl:variable>

                <xsl:variable name="univ_rep" select="'University Representative'"/>
                <xsl:variable name="univ_rep_name"
                    select="line[. = 'University Representative']/preceding-sibling::line[1]"/>

                <xsl:variable name="comm_member" select="'Committee Member'"/>
                <xsl:variable name="comm_member_name">
                    <xsl:for-each select="line[. = 'Committee Member']/preceding-sibling::line[1]">
                        <xsl:value-of select="."/>
                    </xsl:for-each>
                </xsl:variable>


                <xsl:if test="line[starts-with(.,'A Dissertation submitted')]">
                    <xsl:choose>
                        <xsl:when
                            test="line[starts-with(.,'A Dissertation submitted') and contains(.,'partial')]">
                            <xsl:copy-of select="."/>
                        </xsl:when>
                        <xsl:when
                            test="line[starts-with(.,'A Dissertation submitted') and not(contains(.,'partial'))]">
                            <lines>
                            <xsl:copy-of select="position"/>
                            <xsl:copy-of select="line[. = 'A Dissertation submitted']/preceding-sibling::line[position() > 0]"/>
                            <line>
                                <xsl:value-of select="concat($diss_submit, ' ',$dept_diss, ' ', $partial, ' ', $requirements, ' ', $degree)"/> 
                            </line>
                            <line>
                                <xsl:value-of select="concat($awarded, ' ', $semester)"/> 
                            </line>
                            <xsl:copy-of select="line[(position() gt 4) and (contains(.,' defended '))]"/> 
                            <xsl:choose>
                                <xsl:when test="line[. = 'Professor Directing Dissertation']">
                                    <line><xsl:value-of select="concat($direct_dissertation_name, ' ',$direct_dissertation)"/></line>
                                </xsl:when>
                               <xsl:when test="line[. = 'Professor Co-Directing Dissertation']">
                                   <xsl:for-each select="line[. = 'Professor Co-Directing Dissertation']/preceding-sibling::line[1]">
                                    <line><xsl:value-of select="concat($co-direct_dissertation_name, ' ',$co-direct_dissertation)"/></line>
                                       </xsl:for-each>
                                </xsl:when>
                            </xsl:choose>
                            
                             <xsl:choose>
                                <xsl:when test="line[starts-with(.,'University Representative')]">
                                    <xsl:for-each select="line[starts-with(.,'University Representative')]/preceding-sibling::line[1]">
                                        <line><xsl:value-of select="concat(., ' ', $univ_rep)"/></line>
                                </xsl:for-each>                                     
                                </xsl:when>
                                <xsl:when test="line[ends-with(.,'University Representative')]">
                                    <xsl:for-each select="line[ends-with(.,'University Representative')]">
                                        <line><xsl:value-of select="."/></line>
                                </xsl:for-each>                                     
                                </xsl:when>
                                <xsl:otherwise/>
                            </xsl:choose>
                                                          
                            <xsl:choose>
                                <xsl:when test="line[starts-with(.,'Committee Member')]">
                                    <xsl:for-each select="line[. = 'Committee Member']/preceding-sibling::line[1]">
                                        <line><xsl:value-of select="concat(., ' ', $comm_member)"/></line>
                                </xsl:for-each>                                  
                                </xsl:when>
                                <xsl:when test="line[ends-with(.,'Committee Member')]">
                                    <xsl:for-each select="line[ends-with(.,'Committee Member')]">
                                        <line><xsl:value-of select="."/></line>
                                </xsl:for-each>                                  
                                </xsl:when>
                                <xsl:otherwise/>                                                                    
                            </xsl:choose>
                    </lines>
                        </xsl:when>
                        <xsl:otherwise/>
                    </xsl:choose>
                </xsl:if>
                
                <xsl:if test="line[starts-with(.,'A Thesis submitted')]">
                    <xsl:choose>
                        <xsl:when
                            test="line[starts-with(.,'A Thesis submitted') and contains(.,'partial')]">
                            <xsl:copy-of select="."/>
                        </xsl:when>
                        <xsl:when
                            test="line[starts-with(.,'A Thesis submitted') and not(contains(.,'partial'))]">
                            <lines>
                            <xsl:copy-of select="position"/>
                            <xsl:copy-of select="line[. = 'A Thesis submitted']/preceding-sibling::line[position() > 0]"/>
                            <line>
                                <xsl:value-of select="concat($thesis_submit, ' ',$dept_thesis, ' ', $partial, ' ', $requirements, ' ', $degree)"/> 
                            </line>
                            <line>
                                <xsl:value-of select="concat($awarded, ' ', $semester)"/> 
                            </line>
                            <xsl:copy-of select="line[(position() gt 4) and (contains(.,' defended '))]"/> 
                            <xsl:choose>
                                <xsl:when test="line[. = 'Professor Directing Thesis']">
                                    <line><xsl:value-of select="concat($direct_thesis_name, ' ',$direct_thesis)"/></line>
                                </xsl:when>
                               <xsl:when test="line[. = 'Professor Co-Directing Thesis']">
                                   <xsl:for-each select="line[. = 'Professor Co-Directing Thesis']/preceding-sibling::line[1]">
                                    <line><xsl:value-of select="concat($co-direct_thesis_name, ' ',$co-direct_thesis)"/></line>
                                       </xsl:for-each>
                                </xsl:when>
                            </xsl:choose>
                            
                            <xsl:choose>
                                <xsl:when test="line[starts-with(.,'University Representative')]">
                                    <xsl:for-each select="line[starts-with(.,'University Representative')]/preceding-sibling::line[1]">
                                        <line><xsl:value-of select="concat(., ' ', $univ_rep)"/></line>
                                </xsl:for-each>                                     
                                </xsl:when>
                                <xsl:when test="line[ends-with(.,'University Representative')]">
                                    <xsl:for-each select="line[ends-with(.,'University Representative')]">
                                        <line><xsl:value-of select="."/></line>
                                </xsl:for-each>                                     
                                </xsl:when>
                                <xsl:otherwise/>
                            </xsl:choose>
                                
                            <xsl:choose>
                                <xsl:when test="line[starts-with(.,'Committee Member')]">
                                    <xsl:for-each select="line[. = 'Committee Member']/preceding-sibling::line[1]">
                                        <line><xsl:value-of select="concat(., ' ', $comm_member)"/></line>
                                </xsl:for-each>                                  
                                </xsl:when>
                                <xsl:when test="line[ends-with(.,'Committee Member')]">
                                    <xsl:for-each select="line[ends-with(.,'Committee Member')]">
                                        <line><xsl:value-of select="."/></line>
                                </xsl:for-each>                                  
                                </xsl:when>
                                <xsl:otherwise/>                                                                    
                            </xsl:choose>
                                                       
                    </lines>
                        </xsl:when>
                        <xsl:otherwise/>
                    </xsl:choose>
                </xsl:if>
                
                <xsl:if test="line[starts-with(.,'A Treatise submitted')]">
                    <xsl:choose>
                        <xsl:when
                            test="line[starts-with(.,'A Treatise submitted') and contains(.,'partial')]">
                            <xsl:copy-of select="."/>
                        </xsl:when>
                        <xsl:when
                            test="line[starts-with(.,'A Treatise submitted') and not(contains(.,'partial'))]">
                            <lines>
                            <xsl:copy-of select="position"/>
                            <xsl:copy-of select="line[. = 'A Treatise submitted']/preceding-sibling::line[position() > 0]"/>
                            <line>
                                <xsl:value-of select="concat($treatise_submit, ' ',$dept_treatise, ' ', $partial, ' ', $requirements, ' ', $degree)"/> 
                            </line>
                            <line>
                                <xsl:value-of select="concat($awarded, ' ', $semester)"/> 
                            </line>
                            <xsl:copy-of select="line[(position() gt 4) and (contains(.,' defended '))]"/> 
                            <xsl:choose>
                                <xsl:when test="line[. = 'Professor Directing Treatise']">
                                    <line><xsl:value-of select="concat($direct_treatise_name, ' ',$direct_treatise)"/></line>
                                </xsl:when>
                               <xsl:when test="line[. = 'Professor Co-Directing Treatise']">
                                   <xsl:for-each select="line[. = 'Professor Co-Directing Treatise']/preceding-sibling::line[1]">
                                    <line><xsl:value-of select="concat($co-direct_treatise_name, ' ',$co-direct_treatise)"/></line>
                                       </xsl:for-each>
                                </xsl:when>
                            </xsl:choose>
                            
                             <xsl:choose>
                                <xsl:when test="line[starts-with(.,'University Representative')]">
                                    <xsl:for-each select="line[starts-with(.,'University Representative')]/preceding-sibling::line[1]">
                                        <line><xsl:value-of select="concat(., ' ', $univ_rep)"/></line>
                                </xsl:for-each>                                     
                                </xsl:when>
                                <xsl:when test="line[ends-with(.,'University Representative')]">
                                    <xsl:for-each select="line[ends-with(.,'University Representative')]">
                                        <line><xsl:value-of select="."/></line>
                                </xsl:for-each>                                     
                                </xsl:when>
                                <xsl:otherwise/>
                            </xsl:choose>
                            
                            <xsl:choose>
                                <xsl:when test="line[starts-with(.,'Committee Member')]">
                                    <xsl:for-each select="line[. = 'Committee Member']/preceding-sibling::line[1]">
                                        <line><xsl:value-of select="concat(., ' ','Committee Member')"/></line>
                                </xsl:for-each>                                  
                                </xsl:when>
                                <xsl:when test="line[ends-with(.,'Committee Member')]">
                                    <xsl:for-each select="line[ends-with(., $comm_member)]">
                                        <line><xsl:value-of select="."/></line>
                                </xsl:for-each>                                  
                                </xsl:when>
                                <xsl:otherwise/>                                                                    
                            </xsl:choose>
                    </lines>
                        </xsl:when>
                        <xsl:otherwise/>
                    </xsl:choose>
                </xsl:if>
                
            </xsl:for-each>
        </xml>
    </xsl:template>

</xsl:stylesheet>
