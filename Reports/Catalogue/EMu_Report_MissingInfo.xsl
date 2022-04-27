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
textarea.meeting
{
    font-family: Tahoma;
    font-weight: bold;
    text-align: center;
    font-size: 20px;
    border: none;
    resize: none;
}
textarea.date
{
    font-family: Tahoma;
    font-weight: bold;
    text-align: center;
    font-size: 14px;
    margin-bottom: 10px;
    border: none;
    resize: none;
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
    max-height:250px;
    height: auto;
    width:auto;
}
table.data
{
    width: 100%;
}
td.atomprompt
{
    font-weight: bold;
    font-size: small;
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
}
td.bottomvalue
{
    font-size: small;
    padding: 0.5em;
}
pre
{
   font-family: "Tahoma";
   font-size: 15px;
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
            <img style="margin: 5px" height="75px" src="https://discovernewfields.org/application/files/2515/3608/3665/logo-ima-large.png"/>
            <br/>
            <textarea class="meeting" rows="1" cols="50">Enter Header Here</textarea>
            <br/>
            <textarea class="date" rows="1" cols="50">Enter Date Here</textarea>
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
                                        <b>Object ID: </b><xsl:value-of select="atom[@name='TitAccessionNo']"/>
                                    </td>
                                </tr>
                                <xsl:if test="atom[@name='TitPreviousAccessionNo'] != ''">
                                <tr class="atomvalue">
                                    <td class="atomvalue">
                                        <b>Previous ID: </b><xsl:value-of select="atom[@name='TitPreviousAccessionNo']"/>
                                    </td>
                                </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='TitPreviousAccessionNo'] = ''">
                                <tr class="atomvalue">
                                    <td class="atomvalue">
                                        <b>Previous ID: </b><span style="color: red;">MISSING</span>
                                    </td>
                                </tr>
                                </xsl:if>
                                <tr class="atomvalue">
                                    <td class="atomvalue">
                                        <xsl:choose>
                                            <xsl:when test="table[@name='Creator']">
                                                <xsl:for-each select="table[@name='Creator']/tuple">
                                                    <xsl:choose><xsl:when test="atom[@name='CreRole'] != ''"><b style="font-style: normal"><xsl:value-of select="atom[@name='CreRole']"/><xsl:text>:  </xsl:text></b></xsl:when><xsl:otherwise><b style="font-style: normal"><xsl:text>Creator:  </xsl:text></b></xsl:otherwise></xsl:choose>
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
                                            </xsl:when>
                                            <xsl:when test="table[@name='Culture']">
                                                <xsl:for-each select="table[@name='Culture']/tuple">
                                                    <xsl:if test="atom[@name='CreCreationAttribution']">
                                                        <xsl:value-of select="atom[@name='CreCreationAttribution']"/><xsl:text> </xsl:text></xsl:if>
                                                    <xsl:choose>
                                                        <xsl:when test="atom[@name='CreCreationCultureOrPeople'] and atom[@name='CreCreationNationality2']">
                                                            <xsl:value-of select="atom[@name='CreCreationCultureOrPeople']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='CreCreationNationality2']"/><xsl:text>)</xsl:text>
                                                        </xsl:when>
                                                        <xsl:when test="atom[@name='CreCreationCultureOrPeople']">
                                                            <xsl:value-of select="atom[@name='CreCreationCultureOrPeople']"/>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:value-of select="atom[@name='CreCreationNationality2']"/>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:for-each>
                                                <xsl:if test="position() != last()">
                                                    <br/>
                                                </xsl:if>
                                            </xsl:when>
                                            <xsl:otherwise><span style="color: red;">CREATOR/CULTURE/PEOPLE/NATIONALITY MISSING</span></xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                </tr>
                                <xsl:if test="atom[@name='TitMainTitle'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="font-style: italic">
                                            <b style="font-style: normal">Title: </b><xsl:value-of select="atom[@name='TitMainTitle']"/>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='TitMainTitle'] = ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="font-style: normal">
                                            <b>Title: </b><span style="color: red;">MISSING</span>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='CreDateCreated'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="font-style: normal">
                                            <b>Date Created: </b><xsl:value-of select="atom[@name='CreDateCreated']"/>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='CreDateCreated'] = ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="font-style: normal">
                                            <b>Date Created: </b><span style="color: red;">MISSING</span>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='PhyMediumAndSupport'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="font-style: normal">
                                            <b>Medium and Support: </b><xsl:value-of select="atom[@name='PhyMediumAndSupport']"/>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='PhyMediumAndSupport'] = ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="font-style: normal">
                                            <b>Medium and Support: </b><span style="color: red;">MISSING</span>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='PhyConvertedDims'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="font-style: normal">
                                            <b style="font-style: normal">Dimensions: </b><xsl:value-of select="atom[@name='PhyConvertedDims']"/>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='PhyConvertedDims'] = ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="font-style: normal">
                                            <b>Dimensions: </b><span style="color: red;">MISSING</span>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='SumCreditLine'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="font-style: normal">
                                            <b>Credit Line: </b><xsl:value-of select="atom[@name='SumCreditLine']"/>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='SumCreditLine'] = ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="font-style: normal">
                                            <b>Credit Line: </b><span style="color: red;">MISSING</span>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='TitAccessionDate'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="font-style: normal">
                                            <b>Accession Date: </b><xsl:value-of select="atom[@name='TitAccessionDate']"/>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='TitAccessionDate'] = ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="font-style: normal">
                                            <b>Accession Date: </b><span style="color: red;">MISSING</span>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='StaStocktakeStatus'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="font-style: normal">
                                            <b>Rank: </b><xsl:value-of select="atom[@name='StaStocktakeStatus']"/>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='StaStocktakeStatus'] = ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="font-style: normal">
                                            <b>Rank: </b><span style="color: blue;">No information.</span>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:choose>
                                    <xsl:when test="atom[@name='ValValuationAmount'] != '' and atom[@name='ValReasonForValuation'] != ''">
                                        <tr class="atomvalue">
                                            <td class="atomvalue">
                                                <b><xsl:value-of select="atom[@name='ValReasonForValuation']"/>: $</b><xsl:value-of select="atom[@name='ValValuationAmount']" />
                                            </td>
                                        </tr>
                                    </xsl:when>
                                    <xsl:when test="atom[@name='ValValuationAmount'] != '' and atom[@name='ValReasonForValuation'] = ''">
                                        <tr class="atomvalue">
                                            <td class="atomvalue">
                                                <b><span style="color: blue;">No Valuation Reason: </span>$</b><xsl:value-of select="atom[@name='ValValuationAmount']" />
                                            </td>
                                        </tr>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <tr class="atomvalue">
                                            <td class="atomvalue" style="color: blue;">
                                                <xsl:text>No valuation or reason.</xsl:text>
                                            </td>
                                        </tr>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:if test="atom[@name='ValDateValued'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="font-style: normal">
                                            <b>Date Valued: </b><xsl:value-of select="atom[@name='ValDateValued']"/>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='ValDateValued'] = ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="font-style: normal">
                                            <b>Date Valued: </b><span style="color: blue;">No information.</span>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='ValValuationNotes'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="font-style: normal">
                                            <b>Valuation Notes: </b><xsl:value-of select="atom[@name='ValValuationNotes']"/>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='ValValuationNotes'] = ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="font-style: normal">
                                            <b>Valuation Notes: </b><span style="color: blue;">No information.</span>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='CreProvenance'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="font-style: normal">
                                            <b>Provenance: </b><xsl:value-of select="atom[@name='CreProvenance']"/>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='CreProvenance'] = ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="font-style: normal">
                                            <b>Provenance: </b><span style="color: red;">MISSING</span>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='DeaDeaccessionNotes'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="font-style: normal">
                                            <b>Deaccession Notes: </b><xsl:value-of select="atom[@name='DeaDeaccessionNotes']"/>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='DeaDeaccessionNotes'] = ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="font-style: normal">
                                            <b>Deaccession Notes: </b><span style="color: blue;">No information.</span>
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
                                <td class="picture" style="vertical-align: top;">
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
                            <xsl:when test="table[@name='MulMultiMediaRef_tab']/tuple/atom[@name='AdmDateInserted']">
                                <td></td>
                            </xsl:when>
                            <xsl:otherwise>
                                <td><b><span style="color: green;">No image attached to object.</span></b></td>
                            </xsl:otherwise>
                        </xsl:choose>
                    </tr>
                </table>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>