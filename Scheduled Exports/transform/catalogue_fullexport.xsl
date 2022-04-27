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
        "status": "<xsl:value-of select="replace(atom[@name='TitObjectStatus'], '&quot;', '\\&quot;')"/>",
        "accessionNumber": "<xsl:value-of select="replace(atom[@name='TitAccessionNo'], '&quot;', '\\&quot;')"/>",
        "previousID": "<xsl:choose><xsl:when test="contains(lower-case(atom[@name='TitPreviousAccessionNo']), 'no tr number')"></xsl:when><xsl:otherwise><xsl:value-of select="replace(atom[@name='TitPreviousAccessionNo'], '&quot;', '\\&quot;')"/></xsl:otherwise></xsl:choose>",
        "accessionDate": "<xsl:value-of select="atom[@name='TitAccessionDate']"/>",
        "title": "<xsl:value-of select="replace(atom[@name='TitMainTitle'], '&quot;', '\\&quot;')"/>",
        "seriesTitle": "<xsl:value-of select="replace(atom[@name='TitSeriesTitle'], '&quot;', '\\&quot;')"/>",
        "portfolioTitle": "<xsl:value-of select="replace(atom[@name='TitCollectionTitle'], '&quot;', '\\&quot;')"/>",
        "altTitles": [<xsl:for-each select="table[@name='AltTitles']/tuple">"<xsl:value-of select="replace(atom[@name='TitAlternateTitles'], '&quot;', '\\&quot;')"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "creators": [<xsl:for-each select="table[@name='Creator']/tuple">
            {
                "irn": <xsl:value-of select="atom[@name='irn']"/>,
                "role": "<xsl:value-of select="replace(atom[@name='CreRole'], '&quot;', '\\&quot;')"/>",
                "attribution": "<xsl:value-of select="replace(atom[@name='CreCreatorAfterFollower'], '&quot;', '\\&quot;')"/>",
                "dateModified": "<xsl:value-of select="atom[@name='AdmDateModified']"/>"
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
        "cultures": [<xsl:for-each select="table[@name='Culture']/tuple">
            {
                "attribution": "<xsl:value-of select="replace(atom[@name='CreCreatorAttribution'], '&quot;', '\\&quot;')"/>",
                "culture": "<xsl:value-of select="replace(atom[@name='CreCreationCultureOrPeople'], '&quot;', '\\&quot;')"/>",
                "nationality": "<xsl:value-of select="replace(atom[@name='CreCreationNationality2'], '&quot;', '\\&quot;')"/>"
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
        "dateCreated": "<xsl:value-of select="replace(atom[@name='CreDateCreated'], '&quot;', '\\&quot;')"/>",
        "dateCreatedEarliest": "<xsl:value-of select="atom[@name='CreEarliestDate']"/>",
        "dateCreatedLatest": "<xsl:value-of select="atom[@name='CreLatestDate']"/>",
        "dateDesigned": "<xsl:value-of select="replace(atom[@name='CreDateDesigned'], '&quot;', '\\&quot;')"/>",
        "dateDesignedEarliest": "<xsl:value-of select="atom[@name='CreEarliestDesignDate']"/>",
        "dateDesignedLatest": "<xsl:value-of select="atom[@name='CreLatestDesignDate']"/>",
        "period": "<xsl:value-of select="replace(atom[@name='CreCreationPeriod'], '&quot;', '\\&quot;')"/>",
        "dynasty": "<xsl:value-of select="replace(atom[@name='CreCreationDynasty'], '&quot;', '\\&quot;')"/>",
        "creationLocations": [<xsl:for-each select="table[@name='CreLocation']/tuple">{
            "country": "<xsl:value-of select="replace(atom[@name='CreCountry'], '&quot;', '\\&quot;')"/>",
            "state": "<xsl:value-of select="replace(atom[@name='CreState'], '&quot;', '\\&quot;')"/>",
            "district": "<xsl:value-of select="replace(atom[@name='CreDistrict'], '&quot;', '\\&quot;')"/>",
            "city": "<xsl:value-of select="replace(atom[@name='CreCity'], '&quot;', '\\&quot;')"/>"}<xsl:if test="position() != last()">,
            </xsl:if></xsl:for-each>],
        "recordType": "<xsl:value-of select="replace(atom[@name='TitObjectType'], '&quot;', '\\&quot;')"/>",
        "objectTypes": [<xsl:for-each select="table[@name='ObjType']/tuple">"<xsl:value-of select="replace(atom[@name='PhyMediaCategory'], '&quot;', '\\&quot;')"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "mediums": [<xsl:for-each select="table[@name='Medium']/tuple">"<xsl:value-of select="replace(atom[@name='PhyMedium'], '&quot;', '\\&quot;')"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "supports": [<xsl:for-each select="table[@name='Support']/tuple">"<xsl:value-of select="replace(atom[@name='PhySupport'], '&quot;', '\\&quot;')"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "mediumSupport": "<xsl:value-of select="replace(replace(atom[@name='PhyMediumAndSupport'], '\n', '\\n'), '&quot;', '\\&quot;')"/>",
        "technique": "<xsl:value-of select="replace(atom[@name='PhyTechnique'], '&quot;', '\\&quot;')"/>",
        "style": "<xsl:value-of select="replace(atom[@name='PhyStyle'], '&quot;', '\\&quot;')"/>",
        "mark": {
            "markType": "<xsl:value-of select="replace(table[@name='MarkType']/atom[@name='CreMarkType'], '&quot;', '\\&quot;')"/>",
            "inscription": "<xsl:value-of select="replace(replace(table[@name='MarkType']/atom[@name='CrePrimary Inscriptions'], '\n', '\\n'), '&quot;', '\\&quot;')"/>"
        },
        "physicalDescription": "<xsl:value-of select="replace(replace(atom[@name='PhyDescription'], '\n', '\\n'), '&quot;', '\\&quot;')"/>",
        "subjectDescription": "<xsl:value-of select="replace(replace(atom[@name='CreSubjectDescriptions'], '\n', '\\n'), '&quot;', '\\&quot;')"/>",
        "subjectIdentity": "<xsl:value-of select="replace(replace(atom[@name='CreSubjectIdentification'], '\n', '\\n'), '&quot;', '\\&quot;')"/>",
        "subjectInterpretation": "<xsl:value-of select="replace(replace(atom[@name='CreSubjectInterpretation'], '\n', '\\n'), '&quot;', '\\&quot;')"/>",<xsl:if test="table[@name='Printer']">
        "printer": {
            "irn": <xsl:value-of select="table[@name='Printer']/atom[@name='irn']"/>,
            "dateModified": "<xsl:value-of select="table[@name='Printer']/atom[@name='AdmDateModified']"/>"
        },</xsl:if><xsl:if test="table[@name='Publishers']">
        "publisher": {
            "irn": <xsl:value-of select="table[@name='Publisher']/atom[@name='irn']"/>,
            "dateModified": "<xsl:value-of select="table[@name='Publisher']/atom[@name='AdmDateModified']"/>"
        },</xsl:if>
        "convertedDimensions": "<xsl:value-of select="replace(replace(atom[@name='PhyConvertedDims'], '\n', '\\n'), '&quot;', '\\&quot;')"/>",<xsl:if test="table[@name='Dimensions']">
        "dimensions": [<xsl:for-each select="table[@name='Dimensions']/tuple">
            {
                "type": "<xsl:value-of select="replace(atom[@name='PhyType'], '&quot;', '\\&quot;')"/>",
                "height": <xsl:choose><xsl:when test="atom[@name='PhyHeight'] != ''"><xsl:value-of select="atom[@name='PhyHeight']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "width": <xsl:choose><xsl:when test="atom[@name='PhyWidth'] != ''"><xsl:value-of select="atom[@name='PhyWidth']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "depth": <xsl:choose><xsl:when test="atom[@name='PhyDepth'] != ''"><xsl:value-of select="atom[@name='PhyDepth']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "diamter": <xsl:choose><xsl:when test="atom[@name='PhyDiameter'] != ''"><xsl:value-of select="atom[@name='PhyDiameter']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "lengthUnit": "<xsl:value-of select="atom[@name='PhyUnitLength']"/>",
                "weight": <xsl:choose><xsl:when test="atom[@name='PhyWeight'] != ''"><xsl:value-of select="atom[@name='PhyWeight']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "weightUnit": "<xsl:value-of select="atom[@name='PhyUnitWeight']"/>",
                "notes": "<xsl:value-of select="replace(atom[@name='PhyDimensionNotes'], '&quot;', '\\&quot;')"/>"
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],</xsl:if>
        "creditLine": "<xsl:value-of select="replace(replace(atom[@name='SumCreditLine'], '\n', '\\n'), '&quot;', '\\&quot;')"/>",<xsl:if test="table[@name='Rights']">
        "rights": [<xsl:for-each select="table[@name='Rights']/tuple">
            {
                "irn": <xsl:value-of select="atom[@name='irn']"/>,
                "dateModified": "<xsl:value-of select="atom[@name='AdmDateModified']"/>",
                "type": "<xsl:value-of select="atom[@name='RigType']"/>",
                "rightsStatement": "<xsl:value-of select="replace(replace(atom[@name='RigAcknowledgement'], '\n', '\\n'), '&quot;', '\\&quot;')"/>"
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],</xsl:if>
        "provenance": "<xsl:value-of select="replace(replace(atom[@name='CreProvenance'], '\n', '\\n'), '&quot;', '\\&quot;')"/>",
        "department": "<xsl:value-of select="replace(atom[@name='PhyCollectionArea'], '&quot;', '\\&quot;')"/>",
        "currentLocType": "<xsl:value-of select="replace(atom[@name='LocMovementType'], '&quot;', '\\&quot;')"/>",<xsl:if test="tuple[@name='LocCurrentLocationRef']/atom[@name='irn'] != ''">
        "curLocation": {
            "irn": <xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='irn']"/>,
            "dateModified": "<xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='AdmDateModified']"/>",
            "locationType": "<xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLocationType']"/>",
            "locationCode": "<xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLocationCode']"/>",
            "locationLevel1": "<xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel1']"/>",
            "locationLevel2": "<xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel2']"/>",
            "locationLevel3": "<xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel3']"/>",
            "locationLevel4": "<xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel4']"/>",
            "locationLevel5": "<xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel5']"/>",
            "locationLevel6": "<xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel6']"/>",
            "locationLevel7": "<xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel7']"/>",
            "locationLevel8": "<xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel8']"/>"
        },</xsl:if><xsl:if test="tuple[@name='LocPermanentLocationRef']/atom[@name='irn'] != ''">
        "permLocation": {
            "irn": <xsl:value-of select="tuple[@name='LocPermanentLocationRef']/atom[@name='irn']"/>,
            "dateModified": "<xsl:value-of select="tuple[@name='LocPermanentLocationRef']/atom[@name='AdmDateModified']"/>",
            "locationType": "<xsl:value-of select="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLocationType']"/>",
            "locationCode": "<xsl:value-of select="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLocationCode']"/>",
            "locationLevel1": "<xsl:value-of select="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLevel1']"/>",
            "locationLevel2": "<xsl:value-of select="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLevel2']"/>",
            "locationLevel3": "<xsl:value-of select="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLevel3']"/>",
            "locationLevel4": "<xsl:value-of select="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLevel4']"/>",
            "locationLevel5": "<xsl:value-of select="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLevel5']"/>",
            "locationLevel6": "<xsl:value-of select="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLevel6']"/>",
            "locationLevel7": "<xsl:value-of select="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLevel7']"/>",
            "locationLevel8": "<xsl:value-of select="tuple[@name='LocPermanentLocationRef']/atom[@name='LocLevel8']"/>"
        },</xsl:if><xsl:if test="tuple[@name='AssParentObjectRef']/atom[@name='irn'] !=''">
        "parentIRN": <xsl:value-of select="tuple[@name='AssParentObjectRef']/atom[@name='irn']"/>,</xsl:if><xsl:if test="atom[@name='TitObjectStatus'] = 'Deaccessioned'">
        "deaccession": {
            "deaccessionMethod": "<xsl:value-of select="table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionMethod']"/>",
            "deaccessionDate": "<xsl:value-of select="table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionDate']"/>",
            "deaccessionNotes": "<xsl:value-of select="replace(replace(table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionNotes'], '\n', '\\n'), '&quot;', '\\&quot;')"/>",
            "deaccessionTranferDate": "<xsl:value-of select="table[@name='DeaccessionDetails']/tuple/atom[@name='DeaTransferDate']"/>",
            "deaccessionTransferNotes": "<xsl:value-of select="table[@name='DeaccessionDetails']/tuple/atom[@name='DeaTransferNotes']"/>"
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