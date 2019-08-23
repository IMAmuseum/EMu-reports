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
                <xsl:call-template name="scripts" />
            </head>
            <body class="sheet" onLoad="loaded()">
                <xsl:call-template name="body" />
            </body>
        </html>
    </xsl:template>
    <!--
            Body template
     -->
    <xsl:template name="body">
        <xsl:for-each select="table[@name='ecatalogue']/tuple">
            <xsl:sort select="atom[@name='StaStocktakeStatus']"/>
            <xsl:sort select="atom[@name='TitAccessionNo']"/>
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
    background-color: #EEEEEE;
    border-color: #0E6CA5;
    page-break-inside: avoid;
}
td.heading
{
    background-color: #FFFFFF;
    color: #000000;
    font-weight: bold;
    padding-top: 0.5em;
    padding-bottom: 0.5em;
    padding-left: 0.5em;
    padding-right: 0.5em;
}
td.display
{
    background-color: #FFFFFF;
    color: #000000;
    font-weight: bold;
    text-align: center;
    padding-top: 0.1em;
    padding-bottom: 0.1em;
    padding-left: 0em;
    padding-right: 0em;
}
td.section
{
    background-color: #FFFFFF;
    color: #000000;
    font-weight: bold;
    text-align: center;
    padding-top: 0.1em;
    padding-bottom: 0.1em;
    padding-left: 0em;
    padding-right: 0em;
}
table.picture
{
    width: 100%;
}
img.icon
{
    width: 150px;
    height: auto;
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
    width: 160px;
    font-weight: bold;
    font-size: smaller;
    vertical-align: top;
    padding-left: 0.5em;
    padding-right: 0.5em;
}
td.atomvalue
{
    font-size: smaller;
    padding-left: 0.5em;
    padding-right: 0.5em;
}
td.horprompt
{
    font-weight: bold;
    font-size: smaller;
    vertical-align: top;
    padding-left: 0.5em;
    padding-right: 0.5em;
}
</xsl:text>
        </style>
    </xsl:template>
    <!--
            Scripts template
     -->
    <xsl:template name="scripts">
        <script type="text/javascript">
            <xsl:text>
function loaded()
{
    var tables = document.getElementsByTagName("table");
    for (var index = 0; index &lt; tables.length; index++)
    {
        if (tables[index].id == "datatable")
            for (var row = 0; row &lt; tables[index].rows.length; row++)
                if (row % 2 == 0)
                    tables[index].rows[row].bgColor = "#FFFFFF";
    }
}
</xsl:text>
        </script>
    </xsl:template>
    <!--
            Record template
     -->
    <xsl:template name="record">
        <center>
            <table border="0" class="sheet">
                <xsl:call-template name="heading" />
                <xsl:call-template name="object" />
                <xsl:call-template name="ranksection" />
                <xsl:call-template name="rankdata" />
            </table>
        </center>
    </xsl:template>
    <!--
            Heading template
     -->
    <xsl:template name="heading">
        <tr class="heading">
            <xsl:choose>
                <xsl:when test="atom[@name='StaStocktakeStatus']='A'">
                    <td class="heading">
                        <span style="color: #6BE407"><xsl:value-of select="atom[@name='StaStocktakeStatus']"/><xsl:text> - </xsl:text></span><xsl:value-of select="atom[@name='SummaryData']" />
                    </td>
                </xsl:when>
                <xsl:when test="atom[@name='StaStocktakeStatus']='B'">
                    <td class="heading">
                        <span style="color: #FFBD08"><xsl:value-of select="atom[@name='StaStocktakeStatus']"/><xsl:text> - </xsl:text></span><xsl:value-of select="atom[@name='SummaryData']" />
                    </td>
                </xsl:when>
                <xsl:when test="atom[@name='StaStocktakeStatus']='C'">
                    <td class="heading">
                        <span style="color: #FF9008"><xsl:value-of select="atom[@name='StaStocktakeStatus']"/><xsl:text> - </xsl:text></span><xsl:value-of select="atom[@name='SummaryData']" />
                    </td>
                </xsl:when>            
                <xsl:when test="atom[@name='StaStocktakeStatus']='D'">
                    <td class="heading">
                        <span style="color: #a50e20"><xsl:value-of select="atom[@name='StaStocktakeStatus']"/><xsl:text> - </xsl:text></span><xsl:value-of select="atom[@name='SummaryData']" />
                    </td>
                </xsl:when>
                <xsl:when test="atom[@name='StaStocktakeStatus']='I'">
                    <td class="heading">
                        <span style="color: #000000"><xsl:value-of select="atom[@name='StaStocktakeStatus']"/><xsl:text> - </xsl:text></span><xsl:value-of select="atom[@name='SummaryData']" />
                    </td>
                </xsl:when>
                <xsl:otherwise>
                    <td class="heading">
                        <xsl:value-of select="atom[@name='SummaryData']" />
                    </td>
                </xsl:otherwise>
            </xsl:choose>
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
                        <xsl:if test="table/tuple/atom[@name='Multimedia']">
                            <td class="picture" width="25%">
                                <table class="icon">
                                    <tr class="icon">
                                        <td class="icon">
                                            <img class="icon">
                                                <xsl:attribute name="src">
                                                    <!--xsl:for-each select="table/tuple/atom"-->
                                                    <!--xsl:value-of select="." /-->
                                                    <xsl:value-of select="concat('file:///', translate(table/tuple/atom[@name='Multimedia'], '\', '/'))" />
                                                    <!--/xsl:for-each-->
                                                </xsl:attribute>
                                            </img>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </xsl:if>
                        <td width="75%">
                            <table border="0" class="data" id="datatable">
                                <tr class="atomvalue">
                                    <td class="atomprompt">
                                        Accession Number
                                    </td>
                                    <td class="atomvalue">
                                        <xsl:value-of select="atom[@name='TitAccessionNo']" />
                                    </td>
                                </tr>
                                <tr class="atomvalue">
                                    <td class="atomprompt">
                                        Title
                                    </td>
                                    <td class="atomvalue">
                                        <xsl:value-of select="atom[@name='TitMainTitle']" />
                                    </td>
                                </tr>
                                <tr class="atomvalue">
                                    <td class="atomprompt">
                                        Creator(s)
                                    </td>
                                    <td class="atomvalue">
                                        <xsl:for-each select="table[@name='Group1']/tuple">
                                            <xsl:value-of select="atom[@name='CreRole']"/>: <xsl:value-of select="atom[@name='SummaryData']"/>
                                            <xsl:if test="position() != last()">
                                                <br/>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </td>
                                </tr>
                                <tr class="atomvalue">
                                    <td class="atomprompt">
                                        Date Created
                                    </td>
                                    <td class="atomvalue">
                                        <xsl:value-of select="atom[@name='CreDateCreated']" />
                                    </td>
                                </tr>
                                <tr class="atomvalue">
                                    <td class="atomprompt">
                                        Medium and Support
                                    </td>
                                    <td class="atomvalue">
                                        <xsl:value-of select="atom[@name='PhyMediumAndSupport']" />
                                    </td>
                                </tr>
                                <tr class="atomvalue">
                                    <td class="atomprompt">
                                        Converted Dimensions
                                    </td>
                                    <td class="atomvalue">
                                        <xsl:value-of select="atom[@name='PhyConvertedDims']" />
                                    </td>
                                </tr>
                                <tr class="atomvalue">
                                    <td class="atomprompt">
                                        Credit Line
                                    </td>
                                    <td class="atomvalue">
                                        <xsl:value-of select="atom[@name='SumCreditLine']" />
                                    </td>
                                </tr>
                                <xsl:choose>
                                    <xsl:when test="atom[@name='ValReasonForValuation'] != '' and atom[@name='ValValuationAmount'] != ''">
                                <tr class="atomvalue">
                                    <td class="atomprompt">
                                        <xsl:value-of select="atom[@name='ValReasonForValuation']"/>:
                                    </td>
                                    <td class="atomvalue">
                                        $<xsl:value-of select="atom[@name='ValValuationAmount']" />
                                    </td>
                                </tr>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <tr class="atomvalue">
                                            <td class="atomprompt">
                                                Valuation Not Available
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
    <!--
            Rank Section template
     -->
    <xsl:template name="ranksection">
        <tr class="section">
            <td class="section">
                Ranking Notes
            </td>
        </tr>
    </xsl:template>
    <!--
            Rank Data template
     -->
    <xsl:template name="rankdata">
        <xsl:variable name="match">
            <xsl:for-each select="table[@name='Group2']/tuple">
                <xsl:if test="contains(atom[@name='DesPurpose'], 'Ranking')">
                    YES
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <tr class="values">
            <td class="values">
                <table border="0" class="data" id="datatable">
                    <tr class="atomvalue">
                        <td class="atomprompt">
                            Rank
                        </td>
                        <xsl:choose>
                            <xsl:when test="atom[@name='StaStocktakeStatus'] != ''">
                        <td class="atomvalue">
                            <xsl:value-of select="atom[@name='StaStocktakeStatus']" />
                        </td>
                            </xsl:when>
                            <xsl:otherwise>
                                <td class="atomvalue">
                                    <xsl:text>No ranking available.</xsl:text>
                                </td>
                            </xsl:otherwise>
                        </xsl:choose>
                    </tr>
                    <xsl:choose>
                        <xsl:when test="contains($match, 'YES')">
                    <xsl:for-each select="table[@name='Group2']/tuple">
                        <xsl:choose>
                            <xsl:when test="contains(atom[@name='DesPurpose'], 'Ranking')">
                                <xsl:for-each select="table[@name='NarAuthorsRef_tab']/tuple">
                                <tr class="atomvalue">
                                    <td class="atomprompt">
                                        Narrative Author
                                    </td>
                                    <td class="atomvalue">
                                        <xsl:value-of select="atom[@name='NamFullName']" />
                                    </td>
                                </tr>
                                </xsl:for-each>
                                <tr class="atomvalue">
                                    <td class="atomprompt">
                                        Narrative
                                    </td>
                                    <td class="atomvalue">
                                        <xsl:value-of select="atom[@name='NarNarrative']" />
                                    </td>
                                </tr>
                            </xsl:when>
                            <xsl:otherwise>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Narrative
                                </td>
                                <td class="atomvalue">
                                    <xsl:text>No ranking narrative available.</xsl:text>
                                </td>
                            </tr>
                        </xsl:otherwise>
                    </xsl:choose>
                </table>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>