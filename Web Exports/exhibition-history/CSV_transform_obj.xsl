<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
<xsl:output method="text"/>
    
<xsl:template match="table[@name='eevents']">irn,LegalStatus,AccessionNo,Title,Creators,Culture,RecordType,MediumSupport,CreditLine,SummaryData,Publish,DagwoodID
<xsl:for-each select="tuple/table[@name='Objects']/tuple[distinct-values(atom[@name='irn'])]">
<xsl:sort select="atom[@name='irn']"/>
<xsl:if test="atom[@name='irn'] != '88034' and atom[@name='irn'] != '94527' and atom[@name='irn'] != ''">"<xsl:value-of select="atom[@name='irn']"/>","<xsl:value-of select="translate(atom[@name='TitObjectStatus'], '&#34;', '&#42;')"/>","<xsl:value-of select="translate(atom[@name='TitAccessionNo'], '&#34;', '&#42;')"/>","<xsl:value-of select="translate(atom[@name='TitMainTitle'], '&#34;', '&#42;')"/>","<xsl:for-each select="table[@name='Creator']/tuple"><xsl:choose><xsl:when test="atom[@name='CreRole'] != ''"><xsl:value-of select="translate(atom[@name='CreRole'], '&#34;', '&#42;')"/><xsl:text>: </xsl:text></xsl:when><xsl:otherwise><xsl:text>Creator: </xsl:text></xsl:otherwise></xsl:choose><xsl:value-of select="translate(atom[@name='NamFullName'], '&#34;', '&#42;')"/><xsl:choose><xsl:when test="atom[@name='BioNationality'] != '' and atom[@name='BioBirthDate'] != ''"><xsl:text> (</xsl:text><xsl:value-of select="translate(atom[@name='BioNationality'], '&#34;', '&#42;')"/><xsl:text>, </xsl:text><xsl:value-of select="atom[@name='BioBirthDate']"/><xsl:text> - </xsl:text><xsl:value-of select="atom[@name='BioDeathDate']"/><xsl:text>)</xsl:text></xsl:when><xsl:when test="atom[@name='BioNationality'] != '' and atom[@name='BioBirthDate'] = ''"><xsl:text> (</xsl:text><xsl:value-of select="translate(atom[@name='BioNationality'], '&#34;', '&#42;')"/><xsl:text>)</xsl:text></xsl:when></xsl:choose><xsl:if test="position() != last()"><xsl:text>\\</xsl:text></xsl:if></xsl:for-each>","<xsl:for-each select="table[@name='Culture']/tuple"><xsl:if test="atom[@name='CreCreatorAttribution'] != ''"><xsl:value-of select="translate(atom[@name='CreCreatorAttribution'], '&#34;', '&#42;')"/><xsl:text> </xsl:text></xsl:if><xsl:value-of select="translate(atom[@name='CreCreationNationality'], '&#34;', '&#42;')"/><xsl:value-of select="translate(atom[@name='CreCreationCultureOrPeople'], '&#34;', '&#42;')"/><xsl:if test="position() != last()"><xsl:text>\\</xsl:text></xsl:if></xsl:for-each>","<xsl:value-of select="translate(atom[@name='TitObjectType'], '&#34;', '&#42;')"/>","<xsl:value-of select="translate(translate(atom[@name='PhyMediumAndSupport'], '&#34;', '&#42;'), '&#xA;', '\\')"/>","<xsl:value-of select="translate(translate(atom[@name='SumCreditLine'], '&#34;', '&#42;'), '&#xA;', '\\')"/>","<xsl:value-of select="translate(atom[@name='SummaryData'], '&#34;', '&#42;')"/>",<xsl:value-of select="atom[@name='AdmPublishWebNoPassword']"/>,<xsl:for-each select="table[@name='Dagwood']/tuple[atom[@name='EleIdentifier'] != '']"><xsl:value-of select="atom[@name='EleIdentifier']"/></xsl:for-each><xsl:if test="position() != last()"><xsl:text>
</xsl:text></xsl:if></xsl:if>
</xsl:for-each>
</xsl:template>

</xsl:stylesheet>