<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Reduced DB: for anonymous survey of self-estimated quality of life
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:output method="xml" indent="yes"/>
 <xsl:template match="/">
 <xsl:comment> Created by XSLT from client records </xsl:comment>
  <xsl:text>&#10;</xsl:text>
  <xsl:processing-instruction name="xml-stylesheet">
   <xsl:text>href="lifequal.xsl" type="text/xsl"</xsl:text>
  </xsl:processing-instruction>
  <xsl:text>&#10;</xsl:text>
  <Persons>
  <xsl:comment>Created by XSLT from client records </xsl:comment>
   <xsl:apply-templates/>
  </Persons>
 </xsl:template>
 <xsl:template match="records/client">
  <Person>
   <Gender>
    <xsl:value-of select="demoData/gender"/>
   </Gender>
   <Age>
    <xsl:choose>
        <xsl:when test="demoData/birthDate!=''">
          <xsl:value-of select="2021-substring(demoData/birthDate,1,4)"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="2021-demoData/birthYear"/>
        </xsl:otherwise>
       </xsl:choose>
   </Age>
   <PhysicalFunc>
    <xsl:value-of select="riskStatus/qualityOfLife/physFunc"/>
   </PhysicalFunc>
   <MentalFunc>
    <xsl:value-of select="riskStatus/qualityOfLife/mentalFunc"/>
   </MentalFunc>
   <CognitiveFunc>
    <xsl:value-of select="riskStatus/qualityOfLife/cognitiveFunc"/>
   </CognitiveFunc>
   <SocialFunc>
    <xsl:value-of select="riskStatus/qualityOfLife/socialFunc"/>
   </SocialFunc>

  </Person>
 </xsl:template>
</xsl:stylesheet>