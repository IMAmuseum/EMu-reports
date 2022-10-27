<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text"/>

<xsl:template match="/">{"locations": [
    <xsl:for-each select="table[@name='elocations']/tuple"><xsl:sort select="atom[@name='irn']" data-type="number"/>{
        "irn": <xsl:value-of select="atom[@name='irn']"/>,
        "publish": <xsl:choose><xsl:when test="atom[@name='AdmPublishWebNoPassword'] = 'Yes'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose>,
        "location_code": <xsl:choose><xsl:when test="atom[@name='LocLocationCode'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='LocLocationCode'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "level_1": <xsl:choose><xsl:when test="atom[@name='LocLevel1'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='LocLevel1'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "level_2": <xsl:choose><xsl:when test="atom[@name='LocLevel2'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='LocLevel2'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "level_3": <xsl:choose><xsl:when test="atom[@name='LocLevel3'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='LocLevel3'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "level_4": <xsl:choose><xsl:when test="atom[@name='LocLevel4'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='LocLevel4'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "level_5": <xsl:choose><xsl:when test="atom[@name='LocLevel5'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='LocLevel5'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "level_6": <xsl:choose><xsl:when test="atom[@name='LocLevel6'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='LocLevel6'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "level_7": <xsl:choose><xsl:when test="atom[@name='LocLevel7'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='LocLevel7'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "level_8": <xsl:choose><xsl:when test="atom[@name='LocLevel8'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='LocLevel8'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "date_modified": "<xsl:value-of select="atom[@name='AdmDateModified']"/>"
    }<xsl:if test="position() != last()">,
    </xsl:if></xsl:for-each>]
}</xsl:template>

</xsl:stylesheet>