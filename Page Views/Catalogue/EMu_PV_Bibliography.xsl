<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
    xmlns:emu="http://kesoftware.com/emu"
    xmlns:date="http://exslt.org/dates-and-times">
    
    <xsl:output method="html" encoding="ISO-8859-1" />
    <xsl:variable name="break"><br/></xsl:variable>
   <!--The root transformation -->
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="styles" />
                <xsl:call-template name="scripts" />
            </head>
            <body class="sheet" onLoad="loaded()">
                <xsl:call-template name="body" />
            </body>
        </html>
    </xsl:template>
    <!--
            Body template
     -->
    <xsl:template name="body">
        <xsl:for-each select="/table/tuple">
            <xsl:call-template name="record" />
            <xsl:if test="position() != last()">
                <p />
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    <!--
           CSS styles template
     -->
    <xsl:template name="styles">
        <style type="text/css">
            <xsl:text>
body.sheet
{
    background-color: #CCCCCC;
    color: #000000;
    font-family: Tahoma;
}
table.sheet
{
    width: 95%;
    border-width: 2px;
    border-style: solid;
    border-collapse: collapse;
    background-color: #EEEEEE;
    border-color: #0E6CA5;
}
td.heading
{
    background-color: #0E6CA5;
    color: #FFFFFF;
    font-weight: bold;
    padding-top: 0.5em;
    padding-bottom: 0.5em;
    padding-left: 0.5em;
    padding-right: 0.5em;
}
td.display
{
    background-color: #0E6CA5;
    color: #FFFFFF;
    font-weight: bold;
    text-align: center;
    padding-top: 0.1em;
    padding-bottom: 0.1em;
    padding-left: 0em;
    padding-right: 0em;
}
td.display2
{
    background-color: #c84630;
    color: #FFFFFF;
    font-weight: bold;
    text-align: left;
    padding-top: 0.1em;
    padding-bottom: 0.1em;
    padding-left: 0em;
    padding-right: 0em;
}
td.condition
{
    background-color: #0ea547;
    border-color: black;
    color: #FFFFFF;
    font-weight: bold;
    font-size: 20px;
    text-align: left;
    padding-top: 0.1em;
    padding-bottom: 0.1em;
    padding-left: 0em;
    padding-right: 0em;f
}
table.data
{
    width: 100%;
}
td.atomprompt
{
    width: 200px;
    font-weight: bold;
    font-size: smaller;
    vertical-align: top;
    padding-left: 0.5em;
    padding-right: 0.5em;
}
td.atomvalue
{
    font-size: smaller;
    padding-left: 0.5em;
    padding-right: 0.5em;
}
td.exhibitvalue
{
    font-size: smaller;
    color: #a50e20;
    padding: 0.25em 0.5em 0.25em 0.5em;
}
td.horprompt
{
    font-weight: bold;
    font-size: smaller;
    vertical-align: top;
    padding-left: 0.5em;
    padding-right: 0.5em;
}
</xsl:text>
        </style>
    </xsl:template>
    <!--
            Scripts template
     -->
    <xsl:template name="scripts">
        <script type="text/javascript">
            <xsl:text>
function loaded()
{
    var tables = document.getElementsByTagName("table");
    for (var index = 0; index &lt; tables.length; index++)
    {
        if (tables[index].id == "datatable")
            for (var row = 0; row &lt; tables[index].rows.length; row++)
                if (row % 2 == 0)
                    tables[index].rows[row].bgColor = "#FFFFFF";
    }
}
</xsl:text>
        </script>
    </xsl:template>
    <!--
            Record template
     -->
    <xsl:template name="record">
        <center>
            <table border="1" class="sheet" style="page-break-after: always">
                <xsl:call-template name="heading" />
                <xsl:call-template name="tombstone" />
                <xsl:call-template name="subheading1" />
                <xsl:if test="table[@name='Biblio']/tuple/atom[@name='BibRecordType'] = 'Book'"><xsl:call-template name="book" /></xsl:if>
                <xsl:if test="table[@name='Biblio']/tuple/atom[@name='BibRecordType'] = 'Catalogue'"><xsl:call-template name="catalogue" /></xsl:if>
                <xsl:if test="table[@name='Biblio']/tuple/atom[@name='BibRecordType'] = 'Journal'"><xsl:call-template name="journal" /></xsl:if>
                <xsl:if test="table[@name='Biblio']/tuple/atom[@name='BibRecordType'] = 'Article'"><xsl:call-template name="article" /></xsl:if>
                <xsl:if test="table[@name='Biblio']/tuple/atom[@name='BibRecordType'] = 'Chapter'"><xsl:call-template name="chapter" /></xsl:if>
                <xsl:if test="table[@name='Biblio']/tuple/atom[@name='BibRecordType'] = 'Digital'"><xsl:call-template name="digital" /></xsl:if>
                <xsl:if test="table[@name='Biblio']/tuple/atom[@name='BibRecordType'] = 'Other'"><xsl:call-template name="other" /></xsl:if>
            </table>
        </center>
    </xsl:template>
    <!--
            Heading template
     -->
    <xsl:template name="heading">
        <tr class="heading">
            <xsl:choose>
            <xsl:when test="atom[@name='StaStocktakeStatus']='A'">
            <td class="heading">
                <span style="color: #6BE407"><xsl:value-of select="atom[@name='StaStocktakeStatus']"/><xsl:text> - </xsl:text></span><xsl:value-of select="atom[@name='SummaryData']" />
            </td>
            </xsl:when>
            <xsl:when test="atom[@name='StaStocktakeStatus']='B'">
            <td class="heading">
                <span style="color: #FFBD08"><xsl:value-of select="atom[@name='StaStocktakeStatus']"/><xsl:text> - </xsl:text></span><xsl:value-of select="translate(atom[@name='SummaryData'], 'ä', 'a')" />
            </td>
            </xsl:when>
            <xsl:when test="atom[@name='StaStocktakeStatus']='C'">
            <td class="heading">
                <span style="color: #FF9008"><xsl:value-of select="atom[@name='StaStocktakeStatus']"/><xsl:text> - </xsl:text></span><xsl:value-of select="atom[@name='SummaryData']" />
            </td>
            </xsl:when>            
            <xsl:when test="atom[@name='StaStocktakeStatus']='D'">
            <td class="heading">
                <span style="color: #a50e20"><xsl:value-of select="atom[@name='StaStocktakeStatus']"/><xsl:text> - </xsl:text></span><xsl:value-of select="atom[@name='SummaryData']" />
            </td>
            </xsl:when>
                <xsl:when test="atom[@name='StaStocktakeStatus']='I'">
                    <td class="heading">
                        <span style="color: #000000"><xsl:value-of select="atom[@name='StaStocktakeStatus']"/><xsl:text> - </xsl:text></span><xsl:value-of select="atom[@name='SummaryData']" />
                    </td>
                </xsl:when>
            <xsl:otherwise>
            <td class="heading">
                <xsl:value-of select="atom[@name='SummaryData']" />
            </td>
            </xsl:otherwise>
            </xsl:choose>
        </tr>
    </xsl:template>
    <!--
            Tombstone template
     -->
    <xsl:template name="tombstone">
        <tr class="image">
            <td class="image">
                            <table border="0" class="data" id="datatable">
                                <tr class="atomvalue">
                                    <td class="atomprompt">
                                        Accession Number:
                                    </td>
                                    <td class="atomvalue">
                                        <xsl:value-of select="atom[@name='TitAccessionNo']" />
                                    </td>
                                </tr>
                                <tr class="atomvalue">
                                    <td class="atomprompt">
                                        Previous Number:
                                    </td>
                                    <td class="atomvalue">
                                        <xsl:value-of select="atom[@name='TitPreviousAccessionNo']" />
                                    </td>
                                </tr>
                                <tr class="atomvalue">
                                    <td class="atomprompt">
                                        Creator(s)/Culture:
                                    </td>
                                    <td class="atomvalue">
                                        <xsl:choose>
                                            <xsl:when test="table[@name='Creator']">
                                                <xsl:for-each select="table[@name='Creator']/tuple">
                                                    <xsl:choose><xsl:when test="atom[@name='CreRole'] != ''"><span style="font-style: normal"><xsl:value-of select="atom[@name='CreRole']"/><xsl:text>:  </xsl:text></span></xsl:when><xsl:otherwise><b style="font-style: normal"><xsl:text>Creator:  </xsl:text></b></xsl:otherwise></xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="atom[@name='BioNationality'] != '' and atom[@name='BioBirthDate'] != ''">
                                                            <xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''"><xsl:value-of select="translate(atom[@name='NamFullName'], 'ä','a')"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioNationality']"/><xsl:text>, </xsl:text><xsl:value-of select="atom[@name='BioBirthDate']"/><xsl:text> - </xsl:text><xsl:value-of select="atom[@name='BioDeathDate']"/><xsl:text>)</xsl:text></xsl:when><xsl:otherwise ><xsl:value-of select="atom[@name='NamOrganisation']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioNationality']"/><xsl:text>, </xsl:text><xsl:value-of select="atom[@name='BioBirthDate']"/><xsl:text> - </xsl:text><xsl:value-of select="atom[@name='BioDeathDate']"/><xsl:text>)</xsl:text></xsl:otherwise>
                                                            </xsl:choose>
                                                        </xsl:when>
                                                        <xsl:when test="atom[@name='BioNationality'] != '' and atom[@name='IMAHisCommenced'] != ''">
                                                            <xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''"><xsl:value-of select="atom[@name='NamFullName']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioNationality']"/><xsl:text>, </xsl:text><xsl:value-of select="atom[@name='IMAHisCommenced']"/><xsl:text> - </xsl:text><xsl:value-of select="atom[@name='IMAHisCompleted']"/><xsl:text>)</xsl:text></xsl:when><xsl:otherwise ><xsl:value-of select="atom[@name='NamOrganisation']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioNationality']"/><xsl:text>, </xsl:text><xsl:value-of select="atom[@name='IMAHisCommenced']"/><xsl:text> - </xsl:text><xsl:value-of select="atom[@name='IMAHisCompleted']"/><xsl:text>)</xsl:text></xsl:otherwise></xsl:choose>
                                                        </xsl:when>
                                                        <xsl:when test="atom[@name='BioNationality'] != '' and atom[@name='BioBirthDate'] = ''">
                                                            <xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''"><xsl:value-of select="atom[@name='NamFullName']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioNationality']"/><xsl:text>)</xsl:text></xsl:when><xsl:otherwise><xsl:value-of select="atom[@name='NamOrganisation']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioNationality']"/><xsl:text>)</xsl:text></xsl:otherwise></xsl:choose>
                                                        </xsl:when>
                                                        <xsl:when test="atom[@name='BioNationality'] = '' and atom[@name='BioBirthDate'] != ''">
                                                            <xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''"><xsl:value-of select="atom[@name='NamFullName']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioBirthDate']"/><xsl:text> - </xsl:text><xsl:value-of select="atom[@name='BioDeathDate']"/><xsl:text>)</xsl:text></xsl:when><xsl:otherwise><xsl:value-of select="atom[@name='NamOrganisation']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioBirthDate']"/><xsl:text> - </xsl:text><xsl:value-of select="atom[@name='BioDeathDate']"/><xsl:text>)</xsl:text></xsl:otherwise></xsl:choose>
                                                        </xsl:when>
                                                        <xsl:when test="atom[@name='BioNationality'] = '' and atom[@name='IMAHisCommenced'] != ''">
                                                            <xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''"><xsl:value-of select="atom[@name='NamFullName']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='IMAHisCommenced']"/><xsl:text> - </xsl:text><xsl:value-of select="atom[@name='IMAHisCompleted']"/><xsl:text>)</xsl:text></xsl:when><xsl:otherwise><xsl:value-of select="atom[@name='NamOrganisation']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='IMAHisCommenced']"/><xsl:text> - </xsl:text><xsl:value-of select="atom[@name='IMAHisCompleted']"/><xsl:text>)</xsl:text></xsl:otherwise></xsl:choose>
                                                        </xsl:when>
                                                        <xsl:when test="atom[@name='BioNationality'] != '' and atom[@name='BioDeathDate'] != ''">
                                                            <xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''"><xsl:value-of select="atom[@name='NamFullName']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioNationality']"/><xsl:text>, d. </xsl:text><xsl:value-of select="atom[@name='BioDeathDate']"/><xsl:text>)</xsl:text></xsl:when><xsl:otherwise ><xsl:value-of select="atom[@name='NamOrganisation']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioNationality']"/><xsl:text>, d. </xsl:text><xsl:value-of select="atom[@name='BioDeathDate']"/><xsl:text>)</xsl:text></xsl:otherwise>
                                                            </xsl:choose>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''"><xsl:value-of select="atom[@name='NamFullName']"/></xsl:when><xsl:when test="atom[@name='NamOrganisation'] != ''"><xsl:value-of select="atom[@name='NamOrganisation']"/></xsl:when><xsl:otherwise><xsl:value-of select="atom[@name='ColCollaborationName']"/></xsl:otherwise></xsl:choose>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                    <xsl:if test="position() != last()">
                                                        <br/>
                                                    </xsl:if>
                                                </xsl:for-each>
                                            </xsl:when>
                                            <xsl:when test="table[@name='Culture']">
                                                <xsl:for-each select="table[@name='Culture']/tuple">
                                                    <xsl:if test="atom[@name='CreCreationAttribution']">
                                                        <xsl:value-of select="atom[@name='CreCreationAttribution']"/><xsl:text> </xsl:text></xsl:if>
                                                    <xsl:choose>
                                                        <xsl:when test="atom[@name='CreCreationCultureOrPeople'] and atom[@name='CreCreationNationality2']">
                                                            <xsl:value-of select="atom[@name='CreCreationCultureOrPeople']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='CreCreationNationality2']"/><xsl:text>)</xsl:text>
                                                        </xsl:when>
                                                        <xsl:when test="atom[@name='CreCreationCultureOrPeople']">
                                                            <xsl:value-of select="atom[@name='CreCreationCultureOrPeople']"/>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:value-of select="atom[@name='CreCreationNationality2']"/>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:for-each>
                                                <xsl:if test="position() != last()">
                                                    <br/>
                                                </xsl:if>
                                            </xsl:when>
                                            <xsl:otherwise></xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                </tr>
                                <tr class="atomvalue">
                                    <td class="atomprompt">
                                        Title:
                                    </td>
                                    <td class="atomvalue">
                                        <xsl:value-of select="atom[@name='TitMainTitle']" />
                                    </td>
                                </tr>
                                <tr class="atomvalue">
                                    <td class="atomprompt">
                                        Object Type(s):
                                    </td>
                                    <td class="atomvalue">
                                        <xsl:for-each select="table[@name='Types']/tuple">
                                        <xsl:value-of select="atom[@name='PhyMediaCategory']" />
                                            <xsl:if test="position() != last()"><xsl:text>; </xsl:text>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </td>
                                </tr>
                                <tr class="atomvalue">
                                    <td class="atomprompt">
                                        Date Created:
                                    </td>
                                    <td class="atomvalue">
                                        <xsl:value-of select="atom[@name='CreDateCreated']" />
                                    </td>
                                </tr>
                                <tr class="atomvalue">
                                    <td class="atomprompt">
                                        Dimensions:
                                    </td>
                                    <td class="atomvalue">
                                        <xsl:value-of select="atom[@name='PhyConvertedDims']" />
                                    </td>
                                </tr>
                                <tr class="atomvalue">
                                    <td class="atomprompt">
                                        Rank:
                                    </td>
                                    <td class="atomvalue">
                                        <xsl:value-of select="atom[@name='StaStocktakeStatus']" />
                                    </td>
                                </tr>
                            </table>
            </td>
        </tr>        
    </xsl:template>
    <!--
            Biblio Heading template
     -->
    <xsl:template name="subheading1">
                <tr class="display">
                    <td class="display">
                        Bibliographic References
                    </td>
                </tr>
    </xsl:template>
    <!--
            Book template
     -->
    <xsl:template name="book">
        <tr class="display2">
            <td class="display2">
                Books
            </td>
        </tr>
        <xsl:for-each select="table[@name='Biblio']/tuple[atom[@name='BibRecordType'] = 'Book']">
            <xsl:sort select="atom[@name='BooPublicationDate']" data-type="number" order="descending"/>
            <tr class="condition">
                <td class="condition">
                    <xsl:value-of select="atom[@name='BibRecordType']"/><xsl:text> - </xsl:text><i><xsl:value-of select="atom[@name='BooTitle']"/></i>
                </td>
            </tr>
            <tr class="image">
                <td class="image">
                    <table border="0" class="data" id="datatable">
            <xsl:if test="atom[@name='RefBibliographicNotes'] != ''">
                <tr class="atomvalue">
                    <td class="atomprompt">
                        Reference Notes
                    </td>
                    <td class="atomvalue">
                        <xsl:value-of select="atom[@name='RefBibliographicNotes']" />
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="atom[@name='BooTitle'] != ''">
                <tr class="atomvalue">
                    <td class="atomprompt">
                        Title
                    </td>
                    <td class="atomvalue">
                        <i><xsl:value-of select="atom[@name='BooTitle']" /></i>
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="atom[@name='BooAbbreviatedTitle'] != ''">
                <tr class="atomvalue">
                    <td class="atomprompt">
                        Abbreviated Title
                    </td>
                    <td class="atomvalue">
                        <i><xsl:value-of select="atom[@name='BooAbbreviatedTitle']" /></i>
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="table[@name='Authors']">
                <tr class="atomvalue">
                    <td class="atomprompt">
                        Author(s)
                    </td>
                    <td class="atomvalue">
                        <xsl:for-each select="table[@name='Authors']/tuple">
                            <xsl:if test="atom[@name='BooRole'] != ''"><xsl:value-of select="atom[@name='BooRole']" /><xsl:text>: </xsl:text></xsl:if><xsl:value-of select="atom[@name='BibMultiAuthorText']"/>
                            <xsl:if test="position() != last()">
                                <br/>
                            </xsl:if>
                        </xsl:for-each>
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="atom[@name='BooVolume'] != ''">
                <tr class="atomvalue">
                    <td class="atomprompt">
                        Volume
                    </td>
                    <td class="atomvalue">
                        <xsl:value-of select="atom[@name='BooVolume']" />
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="atom[@name='BooEdition'] != ''">
                <tr class="atomvalue">
                    <td class="atomprompt">
                        Edition
                    </td>
                    <td class="atomvalue">
                        <xsl:value-of select="atom[@name='BooEdition']" />
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="atom[@name='BooPages'] != ''">
                <tr class="atomvalue">
                    <td class="atomprompt">
                        Pages
                    </td>
                    <td class="atomvalue">
                        <xsl:value-of select="atom[@name='BooPages']" />
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="atom[@name='BooISBN'] != ''">
                <tr class="atomvalue">
                    <td class="atomprompt">
                        ISBN
                    </td>
                    <td class="atomvalue">
                        <xsl:value-of select="atom[@name='BooISBN']" />
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="atom[@name='BooPublicationDate'] != ''">
                <tr class="atomvalue">
                    <td class="atomprompt">
                        Publication Date
                    </td>
                    <td class="atomvalue">
                        <xsl:value-of select="atom[@name='BooPublicationDate']" />
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="atom[@name='BooPublicationCity'] != ''">
                <tr class="atomvalue">
                    <td class="atomprompt">
                        Publication City
                    </td>
                    <td class="atomvalue">
                        <xsl:value-of select="atom[@name='BooPublicationCity']" />
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="table[@name='BooPublisher']">
                <tr class="atomvalue">
                    <td class="atomprompt">
                        Publisher
                    </td>
                    <td class="atomvalue">
                        <xsl:value-of select="table[@name='BooPublisher']/tuple/tuple/atom[@name='SummaryData']" />
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="atom[@name='BooPublicationLanguage'] != ''">
                <tr class="atomvalue">
                    <td class="atomprompt">
                        Language
                    </td>
                    <td class="atomvalue">
                        <xsl:value-of select="atom[@name='BooPublicationLanguage']" />
                    </td>
                </tr>
            </xsl:if>
                <xsl:if test="contains(atom[@name='NotNotes'], 'http')">
                                <xsl:call-template name="tokenize">
                                    <xsl:with-param name="text" select="atom[@name='NotNotes']"/>
                                </xsl:call-template>
                </xsl:if>
            </table>
                </td>
            </tr>
        </xsl:for-each>
    </xsl:template>
    <!--
            Catalogue template
     -->
    <xsl:template name="catalogue">
        <tr class="display2">
            <td class="display2">
                Catalogues
            </td>
        </tr>
        <xsl:for-each select="table[@name='Biblio']/tuple[atom[@name='BibRecordType'] = 'Catalogue']">
            <xsl:sort select="atom[@name='CatPublicationDate']" data-type="number" order="descending"/>
            <tr class="condition">
                <td class="condition">
                    <xsl:value-of select="atom[@name='BibRecordType']"/><xsl:text> - </xsl:text><i><xsl:value-of select="atom[@name='CatTitle']"/></i>
                </td>
            </tr>
            <tr class="image">
                <td class="image">
                    <table border="0" class="data" id="datatable">
                        <xsl:if test="atom[@name='RefBibliographicNotes'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Reference Notes
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='RefBibliographicNotes']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='CatTitle'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Title
                                </td>
                                <td class="atomvalue">
                                    <i><xsl:value-of select="atom[@name='CatTitle']" /></i>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='CatAbbreviatedTitle'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Abbreviated Title
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='CatAbbreviatedTitle']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="table[@name='Authors']">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Author(s)
                                </td>
                                <td class="atomvalue">
                                    <xsl:for-each select="table[@name='Authors']/tuple">
                                        <xsl:if test="atom[@name='CatRole'] != ''"><xsl:value-of select="atom[@name='CatRole']" /><xsl:text>: </xsl:text></xsl:if><xsl:value-of select="atom[@name='BibMultiAuthorText']"/>
                                        <xsl:if test="position() != last()">
                                            <br/>
                                        </xsl:if>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='CatPages'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Pages
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='CatPages']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='BooISBN'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    ISBN
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='BooISBN']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='CatPublicationDate'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Publication Date
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='CatPublicationDate']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='CatPublicationCity'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Publication City
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='CatPublicationCity']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="table[@name='CatPublisher']">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Publisher
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="table[@name='CatPublisher']/tuple/tuple/atom[@name='SummaryData']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='CatPublicationLanguage'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Language
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='CatPublicationLanguage']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="contains(atom[@name='NotNotes'], 'http')">
                            <xsl:call-template name="tokenize">
                                <xsl:with-param name="text" select="atom[@name='NotNotes']"/>
                            </xsl:call-template>
                        </xsl:if>
                    </table>
                </td>
            </tr>
        </xsl:for-each>
    </xsl:template>
    <!--
            Journal template
     -->
    <xsl:template name="journal">
        <tr class="display2">
            <td class="display2">
                Journals
            </td>
        </tr>
        <xsl:for-each select="table[@name='Biblio']/tuple[atom[@name='BibRecordType'] = 'Journal']">
            <xsl:sort select="atom[@name='JouPublicationDates']" data-type="number" order="descending"/>
            <tr class="condition">
                <td class="condition">
                    <xsl:value-of select="atom[@name='BibRecordType']"/><xsl:text> - </xsl:text><i><xsl:value-of select="atom[@name='JouTitle']"/></i>
                </td>
            </tr>
            <tr class="image">
                <td class="image">
                    <table border="0" class="data" id="datatable">
                        <xsl:if test="atom[@name='RefBibliographicNotes'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Reference Notes
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='RefBibliographicNotes']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='JouTitle'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Title
                                </td>
                                <td class="atomvalue">
                                    <i><xsl:value-of select="atom[@name='JouTitle']" /></i>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='JouAbbreviatedTitle'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Abbreviated Title
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='JouAbbreviatedTitle']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="table[@name='Authors']">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Author(s)
                                </td>
                                <td class="atomvalue">
                                    <xsl:for-each select="table[@name='Authors']/tuple">
                                        <xsl:if test="atom[@name='JouRole'] != ''"><xsl:value-of select="atom[@name='JouRole']" /><xsl:text>: </xsl:text></xsl:if><xsl:value-of select="atom[@name='BibMultiAuthorText']"/>
                                        <xsl:if test="position() != last()">
                                            <br/>
                                        </xsl:if>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='JouISSN'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    ISSN
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='JouISSN']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='JouPublicationDates'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Publication Dates
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='JouPublicationDates']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='JouPublicationCity'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Publication City
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='JouPublicationCity']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="table[@name='JouPublisher']">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Publisher
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="table[@name='JouPublisher']/tuple/tuple/atom[@name='SummaryData']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="table[@name='JouParent']">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Published In
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="table[@name='JouParent']/tuple/tuple/atom[@name='SummaryData']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='JouPublicationLanguage'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Language
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='JouPublicationLanguage']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="contains(atom[@name='NotNotes'], 'http')">
                            <xsl:call-template name="tokenize">
                                <xsl:with-param name="text" select="atom[@name='NotNotes']"/>
                            </xsl:call-template>
                        </xsl:if>
                    </table>
                </td>
            </tr>
        </xsl:for-each>
    </xsl:template>
    <!--
            Article template
     -->
    <xsl:template name="article">
        <tr class="display2">
            <td class="display2">
                Articles
            </td>
        </tr>
        <xsl:for-each select="table[@name='Biblio']/tuple[atom[@name='BibRecordType'] = 'Article']">
            <xsl:sort select="atom[@name='ArtPublicationDate']" data-type="number" order="descending"/>
            <tr class="condition">
                <td class="condition">
                    <xsl:value-of select="atom[@name='BibRecordType']"/><xsl:text> - </xsl:text><i><xsl:value-of select="atom[@name='ArtTitle']"/></i>
                </td>
            </tr>
            <tr class="image">
                <td class="image">
                    <table border="0" class="data" id="datatable">
                        <xsl:if test="atom[@name='RefBibliographicNotes'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Reference Notes
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='RefBibliographicNotes']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='ArtTitle'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Title
                                </td>
                                <td class="atomvalue">
                                    <i><xsl:value-of select="atom[@name='ArtTitle']" /></i>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="table[@name='Authors']">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Author(s)
                                </td>
                                <td class="atomvalue">
                                    <xsl:for-each select="table[@name='Authors']/tuple">
                                        <xsl:if test="atom[@name='ArtRole'] != ''"><xsl:value-of select="atom[@name='ArtRole']" /><xsl:text>: </xsl:text></xsl:if><xsl:value-of select="atom[@name='BibMultiAuthorText']"/>
                                        <xsl:if test="position() != last()">
                                            <br/>
                                        </xsl:if>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='ArtVolume'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Volume
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='ArtVolume']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='ArtIssue'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Issue
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='ArtIssue']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='ArtIssuePages'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Issue Pages
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='ArtIssuePages']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='ArtPages'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Article Pages
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='ArtPages']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='BooISBN'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    ISBN
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='BooISBN']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='ArtPublicationDate'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Publication Date
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='ArtPublicationDate']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="table[@name='ArtParent']">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Published In
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="table[@name='ArtParent']/tuple/tuple/atom[@name='SummaryData']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='ArtPublicationLanguage'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Language
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='ArtPublicationLanguage']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="contains(atom[@name='NotNotes'], 'http')">
                            <xsl:call-template name="tokenize">
                                <xsl:with-param name="text" select="atom[@name='NotNotes']"/>
                            </xsl:call-template>
                        </xsl:if>
                    </table>
                </td>
            </tr>
        </xsl:for-each>
    </xsl:template>
    <!--
            Chapter template
     -->
    <xsl:template name="chapter">
        <tr class="display2">
            <td class="display2">
                Chapters
            </td>
        </tr>
        <xsl:for-each select="table[@name='Biblio']/tuple[atom[@name='BibRecordType'] = 'Chapter']">
            <tr class="condition">
                <td class="condition">
                    <xsl:value-of select="atom[@name='BibRecordType']"/><xsl:text> - </xsl:text><xsl:value-of select="atom[@name='ChaTitle']"/>
                </td>
            </tr>
            <tr class="image">
                <td class="image">
                    <table border="0" class="data" id="datatable">
                        <xsl:if test="atom[@name='RefBibliographicNotes'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Reference Notes
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='RefBibliographicNotes']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='ChaTitle'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Title
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='ChaTitle']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="table[@name='Authors']">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Author(s)
                                </td>
                                <td class="atomvalue">
                                    <xsl:for-each select="table[@name='Authors']/tuple">
                                        <xsl:if test="atom[@name='ChaRole'] != ''"><xsl:value-of select="atom[@name='ChaRole']" /><xsl:text>: </xsl:text></xsl:if><xsl:value-of select="atom[@name='BibMultiAuthorText']"/>
                                        <xsl:if test="position() != last()">
                                            <br/>
                                        </xsl:if>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='ArtChapter'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Chapter
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='ChaChapter']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='ChaPages'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Chapter Pages
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='ChaPages']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='BooISBN'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    ISBN
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='BooISBN']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="table[@name='ChaParent']">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Published In
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="table[@name='ChaParent']/tuple/tuple/atom[@name='SummaryData']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='ChaPublicationLanguage'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Language
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='ChaPublicationLanguage']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="contains(atom[@name='NotNotes'], 'http')">
                            <xsl:call-template name="tokenize">
                                <xsl:with-param name="text" select="atom[@name='NotNotes']"/>
                            </xsl:call-template>
                        </xsl:if>
                    </table>
                </td>
            </tr>
        </xsl:for-each>
    </xsl:template>
    <!--
            Digital template
     -->
    <xsl:template name="digital">
        <tr class="display2">
            <td class="display2">
                Digital
            </td>
        </tr>
        <xsl:for-each select="table[@name='Biblio']/tuple[atom[@name='BibRecordType'] = 'Digital']">
            <xsl:sort select="atom[@name='DigProductionDate']" data-type="number" order="descending"/>
            <tr class="condition">
                <td class="condition">
                    <xsl:value-of select="atom[@name='BibRecordType']"/><xsl:text> - </xsl:text><i><xsl:value-of select="atom[@name='DigTitle']"/></i>
                </td>
            </tr>
            <tr class="image">
                <td class="image">
                    <table border="0" class="data" id="datatable">
                        <xsl:if test="atom[@name='RefBibliographicNotes'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Reference Notes
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='RefBibliographicNotes']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='DigTitle'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Title
                                </td>
                                <td class="atomvalue">
                                    <i><xsl:value-of select="atom[@name='DigTitle']" /></i>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="table[@name='Authors']">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Author(s)
                                </td>
                                <td class="atomvalue">
                                    <xsl:for-each select="table[@name='Authors']/tuple">
                                        <xsl:if test="atom[@name='DigRole'] != ''"><xsl:value-of select="atom[@name='DigRole']" /><xsl:text>: </xsl:text></xsl:if><xsl:value-of select="atom[@name='BibMultiAuthorText']"/>
                                        <xsl:if test="position() != last()">
                                            <br/>
                                        </xsl:if>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='DigFormat'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Format
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='DigFormat']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='DigEdition'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Edition
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='DigEdition']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='BooISBN'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    ISBN
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='BooISBN']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='DigProductionDate'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Production Date
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='DigProductionDate']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='DigProductionPlace'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Production Place
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='DigProductionPlace']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="table[@name='DigProducer']">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Producer
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="table[@name='DigProducer']/tuple/tuple/atom[@name='SummaryData']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="table[@name='DigParent']">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Part Of
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="table[@name='DigParent']/tuple/tuple/atom[@name='SummaryData']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='DigPublicationLanguage'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Language
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='DigPublicationLanguage']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="contains(atom[@name='NotNotes'], 'http')">
                            <xsl:call-template name="tokenize">
                                <xsl:with-param name="text" select="atom[@name='NotNotes']"/>
                            </xsl:call-template>
                        </xsl:if>
                    </table>
                </td>
            </tr>
        </xsl:for-each>
    </xsl:template>
    <!--
            Other template
     -->
    <xsl:template name="other">
        <tr class="display2">
            <td class="display2">
                Other
            </td>
        </tr>
        <xsl:for-each select="table[@name='Biblio']/tuple[atom[@name='BibRecordType'] = 'Other']">
            <tr class="condition">
                <td class="condition">
                    <xsl:value-of select="atom[@name='BibRecordType']"/><xsl:text> - </xsl:text><i><xsl:value-of select="atom[@name='OthTitle']"/></i>
                </td>
            </tr>
            <tr class="image">
                <td class="image">
                    <table border="0" class="data" id="datatable">
                        <xsl:if test="atom[@name='RefBibliographicNotes'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Reference Notes
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='RefBibliographicNotes']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='OthTitle'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Title
                                </td>
                                <td class="atomvalue">
                                    <i><xsl:value-of select="atom[@name='OthTitle']" /></i>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='OthAbbreviatedTitle'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Abbreviated Title
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='OthAbbreviatedTitle']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="table[@name='Authors']">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Author(s)
                                </td>
                                <td class="atomvalue">
                                    <xsl:for-each select="table[@name='Authors']/tuple">
                                        <xsl:if test="atom[@name='OthRole'] != ''"><xsl:value-of select="atom[@name='OthRole']" /><xsl:text>: </xsl:text></xsl:if><xsl:value-of select="atom[@name='BibMultiAuthorText']"/>
                                        <xsl:if test="position() != last()">
                                            <br/>
                                        </xsl:if>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='OthPages'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Pages
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='OthPages']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='BooISBN'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    ISBN
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='BooISBN']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="table[@name='OthParent']">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Part Of
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="table[@name='OthParent']/tuple/tuple/atom[@name='SummaryData']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="atom[@name='OthPublicationLanguage'] != ''">
                            <tr class="atomvalue">
                                <td class="atomprompt">
                                    Language
                                </td>
                                <td class="atomvalue">
                                    <xsl:value-of select="atom[@name='OthPublicationLanguage']" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="contains(atom[@name='NotNotes'], 'http')">
                            <xsl:call-template name="tokenize">
                                <xsl:with-param name="text" select="atom[@name='NotNotes']"/>
                            </xsl:call-template>
                        </xsl:if>
                    </table>
                </td>
            </tr>
        </xsl:for-each>
    </xsl:template>
    <!-- 
            Line Break template
    -->
    <xsl:template name="break">
        <xsl:param name="text" select="string(.)"/>
        <xsl:choose>
            <xsl:when test="contains($text, '&#xa;')">
                <xsl:value-of select="substring-before($text, '&#xa;')"/>
                <br/>
                <xsl:call-template name="break">
                    <xsl:with-param 
                        name="text" 
                        select="substring-after($text, '&#xa;')"
                    />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$text"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!--
            Delimiter Split template
    -->
    <xsl:template name="tokenize">
        <xsl:param name="text" select="."/>
        <xsl:param name="separator" select="'&#xa;'"/>
        <xsl:param name="file" select="'pdf'"/>
        <xsl:param name="link" select="'http'"/>
        <xsl:choose>
            <xsl:when test="not(contains($text, $separator))">
                <xsl:choose>
                <xsl:when test="starts-with($text, $link) and not(substring-after($text, $file))">
                <tr class="atomvalue">
                    <td class="atomprompt">
                        Link
                    </td>
                    <td class="atomvalue">
                        <xsl:element name="a">
                            <xsl:attribute name="href">
                                <xsl:value-of select="$text"/>
                            </xsl:attribute>
                            <xsl:attribute name="target">
                                _blank
                            </xsl:attribute>
                            Rights and Repro Photocopy PDF
                        </xsl:element>
                    </td>
                </tr>
                </xsl:when>
                <xsl:when test="contains($text, $link)">
                    <tr class="atomvalue">
                        <td class="atomprompt">
                            Link
                        </td>
                        <td class="atomvalue">
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:text>http</xsl:text><xsl:value-of select="substring-before(substring-after($text, $link), $file)"/><xsl:text>pdf</xsl:text>
                                </xsl:attribute>
                                <xsl:attribute name="target">
                                    _blank
                                </xsl:attribute>
                                Document Link
                            </xsl:element>
                        </td>
                    </tr>
                </xsl:when>
                <xsl:otherwise>
                    <tr class="atomvalue">
                        <td class="atomprompt">
                            Link
                        </td>
                        <td class="atomvalue">
                            <xsl:value-of select="$text"/>
                        </td>
                    </tr>
                </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="starts-with(substring-before($text, $separator), $link) and not(substring-after(substring-before($text, $separator), $file))">
                        <tr class="atomvalue">
                            <td class="atomprompt">
                                Link
                            </td>
                            <td class="atomvalue">
                                <xsl:element name="a">
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="$text"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="target">
                                        _blank
                                    </xsl:attribute>
                                    Rights and Repro Photocopy PDF
                                </xsl:element>
                            </td>
                        </tr>
                    </xsl:when>
                    <xsl:when test="contains(substring-before($text, $separator), $link)">
                        <tr class="atomvalue">
                            <td class="atomprompt">
                                Link
                            </td>
                            <td class="atomvalue">
                                <xsl:element name="a">
                                    <xsl:attribute name="href">
                                        <xsl:text>http</xsl:text><xsl:value-of select="substring-before(substring-after(substring-before($text, $separator), $link), $file)"/><xsl:text>pdf</xsl:text>
                                    </xsl:attribute>
                                    <xsl:attribute name="target">
                                        _blank
                                    </xsl:attribute>
                                    Rights and Repro Photocopy PDF
                                </xsl:element>
                            </td>
                        </tr>
                    </xsl:when>
                    <xsl:otherwise/>
                </xsl:choose>
                <xsl:call-template name="tokenize">
                    <xsl:with-param name="text" select="substring-after($text, $separator)"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>