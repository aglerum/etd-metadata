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
            <xd:p><xd:b>Title: </xd:b>Step 6: Merges split submitted statements</xd:p>
            <xd:p>This transformation merges split dissertation statements.</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template match="/">
        <xml>
            <xsl:for-each select="xml/lines">

                <!-- Submission variables -->
                <xsl:variable name="submit_diss"
                    select="line[matches(upper-case(.),'DISSERTATION SUBMITTED')]"/>
                <xsl:variable name="submit_thesis"
                    select="line[matches(upper-case(.),'THESIS SUBMITTED')]"/>
                <xsl:variable name="submit_treatise"
                    select="line[matches(upper-case(.),'TREATISE SUBMITTED')]"/>

                <!-- Department variable -->
                <xsl:variable name="dept_diss"
                    select="line[matches(upper-case(.),'DISSERTATION SUBMITTED')]/following-sibling::line[1]"/>
                <xsl:variable name="dept_thesis"
                    select="line[matches(upper-case(.),'THESIS SUBMITTED')]/following-sibling::line[1]"/>
                <xsl:variable name="dept_treatise"
                    select="line[matches(upper-case(.),'TREATISE SUBMITTED')]/following-sibling::line[1]"/>

                <!-- Phrase variables -->
                <xsl:variable name="partial"
                    select="line[matches(upper-case(.), 'PARTIAL FULFILLMENT')]"/>
                <xsl:variable name="requirements"
                    select="line[matches(upper-case(.), 'REQUIREMENTS FOR')]"/>
                <xsl:variable name="degree"
                    select="line[matches(upper-case(.), 'REQUIREMENTS FOR')]/following-sibling::line[1]"/>
                <xsl:variable name="awarded" select="'Degree Awarded:'"/>
                <xsl:variable name="semester"
                    select="line[text() = 'DEGREE AWARDED:']/following-sibling::line[1]"/>

                <!-- Directing Dissertation -->
                <xsl:variable name="direct_dissertation_phrase"
                    select="'Professor Directing Dissertation'" as="xs:string"/>
                <xsl:variable name="direct_dissertation_name"
                    select="line[starts-with(upper-case(.), 'PROFESSOR DIRECTING DISSERATION')]/preceding-sibling::line[1]"/>

                <!-- Co-directing Dissertation -->
                <xsl:variable name="co-direct_dissertation_phrase"
                    select="'Professor Directing Dissertation'" as="xs:string"/>
                <xsl:variable name="co-direct_dissertation_name"
                    select="line[starts-with(upper-case(.), 'PROFESSOR CO-DIRECTING DISSERATION')]/preceding-sibling::line[1]"/>

                <!-- Directing Thesis -->
                <xsl:variable name="direct_thesis_phrase" select="'Professor Directing Thesis'"
                    as="xs:string"/>
                <xsl:variable name="direct_thesis_name"
                    select="line[starts-with(upper-case(.),'PROFESSOR DIRECTING THESIS')]/preceding-sibling::line[1]"/>

                <!-- Co-directing Thesis -->
                <xsl:variable name="co-direct_thesis_phrase"
                    select="'Professor Co-directing Thesis'" as="xs:string"/>
                <xsl:variable name="co-direct_thesis_name"
                    select="line[starts-with(upper-case(.),'PROFESSOR CO-DIRECTING THESIS')]/preceding-sibling::line[1]"/>

                <!-- Directing Treatise -->
                <xsl:variable name="direct_treatise_phrase" select="'Professor Directing Treatise'"
                    as="xs:string"/>
                <xsl:variable name="direct_treatise_name"
                    select="line[starts-with(upper-case(.),'PROFESSOR DIRECTING TREATISE')]/preceding-sibling::line[1]"/>

                <!-- Co-directing Treatise -->
                <xsl:variable name="co-direct_treatise_phrase"
                    select="'Professor Co-directing Treatise'" as="xs:string"/>
                <xsl:variable name="co-direct_treatise_name"
                    select="line[starts-with(upper-case(.),'PROFESSOR CO-DIRECTING TREATISE')]/preceding-sibling::line[1]"/>

                <!-- University Representative -->
                <xsl:variable name="univ_rep_phrase" select="'University representative'"
                    as="xs:string"/>
                <xsl:variable name="univ_rep_name"
                    select="line[starts-with(upper-case(.),'UNIVERSITY REPRESENTATIVE')]/preceding-sibling::line[1]"/>

                <!-- Outside Committee Member -->
                <xsl:variable name="out_member_phrase" select="'Outside Committee Member'"
                    as="xs:string"/>
                <xsl:variable name="out_member_name"
                    select="line[starts-with(upper-case(.),'OUTSIDE COMMITTEE MEMBER')]/preceding-sibling::line[1]"/>

                <!-- Committee Member -->
                <xsl:variable name="comm_member_phrase" select="'Committee Member'" as="xs:string"/>
                <xsl:variable name="comm_member_name">
                    <xsl:for-each
                        select="line[starts-with(upper-case(.),'COMMITTEE MEMBER') and not(contains(upper-case(.),'OUTSIDE'))]/preceding-sibling::line[1]">
                        <xsl:value-of select="."/>
                    </xsl:for-each>
                </xsl:variable>

                <!-- Dissertations -->
                <xsl:if
                    test="line[starts-with(upper-case(.),'A DISSERTATION SUBMITTED') or starts-with(upper-case(.),'DISSERTATION SUBMITTED')]">
                    <xsl:choose>
                        <xsl:when
                            test="line[(starts-with(upper-case(.),'A DISSERTATION SUBMITTED') or starts-with(upper-case(.),'DISSERTATION SUBMITTED')) and (contains(upper-case(.),'PARTIAL')) and not(ends-with(upper-case(.),'DEGREE OF'))]">
                            <xsl:copy-of select="."/>
                        </xsl:when>
                        <xsl:when
                            test="line[(starts-with(upper-case(.),'A DISSERTATION SUBMITTED') or starts-with(upper-case(.),'DISSERTATION SUBMITTED')) and not((contains(upper-case(.),'PARTIAL')))]">
                            <lines>
                            <xsl:copy-of select="number"/>
                            <xsl:copy-of select="line[starts-with(upper-case(.),'A DISSERTATION SUBMITTED') or starts-with(upper-case(.),'DISSERTATION SUBMITTED')]/preceding-sibling::line[position() > 0]"/>
                            <line>
                                <xsl:value-of select="concat('A Dissertation submitted to the ',$dept_diss, 'in partial fulfillment of the ', $degree)"/> 
                            </line>
                            
                            <xsl:copy-of select="line[(position() gt 5) and (starts-with(upper-case(.),'DEGREE'))]"/>
                            <xsl:copy-of select="line[(position() gt 5) and (starts-with(upper-case(.),'DEGREE'))]/following-sibling::line[(position() gt 0)]"/>
                            </lines>
                        </xsl:when>
                        <xsl:when
                            test="line[(starts-with(upper-case(.),'A DISSERTATION SUBMITTED') or starts-with(upper-case(.),'DISSERTATION SUBMITTED')) and ends-with(upper-case(.),'DEGREE OF')]">
                            <lines>
                            <xsl:copy-of select="number"/>
                            <xsl:copy-of select="line[starts-with(upper-case(.),'A DISSERTATION SUBMITTED') or starts-with(upper-case(.),'DISSERTATION SUBMITTED') and ends-with(upper-case(.),'DEGREE OF')]/preceding-sibling::line[position() > 0]"/>
                            <xsl:variable name="ends-with_degree-of" select="line[(starts-with(upper-case(.),'A DISSERTATION SUBMITTED') or starts-with(upper-case(.),'DISSERTATION SUBMITTED')) and ends-with(upper-case(.),'DEGREE OF')]"/>
                            <xsl:variable name="following_ends-with_degree-of" select="line[(starts-with(upper-case(.),'A DISSERTATION SUBMITTED') or starts-with(upper-case(.),'DISSERTATION SUBMITTED')) and ends-with(upper-case(.),'DEGREE OF')]/following-sibling::line[1]"/>
                            <line>
                                <xsl:value-of select="concat($ends-with_degree-of, ' ',$following_ends-with_degree-of)"/> 
                            </line>
                            
                            <xsl:copy-of select="line[(position() gt 5) and (starts-with(upper-case(.),'DEGREE'))]"/>
                            <xsl:copy-of select="line[(position() gt 5) and (starts-with(upper-case(.),'DEGREE'))]/following-sibling::line[(position() gt 0)]"/>
                            </lines>
                        </xsl:when>
                    </xsl:choose>
                </xsl:if>

                <!-- Theses -->
                <xsl:if
                    test="line[starts-with(upper-case(.),'A THESIS SUBMITTED') or starts-with(upper-case(.),'THESIS SUBMITTED')]">
                    <xsl:choose>
                        <xsl:when
                            test="line[(starts-with(upper-case(.),'A THESIS SUBMITTED') or starts-with(upper-case(.),'THESIS SUBMITTED')) and (contains(upper-case(.),'PARTIAL'))]">
                            <xsl:copy-of select="."/>
                        </xsl:when>
                        <xsl:when
                            test="line[(starts-with(upper-case(.),'A THESIS SUBMITTED') or starts-with(upper-case(.),'THESIS SUBMITTED')) and not((contains(upper-case(.),'PARTIAL')))]">
                            <lines>
                            <xsl:copy-of select="number"/>
                            <xsl:copy-of select="line[starts-with(upper-case(.),'A THESIS SUBMITTED') or starts-with(upper-case(.),'THESIS SUBMITTED')]/preceding-sibling::line[position() > 0]"/>
                            <line>
                                <xsl:value-of select="concat('A Thesis submitted to the ',$dept_thesis, 'in partial fulfillment of the ', $degree)"/> 
                            </line>
                           
                            <xsl:copy-of select="line[(position() gt 5) and (starts-with(upper-case(.),'DEGREE'))]"/>
                            <xsl:copy-of select="line[(position() gt 5) and (starts-with(upper-case(.),'DEGREE'))]/following-sibling::line[(position() gt 0)]"/>
                            </lines>
                        </xsl:when>
                        <xsl:when
                            test="line[(starts-with(upper-case(.),'A THESIS SUBMITTED') or starts-with(upper-case(.),'THESIS SUBMITTED')) and ends-with(upper-case(.),'DEGREE OF')]">
                            <lines>
                            <xsl:copy-of select="number"/>
                            <xsl:copy-of select="line[starts-with(upper-case(.),'A THESIS SUBMITTED') or starts-with(upper-case(.),'THESIS SUBMITTED') and ends-with(upper-case(.),'DEGREE OF')]/preceding-sibling::line[position() > 0]"/>
                            <xsl:variable name="ends-with_degree-of" select="line[(starts-with(upper-case(.),'A THESIS SUBMITTED') or starts-with(upper-case(.),'THESIS SUBMITTED')) and ends-with(upper-case(.),'DEGREE OF')]"/>
                            <xsl:variable name="following_ends-with_degree-of" select="line[(starts-with(upper-case(.),'A THESIS SUBMITTED') or starts-with(upper-case(.),'THESIS SUBMITTED')) and ends-with(upper-case(.),'DEGREE OF')]/following-sibling::line[1]"/>
                            <line>
                                <xsl:value-of select="concat($ends-with_degree-of, ' ',$following_ends-with_degree-of)"/> 
                            </line>
                            
                            <xsl:copy-of select="line[(position() gt 5) and (starts-with(upper-case(.),'DEGREE'))]"/>
                            <xsl:copy-of select="line[(position() gt 5) and (starts-with(upper-case(.),'DEGREE'))]/following-sibling::line[(position() gt 0)]"/>
                            </lines>
                        </xsl:when>
                    </xsl:choose>
                </xsl:if>

                <!-- Treatises -->
                <xsl:if
                    test="line[starts-with(upper-case(.),'A TREATISE SUBMITTED') or starts-with(upper-case(.),'TREATISE SUBMITTED')]">
                    <xsl:choose>
                        <xsl:when
                            test="line[(starts-with(upper-case(.),'A TREATISE SUBMITTED') or starts-with(upper-case(.),'TREATISE SUBMITTED')) and (contains(upper-case(.),'PARTIAL'))]">
                            <xsl:copy-of select="."/>
                        </xsl:when>
                        <xsl:when
                            test="line[(starts-with(upper-case(.),'A TREATISE SUBMITTED') or starts-with(upper-case(.),'TREATISE SUBMITTED')) and not((contains(upper-case(.),'PARTIAL')))]">
                            <lines>
                            <xsl:copy-of select="number"/>
                            <xsl:copy-of select="line[starts-with(upper-case(.),'A TREATISE SUBMITTED') or starts-with(upper-case(.),'TREATISE SUBMITTED')]/preceding-sibling::line[position() > 0]"/>
                            <line>
                                <xsl:value-of select="concat('A Treatise submitted to the ',$dept_treatise, 'in partial fulfillment of the ', $degree)"/> 
                            </line>
                                
                            <xsl:copy-of select="line[(position() gt 5) and (starts-with(upper-case(.),'DEGREE'))]"/>
                            <xsl:copy-of select="line[(position() gt 5) and (starts-with(upper-case(.),'DEGREE'))]/following-sibling::line[(position() gt 0)]"/>
                            </lines>
                        </xsl:when>
                        <xsl:when
                            test="line[(starts-with(upper-case(.),'A TREATISE SUBMITTED') or starts-with(upper-case(.),'TREATISE SUBMITTED')) and ends-with(upper-case(.),'DEGREE OF')]">
                            <lines>
                            <xsl:copy-of select="number"/>
                            <xsl:copy-of select="line[starts-with(upper-case(.),'A TREATISE SUBMITTED') or starts-with(upper-case(.),'TREATISE SUBMITTED') and ends-with(upper-case(.),'DEGREE OF')]/preceding-sibling::line[position() > 0]"/>
                            <xsl:variable name="ends-with_degree-of" select="line[(starts-with(upper-case(.),'A TREATISE SUBMITTED') or starts-with(upper-case(.),'TREATISE SUBMITTED')) and ends-with(upper-case(.),'DEGREE OF')]"/>
                            <xsl:variable name="following_ends-with_degree-of" select="line[(starts-with(upper-case(.),'A TREATISE SUBMITTED') or starts-with(upper-case(.),'TREATISE SUBMITTED')) and ends-with(upper-case(.),'DEGREE OF')]/following-sibling::line[1]"/>
                            <line>
                                <xsl:value-of select="concat($ends-with_degree-of, ' ',$following_ends-with_degree-of)"/> 
                            </line>
                            
                            <xsl:copy-of select="line[(position() gt 5) and (starts-with(upper-case(.),'DEGREE'))]"/>
                            <xsl:copy-of select="line[(position() gt 5) and (starts-with(upper-case(.),'DEGREE'))]/following-sibling::line[(position() gt 0)]"/>
                            </lines>
                        </xsl:when>
                    </xsl:choose>
                </xsl:if>

            </xsl:for-each>
        </xml>
    </xsl:template>

</xsl:stylesheet>
