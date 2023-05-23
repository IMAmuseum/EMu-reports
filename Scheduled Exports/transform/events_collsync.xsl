<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text"/>

<xsl:template match="/">{"events": [
    <xsl:for-each select="table[@name='eevents']/tuple"><xsl:sort select="atom[@name='irn']" data-type="number"/>{
        "irn": <xsl:value-of select="atom[@name='irn']"/>,
        "publish": <xsl:choose><xsl:when test="atom[@name='AdmPublishWebNoPassword'] = 'Yes'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose>,
        "event_number": <xsl:choose><xsl:when test="normalize-space(atom[@name='EveEventNumber']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='EveEventNumber']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "type": <xsl:choose><xsl:when test="normalize-space(atom[@name='EveTypeOfEvent']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='EveTypeOfEvent']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "status": <xsl:choose><xsl:when test="normalize-space(atom[@name='EveExhibitionStatus']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='EveExhibitionStatus']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "title": <xsl:choose><xsl:when test="normalize-space(atom[@name='EveEventTitle']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='EveEventTitle']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "description": <xsl:choose><xsl:when test="normalize-space(atom[@name='EveEventDescription']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='EveEventDescription']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "locality": <xsl:choose><xsl:when test="normalize-space(atom[@name='EveInternalOrExternalEvent']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='EveInternalOrExternalEvent']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "parent_event": <xsl:choose><xsl:when test="table[@name='MasterEvent']/tuple[1]/tuple/atom[@name='irn'] != ''"><xsl:value-of select="table[@name='MasterEvent']/tuple[1]/tuple/atom[@name='irn']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "organizers": [<xsl:for-each select="table[@name='Organizer']/tuple[atom[@name='irn'] != '']"><xsl:value-of select="atom[@name='irn']"/><xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "venues": [<xsl:for-each select="table[@name='Venues']/tuple[atom[@name='irn'] != '']">
            {
                "irn": <xsl:value-of select="atom[@name='irn']"/>,
                "commencement_date_year": <xsl:choose><xsl:when test="string-length(atom[@name='VenVenueCommencementDate']) = 4"><xsl:value-of select="atom[@name='VenVenueCommencementDate']"/></xsl:when><xsl:when test="string-length(atom[@name='VenVenueCommencementDate']) = 7"><xsl:value-of select="substring-before(atom[@name='VenVenueCommencementDate'], '-')"/></xsl:when><xsl:when test="string-length(atom[@name='VenVenueCommencementDate']) = 10"><xsl:value-of select="substring-before(atom[@name='VenVenueCommencementDate'], '-')"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "commencement_date_month": <xsl:choose><xsl:when test="string-length(atom[@name='VenVenueCommencementDate']) = 4">null</xsl:when><xsl:when test="string-length(atom[@name='VenVenueCommencementDate']) = 7"><xsl:value-of select="number(substring-after(atom[@name='VenVenueCommencementDate'], '-'))"/></xsl:when><xsl:when test="string-length(atom[@name='VenVenueCommencementDate']) = 10"><xsl:value-of select="number(substring-before(substring-after(atom[@name='VenVenueCommencementDate'], '-'),'-'))"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "commencement_date_day": <xsl:choose><xsl:when test="string-length(atom[@name='VenVenueCommencementDate']) = 4">null</xsl:when><xsl:when test="string-length(atom[@name='VenVenueCommencementDate']) = 7">null</xsl:when><xsl:when test="string-length(atom[@name='VenVenueCommencementDate']) = 10"><xsl:value-of select="number(substring-after(substring-after(atom[@name='VenVenueCompletionDate'], '-'), '-'))"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "completion_date_year": <xsl:choose><xsl:when test="string-length(atom[@name='VenVenueCompletionDate']) = 4"><xsl:value-of select="atom[@name='VenVenueCompletionDate']"/></xsl:when><xsl:when test="string-length(atom[@name='VenVenueCompletionDate']) = 7"><xsl:value-of select="substring-before(atom[@name='VenVenueCompletionDate'], '-')"/></xsl:when><xsl:when test="string-length(atom[@name='VenVenueCompletionDate']) = 10"><xsl:value-of select="substring-before(atom[@name='VenVenueCompletionDate'], '-')"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "completion_date_month": <xsl:choose><xsl:when test="string-length(atom[@name='VenVenueComletionDate']) = 4">null</xsl:when><xsl:when test="string-length(atom[@name='VenVenueCompletionDate']) = 7"><xsl:value-of select="number(substring-after(atom[@name='VenVenueCompletionDate'], '-'))"/></xsl:when><xsl:when test="string-length(atom[@name='VenVenueCompletionDate']) = 10"><xsl:value-of select="number(substring-before(substring-after(atom[@name='VenVenueCompletionDate'], '-'),'-'))"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "completion_date_day": <xsl:choose><xsl:when test="string-length(atom[@name='VenVenueCompletionDate']) = 4">null</xsl:when><xsl:when test="string-length(atom[@name='VenVenueCompletionDate']) = 7">null</xsl:when><xsl:when test="string-length(atom[@name='VenVenueCompletionDate']) = 10"><xsl:value-of select="number(substring-after(substring-after(atom[@name='VenVenueCompletionDate'], '-'), '-'))"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
        "curators": [<xsl:for-each select="table[@name='Curator']/tuple[atom[@name='irn'] != '']"><xsl:value-of select="atom[@name='irn']"/><xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "designers": [<xsl:for-each select="table[@name='Designer']/tuple[atom[@name='irn'] != '']"><xsl:value-of select="atom[@name='irn']"/><xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "objects": [<xsl:for-each select="table[@name='Objects']/tuple[atom[@name='irn'] != '' and atom[@name='irn'] != '88034']"><xsl:value-of select="atom[@name='irn']"/><xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "record_status": <xsl:choose><xsl:when test="normalize-space(atom[@name='SecRecordStatus']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='SecRecordStatus']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "date_modified": "<xsl:value-of select="atom[@name='AdmDateModified']"/>"
    }<xsl:if test="position() != last()">,
    </xsl:if></xsl:for-each>]
}</xsl:template>

<xsl:template name="escape_characters">
    <xsl:param name="input_string"/>
    <xsl:value-of select="normalize-space(replace(replace(replace(replace($input_string, '\&#92;', '\&#92;\&#92;'), '\n', '\\n'), '&quot;', '\\&quot;'), '&#09;', '\\t'))"/>
</xsl:template>

</xsl:stylesheet>