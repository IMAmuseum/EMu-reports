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
table.icon
{
    margin-left:auto; 
    margin-right:auto;
}
img.icon
{
    width: 250px;
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
            <img style="margin: 2px" height="125px" src="https://discovernewfields.org/application/files/2315/3911/5304/NewfieldsLogo_leWitt.jpg"/>
            <br/>
        </center>
        <!-- Original Sort Order
        <xsl:for-each select="table[@name='eaccessionlots']/tuple/table[@name='AccAccessionLotRef']/tuple[contains(atom[@name='TitAccessionNo'], 'TR')]">
            <xsl:sort select="atom[@name='TitAccessionNo']"/>
            <xsl:call-template name="record" />
            <xsl:if test="position() != last()">
                <p />
            </xsl:if>
        </xsl:for-each>
        <xsl:for-each select="table[@name='eaccessionlots']/tuple/table[@name='AccAccessionLotRef']/tuple[not(contains(atom[@name='TitAccessionNo'], 'TR'))]">
            <xsl:sort select="substring-before(atom[@name='TitAccessionNo'], '.')" data-type="number" />
            <xsl:sort select="translate(substring-after(atom[@name='TitAccessionNo'], '.'), '-ABCDEFGHIJKLMNOPQRSTUVWXYZ', '')" data-type="number" />
            <xsl:call-template name="record" />
            <xsl:if test="position() != last()">
                <p />
            </xsl:if>
        </xsl:for-each>
        -->
        <xsl:for-each select="table[@name='eaccessionlots']/tuple/table[@name='AccAccessionLotRef']/tuple[not(starts-with(atom[@name='TitAccessionNo'], 'C')) and not(starts-with(atom[@name='TitAccessionNo'], 'LH')) and not(starts-with(atom[@name='TitAccessionNo'], 'MH')) and not(starts-with(atom[@name='TitAccessionNo'], 'N')) and not(starts-with(atom[@name='TitAccessionNo'], 'S')) and not(starts-with(atom[@name='TitAccessionNo'], 'TR')) and not(starts-with(atom[@name='TitAccessionNo'], 'U')) and not(starts-with(atom[@name='TitAccessionNo'], 'WH'))]">
            <xsl:sort select="substring-before(atom[@name='TitAccessionNo'], '.')" data-type="number"/>
            <xsl:sort select="translate(substring-after(atom[@name='TitAccessionNo'], '.'), '-ABCDEFGHIJKLMNOPQRSTUVWXYZ', '')" data-type="number" />
            <xsl:call-template name="record" />
        </xsl:for-each>
        <xsl:for-each select="table[@name='eaccessionlots']/tuple/table[@name='AccAccessionLotRef']/tuple[starts-with(atom[@name='TitAccessionNo'], 'C')]">
            <xsl:sort select="atom[@name='TitAccessionNo']"/>
            <xsl:call-template name="record" />
        </xsl:for-each>
        <xsl:for-each select="table[@name='eaccessionlots']/tuple/table[@name='AccAccessionLotRef']/tuple[starts-with(atom[@name='TitAccessionNo'], 'LH')]">
            <xsl:sort select="atom[@name='TitAccessionNo']"/>
            <xsl:call-template name="record" />
        </xsl:for-each>
        <xsl:for-each select="table[@name='eaccessionlots']/tuple/table[@name='AccAccessionLotRef']/tuple[starts-with(atom[@name='TitAccessionNo'], 'MH')]">
            <xsl:sort select="atom[@name='TitAccessionNo']"/>
            <xsl:call-template name="record" />
        </xsl:for-each>
        <xsl:for-each select="table[@name='eaccessionlots']/tuple/table[@name='AccAccessionLotRef']/tuple[starts-with(atom[@name='TitAccessionNo'], 'N')]">
            <xsl:sort select="atom[@name='TitAccessionNo']"/>
            <xsl:call-template name="record" />
        </xsl:for-each>
        <xsl:for-each select="table[@name='eaccessionlots']/tuple/table[@name='AccAccessionLotRef']/tuple[starts-with(atom[@name='TitAccessionNo'], 'S')]">
            <xsl:sort select="atom[@name='TitAccessionNo']"/>
            <xsl:call-template name="record" />
        </xsl:for-each>
        <xsl:for-each select="table[@name='eaccessionlots']/tuple/table[@name='AccAccessionLotRef']/tuple[starts-with(atom[@name='TitAccessionNo'], 'TR')]">
            <xsl:sort select="atom[@name='TitAccessionNo']"/>
            <xsl:call-template name="record" />
        </xsl:for-each>
        <xsl:for-each select="table[@name='eaccessionlots']/tuple/table[@name='AccAccessionLotRef']/tuple[starts-with(atom[@name='TitAccessionNo'], 'U')]">
            <xsl:sort select="atom[@name='TitAccessionNo']"/>
            <xsl:call-template name="record" />
        </xsl:for-each>
        <xsl:for-each select="table[@name='eaccessionlots']/tuple/table[@name='AccAccessionLotRef']/tuple[starts-with(atom[@name='TitAccessionNo'], 'WH')]">
            <xsl:sort select="atom[@name='TitAccessionNo']"/>
            <xsl:call-template name="record" />
        </xsl:for-each>
    </xsl:template>
    <!--
            Record template
     -->
    <xsl:template name="record">
        <center>
            <table border="1" class="sheet" style="page-break-after: always">
                    <xsl:call-template name="heading" />
                    <xsl:call-template name="object" />
            </table>
        </center>
    </xsl:template>
    <!--
            Heading template
     -->
    <xsl:template name="heading">
        <tr class="meeting">
            <td class="meeting">
                <center>
                <xsl:text>Collections Committee Meeting</xsl:text>
                    <br/>
                <span style="font-size: 18px"><xsl:if test="contains(ancestor::tuple/atom[@name='AcqMeetingDate'], '-01-')"><xsl:text>January </xsl:text><xsl:value-of select="substring(ancestor::tuple/atom[@name='AcqMeetingDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(ancestor::tuple/atom[@name='AcqMeetingDate'],1,4)"/>
                </xsl:if>
                <xsl:if test="contains(ancestor::tuple/atom[@name='AcqMeetingDate'], '-02-')"><xsl:text>February </xsl:text><xsl:value-of select="substring(ancestor::tuple/atom[@name='AcqMeetingDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(ancestor::tuple/atom[@name='AcqMeetingDate'],1,4)"/>
                </xsl:if>
                <xsl:if test="contains(ancestor::tuple/atom[@name='AcqMeetingDate'], '-03-')"><xsl:text>March </xsl:text><xsl:value-of select="substring(ancestor::tuple/atom[@name='AcqMeetingDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(ancestor::tuple/atom[@name='AcqMeetingDate'],1,4)"/>
                </xsl:if>
                <xsl:if test="contains(ancestor::tuple/atom[@name='AcqMeetingDate'], '-04-')"><xsl:text>April </xsl:text><xsl:value-of select="substring(ancestor::tuple/atom[@name='AcqMeetingDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(ancestor::tuple/atom[@name='AcqMeetingDate'],1,4)"/>
                </xsl:if>
                <xsl:if test="contains(ancestor::tuple/atom[@name='AcqMeetingDate'], '-05-')"><xsl:text>May </xsl:text><xsl:value-of select="substring(ancestor::tuple/atom[@name='AcqMeetingDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(ancestor::tuple/atom[@name='AcqMeetingDate'],1,4)"/>
                </xsl:if>
                <xsl:if test="contains(ancestor::tuple/atom[@name='AcqMeetingDate'], '-06-')"><xsl:text>June </xsl:text><xsl:value-of select="substring(ancestor::tuple/atom[@name='AcqMeetingDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(ancestor::tuple/atom[@name='AcqMeetingDate'],1,4)"/>
                </xsl:if>
                <xsl:if test="contains(ancestor::tuple/atom[@name='AcqMeetingDate'], '-07-')"><xsl:text>July </xsl:text><xsl:value-of select="substring(ancestor::tuple/atom[@name='AcqMeetingDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(ancestor::tuple/atom[@name='AcqMeetingDate'],1,4)"/>
                </xsl:if>
                <xsl:if test="contains(ancestor::tuple/atom[@name='AcqMeetingDate'], '-08-')"><xsl:text>August </xsl:text><xsl:value-of select="substring(ancestor::tuple/atom[@name='AcqMeetingDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(ancestor::tuple/atom[@name='AcqMeetingDate'],1,4)"/>
                </xsl:if>
                <xsl:if test="contains(ancestor::tuple/atom[@name='AcqMeetingDate'], '-09-')"><xsl:text>September </xsl:text><xsl:value-of select="substring(ancestor::tuple/atom[@name='AcqMeetingDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(ancestor::tuple/atom[@name='AcqMeetingDate'],1,4)"/>
                </xsl:if>
                <xsl:if test="contains(ancestor::tuple/atom[@name='AcqMeetingDate'], '-10-')"><xsl:text>October </xsl:text><xsl:value-of select="substring(ancestor::tuple/atom[@name='AcqMeetingDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(ancestor::tuple/atom[@name='AcqMeetingDate'],1,4)"/>
                </xsl:if>
                <xsl:if test="contains(ancestor::tuple/atom[@name='AcqMeetingDate'], '-11-')"><xsl:text>November </xsl:text><xsl:value-of select="substring(ancestor::tuple/atom[@name='AcqMeetingDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(ancestor::tuple/atom[@name='AcqMeetingDate'],1,4)"/>
                </xsl:if>
                <xsl:if test="contains(ancestor::tuple/atom[@name='AcqMeetingDate'], '-12-')"><xsl:text>December </xsl:text><xsl:value-of select="substring(ancestor::tuple/atom[@name='AcqMeetingDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(ancestor::tuple/atom[@name='AcqMeetingDate'],1,4)"/>
                </xsl:if>
                </span>
                </center>
            </td>
        </tr>
        <tr class="heading">
            <td class="heading">
                <xsl:choose>
                    <xsl:when test="ancestor::tuple/table[@name='AccAccessionLotRef']/tuple[2] or ancestor::table[@name='eaccessionlots']/tuple[2]">
                        <b><span style="text-decoration: underline;">Purchases for the <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '901.1-European')">European Painting and Sculpture 1800-1945</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '901.2-American')">American Painting and Sculpture 1800-1945</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '902.1-European')">European Painting and Sculpture Before 1800</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '903.1-Decorative')">Decorative Arts</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '903.2-Design')">Design Arts</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '904.1-Prints')">Prints, Drawings, and Photographs</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '904.2-Classical')">Classical Art</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '905.1-Asian')">Asian Art (Chinese and Other Asian)</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '905.2-Asian')">Asian Art (Japanese and Korean)</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '906.1-African')">African Art</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '906.2-Native')">Native American and Pre-Columbian</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '906-Africa')">Africa, the South Pacific, and the Americas</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '907-Contemporary')">Contemporary Art</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '908-Textile')">Textile and Fashion Arts</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '913-Conservation')">Conservation</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '916.1-Registration')">Registration (Unknown Objects)</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '916.2-Registration')">Registration (Cancelled Objects)</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '916.4-Registration')">Registration (Returned Loans)</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '916-Registration')">Registration</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '918-Education')">Education</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '979-Westerley')">Westerley Estate</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '981-Lilly')">Lilly House</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '982-Miller')">Miller House</xsl:if> Department</span></b>
                        <br/>
                    </xsl:when>
                    <xsl:otherwise>
                        <b><span style="text-decoration: underline;">Purchase for the <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '901.1-European')">European Painting and Sculpture 1800-1945</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '901.2-American')">American Painting and Sculpture 1800-1945</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '902.1-European')">European Painting and Sculpture Before 1800</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '903.1-Decorative')">Decorative Arts</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '903.2-Design')">Design Arts</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '904.1-Prints')">Prints, Drawings, and Photographs</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '904.2-Classical')">Classical Art</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '905.1-Asian')">Asian Art (Chinese and Other Asian)</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '905.2-Asian')">Asian Art (Japanese and Korean)</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '906.1-African')">African Art</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '906.2-Native')">Native American and Pre-Columbian</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '906-Africa')">Africa, the South Pacific, and the Americas</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '907-Contemporary')">Contemporary Art</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '908-Textile')">Textile and Fashion Arts</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '913-Conservation')">Conservation</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '916.1-Registration')">Registration (Unknown Objects)</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '916.2-Registration')">Registration (Cancelled Objects)</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '916.4-Registration')">Registration (Returned Loans)</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '916-Registration')">Registration</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '918-Education')">Education</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '979-Westerley')">Westerley Estate</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '981-Lilly')">Lilly House</xsl:if>
                            <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '982-Miller')">Miller House</xsl:if> Department</span></b>
                        <br/>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:text>Total Proposed Draw on IMA Funds: $</xsl:text><xsl:value-of select="format-number(sum(ancestor::table[@name='eaccessionlots']/tuple/table[@name='AccAccessionLotRef']/tuple/atom[@name='ValValuationAmount'][number(.)=number(.)]), '###,###,###,###,###.00')"/>
            </td>
        </tr>
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
                                                <xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''"><xsl:value-of select="atom[@name='NamFullName']"/></xsl:when><xsl:otherwise><xsl:value-of select="atom[@name='NamOrganisation']"/></xsl:otherwise></xsl:choose>
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
                                <xsl:if test="atom[@name='CreCountry_tab'] != '' or atom[@name='CreState_tab'] != '' or atom[@name='CreCity_tab'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b>Creation Location: </b><xsl:if test="atom[@name='CreCity_tab'] != ''"><xsl:value-of select="atom[@name='CreCity_tab']"/><xsl:text>, </xsl:text></xsl:if><xsl:if test="atom[@name='CreState_tab'] != ''"><xsl:value-of select="atom[@name='CreState_tab']"/><xsl:text>, </xsl:text></xsl:if><xsl:if test="atom[@name='CreCountry_tab'] != ''"><xsl:value-of select="atom[@name='CreCountry_tab']"/></xsl:if>
                                        </td>
                                    </tr>
                                </xsl:if>
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
                                <xsl:if test="atom[@name='PhyMediumAndSupport'] != ''">
                                <tr class="atomvalue">
                                    <td class="atomvalue">
                                        <b>Medium and Support: </b><xsl:value-of select="atom[@name='PhyMediumAndSupport']"/>
                                    </td>
                                </tr>
                                </xsl:if>
                                <xsl:choose>
                                <xsl:when test="atom[@name='PhyConvertedDims'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b>Dimensions: </b><xsl:value-of select="atom[@name='PhyConvertedDims']"/>
                                        </td>
                                    </tr>
                                    <xsl:if test="atom[@name='PhyDimensionNotes_tab'] != ''">
                                        <tr class="atomvalue">
                                            <td class="atomvalue">
                                                <xsl:value-of select="atom[@name='PhyDimensionNotes_tab']"/>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:if test="atom[@name='PhyDimensionNotes_tab'] != ''">
                                        <tr class="atomvalue">
                                            <td class="atomvalue">
                                                <b>Dimensions: </b><xsl:value-of select="atom[@name='PhyDimensionNotes_tab']"/>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                </xsl:otherwise>
                                </xsl:choose>
                                <xsl:if test="atom[@name='CrePrimaryInscriptions'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b>Mark Description: </b><xsl:value-of select="atom[@name='CrePrimaryInscriptions']" />
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
                                <xsl:if test="atom[@name='StaStocktakeStatus'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b>Collection Ranking: </b><xsl:value-of select="atom[@name='StaStocktakeStatus']" />
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:choose>
                                <xsl:when test="atom[@name='ValReasonForValuation'] != '' and atom[@name='ValValuationAmount'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b><xsl:value-of select="atom[@name='ValReasonForValuation']"/></b><xsl:text>: $</xsl:text><xsl:value-of select="format-number(atom[@name='ValValuationAmount'], '###,###,###,###,###.00')"/>
                                        </td>
                                    </tr>
                                </xsl:when>
                                <xsl:when test="atom[@name='ValReasonForValuation'] = '' and atom[@name='ValValuationAmount'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b>Valuation:</b><xsl:text> $</xsl:text><xsl:value-of select="format-number(atom[@name='ValValuationAmount'], '###,###,###,###,###.00')"/>
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
                                <xsl:if test="atom[@name='ValValuationNotes'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b>Valuation Notes: </b><xsl:value-of select="atom[@name='ValValuationNotes']" />
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
                                <xsl:choose>
                                    <xsl:when test="ancestor::tuple/table[@name='Source']/tuple/atom[@name='NamFullName'] != ''">
                                        <tr class="atomvalue">
                                            <td class="atomvalue">
                                                <b>Source: </b><xsl:value-of select="ancestor::tuple/table[@name='Source']/tuple/atom[@name='NamFullName']"/><br/><xsl:if test="ancestor::tuple/table[@name='Source']/tuple/atom[@name='AddPostStreet'] != ''"><xsl:value-of select="ancestor::tuple/table[@name='Source']/tuple/atom[@name='AddPostStreet']"/><br/></xsl:if><xsl:if test="ancestor::tuple/table[@name='Source']/tuple/atom[@name='AddPostCity'] != ''"><xsl:value-of select="ancestor::tuple/table[@name='Source']/tuple/atom[@name='AddPostCity']"/></xsl:if><xsl:if test="ancestor::tuple/table[@name='Source']/tuple/atom[@name='AddPostState'] != ''"><xsl:text>, </xsl:text><xsl:value-of select="ancestor::tuple/table[@name='Source']/tuple/atom[@name='AddPostState']"/></xsl:if><xsl:if test="ancestor::tuple/table[@name='Source']/tuple/atom[@name='AddPostPost'] != ''"><xsl:text> </xsl:text><xsl:value-of select="ancestor::tuple/table[@name='Source']/tuple/atom[@name='AddPostPost']"/></xsl:if>
                                            </td>
                                        </tr>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <tr class="atomvalue">
                                            <td class="atomvalue">
                                                <b>Source: </b><xsl:value-of select="ancestor::tuple/table[@name='Source']/tuple/atom[@name='NamOrganisation']"/><br/><xsl:if test="ancestor::tuple/table[@name='Source']/tuple/atom[@name='AddPostStreet'] != ''"><xsl:value-of select="ancestor::tuple/table[@name='Source']/tuple/atom[@name='AddPostStreet']"/><br/></xsl:if><xsl:if test="ancestor::tuple/table[@name='Source']/tuple/atom[@name='AddPostCity'] != ''"><xsl:value-of select="ancestor::tuple/table[@name='Source']/tuple/atom[@name='AddPostCity']"/></xsl:if><xsl:if test="ancestor::tuple/table[@name='Source']/tuple/atom[@name='AddPostState'] != ''"><xsl:text>, </xsl:text><xsl:value-of select="ancestor::tuple/table[@name='Source']/tuple/atom[@name='AddPostState']"/></xsl:if><xsl:if test="ancestor::tuple/table[@name='Source']/tuple/atom[@name='AddPostPost'] != ''"><xsl:text> </xsl:text><xsl:value-of select="ancestor::tuple/table[@name='Source']/tuple/atom[@name='AddPostPost']"/></xsl:if>
                                            </td>
                                        </tr>
                                    </xsl:otherwise>
                                </xsl:choose> 
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