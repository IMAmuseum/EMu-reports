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
    font-size: 16px;
    border: none;
    resize: none;
}
textarea.date
{
    font-family: Tahoma;
    font-weight: bold;
    text-align: center;
    font-size: 14px;
    margin-top: 2px;
    margin-bottom: 10px;
    border: none;
    resize: none;
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
            <p>
                <xsl:if test="starts-with(table[@name='eaccessionlots']/tuple[1]/atom[@name='LotDepartment'], '901.1-European')">Deaccessions: European Painting and Sculpture 1800-1945</xsl:if>
                <xsl:if test="starts-with(table[@name='eaccessionlots']/tuple[1]/atom[@name='LotDepartment'], '901.2-American')">Deaccessions: American Painting and Sculpture 1800-1945</xsl:if>
                <xsl:if test="starts-with(table[@name='eaccessionlots']/tuple[1]/atom[@name='LotDepartment'], '902.1-European')">Deaccessions: European Painting and Sculpture Before 1800</xsl:if>
                <xsl:if test="starts-with(table[@name='eaccessionlots']/tuple[1]/atom[@name='LotDepartment'], '903.1-Decorative')">Deaccessions: Decorative Arts</xsl:if>
                <xsl:if test="starts-with(table[@name='eaccessionlots']/tuple[1]/atom[@name='LotDepartment'], '903.2-Design')">Deaccessions: Design Arts</xsl:if>
                <xsl:if test="starts-with(table[@name='eaccessionlots']/tuple[1]/atom[@name='LotDepartment'], '904.1-Prints')">Deaccessions: Prints, Drawings, and Photographs</xsl:if>
                <xsl:if test="starts-with(table[@name='eaccessionlots']/tuple[1]/atom[@name='LotDepartment'], '904.2-Classical')">Deaccessions: Classical Art</xsl:if>
                <xsl:if test="starts-with(table[@name='eaccessionlots']/tuple[1]/atom[@name='LotDepartment'], '905.1-Asian')">Deaccessions: Asian Art (Chinese and Other Asian)</xsl:if>
                <xsl:if test="starts-with(table[@name='eaccessionlots']/tuple[1]/atom[@name='LotDepartment'], '905.2-Asian')">Deaccessions: Asian Art (Japanese and Korean)</xsl:if>
                <xsl:if test="starts-with(table[@name='eaccessionlots']/tuple[1]/atom[@name='LotDepartment'], '906.1-African')">Deaccessions: African Art</xsl:if>
                <xsl:if test="starts-with(table[@name='eaccessionlots']/tuple[1]/atom[@name='LotDepartment'], '906.2-Native')">Deaccessions: Native American and Pre-Columbian</xsl:if>
                <xsl:if test="starts-with(table[@name='eaccessionlots']/tuple[1]/atom[@name='LotDepartment'], '906-Africa')">Deaccessions: Africa, the South Pacific, and the Americas</xsl:if>
                <xsl:if test="starts-with(table[@name='eaccessionlots']/tuple[1]/atom[@name='LotDepartment'], '907-Contemporary')">Deaccessions: Contemporary Art</xsl:if>
                <xsl:if test="starts-with(table[@name='eaccessionlots']/tuple[1]/atom[@name='LotDepartment'], '908-Textile')">Deaccessions: Textile and Fashion Arts</xsl:if>
                <xsl:if test="starts-with(table[@name='eaccessionlots']/tuple[1]/atom[@name='LotDepartment'], '913-Conservation')">Deaccessions: Conservation</xsl:if>
                <xsl:if test="starts-with(table[@name='eaccessionlots']/tuple[1]/atom[@name='LotDepartment'], '916.1-Registration')">Deaccessions: Registration (Unknown Objects)</xsl:if>
                <xsl:if test="starts-with(table[@name='eaccessionlots']/tuple[1]/atom[@name='LotDepartment'], '916.2-Registration')">Deaccessions: Registration (Cancelled Objects)</xsl:if>
                <xsl:if test="starts-with(table[@name='eaccessionlots']/tuple[1]/atom[@name='LotDepartment'], '916.4-Registration')">Deaccessions: Registration (Returned Loans)</xsl:if>
                <xsl:if test="starts-with(table[@name='eaccessionlots']/tuple[1]/atom[@name='LotDepartment'], '916-Registration')">Deaccessions: Registration</xsl:if>
                <xsl:if test="starts-with(table[@name='eaccessionlots']/tuple[1]/atom[@name='LotDepartment'], '918-Education')">Deaccessions: Education</xsl:if>
                <xsl:if test="starts-with(table[@name='eaccessionlots']/tuple[1]/atom[@name='LotDepartment'], '979-Westerley')">Deaccessions: Westerley Estate</xsl:if>
                <xsl:if test="starts-with(table[@name='eaccessionlots']/tuple[1]/atom[@name='LotDepartment'], '981-Lilly')">Deaccessions: Lilly House</xsl:if>
                <xsl:if test="starts-with(table[@name='eaccessionlots']/tuple[1]/atom[@name='LotDepartment'], '982-Miller')">Deaccessions: Miller House</xsl:if>
            </p>
                <textarea class="meeting" rows="1" cols="50">Enter meeting name.</textarea>
            <br/>
                <textarea class="date" rows="1" cols="50">Enter meeting date.</textarea>
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
                <xsl:call-template name="heading" />
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
            Heading template
     -->
    <xsl:template name="heading">
        <tr class="heading">
            <td class="heading">
                <xsl:text>Total Estimated Value of Deaccessions = $</xsl:text><xsl:value-of select="format-number(sum(//atom[@name='ValValuationAmount'][number(.)=number(.)]), '###,###,###,###,###.00')"/>
            </td>
        </tr>
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
                                <tr class="atomvalue">
                                    <td class="atomvalue" style="font-weight: bold">
                                        <xsl:if test="table[@name='Culture']">
                                            <xsl:for-each select="table[@name='Culture']/tuple">
                                                <xsl:if test="atom[@name='CreCreatorAttribution']">
                                                    <xsl:value-of select="atom[@name='CreCreatorAttribution']"/><xsl:text> </xsl:text></xsl:if>
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
                                            <xsl:if test="position() != last()">
                                                <br/>
                                            </xsl:if>
                                            </xsl:for-each>
                                        </xsl:if>
                                        <xsl:choose>
                                            <xsl:when test="table[@name='Creator']">
                                                <xsl:if test="table[@name='Culture']"><br/></xsl:if>
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
                                            <xsl:if test="table[@name='Culture']"><br/></xsl:if>
                                            <xsl:value-of select="table[@name='CreCountry_tab']/tuple[1]/atom[@name='CreCountry']"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    </td>
                                </tr>
                                <xsl:if test="atom[@name='TitMainTitle'] != ''">
                                <tr class="atomvalue">
                                    <td class="atomvalue" style="font-style: italic">
                                        <xsl:value-of select="atom[@name='TitMainTitle']"/>
                                    </td>
                                </tr>
                                </xsl:if>
                                <xsl:if test="atom[@name='CreDateCreated'] != ''">
                                <tr class="atomvalue">
                                    <td class="atomvalue">
                                        <xsl:value-of select="atom[@name='CreDateCreated']"/>
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
                                <tr class="atomvalue">
                                    <td class="atomvalue">
                                        <xsl:value-of select="atom[@name='TitAccessionNo']"/>
                                    </td>
                                </tr>
                                <!--Old Logic for Valuation Notes
                                <xsl:choose>
                                <xsl:when test="atom[@name='ValReasonForValuation'] != '' and atom[@name='ValValuationAmount'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <xsl:value-of select="atom[@name='ValReasonForValuation']"/><xsl:text>: $</xsl:text><xsl:value-of select="atom[@name='ValValuationAmount']"/><xsl:if test="contains(atom[@name='ValValuationNotes'], 'for set')"><xsl:text> - Notes: </xsl:text><xsl:value-of select="atom[@name='ValValuationNotes']"/></xsl:if>
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
                                -->
                                <xsl:choose>
                                    <xsl:when test="atom[@name='ValReasonForValuation'] != '' and atom[@name='ValValuationAmount'] != '' and atom[@name='ValValuationNotes'] != ''">
                                        <tr class="atomvalue">
                                            <td class="atomvalue">
                                                <xsl:value-of select="atom[@name='ValReasonForValuation']"/><xsl:text>: $</xsl:text><xsl:value-of select="format-number(atom[@name='ValValuationAmount'], '###,###,###,###,###.00')"/><xsl:text> - Notes: </xsl:text><xsl:value-of select="atom[@name='ValValuationNotes']"/>
                                            </td>
                                        </tr>
                                    </xsl:when>
                                    <xsl:when test="atom[@name='ValReasonForValuation'] != '' and atom[@name='ValValuationAmount'] != '' and atom[@name='ValValuationNotes'] = ''">
                                        <tr class="atomvalue">
                                            <td class="atomvalue">
                                                <xsl:value-of select="atom[@name='ValReasonForValuation']"/><xsl:text>: $</xsl:text><xsl:value-of select="format-number(atom[@name='ValValuationAmount'], '###,###,###,###,###.00')"/>
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
                                            <xsl:value-of select="atom[@name='SumCreditLine']" />
                                        </td>
                                    </tr>
                                </xsl:if>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>        
    </xsl:template>
</xsl:stylesheet>