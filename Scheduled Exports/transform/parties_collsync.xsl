<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text"/>
    
<xsl:template match="/">{"parties": [
    <xsl:for-each select="table[@name='eparties']/tuple"><xsl:sort select="atom[@name='irn']" data-type="number"/>{
        "irn": <xsl:value-of select="atom[@name='irn']"/>,
        "publish": <xsl:choose><xsl:when test="atom[@name='AdmPublishWebNoPassword'] = 'Yes'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose>,
        "partyType": <xsl:choose><xsl:when test="atom[@name='NamPartyType'] != ''">"<xsl:value-of select="replace(replace(atom[@name='NamPartyType'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "fullName": <xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''">"<xsl:value-of select="replace(replace(atom[@name='NamFullName'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "title": <xsl:choose><xsl:when test="atom[@name='NamTitle'] !=''">"<xsl:value-of select="replace(replace(atom[@name='NamTitle'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "firstName": <xsl:choose><xsl:when test="atom[@name='NamFirst'] != ''">"<xsl:value-of select="replace(replace(atom[@name='NamFirst'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "middleName": <xsl:choose><xsl:when test="atom[@name='NamMiddle'] != ''">"<xsl:value-of select="replace(replace(atom[@name='NamMiddle'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "lastName": <xsl:choose><xsl:when test="atom[@name='NamLast'] != ''">"<xsl:value-of select="replace(replace(atom[@name='NamLast'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "suffix": <xsl:choose><xsl:when test="atom[@name='NamSuffix'] != ''">"<xsl:value-of select="replace(replace(atom[@name='NamSuffix'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "gender": <xsl:choose><xsl:when test="atom[@name='NamSex'] != ''">"<xsl:value-of select="atom[@name='NamSex']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "nationality": <xsl:choose><xsl:when test="atom[@name='BioNationality'] != ''">"<xsl:value-of select="replace(replace(atom[@name='BioNationality'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "identities": [<xsl:for-each select="table[@name='Identities']/tuple">"<xsl:value-of select="replace(replace(atom[@name='BioCulturalInfluences'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "birthDate": <xsl:choose><xsl:when test="atom[@name='BioBirthDate'] != ''">"<xsl:value-of select="replace(replace(atom[@name='BioBirthDate'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "birthPlace": <xsl:choose><xsl:when test="atom[@name='BioBirthPlace'] != ''">"<xsl:value-of select="replace(replace(atom[@name='BioBirthPlace'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "deathDate": <xsl:choose><xsl:when test="atom[@name='BioDeathDate'] != ''">"<xsl:value-of select="replace(replace(atom[@name='BioDeathDate'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "deathPlace": <xsl:choose><xsl:when test="atom[@name='BioDeathPlace'] != ''">"<xsl:value-of select="replace(replace(atom[@name='BioDeathPlace'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "organizationName": <xsl:choose><xsl:when test="atom[@name='NamOrganisation'] != ''">"<xsl:value-of select="replace(replace(atom[@name='NamOrganisation'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "commencementDate": <xsl:choose><xsl:when test="atom[@name='IMAHisCommenced'] != ''">"<xsl:value-of select="replace(replace(atom[@name='IMAHisCommenced'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "commencementEarliestDate": <xsl:choose><xsl:when test="atom[@name='IMAHisBeginEarliestDate'] != ''">"<xsl:value-of select="atom[@name='IMAHisBeginEarliestDate']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "commencementLatestDate": <xsl:choose><xsl:when test="atom[@name='IMAHisBeginLatestDate'] != ''">"<xsl:value-of select="atom[@name='IMAHisBeginLatestDate']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "completionDate": <xsl:choose><xsl:when test="atom[@name='IMAHisCompleted'] != ''">"<xsl:value-of select="replace(replace(atom[@name='IMAHisCompleted'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "completionEarliestDate": <xsl:choose><xsl:when test="atom[@name='IMAHisEndEarliestDate'] != ''">"<xsl:value-of select="atom[@name='IMAHisEndLatestDate']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "completionLatestDate": <xsl:choose><xsl:when test="atom[@name='IMAHisEndLatestDate'] != ''">"<xsl:value-of select="atom[@name='IMAHisEndLatestDate']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "collaborationName": <xsl:choose><xsl:when test="atom[@name='ColCollaborationName'] != ''">"<xsl:value-of select="replace(replace(atom[@name='ColCollaborationName'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "collaborators": [<xsl:for-each select="table[@name='Collaborators']/tuple">
            {
                "collaborationRole": <xsl:choose><xsl:when test="atom[@name='ColRole'] != ''">"<xsl:value-of select="replace(replace(atom[@name='ColRole'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "irn": "<xsl:value-of select="atom[@name='irn']"/>",
                "dateModified": "<xsl:value-of select="atom[@name='AdmDateModified']"/>"
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
        "acronym": <xsl:choose><xsl:when test="atom[@name='NamOrganisationAcronym'] != ''">"<xsl:value-of select="replace(replace(atom[@name='NamOrganisationAcronym'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "otherNames": [<xsl:for-each select="table[@name='OtherPersonNames']/tuple">"<xsl:value-of select="replace(replace(atom[@name='NamOtherNames'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each><xsl:if test="table[@name='OtherPersonNames'] and table[@name='OtherOrgNames']">, </xsl:if><xsl:for-each select="table[@name='OtherOrgNames']/tuple">"<xsl:value-of select="replace(replace(atom[@name='NamOrganisationOtherNames'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "roles": [<xsl:for-each select="table[@name='Roles']/tuple">"<xsl:value-of select="replace(replace(atom[@name='NamRoles'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "GUIDs": [<xsl:for-each select="table[@name='GUIDs']/tuple[atom[@name='AdmGUIDType'] != '' and atom[@name='AdmGUIDValue'] != '']">
            {
                "preferred": <xsl:choose><xsl:when test="atom[@name='AdmGUIDIsPreferred'] = 'Yes'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose>,
                "type": "<xsl:value-of select="atom[@name='AdmGUIDType']"/>",
                "GUID": "<xsl:value-of select="atom[@name='AdmGUIDValue']"/>"
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
        "dateModified": "<xsl:value-of select="atom[@name='AdmDateModified']"/>"
    }<xsl:if test="position() != last()">,
    </xsl:if>
    </xsl:for-each>]
}</xsl:template>
    
</xsl:stylesheet>