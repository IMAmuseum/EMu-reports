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
td.meeting
{
    background-color: #ffffff;
    color: #000000;
    font-size: 22px;
    font-weight: normal;
    border-width: 2px;
    border-syle: solid;
    border-color: #000000;
    padding-top: 0.5em;
    padding-bottom: 0.5em;
    padding-left: 0.5em;
    padding-right: 0.5em;
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
	white-space: pre-wrap;
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
            <img style="margin-top: 5px; margin-bottom: 10px;" height="75px" src="https://discovernewfields.org/application/files/2515/3608/3665/logo-ima-large.png"/>
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
                                    <td class="atomvalue" style="font-weight: bold">
                                    <xsl:choose>
                                        <xsl:when test="table[@name='Creator']">
                                        <xsl:for-each select="table[@name='Creator']/tuple">
                                            <xsl:if test="atom[@name='CreRole'] != ''"><xsl:value-of select="atom[@name='CreRole']"/><xsl:text>: </xsl:text></xsl:if>
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
                                        <xsl:otherwise>
                                            <xsl:value-of select="table[@name='CreCountry_tab']/tuple[1]/atom[@name='CreCountry']"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    </td>
                                </tr>
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="font-style: italic">
                                            <b style="font-style: normal">Title: </b><xsl:value-of select="atom[@name='TitMainTitle']"/>
                                        </td>
                                    </tr>
                                <tr class="atomvalue">
                                    <td class="atomvalue">
                                        <b>Accession No.: </b><xsl:value-of select="atom[@name='TitAccessionNo']"/>
                                    </td>
                                </tr>
                                <xsl:if test="atom[@name='CreDateCreated'] != ''">
                                <tr class="atomvalue">
                                    <td class="atomvalue">
                                        <b>Date: </b><xsl:value-of select="atom[@name='CreDateCreated']"/>
                                    </td>
                                </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='CreDateCreated'] = ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b><span style="color: red;">DATE MISSING</span></b>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="table[@name='Creation']">
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b>Creation Location: </b>
                                            <xsl:for-each select="table[@name='Creation']/tuple">
                                                <xsl:if test="atom[@name='CreCity'] != ''"><xsl:value-of select="atom[@name='CreCity']"/><xsl:text>, </xsl:text></xsl:if><xsl:if test="atom[@name='CreState'] != ''"><xsl:value-of select="atom[@name='CreState']"/><xsl:text>, </xsl:text></xsl:if><xsl:if test="atom[@name='CreCountry'] != ''"><xsl:value-of select="atom[@name='CreCountry']"/></xsl:if>
                                                <xsl:if test="position() != last()"><xsl:text>; </xsl:text></xsl:if></xsl:for-each>
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
                                <xsl:if test="atom[@name='PhyConvertedDims'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b>Dimensions: </b><xsl:value-of select="atom[@name='PhyConvertedDims']"/>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='CrePrimaryInscriptions'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b>Mark Description: </b><xsl:value-of select="atom[@name='CrePrimaryInscriptions']" />
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
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b>Current Location: </b><xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='SummaryData']" />
                                        </td>
                                    </tr>  
                                <xsl:if test="atom[@name='CreProvenance'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b>Provenance: </b><xsl:value-of select="atom[@name='CreProvenance']" />
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='NotRegistrarNotes'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b>Registrar Notes: </b><xsl:value-of select="atom[@name='NotRegistrarNotes']" />
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
                            <xsl:otherwise>
                                <td></td>
                            </xsl:otherwise>
                        </xsl:choose>
                    </tr>
                </table>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>