<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="html"/>
    
    <xsl:template match="table[@name='ecatalogue']">
        <html>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
            <style>
                body{
                background-color: white;
                padding: 20px;
                }
                h1{
                font-family: Tahoma, Verdana, Segoe, sans-serif;
                font-size: 24px;
                font-style: normal;
                font-variant: normal;
                font-weight: 750;
                }
                h2{
                font-family: Tahoma, Verdana, Segoe, sans-serif;
                font-size: 22px;
                font-style: normal;
                font-variant: normal;
                font-weight: 600;
                margin: 0px;
                }
                h3{
                font-family: Tahoma, Verdana, Segoe, sans-serif;
                font-size: 18px;
                font-style: normal;
                font-variant: normal;
                font-weight: 500;
                margin: 5px;
                }
                h4{
                font-family: Tahoma, Verdana, Segoe, sans-serif;
                font-size: 18px;
                font-style: normal;
                font-variant: normal;
                font-weight: 600;
                }
                .page{
                page-break-after: always;
                padding: 20px;
                }
                .lastpage{
                padding: 20px;
                }
                img{
                max-width: 100%;
                height: auto;
                align: center;
                }
                img.artwork{
                max-height: 500px;
                max-width: 500px;
                margin-bottom: 15px;
                align: center;
                }
                table.table{
                max-width: 80%;
                border: 1px solid #cfd4d8;
                }
                .table-condensed th{
                font-family: Tahoma, Verdana, Segoe, sans-serif;
                font-size: 14px;
                font-style: normal;
                font-variant: normal;
                font-weight: bold;
                text-align: right;
                max-width: 30%;
                border: none !important;
                }
                .table-condensed td{
                font-family: Tahoma, Verdana, Segoe, sans-serif;
                font-size: 14px;
                font-style: normal;
                font-variant: normal;
                font-weight: 400;
                width: 70%;
                border: none !important;
                }
                .table-narratives th{
                font-family: Tahoma, Verdana, Segoe, sans-serif;
                font-size: 14px;
                font-style: normal;
                font-variant: normal;
                font-weight: bold;
                text-align: right;
                max-width: 20%;
                border: none !important;
                }
                .table-narratives td{
                font-family: Tahoma, Verdana, Segoe, sans-serif;
                font-size: 14px;
                font-style: normal;
                font-variant: normal;
                font-weight: 400;
                width: 80%;
                border: none !important;
                }
            </style>
            <head>
                <title>American Rehang Handout</title>
            </head>
            <div class="container-fluid">
                <body>
        <xsl:for-each select="tuple">
            <xsl:variable name="dagwood"><xsl:value-of select="table[@name='Dagwood']/tuple[atom[@name='EleIdentifier']/text()][1]/atom[@name='EleIdentifier']"/></xsl:variable>
            <xsl:choose>
                <xsl:when test="position() != last()">
<!--Header with Newfields logo and exhibition name-->
            <div class="page">           
            <center>
                <img src="https://discovernewfields.org/application/files/2515/3608/3665/logo-ima-large.png"
                    alt="Newfields Logo" width="100"/>
                <br/>
                <br/>
                <!--<h1>This is a Placeholder for a Heading</h1><br/>-->
<!--Image-->
                <xsl:element name="img">
                    <xsl:attribute name="class">artwork</xsl:attribute>
                    <xsl:attribute name="src"><xsl:value-of select="table[@name='MulMultiMediaRef_tab']/tuple/atom[@name='Multimedia']"/></xsl:attribute>
                </xsl:element>
<!--Tombstone Information-->
                <h2><xsl:value-of select="atom[@name='TitMainTitle']"/></h2>
                <h3>
    <!--Creator Information-->            
            <xsl:choose>
                <xsl:when test="table[@name='Creator1']">
                    <xsl:for-each select="table[@name='Creator1']/tuple">
                        <xsl:if test="atom[@name='CreRole'] != ''"><xsl:value-of select="atom[@name='CreRole']"/><xsl:text>: </xsl:text></xsl:if>
                        <xsl:choose>
                            <xsl:when test="atom[@name='BioNationality'] != '' and atom[@name='BioBirthDate'] != ''">
                                <xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''"><xsl:value-of select="atom[@name='NamFullName']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioNationality']"/><xsl:text>, </xsl:text><xsl:value-of select="atom[@name='BioBirthDate']"/><xsl:text>-</xsl:text><xsl:value-of select="atom[@name='BioDeathDate']"/><xsl:text>)</xsl:text></xsl:when><xsl:otherwise ><xsl:value-of select="atom[@name='NamOrganisation']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioNationality']"/><xsl:text>, </xsl:text><xsl:value-of select="atom[@name='BioBirthDate']"/><xsl:text>-</xsl:text><xsl:value-of select="atom[@name='BioDeathDate']"/><xsl:text>)</xsl:text></xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test="atom[@name='BioNationality'] != '' and atom[@name='BioBirthDate'] = ''">
                                <xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''"><xsl:value-of select="atom[@name='NamFullName']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioNationality']"/><xsl:text>)</xsl:text></xsl:when><xsl:otherwise><xsl:value-of select="atom[@name='NamOrganisation']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioNationality']"/><xsl:text>)</xsl:text></xsl:otherwise></xsl:choose>
                            </xsl:when>
                            <xsl:when test="atom[@name='BioNationality'] = '' and atom[@name='BioBirthDate'] != ''">
                                <xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''"><xsl:value-of select="atom[@name='NamFullName']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioBirthDate']"/><xsl:text> - </xsl:text><xsl:value-of select="atom[@name='BioDeathDate']"/><xsl:text>)</xsl:text></xsl:when><xsl:otherwise><xsl:value-of select="atom[@name='NamOrganisation']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioBirthDate']"/><xsl:text> - </xsl:text><xsl:value-of select="atom[@name='BioDeathDate']"/><xsl:text>)</xsl:text></xsl:otherwise></xsl:choose>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''"><xsl:value-of select="atom[@name='NamFullName']"/></xsl:when><xsl:otherwise><xsl:value-of select="atom[@name='NamOrganisation']"/></xsl:otherwise></xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="position() != last()">
                            <br/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
            </xsl:choose>
                </h3><br/>
    <!--Table Information-->
                <table class="table table-condensed">
                    <tbody>
                        <tr>
                            <th>Date Created</th>
                            <td><xsl:choose><xsl:when test="atom[@name='CreDateCreated'] != ''"><xsl:value-of select="atom[@name='CreDateCreated']"/></xsl:when><xsl:otherwise>Not Available</xsl:otherwise></xsl:choose></td>
                        </tr>
                        <tr>
                            <th>Medium and Support</th>
                            <td><xsl:choose><xsl:when test="atom[@name='PhyMediumAndSupport'] != ''"><xsl:value-of select="atom[@name='PhyMediumAndSupport']"/></xsl:when><xsl:otherwise>Not Available</xsl:otherwise></xsl:choose></td>
                        </tr>
                        <tr>
                            <th>Dimensions</th>
                            <td><xsl:choose><xsl:when test="atom[@name='PhyConvertedDims'] != ''"><xsl:value-of select="atom[@name='PhyConvertedDims']"/></xsl:when><xsl:otherwise>Not Available</xsl:otherwise></xsl:choose></td>
                        </tr>
                        <tr>
                            <th>Credit Line</th>
                            <td><xsl:choose><xsl:when test="atom[@name='CreDateCreated'] != ''"><xsl:value-of select="atom[@name='SumCreditLine']"/></xsl:when><xsl:otherwise>Not Available</xsl:otherwise></xsl:choose></td>
                        </tr>
                        <tr>
                            <th>Rights Status</th>
                            <td><xsl:choose><xsl:when test="atom[@name='CreDateCreated'] != ''"><xsl:value-of select="table[@name='Rights']/tuple[1]/atom[@name='RigAcknowledgement']"/></xsl:when><xsl:otherwise>Not Available</xsl:otherwise></xsl:choose></td>
                        </tr>
                        <tr>
                            <th>Accession Number</th>
                            <td><xsl:value-of select="atom[@name='TitAccessionNo']"/></td>
                        </tr>
                        <tr>
                            <th>Collection Link</th>
                            <td><xsl:choose><xsl:when test="$dagwood != ''">http://collection.imamuseum.org/artwork/<xsl:value-of select="translate($dagwood, ' ', '')"/></xsl:when><xsl:otherwise>Not Available</xsl:otherwise></xsl:choose></td>
                        </tr>
                    </tbody>
                </table>
            </center>             
            </div>
            <div class="page">
                <center>
                        <!--http://collection.imamuseum.org/artwork/<xsl:value-of select="translate($dagwood, ' ', '')"/>-->
                    <table class="table table-narratives">
                        <tbody>
                            <tr>
                                <th>Provenance</th>
                                <td><xsl:choose><xsl:when test="atom[@name='CreProvenance'] != ''"><xsl:copy><xsl:call-template name="remove-markup"><xsl:with-param name="string" select="atom[@name='CreProvenance']"/></xsl:call-template></xsl:copy></xsl:when><xsl:otherwise>Not Available</xsl:otherwise></xsl:choose></td>
                            </tr>
                            <xsl:for-each select="table[@name='Narratives']/tuple">
                                <xsl:if test="atom[@name='AdmPublishWebNoPassword'] = 'Yes'">
                                <xsl:if test="atom[@name='DesPurpose'] = 'Object Label'">
                            <tr>
                                <th>Gallery Label</th>
                                <td><xsl:copy><xsl:call-template name="remove-markup"><xsl:with-param name="string" select="atom[@name='NarNarrative']"/></xsl:call-template></xsl:copy></td>
                            </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='DesPurpose'] = 'Exhibition Label'">
                            <tr>
                                <th>Gallery Label</th>
                                <td><xsl:copy><xsl:call-template name="remove-markup"><xsl:with-param name="string" select="atom[@name='NarNarrative']"/></xsl:call-template></xsl:copy></td>
                            </tr>
                                </xsl:if>
                                </xsl:if>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </center>
            </div>
                </xsl:when>
                <xsl:otherwise>
                    <!--Header with Newfields logo and exhibition name-->
                    <div class="page">           
                        <center>
                            <img src="https://discovernewfields.org/application/files/2515/3608/3665/logo-ima-large.png"
                                alt="Newfields Logo" width="100"/>
                            <br/>
                            <br/>
                            <!--<h1>This is a Placeholder for a Heading</h1><br/>-->
                            <!--Image-->
                            <xsl:element name="img">
                                <xsl:attribute name="class">artwork</xsl:attribute>
                                <xsl:attribute name="src"><xsl:value-of select="table[@name='MulMultiMediaRef_tab']/tuple/atom[@name='Multimedia']"/></xsl:attribute>
                            </xsl:element>
                            <!--Tombstone Information-->
                            <h2><xsl:value-of select="atom[@name='TitMainTitle']"/></h2>
                            <h3>
                                <!--Creator Information-->            
                                <xsl:choose>
                                    <xsl:when test="table[@name='Creator1']">
                                        <xsl:for-each select="table[@name='Creator1']/tuple">
                                            <xsl:if test="atom[@name='CreRole'] != ''"><xsl:value-of select="atom[@name='CreRole']"/><xsl:text>: </xsl:text></xsl:if>
                                            <xsl:choose>
                                                <xsl:when test="atom[@name='BioNationality'] != '' and atom[@name='BioBirthDate'] != ''">
                                                    <xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''"><xsl:value-of select="atom[@name='NamFullName']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioNationality']"/><xsl:text>, </xsl:text><xsl:value-of select="atom[@name='BioBirthDate']"/><xsl:text>-</xsl:text><xsl:value-of select="atom[@name='BioDeathDate']"/><xsl:text>)</xsl:text></xsl:when><xsl:otherwise ><xsl:value-of select="atom[@name='NamOrganisation']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioNationality']"/><xsl:text>, </xsl:text><xsl:value-of select="atom[@name='BioBirthDate']"/><xsl:text>-</xsl:text><xsl:value-of select="atom[@name='BioDeathDate']"/><xsl:text>)</xsl:text></xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:when>
                                                <xsl:when test="atom[@name='BioNationality'] != '' and atom[@name='BioBirthDate'] = ''">
                                                    <xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''"><xsl:value-of select="atom[@name='NamFullName']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioNationality']"/><xsl:text>)</xsl:text></xsl:when><xsl:otherwise><xsl:value-of select="atom[@name='NamOrganisation']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioNationality']"/><xsl:text>)</xsl:text></xsl:otherwise></xsl:choose>
                                                </xsl:when>
                                                <xsl:when test="atom[@name='BioNationality'] = '' and atom[@name='BioBirthDate'] != ''">
                                                    <xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''"><xsl:value-of select="atom[@name='NamFullName']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioBirthDate']"/><xsl:text> - </xsl:text><xsl:value-of select="atom[@name='BioDeathDate']"/><xsl:text>)</xsl:text></xsl:when><xsl:otherwise><xsl:value-of select="atom[@name='NamOrganisation']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioBirthDate']"/><xsl:text> - </xsl:text><xsl:value-of select="atom[@name='BioDeathDate']"/><xsl:text>)</xsl:text></xsl:otherwise></xsl:choose>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''"><xsl:value-of select="atom[@name='NamFullName']"/></xsl:when><xsl:otherwise><xsl:value-of select="atom[@name='NamOrganisation']"/></xsl:otherwise></xsl:choose>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                            <xsl:if test="position() != last()">
                                                <br/>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </xsl:when>
                                </xsl:choose>
                            </h3><br/>
                            <!--Table Information-->
                            <table class="table table-condensed">
                                <tbody>
                                    <tr>
                                        <th>Date Created</th>
                                        <td><xsl:choose><xsl:when test="atom[@name='CreDateCreated'] != ''"><xsl:value-of select="atom[@name='CreDateCreated']"/></xsl:when><xsl:otherwise>Not Available</xsl:otherwise></xsl:choose></td>
                                    </tr>
                                    <tr>
                                        <th>Medium and Support</th>
                                        <td><xsl:choose><xsl:when test="atom[@name='PhyMediumAndSupport'] != ''"><xsl:value-of select="atom[@name='PhyMediumAndSupport']"/></xsl:when><xsl:otherwise>Not Available</xsl:otherwise></xsl:choose></td>
                                    </tr>
                                    <tr>
                                        <th>Dimensions</th>
                                        <td><xsl:choose><xsl:when test="atom[@name='PhyConvertedDims'] != ''"><xsl:value-of select="atom[@name='PhyConvertedDims']"/></xsl:when><xsl:otherwise>Not Available</xsl:otherwise></xsl:choose></td>
                                    </tr>
                                    <tr>
                                        <th>Credit Line</th>
                                        <td><xsl:choose><xsl:when test="atom[@name='CreDateCreated'] != ''"><xsl:value-of select="atom[@name='SumCreditLine']"/></xsl:when><xsl:otherwise>Not Available</xsl:otherwise></xsl:choose></td>
                                    </tr>
                                    <tr>
                                        <th>Rights Status</th>
                                        <td><xsl:choose><xsl:when test="atom[@name='CreDateCreated'] != ''"><xsl:value-of select="table[@name='Rights']/tuple[1]/atom[@name='RigAcknowledgement']"/></xsl:when><xsl:otherwise>Not Available</xsl:otherwise></xsl:choose></td>
                                    </tr>
                                    <tr>
                                        <th>Accession Number</th>
                                        <td><xsl:value-of select="atom[@name='TitAccessionNo']"/></td>
                                    </tr>
                                    <tr>
                                        <th>Collection Link</th>
                                        <td><xsl:choose><xsl:when test="$dagwood != ''">http://collection.imamuseum.org/artwork/<xsl:value-of select="translate($dagwood, ' ', '')"/></xsl:when><xsl:otherwise>Not Available</xsl:otherwise></xsl:choose></td>
                                    </tr>
                                </tbody>
                            </table>
                        </center>             
                    </div>
                    <div class="lastpage">
                        <center>
                            <!--http://collection.imamuseum.org/artwork/<xsl:value-of select="translate($dagwood, ' ', '')"/>-->
                            <table class="table table-narratives">
                                <tbody>
                                    <tr>
                                        <th>Provenance</th>
                                        <td><xsl:choose><xsl:when test="atom[@name='CreProvenance'] != ''"><xsl:copy><xsl:call-template name="remove-markup"><xsl:with-param name="string" select="atom[@name='CreProvenance']"/></xsl:call-template></xsl:copy></xsl:when><xsl:otherwise>Not Available</xsl:otherwise></xsl:choose></td>
                                    </tr>
                                    <xsl:for-each select="table[@name='Narratives']/tuple">
                                        <xsl:if test="atom[@name='AdmPublishWebNoPassword'] = 'Yes'">
                                        <xsl:if test="atom[@name='DesPurpose'] = 'Object Label'">
                                            <tr>
                                                <th>Gallery Label</th>
                                                <td><xsl:copy><xsl:call-template name="remove-markup"><xsl:with-param name="string" select="atom[@name='NarNarrative']"/></xsl:call-template></xsl:copy></td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="atom[@name='DesPurpose'] = 'Exhibition Label'">
                                            <tr>
                                                <th>Gallery Label</th>
                                                <td><xsl:copy><xsl:call-template name="remove-markup"><xsl:with-param name="string" select="atom[@name='NarNarrative']"/></xsl:call-template></xsl:copy></td>
                                            </tr>
                                        </xsl:if>
                                        </xsl:if>
                                    </xsl:for-each>
                                </tbody>
                            </table>
                        </center>
                    </div>                    
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
                </body>
            </div>
        </html>
    </xsl:template>
    
    <xsl:template name="remove-markup">
        <xsl:param name="string"/> 
        <xsl:choose>
            <xsl:when test="contains($string, '&lt;')">
                <xsl:value-of select="substring-before($string, '&lt;')" />
                <!-- recursive call -->
                <xsl:call-template name="remove-markup">
                    <xsl:with-param name="string" select="substring-after($string, '&gt;')"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$string"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>