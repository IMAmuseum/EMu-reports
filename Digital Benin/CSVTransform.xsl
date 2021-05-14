<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">

<xsl:output method="text"/>
    
<xsl:template match="table[@name = 'ecatalogue']">
IRN,Accession Number,Previous Number(s),Accession Date,Number of Parts,Title,Object Type,Date Created,Culture or People,Creation Location,Medium,Support,Materials,Dimensions,Credit Line,Rights,Provenance,URL
    <xsl:for-each select="tuple">"<xsl:value-of select="atom[@name='irn']"/>","<xsl:value-of select="atom[@name='TitAccessionNo']"/>","<xsl:value-of select="atom[@name='TitPreviousAccessionNo']"/>","<xsl:value-of select="atom[@name='TitAccessionDate']"/>",<xsl:value-of select="atom[@name='TitNumberOfParts']"/>,"<xsl:value-of select="atom[@name='TitMainTitle']"/>","<xsl:for-each select="table[@name='ObjectTypes']/tuple"><xsl:value-of select="atom[@name='PhyMediaCategory']"/><xsl:if test="position() != last()">; </xsl:if></xsl:for-each>","<xsl:value-of select="atom[@name='CreDateCreated']"/>","<xsl:for-each select="table[@name='Creator2']/tuple"><xsl:value-of select="atom[@name='CreCreationCultureOrPeople']"/><xsl:if test="position() != last()">; </xsl:if></xsl:for-each>","<xsl:value-of select="table[@name='CreLocation']/tuple/atom[@name='CreCountry']"/>","<xsl:for-each select="table[@name='Medium']/tuple"><xsl:value-of select="atom[@name='PhyMedium']"/><xsl:if test="position() != last()">; </xsl:if></xsl:for-each>","<xsl:for-each select="table[@name='Support']/tuple"><xsl:value-of select="atom[@name='PhySupport']"/><xsl:if test="position() != last()">; </xsl:if></xsl:for-each>","<xsl:value-of select="atom[@name='PhyMediumAndSupport']"/>","<xsl:value-of select="atom[@name='PhyConvertedDims']"/>","<xsl:value-of select="atom[@name='SumCreditLine']"/>","<xsl:value-of select="table[@name='Rights']/tuple/atom[@name='RigAcknowledgement']"/>","<xsl:value-of select="atom[@name='CreProvenance']"/>","<xsl:for-each select="table[@name='Homepage']/tuple"><xsl:if test="atom[@name='EleIdentifier'] != ''"> http://collection.imamuseum.org/artwork/<xsl:value-of select="atom[@name='EleIdentifier']"/>/</xsl:if></xsl:for-each>"
</xsl:for-each>

</xsl:template>

</xsl:stylesheet>