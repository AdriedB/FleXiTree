<?xml version = "1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">
<!--
// <author>Adrie den Blanken</author>
// <file>$Workfile: Stamboom.xsl $</file><date>$Date: 25-06-09 19:42 $</date>
// <revision>$Revision: 7 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this
// header stays intact. No responsibility is accepted
// for use of this software.</disclaimer>
-->
<xsl:output method="html"/>

<!--
Het begin
-->
<xsl:variable name="dagger"  select="'&#8224;'"/>    <!-- Overledenteken -->
<xsl:variable name="squote"  select='"&#39;"'/>      <!-- Single quote -->

<xsl:template match="PERSONEN">
  <html>
  <head>
  <title>Stamboom van deze familie</title>
  <link rel="stylesheet" type="text/css" href="stamboom.css"/>
  </head>
  <body>
  <div align="center">
    <table border="1" bordercolor="black" cellspacing="0" cellpadding="4" class="tbl-data">
      <tr>
      <th class="tbl-head" align="left">Index</th>
      <th class="tbl-head" align="left">Naam</th>
      <th class="tbl-head" align="left">Geboortedatum</th>
      <th class="tbl-head" align="left">Leeftijd</th>
      <th class="tbl-head" align="left">Overlijdensdatum</th>
      </tr>
      <xsl:for-each select="PERSOON[@link!=0]">
        <xsl:sort select="PERSONAL/NAME/@surn"/>
        <xsl:sort select="PERSONAL/NAME/@nick"/>
        <tr>
          <td>
            <xsl:value-of select="position()"/>
          </td>
          <td>
            <xsl:for-each select="PERSONAL">
              <xsl:call-template name="ShowPersoon">
                <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
                <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
                <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
                <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
              </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="EVENTS/DEATH">
              <xsl:value-of select="$dagger"/>
            </xsl:for-each>
          </td>
          <td>
            <xsl:value-of select="EVENTS/BIRTH/@onz"/><xsl:value-of select="EVENTS/BIRTH/@date"/><xsl:text>&#160;</xsl:text>
          </td>
          <td>
            <xsl:value-of select="PERSONAL/@onz"/>
              		<xsl:choose>
                	  <xsl:when test="PERSONAL/@of=1">
                  		<xsl:value-of select="PERSONAL/@age - 1"/>
                  		<xsl:text> of </xsl:text>
                  		<xsl:value-of select="PERSONAL/@age"/>
                	  </xsl:when>
                	  <xsl:otherwise>
                  		<xsl:value-of select="PERSONAL/@age"/>
                	  </xsl:otherwise>
              		</xsl:choose>
              		<xsl:text> jaar </xsl:text>
            <xsl:text>&#160;</xsl:text>
          </td>
          <td>
            <xsl:value-of select="EVENTS/DEATH/@onz"/><xsl:value-of select="EVENTS/DEATH/@date"/><xsl:text>&#160;</xsl:text>
          </td>
        </tr>
      </xsl:for-each>
    </table>
  </div>
  </body>
  </html>
</xsl:template>

<xsl:template name="ShowPersoon">
  <xsl:param name="NAMEFIRST"></xsl:param>
  <xsl:param name="NAMENICK"></xsl:param>
  <xsl:param name="NAMEPREF"></xsl:param>
  <xsl:param name="SURN"></xsl:param>

  <xsl:variable name="hyperName">
    <xsl:choose>
      <xsl:when test="string-length($NAMENICK) = 0">
        <xsl:choose>
          <!-- pak de eerste naam van de voornamen -->
          <xsl:when test="string-length(substring-before($NAMEFIRST,' ')) != 0">
            <xsl:value-of select="substring-before($NAMEFIRST,' ')"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$NAMEFIRST"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
         <xsl:value-of select="$NAMENICK"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="string-length($NAMEPREF) != 0">
      <xsl:text> </xsl:text><xsl:value-of select="$NAMEPREF"/>
    </xsl:if>
    <xsl:text> </xsl:text>
    <xsl:value-of select="$SURN"/>
  </xsl:variable>
  <xsl:value-of select="$hyperName"/>
</xsl:template>

</xsl:stylesheet>
