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
td.mainsection
{
    background-color: #0E6CA5;
    color: #FFFFFF;
    font-weight: bold;
    text-align: center;
    padding-top: 0.5em;
    padding-bottom: 0.5em;
    padding-left: 0.5em;
    padding-right: 0.5em;
}
td.section
{
    background-color: #0ea547;
    color: #FFFFFF;
    font-weight: bold;
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
td.horprompt
{
    font-weight: bold;
    font-size: smaller;
    width: 50%;
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
            <table border="1" class="sheet">
                <xsl:call-template name="heading" />
                <xsl:call-template name="object" />
                <xsl:if test="(table[@name='Grandparent']) or (table[@name='Parent']) or (table[@name='Children'])">
                    <xsl:call-template name="mainsection" />
                </xsl:if>
                <xsl:if test="contains(table[@name='Grandparent']/tuple/tuple/tuple/atom[@name='AssIsParent'], 'Yes')">
                    <xsl:call-template name="grandparentsection" />
                    <xsl:call-template name="Grandparent" />
                </xsl:if>
                <xsl:if test="contains(table[@name='Parent']/tuple/tuple/atom[@name='AssIsParent'], 'Yes')">
                    <xsl:call-template name="parentsection" />
                    <xsl:call-template name="Parent" />
                </xsl:if>
                <xsl:if test="contains(atom[@name='AssIsParent'], 'Yes')">
                    <xsl:call-template name="childrensection" />
                    <xsl:call-template name="Children" />
                </xsl:if>
                <xsl:if test="tuple[@name='AssParentObjectRef']/table[@name='Siblings']/tuple/atom[@name='AssIsParent'] != ''">
                    <xsl:call-template name="siblingsection" />
                    <xsl:call-template name="Siblings" />
                </xsl:if>
                <xsl:if test="tuple[@name='AssParentObjectRef']/tuple[@name='AssParentObjectRef']/table[@name='Uncles']/tuple/atom[@name='AssIsParent'] != ''">
               <xsl:call-template name="othersection" />
                    <xsl:call-template name="Other" />
                </xsl:if>
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
            Main Section template
     -->
    <xsl:template name="mainsection">
        <tr class="mainsection">
            <td class="mainsection">
                Associated Parts
            </td>
        </tr>
    </xsl:template>
    <!--
            Grandparent Section template
     -->
    <xsl:template name="grandparentsection">
        <tr class="section">
            <td class="section">
                Grandparent
            </td>
        </tr>
    </xsl:template>
    <!--
            Grandparent template
     -->
    <xsl:template name="Grandparent">
        <tr class="values">
            <td class="values">
                <table border="0" class="data" id="datatable">
                    <tr class="atomvalue">
                        <td class="horprompt">
                            Summary Data
                        </td>
                        <td class="horprompt">
                            Current Location
                        </td>
                    </tr>
                    <xsl:for-each select="table[@name='Grandparent']/tuple/tuple[@name='AssParentObjectRef']/tuple[@name='AssParentObjectRef']">
                        <xsl:sort data-type="text" order="ascending"
                            select="atom[@name='SummaryData']"/>
                                <tr>
                                    <td class="atomvalue">
                                        <xsl:value-of select="atom[@name='SummaryData']"/>
                                    </td>
                                    <td class="atomvalue">
                                        <xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='SummaryData']"/>
                                    </td>
                                </tr>
                    </xsl:for-each>
                </table>
            </td>
        </tr>
    </xsl:template>
    <!--
            Parent Section template
     -->
    <xsl:template name="parentsection">
        <tr class="section">
            <td class="section">
                Parent
            </td>
        </tr>
    </xsl:template>
    <!--
            Parent template
     -->
    <xsl:template name="Parent">
        <tr class="values">
            <td class="values">
                <table border="0" class="data" id="datatable">
                    <tr class="atomvalue">
                        <td class="horprompt">
                            Summary Data
                        </td>
                        <td class="horprompt">
                            Current Location
                        </td>
                    </tr>
                    <xsl:for-each select="table[@name='Parent']/tuple/tuple[@name='AssParentObjectRef']">
                        <xsl:sort data-type="text" order="ascending"
                            select="atom[@name='SummaryData']"/>
                        <tr>
                            <td class="atomvalue">
                                <xsl:value-of select="atom[@name='SummaryData']"/>
                            </td>
                            <td class="atomvalue">
                                <xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='SummaryData']"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </td>
        </tr>
    </xsl:template>
    <!--
            Children/Grandchildren Section template
     -->
    <xsl:template name="childrensection">
        <tr class="section">
            <td class="section">
                Children and Grandchildren
            </td>
        </tr>
    </xsl:template>
    <!--
            Children/Grandchildren template
     -->
    <xsl:template name="Children">
        <tr class="values">
            <td class="values">
                <table border="0" class="data" id="datatable">
                    <tr class="atomvalue">
                        <td class="horprompt">
                            Summary Data
                        </td>
                        <td class="horprompt">
                            Current Location
                        </td>
                    </tr>
<xsl:for-each select="table[@name='Children']/tuple">
    <xsl:sort data-type="text" order="ascending"
        select="atom[@name='SummaryData']"/>
    <xsl:choose>
        <xsl:when test="contains(atom[@name='AssIsParent'], 'Yes')">
            <tr>
                <td class="atomvalue">
                    <xsl:value-of select="atom[@name='SummaryData']"/>
                </td>
                <td class="atomvalue">
                    <xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='SummaryData']"/>
                </td>
            </tr>
            <xsl:for-each select="table[@name='Grandchildren']/tuple">
                <xsl:sort data-type="text" order="ascending"
                    select="atom[@name='SummaryData']"/>
                    <tr>
                        <td class="atomvalue">
                            <xsl:value-of select="atom[@name='SummaryData']"/>
                        </td>
                        <td class="atomvalue">
                            <xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='SummaryData']"/>
                        </td>
                    </tr>
            </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
            <tr>
                <td class="atomvalue">
                    <xsl:value-of select="atom[@name='SummaryData']"/>
                </td>
                <td class="atomvalue">
                    <xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='SummaryData']"/>
                </td>
            </tr>
        </xsl:otherwise>
    </xsl:choose>
                                </xsl:for-each>
                </table>
            </td>
        </tr>
    </xsl:template>
    <!--
            Siblings Section template
     -->
    <xsl:template name="siblingsection">
        <tr class="section">
            <td class="section">
                Siblings
            </td>
        </tr>
    </xsl:template>
    <!--
            Siblings template
     -->
    <xsl:template name="Siblings">
        <tr class="values">
            <td class="values">
                <table border="0" class="data" id="datatable">
                    <tr class="atomvalue">
                        <td class="horprompt">
                            Summary Data
                        </td>
                        <td class="horprompt">
                            Current Location
                        </td>
                    </tr>
                    <xsl:for-each select="tuple[@name='AssParentObjectRef']/table[@name='Siblings']/tuple">
                        <xsl:sort data-type="text" order="ascending"
                            select="atom[@name='SummaryData']"/>
                        <xsl:if test="not(contains(ancestor::table[@name='ecatalogue']/tuple/atom[@name='SummaryData'], ./atom[@name='SummaryData']))">
                        <xsl:choose>
                            <xsl:when test="contains(atom[@name='AssIsParent'], 'Yes')">
                                <tr>
                                    <td class="atomvalue">
                                        <xsl:value-of select="atom[@name='SummaryData']"/>
                                    </td>
                                    <td class="atomvalue">
                                        <xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='SummaryData']"/>
                                    </td>
                                </tr>
                                <xsl:for-each select="table[@name='Nephews']/tuple">
                                    <xsl:sort data-type="text" order="ascending"
                                        select="atom[@name='SummaryData']"/>
                                    <tr>
                                        <td class="atomvalue">
                                            <xsl:value-of select="atom[@name='SummaryData']"/>
                                        </td>
                                        <td class="atomvalue">
                                            <xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='SummaryData']"/>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                                <tr>
                                    <td class="atomvalue">
                                        <xsl:value-of select="atom[@name='SummaryData']"/>
                                    </td>
                                    <td class="atomvalue">
                                        <xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='SummaryData']"/>
                                    </td>
                                </tr>
                            </xsl:otherwise>
                        </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </table>
            </td>
        </tr>
    </xsl:template>
    <!--
            Other Section template
     -->
    <xsl:template name="othersection">
        <tr class="section">
            <td class="section">
                Other
            </td>
        </tr>
    </xsl:template>
    <!--
            Other template
     -->
    <xsl:template name="Other">
        <tr class="values">
            <td class="values">
                <table border="0" class="data" id="datatable">
                    <tr class="atomvalue">
                        <td class="horprompt">
                            Summary Data
                        </td>
                        <td class="horprompt">
                            Current Location
                        </td>
                    </tr>
                    <xsl:for-each select="tuple[@name='AssParentObjectRef']/tuple[@name='AssParentObjectRef']/table[@name='Uncles']/tuple">
                        <xsl:sort data-type="text" order="ascending"
                            select="atom[@name='SummaryData']"/>
                        <xsl:if test="not(contains(ancestor::table[@name='ecatalogue']/tuple/table[@name='Parent']/tuple/tuple[@name='AssParentObjectRef']/atom[@name='SummaryData'], ./atom[@name='SummaryData']))">
                            <xsl:choose>
                                <xsl:when test="contains(atom[@name='AssIsParent'], 'Yes')">
                                    <tr>
                                        <td class="atomvalue">
                                            <xsl:value-of select="atom[@name='SummaryData']"/>
                                        </td>
                                        <td class="atomvalue">
                                            <xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='SummaryData']"/>
                                        </td>
                                    </tr>
                                    <xsl:for-each select="table[@name='Cousins']/tuple">
                                        <xsl:sort data-type="text" order="ascending"
                                            select="atom[@name='SummaryData']"/>
                                        <tr>
                                            <td class="atomvalue">
                                                <xsl:value-of select="atom[@name='SummaryData']"/>
                                            </td>
                                            <td class="atomvalue">
                                                <xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='SummaryData']"/>
                                            </td>
                                        </tr>
                                        
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:otherwise>
                                    <tr>
                                        <td class="atomvalue">
                                            <xsl:value-of select="atom[@name='SummaryData']"/>
                                        </td>
                                        <td class="atomvalue">
                                            <xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='SummaryData']"/>
                                        </td>
                                    </tr>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </table>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>