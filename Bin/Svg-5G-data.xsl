<?xml version = "1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">
<!--
// <author>Adrie den Blanken</author>
// <file>$Workfile: Svg-5G-data.xsl $</file><date>$Date: 24-02-13 13:44 $</date>
// <revision>$Revision: 9 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this
// header stays intact. No responsibility is accepted
// for use of this software.</disclaimer>
-->
<xsl:output method="xml"/>

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
<xsl:param name="parNrGeneraties"/>
<xsl:param name="parTaal"/>

<xsl:template match="PERSONEN">

<svg xmlns:xlink="http://www.w3.org/1999/xlink">
  <defs>

    <xsl:call-template name="ShowGezinInSvg">
      <xsl:with-param name="aantalGeneraties">5</xsl:with-param>
      <xsl:with-param name="linkGezin"><xsl:value-of select="$HuidigPersoon"/></xsl:with-param>
    </xsl:call-template>

  </defs>
</svg>

</xsl:template>

</xsl:stylesheet>
