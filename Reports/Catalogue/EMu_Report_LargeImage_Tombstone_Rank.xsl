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
                max-height: 550px;
                max-width: 600px;
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
                max-width: 35%;
                border: none !important;
                }
                .table-condensed td{
                font-family: Tahoma, Verdana, Segoe, sans-serif;
                font-size: 14px;
                font-style: normal;
                font-variant: normal;
                font-weight: 400;
                width: 65%;
                border: none !important;
                }
            </style>
            <head>
                <title>Collection Inventory</title>
            </head>
            <div class="container-fluid">
                <body>
        <xsl:for-each select="tuple">
            <xsl:choose>
                <xsl:when test="position() != last()">
            <div class="page">           
            <center>
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
                <xsl:when test="table[@name='Creator']">
                    <xsl:for-each select="table[@name='Creator']/tuple">
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
                            <td><xsl:value-of select="atom[@name='CreDateCreated']"/></td>
                        </tr>
                        <tr>
                            <th>Medium and Support</th>
                            <td><xsl:value-of select="atom[@name='PhyMediumAndSupport']"/></td>
                        </tr>
                        <tr>
                            <th>Dimensions</th>
                            <td>    <xsl:choose>
                                <xsl:when test="contains(atom[@name='PhyConvertedDims'],'&#10;')">
                                    <xsl:value-of select="substring-before(atom[@name='PhyConvertedDims'],'&#10;')"/>
                                    <br/>
                                    <xsl:value-of select="substring-after(atom[@name='PhyConvertedDims'],'&#10;')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="atom[@name='PhyConvertedDims']"/>
                                </xsl:otherwise>
                            </xsl:choose></td>
                        </tr>
                        <tr>
                            <th>Credit Line</th>
                            <td><xsl:value-of select="atom[@name='SumCreditLine']"/></td>
                        </tr>
                        <tr>
                            <th>Accession Number</th>
                            <td><xsl:value-of select="atom[@name='TitAccessionNo']"/></td>
                        </tr>
                        <tr>
                            <th>Collection Ranking</th>
                            <td><xsl:value-of select="atom[@name='StaStocktakeStatus']"/></td>
                        </tr>
                    </tbody>
                </table>
            </center>             
            </div>
                </xsl:when>
                <xsl:otherwise>
                    <div class="lastpage">           
                        <center>
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
                                    <xsl:when test="table[@name='Creator']">
                                        <xsl:for-each select="table[@name='Creator']/tuple">
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
                                        <td><xsl:value-of select="atom[@name='CreDateCreated']"/></td>
                                    </tr>
                                    <tr>
                                        <th>Medium and Support</th>
                                        <td><xsl:value-of select="atom[@name='PhyMediumAndSupport']"/></td>
                                    </tr>
                                    <tr>
                                        <th>Dimensions</th>
                                        <td>    <xsl:choose>
                                            <xsl:when test="contains(atom[@name='PhyConvertedDims'],'&#10;')">
                                                <xsl:call-template name="tokenize">
                                                    <xsl:with-param name="text" select="atom[@name='PhyConvertedDims']"/>
                                                </xsl:call-template>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="atom[@name='PhyConvertedDims']"/>
                                            </xsl:otherwise>
                                        </xsl:choose></td>
                                    </tr>
                                    <tr>
                                        <th>Credit Line</th>
                                        <td><xsl:value-of select="atom[@name='SumCreditLine']"/></td>
                                    </tr>
                                    <tr>
                                        <th>Accession Number</th>
                                        <td><xsl:value-of select="atom[@name='TitAccessionNo']"/></td>
                                    </tr>
                                    <tr>
                                        <th>Collection Ranking</th>
                                        <td><xsl:value-of select="atom[@name='StaStocktakeStatus']"/></td>
                                    </tr>
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
    
    <!--
            Delimiter Split template
    -->
    <xsl:template name="tokenize">
        <xsl:param name="text" select="."/>
        <xsl:param name="separator" select="'&#10;'"/>
        <xsl:choose>
            <xsl:when test="not(contains($text, $separator))">
                <xsl:value-of select="$text"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="substring-before($text,$separator)"/>
                <br/>
                <xsl:call-template name="tokenize">
                    <xsl:with-param name="text" select="substring-after($text, $separator)"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>