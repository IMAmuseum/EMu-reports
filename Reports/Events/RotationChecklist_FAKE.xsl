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
table.sheet
{
    width: 100%;
    border-collapse: collapse;
    background-color: #ffffff;
    border-color: #000000;
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
td.header
{
    font-family: Tahoma;
    font-weight: bold;
    text-align: center;
    font-size: 14px;
    width: 50%;
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
    margin-left: 0px; 
    margin-right: 0px;
}
img.icon
{
    max-width:100%;
    max-height:300px;
    height: auto;
    width:auto;
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
pre
{
   font-family: "Tahoma";
   font-size: 15px;
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
<table border="2" class="sheet">
    <tr class="header">
        <td class="header">Artwork Information</td>
        <td class="header">Display Details</td>
    </tr>
    <tr>
        <td class="artwork">
    <tr class="image">
        <td class="image">

<!-- Image -->
            <table class="picture">
                <tr class="picture">
                    <xsl:choose>
                        <xsl:when test="table[@name='MulMultiMediaRef_tab']/tuple/atom[@name='Multimedia']">
                            <td class="picture">
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
                    </td>
                </tr>
            </table>
<!-- Object info -->

        </td>
    </tr>
        </td>
    </tr>
</table>
</xsl:template>
</xsl:stylesheet>