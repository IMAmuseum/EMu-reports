<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text"/>

<xsl:template match="/">{"objects": [
    <xsl:for-each select="table[@name='ecatalogue']/tuple"><xsl:sort select="atom[@name='irn']" data-type="number"/>{
        "irn": <xsl:value-of select="atom[@name='irn']"/>,
        "flags": [<xsl:for-each select="table[@name='Flags']/tuple">"<xsl:value-of select="atom[@name='TitObjectRating']"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "publish": <xsl:choose><xsl:when test="atom[@name='AdmPublishWebNoPassword'] = 'Yes'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose>,
        "status": <xsl:choose><xsl:when test="atom[@name='TitObjectStatus'] != ''">"<xsl:value-of select="replace(replace(atom[@name='TitObjectStatus'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "objectID": <xsl:choose><xsl:when test="atom[@name='TitAccessionNo'] != ''">"<xsl:value-of select="replace(replace(atom[@name='TitAccessionNo'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "previousID": <xsl:choose><xsl:when test="contains(lower-case(atom[@name='TitPreviousAccessionNo']), 'no tr number')">null</xsl:when><xsl:when test="atom[@name='TitPreviousAccessionNo'] != ''">"<xsl:value-of select="replace(replace(atom[@name='TitPreviousAccessionNo'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "dateAccessioned": <xsl:choose><xsl:when test="atom[@name='TitAccessionDate'] != ''">"<xsl:value-of select="atom[@name='TitAccessionDate']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "title": <xsl:choose><xsl:when test="atom[@name='TitMainTitle'] != ''">"<xsl:value-of select="replace(replace(atom[@name='TitMainTitle'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "seriesTitle": <xsl:choose><xsl:when test="atom[@name='TitSeriesTitle'] != ''">"<xsl:value-of select="replace(replace(atom[@name='TitSeriesTitle'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "portfolioTitle": <xsl:choose><xsl:when test="atom[@name='TitCollectionTitle'] != ''">"<xsl:value-of select="replace(replace(atom[@name='TitCollectionTitle'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "altTitles": [<xsl:for-each select="table[@name='AltTitles']/tuple">"<xsl:value-of select="replace(replace(atom[@name='TitAlternateTitles'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "creators": [<xsl:for-each select="table[@name='Creator']/tuple">
            {
                "irn": <xsl:value-of select="atom[@name='irn']"/>,
                "role": <xsl:choose><xsl:when test="normalize-space(atom[@name='CreRole']) != ''">"<xsl:value-of select="replace(replace(atom[@name='CreRole'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "attribution": <xsl:choose><xsl:when test="normalize-space(atom[@name='CreCreatorAfterFollower']) != ''">"<xsl:value-of select="replace(replace(atom[@name='CreCreatorAfterFollower'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "dateModified": "<xsl:value-of select="atom[@name='AdmDateModified']"/>"
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
        "cultures": [<xsl:for-each select="table[@name='Culture']/tuple">
            {
                "attribution": <xsl:choose><xsl:when test="normalize-space(atom[@name='CreCreatorAttribution']) != ''">"<xsl:value-of select="replace(replace(atom[@name='CreCreatorAttribution'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "culture": <xsl:choose><xsl:when test="normalize-space(atom[@name='CreCreationCultureOrPeople']) != ''">"<xsl:value-of select="replace(replace(atom[@name='CreCreationCultureOrPeople'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "nationality": <xsl:choose><xsl:when test="normalize-space(atom[@name='CreCreationNationality2']) != ''">"<xsl:value-of select="replace(replace(atom[@name='CreCreationNationality2'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
        "dateCreated": <xsl:choose><xsl:when test="atom[@name='CreDateCreated'] != ''">"<xsl:value-of select="replace(replace(atom[@name='CreDateCreated'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "dateCreatedEarliest": <xsl:choose><xsl:when test="atom[@name='CreEarliestDate'] != ''">"<xsl:value-of select="atom[@name='CreEarliestDate']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "dateCreatedLatest": <xsl:choose><xsl:when test="atom[@name='CreLatestDate'] != ''">"<xsl:value-of select="atom[@name='CreLatestDate']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "dateDesigned": <xsl:choose><xsl:when test="atom[@name='CreDateDesigned'] != ''">"<xsl:value-of select="replace(replace(atom[@name='CreDateDesigned'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "dateDesignedEarliest": <xsl:choose><xsl:when test="atom[@name='CreEarliestDesignDate'] != ''">"<xsl:value-of select="atom[@name='CreEarliestDesignDate']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "dateDesignedLatest": <xsl:choose><xsl:when test="atom[@name='CreLatestDesignDate'] != ''">"<xsl:value-of select="atom[@name='CreLatestDesignDate']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "period": <xsl:choose><xsl:when test="atom[@name='CreCreationPeriod'] != ''">"<xsl:value-of select="replace(replace(atom[@name='CreCreationPeriod'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "dynasty": <xsl:choose><xsl:when test="atom[@name='CreCreationDynasty'] != ''">"<xsl:value-of select="replace(replace(atom[@name='CreCreationDynasty'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "creationLocations": [<xsl:for-each select="table[@name='CreLoc']/tuple">{
            "country": <xsl:choose><xsl:when test="normalize-space(atom[@name='CreCountry']) != ''">"<xsl:value-of select="replace(replace(atom[@name='CreCountry'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "state": <xsl:choose><xsl:when test="normalize-space(atom[@name='CreState']) != ''">"<xsl:value-of select="replace(replace(atom[@name='CreState'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "district": <xsl:choose><xsl:when test="normalize-space(atom[@name='CreDistrict']) != ''">"<xsl:value-of select="replace(replace(atom[@name='CreDistrict'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "city": <xsl:choose><xsl:when test="normalize-space(atom[@name='CreCity']) != ''">"<xsl:value-of select="replace(replace(atom[@name='CreCity'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>}<xsl:if test="position() != last()">,
            </xsl:if></xsl:for-each>],
        "recordType": <xsl:choose><xsl:when test="atom[@name='TitObjectType'] != ''">"<xsl:value-of select="replace(replace(atom[@name='TitObjectType'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "objectTypes": [<xsl:for-each select="table[@name='ObjType']/tuple">"<xsl:value-of select="replace(replace(atom[@name='PhyMediaCategory'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "mediums": [<xsl:for-each select="table[@name='Medium']/tuple">"<xsl:value-of select="replace(replace(atom[@name='PhyMedium'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "supports": [<xsl:for-each select="table[@name='Support']/tuple">"<xsl:value-of select="replace(replace(atom[@name='PhySupport'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "mediumSupport": <xsl:choose><xsl:when test="atom[@name='PhyMediumAndSupport'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='PhyMediumAndSupport'], '\n', '\\n'), '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "technique": <xsl:choose><xsl:when test="atom[@name='PhyTechnique'] != ''">"<xsl:value-of select="replace(replace(atom[@name='PhyTechnique'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "style": <xsl:choose><xsl:when test="atom[@name='PhyStyle'] != ''">"<xsl:value-of select="replace(replace(atom[@name='PhyStyle'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "mark": {<xsl:if test="table[@name='MarkType']">
            "markType": [<xsl:for-each select="table[@name='MarkType']/tuple">"<xsl:value-of select="replace(replace(atom[@name='CreMarkType'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
            "markDescription": <xsl:choose><xsl:when test="atom[@name='CrePrimaryInscriptions'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='CrePrimaryInscriptions'], '\n', '\\n'), '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>
        </xsl:if>},
        "printer": [<xsl:choose><xsl:when test="table[@name='Printer']"><xsl:for-each select="table[@name='Printer']/tuple">
            {
                "irn": <xsl:choose><xsl:when test="atom[@name='irn'] != ''"><xsl:value-of select="atom[@name='irn']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "dateModified": "<xsl:value-of select="atom[@name='AdmDateModified']"/>"
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each></xsl:when></xsl:choose>],
        "publisher": [<xsl:choose><xsl:when test="table[@name='Publisher']"><xsl:for-each select="table[@name='Publisher']/tuple">
            {
                "irn": <xsl:choose><xsl:when test="atom[@name='irn'] != ''"><xsl:value-of select="atom[@name='irn']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "dateModified": "<xsl:value-of select="atom[@name='AdmDateModified']"/>"
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each></xsl:when></xsl:choose>],
        "convertedDimensions": <xsl:choose><xsl:when test="atom[@name='PhyConvertedDims'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='PhyConvertedDims'], '\n', '\\n'), '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "dimensions": [<xsl:for-each select="table[@name='Dims']/tuple[
            atom[@name='PhyHeight'] != '' or
            atom[@name='PhyWidth'] != '' or
            atom[@name='PhyDepth'] != '' or
            atom[@name='PhyDiameter'] != '' or
            atom[@name='PhyWeight'] != '']">
            {
                "type": <xsl:choose><xsl:when test="atom[@name='PhyType'] != ''">"<xsl:value-of select="replace(replace(atom[@name='PhyType'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "height": <xsl:choose><xsl:when test="atom[@name='PhyHeight'] != ''"><xsl:value-of select="atom[@name='PhyHeight']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "width": <xsl:choose><xsl:when test="atom[@name='PhyWidth'] != ''"><xsl:value-of select="atom[@name='PhyWidth']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "depth": <xsl:choose><xsl:when test="atom[@name='PhyDepth'] != ''"><xsl:value-of select="atom[@name='PhyDepth']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "diameter": <xsl:choose><xsl:when test="atom[@name='PhyDiameter'] != ''"><xsl:value-of select="atom[@name='PhyDiameter']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "lengthUnit": <xsl:choose><xsl:when test="atom[@name='PhyUnitLength'] != ''">"<xsl:value-of select="replace(replace(atom[@name='PhyUnitLength'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "weight": <xsl:choose><xsl:when test="atom[@name='PhyWeight'] != ''"><xsl:value-of select="atom[@name='PhyWeight']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "weightUnit": <xsl:choose><xsl:when test="atom[@name='PhyUnitWeight'] != ''">"<xsl:value-of select="replace(replace(atom[@name='PhyUnitWeight'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "notes": <xsl:choose><xsl:when test="atom[@name='PhyDimensionNotes'] != ''">"<xsl:value-of select="replace(replace(atom[@name='PhyDimensionNotes'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
        "creditLine": <xsl:choose><xsl:when test="atom[@name='SumCreditLine'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='SumCreditLine'], '\n', '\\n'), '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "rights": [<xsl:for-each select="table[@name='Rights']/tuple[atom[@name='RigAcknowledgement'] != '']">
            {
                "acknowledgement": "<xsl:choose><xsl:when test="atom[@name='RigAcknowledgement'] != ''"><xsl:value-of select="replace(replace(replace(atom[@name='RigAcknowledgement'], '\n', '\\n'), '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>",
                "dateModified": "<xsl:value-of select="atom[@name='AdmDateModified']"/>"
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
        "rightsURIs": [<xsl:for-each select="table[@name='RightsURIs']/tuple[atom[@name='AdmGUIDType_tab'] != '' and atom[@name='AdmGUIDValue_tab'] != '']">
            {
                "type": "<xsl:value-of select="atom[@name='AdmGUIDType_tab']"/>",
                "uri": "<xsl:value-of select="atom[@name='AdmGUIDValue_tab']"/>"
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
        "provenance": <xsl:choose><xsl:when test="atom[@name='CreProvenance'] != ''">"<xsl:value-of select="replace(replace(replace(atom[@name='CreProvenance'], '\n', '\\n'), '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "department": <xsl:choose><xsl:when test="atom[@name='PhyCollectionArea'] != ''">"<xsl:value-of select="replace(replace(atom[@name='PhyCollectionArea'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "onView": <xsl:choose><xsl:when test="atom[@name='LocMovementType'] = 'Exhibition Location'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose>,
        "currentLocation": {<xsl:if test="atom[@name='LocMovementType'] = 'Exhibition Location'">
            "irn": <xsl:value-of select="table[@name='CurLoc']/tuple/tuple[@name='LocCurrentLocationRef']/atom[@name='irn']"/>,
            "dateModified": "<xsl:value-of select="table[@name='CurLoc']/tuple/tuple[@name='LocCurrentLocationRef']/atom[@name='AdmDateModified']"/>",
            "locationCode": <xsl:choose><xsl:when test="table[@name='CurLoc']/tuple/tuple[@name='LocCurrentLocationRef']/atom[@name='LocLocationCode'] != ''">"<xsl:value-of select="replace(replace(table[@name='CurLoc']/tuple/tuple[@name='LocCurrentLocationRef']/atom[@name='LocLocationCode'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "locationLevel1": <xsl:choose><xsl:when test="table[@name='CurLoc']/tuple/tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel1'] != ''">"<xsl:value-of select="replace(replace(table[@name='CurLoc']/tuple/tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel1'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "locationLevel2": <xsl:choose><xsl:when test="table[@name='CurLoc']/tuple/tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel2'] != ''">"<xsl:value-of select="replace(replace(table[@name='CurLoc']/tuple/tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel2'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "locationLevel3": <xsl:choose><xsl:when test="table[@name='CurLoc']/tuple/tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel3'] != ''">"<xsl:value-of select="replace(replace(table[@name='CurLoc']/tuple/tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel3'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "locationLevel4": <xsl:choose><xsl:when test="table[@name='CurLoc']/tuple/tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel4'] != ''">"<xsl:value-of select="replace(replace(table[@name='CurLoc']/tuple/tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel4'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "locationLevel5": <xsl:choose><xsl:when test="table[@name='CurLoc']/tuple/tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel5'] != ''">"<xsl:value-of select="replace(replace(table[@name='CurLoc']/tuple/tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel5'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "locationLevel6": <xsl:choose><xsl:when test="table[@name='CurLoc']/tuple/tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel6'] != ''">"<xsl:value-of select="replace(replace(table[@name='CurLoc']/tuple/tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel6'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "locationLevel7": <xsl:choose><xsl:when test="table[@name='CurLoc']/tuple/tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel7'] != ''">"<xsl:value-of select="replace(replace(table[@name='CurLoc']/tuple/tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel7'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "locationLevel8": <xsl:choose><xsl:when test="table[@name='CurLoc']/tuple/tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel8'] != ''">"<xsl:value-of select="replace(replace(table[@name='CurLoc']/tuple/tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel8'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>
        </xsl:if>
        },
        "parentIRN": <xsl:choose><xsl:when test="table[@name='Parent']/tuple/tuple[@name='AssParentObjectRef']/atom[@name='irn'] != ''"><xsl:value-of select="table[@name='Parent']/tuple/tuple[@name='AssParentObjectRef']/atom[@name='irn']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "relatedObjects": [<xsl:for-each select="table[@name='Related']/tuple">
            {
                "relationship": "<xsl:value-of select="replace(replace(atom[@name='AssRelationship'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>",
                "irn": <xsl:value-of select="atom[@name='irn']"/>,
                "dateModified": "<xsl:value-of select="atom[@name='AdmDateModified']"/>"
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
        "GUIDs": [<xsl:for-each select="table[@name='GUIDs']/tuple[atom[@name='AdmGUIDType'] != '' and atom[@name='AdmGUIDValue'] != '']">
            {
                "preferred": <xsl:choose><xsl:when test="atom[@name='AdmGUIDIsPreferred'] = 'Yes'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose>,
                "type": "<xsl:value-of select="atom[@name='AdmGUIDType']"/>",
                "GUID": "<xsl:value-of select="atom[@name='AdmGUIDValue']"/>"
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
        "deaccession": {<xsl:if test="atom[@name='TitObjectStatus'] = 'Deaccessioned'">
            "deaccessionMethod": <xsl:choose><xsl:when test="table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionMethod'] != ''">"<xsl:value-of select="replace(replace(table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionMethod'], '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "deaccessionDate": <xsl:choose><xsl:when test="table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionDate'] != ''">"<xsl:value-of select="table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionDate']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "deaccessionNotes": <xsl:choose><xsl:when test="table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionNotes'] != ''">"<xsl:value-of select="replace(replace(replace(table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionNotes'], '\n', '\\n'), '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose><xsl:if test="table[@name='DeaccessionedTo']/tuple/tuple[atom[@name='irn'] != '']">,
            "transferredTo": {
                    "irn": <xsl:value-of select="table[@name='DeaccessionedTo']/tuple/tuple/atom[@name='irn']"/>,
                    "dateModified": "<xsl:value-of select="table[@name='DeaccessionedTo']/tuple/tuple/atom[@name='AdmDateModified']"/>"
            },
            "tranferDate": <xsl:choose><xsl:when test="table[@name='DeaccessionedTo']/tuple/atom[@name='DeaTransferDate'] != ''">"<xsl:value-of select="table[@name='DeaccessionedTo']/tuple/atom[@name='DeaTransferDate']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "transferNotes": <xsl:choose><xsl:when test="table[@name='DeaccessionedTo']/tuple/atom[@name='DeaTransferNotes'] != ''">"<xsl:value-of select="replace(replace(replace(table[@name='DeaccessionedTo']/tuple/atom[@name='DeaTransferNotes'], '\n', '\\n'), '&quot;', '\\&quot;'), '&#09;', '\\&#09;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose></xsl:if><xsl:text>
        </xsl:text></xsl:if>},
        "dateModified": "<xsl:value-of select="atom[@name='AdmDateModified']"/>"
    }<xsl:if test="position() != last()">,
    </xsl:if></xsl:for-each>]
}</xsl:template>

</xsl:stylesheet>