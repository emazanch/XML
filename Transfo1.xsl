<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	Table of clients: name, birth date and type of contract
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <head><h2>Here are the <xsl:value-of select="count(records/client[substring(@createdOn,1,4)=2021])"/> clients inserted in 2021 year:</h2></head>
  <body>
    <table border="1">
      <tr bgcolor="#9acd32">
       <th>ID</th>
       <th>Name</th>
       <th>Born on</th>
       <th>Contract type</th>
      </tr>
    <xsl:for-each select="records/client">
    <xsl:sort select="demoData/lastName"/>
     <tr>
       <td><xsl:value-of select="@id"/></td>
       <td><xsl:value-of select="concat(demoData/lastName,', ',demoData/firstName)"/></td>
       <xsl:choose>
        <xsl:when test="demoData/birthDate!=''">
           <td><xsl:value-of select="demoData/birthDate"/></td>
        </xsl:when>
        <xsl:otherwise>
           <td><xsl:value-of select="demoData/birthYear"/></td>
        </xsl:otherwise>
       </xsl:choose>
       <td><xsl:value-of select="adminData/contract"/></td>
     </tr>
    </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>