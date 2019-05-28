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
td.icon
{
    width: 0px;
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
            <img style="margin: 2px" height="100px" src="https://discovernewfields.org/application/files/2315/3911/5304/NewfieldsLogo_leWitt.jpg"/>
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
                                        <b>Accession No.: </b><xsl:value-of select="atom[@name='TitAccessionNo']"/>
                                    </td>
                                </tr>
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
                                        <xsl:when test="table[@name='CreCreationCultureOrPeople_tab']">
                                            <xsl:for-each select="table[@name='CreCreationCultureOrPeople_tab']/tuple">
                                                <b style="font-style: normal">Culture or People: </b><xsl:value-of select="atom[@name='CreCreationCultureOrPeople']"/><xsl:if test="position() != last()"><br/></xsl:if>
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
                                <xsl:if test="atom[@name='CreDateCreated'] != ''">
                                <tr class="atomvalue">
                                    <td class="atomvalue">
                                        <b>Date: </b><xsl:value-of select="atom[@name='CreDateCreated']"/>
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
                                                <b>Valuation: $</b><xsl:value-of select="atom[@name='ValValuationAmount']" />
                                            </td>
                                        </tr>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <tr class="atomvalue">
                                            <td class="atomvalue" style="color: red;">
                                                <xsl:text>VALUATION MISSING</xsl:text>
                                            </td>
                                        </tr>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:if test="atom[@name='SumCreditLine'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b>Credit Line: </b><xsl:value-of select="atom[@name='SumCreditLine']" />
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:choose>
                                <xsl:when test="atom[@name='StaStocktakeStatus'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b>Rank: </b><xsl:value-of select="atom[@name='StaStocktakeStatus']" />
                                        </td>
                                    </tr>
                                </xsl:when>
                                <xsl:otherwise>
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="color: red;">
                                            <xsl:text>RANK MISSING</xsl:text>
                                        </td>
                                    </tr>
                                </xsl:otherwise>
                                </xsl:choose>
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b>Deaccession Notes: </b><xsl:value-of select="atom[@name='DeaDeaccessionNotes']" />
                                        </td>
                                    </tr>
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