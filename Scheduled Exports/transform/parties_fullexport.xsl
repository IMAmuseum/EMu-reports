<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text"/>
    
<xsl:template match="/">{"parties": [
    <xsl:for-each select="table[@name='eparties']/tuple"><xsl:sort select="atom[@name='irn']" data-type="number"/>{
        "irn": <xsl:value-of select="atom[@name='irn']"/>,
        "partyType": <xsl:choose><xsl:when test="atom[@name='NamPartyType'] != ''">"<xsl:value-of select="atom[@name='NamPartyType']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "fullName": <xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''">"<xsl:value-of select="replace(atom[@name='NamFullName'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "firstName": <xsl:choose><xsl:when test="atom[@name='NamFirst'] != ''">"<xsl:value-of select="atom[@name='NamFirst']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "middleName": <xsl:choose><xsl:when test="atom[@name='NamMiddle'] != ''">"<xsl:value-of select="atom[@name='NamMiddle']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "lastName": <xsl:choose><xsl:when test="atom[@name='NamLast'] != ''">"<xsl:value-of select="atom[@name='NamLast']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "suffix": <xsl:choose><xsl:when test="atom[@name='NamSuffix'] != ''">"<xsl:value-of select="atom[@name='NamSuffix']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,<xsl:if test="table[@name='OtherPersonNames']">
        "otherNames": [<xsl:for-each select="table[@name='OtherPersonNames']/tuple">"<xsl:value-of select="replace(atom[@name='NamOtherNames'], '&quot;', '\\&quot;')"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],</xsl:if>
        "gender": <xsl:choose><xsl:when test="atom[@name='NamSex'] != ''">"<xsl:value-of select="atom[@name='NamSex']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "nationality": <xsl:choose><xsl:when test="atom[@name='BioNationality'] != ''">"<xsl:value-of select="atom[@name='BioNationality']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "ethnicity": <xsl:choose><xsl:when test="atom[@name='ethnicity'] != ''">"<xsl:value-of select="atom[@name='ethnicity']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,<xsl:if test="table[@name='Identities']">
        "identities": [<xsl:for-each select="table[@name='Identities']/tuple">"<xsl:value-of select="replace(atom[@name='BioCulturalInfluences'], '&quot;', '\\&quot;')"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],</xsl:if>
        "birthDate": <xsl:choose><xsl:when test="atom[@name='BioBirthDate'] != ''">"<xsl:value-of select="atom[@name='BioBirthDate']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "birthPlace": <xsl:choose><xsl:when test="atom[@name='BioBirthPlace'] != ''">"<xsl:value-of select="atom[@name='BioBirthPlace']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "deceased": <xsl:choose><xsl:when test="atom[@name='BioDeceased'] = 'Yes'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose>,
        "deathDate": <xsl:choose><xsl:when test="atom[@name=''] != 'BioDeathDate'">"<xsl:value-of select="atom[@name='BioDeathDate']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "deathPlace": <xsl:choose><xsl:when test="atom[@name='BioDeathPlace'] != ''">"<xsl:value-of select="atom[@name='BioDeathPlace']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "organizationName": <xsl:choose><xsl:when test="atom[@name='NamOrganisation'] != ''">"<xsl:value-of select="replace(atom[@name='NamOrganisation'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "acronym": <xsl:choose><xsl:when test="atom[@name='NamOrganisationAcronym'] != ''">"<xsl:value-of select="replace(atom[@name='NamOrganisationAcronym'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,<xsl:if test="table[@name='OtherOrgNames']">
        "otherOrganizationNames": [<xsl:for-each select="table[@name='OtherOrgNames']/tuple">"<xsl:value-of select="replace(atom[@name='NamOrganisationOtherNames'], '&quot;', '\\&quot;')"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],</xsl:if>
        "commencementDate": <xsl:choose><xsl:when test="atom[@name='IMAHisCommenced'] != ''">"<xsl:value-of select="atom[@name='IMAHisCommenced']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "earliestCommencementDate": <xsl:choose><xsl:when test="atom[@name='IMAHisBeginEarliestDate'] != ''">"<xsl:value-of select="atom[@name='IMAHisBeginEarliestDate']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "latestCommencementDate": <xsl:choose><xsl:when test="atom[@name='IMAHisBignLatestDate'] != ''">"<xsl:value-of select="atom[@name='IMAHisBeginLatestDate']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "completionDate": <xsl:choose><xsl:when test="atom[@name='IMAHisCompleted'] != ''">"<xsl:value-of select="atom[@name='IMAHisCompleted']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "earliestCompletionDate": <xsl:choose><xsl:when test="atom[@name='IMAHisEndEarliestDate'] != ''">"<xsl:value-of select="atom[@name='IMAHisEndLatestDate']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "latestCompletionDate": <xsl:choose><xsl:when test="atom[@name='IMAHisEndLatestDate'] != ''">"<xsl:value-of select="atom[@name='IMAHisEndLatestDate']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "collaborationName": <xsl:choose><xsl:when test="atom[@name='ColCollaborationName'] != ''">"<xsl:value-of select="replace(atom[@name='ColCollaborationName'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,<xsl:if test="table[@name='Collaborators']">
        "collaborators": [<xsl:for-each select="table[@name='Collaborators']/tuple">
            {
                "collabRole": <xsl:choose><xsl:when test="atom[@name='ColRole'] != ''">"<xsl:value-of select="atom[@name='ColRole']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "irn": "<xsl:value-of select="atom[@name='irn']"/>",
                "dateModified": "<xsl:value-of select="atom[@name='AdmDateModified']"/>"
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>
        ],</xsl:if>
        "roles": [<xsl:for-each select="table[@name='Roles']/tuple">"<xsl:value-of select="atom[@name='NamRoles']"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "dateModified": "<xsl:value-of select="atom[@name='AdmDateModified']"/>"
        }<xsl:if test="position() != last()">,
        </xsl:if>
    </xsl:for-each>]
}</xsl:template>
    
</xsl:stylesheet>