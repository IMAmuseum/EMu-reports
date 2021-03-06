<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
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
        <xsl:for-each select="/table/tuple">
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
    background-color: #CCCCCC;
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
}
td.heading
{
    background-color: #0E6CA5;
    color: #FFFFFF;
    font-weight: bold;
    padding-top: 0.5em;
    padding-bottom: 0.5em;
    padding-left: 0.5em;
    padding-right: 0.5em;
}
td.display
{
    background-color: #0E6CA5;
    color: #FFFFFF;
    font-weight: bold;
    text-align: center;
    padding-top: 0.1em;
    padding-bottom: 0.1em;
    padding-left: 0em;
    padding-right: 0em;
}
td.condition
{
    background-color: #a50e20;
    color: #FFFFFF;
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
table.icon
{
    border-width: 2px;
    border-style: solid;
    border-color: #c41230;
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
td.exhibitvalue
{
    font-size: smaller;
    color: #a50e20;
    padding: 0.25em 0.5em 0.25em 0.5em;
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
            <table border="1" class="sheet" style="page-break-after: always">
                <xsl:call-template name="heading" />
                <xsl:call-template name="image" />
                <xsl:call-template name="locationheading" />
                <xsl:call-template name="locationdata" />
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
            Image template
     -->
    <xsl:template name="image">
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
                                <tr class="atomvalue">
                                    <td class="atomprompt">
                                        Rights
                                    </td>
                                    <td class="atomvalue">
                                        <xsl:value-of select="table[@name='RigRightsRef_tab']/tuple/atom[@name='RigStatus']" />
                                    </td>
                                </tr>
                                <tr class="atomvalue">
                                    <td class="atomprompt">
                                        Current Location
                                    </td>
                                    <td class="atomvalue">
                                        <xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='SummaryData']" />
                                    </td>
                                </tr>
                                <tr class="atomvalue">
                                    <td class="atomprompt">
                                        On Display?
                                    </td>
                                    <xsl:choose>
                                        <xsl:when test="contains(atom[@name='LocMovementType'], 'Exhibition Location')">
                                            <td class="atomvalue">
                                                Yes
                                            </td>
                                        </xsl:when>
                                        <xsl:when test="contains(tuple[@name='LocCurrentLocationRef']/atom[@name='SummaryData'], 'see related parts')">
                                            <td class="atomvalue">
                                                Blanket record - see parts for on display status
                                            </td>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <td class="atomvalue">
                                                No
                                            </td>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>        
    </xsl:template>
    <!--
            Location heading template
     -->
    <xsl:template name="locationheading">
                <tr class="display">
                    <td class="display">
                        Location History
                    </td>
                </tr>
    </xsl:template>
    <!--
            Location Data template
     -->
    <xsl:template name="locationdata">
        <xsl:variable name="sorted">
            <xsl:for-each select="table[@name='Group2']/tuple">
                <xsl:sort data-type="text" order="descending"
                    select="atom[@name='MovDateMoved']"/>
                    <xsl:apply-templates mode="copy" select="."/>
            </xsl:for-each>
        </xsl:variable>
        
        <tr class="values">
            <td class="values">
                <table border="0" class="data" id="datatable">
                    <tr class="atomvalue">
                        <td class="horprompt">
                            Date Moved
                        </td>
                        <td class="horprompt">
                            Duration
                        </td>
                        <td class="horprompt">
                            Location
                        </td>
                        <td class="horprompt">
                            Movement Notes
                        </td>

                        <xsl:for-each select="msxsl:node-set($sorted)/tuple">
                        <xsl:choose>
    <!--
        First (Current) Location
    -->
                        <xsl:when test="position() = 1">
                            <xsl:choose>
                                <xsl:when test="contains(atom[@name='MovMovementNotes'], 'Exhibition Location')">
                                    <tr class="exhibitvalue" border="2px solid black">
                                        <td class="exhibitvalue" style="white-space: nowrap">
                                            <xsl:value-of select="atom[@name='MovDateMoved']"/>
                                        </td>
                                        <td class="exhibitvalue" style="white-space: nowrap">
                                            Ongoing
                                        </td>
                                        <td class="exhibitvalue">
                                            <xsl:value-of select="table[@name='MovLocationRef_tab']/tuple/atom[@name='SummaryData']"/>
                                        </td>
                                        <td class="exhibitvalue">
                                            <xsl:value-of select="atom[@name='MovMovementNotes']" />
                                        </td>
                                    </tr>
                                </xsl:when>
                                <xsl:when test="contains(table[@name='MovLocationRef_tab']/tuple/atom[@name='SummaryData'], 'Director')">
                                    <tr class="exhibitvalue" border="2px solid black">
                                        <td class="exhibitvalue" style="white-space: nowrap">
                                            <xsl:value-of select="atom[@name='MovDateMoved']"/>
                                        </td>
                                        <td class="exhibitvalue" style="white-space: nowrap">
                                            Ongoing
                                        </td>
                                        <td class="exhibitvalue">
                                            <xsl:value-of select="table[@name='MovLocationRef_tab']/tuple/atom[@name='SummaryData']"/>
                                        </td>
                                        <td class="exhibitvalue">
                                            <xsl:value-of select="atom[@name='MovMovementNotes']" />
                                        </td>
                                    </tr>
                                </xsl:when>
                                <xsl:otherwise>
                                    <tr>
                                        <td class="atomvalue" style="white-space: nowrap">
                                            <xsl:value-of select="atom[@name='MovDateMoved']"/>
                                        </td>
                                        <td class="atomvalue" style="white-space: nowrap">
                                            Ongoing
                                        </td>
                                        <td class="atomvalue">
                                            <xsl:value-of select="table[@name='MovLocationRef_tab']/tuple/atom[@name='SummaryData']"/>
                                        </td>
                                        <td class="atomvalue">
                                            <xsl:value-of select="atom[@name='MovMovementNotes']" />
                                        </td>
                                    </tr>
                                </xsl:otherwise>
                            </xsl:choose>
                            </xsl:when>

    <!--
        Permanent Location
    -->                        
                        <xsl:when test="atom[@name='MovDateMoved'] = 0">
                            <xsl:choose>
                                    <xsl:when test="contains(atom[@name='MovMovementNotes'], 'Exhibition Location')">
                                        <tr class="exhibitvalue" border="2px solid black">
                                            <td class="exhibitvalue" style="white-space: nowrap">
                                                <xsl:value-of select="atom[@name='MovDateMoved']"/>
                                            </td>
                                            <td class="exhibitionvalue" style="white-space: nowrap">
                                                
                                            </td>
                                            <td class="exhibitvalue">
                                                <xsl:value-of select="table[@name='MovLocationRef_tab']/tuple/atom[@name='SummaryData']"/>
                                            </td>
                                            <td class="exhibitvalue">
                                                <xsl:value-of select="atom[@name='MovMovementNotes']" />
                                            </td>
                                        </tr>
                                    </xsl:when>
                                    <xsl:when test="contains(table[@name='MovLocationRef_tab']/tuple/atom[@name='SummaryData'], 'Director')">
                                        <tr class="exhibitvalue" border="2px solid black">
                                            <td class="exhibitvalue" style="white-space: nowrap">
                                                <xsl:value-of select="atom[@name='MovDateMoved']"/>
                                            </td>
                                            <td class="exhibitionvalue" style="white-space: nowrap">
                                                
                                            </td>
                                            <td class="exhibitvalue">
                                                <xsl:value-of select="table[@name='MovLocationRef_tab']/tuple/atom[@name='SummaryData']"/>
                                            </td>
                                            <td class="exhibitvalue">
                                                <xsl:value-of select="atom[@name='MovMovementNotes']" />
                                            </td>
                                        </tr>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <tr>
                                            <td class="atomvalue" style="white-space: nowrap">
                                                <xsl:value-of select="atom[@name='MovDateMoved']"/>
                                            </td>
                                            <td class="atomvalue" style="white-space: nowrap">
                                                
                                            </td>
                                            <td class="atomvalue">
                                                <xsl:value-of select="table[@name='MovLocationRef_tab']/tuple/atom[@name='SummaryData']"/>
                                            </td>
                                            <td class="atomvalue">
                                                <xsl:value-of select="atom[@name='MovMovementNotes']" />
                                            </td>
                                        </tr>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>

    <!--
        All Other Locations
    -->
                        <xsl:otherwise>
                            <xsl:choose>
                                <xsl:when test="contains(atom[@name='MovMovementNotes'], 'Exhibition Location')">
                                    <tr class="exhibitvalue" border="2px solid black">
                                        <td class="exhibitvalue" style="white-space: nowrap">
                                            <xsl:value-of select="atom[@name='MovDateMoved']"/>
                                        </td>
                                        <td class="exhibitvalue" style="white-space: nowrap">
                                            <xsl:variable name="StartDate">
                                                <xsl:call-template name="calculate-julian-day">
                                                    <xsl:with-param name="year" select="substring(atom[@name='MovDateMoved'],1,4)"/>
                                                    <xsl:with-param name="month" select="substring(atom[@name='MovDateMoved'],6,2)"/>
                                                    <xsl:with-param name="day" select="substring(atom[@name='MovDateMoved'],9,2)"/>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:variable name="EndDate">
                                                <xsl:call-template name="calculate-julian-day">
                                                    <xsl:with-param name="year" select="substring(preceding-sibling::*[1]/atom[@name='MovDateMoved'],1,4)"/>
                                                    <xsl:with-param name="month" select="substring(preceding-sibling::*[1]/atom[@name='MovDateMoved'],6,2)"/>
                                                    <xsl:with-param name="day" select="substring(preceding-sibling::*[1]/atom[@name='MovDateMoved'],9,2)"/>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:value-of select="$EndDate - $StartDate"/> days
                                        </td>
                                        <td class="exhibitvalue">
                                            <xsl:value-of select="table[@name='MovLocationRef_tab']/tuple/atom[@name='SummaryData']"/>
                                        </td>
                                        <td class="exhibitvalue">
                                            <xsl:value-of select="atom[@name='MovMovementNotes']" />
                                        </td>
                                    </tr>
                                </xsl:when>
                                <xsl:when test="contains(table[@name='MovLocationRef_tab']/tuple/atom[@name='SummaryData'], 'Director')">
                                    <tr class="exhibitvalue" border="2px solid black">
                                        <td class="exhibitvalue" style="white-space: nowrap">
                                            <xsl:value-of select="atom[@name='MovDateMoved']"/>
                                        </td>
                                        <td class="exhibitvalue" style="white-space: nowrap">
                                            <xsl:variable name="StartDate">
                                                <xsl:call-template name="calculate-julian-day">
                                                    <xsl:with-param name="year" select="substring(atom[@name='MovDateMoved'],1,4)"/>
                                                    <xsl:with-param name="month" select="substring(atom[@name='MovDateMoved'],6,2)"/>
                                                    <xsl:with-param name="day" select="substring(atom[@name='MovDateMoved'],9,2)"/>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:variable name="EndDate">
                                                <xsl:call-template name="calculate-julian-day">
                                                    <xsl:with-param name="year" select="substring(preceding-sibling::*[1]/atom[@name='MovDateMoved'],1,4)"/>
                                                    <xsl:with-param name="month" select="substring(preceding-sibling::*[1]/atom[@name='MovDateMoved'],6,2)"/>
                                                    <xsl:with-param name="day" select="substring(preceding-sibling::*[1]/atom[@name='MovDateMoved'],9,2)"/>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:value-of select="$EndDate - $StartDate"/> days
                                        </td>
                                        <td class="exhibitvalue">
                                            <xsl:value-of select="table[@name='MovLocationRef_tab']/tuple/atom[@name='SummaryData']"/>
                                        </td>
                                        <td class="exhibitvalue">
                                            <xsl:value-of select="atom[@name='MovMovementNotes']" />
                                        </td>
                                    </tr>
                                </xsl:when>
                                <xsl:otherwise>
                                    <tr>
                                        <td class="atomvalue" style="white-space: nowrap">
                                            <xsl:value-of select="atom[@name='MovDateMoved']"/>
                                        </td>
                                        <td class="atomvalue" style="white-space: nowrap">
                                            <xsl:variable name="StartDate">
                                            <xsl:call-template name="calculate-julian-day">
                                                <xsl:with-param name="year" select="substring(atom[@name='MovDateMoved'],1,4)"/>
                                                <xsl:with-param name="month" select="substring(atom[@name='MovDateMoved'],6,2)"/>
                                                <xsl:with-param name="day" select="substring(atom[@name='MovDateMoved'],9,2)"/>
                                            </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:variable name="EndDate">
                                            <xsl:call-template name="calculate-julian-day">
                                                <xsl:with-param name="year" select="substring(preceding-sibling::*[1]/atom[@name='MovDateMoved'],1,4)"/>
                                                <xsl:with-param name="month" select="substring(preceding-sibling::*[1]/atom[@name='MovDateMoved'],6,2)"/>
                                                <xsl:with-param name="day" select="substring(preceding-sibling::*[1]/atom[@name='MovDateMoved'],9,2)"/>
                                            </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:value-of select="$EndDate - $StartDate"/> days
                                        </td>
                                        <td class="atomvalue">
                                            <xsl:value-of select="table[@name='MovLocationRef_tab']/tuple/atom[@name='SummaryData']"/>
                                        </td>
                                        <td class="atomvalue">
                                            <xsl:value-of select="atom[@name='MovMovementNotes']" />
                                        </td>
                                    </tr>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:otherwise>
                        </xsl:choose>
                        </xsl:for-each>
                    </tr>
                </table>
            </td>
        </tr>
    </xsl:template>
    <!-- 
        $sorted Location History template
    -->
    <xsl:template mode="copy" match="table[@name='Group2']/tuple">
        <xsl:copy-of select="."/>
    </xsl:template>
    <!--
            Time Difference calculation template
    -->
    <xsl:template name="calculate-julian-day">
        <xsl:param name="year"/>
        <xsl:param name="month"/>
        <xsl:param name="day"/>

        <xsl:variable name="a" select="floor((14 - $month) div 12)"/>
        <xsl:variable name="y" select="$year + 4800 - $a"/>
        <xsl:variable name="m" select="$month + 12 * $a - 3"/>

        <xsl:value-of select="$day + floor((153 * $m + 2) div 5) + $y * 365 + floor($y div 4) - floor($y div 100) + floor($y div 400) - 32045"/>
    </xsl:template>
</xsl:stylesheet>