<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Find children with allergies
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <head><h2>Children having allergies:</h2></head>
  <body>
    <table border="1">
      <tr bgcolor="#9acd32">
       <th>Name</th>
       <th>Born on</th>
       <th>Gender</th>
       <th>Allergies</th>
      </tr>
    <xsl:for-each select="records/client">
    <xsl:if test="(2021-substring(demoData/birthDate,1,4) &lt; 18) and (currentCondMngmt/allergies!='')"> <!--maybe add current year-->
     <tr>
       <td><xsl:value-of select="concat(demoData/lastName,', ',demoData/firstName)"/></td>
       <xsl:choose>
        <xsl:when test="demoData/birthDate!=''">
           <td><xsl:value-of select="demoData/birthDate"/></td>
        </xsl:when>
        <xsl:otherwise>
           <td><xsl:value-of select="demoData/birthYear"/></td>
        </xsl:otherwise>
       </xsl:choose>
       <td><xsl:value-of select="demoData/gender"/></td>
       <td><xsl:for-each select="currentCondMngmt/allergies">
        <xsl:value-of select="."/><br/>
       </xsl:for-each></td>
     </tr>
    </xsl:if> 
    </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>