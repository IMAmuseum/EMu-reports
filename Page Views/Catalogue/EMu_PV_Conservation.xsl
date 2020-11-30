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
                <xsl:call-template name="condata" />
                <xsl:call-template name="subheading2" />
                <xsl:call-template name="condetails" />
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
            Conservation History Heading template
     -->
    <xsl:template name="subheading1">
                <tr class="display">
                    <td class="display">
                        Conservation History
                    </td>
                </tr>
    </xsl:template>
    <!--
            Conservation Data template
     -->
    <xsl:template name="condata">
        <xsl:choose>
        <xsl:when test="table[@name='ObjObjectsConservedRef_tab']">
        <xsl:for-each select="table[@name='ObjObjectsConservedRef_tab']/tuple">
            <xsl:sort select="atom[@name='ReqConservationIdentifier']" order="descending"/>
            <tr class="condition">
                <td class="condition">
                    <xsl:value-of select="atom[@name='ReqConservationIdentifier']"/><xsl:text> - </xsl:text><xsl:value-of select="atom[@name='InfRecordType']"/>
                </td>
            </tr>
            <tr class="image">
                <td class="image">
            <table border="0" class="data" id="datatable">
                <tr class="atomvalue">
                    <td class="atomprompt">
                        Conservator(s)
                    </td>
                    <td class="atomvalue">
                        <xsl:for-each select="table[@name='Conservators']/tuple">
                            <xsl:value-of select="atom[@name='SummaryData']" />
                            <xsl:if test="position() != last()">
                                <br/>
                            </xsl:if>
                        </xsl:for-each>
                    </td>
                </tr>
                <xsl:if test="tuple[@name='ReqSupervisedByRef']/atom[@name='SummaryData'] != ''">
                    <tr class="atomvalue">
                        <td class="atomprompt">
                            Supervisor
                        </td>
                        <td class="atomvalue">
                            <xsl:value-of select="tuple[@name='ReqSupervisedByRef']/atom[@name='SummaryData']" />
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="tuple[@name='ReqRequestedByRef']/atom[@name='SummaryData'] != '' or atom[@name= 'ReqDateRequested'] != ''">
                    <tr class="atomvalue">
                        <td class="atomprompt">
                            Request Details
                        </td>
                        <td class="atomvalue">
                            <xsl:if test="tuple[@name='ReqRequestedByRef']/atom[@name='SummaryData'] != ''"><xsl:text>Requestor: </xsl:text><xsl:value-of select="tuple[@name='ReqRequestedByRef']/atom[@name='SummaryData']" /><xsl:if test="atom[@name= 'ReqDateRequested'] != ''"><br/></xsl:if></xsl:if>
                            <xsl:if test="atom[@name= 'ReqDateRequested'] != ''"><xsl:text>Date: </xsl:text><xsl:value-of select="atom[@name='ReqDateRequested']"/></xsl:if>
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="tuple[@name='InfAssociatedEventRef']/atom[@name='SummaryData'] != ''">
                    <tr class="atomvalue">
                        <td class="atomprompt">
                            Associated Event
                        </td>
                        <td class="atomvalue">
                            <xsl:value-of select="tuple[@name='InfAssociatedEventRef']/atom[@name='SummaryData']" />
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="tuple[@name='InfAssociatedLoanRef']/atom[@name='SummaryData'] != ''">
                    <tr class="atomvalue">
                        <td class="atomprompt">
                            Associated Loan
                        </td>
                        <td class="atomvalue">
                            <xsl:value-of select="tuple[@name='InfAssociatedLoanRef']/atom[@name='SummaryData']" />
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="atom[@name='InfOtherReason'] != ''">
                    <tr class="atomvalue">
                        <td class="atomprompt">
                            Reason for Activity
                        </td>
                        <td class="atomvalue">
                            <xsl:value-of select="atom[@name='InfOtherReason']" />
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="table[@name='Proposal'] and table[@name='ProposedBy']">
                    <tr class="atomvalue">
                        <td class="atomprompt">
                            Proposal Details
                        </td>
                        <td class="atomvalue">
                            <xsl:if test="table[@name='ProposedBy']/tuple/atom[@name='SummaryData'] != ''"><xsl:text>Proposed By: </xsl:text><xsl:value-of select="table[@name='ProposedBy']/tuple/atom[@name='SummaryData']" /><xsl:if test="table[@name='Proposal']/tuple/atom[@name='ProProposalDate'] != '' or table[@name='Proposal']/tuple/atom[@name='ProEstimatedHours'] != ''"><br/></xsl:if></xsl:if>
                            <xsl:if test="table[@name='Proposal']/tuple/atom[@name='ProProposalDate'] != ''"><xsl:text>Date: </xsl:text><xsl:value-of select="table[@name='Proposal']/tuple/atom[@name='ProProposalDate']"/><xsl:if test="table[@name='Proposal']/tuple/atom[@name='ProEstimatedHours'] != ''"><br/></xsl:if></xsl:if>
                            <xsl:if test="table[@name='Proposal']/tuple/atom[@name='ProEstimatedHours'] != ''"><xsl:text>Estimated Hours: </xsl:text><xsl:value-of select="table[@name='Proposal']/tuple/atom[@name='ProEstimatedHours']"/></xsl:if>
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="table[@name='ProposalAuth']">
                    <tr class="atomvalue">
                        <td class="atomprompt">
                            Authorization Details
                        </td>
                        <td class="atomvalue">
                            <xsl:if test="table[@name='ProposalAuth']/tuple/atom[@name='SummaryData'] != ''"><xsl:text>Authorizor: </xsl:text><xsl:value-of select="table[@name='ProposalAuth']/tuple/atom[@name='SummaryData']" /><xsl:if test="table[@name='ProposalAuth']/tuple/atom[@name='ProAuthorisationApproved'] != '' or table[@name='ProposalAuth']/tuple/atom[@name='ProAuthorisationDate'] != ''"><br/></xsl:if></xsl:if>
                            <xsl:if test="table[@name='ProposalAuth']/tuple/atom[@name='ProAuthorisationApproved'] != ''"><xsl:text>Authorized?: </xsl:text><xsl:value-of select="table[@name='ProposalAuth']/tuple/atom[@name='ProAuthorisationApproved']"/><xsl:if test="table[@name='ProposalAuth']/tuple/atom[@name='ProAuthorisationDate'] != ''"><br/></xsl:if></xsl:if>
                            <xsl:if test="table[@name='ProposalAuth']/tuple/atom[@name='ProAuthorisationDate'] != ''"><xsl:text>Date: </xsl:text><xsl:value-of select="table[@name='ProposalAuth']/tuple/atom[@name='ProAuthorisationDate']"/></xsl:if>
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="atom[@name='ReqActualCompletionDate'] != ''">
                    <xsl:choose>
                        <xsl:when test="contains(atom[@name='InfRecordType'], 'Exam')">
                    <tr class="atomvalue">
                        <td class="atomprompt">
                            Examination Date
                        </td>
                        <td class="atomvalue">
                            <xsl:value-of select="atom[@name='ReqActualCompletionDate']" />
                        </td>
                    </tr>
                        </xsl:when>
                        <xsl:otherwise>
                    <tr class="atomvalue">
                        <td class="atomprompt">
                            Completion Date
                        </td>
                        <td class="atomvalue">
                            <xsl:value-of select="atom[@name='ReqActualCompletionDate']" />
                        </td>
                    </tr>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
                <xsl:if test="table[@name='TreatedBy']/tuple/atom[@name='SummaryData'] != ''">
                    <tr class="atomvalue">
                        <td class="atomprompt">
                            Treated By
                        </td>
                        <td class="atomvalue">
                            <xsl:for-each select="table[@name='TreatedBy']/tuple">
                            <xsl:value-of select="atom[@name='SummaryData']" />
                                <xsl:if test="position() != last()">
                                    <br/>
                                </xsl:if>
                            </xsl:for-each>
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="table[@name='Treatment']">
                    <tr class="atomvalue">
                        <td class="atomprompt">
                            Treatment Details
                        </td>
                        <td class="atomvalue">
                            <xsl:if test="table[@name='Treatment']/tuple/atom[@name='TreDateCommenced'] != ''"><xsl:text>Date Commenced: </xsl:text><xsl:value-of select="table[@name='Treatment']/tuple/atom[@name='TreDateCommenced']" /><xsl:if test="table[@name='Treatment']/tuple/atom[@name='TreDateCompleted'] != '' or table[@name='Treatment']/tuple/atom[@name='TreTreatmentActualHours'] != ''"><br/></xsl:if></xsl:if>
                            <xsl:if test="table[@name='Treatment']/tuple/atom[@name='TreDateCompleted'] != ''"><xsl:text>Date Completed: </xsl:text><xsl:value-of select="table[@name='Treatment']/tuple/atom[@name='TreDateCompleted']"/><xsl:if test="table[@name='Treatment']/tuple/atom[@name='TreTreatmentActualHours'] != ''"><br/></xsl:if></xsl:if>
                            <xsl:if test="table[@name='Treatment']/tuple/atom[@name='TreTreatmentActualHours'] != ''"><xsl:text>Actual Hours: </xsl:text><xsl:value-of select="table[@name='Treatment']/tuple/atom[@name='TreTreatmentActualHours']"/></xsl:if>
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="table[@name='Analysis']">
                    <xsl:for-each select="table[@name='Analysis']/tuple">
                    <tr class="atomvalue">
                        <td class="atomprompt">
                            Analysis<xsl:text> </xsl:text><xsl:value-of select="position()"/>
                        </td>
                        <td class="atomvalue">
                            <xsl:if test="atom[@name='SummaryData'] != ''"><xsl:text>Tested By: </xsl:text><xsl:value-of select="atom[@name='SummaryData']" /><xsl:if test="atom[@name='AnaMethod'] != '' or atom[@name='AnaDate'] != ''"><br/></xsl:if></xsl:if>
                            <xsl:if test="atom[@name='AnaMethod'] != ''"><xsl:text>Method: </xsl:text><xsl:value-of select="atom[@name='AnaMethod']"/><xsl:if test="atom[@name='AnaDate'] != ''"><br/></xsl:if></xsl:if>
                            <xsl:if test="atom[@name='AnaDate'] != ''"><xsl:text>Date: </xsl:text><xsl:value-of select="atom[@name='AnaDate']"/></xsl:if>
                        </td>
                    </tr>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="atom[@name='NotNotes'] != ''">
                <xsl:choose>
                    <xsl:when test="not(contains(atom[@name='NotNotes'], 'http'))">
                        <tr class="atomvalue">
                            <td class="atomprompt">
                                Notes
                            </td>
                            <td class="atomvalue">
                                <xsl:call-template name="break">
                                    <xsl:with-param name="text" select="atom[@name='NotNotes']"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="tokenize">
                            <xsl:with-param name="text" select="atom[@name='NotNotes']"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
                </xsl:if>
            </table>
                </td>
            </tr>
        </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
            <tr class="atomvalue">
                <td class="atomvalue">
                    No cataloged Conservation activities in EMu.
                </td>
            </tr>
        </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!--
            Condition Details Heading template
     -->
    <xsl:template name="subheading2">
        <tr class="display">
            <td class="display">
                Condition Check
            </td>
        </tr>
    </xsl:template>
    <!--
            Condition Details template
     -->
    <xsl:template name="condetails">
        <tr class="atomvalue">
            <td class="atomvalue">
                <b><xsl:text>Date Checked: </xsl:text></b><xsl:value-of select="atom[@name='ConDateChecked']"/>
            </td>
        </tr>
        <tr class="atomvalue">
            <td class="atomvalue">
                <b><xsl:text>Checked By: </xsl:text></b><xsl:value-of select="tuple[@name='ConCheckedByRef']/atom[@name='NamFullName']"/>
            </td>
        </tr>
        <tr class="atomvalue">
            <td class="atomvalue">
                <b><xsl:text>Condition Details:</xsl:text></b><br/>
                <xsl:call-template name="break">
                    <xsl:with-param name="text" select="atom[@name='ConConditionDetails']"/>
                </xsl:call-template>
            </td>
        </tr>
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
                        Notes
                    </td>
                    <td class="atomvalue">
                        <xsl:element name="a">
                            <xsl:attribute name="href">
                                <xsl:value-of select="$text"/>
                            </xsl:attribute>
                            <xsl:attribute name="target">
                                _blank
                            </xsl:attribute>
                            Document Link
                        </xsl:element>
                    </td>
                </tr>
                </xsl:when>
                <xsl:when test="contains($text, $link)">
                    <tr class="atomvalue">
                        <td class="atomprompt">
                            Notes
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
                            Notes
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
                                Notes
                            </td>
                            <td class="atomvalue">
                                <xsl:element name="a">
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="$text"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="target">
                                        _blank
                                    </xsl:attribute>
                                    Document Link
                                </xsl:element>
                            </td>
                        </tr>
                    </xsl:when>
                    <xsl:when test="contains(substring-before($text, $separator), $link)">
                        <tr class="atomvalue">
                            <td class="atomprompt">
                                Notes
                            </td>
                            <td class="atomvalue">
                                <xsl:element name="a">
                                    <xsl:attribute name="href">
                                        <xsl:text>http</xsl:text><xsl:value-of select="substring-before(substring-after(substring-before($text, $separator), $link), $file)"/><xsl:text>pdf</xsl:text>
                                    </xsl:attribute>
                                    <xsl:attribute name="target">
                                        _blank
                                    </xsl:attribute>
                                    Document Link
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