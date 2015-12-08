<?xml version = "1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">
<!--
// <author>Adrie den Blanken</author>
// <file>$Workfile: Cirkel7G.xsl $</file><date>$Date: 24-02-13 13:44 $</date>
// <revision>$Revision: 10 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this
// header stays intact. No responsibility is accepted
// for use of this software.</disclaimer>
-->
<xsl:output method="html"/>

<xsl:include href="Header.xsl"/>
<xsl:include href="SvgHeader.xsl"/>
<xsl:include href="CirkelBody.xsl"/>
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

  <xsl:call-template name="CirkelBody">
     <xsl:with-param name="generaties">7</xsl:with-param>
  </xsl:call-template>

</xsl:template>

</xsl:stylesheet>
