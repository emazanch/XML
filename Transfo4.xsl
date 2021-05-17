<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Women who smoke
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml"/>
<xsl:template match="/">
<xsl:comment> Created by XSLT from client records</xsl:comment>
<xsl:apply-templates/>
</xsl:template>
<xsl:template match="records/client">
  <xsl:if test="(demoData/gender='female') and (riskStatus/lifestyle/tobacco='yes')">
    <Client>
      <Name>
        <xsl:value-of select="concat(demoData/lastName,', ',demoData/firstName)"/>
      </Name>
      <BornOn>
        <xsl:choose>
        <xsl:when test="demoData/birthDate!=''">
           <xsl:value-of select="demoData/birthDate"/>
        </xsl:when>
        <xsl:otherwise>
           <xsl:value-of select="demoData/birthYear"/>
        </xsl:otherwise>
       </xsl:choose>
      </BornOn>
      <xsl:for-each select="currentCondMngmt/diagnoses">
       <Diagnoses>
          <xsl:value-of select="."/>
       </Diagnoses>
      </xsl:for-each>
    </Client>  
  </xsl:if> 
</xsl:template>
</xsl:stylesheet>