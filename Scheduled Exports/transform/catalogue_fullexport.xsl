<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text"/>

<xsl:template match="/">{"objects": [
    <xsl:for-each select="table[@name='ecatalogue']/tuple"><xsl:sort select="atom[@name='irn']" data-type="number"/>{
        "irn": <xsl:value-of select="atom[@name='irn']"/>,
        "publish": <xsl:choose><xsl:when test="atom[@name='AdmPublishWebNoPassword'] = 'Yes'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose>,
        "status": <xsl:choose><xsl:when test="atom[@name='TitObjectStatus'] != ''">"<xsl:value-of select="replace(atom[@name='TitObjectStatus'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "accessionNumber": <xsl:choose><xsl:when test="atom[@name='TitAccessionNo'] != ''">"<xsl:value-of select="replace(atom[@name='TitAccessionNo'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "previousID": <xsl:choose><xsl:when test="contains(lower-case(atom[@name='TitPreviousAccessionNo']), 'no tr number')">null</xsl:when><xsl:when test="atom[@name='TitPreviousAccessionNo'] != ''">"<xsl:value-of select="replace(atom[@name='TitPreviousAccessionNo'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "accessionDate": <xsl:choose><xsl:when test="atom[@name='TitAccessionDate'] != ''">"<xsl:value-of select="atom[@name='TitAccessionDate']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "title": <xsl:choose><xsl:when test="atom[@name='TitMainTitle'] != ''">"<xsl:value-of select="replace(atom[@name='TitMainTitle'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "seriesTitle": <xsl:choose><xsl:when test="atom[@name='TitSeriesTitle'] != ''">"<xsl:value-of select="replace(atom[@name='TitSeriesTitle'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "portfolioTitle": <xsl:choose><xsl:when test="atom[@name='TitCollectionTitle'] != ''">"<xsl:value-of select="replace(atom[@name='TitCollectionTitle'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "altTitles": [<xsl:for-each select="table[@name='AltTitles']/tuple">"<xsl:value-of select="replace(atom[@name='TitAlternateTitles'], '&quot;', '\\&quot;')"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "creators": [<xsl:for-each select="table[@name='Creator']/tuple">
            {
                "irn": <xsl:value-of select="atom[@name='irn']"/>,
                "role": <xsl:choose><xsl:when test="atom[@name='CreRole'] != ''">"<xsl:value-of select="replace(atom[@name='CreRole'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "attribution": <xsl:choose><xsl:when test="atom[@name='CreCreatorAfterFollower'] != ''">"<xsl:value-of select="replace(atom[@name='CreCreatorAfterFollower'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "dateModified": "<xsl:value-of select="atom[@name='AdmDateModified']"/>"
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
        "cultures": [<xsl:for-each select="table[@name='Culture']/tuple">
            {
                "attribution": <xsl:choose><xsl:when test="atom[@name='CreCreatorAttribution'] != ''">"<xsl:value-of select="replace(atom[@name='CreCreatorAttribution'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "culture": <xsl:choose><xsl:when test="atom[@name='CreCreationCultureOrPeople'] != ''">"<xsl:value-of select="replace(atom[@name='CreCreationCultureOrPeople'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "nationality": <xsl:choose><xsl:when test="atom[@name='CreCreationNationality2'] != ''">"<xsl:value-of select="replace(atom[@name='CreCreationNationality2'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
        "dateCreated": <xsl:choose><xsl:when test="atom[@name='CreDateCreated'] != ''">"<xsl:value-of select="replace(atom[@name='CreDateCreated'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "dateCreatedEarliest": <xsl:choose><xsl:when test="atom[@name='CreEarliestDate'] != ''">"<xsl:value-of select="atom[@name='CreEarliestDate']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "dateCreatedLatest": <xsl:choose><xsl:when test="atom[@name='CreLatestDate'] != ''">"<xsl:value-of select="atom[@name='CreLatestDate']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "dateDesigned": <xsl:choose><xsl:when test="atom[@name='CreDateDesigned'] != ''">"<xsl:value-of select="replace(atom[@name='CreDateDesigned'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "dateDesignedEarliest": <xsl:choose><xsl:when test="atom[@name='CreEarliestDesignDate'] != ''">"<xsl:value-of select="atom[@name='CreEarliestDesignDate']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "dateDesignedLatest": <xsl:choose><xsl:when test="atom[@name='CreLatestDesignDate'] != ''">"<xsl:value-of select="atom[@name='CreLatestDesignDate']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "period": <xsl:choose><xsl:when test="atom[@name='CreCreationPeriod'] != ''">"<xsl:value-of select="replace(atom[@name='CreCreationPeriod'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "dynasty": <xsl:choose><xsl:when test="atom[@name='CreCreationDynasty'] != ''">"<xsl:value-of select="replace(atom[@name='CreCreationDynasty'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "creationLocations": [<xsl:for-each select="table[@name='CreLocation']/tuple">{
            "country": <xsl:choose><xsl:when test="atom[@name='CreCountry'] != ''">"<xsl:value-of select="replace(atom[@name='CreCountry'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "state": <xsl:choose><xsl:when test="atom[@name='CreState'] != ''">"<xsl:value-of select="replace(atom[@name='CreState'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "district": <xsl:choose><xsl:when test="atom[@name='CreDistrict'] != ''">"<xsl:value-of select="replace(atom[@name='CreDistrict'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "city": <xsl:choose><xsl:when test="atom[@name='CreCity'] != ''">"<xsl:value-of select="replace(atom[@name='CreCity'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>}<xsl:if test="position() != last()">,
            </xsl:if></xsl:for-each>],
        "recordType": <xsl:choose><xsl:when test="atom[@name='TitObjectType'] != ''">"<xsl:value-of select="replace(atom[@name='TitObjectType'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "objectTypes": [<xsl:for-each select="table[@name='ObjType']/tuple">"<xsl:value-of select="replace(atom[@name='PhyMediaCategory'], '&quot;', '\\&quot;')"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "mediums": [<xsl:for-each select="table[@name='Medium']/tuple">"<xsl:value-of select="replace(atom[@name='PhyMedium'], '&quot;', '\\&quot;')"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "supports": [<xsl:for-each select="table[@name='Support']/tuple">"<xsl:value-of select="replace(atom[@name='PhySupport'], '&quot;', '\\&quot;')"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "mediumSupport": <xsl:choose><xsl:when test="atom[@name='PhyMediumAndSupport'] != ''">"<xsl:value-of select="replace(replace(atom[@name='PhyMediumAndSupport'], '\n', '\\n'), '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "technique": <xsl:choose><xsl:when test="atom[@name='PhyTechnique'] != ''">"<xsl:value-of select="replace(atom[@name='PhyTechnique'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "style": <xsl:choose><xsl:when test="atom[@name='PhyStyle'] != ''">"<xsl:value-of select="replace(atom[@name='PhyStyle'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "mark": {
            "markType": <xsl:choose><xsl:when test="table[@name='MarkType']/atom[@name='CreMarkType'] != ''">"<xsl:value-of select="replace(table[@name='MarkType']/atom[@name='CreMarkType'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "inscription": <xsl:choose><xsl:when test="table[@name='MarkType']/atom[@name='CrePrimaryInscriptions'] != ''">"<xsl:value-of select="replace(replace(table[@name='MarkType']/atom[@name='CrePrimaryInscriptions'], '\n', '\\n'), '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>
        },
        "physicalDescription": <xsl:choose><xsl:when test="atom[@name='PhyDecription'] != ''">"<xsl:value-of select="replace(replace(atom[@name='PhyDescription'], '\n', '\\n'), '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "subjectDescription": <xsl:choose><xsl:when test="atom[@name='CreSubjectDescription'] != ''">"<xsl:value-of select="replace(replace(atom[@name='CreSubjectDescriptions'], '\n', '\\n'), '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "subjectIdentity": <xsl:choose><xsl:when test="atom[@name='CreSubjectIdentification'] != ''">"<xsl:value-of select="replace(replace(atom[@name='CreSubjectIdentification'], '\n', '\\n'), '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "subjectInterpretation": <xsl:choose><xsl:when test="atom[@name='CreSubjectInterpretation'] != ''">"<xsl:value-of select="replace(replace(atom[@name='CreSubjectInterpretation'], '\n', '\\n'), '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,<xsl:if test="table[@name='Printer']">
        "printer": {
            "irn": <xsl:value-of select="table[@name='Printer']/atom[@name='irn']"/>,
            "dateModified": "<xsl:value-of select="table[@name='Printer']/atom[@name='AdmDateModified']"/>"
        },</xsl:if><xsl:if test="table[@name='Publishers']">
        "publisher": {
            "irn": <xsl:value-of select="table[@name='Publisher']/atom[@name='irn']"/>,
            "dateModified": "<xsl:value-of select="table[@name='Publisher']/atom[@name='AdmDateModified']"/>"
        },</xsl:if>
        "convertedDimensions": <xsl:choose><xsl:when test="atom[@name='PhyConvertedDims'] != ''">"<xsl:value-of select="replace(replace(atom[@name='PhyConvertedDims'], '\n', '\\n'), '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,<xsl:if test="table[@name='Dimensions']">
        "dimensions": [<xsl:for-each select="table[@name='Dimensions']/tuple[
            atom[@name='PhyHeight'] != '' or
            atom[@name='PhyWidth'] != '' or
            atom[@name='PhyDepth'] != '' or
            atom[@name='PhyDiameter'] != '' or
            atom[@name='PhyWeight'] != '']">
            {
                "type": <xsl:choose><xsl:when test="atom[@name='PhyType'] != ''">"<xsl:value-of select="replace(atom[@name='PhyType'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "height": <xsl:choose><xsl:when test="atom[@name='PhyHeight'] != ''"><xsl:value-of select="atom[@name='PhyHeight']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "width": <xsl:choose><xsl:when test="atom[@name='PhyWidth'] != ''"><xsl:value-of select="atom[@name='PhyWidth']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "depth": <xsl:choose><xsl:when test="atom[@name='PhyDepth'] != ''"><xsl:value-of select="atom[@name='PhyDepth']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "diameter": <xsl:choose><xsl:when test="atom[@name='PhyDiameter'] != ''"><xsl:value-of select="atom[@name='PhyDiameter']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "lengthUnit": <xsl:choose><xsl:when test="atom[@name='PhyUnitLength'] != ''">"<xsl:value-of select="atom[@name='PhyUnitLength']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "weight": <xsl:choose><xsl:when test="atom[@name='PhyWeight'] != ''"><xsl:value-of select="atom[@name='PhyWeight']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "weightUnit": <xsl:choose><xsl:when test="atom[@name='PhyUnitWeight'] != ''">"<xsl:value-of select="atom[@name='PhyUnitWeight']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "notes": <xsl:choose><xsl:when test="atom[@name='PhyDimensionNotes'] != ''">"<xsl:value-of select="replace(atom[@name='PhyDimensionNotes'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],</xsl:if>
        "creditLine": <xsl:choose><xsl:when test="atom[@name='SumCreditLine'] != ''">"<xsl:value-of select="replace(replace(atom[@name='SumCreditLine'], '\n', '\\n'), '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,<xsl:if test="table[@name='Rights']">
        "rights": [<xsl:for-each select="table[@name='Rights']/tuple">
            {
                "irn": <xsl:value-of select="atom[@name='irn']"/>,
                "dateModified": "<xsl:value-of select="atom[@name='AdmDateModified']"/>",
                "type": <xsl:choose><xsl:when test="atom[@name='RigType'] != ''">"<xsl:value-of select="atom[@name='RigType']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "rightsStatement": <xsl:choose><xsl:when test="atom[@name='RigAcknowledgement'] != ''">"<xsl:value-of select="replace(replace(atom[@name='RigAcknowledgement'], '\n', '\\n'), '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],</xsl:if>
        "provenance": <xsl:choose><xsl:when test="atom[@name='CreProvenance'] != ''">"<xsl:value-of select="replace(replace(atom[@name='CreProvenance'], '\n', '\\n'), '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "department": <xsl:choose><xsl:when test="atom[@name='PhyCollectionArea'] != ''">"<xsl:value-of select="replace(atom[@name='PhyCollectionArea'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "currentLocType": <xsl:choose><xsl:when test="atom[@name='LocMovementType'] != ''">"<xsl:value-of select="replace(atom[@name='LocMovementType'], '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,<xsl:if test="tuple[@name='LocCurrentLocationRef']/atom[@name='irn'] != ''">
        "curLocation": {
            "irn": <xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='irn']"/>,
            "dateModified": "<xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='AdmDateModified']"/>",
            "locationType": <xsl:choose><xsl:when test="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLocationType'] != ''">"<xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLocationType']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "locationCode": <xsl:choose><xsl:when test="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLocationCode'] != ''">"<xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLocationCode']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "locationLevel1": <xsl:choose><xsl:when test="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel1'] != ''">"<xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel1']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "locationLevel2": <xsl:choose><xsl:when test="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel2'] != ''">"<xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel2']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "locationLevel3": <xsl:choose><xsl:when test="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel3'] != ''">"<xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel3']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "locationLevel4": <xsl:choose><xsl:when test="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel4'] != ''">"<xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel4']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "locationLevel5": <xsl:choose><xsl:when test="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel5'] != ''">"<xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel5']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "locationLevel6": <xsl:choose><xsl:when test="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel6'] != ''">"<xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel6']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "locationLevel7": <xsl:choose><xsl:when test="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel7'] != ''">"<xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel7']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "locationLevel8": <xsl:choose><xsl:when test="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel8'] != ''">"<xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel8']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>
        },</xsl:if><xsl:if test="tuple[@name='LocPermanentLocationRef']/atom[@name='irn'] != ''">
        "permLocation": {
            "irn": <xsl:value-of select="tuple[@name='LocPermanentLocationRef']/atom[@name='irn']"/>,
            "dateModified": "<xsl:value-of select="tuple[@name='LocPermanentLocationRef']/atom[@name='AdmDateModified']"/>",
            "locationType": <xsl:choose><xsl:when test="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLocationType'] != ''">"<xsl:value-of select="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLocationType']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "locationCode": <xsl:choose><xsl:when test="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLocationCode'] != ''">"<xsl:value-of select="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLocationCode']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "locationLevel1": <xsl:choose><xsl:when test="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLevel1'] != ''">"<xsl:value-of select="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLevel1']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "locationLevel2": <xsl:choose><xsl:when test="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLevel2'] != ''">"<xsl:value-of select="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLevel2']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "locationLevel3": <xsl:choose><xsl:when test="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLevel3'] != ''">"<xsl:value-of select="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLevel3']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "locationLevel4": <xsl:choose><xsl:when test="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLevel4'] != ''">"<xsl:value-of select="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLevel4']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "locationLevel5": <xsl:choose><xsl:when test="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLevel5'] != ''">"<xsl:value-of select="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLevel5']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "locationLevel6": <xsl:choose><xsl:when test="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLevel6'] != ''">"<xsl:value-of select="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLevel6']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "locationLevel7": <xsl:choose><xsl:when test="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLevel7'] != ''">"<xsl:value-of select="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLevel7']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "locationLevel8": <xsl:choose><xsl:when test="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLevel8'] != ''">"<xsl:value-of select="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLevel8']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>
        },</xsl:if><xsl:if test="tuple[@name='AssParentObjectRef']/atom[@name='irn'] !=''">
        "parentIRN": <xsl:value-of select="tuple[@name='AssParentObjectRef']/atom[@name='irn']"/>,</xsl:if><xsl:if test="atom[@name='TitObjectStatus'] = 'Deaccessioned'">
        "deaccession": {
            "deaccessionMethod": <xsl:choose><xsl:when test="table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionMethod'] != ''">"<xsl:value-of select="table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionMethod']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "deaccessionDate": <xsl:choose><xsl:when test="table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionDate'] != ''">"<xsl:value-of select="table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionDate']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "deaccessionNotes": <xsl:choose><xsl:when test="table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionNotes'] != ''">"<xsl:value-of select="replace(replace(table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionNotes'], '\n', '\\n'), '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "deaccessionTranferDate": <xsl:choose><xsl:when test="table[@name='DeaccessionDetails']/tuple/atom[@name='DeaTransferDate'] != ''">"<xsl:value-of select="table[@name='DeaccessionDetails']/tuple/atom[@name='DeaTransferDate']"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "deaccessionTransferNotes": <xsl:choose><xsl:when test="table[@name='DeaccessionDetails']/tuple/atom[@name='DeaTransferNotes'] != ''">"<xsl:value-of select="replace(replace(table[@name='DeaccessionDetails']/tuple/atom[@name='DeaTransferNotes'], '\n', '\\n'), '&quot;', '\\&quot;')"/>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>
        },</xsl:if><xsl:if test="table[@name='DeaccessionTo']">
        "deaccessionedTo": {
            "irn": <xsl:value-of select="table[@name='DeaccessionTo']/tuple/tuple/atom[@name='irn']"/>,
            "dateModified": "<xsl:value-of select="table[@name='DeaccessionTo']/tuple/tuple/atom[@name='AdmDateModified']"/>"
        }</xsl:if>
        "dateModified": "<xsl:value-of select="atom[@name='AdmDateModified']"/>"
    }<xsl:if test="position() != last()">,
    </xsl:if></xsl:for-each>]
}</xsl:template>

</xsl:stylesheet>