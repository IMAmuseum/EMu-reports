<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:emu="http://kesoftware.com/emu"
    xmlns:date="http://exslt.org/dates-and-times">
    <xsl:output method="html" encoding="ISO-8859-1" />

   <!--The root transformation -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Object Report - Photography</title>
                <xsl:call-template name="styles" />
            </head>
            <body class="sheet">
                <xsl:call-template name="body" />
            </body>
        </html>
    </xsl:template>
    <!--
           CSS styles template
     -->
    <xsl:template name="styles">
        <style type="text/css">
            <xsl:text>
body.sheet
{
    background-color: #ffffff;
    color: #000000;
    font-family: Tahoma;
}
table.sheet
{
    width: 95%;
    border-width: 2px;
    border-style: solid;
    border-collapse: collapse;
    background-color: #ffffff;
    border-color: #000000;
}
td.heading
{
    background-color: #c0c0c0;
    color: #000000;
    font-weight: normal;
    line-height: 22px;
    border-width: 2px;
    border-syle: solid;
    border-color: #000000;
    padding-top: 0.5em;
    padding-bottom: 0.5em;
    padding-left: 0.5em;
    padding-right: 0.5em;
}
p.meeting
{
    background-color: #ffffff;
    color: #000000;
    font-size: 22px;
    font-weight: normal;
}
p.date
{
    font-family: Tahoma;
    font-weight: bold;
    text-align: center;
    font-size: 14px;
    margin-bottom: 0px;
}
td.logo
{
    align: center;
    background-color: white;
    color: black;
    font-weight: bold;
    border-width: 0px;
}
tr.image
{
    page-break-inside: avoid;
}
table.picture
{
    width: 100%;
}
td.picture
{
    width: 250px;
}
table.icon
{
    margin-left:auto; 
    margin-right:auto;
}
img.icon
{
    max-width:100%;
    max-height:300px;
    height: auto;
    width:auto;
}
table.data
{
    width: 100%;
}
th
{
    font-weight: bold;
    font-size: small;
    text-align: left;
    vertical-align: top;
    padding-left: 0.5em;
    padding-right: 0.5em;
    border: 0px;
}
td.atomvalue
{
    font-size: small;
    padding-left: 0.5em;
    padding-right: 0.5em;
    border: 0px;
	white-space: pre-wrap;
}
p
{
    font-family: Tahoma;
    font-size: 22px;
    font-weight: bold;
    margin: 10px;
}
</xsl:text>
        </style>
    </xsl:template>
    <!--
            Body template
     -->
    <xsl:template name="body">
        <center>
            <img style="margin-top: 5px; margin-bottom: 10px;" height="75px" src="https://discovernewfields.org/application/files/2515/3608/3665/logo-ima-large.png"/>
            <br/>
            <p class="meeting">Object Report - Photography</p>
            <p class="date"><script> document.write(new Date().toLocaleDateString()); </script></p>
            <br/>
        </center>
        <xsl:for-each select="table[@name='ecatalogue']/tuple[not(starts-with(atom[@name='TitAccessionNo'], 'C')) and not(starts-with(atom[@name='TitAccessionNo'], 'LH')) and not(starts-with(atom[@name='TitAccessionNo'], 'MH')) and not(starts-with(atom[@name='TitAccessionNo'], 'N')) and not(starts-with(atom[@name='TitAccessionNo'], 'S')) and not(starts-with(atom[@name='TitAccessionNo'], 'TR')) and not(starts-with(atom[@name='TitAccessionNo'], 'U')) and not(starts-with(atom[@name='TitAccessionNo'], 'WH'))]">
            <xsl:sort select="substring-before(atom[@name='TitAccessionNo'], '.')" data-type="number"/>
            <xsl:sort select="translate(substring-after(atom[@name='TitAccessionNo'], '.'), '-ABCDEFGHIJKLMNOPQRSTUVWXYZ', '')" data-type="number" />
            <xsl:call-template name="record" />
            <xsl:if test="position() != last()">
                <p />
            </xsl:if>
        </xsl:for-each>
        <xsl:for-each select="table[@name='ecatalogue']/tuple[starts-with(atom[@name='TitAccessionNo'], 'C') or starts-with(atom[@name='TitAccessionNo'], 'LH') or starts-with(atom[@name='TitAccessionNo'], 'MH') or starts-with(atom[@name='TitAccessionNo'], 'N') or starts-with(atom[@name='TitAccessionNo'], 'S') or starts-with(atom[@name='TitAccessionNo'], 'TR') or starts-with(atom[@name='TitAccessionNo'], 'U') or starts-with(atom[@name='TitAccessionNo'], 'WH')]">
            <xsl:sort select="atom[@name='TitAccessionNo']"/>
            <xsl:call-template name="record" />
            <xsl:if test="position() != last()">
                <p />
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    <!--
            Record template
     -->
    <xsl:template name="record">
        <center>
            <table border="1" class="sheet">
                    <xsl:call-template name="object" />
            </table>
        </center>
    </xsl:template>
    <!--
            Object template
     -->
    <xsl:template name="object">
        <tr class="image">
            <td class="image">
                <table class="picture">
                    <tr class="picture">
    <!--
        Object Table
    -->
                        <td style="vertical-align: top;">
                            <table border="0" class="data" id="datatable">
                                <tr class="atomvalue">
                                    <td class="atomvalue">
                                        <b>Accession No.: </b><xsl:value-of select="atom[@name='TitAccessionNo']"/>
                                    </td>
                                </tr>
                                <tr class="atomvalue">
                                    <td class="atomvalue" style="font-style: italic">
                                        <b style="font-style: normal">Title: </b><xsl:value-of select="atom[@name='TitMainTitle']"/>
                                    </td>
                                </tr>
                                <tr class="atomvalue">
                                    <td class="atomvalue">
                                        <xsl:if test="table[@name='Creator1']">
                                        <xsl:for-each select="table[@name='Creator1']/tuple">
                                            <xsl:choose><xsl:when test="atom[@name='CreRole'] != ''"><b><xsl:value-of select="atom[@name='CreRole']"/><xsl:text>: </xsl:text></b></xsl:when><xsl:otherwise><b><xsl:text>Creator: </xsl:text></b></xsl:otherwise></xsl:choose>
                                            <xsl:choose>
                                                <xsl:when test="atom[@name='BioNationality'] != '' and atom[@name='BioBirthDate'] != ''">
                                                    <xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''"><xsl:value-of select="atom[@name='NamFullName']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioNationality']"/><xsl:text>, </xsl:text><xsl:value-of select="atom[@name='BioBirthDate']"/><xsl:text> - </xsl:text><xsl:value-of select="atom[@name='BioDeathDate']"/><xsl:text>)</xsl:text></xsl:when><xsl:otherwise ><xsl:value-of select="atom[@name='NamOrganisation']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioNationality']"/><xsl:text>, </xsl:text><xsl:value-of select="atom[@name='BioBirthDate']"/><xsl:text> - </xsl:text><xsl:value-of select="atom[@name='BioDeathDate']"/><xsl:text>)</xsl:text></xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:when>
                                                <xsl:when test="atom[@name='BioNationality'] != '' and atom[@name='IMAHisCommenced'] != ''">
                                                    <xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''"><xsl:value-of select="atom[@name='NamFullName']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioNationality']"/><xsl:text>, </xsl:text><xsl:value-of select="atom[@name='IMAHisCommenced']"/><xsl:text> - </xsl:text><xsl:value-of select="atom[@name='IMAHisCompleted']"/><xsl:text>)</xsl:text></xsl:when><xsl:otherwise ><xsl:value-of select="atom[@name='NamOrganisation']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioNationality']"/><xsl:text>, </xsl:text><xsl:value-of select="atom[@name='IMAHisCommenced']"/><xsl:text> - </xsl:text><xsl:value-of select="atom[@name='IMAHisCompleted']"/><xsl:text>)</xsl:text></xsl:otherwise></xsl:choose>
                                                </xsl:when>
                                                <xsl:when test="atom[@name='BioNationality'] != '' and atom[@name='BioBirthDate'] = ''">
                                                    <xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''"><xsl:value-of select="atom[@name='NamFullName']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioNationality']"/><xsl:text>)</xsl:text></xsl:when><xsl:otherwise><xsl:value-of select="atom[@name='NamOrganisation']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioNationality']"/><xsl:text>)</xsl:text></xsl:otherwise></xsl:choose>
                                                </xsl:when>
                                                <xsl:when test="atom[@name='BioNationality'] = '' and atom[@name='BioBirthDate'] != ''">
                                                    <xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''"><xsl:value-of select="atom[@name='NamFullName']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioBirthDate']"/><xsl:text> - </xsl:text><xsl:value-of select="atom[@name='BioDeathDate']"/><xsl:text>)</xsl:text></xsl:when><xsl:otherwise><xsl:value-of select="atom[@name='NamOrganisation']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioBirthDate']"/><xsl:text> - </xsl:text><xsl:value-of select="atom[@name='BioDeathDate']"/><xsl:text>)</xsl:text></xsl:otherwise></xsl:choose>
                                                </xsl:when>
                                                <xsl:when test="atom[@name='BioNationality'] = '' and atom[@name='IMAHisCommenced'] != ''">
                                                    <xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''"><xsl:value-of select="atom[@name='NamFullName']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='IMAHisCommenced']"/><xsl:text> - </xsl:text><xsl:value-of select="atom[@name='IMAHisCompleted']"/><xsl:text>)</xsl:text></xsl:when><xsl:otherwise><xsl:value-of select="atom[@name='NamOrganisation']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='IMAHisCommenced']"/><xsl:text> - </xsl:text><xsl:value-of select="atom[@name='IMAHisCompleted']"/><xsl:text>)</xsl:text></xsl:otherwise></xsl:choose>
                                                </xsl:when>
                                                <xsl:when test="atom[@name='BioNationality'] != '' and atom[@name='BioDeathDate'] != ''">
                                                    <xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''"><xsl:value-of select="atom[@name='NamFullName']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioNationality']"/><xsl:text>, d. </xsl:text><xsl:value-of select="atom[@name='BioDeathDate']"/><xsl:text>)</xsl:text></xsl:when><xsl:otherwise ><xsl:value-of select="atom[@name='NamOrganisation']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioNationality']"/><xsl:text>, d. </xsl:text><xsl:value-of select="atom[@name='BioDeathDate']"/><xsl:text>)</xsl:text></xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''"><xsl:value-of select="atom[@name='NamFullName']"/></xsl:when><xsl:when test="atom[@name='NamOrganisation'] != ''"><xsl:value-of select="atom[@name='NamOrganisation']"/></xsl:when><xsl:otherwise><xsl:value-of select="atom[@name='ColCollaborationName']"/></xsl:otherwise></xsl:choose>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                            <xsl:if test="position() != last()">
                                                <br/>
                                            </xsl:if>
                                        </xsl:for-each>
                                        </xsl:if>
                                        <xsl:if test="table[@name='Creator2']">
                                            <xsl:if test="table[@name='Creator1']"><br/></xsl:if>
                                            <xsl:for-each select="table[@name='Creator2']/tuple">
                                                <b><xsl:text>Culture/Nationality: </xsl:text></b>
                                                <xsl:if test="atom[@name='CreCreatorAttribution'] != ''"><xsl:value-of select="atom[@name='CreCreatorAttribution']"/><xsl:text> </xsl:text></xsl:if>
                                                <xsl:if test="atom[@name='CreCreationCultureOrPeople'] != ''"><xsl:value-of select="atom[@name='CreCreationCultureOrPeople']"/></xsl:if>
                                                <xsl:if test="atom[@name='CreCreationNationality2'] != ''"><xsl:value-of select="atom[@name='CreCreationNationality2']"/></xsl:if>
                                            </xsl:for-each>
                                        </xsl:if>
                                    </td>
                                </tr>
                                <xsl:if test="atom[@name='CreDateCreated'] != ''">
                                <tr class="atomvalue">
                                    <td class="atomvalue">
                                        <b>Date Created: </b><xsl:value-of select="atom[@name='CreDateCreated']"/>
                                    </td>
                                </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='CreDateDesigned'] != ''">
                                <tr class="atomvalue">
                                    <td class="atomvalue">
                                        <b>Date Designed: </b><xsl:value-of select="atom[@name='CreDateDesigned']"/>
                                    </td>
                                </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='PhyMediumAndSupport'] != ''">
                                <tr class="atomvalue">
                                    <td class="atomvalue">
                                        <b>Medium and Support: </b><xsl:value-of select="atom[@name='PhyMediumAndSupport']"/>
                                    </td>
                                </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='SumCreditLine'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b>Credit Line: </b><xsl:value-of select="atom[@name='SumCreditLine']" />
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="table[@name='Rights']">
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b>Acknowledgement: </b><xsl:value-of select="table[@name='Rights']/tuple[1]/atom[@name='RigAcknowledgement']" />
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='StaStocktakeStatus'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b>Collection Ranking: </b><xsl:value-of select="atom[@name='StaStocktakeStatus']" />
                                        </td>
                                    </tr>
                                </xsl:if>
                                <tr class="atomvalue">
                                    <td class="atomvalue">
                                        <b>Current Location: </b><xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='SummaryData']" />
                                    </td>
                                </tr>
                                <tr class="atomvalue">
                                    <td class="atomvalue">
                                        <b>Permanent Location: </b><xsl:value-of select="tuple[@name='LocPermanentLocationRef']/atom[@name='SummaryData']" />
                                    </td>
                                </tr>
                                <xsl:if test="atom[@name='PhyConvertedDims'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b>Dimensions: </b><xsl:value-of select="atom[@name='PhyConvertedDims']"/>
                                        </td>
                                    </tr>
                                </xsl:if>
                            </table>
                        </td>
    <!--
        Image Table
    -->
                        <xsl:choose>
                            <xsl:when test="table[@name='MulMultiMediaRef_tab']/tuple/atom[@name='Multimedia']">
                                <td class="picture" style="vertical-align: center;">
                                    <table class="icon">
                                        <tr class="icon">
                                            <td class="icon">
                                                <img class="icon">
                                                    <xsl:attribute name="src">
                                                        <xsl:value-of select="concat('file:///', translate(table/tuple/atom[@name='Multimedia'], '\', '/'))" />
                                                    </xsl:attribute>
                                                </img>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </xsl:when>
                            <xsl:otherwise>
                                <td></td>
                            </xsl:otherwise>
                        </xsl:choose>
                    </tr>
                </table>
                <xsl:if test="table[@name='Dimensions']">
                    <table>
                        <col width="20%"/>
                        <col width="10%"/>
                        <col width="10%"/>
                        <col width="10%"/>
                        <col width="10%"/>
                        <col width="7%"/>
                        <col width="33%"/>
                        <tr>
                            <th>Dimensions:</th>
                        </tr>
                        <tr>
                            <th>Type</th>
                            <th>Height</th>
                            <th>Width</th>
                            <th>Depth</th>
                            <th>Diameter</th>
                            <th>Unit</th>
                            <th>Notes</th>
                        </tr>
                        <xsl:for-each select="table[@name='Dimensions']/tuple[not(starts-with(atom[@name='PhyType'], 'IMA Number')) and not(starts-with(atom[@name='PhyType'], 'This'))]">
                            <tr class="atomvalue">
                                <td class="atomvalue"><xsl:value-of select="atom[@name='PhyType']"/></td>
                                <td class="atomvalue"><xsl:if test="atom[@name='PhyHeight'] != ''"><xsl:value-of select="format-number(atom[@name='PhyHeight'],'#.##')"/></xsl:if></td>
                                <td class="atomvalue"><xsl:if test="atom[@name='PhyWidth'] != ''"><xsl:value-of select="format-number(atom[@name='PhyWidth'],'#.##')"/></xsl:if></td>
                                <td class="atomvalue"><xsl:if test="atom[@name='PhyDepth'] != ''"><xsl:value-of select="format-number(atom[@name='PhyDepth'],'#.##')"/></xsl:if></td>
                                <td class="atomvalue"><xsl:if test="atom[@name='PhyDiameter'] != ''"><xsl:value-of select="format-number(atom[@name='PhyDiameter'],'#.##')"/></xsl:if></td>
                                <td class="atomvalue"><xsl:value-of select="atom[@name='PhyUnitLength']"/></td>
                                <td class="atomvalue"><xsl:value-of select="atom[@name='PhyDimensionNotes']"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </xsl:if>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>