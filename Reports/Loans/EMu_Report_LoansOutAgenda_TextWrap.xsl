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
    margin-bottom: 0px;
}
table.icon
{
    margin-left:auto; 
    margin-right:auto;
}
img.icon
{
    max-width: 200px;
    max-height: 200px;
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
textarea.date
{
    font-family: Tahoma;
    font-weight: bold;
    text-align: center;
    font-size: 14px;
    margin-top: 2px;
    border: none;
    resize: none;
}
textarea.meeting
{
    font-family: Tahoma;
    font-weight: bold;
    text-align: center;
    font-size: 22px;
    font-weight: normal;
    margin-top: 2px;
    margin-bottom: 5px;
    border: none;
    resize: none;
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
        <xsl:for-each select="/table[@name='eloans']/tuple">
            <xsl:sort select="substring-before(atom[@name='InfLoanNumber'], '.')" />
            <xsl:sort select="substring-after(atom[@name='InfLoanNumber'], '.') " data-type="number" />
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
            <table border="1" class="sheet" style="page-break-after: always">
                <xsl:call-template name="heading" />
                <xsl:call-template name="venues" />
                <xsl:for-each select="table[@name='ObjObjectsLoanedRef_tab']/tuple">
                <xsl:call-template name="object" />
                </xsl:for-each>
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
                    <textarea class="meeting" rows="1" cols="50">Enter meeting name.</textarea>
                    <br/>
                    <textarea class="date" rows="1" cols="50">Enter meeting date.</textarea>
                    <br/>
                </center>
            </td>
        </tr>
        <tr class="heading">
            <td class="heading">
                <b><span style="text-decoration: underline;"><xsl:value-of select="atom[@name='InfLoanPurpose']"/></span><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='InfLoanNumber']"/><xsl:text>)</xsl:text></b>
            </td>
        </tr>
    </xsl:template>
    <!--
            Venues template
    -->
    <xsl:template name="venues">
        <xsl:for-each select="table[@name='Venues']/tuple">
            <xsl:choose>
                <xsl:when test="atom[@name='NamOrganisation'] != 'To Be Determined'">
                    <tr class="atomvalue">
                        <td class="atomvalue" style="white-space: nowrap">
                            <b><span style="text-decoration: underline;"><xsl:value-of select="atom[@name='NamOrganisation']"/></span></b><br/>
                            <xsl:if test="atom[@name='AddPostCity'] != ''">
                                <xsl:value-of select="atom[@name='AddPostCity']" /><xsl:text>, </xsl:text>
                            </xsl:if>
                            <xsl:if test="atom[@name='AddPostState'] != ''">
                                <xsl:value-of select="atom[@name='AddPostState']"/></xsl:if>
                            <xsl:if test="atom[@name='AddPostCountry'] != ''"><xsl:text> </xsl:text><xsl:value-of select="atom[@name='AddPostCountry']"/></xsl:if>
                            <br/>
                            <xsl:choose>
                                <xsl:when test="string-length(atom[@name='InfVenueStartDate']) = 4 and string-length(atom[@name='InfVenueEndDate']) = 4">
                                    <xsl:value-of select="atom[@name='InfVenueStartDate']"/><xsl:text> to </xsl:text><xsl:value-of select="atom[@name='InfVenueEndDate']"/>
                                </xsl:when>
                                <xsl:when test="string-length(atom[@name='InfVenueStartDate']) = 4 and not(atom[@name='InfVenueEndDate'])">
                                    <xsl:value-of select="atom[@name='InfVenueStartDate']"/><xsl:text> to TBD</xsl:text>
                                </xsl:when>
                                <xsl:when test="not(atom[@name='InfVenueStartDate']) and string-length(atom[@name='InfVenueEndDate']) = 4">
                                    <xsl:text>TBD to </xsl:text><xsl:value-of select="atom[@name='InfVenueEndDate']"/>
                                </xsl:when>
                                <xsl:when test="atom[@name='InfVenueStartDate'] != '' and atom[@name='InfVenueEndDate'] != ''">
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-01-')"><xsl:text>January </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-02-')"><xsl:text>February </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-03-')"><xsl:text>March </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-04-')"><xsl:text>April </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-05-')"><xsl:text>May </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-06-')"><xsl:text>June </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-07-')"><xsl:text>July </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-08-')"><xsl:text>August </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-09-')"><xsl:text>September </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-10-')"><xsl:text>October </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-11-')"><xsl:text>November </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-12-')"><xsl:text>December </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:text> to </xsl:text>
                                    <xsl:if test="contains(atom[@name='InfVenueEndDate'], '-01-')"><xsl:text>January </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueEndDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueEndDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueEndDate'], '-02-')"><xsl:text>February </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueEndDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueEndDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueEndDate'], '-03-')"><xsl:text>March </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueEndDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueEndDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueEndDate'], '-04-')"><xsl:text>April </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueEndDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueEndDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueEndDate'], '-05-')"><xsl:text>May </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueEndDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueEndDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueEndDate'], '-06-')"><xsl:text>June </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueEndDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueEndDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueEndDate'], '-07-')"><xsl:text>July </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueEndDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueEndDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueEndDate'], '-08-')"><xsl:text>August </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueEndDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueEndDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueEndDate'], '-09-')"><xsl:text>September </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueEndDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueEndDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueEndDate'], '-10-')"><xsl:text>October </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueEndDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueEndDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueEndDate'], '-11-')"><xsl:text>November </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueEndDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueEndDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueEndDate'], '-12-')"><xsl:text>December </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueEndDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueEndDate'],1,4)"/>
                                    </xsl:if>
                                </xsl:when>
                                <xsl:when test="atom[@name='InfVenueStartDate'] != '' and atom[@name='InfVenueEndDate'] = ''">
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-01-')"><xsl:text>January </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-02-')"><xsl:text>February </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-03-')"><xsl:text>March </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-04-')"><xsl:text>April </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-05-')"><xsl:text>May </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-06-')"><xsl:text>June </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-07-')"><xsl:text>July </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-08-')"><xsl:text>August </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-09-')"><xsl:text>September </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-10-')"><xsl:text>October </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-11-')"><xsl:text>November </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-12-')"><xsl:text>December </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:text> to TBD</xsl:text>
                                </xsl:when>
                                <xsl:when test="atom[@name='InfVenueStartDate'] != '' and not(atom[@name='InfVenueEndDate'])">
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-01-')"><xsl:text>January </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-02-')"><xsl:text>February </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-03-')"><xsl:text>March </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-04-')"><xsl:text>April </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-05-')"><xsl:text>May </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-06-')"><xsl:text>June </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-07-')"><xsl:text>July </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-08-')"><xsl:text>August </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-09-')"><xsl:text>September </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-10-')"><xsl:text>October </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-11-')"><xsl:text>November </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:if test="contains(atom[@name='InfVenueStartDate'], '-12-')"><xsl:text>December </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='InfVenueStartDate'],1,4)"/>
                                    </xsl:if>
                                    <xsl:text> to TBD</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    Loan Dates To Be Determined
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                    </tr>
                </xsl:when>
                <xsl:otherwise>
                    <tr class="atomvalue">
                        <td class="atomvalue" style="white-space: nowrap">
                            <b><span style="text-decoration: underline;">To Be Determined</span></b><br/>
                            <xsl:choose>
                                <xsl:when test="atom[@name='InfVenueStartDate'] != '' and atom[@name='InfVenueEndDate'] != ''">
                                    <xsl:value-of select="atom[@name='InfVenueStartDate']"/><xsl:text> to </xsl:text>
                                    <xsl:value-of select="atom[@name='InfVenueEndDate']"/>
                                </xsl:when>
                                <xsl:when test="atom[@name='InfVenueStartDate'] != '' and atom[@name='InfVenueEndDate'] = ''">
                                    <xsl:value-of select="atom[@name='InfVenueStartDate']"/><xsl:text> to TBD</xsl:text>
                                </xsl:when>
                                <xsl:when test="atom[@name='InfVenueStartDate'] = '' and atom[@name='InfVenueEndDate'] != ''">
                                    <xsl:text>TBD to </xsl:text><xsl:value-of select="atom[@name='InfVenueEndDate']"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    Loan Dates TBD
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                    </tr>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="position() != last()">
                <span> </span>
            </xsl:if>
        </xsl:for-each>
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
                                <xsl:if test="atom[@name='SumCreditLine'] != ''">
                                    <tr class="atomvalue">
                                        <td class="atomvalue">
                                            <b>Credit Line: </b><xsl:value-of select="atom[@name='SumCreditLine']" />
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
                                    <xsl:otherwise>
                                        <tr class="atomvalue">
                                            <td class="atomvalue" style="color: red;">
                                                <xsl:text>VALUATION MISSING</xsl:text>
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
                <table class="picture" style="margin-top: -8px;">
                    <tr class="picture">
                        <td style="vertical-align: top;">
                            <table border="0" class="data" id="datatable">
                                <xsl:choose>
                                    <xsl:when test="atom[@name='CreProvenance'] != ''">
                                        <tr class="atomvalue">
                                            <td class="atomvalue">
                                                <b>Provenance: </b><xsl:value-of select="atom[@name='CreProvenance']"/>
                                            </td>
                                        </tr>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <tr class="atomvalue">
                                            <td class="atomvalue" style="color: red;">
                                                <xsl:text>PROVENANCE MISSING</xsl:text>
                                            </td>
                                        </tr>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>