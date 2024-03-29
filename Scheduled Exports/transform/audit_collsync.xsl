<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text"/>

<xsl:template match="/">{"deleted_records": [
    <xsl:variable name="todaysdate" select="current-date()"/>
    <xsl:for-each select="table[@name='eaudit']/tuple"><xsl:sort select="atom[@name='AudDate']" data-type="text"/>{
        "operation": "<xsl:value-of select="atom[@name='AudOperation']"/>",
        "module": "<xsl:value-of select="atom[@name='AudTable']"/>",
        "record_irn": <xsl:value-of select="atom[@name='AudKey']"/>,
        "date_deleted": "<xsl:value-of select="atom[@name='AudDate']"/>"
    }<xsl:if test="position() != last()">,
    </xsl:if></xsl:for-each>]
}</xsl:template>

</xsl:stylesheet>
