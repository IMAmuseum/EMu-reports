<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text"/>
    
<xsl:template match="/">{"narratives": [
    <xsl:for-each select="table[@name='enarratives']/tuple[atom[@name='NarNarrative'] != '']"><xsl:sort select="atom[@name='irn']" data-type="number"/>{
        "emu_irn": <xsl:value-of select="atom[@name='irn']"/>,
        "publish": <xsl:choose><xsl:when test="atom[@name='AdmPublishWebNoPassword'] = 'Yes'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose>,
        "title": "<xsl:choose><xsl:when test="normalize-space(atom[@name='NarTitle']) != ''"><xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='NarTitle']"/></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>",
        "purpose": <xsl:choose><xsl:when test="normalize-space(atom[@name='DesPurpose']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='DesPurpose']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "date_year": <xsl:choose><xsl:when test="string-length(table[@name='NarDate0']/tuple[1]/atom[@name='NarDate']) = 4"><xsl:value-of select="table[@name='NarDate0']/tuple[1]/atom[@name='NarDate']"/></xsl:when><xsl:when test="string-length(table[@name='NarDate0']/tuple[1]/atom[@name='NarDate']) = 7"><xsl:value-of select="substring-before(table[@name='NarDate0']/tuple[1]/atom[@name='NarDate'], '-')"/></xsl:when><xsl:when test="string-length(table[@name='NarDate0']/tuple[1]/atom[@name='NarDate']) = 10"><xsl:value-of select="substring-before(table[@name='NarDate0']/tuple[1]/atom[@name='NarDate'], '-')"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "date_month": <xsl:choose><xsl:when test="string-length(table[@name='NarDate0']/tuple[1]/atom[@name='NarDate']) = 4">null</xsl:when><xsl:when test="string-length(table[@name='NarDate0']/tuple[1]/atom[@name='NarDate']) = 7"><xsl:value-of select="number(substring-after(table[@name='NarDate0']/tuple[1]/atom[@name='NarDate'], '-'))"/></xsl:when><xsl:when test="string-length(table[@name='NarDate0']/tuple[1]/atom[@name='NarDate']) = 10"><xsl:value-of select="number(substring-before(substring-after(table[@name='NarDate0']/tuple[1]/atom[@name='NarDate'], '-'),'-'))"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "date_day": <xsl:choose><xsl:when test="string-length(table[@name='NarDate0']/tuple[1]/atom[@name='NarDate']) = 4">null</xsl:when><xsl:when test="string-length(table[@name='NarDate0']/tuple[1]/atom[@name='NarDate']) = 7">null</xsl:when><xsl:when test="string-length(table[@name='NarDate0']/tuple[1]/atom[@name='NarDate']) = 10"><xsl:value-of select="number(substring-after(substring-after(table[@name='NarDate0']/tuple[1]/atom[@name='NarDate'], '-'), '-'))"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "narrative": <xsl:choose><xsl:when test="normalize-space(atom[@name='NarNarrative']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='NarNarrative']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "author_irns": [<xsl:for-each select="table[@name='authors']/tuple[atom[@name='irn'] != '']"><xsl:value-of select="atom[@name='irn']"/><xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "objects": [<xsl:for-each select="table[@name='objects']/tuple[atom[@name='irn'] != '']"><xsl:value-of select="atom[@name='irn']"/><xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "event_irns": [<xsl:for-each select="table[@name='events']/tuple[atom[@name='irn'] != '' and (contains(atom[@name='EveTypeOfEvent'], 'Exhibition') or contains(atom[@name='EveTypeOfEvent'], 'Outgoing Loan'))]"><xsl:value-of select="atom[@name='irn']"/><xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "party_irns": [<xsl:for-each select="table[@name='parties']/tuple[atom[@name='irn'] != '']"><xsl:value-of select="atom[@name='irn']"/><xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "date_modified": "<xsl:value-of select="atom[@name='AdmDateModified']"/>"
    }<xsl:if test="position() != last()">,
    </xsl:if>
    </xsl:for-each>]
}</xsl:template>

<xsl:template name="escape_characters">
    <xsl:param name="input_string"/>
    <xsl:value-of select="normalize-space(replace(replace(replace(replace($input_string, '\&#92;', '\&#92;\&#92;'), '\n', '\\n'), '&quot;', '\\&quot;'), '&#09;', '\\t'))"/>
</xsl:template>
    
</xsl:stylesheet>
