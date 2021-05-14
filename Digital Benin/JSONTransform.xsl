<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">

<xsl:output method="text"/>
    
<xsl:template match="table[@name = 'ecatalogue']">[<xsl:for-each select="tuple">
    {
        "accession_number": "<xsl:value-of select="atom[@name='TitAccessionNo']"/>",
        "previous_id": "<xsl:value-of select="atom[@name='TitPreviousAccessionNo']"/>",
        "accession_date": "<xsl:value-of select="atom[@name='TitAccessionDate']"/>",
        "number_of_parts": <xsl:value-of select="atom[@name='TitNumberOfParts']"/>,
        "title": "<xsl:value-of select="atom[@name='TitMainTitle']"/>",
        "object_type": [<xsl:for-each select="table[@name='ObjectTypes']/tuple">
            "<xsl:value-of select="atom[@name='PhyMediaCategory']"/>"<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>
        ],
        "date_created": "<xsl:value-of select="atom[@name='CreDateCreated']"/>",
        "culture_or_people": [<xsl:for-each select="table[@name='Creator2']/tuple">
            "<xsl:value-of select="atom[@name='CreCreationCultureOrPeople']"/>"<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>
        ],
        "creation_location": "<xsl:value-of select="table[@name='CreLocation']/tuple/atom[@name='CreCountry']"/>",
        "medium": [<xsl:for-each select="table[@name='Medium']/tuple">
            "<xsl:value-of select="atom[@name='PhyMedium']"/>"<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>
        ],
        "support": [<xsl:for-each select="table[@name='Support']/tuple">
            "<xsl:value-of select="atom[@name='PhySupport']"/>"<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>
        ],
        "materials": "<xsl:value-of select="atom[@name='PhyMediumAndSupport']"/>",
        "dimensions": "<xsl:value-of select="atom[@name='PhyConvertedDims']"/>",
        "credit_line": "<xsl:value-of select="atom[@name='SumCreditLine']"/>",
        "rights": "<xsl:value-of select="table[@name='Rights']/tuple/atom[@name='RigAcknowledgement']"/>",
        "provenance": "<xsl:value-of select="translate(translate(atom[@name='CreProvenance'],'{','('),'}',')')"/>",
        "url": "<xsl:for-each select="table[@name='Homepage']/tuple"><xsl:if test="atom[@name='EleIdentifier'] != ''"> http://collection.imamuseum.org/artwork/<xsl:value-of select="atom[@name='EleIdentifier']"/>/</xsl:if></xsl:for-each>",
        "narratives": [<xsl:for-each select="table[@name='Narratives']/tuple">
            {
                "title": "<xsl:value-of select="atom[@name='NarTitle']"/>",
                "purpose": "<xsl:value-of select="atom[@name='DesPurpose']"/>",
                "narrative": "<xsl:value-of select="atom[@name='NarNarrative']"/>"
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>
        ]<xsl:if test="table[@name='Exhibitions']">,
        "exhbitions": [<xsl:for-each select="table[@name='Exhibitions']/tuple">
            {
                "identifier": "<xsl:value-of select="atom[@name='EveEventNumber']"/>",
                "type": "<xsl:value-of select="atom[@name='EveTypeOfEvent']"/>",
                "title": "<xsl:value-of select="atom[@name='EveEventTitle']"/>",
                "start_date": "<xsl:value-of select="atom[@name='DatCommencementDate']"/>",
                "end_date": "<xsl:value-of select="atom[@name='DatCompletionDate']"/>"
            }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>
    ]</xsl:if>
    }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>]

</xsl:template>

</xsl:stylesheet>