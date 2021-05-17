<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Average quality of life score by client
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <html>
  <body>
      <table border="1">
      <tr bgcolor="#9acd32">
       <th>Age</th>
       <th>Score</th>
      </tr>
    <xsl:for-each select="Persons/Person">
    <xsl:sort select="Age"/>
    <tr>
      <td><xsl:value-of select="Age"/></td>
      <td><xsl:value-of select="round(sum(PhysicalFunc+MentalFunc+CognitiveFunc+SocialFunc)div(4))"/></td>
    </tr>
    </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>