<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="json"/>

<xsl:template match="/">{"objects": [
    <xsl:for-each select="table[@name='ecatalogue']/tuple"><xsl:sort select="atom[@name='irn']" data-type="number"/>{
        "irn": <xsl:value-of select="atom[@name='irn']"/>,
        "publish": <xsl:choose><xsl:when test="atom[@name='AdmPublishWebNoPassword'] = 'Yes'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose>,
        "status": "<xsl:value-of select="atom[@name='TitObjectStatus']"/>",
        "accessionNumber": "<xsl:value-of select="atom[@name='TitAccessionNo']"/>",
        "previousID": "<xsl:choose><xsl:when test="contains(atom[@name='TitPreviousAccessionNo'], 'No TR Number')"></xsl:when><xsl:otherwise><xsl:value-of select="atom[@name='TitPreviousAccessionNo']"/></xsl:otherwise></xsl:choose>",
        "accessionDate": "<xsl:value-of select="atom[@name='TitAccessionDate']"/>",
        "title": "<xsl:value-of select="translate(translate(atom[@name='TitMainTitle'], '&#xd;', '\\&#xd;'), '&quot;', '\\&quot;')"/>",
        "seriesTitle": "<xsl:value-of select="translate(translate(atom[@name='TitSeriesTitle'], '&#xd;', '\\&#xd;'), '&quot;', '\\&quot;')"/>",
        "collectionTitle": "<xsl:value-of select="translate(translate(atom[@name='TitCollectionTitle'], '&#xd;', '\\&#xd;'), '&quot;', '\\&quot;')"/>",
        "altTitles": [<xsl:for-each select="table[@name='AltTitles']/tuple">"<xsl:value-of select="translate(translate(atom[@name='TitAlternateTitles'], '&#xd;', '\\&#xd;'), '&quot;', '\\&quot;')"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "creators": [<xsl:for-each select="table[@name='Creator']/tuple">
            {
                "irn": <xsl:value-of select="atom[@name='irn']"/>,
                "role": "<xsl:value-of select="atom[@name='CreRole']"/>",
                "attribution": "<xsl:value-of select="atom[@name='CreCreatorAfterFollower']"/>",
                "dateModified": "<xsl:value-of select="atom[@name='AdmDateModified']"/>"
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
        "cultures": [<xsl:for-each select="table[@name='Culture']/tuple">
            {
                "attribution": "<xsl:value-of select="atom[@name='CreCreatorAttribution']"/>",
                "culture": "<xsl:value-of select="atom[@name='CreCreationCultureOrPeople']"/>",
                "nationality": "<xsl:value-of select="atom[@name='CreCreationNationality2']"/>"
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
        "dateCreated": "<xsl:value-of select="atom[@name='CreDateCreated']"/>",
        "dateCreatedEarliest": "<xsl:value-of select="atom[@name='CreEarliestDate']"/>",
        "dateCreatedLatest": "<xsl:value-of select="atom[@name='CreLatestDate']"/>",
        "dateDesigned": "<xsl:value-of select="atom[@name='CreDateDesigned']"/>",
        "dateDesignedEarliest": "<xsl:value-of select="atom[@name='CreEarliestDesignDate']"/>",
        "dateDesignedLatest": "<xsl:value-of select="atom[@name='CreLatestDesignDate']"/>",
        "period": "<xsl:value-of select="atom[@name='CreCreationPeriod']"/>",
        "dynasty": "<xsl:value-of select="atom[@name='CreCreationDynasty']"/>",
        "creationLocations": [<xsl:for-each select="table[@name='CreLocation']/tuple">{
            "country": "<xsl:value-of select="atom[@name='CreCountry']"/>",
            "state": "<xsl:value-of select="atom[@name='CreState']"/>",
            "district": "<xsl:value-of select="atom[@name='CreDistrict']"/>",
            "city": "<xsl:value-of select="atom[@name='CreCity']"/>"}<xsl:if test="position() != last()">,
            </xsl:if></xsl:for-each>],
        "recordType": "<xsl:value-of select="atom[@name='TitObjectType']"/>",
        "objectTypes": [<xsl:for-each select="table[@name='ObjType']/tuple">"<xsl:value-of select="atom[@name='PhyMediaCategory']"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "mediums": [<xsl:for-each select="table[@name='Medium']/tuple">"<xsl:value-of select="atom[@name='PhyMedium']"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "supports": [<xsl:for-each select="table[@name='Support']/tuple">"<xsl:value-of select="atom[@name='PhySupport']"/>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "mediumSupport": "<xsl:value-of select="translate(translate(atom[@name='PhyMediumAndSupport'], '&#xd;', '\\&#xd;'), '&quot;', '\\&quot;')"/>",
        "technique": "<xsl:value-of select="atom[@name='PhyTechnique']"/>",
        "style": "<xsl:value-of select="atom[@name='PhyStyle']"/>",
        "mark": {
            "markType": "<xsl:value-of select="table[@name='MarkType']/atom[@name='CreMarkType']"/>",
            "inscription": "<xsl:value-of select="translate(translate(table[@name='MarkType']/atom[@name='CrePrimary Inscriptions'], '&#xd;', '\\&#xd;'), '&quot;', '\\&quot;')"/>"
        },
        "physicalDescription": "<xsl:value-of select="translate(translate(atom[@name='PhyDescription'], '&#xd;', '\\&#xd;'), '&quot;', '\\&quot;')"/>",
        "subjectDescription": "<xsl:value-of select="translate(translate(atom[@name='CreSubjectDescriptions'], '&#xd;', '\\&#xd;'), '&quot;', '\\&quot;')"/>",
        "subjectIdentity": "<xsl:value-of select="translate(translate(atom[@name='CreSubjectIdentification'], '&#xd;', '\\&#xd;'), '&quot;', '\\&quot;')"/>",
        "subjectInterpretation": "<xsl:value-of select="translate(translate(atom[@name='CreSubjectInterpretation'], '&#xd;', '\\&#xd;'), '&quot;', '\\&quot;')"/>",<xsl:if test="table[@name='Printer']">
        "printer": {
            "irn": <xsl:value-of select="table[@name='Printer']/atom[@name='irn']"/>,
            "dateModified": "<xsl:value-of select="table[@name='Printer']/atom[@name='AdmDateModified']"/>"
        },</xsl:if><xsl:if test="table[@name='Publishers']">
        "publisher": {
            "irn": <xsl:value-of select="table[@name='Publisher']/atom[@name='irn']"/>,
            "dateModified": "<xsl:value-of select="table[@name='Publisher']/atom[@name='AdmDateModified']"/>"
        },</xsl:if>
        "convertedDimensions": "<xsl:value-of select="translate(translate(atom[@name='PhyConvertedDims'], '&#xd;', '\\&#xd;'), '&quot;', '\\&quot;')"/>",<xsl:if test="table[@name='Dimensions']">
        "dimensions": [<xsl:for-each select="table[@name='Dimensions']/tuple">
            {
                "type": "<xsl:value-of select="atom[@name='PhyType']"/>",
                "height": <xsl:choose><xsl:when test="atom[@name='PhyHeight'] != ''"><xsl:value-of select="atom[@name='PhyHeight']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "width": <xsl:choose><xsl:when test="atom[@name='PhyWidth'] != ''"><xsl:value-of select="atom[@name='PhyWidth']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "depth": <xsl:choose><xsl:when test="atom[@name='PhyDepth'] != ''"><xsl:value-of select="atom[@name='PhyDepth']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "diamter": <xsl:choose><xsl:when test="atom[@name='PhyDiameter'] != ''"><xsl:value-of select="atom[@name='PhyDiameter']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "lengthUnit": "<xsl:value-of select="atom[@name='PhyUnitLength']"/>",
                "weight": <xsl:choose><xsl:when test="atom[@name='PhyWeight'] != ''"><xsl:value-of select="atom[@name='PhyWeight']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "weightUnit": "<xsl:value-of select="atom[@name='PhyUnitWeight']"/>",
                "notes": "<xsl:value-of select="translate(translate(atom[@name='PhyDimensionNotes'], '&#xd;', '\\&#xd;'), '&quot;', '\\&quot;')"/>"
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],</xsl:if>
        "creditLine": "<xsl:value-of select="translate(translate(atom[@name='SumCreditLine'], '&#xd;', '\\&#xd;'), '&quot;', '\\&quot;')"/>",<xsl:if test="table[@name='Rights']">
        "rights": [<xsl:for-each select="table[@name='Rights']/tuple">
            {
                "irn": <xsl:value-of select="atom[@name='irn']"/>,
                "dateModified": "<xsl:value-of select="atom[@name='AdmDateModified']"/>",
                "type": "<xsl:value-of select="atom[@name='RigType']"/>",
            "rightsStatement": "<xsl:value-of select="translate(translate(atom[@name='RigAcknowledgement'], '&#xd;', '\\&#xd;'), '&quot;', '\\&quot;')"/>"
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],</xsl:if>
        "dateModified": "<xsl:value-of select="atom[@name='AdmDateModified']"/>"
    }<xsl:if test="position() != last()">,
    </xsl:if></xsl:for-each>]
}</xsl:template>

</xsl:stylesheet>