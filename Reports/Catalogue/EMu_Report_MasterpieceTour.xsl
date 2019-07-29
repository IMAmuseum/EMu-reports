<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="html"/>
    
    <!-- The root transformation -->
    <xsl:template match="table[@name='ecatalogue']">
        <html>
            <head>
                <title>Masterpiece Tour Inventory</title>
                <xsl:call-template name="styles" />
            </head>
            <body class="sheet">
                <xsl:call-template name="body" />
            </body>
        </html>
    </xsl:template>
    
    <!-- CSS template -->
    <xsl:template name="styles">
        <style type="text/css">
            <xsl:text>
body.sheet
{
    background-color: #ffffff;
    color: #000000;
    font-family: Tahoma;
}
div.sheet
{
    width: 100%;Dimensions
    background-color: #ffffff;
    border: 2px solid black;
    page-break-inside: avoid;
}
div.header
{
    padding: 5px;
    font-family: Tahoma;
    font-weight: bold;
    text-align: left;
    font-size: 14px;
    border-bottom: 1px solid black;
    background-color: silver;
}
div.header2
{
    padding: 3px;
    font-family: Tahoma;
    font-weight: bold;
    text-align: center;
    font-size: 12px;
    border-bottom: 1px solid black;
    background-color: #e5e5e5;
}
div.header-flex
{
    padding: 5px;
    font-family: Tahoma;
    font-weight: bold;
    text-align: right;
    font-size: 14px;
    border-bottom: 1px solid black;
    background-color: silver;
    flex-grow: 1;
}
div.artwork
{
    width: 100%;
    border-bottom: 1px solid;
}
img.icon
{
    max-width: 500px;
    max-height: 200px;
    height: auto;
    width:auto;
    margin: 5px;
}
ul
{
    padding-left: 10;
    flex-grow: 1;
}
li
{
    font-size: small;
}
div.info
{
    border-bottom: 1px solid;
    font-size: small;
    padding: 5px;
}
pre
{
    padding-left: 5px;
    padding-right: 5px;
    font-family: Tahoma;
    font-size: small;
    white-space: pre-wrap;
}
</xsl:text>
        </style>
    </xsl:template>
    
    <!-- Body template -->
    <xsl:template name="body">
        <xsl:call-template name="header"/>
        <xsl:for-each select="./tuple">
            <xsl:sort select="substring-before(atom[@name='TitAccessionNo'], '.')" data-type="number"/>
            <xsl:sort select="translate(substring-after(atom[@name='TitAccessionNo'], '.'), '-ABCDEFGHIJKLMNOPQRSTUVWXYZ', '')" data-type="number" />
            <xsl:call-template name="object"/>
            <xsl:if test="position() != last()">
                <p />
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <!-- Header template -->
    <xsl:template name="header">
        <center>
            <img height="100px" src="https://discovernewfields.org/application/files/2315/3911/5304/NewfieldsLogo_leWitt.jpg"/>
            <div style="font-size: 20px; padding-bottom: 5px"><b>Rembrandt to Monet: 500 Years of European Painting</b></div><br/>
        </center>
    </xsl:template>
    
    <!-- Object template -->
    <xsl:template name="object">
        <div class="sheet">
            <div style="display: flex;">
                <div class="header" style="display: flex;"><span style="padding-right: 5px;"><xsl:for-each select="table[@name='Creator1']/tuple"><xsl:if test="atom[@name='CreCreatorAfterFollower'] != ''"><xsl:value-of select="atom[@name='CreCreatorAfterFollower']"/><xsl:text> </xsl:text></xsl:if><xsl:value-of select="atom[@name='NamFullName']"/><xsl:if test="position() != last()">, </xsl:if></xsl:for-each>,</span><i><xsl:value-of select="atom[@name='TitMainTitle']"/></i></div>
                <div class="header-flex"><xsl:value-of select="atom[@name='TitAccessionNo']"/></div>
            </div>
            <div>
                <div class="artwork" style="display: flex;">
                    <img class="icon">
                        <xsl:attribute name="src">
                            <xsl:value-of select="concat('file:///', translate(table/tuple/atom[@name='Multimedia'], '\', '/'))" />
                        </xsl:attribute>
                    </img>
                    <ul style="list-style-type:none;">
                        <li><b>Accession No.: </b><xsl:value-of select="atom[@name='TitAccessionNo']"/></li>
                        <li><b>Title: </b><xsl:value-of select="atom[@name='TitMainTitle']"/></li>
<!-- Creator logic -->
                        <xsl:choose>
                            <xsl:when test="table[@name='Creator1']">
                                <xsl:for-each select="table[@name='Creator1']/tuple">
                        <li><b><xsl:value-of select="atom[@name='CreRole']"/>: </b><xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''"><xsl:value-of select="atom[@name='NamFullName']"/></xsl:when><xsl:when test="atom[@name='UlaName'] != ''"><xsl:value-of select="atom[@name='UlaName']"/></xsl:when><xsl:when test="atom[@name='NamOrganisation'] != ''"><xsl:value-of select="atom[@name='NamOrganisation']"/></xsl:when><xsl:when test="atom[@name='ColCollaborationName']!= ''"><xsl:value-of select="atom[@name='ColCollaborationName']"/></xsl:when></xsl:choose><xsl:choose><xsl:when test="atom[@name='BioNationality'] != '' and atom[@name='BioBirthDate'] != ''"><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioNationality']"/><xsl:text>, </xsl:text><xsl:value-of select="atom[@name='BioBirthDate']"/><xsl:text>-</xsl:text><xsl:value-of select="atom[@name='BioDeathDate']"/><xsl:text>)</xsl:text></xsl:when><xsl:when test="atom[@name='BioNationality'] = '' and atom[@name='BioBirthDate'] != '' and atom[@name='BioDeathDate'] != ''"><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioBirthDate']"/><xsl:text>-</xsl:text><xsl:value-of select="atom[@name='BioDeathDate']"/><xsl:text>)</xsl:text></xsl:when><xsl:when test="atom[@name='BioNationality'] = '' and atom[@name='BioBirthDate'] != '' and atom[@name='BioDeathDate'] = ''"><xsl:text> (b. </xsl:text><xsl:value-of select="atom[@name='BioBirthDate']"/><xsl:text>)</xsl:text></xsl:when></xsl:choose></li>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:when test="table[@name='Creator2']">
                                <xsl:for-each select="table[@name='Creator2']/tuple">
                        <li><xsl:if test="atom[@name='CreCreatorAttribution'] != ''"><xsl:value-of select="atom[@name='CreCreatorAttribution']"/> </xsl:if><xsl:choose><xsl:when test="atom[@name='CreCreationCultureOrPeople'] != ''"><xsl:value-of select="atom[@name='CreCreationCultureOrPeople']"/></xsl:when><xsl:when test="atom[@name='CreCreationNationality2'] != ''"><xsl:value-of select="atom[@name='CreCreationNationality2']"/></xsl:when></xsl:choose></li>
                                </xsl:for-each>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:if test="atom[@name='CreDateCreated'] != ''">
                        <li><b>Date Created: </b><xsl:value-of select="atom[@name='CreDateCreated']"/></li>
                        </xsl:if>
                        <xsl:if test="atom[@name='PhyMediumAndSupport'] != ''">
                        <li><b>Medium and Support: </b><xsl:value-of select="atom[@name='PhyMediumAndSupport']"/></li>
                        </xsl:if>
                        <xsl:choose>
                            <xsl:when test="table[@name='Dimensions']/tuple/atom[@name='PhyHeight'] != ''">
                                <xsl:for-each select="table[@name='Dimensions']/tuple">
                                    <xsl:if test="not(starts-with(atom[@name='PhyType'], 'IMA Number')) and not(contains(atom[@name='PhyType'], 'See')) and not(starts-with(atom[@name='PhyType'], 'This'))">
                                        <li><b><xsl:value-of select="atom[@name='PhyType']"/>: </b><xsl:choose><xsl:when test="atom[@name='PhyHeight'] != '' and atom[@name='PhyWidth'] != '' and atom[@name='PhyDepth'] != ''"><xsl:value-of select="format-number(atom[@name='PhyHeight'], '#######.00')"/> x <xsl:value-of select="format-number(atom[@name='PhyWidth'], '#######.00')"/> x <xsl:value-of select="format-number(atom[@name='PhyDepth'], '#######.00')"/><xsl:text> </xsl:text><xsl:value-of select="atom[@name='PhyUnitLength']"/><xsl:if test="atom[@name='PhyDimensionNotes'] != ''"> - <xsl:value-of select="atom[@name='PhyDimensionNotes']"/></xsl:if></xsl:when><xsl:when test="atom[@name='PhyHeight'] != '' and atom[@name='PhyWidth'] != ''"><xsl:value-of select="format-number(atom[@name='PhyHeight'], '#######.00')"/> x <xsl:value-of select="format-number(atom[@name='PhyWidth'], '#######.00')"/><xsl:text> </xsl:text><xsl:value-of select="atom[@name='PhyUnitLength']"/><xsl:if test="atom[@name='PhyDimensionNotes'] != ''"> - <xsl:value-of select="atom[@name='PhyDimensionNotes']"/></xsl:if></xsl:when><xsl:otherwise>_____ x <xsl:value-of select="format-number(atom[@name='PhyWidth'], '#######.00')"/><xsl:text> </xsl:text><xsl:value-of select="atom[@name='PhyUnitLength']"/><xsl:if test="atom[@name='PhyDimensionNotes'] != ''"> - <xsl:value-of select="atom[@name='PhyDimensionNotes']"/></xsl:if></xsl:otherwise></xsl:choose></li>
                                    </xsl:if>        
                                </xsl:for-each>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:if test="atom[@name='SumCreditLine'] != ''">
                            <li><b>Credit Line: </b><xsl:value-of select="atom[@name='SumCreditLine']"/></li>
                        </xsl:if>
                    </ul>
                </div>
            </div>
            <div class="header2">Value</div>
            <div class="info">
                <xsl:choose><xsl:when test="atom[@name='ValValuationAmount'] != ''"><b>Value: </b>$<xsl:value-of select="format-number(atom[@name='ValValuationAmount'], '###,###,###,###,###.00')"/></xsl:when><xsl:otherwise><span style="color: red;">VALUE MISSING</span></xsl:otherwise></xsl:choose><br/>
                <xsl:choose><xsl:when test="atom[@name='ValDateValued'] != ''"><b>Date Valued: </b><xsl:if test="contains(atom[@name='ValDateValued'], '-01-')"><xsl:text>January </xsl:text><xsl:value-of select="substring(atom[@name='ValDateValued'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='ValDateValued'],1,4)"/>
                </xsl:if>
                    <xsl:if test="contains(atom[@name='ValDateValued'], '-02-')"><xsl:text>February </xsl:text><xsl:value-of select="substring(atom[@name='ValDateValued'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='ValDateValued'],1,4)"/>
                    </xsl:if>
                    <xsl:if test="contains(atom[@name='ValDateValued'], '-03-')"><xsl:text>March </xsl:text><xsl:value-of select="substring(atom[@name='ValDateValued'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='ValDateValued'],1,4)"/>
                    </xsl:if>
                    <xsl:if test="contains(atom[@name='ValDateValued'], '-04-')"><xsl:text>April </xsl:text><xsl:value-of select="substring(atom[@name='ValDateValued'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='ValDateValued'],1,4)"/>
                    </xsl:if>
                    <xsl:if test="contains(atom[@name='ValDateValued'], '-05-')"><xsl:text>May </xsl:text><xsl:value-of select="substring(atom[@name='ValDateValued'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='ValDateValued'],1,4)"/>
                    </xsl:if>
                    <xsl:if test="contains(atom[@name='ValDateValued'], '-06-')"><xsl:text>June </xsl:text><xsl:value-of select="substring(atom[@name='ValDateValued'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='ValDateValued'],1,4)"/>
                    </xsl:if>
                    <xsl:if test="contains(atom[@name='ValDateValued'], '-07-')"><xsl:text>July </xsl:text><xsl:value-of select="substring(atom[@name='ValDateValued'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='ValDateValued'],1,4)"/>
                    </xsl:if>
                    <xsl:if test="contains(atom[@name='ValDateValued'], '-08-')"><xsl:text>August </xsl:text><xsl:value-of select="substring(atom[@name='ValDateValued'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='ValDateValued'],1,4)"/>
                    </xsl:if>
                    <xsl:if test="contains(atom[@name='ValDateValued'], '-09-')"><xsl:text>September </xsl:text><xsl:value-of select="substring(atom[@name='ValDateValued'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='ValDateValued'],1,4)"/>
                    </xsl:if>
                    <xsl:if test="contains(atom[@name='ValDateValued'], '-10-')"><xsl:text>October </xsl:text><xsl:value-of select="substring(atom[@name='ValDateValued'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='ValDateValued'],1,4)"/>
                    </xsl:if>
                    <xsl:if test="contains(atom[@name='ValDateValued'], '-11-')"><xsl:text>November </xsl:text><xsl:value-of select="substring(atom[@name='ValDateValued'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='ValDateValued'],1,4)"/>
                    </xsl:if>
                    <xsl:if test="contains(atom[@name='ValDateValued'], '-12-')"><xsl:text>December </xsl:text><xsl:value-of select="substring(atom[@name='ValDateValued'],9,2)"/><xsl:text>, </xsl:text><xsl:value-of select="substring(atom[@name='ValDateValued'],1,4)"/>
                    </xsl:if></xsl:when><xsl:otherwise><span style="color: red;">DATE VALUED MISSING</span></xsl:otherwise></xsl:choose>
            </div>
            <div class="header2">Provenance</div>
            <div><pre><xsl:value-of select="atom[@name='CreProvenance']"/></pre></div>
        </div>
    </xsl:template>
</xsl:stylesheet>