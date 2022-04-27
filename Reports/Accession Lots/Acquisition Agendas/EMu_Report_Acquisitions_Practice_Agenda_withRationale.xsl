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
textarea.date
{
    font-family: Tahoma;
    font-weight: bold;
    text-align: center;
    font-size: 14px;
    margin-top: 2px;
    margin-bottom: 3px;
    border: none;
    resize: none;
}
tr.image
{
    page-break-inside: avoid;
    border-color: white;
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
    height: 250px;
}
td.icon
{
    width: 0px;
}
table.data
{
    width: 100%;
}
table.box
{
    width: 65%;
    margin: 2px;
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
td.atomvalue1
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
            <img style="margin-top: 5px; margin-bottom: 10px;" height="75px" src="https://discovernewfields.org/application/files/2515/3608/3665/logo-ima-large.png"/>
            <br/>
        </center>
        <!--Original Sort Order -->
        <xsl:for-each select="table[@name='eaccessionlots']/tuple/table[@name='AccAccessionLotRef']/tuple[not(starts-with(atom[@name='TitAccessionNo'], 'C')) and not(starts-with(atom[@name='TitAccessionNo'], 'LH')) and not(starts-with(atom[@name='TitAccessionNo'], 'MH')) and not(starts-with(atom[@name='TitAccessionNo'], 'N')) and not(starts-with(atom[@name='TitAccessionNo'], 'S')) and not(starts-with(atom[@name='TitAccessionNo'], 'TR')) and not(starts-with(atom[@name='TitAccessionNo'], 'U')) and not(starts-with(atom[@name='TitAccessionNo'], 'WH'))]">
            <xsl:sort select="substring-before(atom[@name='TitAccessionNo'], '.')" data-type="number"/>
            <xsl:sort select="translate(substring-after(atom[@name='TitAccessionNo'], '.'), '-ABCDEFGHIJKLMNOPQRSTUVWXYZ', '')" data-type="number" />
            <xsl:choose>
                <xsl:when test="position() = 1">
                    <xsl:call-template name="record-1"/>
                    <p />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="record-2" />
                    <xsl:if test="position() != last()">
                        <p />
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        <xsl:for-each select="table[@name='eaccessionlots']/tuple/table[@name='AccAccessionLotRef']/tuple[starts-with(atom[@name='TitAccessionNo'], 'C')]">
            <xsl:sort select="atom[@name='TitAccessionNo']"/>
            <xsl:choose>
                <xsl:when test="position() = 1">
                    <xsl:call-template name="record-1"/>
                    <p />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="record-2" />
                    <xsl:if test="position() != last()">
                        <p />
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        <xsl:for-each select="table[@name='eaccessionlots']/tuple/table[@name='AccAccessionLotRef']/tuple[starts-with(atom[@name='TitAccessionNo'], 'LH')]">
            <xsl:sort select="atom[@name='TitAccessionNo']"/>
            <xsl:choose>
                <xsl:when test="position() = 1">
                    <xsl:call-template name="record-1"/>
                    <p />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="record-2" />
                    <xsl:if test="position() != last()">
                        <p />
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        <xsl:for-each select="table[@name='eaccessionlots']/tuple/table[@name='AccAccessionLotRef']/tuple[starts-with(atom[@name='TitAccessionNo'], 'MH')]">
            <xsl:sort select="atom[@name='TitAccessionNo']"/>
            <xsl:choose>
                <xsl:when test="position() = 1">
                    <xsl:call-template name="record-1"/>
                    <p />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="record-2" />
                    <xsl:if test="position() != last()">
                        <p />
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        <xsl:for-each select="table[@name='eaccessionlots']/tuple/table[@name='AccAccessionLotRef']/tuple[starts-with(atom[@name='TitAccessionNo'], 'N')]">
            <xsl:sort select="atom[@name='TitAccessionNo']"/>
            <xsl:choose>
                <xsl:when test="position() = 1">
                    <xsl:call-template name="record-1"/>
                    <p />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="record-2" />
                    <xsl:if test="position() != last()">
                        <p />
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        <xsl:for-each select="table[@name='eaccessionlots']/tuple/table[@name='AccAccessionLotRef']/tuple[starts-with(atom[@name='TitAccessionNo'], 'S')]">
            <xsl:sort select="atom[@name='TitAccessionNo']"/>
            <xsl:choose>
                <xsl:when test="position() = 1">
                    <xsl:call-template name="record-1"/>
                    <p />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="record-2" />
                    <xsl:if test="position() != last()">
                        <p />
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        <xsl:for-each select="table[@name='eaccessionlots']/tuple/table[@name='AccAccessionLotRef']/tuple[starts-with(atom[@name='TitAccessionNo'], 'TR')]">
            <xsl:sort select="substring-before(atom[@name='TitAccessionNo'], '/')" data-type="text"/>
            <xsl:sort select="translate(substring-after(atom[@name='TitAccessionNo'], '/'), '-ABCDEFGHIJKLMNOPQRSTUVWXYZ', '')" data-type="number" />
            <xsl:choose>
                <xsl:when test="position() = 1">
                    <xsl:call-template name="record-1"/>
                    <p />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="record-2" />
                    <xsl:if test="position() != last()">
                        <p />
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        <xsl:for-each select="table[@name='eaccessionlots']/tuple/table[@name='AccAccessionLotRef']/tuple[starts-with(atom[@name='TitAccessionNo'], 'U')]">
            <xsl:sort select="atom[@name='TitAccessionNo']"/>
            <xsl:choose>
                <xsl:when test="position() = 1">
                    <xsl:call-template name="record-1"/>
                    <p />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="record-2" />
                    <xsl:if test="position() != last()">
                        <p />
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        <xsl:for-each select="table[@name='eaccessionlots']/tuple/table[@name='AccAccessionLotRef']/tuple[starts-with(atom[@name='TitAccessionNo'], 'WH')]">
            <xsl:sort select="atom[@name='TitAccessionNo']"/>
            <xsl:choose>
                <xsl:when test="position() = 1">
                    <xsl:call-template name="record-1"/>
                    <p />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="record-2" />
                    <xsl:if test="position() != last()">
                        <p />
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        <!-- No Sort Order
        <xsl:for-each select="table[@name='eaccessionlots']/tuple/table[@name='AccAccessionLotRef']/tuple">
            <xsl:choose>
                <xsl:when test="position() = 1">
                    <xsl:call-template name="record-1"/>
                    <p />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="record-2" />
                    <xsl:if test="position() != last()">
                        <p />
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="position() != last()">
                <p />
            </xsl:if>
        </xsl:for-each>
        -->
    </xsl:template>
    <!--
            Record 1 template
     -->
    <xsl:template name="record-1">
        <center>
            <table border="1" class="sheet" style="page-break-after: always">
                    <xsl:call-template name="heading" />
                    <xsl:call-template name="object" />
            </table>
        </center>
    </xsl:template>
    <!--
            Record 2 template
     -->
    <xsl:template name="record-2">
        <center>
            <table border="1" class="sheet" style="page-break-after: always">
                <xsl:call-template name="alt-heading" />
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
                    <span style="font-family: Tahoma; font-weight: bold; font-size: 16px;">Art Committee Practice Meeting</span>
                    <br/>
                    <textarea class="date" rows="1" cols="50">Enter meeting date.</textarea>
                    <br/>
                </center>
            </td>
        </tr>
        <tr class="heading">
            <td class="heading">
                <xsl:if test="ancestor::table[@name='eaccessionlots']/tuple/atom[@name='AcqAcquisitionMethod'] = 'Acquisition - Purchase'">
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
                </xsl:if>
                <xsl:if test="ancestor::tuple/atom[@name='AcqAcquisitionMethod'] = 'Acquisition - Gift'">
                    <xsl:choose>
                        <xsl:when test="ancestor::tuple/table[@name='AccAccessionLotRef']/tuple[2] or ancestor::table[@name='eaccessionlots']/tuple[2]">
                            <b><span style="text-decoration: underline;">Gifts for the <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '901.1-European')">European Painting and Sculpture 1800-1945</xsl:if>
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
                            <b><span style="text-decoration: underline;">Gift for the <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '901.1-European')">European Painting and Sculpture 1800-1945</xsl:if>
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
                    <xsl:text>Total Value of Gifts: $</xsl:text><xsl:value-of select="format-number(sum(ancestor::table[@name='eaccessionlots']/tuple/table[@name='AccAccessionLotRef']/tuple/atom[@name='ValValuationAmount'][number(.)=number(.)]), '###,###,###,###,###.00')"/>
                </xsl:if>
            </td>
        </tr>
    </xsl:template>
    <!--
            Alt Heading template
     -->
    <xsl:template name="alt-heading">
        <tr class="meeting">
            <td class="meeting">
                <center>
                    <span style="font-family: Tahoma; font-weight: bold; font-size: 16px;">Art Committee Practice Meeting</span>
                    <br/>
                </center>
            </td>
        </tr>
        <tr class="heading">
            <td class="heading">
                <xsl:if test="ancestor::table[@name='eaccessionlots']/tuple/atom[@name='AcqAcquisitionMethod'] = 'Acquisition - Purchase'">
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
                </xsl:if>
                <xsl:if test="ancestor::tuple/atom[@name='AcqAcquisitionMethod'] = 'Acquisition - Gift'">
                    <xsl:choose>
                        <xsl:when test="ancestor::tuple/table[@name='AccAccessionLotRef']/tuple[2] or ancestor::table[@name='eaccessionlots']/tuple[2]">
                            <b><span style="text-decoration: underline;">Gifts for the <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '901.1-European')">European Painting and Sculpture 1800-1945</xsl:if>
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
                            <b><span style="text-decoration: underline;">Gift for the <xsl:if test="starts-with(ancestor::tuple/atom[@name='LotDepartment'], '901.1-European')">European Painting and Sculpture 1800-1945</xsl:if>
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
                </xsl:if>
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
                            <table style="width:250px;" border="2" class="box" id="datatable">
                                <tr class="atomvalue1">
                                    <td class="atomvalue1" style="font-weight: bold; text-decoration: underline;">
                                        Acquisition Paperwork Status:
                                    </td>
                                </tr>
                                <tr class="atomvalue1">
                                    <td class="atomvalue1">
                                        Signed TR Received: <xsl:if test="ancestor::tuple/atom[@name='AcqTrReceived'] = 'Yes'"><b>Yes</b></xsl:if><xsl:if test="ancestor::tuple/atom[@name='AcqTrReceived'] = 'No'"><b>No</b></xsl:if>
                                    </td>
                                </tr>
                                <tr class="atomvalue1">
                                    <td class="atomvalue1">
                                        Acquisition Proposal Form Received: <xsl:if test="ancestor::tuple/atom[@name='AcqAcquisitionProposalForm'] = 'Yes'"><b>Yes</b></xsl:if><xsl:if test="ancestor::tuple/atom[@name='AcqAcquisitionProposalForm'] = 'No'"><b>No</b></xsl:if>
                                    </td>
                                </tr>
                                <tr class="atomvalue1">
                                    <td class="atomvalue1">
                                        Conservation Report Received: <xsl:if test="ancestor::tuple/atom[@name='AcqConservationReportCompleted'] = 'Yes'"><b>Yes</b></xsl:if><xsl:if test="ancestor::tuple/atom[@name='AcqConservationReportCompleted'] = 'No'"><b>No</b></xsl:if>
                                    </td>
                                </tr>
                                <tr class="atomvalue1">
                                    <td class="atomvalue1">
                                        Deed of Gift Received: <xsl:if test="ancestor::tuple/atom[@name='AcqDeedOfGift'] = 'Yes'"><b>Yes</b></xsl:if><xsl:if test="ancestor::tuple/atom[@name='AcqDeedOfGift'] = 'No'"><b>No</b></xsl:if><xsl:if test="ancestor::tuple/atom[@name='AcqDeedOfGift'] = 'Not Applicable'"><b>N/A</b></xsl:if>
                                    </td>
                                </tr>
                                <tr class="atomvalue1">
                                    <td class="atomvalue1">
                                        Bill of Sale Received: <xsl:if test="ancestor::tuple/atom[@name='AcqBillOfSale'] = 'Yes'"><b>Yes</b></xsl:if><xsl:if test="ancestor::tuple/atom[@name='AcqBillOfSale'] = 'No'"><b>No</b></xsl:if><xsl:if test="ancestor::tuple/atom[@name='AcqBillOfSale'] = 'Not Applicable'"><b>N/A</b></xsl:if>
                                    </td>
                                </tr>
                                <tr class="atomvalue1">
                                    <td class="atomvalue1">
                                        Invoice Received: <xsl:if test="ancestor::tuple/atom[@name='AcqInvoice'] = 'Yes'"><b>Yes</b></xsl:if><xsl:if test="ancestor::tuple/atom[@name='AcqInvoice'] = 'No'"><b>No</b></xsl:if><xsl:if test="ancestor::tuple/atom[@name='AcqInvoice'] = 'Not Applicable'"><b>N/A</b></xsl:if>
                                    </td>
                                </tr>
                            </table>
                            <table style="width:250px;" border="2" class="box" id="datatable">
                                <tr class="atomvalue1">
                                    <td class="atomvalue1" style="font-weight: bold; text-decoration: underline;">
                                        Art Loss Registry Search:
                                    </td>
                                </tr>
                                <tr class="atomvalue1">
                                    <td class="atomvalue1">
                                        ALR Search Sumbitted? <xsl:choose><xsl:when test="contains(atom[@name='AlrDescription_tab'], 'Search Submitted')"><b>Yes</b></xsl:when><xsl:otherwise><b>No</b></xsl:otherwise></xsl:choose>
                                    </td>
                                </tr>
                                <tr class="atomvalue1">
                                    <td class="atomvalue1">
                                        ALR Search Clear? <xsl:choose><xsl:when test="contains(atom[@name='AlrStatus_tab'], 'Complete')"><b>Yes</b></xsl:when><xsl:otherwise><b>No</b></xsl:otherwise></xsl:choose>
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
        <tr class="image">
            <td class="image">
                <table class="picture">
                    <tr class="picture">
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
                                <xsl:for-each select="ancestor::tuple/table[@name='Source']/tuple">
                                    <xsl:choose>
                                        <xsl:when test="atom[@name='NamFullName'] != ''">
                                            <tr class="atomvalue">
                                                <td class="atomvalue">
                                                    <b>Source: </b><xsl:value-of select="atom[@name='NamFullName']"/><br/>
                                                    <xsl:if test="atom[@name='AddPostStreet'] != ''"><xsl:value-of select="atom[@name='AddPostStreet']"/><br/>
                                                    </xsl:if><xsl:if test="atom[@name='AddPostCity'] != ''"><xsl:value-of select="atom[@name='AddPostCity']"/></xsl:if><xsl:if test="atom[@name='AddPostState'] != ''"><xsl:text>, </xsl:text><xsl:value-of select="atom[@name='AddPostState']"/></xsl:if><xsl:if test="atom[@name='AddPostPost'] != ''"><xsl:text> </xsl:text><xsl:value-of select="atom[@name='AddPostPost']"/></xsl:if>
                                                </td>
                                            </tr>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <tr class="atomvalue">
                                                <td class="atomvalue">
                                                    <b>Source: </b><xsl:value-of select="atom[@name='NamOrganisation']"/><br/>
                                                    <xsl:if test="atom[@name='AddPostStreet'] != ''"><xsl:value-of select="atom[@name='AddPostStreet']"/><br/>
                                                    </xsl:if><xsl:if test="atom[@name='AddPostCity'] != ''"><xsl:value-of select="atom[@name='AddPostCity']"/></xsl:if><xsl:if test="atom[@name='AddPostState'] != ''"><xsl:text>, </xsl:text><xsl:value-of select="atom[@name='AddPostState']"/></xsl:if><xsl:if test="atom[@name='AddPostPost'] != ''"><xsl:text> </xsl:text><xsl:value-of select="atom[@name='AddPostPost']"/></xsl:if>
                                                </td>
                                            </tr>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:for-each>
                                <xsl:if test="atom[@name='NotCuratorAcquisitionRationale'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b>Acquisition Rationale: </b><xsl:value-of select="atom[@name='NotCuratorAcquisitionRationale']" />
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