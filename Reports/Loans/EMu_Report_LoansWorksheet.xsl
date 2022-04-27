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
            Body template
     -->
    <xsl:template name="body">
        <xsl:for-each select="/table[@name='eloans']/tuple">
            <xsl:call-template name="record" />
            <xsl:if test="position() != last()">
                <p />
            </xsl:if>
        </xsl:for-each>
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
    font-weight: bold;
    border-width: 2px;
    border-syle: solid;
    border-color: #000000;
    padding-top: 0.5em;
    padding-bottom: 0.5em;
    padding-left: 0.5em;
    padding-right: 0.5em;
}
td.section
{
    background-color: #c0c0c0;
    color: #000000;
    font-weight: bold;
    border-width: 2px;
    border-syle: solid;
    border-color: #000000;
    padding-top: 0.5em;
    padding-bottom: 0.5em;
    padding-left: 0.5em;
    padding-right: 0.5em;
}
table.picture
{
    width: 100%;
}
table.icon
{
    border-width: 2px;
    border-style: solid;
    border-color: #000000;
}
img.icon
{
    width: 150px;
    height: auto;
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
</xsl:text>
        </style>
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
                <xsl:call-template name="provenance" />
                </xsl:for-each>
                <xsl:call-template name="notes" />
            </table>
        </center>
    </xsl:template>
    <!--
            Heading template
     -->
    <xsl:template name="heading">
        <tr class="heading">
            <td class="heading">
                <xsl:text>Loan Request </xsl:text><xsl:value-of select="atom[@name='InfLoanNumber']"/><xsl:text> - </xsl:text><xsl:value-of select="atom[@name='InfLoanPurpose']"/>
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
                            <b><xsl:value-of select="atom[@name='NamOrganisation']"/></b><xsl:text> </xsl:text>
                            <xsl:if test="atom[@name='AddPostCity'] != ''">
                                <xsl:text>- </xsl:text><xsl:value-of select="atom[@name='AddPostCity']" /><xsl:text>, </xsl:text>
                            </xsl:if>
                            <xsl:if test="atom[@name='AddPostState'] != ''">
                                <xsl:value-of select="atom[@name='AddPostState']"/></xsl:if>
                            <xsl:if test="atom[@name='AddPostCountry'] != ''"><xsl:text> </xsl:text><xsl:value-of select="atom[@name='AddPostCountry']"/></xsl:if><xsl:text> - </xsl:text>
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
                        <xsl:choose>
                        <xsl:when test="table[@name='MulMultiMediaRef_tab']/tuple/atom[@name='Multimedia']">
                            <td class="picture" width="200px">
                                <table class="icon">
                                    <tr class="icon">
                                        <td class="icon">
                                            <img class="icon" max-width="150px" max-height="150px">
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
                            <table border="0" class="data" id="datatable">
    <!--
        Object Information
    -->
                                <tr class="atomvalue">
                                    <td class="atomvalue" style="font-weight: bold">
                                        <xsl:for-each select="table[@name='Creator']/tuple">
                                            <xsl:if test="atom[@name='CreRole'] != ''"><xsl:value-of select="atom[@name='CreRole']"/>: </xsl:if><xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''"><xsl:value-of select="atom[@name='NamFullName']"/></xsl:when><xsl:when test="atom[@name='NamOrganisation'] != ''"><xsl:value-of select="atom[@name='NamOrganisation']"/></xsl:when><xsl:when test="atom[@name='ColCollaborationName'] != ''"><xsl:value-of select="atom[@name='ColCollaborationName']"/></xsl:when><xsl:when test="atom[@name='CreCreationCultureOrPeople'] != ''"><xsl:value-of select="atom[@name='CreCreationCultureOrPeople']"/></xsl:when><xsl:otherwise></xsl:otherwise></xsl:choose>
                                            <xsl:if test="position() != last()">
                                                <br/>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </td>
                                </tr>
                                <tr class="atomvalue">
                                    <td class="atomvalue" style="font-style: italic">
                                        <xsl:value-of select="atom[@name='TitMainTitle']" />
                                    </td>
                                </tr>
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
                                        <xsl:value-of select="atom[@name='PhyMediumAndSupport']" />
                                    </td>
                                </tr>
                                <tr class="atomvalue">
                                    <td class="atomvalue">
                                        <xsl:value-of select="atom[@name='PhyConvertedDims']" />
                                    </td>
                                </tr>
                                <tr class="atomvalue">
                                    <td class="atomvalue">
                                        <xsl:value-of select="atom[@name='SumCreditLine']" />
                                    </td>
                                </tr>
                                <tr class="atomvalue">
                                    <td class="atomvalue">
                                        <xsl:value-of select="atom[@name='TitAccessionNo']" />
                                    </td>
                                </tr>
                                <tr class="atomvalue">
                                    <td class="atomvalue">
                                        <xsl:text>Insured Value: </xsl:text><xsl:value-of select="format-number(atom[@name='ValValuationAmount'], '###,###,###,###,###.00')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>        
    </xsl:template>
    <!--
            Provenance template
    -->
    <xsl:template name="provenance">
                    <tr class="bottomvalue">
                        <td class="bottomvalue">
                            <span style="font-weight: bold">Provenance: </span><xsl:value-of select="atom[@name='CreProvenance']"/>
                        </td>
                    </tr>
    </xsl:template>
    <!--
            Notes template
    -->
    <xsl:template name="notes">
        <tr class="bottomvalue">
            <td class="bottomvalue">
                <span style="font-weight: bold">Notes: </span>
                <p><PRE><xsl:value-of select="atom[@name='NotNotes']"/></PRE></p>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>