<?xml version = "1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">
<!--
// <author>Adrie den Blanken</author>
// <file>$Workfile: Waaier-5G.xsl $</file><date>$Date: 24-02-13 13:44 $</date>
// <revision>$Revision: 11 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this
// header stays intact. No responsibility is accepted
// for use of this software.</disclaimer>
-->
<xsl:output method="html"/>

<xsl:include href="Header.xsl"/>
<xsl:include href="SvgHeader.xsl"/>
<xsl:include href="Talen.xsl"/>

<xsl:param name="HuidigPersoon"/>
<xsl:param name="Browser"/>
<xsl:param name="parIEGui"/>
<xsl:param name="Printing"/>
<xsl:param name="parToonVoornaam"/>
<xsl:param name="parToonVoettekst"/>
<xsl:param name="parRefOwner"/>
<xsl:param name="parRefOwnerEMail"/>
<xsl:param name="parToonKalender"/>
<xsl:param name="parStuurSorteersleutel"/>
<xsl:param name="parToonNieuws"/>
<xsl:param name="parNrGenKwartier"/>
<xsl:param name="parNrGeneraties"/>
<xsl:param name="parTaal"/>

<xsl:template match="PERSONEN">

  <xsl:call-template name="ShowMenu"/>

  <xsl:for-each select="PERSOON[@link=$HuidigPersoon]">

    <div align="center">
      <xsl:if test="$Printing = 1">
        <div align="center">
          <a href="javascript:KiesXSL(55,{$HuidigPersoon},'','');"
             onMouseOver = "window.status='{$Txt_terug}'; return true;"
             onMouseOut  = "window.status='';"><h3><xsl:value-of select="$Txt_Waaier"/> (5 <xsl:value-of select="$Txt_generaties"/>) <xsl:value-of select="$Txt_van"/></h3></a>
        </div>
      </xsl:if>
      <xsl:if test="$Printing = 0">
        <h3><xsl:value-of select="$Txt_Waaier"/> (5 <xsl:value-of select="$Txt_generaties"/>) <xsl:value-of select="$Txt_van"/></h3>
      </xsl:if>
      <h2>
        <xsl:for-each select="PERSONAL">
          <xsl:for-each select="NAME">
            <xsl:if test="string-length(@first) != 0">
              <xsl:value-of select="@first"/>
            </xsl:if>
            <xsl:if test="string-length(@first) = 0">
              <xsl:value-of select="@nick"/>
            </xsl:if>
            <xsl:if test="string-length(@pref) != 0">
              <xsl:text> </xsl:text><xsl:value-of select="@pref"/>
            </xsl:if>
            <xsl:text> </xsl:text><xsl:value-of select="@surn"/>
          </xsl:for-each>
        </xsl:for-each>
      </h2>
      <embed name="SVGEmbedIDAVJTVB" src="Svg/Waaier5G.svg.gz" width="787" height="540" pluginspage="http://www.adobe.com/svg/viewer/install/" type="image/svg+xml"></embed>
    </div>

    <xsl:call-template name="SvgNavigatie">
        <xsl:with-param name="IsPrinting"><xsl:value-of select="$Printing"/></xsl:with-param>
        <xsl:with-param name="IsSvg">1</xsl:with-param>
        <xsl:with-param name="WelkeSvg">55</xsl:with-param>
        <xsl:with-param name="MaxNrGen"><xsl:value-of select="$parNrGenKwartier"/></xsl:with-param>
    </xsl:call-template>

  </xsl:for-each>

</xsl:template>

</xsl:stylesheet>
