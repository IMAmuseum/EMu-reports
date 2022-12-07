<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text"/>
    
<xsl:template match="/">{"parties": [
    <xsl:for-each select="table[@name='eparties']/tuple"><xsl:sort select="atom[@name='irn']" data-type="number"/>{
        "emu_irn": <xsl:value-of select="atom[@name='irn']"/>,
        "publish": <xsl:choose><xsl:when test="atom[@name='AdmPublishWebNoPassword'] = 'Yes'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose>,
        "party_type": <xsl:choose><xsl:when test="normalize-space(atom[@name='NamPartyType']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='NamPartyType']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "full_name": <xsl:choose><xsl:when test="normalize-space(atom[@name='NamFullName']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='NamFullName']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "title": <xsl:choose><xsl:when test="normalize-space(atom[@name='NamTitle']) !=''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='NamTitle']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "first_name": <xsl:choose><xsl:when test="normalize-space(atom[@name='NamFirst']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='NamFirst']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "middle_name": <xsl:choose><xsl:when test="normalize-space(atom[@name='NamMiddle']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='NamMiddle']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "last_name": <xsl:choose><xsl:when test="normalize-space(atom[@name='NamLast']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='NamLast']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "suffix": <xsl:choose><xsl:when test="normalize-space(atom[@name='NamSuffix']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='NamSuffix']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "gender": <xsl:choose><xsl:when test="normalize-space(atom[@name='NamSex']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='NamSex']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "nationality": <xsl:choose><xsl:when test="normalize-space(atom[@name='BioNationality']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='BioNationality']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "identities": [<xsl:for-each select="table[@name='Identities']/tuple[atom[@name='BioCulturalInfluences'] != '']">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='BioCulturalInfluences']"/></xsl:with-param></xsl:call-template>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "birth_date": <xsl:choose><xsl:when test="normalize-space(atom[@name='BioBirthDate']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='BioBirthDate']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "birth_place": <xsl:choose><xsl:when test="normalize-space(atom[@name='BioBirthPlace']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='BioBirthPlace']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "death_date": <xsl:choose><xsl:when test="normalize-space(atom[@name='BioDeathDate']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='BioDeathDate']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "death_place": <xsl:choose><xsl:when test="normalize-space(atom[@name='BioDeathPlace']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='BioDeathPlace']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "organization_name": <xsl:choose><xsl:when test="normalize-space(atom[@name='NamOrganisation']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='NamOrganisation']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "commencement_date": <xsl:choose><xsl:when test="normalize-space(atom[@name='IMAHisCommenced']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='IMAHisCommenced']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "completion_date": <xsl:choose><xsl:when test="normalize-space(atom[@name='IMAHisCompleted']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='IMAHisCompleted']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "collaboration_name": <xsl:choose><xsl:when test="normalize-space(atom[@name='ColCollaborationName']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='ColCollaborationName']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "collaborators": [<xsl:for-each select="table[@name='Collaborators']/tuple[atom[@name='irn'] != '']">
            {
                "collaboration_role": <xsl:choose><xsl:when test="normalize-space(atom[@name='ColRole']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='ColRole']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "collaborator_irn": <xsl:value-of select="atom[@name='irn']"/>
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
        "acronym": <xsl:choose><xsl:when test="normalize-space(atom[@name='NamOrganisationAcronym']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='NamOrganisationAcronym']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "other_names": [<xsl:choose><xsl:when test="table[@name='OtherPersonNames'] and table[@name='OtherOrgNames']">null</xsl:when><xsl:when test="table[@name='OtherPersonNames']"><xsl:for-each select="table[@name='OtherPersonNames']/tuple[normalize-space(atom[@name='NamOtherNames']) != '']">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='NamOtherNames']"/></xsl:with-param></xsl:call-template>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each></xsl:when><xsl:when test="table[@name='OtherOrgNames']/tuple"><xsl:for-each select="table[@name='OtherOrgNames']/tuple[normalize-space(atom[@name='NamOrganisationOtherNames']) != '']">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="replace(replace(atom[@name='NamOrganisationOtherNames'], '&quot;', '\\&quot;'), '&#09;', '\\t')"/></xsl:with-param></xsl:call-template>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each></xsl:when></xsl:choose>],
        "roles": [<xsl:for-each select="table[@name='Roles']/tuple[normalize-space(atom[@name='NamRoles']) != '']">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='NamRoles']"/></xsl:with-param></xsl:call-template>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "guids": [<xsl:for-each select="table[@name='GUIDs']/tuple[normalize-space(atom[@name='AdmGUIDType']) != '' and normalize-space(atom[@name='AdmGUIDValue']) != '']">
            {
                "preferred": <xsl:choose><xsl:when test="atom[@name='AdmGUIDIsPreferred'] = 'Yes'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose>,
                "type": "<xsl:value-of select="atom[@name='AdmGUIDType']"/>",
                "guid": "<xsl:value-of select="atom[@name='AdmGUIDValue']"/>"
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
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