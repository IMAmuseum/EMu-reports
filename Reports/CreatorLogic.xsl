
<xsl:choose>
    <xsl:when test="table[@name='Creator']">
        <xsl:for-each select="table[@name='Creator']/tuple">
            <xsl:choose><xsl:when test="atom[@name='CreRole'] != ''"><b style="font-style: normal"><xsl:value-of select="atom[@name='CreRole']"/><xsl:text>:  </xsl:text></b></xsl:when><xsl:otherwise><b style="font-style: normal"><xsl:text>Creator:  </xsl:text></b></xsl:otherwise></xsl:choose>
            <xsl:choose>
                <xsl:when test="atom[@name='BioNationality'] != '' and atom[@name='BioBirthDate'] != ''">
                    <xsl:choose><xsl:when test="atom[@name='NamFullName'] != ''"><xsl:value-of select="atom[@name='NamFullName']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioNationality']"/><xsl:text>, </xsl:text><xsl:value-of select="atom[@name='BioBirthDate']"/><xsl:text> - </xsl:text><xsl:value-of select="atom[@name='BioDeathDate']"/><xsl:text>)</xsl:text></xsl:when><xsl:otherwise ><xsl:value-of select="atom[@name='NamOrganisation']"/><xsl:text> (</xsl:text><xsl:value-of select="atom[@name='BioNationality']"/><xsl:text>, </xsl:text><xsl:value-of select="atom[@name='BioBirthDate']"/><xsl:text> - </xsl:text><xsl:value-of select="atom[@name='BioDeathDate']"/><xsl:text>)</xsl:text></xsl:otherwise>
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