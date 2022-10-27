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
        "party_type": <xsl:choose><xsl:when test="atom[@name='NamPartyType'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='NamPartyType'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "full_name": <xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='NamFullName'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "title": <xsl:choose><xsl:when test="atom[@name='NamTitle'] !=''">"<xsl:value-of select="replace(replace(replace(atom[@name='NamTitle'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "first_name": <xsl:choose><xsl:when test="atom[@name='NamFirst'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='NamFirst'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "middle_name": <xsl:choose><xsl:when test="atom[@name='NamMiddle'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='NamMiddle'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "last_name": <xsl:choose><xsl:when test="atom[@name='NamLast'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='NamLast'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "suffix": <xsl:choose><xsl:when test="atom[@name='NamSuffix'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='NamSuffix'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "gender": <xsl:choose><xsl:when test="atom[@name='NamSex'] != ''">"<xsl:value-of select="atom[@name='NamSex']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "nationality": <xsl:choose><xsl:when test="atom[@name='BioNationality'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='BioNationality'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "identities": [<xsl:for-each select="table[@name='Identities']/tuple">"<xsl:value-of select="replace(replace(replace(atom[@name='BioCulturalInfluences'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "birth_date": <xsl:choose><xsl:when test="atom[@name='BioBirthDate'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='BioBirthDate'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "birth_place": <xsl:choose><xsl:when test="atom[@name='BioBirthPlace'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='BioBirthPlace'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "death_date": <xsl:choose><xsl:when test="atom[@name='BioDeathDate'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='BioDeathDate'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "death_place": <xsl:choose><xsl:when test="atom[@name='BioDeathPlace'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='BioDeathPlace'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "organization_name": <xsl:choose><xsl:when test="atom[@name='NamOrganisation'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='NamOrganisation'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "commencement_date": <xsl:choose><xsl:when test="atom[@name='IMAHisCommenced'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='IMAHisCommenced'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "completion_date": <xsl:choose><xsl:when test="atom[@name='IMAHisCompleted'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='IMAHisCompleted'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "collaboration_name": <xsl:choose><xsl:when test="atom[@name='ColCollaborationName'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='ColCollaborationName'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "collaborators": [<xsl:for-each select="table[@name='Collaborators']/tuple[atom[@name='irn'] != '']">
            {
            "collaboration_role": <xsl:choose><xsl:when test="atom[@name='ColRole'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='ColRole'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "collaborator_irn": <xsl:value-of select="atom[@name='irn']"/>
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
        "acronym": <xsl:choose><xsl:when test="atom[@name='NamOrganisationAcronym'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='NamOrganisationAcronym'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "other_names": [<xsl:for-each select="table[@name='OtherPersonNames']/tuple">"<xsl:value-of select="replace(replace(replace(atom[@name='NamOtherNames'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each><xsl:if test="table[@name='OtherPersonNames'] and table[@name='OtherOrgNames']">, </xsl:if><xsl:for-each select="table[@name='OtherOrgNames']/tuple">"<xsl:value-of select="replace(replace(atom[@name='NamOrganisationOtherNames'], '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "roles": [<xsl:for-each select="table[@name='Roles']/tuple">"<xsl:value-of select="replace(replace(replace(atom[@name='NamRoles'], '\&#92;', '\&#92;\&#92;'), '&quot;', '\\&quot;'), '&#09;', '\\t')"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "guids": [<xsl:for-each select="table[@name='GUIDs']/tuple[atom[@name='AdmGUIDType'] != '' and atom[@name='AdmGUIDValue'] != '']">
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
    
</xsl:stylesheet>