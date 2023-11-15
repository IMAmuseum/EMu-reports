<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text"/>

<xsl:template match="/">{"objects": [
    <xsl:for-each select="table[@name='ecatalogue']/tuple"><xsl:sort select="atom[@name='irn']" data-type="number"/>{
        "emu_irn": <xsl:value-of select="atom[@name='irn']"/>,
        "dagwood_id": <xsl:choose><xsl:when test="table[@name='GUIDs']/tuple[atom[@name='AdmGUIDType'] = 'Dagwood ID' and normalize-space(atom[@name='AdmGUIDValue']) != '']"><xsl:value-of select="table[@name='GUIDs']/tuple[atom[@name='AdmGUIDType'] = 'Dagwood ID']/atom[@name='AdmGUIDValue']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "flags": [<xsl:for-each select="table[@name='Flags']/tuple[normalize-space(atom[@name='TitObjectRating']) != '']">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='TitObjectRating']"/></xsl:with-param></xsl:call-template>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "publish": <xsl:choose><xsl:when test="atom[@name='AdmPublishWebNoPassword'] = 'Yes'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose>,
        "status": <xsl:choose><xsl:when test="normalize-space(atom[@name='TitObjectStatus']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='TitObjectStatus']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "accession_number": <xsl:choose><xsl:when test="normalize-space(atom[@name='TitAccessionNo']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='TitAccessionNo']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "previous_id": <xsl:choose><xsl:when test="contains(lower-case(atom[@name='TitPreviousAccessionNo']), 'no tr number')">null</xsl:when><xsl:when test="normalize-space(atom[@name='TitPreviousAccessionNo']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='TitPreviousAccessionNo']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "date_accessioned_year": <xsl:choose><xsl:when test="string-length(atom[@name='TitAccessionDate']) = 4"><xsl:value-of select="atom[@name='TitAccessionDate']"/></xsl:when><xsl:when test="string-length(atom[@name='TitAccessionDate']) = 7"><xsl:value-of select="substring-before(atom[@name='TitAccessionDate'], '-')"/></xsl:when><xsl:when test="string-length(atom[@name='TitAccessionDate']) = 10"><xsl:value-of select="substring-before(atom[@name='TitAccessionDate'], '-')"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "date_accessioned_month": <xsl:choose><xsl:when test="string-length(atom[@name='TitAccessionDate']) = 4">null</xsl:when><xsl:when test="string-length(atom[@name='TitAccessionDate']) = 7"><xsl:value-of select="number(substring-after(atom[@name='TitAccessionDate'], '-'))"/></xsl:when><xsl:when test="string-length(atom[@name='TitAccessionDate']) = 10"><xsl:value-of select="number(substring-before(substring-after(atom[@name='TitAccessionDate'], '-'),'-'))"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "date_accessioned_day": <xsl:choose><xsl:when test="string-length(atom[@name='TitAccessionDate']) = 4">null</xsl:when><xsl:when test="string-length(atom[@name='TitAccessionDate']) = 7">null</xsl:when><xsl:when test="string-length(atom[@name='TitAccessionDate']) = 10"><xsl:value-of select="number(substring-after(substring-after(atom[@name='TitAccessionDate'], '-'), '-'))"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "title": <xsl:choose><xsl:when test="normalize-space(atom[@name='TitMainTitle']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='TitMainTitle']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "series_title": <xsl:choose><xsl:when test="normalize-space(atom[@name='TitSeriesTitle']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='TitSeriesTitle']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "portfolio_title": <xsl:choose><xsl:when test="normalize-space(atom[@name='TitCollectionTitle']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='TitCollectionTitle']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "alt_titles": [<xsl:for-each select="table[@name='AltTitles']/tuple[normalize-space(atom[@name='TitAlternateTitles']) != '']">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='TitAlternateTitles']"/></xsl:with-param></xsl:call-template>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "creators": [<xsl:for-each select="table[@name='Creator']/tuple[atom[@name='irn'] != '' or contains(lower-case(atom[@name='CreRole']), 'unknown') or contains(lower-case(atom[@name='CreCreatorAfterFollower']), 'unknown')]">
            {
                "creator_irn": <xsl:choose><xsl:when test="atom[@name='irn'] != ''"><xsl:value-of select="atom[@name='irn']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "role": <xsl:choose><xsl:when test="normalize-space(atom[@name='CreRole']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='CreRole']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "attribution": <xsl:choose><xsl:when test="normalize-space(atom[@name='CreCreatorAfterFollower']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='CreCreatorAfterFollower']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
        "cultures": [<xsl:for-each select="table[@name='Culture']/tuple[atom[@name='CreCreationNationality2'] != '' and atom[@name='CreCreationCultureOrPeople'] != '']">
            {
                "attribution": <xsl:choose><xsl:when test="normalize-space(atom[@name='CreCreatorAttribution']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='CreCreatorAttribution']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "culture": <xsl:choose><xsl:when test="normalize-space(atom[@name='CreCreationCultureOrPeople']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='CreCreationCultureOrPeople']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "nationality": <xsl:choose><xsl:when test="normalize-space(atom[@name='CreCreationNationality2']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='CreCreationNationality2']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
        "date_created": <xsl:choose><xsl:when test="normalize-space(atom[@name='CreDateCreated']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='CreDateCreated']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "date_created_earliest": <xsl:choose><xsl:when test="starts-with(atom[@name='CreEarliestDate'], '-')"><xsl:value-of select="atom[@name='CreEarliestDate']"/></xsl:when><xsl:when test="string-length(atom[@name='CreEarliestDate']) = 4"><xsl:value-of select="atom[@name='CreEarliestDate']"/></xsl:when><xsl:when test="string-length(atom[@name='CreEarliestDate']) = 5 and contains(atom[@name='CreEarliestDate'], '-')"><xsl:value-of select="substring-before(atom[@name='CreEarliestDate'], '-')"/></xsl:when><xsl:when test="string-length(atom[@name='CreEarliestDate']) = 7 and contains(atom[@name='CreEarliestDate'], '-')"><xsl:value-of select="substring-before(atom[@name='CreEarliestDate'], '-')"/></xsl:when><xsl:when test="string-length(atom[@name='CreEarliestDate']) = 8 and contains(atom[@name='CreEarliestDate'], '-')"><xsl:value-of select="substring-before(atom[@name='CreEarliestDate'], '-')"/></xsl:when><xsl:when test="string-length(atom[@name='CreEarliestDate']) = 10 and contains(atom[@name='CreEarliestDate'], '-')"><xsl:value-of select="substring-before(atom[@name='CreEarliestDate'], '-')"/></xsl:when><xsl:when test="normalize-space(atom[@name='CreEarliestDate']) != ''"><xsl:value-of select="atom[@name='CreEarliestDate']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "date_created_latest": <xsl:choose><xsl:when test="starts-with(atom[@name='CreLatestDate'], '-')"><xsl:value-of select="atom[@name='CreLatestDate']"/></xsl:when><xsl:when test="string-length(atom[@name='CreLatestDate']) = 4"><xsl:value-of select="atom[@name='CreLatestDate']"/></xsl:when><xsl:when test="string-length(atom[@name='CreLatestDate']) = 5 and contains(atom[@name='CreLatestDate'], '-')"><xsl:value-of select="substring-before(atom[@name='CreLatestDate'], '-')"/></xsl:when><xsl:when test="string-length(atom[@name='CreLatestDate']) = 7 and contains(atom[@name='CreLatestDate'], '-')"><xsl:value-of select="substring-before(atom[@name='CreLatestDate'], '-')"/></xsl:when><xsl:when test="string-length(atom[@name='CreLatestDate']) = 8 and contains(atom[@name='CreLatestDate'], '-')"><xsl:value-of select="substring-before(atom[@name='CreLatestDate'], '-')"/></xsl:when><xsl:when test="string-length(atom[@name='CreLatestDate']) = 10 and contains(atom[@name='CreLatestDate'], '-')"><xsl:value-of select="substring-before(atom[@name='CreLatestDate'], '-')"/></xsl:when><xsl:when test="normalize-space(atom[@mane='CreLatestDate']) != ''"><xsl:value-of select="atom[@name='CreLatestDate']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "date_designed": <xsl:choose><xsl:when test="normalize-space(atom[@name='CreDateDesigned']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='CreDateDesigned']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "date_designed_earliest": <xsl:choose><xsl:when test="starts-with(atom[@name='CreEarliestDesignDate'], '-')"><xsl:value-of select="atom[@name='CreEarliestDesignDate']"/></xsl:when><xsl:when test="string-length(atom[@name='CreEarliestDesignDate']) = 4"><xsl:value-of select="atom[@name='CreEarliestDesignDate']"/></xsl:when><xsl:when test="string-length(atom[@name='CreEarliestDesignDate']) = 5 and contains(atom[@name='CreEarliestDesignDate'], '-')"><xsl:value-of select="substring-before(atom[@name='CreEarliestDesignDate'], '-')"/></xsl:when><xsl:when test="string-length(atom[@name='CreEarliestDesignDate']) = 7 and contains(atom[@name='CreEarliestDesignDate'], '-')"><xsl:value-of select="substring-before(atom[@name='CreEarliestDesignDate'], '-')"/></xsl:when><xsl:when test="string-length(atom[@name='CreEarliestDesignDate']) = 8 and contains(atom[@name='CreEarliestDesignDate'], '-')"><xsl:value-of select="substring-before(atom[@name='CreEarliestDesignDate'], '-')"/></xsl:when><xsl:when test="string-length(atom[@name='CreEarliestDesignDate']) = 10 and contains(atom[@name='CreEarliestDesignDate'], '-')"><xsl:value-of select="substring-before(atom[@name='CreEarliestDesignDate'], '-')"/></xsl:when><xsl:when test="normalize-space(atom[@name='CreEarliestDesignDate']) != ''"><xsl:value-of select="atom[@name='CreEarliestDesignDate']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "date_designed_latest": <xsl:choose><xsl:when test="starts-with(atom[@name='CreLatestDesignDate'], '-')"><xsl:value-of select="atom[@name='CreLatestDesignDate']"/></xsl:when><xsl:when test="string-length(atom[@name='CreLatestDesignDate']) = 4"><xsl:value-of select="atom[@name='CreLatestDesignDate']"/></xsl:when><xsl:when test="string-length(atom[@name='CreLatestDesignDate']) = 5 and contains(atom[@name='CreLatestDesignDate'], '-')"><xsl:value-of select="substring-before(atom[@name='CreLatestDesignDate'], '-')"/></xsl:when><xsl:when test="string-length(atom[@name='CreLatestDesignDate']) = 7 and contains(atom[@name='CreLatestDesignDate'], '-')"><xsl:value-of select="substring-before(atom[@name='CreLatestDesignDate'], '-')"/></xsl:when><xsl:when test="string-length(atom[@name='CreLatestDesignDate']) = 8 and contains(atom[@name='CreLatestDesignDate'], '-')"><xsl:value-of select="substring-before(atom[@name='CreLatestDesignDate'], '-')"/></xsl:when><xsl:when test="string-length(atom[@name='CreLatestDesignDate']) = 10 and contains(atom[@name='CreLatestDesignDate'], '-')"><xsl:value-of select="substring-before(atom[@name='CreLatestDesignDate'], '-')"/></xsl:when><xsl:when test="normalize-space(atom[@name='CreLatestDesignDate']) != ''"><xsl:value-of select="atom[@name='CreLatestDesignDate']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "period": <xsl:choose><xsl:when test="normalize-space(atom[@name='CreCreationPeriod']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='CreCreationPeriod']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "dynasty": <xsl:choose><xsl:when test="normalize-space(atom[@name='CreCreationDynasty']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='CreCreationDynasty']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "creation_locations": [<xsl:for-each select="table[@name='CreLoc']/tuple[normalize-space(atom[@name='CreCountry']) != '' or normalize-space(atom[@name='CreState']) != '' or normalize-space(atom[@name='CreDistrict']) != '' or normalize-space(atom[@name='CreCity']) != '']">{
            "country": <xsl:choose><xsl:when test="normalize-space(atom[@name='CreCountry']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='CreCountry']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "state": <xsl:choose><xsl:when test="normalize-space(atom[@name='CreState']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='CreState']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "district": <xsl:choose><xsl:when test="normalize-space(atom[@name='CreDistrict']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='CreDistrict']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "city": <xsl:choose><xsl:when test="normalize-space(atom[@name='CreCity']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='CreCity']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>}<xsl:if test="position() != last()">,
            </xsl:if></xsl:for-each>],
        "record_type": <xsl:choose><xsl:when test="normalize-space(atom[@name='TitObjectType']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='TitObjectType']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "object_types": [<xsl:for-each select="table[@name='ObjType']/tuple[normalize-space(atom[@name='PhyMediaCategory']) != '']">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='PhyMediaCategory']"/></xsl:with-param></xsl:call-template>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "mediums": [<xsl:for-each select="table[@name='Medium']/tuple[normalize-space(atom[@name='PhyMedium']) != '']">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='PhyMedium']"/></xsl:with-param></xsl:call-template>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "supports": [<xsl:for-each select="table[@name='Support']/tuple[normalize-space(atom[@name='PhySupport']) != '']">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='PhySupport']"/></xsl:with-param></xsl:call-template>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "medium_support": <xsl:choose><xsl:when test="normalize-space(atom[@name='PhyMediumAndSupport']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='PhyMediumAndSupport']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "technique": <xsl:choose><xsl:when test="normalize-space(atom[@name='PhyTechnique']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='PhyTechnique']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "style": <xsl:choose><xsl:when test="normalize-space(atom[@name='PhyStyle']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='PhyStyle']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "mark": {<xsl:if test="table[@name='MarkType']">
            "mark_type": [<xsl:for-each select="table[@name='MarkType']/tuple[normalize-space(atom[@name='CreMarkType']) != '']">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='CreMarkType']"/></xsl:with-param></xsl:call-template>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
            "mark_description": <xsl:choose><xsl:when test="normalize-space(atom[@name='CrePrimaryInscriptions']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='CrePrimaryInscriptions']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>
        </xsl:if>},
        "printer_irns": [<xsl:for-each select="table[@name='Printer']/tuple[atom[@name='irn'] != '']"><xsl:value-of select="atom[@name='irn']"/><xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "publisher_irns": [<xsl:for-each select="table[@name='Publisher']/tuple[atom[@name='irn'] != '']"><xsl:value-of select="atom[@name='irn']"/><xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "converted_dimensions": <xsl:choose><xsl:when test="normalize-space(atom[@name='PhyConvertedDims']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='PhyConvertedDims']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "dimensions": [<xsl:for-each select="table[@name='Dims']/tuple[
            normalize-space(atom[@name='PhyHeight']) != '' or
            normalize-space(atom[@name='PhyWidth']) != '' or
            normalize-space(atom[@name='PhyDepth']) != '' or
            normalize-space(atom[@name='PhyDiameter']) != '' or
            normalize-space(atom[@name='PhyWeight']) != '']">
            {
                "type": <xsl:choose><xsl:when test="normalize-space(atom[@name='PhyType']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='PhyType']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "height": <xsl:choose><xsl:when test="normalize-space(atom[@name='PhyHeight']) != ''"><xsl:value-of select="number(atom[@name='PhyHeight'])"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "width": <xsl:choose><xsl:when test="normalize-space(atom[@name='PhyWidth']) != ''"><xsl:value-of select="number(atom[@name='PhyWidth'])"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "depth": <xsl:choose><xsl:when test="normalize-space(atom[@name='PhyDepth']) != ''"><xsl:value-of select="number(atom[@name='PhyDepth'])"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "diameter": <xsl:choose><xsl:when test="normalize-space(atom[@name='PhyDiameter']) != ''"><xsl:value-of select="number(atom[@name='PhyDiameter'])"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "length_unit": <xsl:choose><xsl:when test="normalize-space(atom[@name='PhyUnitLength']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='PhyUnitLength']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "weight": <xsl:choose><xsl:when test="normalize-space(atom[@name='PhyWeight']) != ''"><xsl:value-of select="number(atom[@name='PhyWeight'])"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "weight_unit": <xsl:choose><xsl:when test="normalize-space(atom[@name='PhyUnitWeight']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='PhyUnitWeight']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "notes": <xsl:choose><xsl:when test="normalize-space(atom[@name='PhyDimensionNotes']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='PhyDimensionNotes']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
        "credit_line": <xsl:choose><xsl:when test="normalize-space(atom[@name='SumCreditLine']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='SumCreditLine']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "rights": [<xsl:for-each select="table[@name='Rights']/tuple[normalize-space(atom[@name='RigAcknowledgement']) != '' and atom[@name='AdmPublishWebNoPassword'] = 'Yes']">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='RigAcknowledgement']"/></xsl:with-param></xsl:call-template>"<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>],
        "rights_uris": [<xsl:for-each select="table[@name='RightsURIs']/tuple[normalize-space(atom[@name='AdmGUIDType_tab']) != '' and normalize-space(atom[@name='AdmGUIDValue_tab']) != '' and normalize-space(atom[@name='AdmPublishWebNoPassword']) = 'Yes']">
            {
                "type": "<xsl:value-of select="atom[@name='AdmGUIDType_tab']"/>",
                "uri": "<xsl:value-of select="atom[@name='AdmGUIDValue_tab']"/>"
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
        "provenance": <xsl:choose><xsl:when test="normalize-space(atom[@name='CreProvenance']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='CreProvenance']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "rank": <xsl:choose><xsl:when test="normalize-space(atom[@name='StaStocktakeStatus']) = ''">null</xsl:when><xsl:when test="normalize-space(atom[@name='StaStocktakeStatus']) = 'A'">4</xsl:when><xsl:when test="normalize-space(atom[@name='StaStocktakeStatus']) = 'B'">3</xsl:when><xsl:when test="normalize-space(atom[@name='StaStocktakeStatus']) = 'C'">2</xsl:when><xsl:when test="normalize-space(atom[@name='StaStocktakeStatus']) = 'D'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose>,
        "department": <xsl:choose><xsl:when test="normalize-space(atom[@name='PhyCollectionArea']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="substring-after(atom[@name='PhyCollectionArea'], '-')"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "on_view": <xsl:choose><xsl:when test="contains(lower-case(atom[@name='LocMovementType']), 'exhibition location')">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose>,
        "location_irn": <xsl:choose><xsl:when test="table[@name='CurLoc']/tuple/tuple[@name='LocCurrentLocationRef']/atom[@name='irn'] != ''"><xsl:value-of select="table[@name='CurLoc']/tuple/tuple[@name='LocCurrentLocationRef']/atom[@name='irn']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "parent_irn": <xsl:choose><xsl:when test="table[@name='Parent']/tuple/tuple[@name='AssParentObjectRef']/atom[@name='irn'] != ''"><xsl:value-of select="table[@name='Parent']/tuple/tuple[@name='AssParentObjectRef']/atom[@name='irn']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
        "related_objects": [<xsl:for-each select="table[@name='Related']/tuple[atom[@name='irn'] != '']">
            {
                "relationship": <xsl:choose><xsl:when test="normalize-space(atom[@name='AssRelationship']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="atom[@name='AssRelationship']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
                "object_irn": <xsl:value-of select="atom[@name='irn']"/>
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
        "guids": [<xsl:for-each select="table[@name='GUIDs']/tuple[atom[@name='AdmGUIDType'] != 'Dagwood ID' and normalize-space(atom[@name='AdmGUIDType']) != '' and normalize-space(atom[@name='AdmGUIDValue']) != '']">
            {
                "preferred": <xsl:choose><xsl:when test="atom[@name='AdmGUIDIsPreferred'] = 'Yes'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose>,
                "type": "<xsl:value-of select="atom[@name='AdmGUIDType']"/>",
                "guid": "<xsl:value-of select="atom[@name='AdmGUIDValue']"/>"
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
        "deaccession": {<xsl:if test="normalize-space(lower-case(atom[@name='TitObjectStatus'])) = 'deaccessioned'">
            "deaccession_method": <xsl:choose><xsl:when test="table[@name='DeaccessionDetails']/tuple/normalize-space(atom[@name='DeaDeaccessionMethod']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionMethod']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "deaccession_date_year": <xsl:choose><xsl:when test="string-length(table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionDate']) = 4"><xsl:value-of select="table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionDate']"/></xsl:when><xsl:when test="string-length(table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionDate']) = 7"><xsl:value-of select="substring-before(table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionDate'], '-')"/></xsl:when><xsl:when test="string-length(table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionDate']) = 10"><xsl:value-of select="substring-before(table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionDate'], '-')"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "deaccession_date_month": <xsl:choose><xsl:when test="string-length(table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionDate']) = 4">null</xsl:when><xsl:when test="string-length(table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionDate']) = 7"><xsl:value-of select="number(substring-after(table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionDate'], '-'))"/></xsl:when><xsl:when test="string-length(table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionDate']) = 10"><xsl:value-of select="number(substring-before(substring-after(table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionDate'], '-'),'-'))"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "deaccession_date_day": <xsl:choose><xsl:when test="string-length(table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionDate']) = 4">null</xsl:when><xsl:when test="string-length(table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionDate']) = 7">null</xsl:when><xsl:when test="string-length(table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionDate']) = 10"><xsl:value-of select="number(substring-after(substring-after(table[@name='DeaccessionDetails']/tuple/atom[@name='DeaDeaccessionDate'], '-'), '-'))"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "recipient": <xsl:choose><xsl:when test="table[@name='DeaccessionDetails']/tuple/tuple[atom[@name='irn'] != '']"><xsl:value-of select="table[@name='DeaccessionDetails']/tuple/tuple/atom[@name='irn']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "transfer_notes": <xsl:choose><xsl:when test="table[@name='DeaccessionDetails']/tuple/normalize-space(atom[@name='DeaTransferNotes']) != ''">"<xsl:call-template name="escape_characters"><xsl:with-param name="input_string"><xsl:value-of select="table[@name='DeaccessionDetails']/tuple/atom[@name='DeaTransferNotes']"/></xsl:with-param></xsl:call-template>"</xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose>,
            "sale_price": <xsl:choose><xsl:when test="table[@name='Valuation']/tuple/contains(lower-case(atom[@name='ValReasonForValuation']), 'auction sale price') and table[@name='Valuation']/tuple/normalize-space(atom[@name='ValValuationAmount']) != ''"><xsl:value-of select="table[@name='Valuation']/tuple/atom[@name='ValValuationAmount']"/></xsl:when><xsl:otherwise>null</xsl:otherwise></xsl:choose><xsl:text>
        </xsl:text></xsl:if>},
        "date_modified": "<xsl:value-of select="atom[@name='AdmDateModified']"/>"
    }<xsl:if test="position() != last()">,
    </xsl:if></xsl:for-each>]
}</xsl:template>
    
<xsl:template name="escape_characters">
    <xsl:param name="input_string"/>
    <xsl:value-of select="normalize-space(replace(replace(replace(replace($input_string, '\&#92;', '\&#92;\&#92;'), '\n', '\\n'), '&quot;', '\\&quot;'), '&#09;', '\\t'))"/>
</xsl:template>

</xsl:stylesheet>
