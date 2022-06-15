<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text"/>
    
<xsl:template match="/">{"narratives": [
    <xsl:for-each select="table[@name='enarratives']/tuple"><xsl:sort select="atom[@name='irn']" data-type="number"/>{
        "irn": <xsl:value-of select="atom[@name='irn']"/>,
        "publish": <xsl:choose><xsl:when test="atom[@name='AdmPublishWebNoPassword'] = 'Yes'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose>,
        "title": "<xsl:choose><xsl:when test="atom[@name='NarTitle'] != ''"><xsl:value-of select="replace(replace(atom[@name='NarTitle'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>",
        "purpose": <xsl:choose><xsl:when test="atom[@name='DesPurpose'] != ''">"<xsl:value-of select="replace(replace(atom[@name='DesPurpose'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "date": <xsl:choose><xsl:when test="table[@name='NarDate0']/tuple[1]/atom[@name='NarDate'] != ''">"<xsl:value-of select="table[@name='NarDate0']/tuple[1]/atom[@name='NarDate']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "narrative": <xsl:choose><xsl:when test="atom[@name='NarNarrative'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='NarNarrative'], '\n', '\\n'), '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "authors": [<xsl:for-each select="table[@name='authors']/tuple[atom[@name='irn'] != '' and atom[@name='AdmDateModified'] != '']">
            {
                "irn": <xsl:value-of select="atom[@name='irn']"/>,
                "dateModified": "<xsl:value-of select="atom[@name='AdmDateModified']"/>"
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
        "objects": [<xsl:for-each select="table[@name='objects']/tuple[atom[@name='irn'] != '' and atom[@name='AdmDateModified'] != '']">
            {
                "irn": <xsl:value-of select="atom[@name='irn']"/>,
                "dateModified": "<xsl:value-of select="atom[@name='AdmDateModified']"/>"
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
        "events": [<xsl:for-each select="table[@name='events']/tuple[atom[@name='irn'] != '' and atom[@name='AdmDateModified'] != '']">
            {
                "irn": <xsl:value-of select="atom[@name='irn']"/>,
                "dateModified": "<xsl:value-of select="atom[@name='AdmDateModified']"/>"
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
        "parties": [<xsl:for-each select="table[@name='parties']/tuple[atom[@name='irn'] != '' and atom[@name='AdmDateModified'] != '']">
            {
                "irn": <xsl:value-of select="atom[@name='irn']"/>,
                "dateModified": "<xsl:value-of select="atom[@name='AdmDateModified']"/>"
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
        "dateModified": "<xsl:value-of select="atom[@name='AdmDateModified']"/>"
    }<xsl:if test="position() != last()">,
    </xsl:if>
    </xsl:for-each>]
}</xsl:template>
    
</xsl:stylesheet>