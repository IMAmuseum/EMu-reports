<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:emu="http://kesoftware.com/emu"
    xmlns:date="http://exslt.org/dates-and-times">
    
    <xsl:output method="text"/>
    
    <xsl:template match="/">
irn,Name,Birthdate,Deathdate,EntersPublicDomain
<xsl:for-each select="table[@name='ecatalogue']/tuple/table[@name='Creators']/tuple">
    
</xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>