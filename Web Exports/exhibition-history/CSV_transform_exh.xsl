<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
<xsl:output method="text"/>
    
<xsl:template match="table[@name='eevents']">irn,EventID,Type,Status,Title,Section,Commenced,Completed,Description,Locality,Organizer,Curator,Designer,ObjectIDs
<xsl:for-each select="tuple">
<xsl:value-of select="atom[@name='irn']"/>,<xsl:value-of select="atom[@name='EveEventNumber']"/>,<xsl:value-of select="atom[@name='EveTypeOfEvent']"/>,<xsl:value-of select="atom[@name='EveExhibitionStatus']"/>,"<xsl:value-of select="translate(atom[@name='EveEventTitle'], '&#34;', '&#42;')"/>","<xsl:for-each select="distinct-values(table[@name='ObjEventSection_tab']/tuple/atom[@name='ObjEventSection'])"><xsl:choose><xsl:when test=". != ''"><xsl:value-of select="."/><xsl:if test="position() != last()"><xsl:text> | </xsl:text></xsl:if></xsl:when></xsl:choose></xsl:for-each>",<xsl:value-of select="atom[@name='DatCommencementDate']"/>,<xsl:value-of select="atom[@name='DatCompletionDate']"/>,"<xsl:value-of select="translate(translate(atom[@name='EveEventDescription'], '&#xA;', '\\'), '&#34;', '&#42;')"/>",<xsl:value-of select="atom[@name='EveInternalOrExternalEvent']"/>,"<xsl:for-each select="table[@name='EveEventOrganiserRef_tab']/tuple"><xsl:value-of select="atom[@name='NamOrganisation']"/><xsl:if test="position() != last()"><xsl:text> | </xsl:text></xsl:if></xsl:for-each>","<xsl:for-each select="table[@name='EveCuratorRef_tab']/tuple"><xsl:value-of select="atom[@name='NamFullName']"/><xsl:if test="position() != last()"><xsl:text> | </xsl:text></xsl:if></xsl:for-each>","<xsl:for-each select="table[@name='EveDesignerRef_tab']/tuple"><xsl:value-of select="atom[@name='NamFullName']"/><xsl:if test="position() != last()"><xsl:text> | </xsl:text></xsl:if></xsl:for-each>",<xsl:for-each select="table[@name='Objects']/tuple[atom[@name='irn'] != '']"><xsl:choose><xsl:when test="atom[@name='irn'] != '88034'"><xsl:value-of select="atom[@name='irn']"/><xsl:if test="position() != last()"><xsl:text> | </xsl:text></xsl:if></xsl:when></xsl:choose></xsl:for-each>
<xsl:if test="position() != last()"><xsl:text>
</xsl:text></xsl:if>
</xsl:for-each>
</xsl:template>
    
</xsl:stylesheet>