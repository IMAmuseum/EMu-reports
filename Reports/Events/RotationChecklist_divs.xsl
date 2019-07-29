<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="html"/>
    
    <!-- The root transformation -->
    <xsl:template match="table[@name='eevents']">
        <html>
            <head>
                <title>Rotation Checklist - <xsl:value-of select="tuple/atom[@name='EveEventNumber']"/></title>
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
textarea.request
{
    font-family: Tahoma;
    text-align: center;
    font-size: 13px;
    margin-top: 2px;
    margin-bottom: 5px;
    border: none;
    resize: none;
}
div.sheet
{
    width: 100%;
    background-color: #ffffff;
    border: 2px solid black;
    page-break-inside: avoid;
}
div.header
{
    padding-top: 2px;
    padding-bottom: 2px;
    font-family: Tahoma;
    font-weight: bold;
    text-align: center;
    font-size: 14px;
    border-bottom: 1px solid black;
    border-right: 1px solid black;
}
div.header-flex
{
    padding-top: 2px;
    padding-bottom: 2px;
    font-family: Tahoma;
    font-weight: bold;
    text-align: center;
    font-size: 14px;
    border-bottom: 1px solid;
    border-color: #000000;
    flex-grow: 1;
}
div.artwork
{
    width: 50%;
    border-bottom: 1px solid;
    border-right: 1px solid;
}
img.icon
{
    max-width: 150px;
    max-height: 150px;
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
div.handling
{
    font-size: small;
    border-bottom: 1px solid;
    flex: 1 0;
    padding: 5px;
}
div.condition
{
    font-size: small;
    padding: 5px;
}
<!-- Option 1
div.in-line > div
{
    display: inline-block;
    display: -moz-inline-box;
    display: inline;
    zoom: 1;
    margin-left: 5%;
    width: 32%;
    text-align: center;
}
div.in-line > div:first-child {
    margin-left: 0;
}
-->
<!-- Option 2 -->
div.in-line
{
    display: flex;
    justify-content: space-between;
}
pre
{
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
        <xsl:for-each select="tuple/table[@name='Objects']/tuple">
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
            <b>Rotation Checklist</b><br/>
            <xsl:value-of select="tuple/atom[@name='EveEventNumber']"/> - <xsl:value-of select="tuple/atom[@name='EveEventTitle']"/><br/>
            <textarea class="request" rows="1" cols="75">Requested by: </textarea>
        </center>
    </xsl:template>
    
    <!-- Object template -->
    <xsl:template name="object">
        <div class="sheet">
            <div style="display: flex;">
                <div class="header" style="width: 50%;">Artwork Information</div>
                <div class="header-flex">Display Details</div>
            </div>
            <div style="display: flex;">
                <div class="artwork" style="display: flex;">
                    <img class="icon">
                        <xsl:attribute name="src">
                            <xsl:value-of select="concat('file:///', translate(table/tuple/atom[@name='Multimedia'], '\', '/'))" />
                        </xsl:attribute>
                    </img>
                    <ul style="list-style-type:none;">
                        <xsl:if test="contains(translate(atom[@name='ObjAttachedObjectsNotes'], 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'install') and not(contains(translate(atom[@name='ObjAttachedObjectsNotes'], 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'deinstall'))">
                        <li><b>_<u>X</u>_ Install</b></li>
                        <li><b>___ Deinstall</b></li>
                        <li><b>___ Move in Gallery</b></li>
                        </xsl:if>
                        <xsl:if test="contains(translate(atom[@name='ObjAttachedObjectsNotes'], 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'deinstall')">
                        <li><b>___ Install</b></li>
                        <li><b>_<u>X</u>_ Deinstall</b></li>
                        <li><b>___ Move in Gallery</b></li>
                        </xsl:if>
                        <xsl:if test="contains(translate(atom[@name='ObjAttachedObjectsNotes'], 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'shift')">
                        <li><b>___ Install</b></li>
                        <li><b>___ Deinstall</b></li>
                        <li><b>_<u>X</u>_ Move in Gallery</b></li>
                        </xsl:if>
                        <br/>
                        <li><b>Accession No.: </b><xsl:value-of select="atom[@name='TitAccessionNo']"/></li>
                        <li><b>Location: </b><xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLocationCode']"/></li>
                        <li><b>Title: </b><xsl:value-of select="atom[@name='TitMainTitle']"/></li>
<!-- Creator logic -->
                        <xsl:choose>
                            <xsl:when test="table[@name='Creator1']">
                                <xsl:for-each select="table[@name='Creator1']/tuple">
                        <li><b><xsl:value-of select="atom[@name='CreRole']"/>: </b><xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''"><xsl:value-of select="atom[@name='NamFullName']"/></xsl:when><xsl:when test="atom[@name='UlaName'] != ''"><xsl:value-of select="atom[@name='UlaName']"/></xsl:when><xsl:when test="atom[@name='NamOrganisation'] != ''"><xsl:value-of select="atom[@name='NamOrganisation']"/></xsl:when><xsl:when test="atom[@name='ColCollaborationName']!= ''"><xsl:value-of select="atom[@name='ColCollaborationName']"/></xsl:when></xsl:choose></li>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:when test="table[@name='Creator2']">
                                <xsl:for-each select="table[@name='Creator2']/tuple">
                        <li><xsl:if test="atom[@name='CreCreatorAttribution'] != ''"><xsl:value-of select="atom[@name='CreCreatorAttribution']"/> </xsl:if><xsl:choose><xsl:when test="atom[@name='CreCreationCultureOrPeople'] != ''"><xsl:value-of select="atom[@name='CreCreationCultureOrPeople']"/></xsl:when><xsl:when test="atom[@name='CreCreationNationality2'] != ''"><xsl:value-of select="atom[@name='CreCreationNationality2']"/></xsl:when></xsl:choose></li>
                                </xsl:for-each>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:if test="atom[@name='CreDateCreated'] = '' and atom[@name='CreDateDesigned'] = ''">
                        <li><b><span style="color: red;">DATE NEEDED</span></b></li>
                        </xsl:if>
                        <xsl:if test="atom[@name='CreDateCreated'] != ''">
                        <li><b>Date Created: </b><xsl:value-of select="atom[@name='CreDateCreated']"/></li>
                        </xsl:if>
                        <xsl:if test="atom[@name='CreDateDesigned'] != ''">
                        <li><b>Date Designed: </b><xsl:value-of select="atom[@name='CreDateDesigned']"/></li>
                        </xsl:if>
                        <xsl:if test="atom[@name='PhyMediumAndSupport'] != ''">
                        <li><b>Medium and Support: </b><xsl:value-of select="atom[@name='PhyMediumAndSupport']"/></li>
                        </xsl:if>
                        <xsl:if test="atom[@name='PhyConvertedDims'] != ''">
                        <li><b>Dimensions: </b><xsl:value-of select="atom[@name='PhyConvertedDims']"/></li>
                        </xsl:if>
                        <xsl:if test="atom[@name='StaStockTakeStatus'] != ''">
                        <li><b>Collection Ranking: </b><xsl:value-of select="atom[@name='StaStockTakeStatus']"/></li>
                        </xsl:if>
                    </ul>
                </div>
                <div class="handling">
                    <div>
                        <b>Max Lux: </b><xsl:value-of select="atom[@name='ConDispMaxLight']"/><br/>
                        <b>Max Length of Display: </b><xsl:value-of select="atom[@name='ConDispGenLight']"/><xsl:if test="atom[@name='IllExposurePeriod'] != ''"> - <xsl:value-of select="atom[@name='IllExposurePeriod']"/><xsl:text> </xsl:text><xsl:value-of select="atom[@name='IllExposurePeriodType']"/></xsl:if><br/><br/>
                        <b>Installation Instructions: </b><xsl:value-of select="atom[@name='ConDispOtherInstructions']"/><br/><br/>
                        <b>Handling Instructions: </b><xsl:value-of select="atom[@name='ConHandlingInstructions']"/>
                    </div>
                </div>
            </div>
            <div class="header" style="border-right: none;">Condition Details</div>
            <div class="condition">
                <div class="in-line">
                    <xsl:choose>
                        <xsl:when test="atom[@name='ConConditionStatus'] != '' or atom[@name='ConCheckedByRef'] != '' or atom[@name='ConDateChecked'] != ''">
                    <div><b>Condition Status: </b>__<u><xsl:value-of select="atom[@name='ConConditionStatus']"/></u>__</div>
                    <div><b>Examined By: </b>__<u><xsl:value-of select="tuple[@name='ConCheckedByRef']/atom[@name='NamFullName']"/></u>__</div>
                    <div><b>Date: </b>__<u><xsl:value-of select="atom[@name='ConDateChecked']"/></u>__</div>
                        </xsl:when>
                        <xsl:otherwise><div>No examination details available.</div></xsl:otherwise>
                    </xsl:choose>
                </div>
                <br/>
                <xsl:choose>
                    <xsl:when test="contains(atom[@name='ConConditionDetails'], 'Treatment Needed:')">
                <div>
                    <b>Treatment Needed: </b><xsl:if test="contains(atom[@name='ConConditionDetails'], 'Treatment Needed: Y')">_____ No __<u>X</u>__ Yes<br/>
                    <b>Timeframe: </b><xsl:value-of select="substring-before(substring-after(atom[@name='ConConditionDetails'], 'Timeframe: '), 'Condition Details')"/><br/>
                    <b>Treatment to be Done: </b><xsl:value-of select="substring-before(substring-after(atom[@name='ConConditionDetails'], 'Treatment to be Done: '), 'Timeframe')"/></xsl:if><xsl:if test="contains(atom[@name='ConConditionDetails'], 'Treatment Needed: N')">__<u>X</u>__ No _____ Yes</xsl:if>
                    <br/><br/>
                    <b>Condition Details: </b><br/><pre>
                    <xsl:value-of select="substring-after(atom[@name='ConConditionDetails'], 'Condition Details: ')"/></pre>
                </div>
                    </xsl:when>
                    <xsl:otherwise><div><span style="color: red;">Structured condition details not available.</span><xsl:if test="atom[@name='ConConditionDetails'] != ''"><br/><br/><b>Condition Details entered as:</b><br/><pre><xsl:value-of select="atom[@name='ConConditionDetails']"/></pre></xsl:if></div></xsl:otherwise>
                </xsl:choose>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>