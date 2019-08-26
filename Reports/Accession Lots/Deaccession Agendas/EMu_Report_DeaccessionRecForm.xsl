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
td.logo
{
    align: center;
    background-color: white;
    color: black;
    font-weight: bold;
    border-width: 0px;
    padding-top: 0.5em;
    padding-bottom: 0.5em;
    padding-left: 0.5em;
    padding-right: 0.5em;
}
textarea.meeting
{
    font-family: Tahoma;
    font-weight: bold;
    text-align: center;
    font-size: 20px;
    border: none;
    resize: none;
    margin-top: 5px;
    margin-bottom: 10px;
}
tr.image
{
    page-break-inside: avoid;
}
table.picture
{
    width: 100%;
    padding-bottom: 2px;
}
table.icon
{
    margin-left:auto; 
    margin-right:auto;
}
img.icon
{
    max-width: 150px;
    max-height: 150px;
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
            <img style="margin: 5px" height="75px" src="https://discovernewfields.org/application/files/2515/3608/3665/logo-ima-large.png"/>
            <br/>
                <textarea class="meeting" rows="1" cols="50">Enter header here.</textarea>
            <br/>
        </center>
        <xsl:for-each select="/table[@name='eaccessionlots']/tuple">
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
                <xsl:for-each select="table[@name='AccAccessionLotRef']/tuple[not(starts-with(atom[@name='TitAccessionNo'], 'C')) and not(starts-with(atom[@name='TitAccessionNo'], 'LH')) and not(starts-with(atom[@name='TitAccessionNo'], 'MH')) and not(starts-with(atom[@name='TitAccessionNo'], 'N')) and not(starts-with(atom[@name='TitAccessionNo'], 'S')) and not(starts-with(atom[@name='TitAccessionNo'], 'TR')) and not(starts-with(atom[@name='TitAccessionNo'], 'U')) and not(starts-with(atom[@name='TitAccessionNo'], 'WH'))]">
                    <xsl:sort select="substring-before(atom[@name='TitAccessionNo'], '.')" data-type="number"/>
                    <xsl:sort select="translate(substring-after(atom[@name='TitAccessionNo'], '.'), '-ABCDEFGHIJKLMNOPQRSTUVWXYZ', '')" data-type="number" />
                    <xsl:call-template name="object" />
                </xsl:for-each>
                <xsl:for-each select="table[@name='AccAccessionLotRef']/tuple[starts-with(atom[@name='TitAccessionNo'], 'C')]">
                    <xsl:sort select="atom[@name='TitAccessionNo']"/>
                    <xsl:call-template name="object" />
                </xsl:for-each>
                <xsl:for-each select="table[@name='AccAccessionLotRef']/tuple[starts-with(atom[@name='TitAccessionNo'], 'LH')]">
                    <xsl:sort select="atom[@name='TitAccessionNo']"/>
                    <xsl:call-template name="object" />
                </xsl:for-each>
                <xsl:for-each select="table[@name='AccAccessionLotRef']/tuple[starts-with(atom[@name='TitAccessionNo'], 'MH')]">
                    <xsl:sort select="atom[@name='TitAccessionNo']"/>
                    <xsl:call-template name="object" />
                </xsl:for-each>
                <xsl:for-each select="table[@name='AccAccessionLotRef']/tuple[starts-with(atom[@name='TitAccessionNo'], 'N')]">
                    <xsl:sort select="atom[@name='TitAccessionNo']"/>
                    <xsl:call-template name="object" />
                </xsl:for-each>
                <xsl:for-each select="table[@name='AccAccessionLotRef']/tuple[starts-with(atom[@name='TitAccessionNo'], 'S')]">
                    <xsl:sort select="atom[@name='TitAccessionNo']"/>
                    <xsl:call-template name="object" />
                </xsl:for-each>
                <xsl:for-each select="table[@name='AccAccessionLotRef']/tuple[starts-with(atom[@name='TitAccessionNo'], 'TR')]">
                    <xsl:sort select="atom[@name='TitAccessionNo']"/>
                    <xsl:call-template name="object" />
                </xsl:for-each>
                <xsl:for-each select="table[@name='AccAccessionLotRef']/tuple[starts-with(atom[@name='TitAccessionNo'], 'U')]">
                    <xsl:sort select="atom[@name='TitAccessionNo']"/>
                    <xsl:call-template name="object" />
                </xsl:for-each>
                <xsl:for-each select="table[@name='AccAccessionLotRef']/tuple[starts-with(atom[@name='TitAccessionNo'], 'WH')]">
                    <xsl:sort select="atom[@name='TitAccessionNo']"/>
                    <xsl:call-template name="object" />
                </xsl:for-each>
            </table>
        </center>
    </xsl:template>
    <!--
            Object template
     -->
    <xsl:template name="object">
        <tr class="image">
            <td class="image">
    <!--
        Image Table
    -->
                <table class="picture">
                    <tr class="picture">
                        <xsl:choose>
                        <xsl:when test="table[@name='MulMultiMediaRef_tab']/tuple/atom[@name='Multimedia']">
                            <td class="picture" width="175px">
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
                        <td>
    <!--
        Object Table
    -->
                            <table border="0" class="data" id="datatable">
                                <xsl:if test="atom[@name='TitAccessionNo'] != ''">
                                <tr class="atomvalue">
                                    <td class="atomvalue">
                                        <b>Object ID: </b><xsl:value-of select="atom[@name='TitAccessionNo']"/>
                                    </td>
                                </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='TitAccessionNo'] = ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b><span style="color: red;">OBJECT ID MISSING</span></b>
                                        </td>
                                    </tr>
                                </xsl:if>
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
                                            <b><span style="color: red;">PREVIOUS ID MISSING</span></b>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <tr class="atomvalue">
                                    <td class="atomvalue" style="font-weight: bold">
                                        <xsl:if test="table[@name='Culture']">
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
                                        </xsl:if>
                                        <xsl:choose>
                                            <xsl:when test="table[@name='Creator']">
                                                <xsl:for-each select="table[@name='Creator']/tuple">
                                                    <xsl:if test="atom[@name='CreRole'] != ''"><xsl:value-of select="atom[@name='CreRole']"/><xsl:text>: </xsl:text></xsl:if>
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
                                <xsl:if test="atom[@name='TitMainTitle'] != ''">
                                <tr class="atomvalue">
                                    <td class="atomvalue">
                                        <b>Title: </b><xsl:value-of select="atom[@name='TitMainTitle']"/>
                                    </td>
                                </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='TitMainTitle'] = ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b><span style="color: red;">TITLE MISSING</span></b>
                                        </td>
                                    </tr>
                                </xsl:if>
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
                                <xsl:if test="atom[@name='PhyMediumAndSupport'] != ''">
                                <tr class="atomvalue">
                                    <td class="atomvalue">
                                        <b>Medium: </b><xsl:value-of select="atom[@name='PhyMediumAndSupport']"/>
                                    </td>
                                </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='PhyMediumAndSupport'] = ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b><span style="color: red;">MEDIUM AND SUPPORT MISSING</span></b>
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
                                <xsl:if test="atom[@name='PhyConvertedDims'] = ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="color: red;">
                                            <xsl:text>CONVERTED DIMENSIONS MISSING</xsl:text>
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
                                <xsl:if test="atom[@name='SumCreditLine'] = ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="color: red;">
                                            <xsl:text>CREDIT LINE MISSING</xsl:text>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='TitAccessionDate'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b>Accession Date: </b><xsl:call-template name="date"><xsl:with-param name="input_date"><xsl:value-of select="atom[@name='TitAccessionDate']" /></xsl:with-param></xsl:call-template>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='TitAccessionDate'] = ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="color: red;">
                                            <xsl:text>ACCESSION DATE MISSING</xsl:text>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='StaStocktakeStatus'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b>Collection Rank: </b><xsl:value-of select="atom[@name='StaStocktakeStatus']" />
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='StaStocktakeStatus'] = ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="color: red;">
                                            <xsl:text>COLLECTION RANK MISSING</xsl:text>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:choose>
                                    <xsl:when test="atom[@name='ValReasonForValuation'] != '' and atom[@name='ValValuationAmount'] != ''">
                                        <tr class="atomvalue">
                                            <td class="atomvalue">
                                                <b><xsl:value-of select="atom[@name='ValReasonForValuation']"/>: </b><xsl:text>$</xsl:text><xsl:value-of select="format-number(atom[@name='ValValuationAmount'], '###,###,###,###,###.00')"/>
                                            </td>
                                        </tr>
                                    </xsl:when>
                                    <xsl:when test="atom[@name='ValReasonForValuation'] = '' and atom[@name='ValValuationAmount'] != ''">
                                        <tr class="atomvalue">
                                            <td class="atomvalue">
                                                <b>Value: </b><xsl:text>$</xsl:text><xsl:value-of select="format-number(atom[@name='ValValuationAmount'], '###,###,###,###,###.00')"/>
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
                                <xsl:if test="atom[@name='ValDateValued'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b>Date Valued: </b><xsl:call-template name="date"><xsl:with-param name="input_date"><xsl:value-of select="atom[@name='ValDateValued']"/></xsl:with-param></xsl:call-template>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='ValDateValued'] = ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue" style="color: red;">
                                            <xsl:text>DATE VALUED MISSING</xsl:text>
                                        </td>
                                    </tr>
                                </xsl:if>
                            </table>
                        </td>
                    </tr>
                </table>
                <table class="picture">
                    <xsl:if test="atom[@name='ValValuationNotes'] != ''">
                        <tr class="atomvalue">
                            <td class="atomvalue">
                                <b>Value Notes: </b><xsl:value-of select="atom[@name='ValValuationNotes']" />
                            </td>
                        </tr>
                    </xsl:if>
                    <xsl:if test="atom[@name='CreProvenance'] != ''">
                        <tr class="atomvalue">
                            <td class="atomvalue">
                                <b>Provenance: </b><xsl:value-of select="atom[@name='CreProvenance']" />
                            </td>
                        </tr>
                    </xsl:if>
                    <xsl:if test="atom[@name='CreProvenance'] = ''">
                        <tr class="atomvalue">
                            <td class="atomvalue" style="color: red; font-weight: bold;">
                                <xsl:text>PROVENANCE MISSING</xsl:text>
                            </td>
                        </tr>
                    </xsl:if>
                    <xsl:if test="atom[@name='DeaDeaccessionNotes'] != ''">
                        <tr class="atomvalue">
                            <td class="atomvalue">
                                <b>Reason for Deaccession: </b><xsl:value-of select="atom[@name='DeaDeaccessionNotes']" />
                            </td>
                        </tr>
                    </xsl:if>
                    <xsl:if test="atom[@name='DeaDeaccessionNotes'] = ''">
                        <tr class="atomvalue">
                            <td class="atomvalue" style="color: red; font-weight: bold;">
                                <xsl:text>DEACCESSION NOTES MISSING</xsl:text>
                            </td>
                        </tr>
                    </xsl:if>
                </table>
            </td>
        </tr>        
    </xsl:template>
    
    <xsl:template name="date">
        <xsl:param name="input_date"/>
        <xsl:if test="contains($input_date, '-01-')"><xsl:text>January </xsl:text><xsl:value-of select="substring($input_date,9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring($input_date,1,4)"/>
        </xsl:if>
        <xsl:if test="contains($input_date, '-02-')"><xsl:text>February </xsl:text><xsl:value-of select="substring($input_date,9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring($input_date,1,4)"/>
        </xsl:if>
        <xsl:if test="contains($input_date, '-03-')"><xsl:text>March </xsl:text><xsl:value-of select="substring($input_date,9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring($input_date,1,4)"/>
        </xsl:if>
        <xsl:if test="contains($input_date, '-04-')"><xsl:text>April </xsl:text><xsl:value-of select="substring($input_date,9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring($input_date,1,4)"/>
        </xsl:if>
        <xsl:if test="contains($input_date, '-05-')"><xsl:text>May </xsl:text><xsl:value-of select="substring($input_date,9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring($input_date,1,4)"/>
        </xsl:if>
        <xsl:if test="contains($input_date, '-06-')"><xsl:text>June </xsl:text><xsl:value-of select="substring($input_date,9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring($input_date,1,4)"/>
        </xsl:if>
        <xsl:if test="contains($input_date, '-07-')"><xsl:text>July </xsl:text><xsl:value-of select="substring($input_date,9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring($input_date,1,4)"/>
        </xsl:if>
        <xsl:if test="contains($input_date, '-08-')"><xsl:text>August </xsl:text><xsl:value-of select="substring($input_date,9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring($input_date,1,4)"/>
        </xsl:if>
        <xsl:if test="contains($input_date, '-09-')"><xsl:text>September </xsl:text><xsl:value-of select="substring($input_date,9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring($input_date,1,4)"/>
        </xsl:if>
        <xsl:if test="contains($input_date, '-10-')"><xsl:text>October </xsl:text><xsl:value-of select="substring($input_date,9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring($input_date,1,4)"/>
        </xsl:if>
        <xsl:if test="contains($input_date, '-11-')"><xsl:text>November </xsl:text><xsl:value-of select="substring($input_date,9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring($input_date,1,4)"/>
        </xsl:if>
        <xsl:if test="contains($input_date, '-12-')"><xsl:text>December </xsl:text><xsl:value-of select="substring($input_date,9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring($input_date,1,4)"/>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>