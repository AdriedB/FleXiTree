<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">
<!--
// <author>Paul Kallenberg</author>
// <file>$Workfile: Diavoorstelling.xsl $</file><date>$Date: 15-01-15 19:56 $</date>
// <revision>$Revision: 9 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this header stays intact.
// No responsibility is accepted for use of this software.</disclaimer>
-->

<xsl:output method="html"/>

<xsl:include href="Header.xsl"/>
<xsl:include href="Talen.xsl"/>

<xsl:param name="HuidigPersoon"/>
<xsl:param name="LijstWoord"/>
<xsl:param name="Browser"/>
<xsl:param name="Printing"/>
<xsl:param name="parToonVoornaam"/>
<xsl:param name="parToonVoettekst"/>
<xsl:param name="parDiaVolgorde"/>
<xsl:param name="parFotoAantal"/>
<xsl:param name="parRefOwner"/>
<xsl:param name="parRefOwnerEMail"/>
<xsl:param name="parToonKalender"/>
<xsl:param name="parStuurSorteersleutel"/>
<xsl:param name="parToonNieuws"/>
<xsl:param name="parTaal"/>

<xsl:template match="PERSONEN">

  <xsl:call-template name="ShowMenu"/>
    <div align="center">
    <xsl:choose>
      <xsl:when test="count(//PERSONEN/PERSOON/PERSONAL/PHOTOS/PHOTO)!=0 and $parFotoAantal &gt; 1">
        <img src="{$varFolderFotoAlbum}/" name="SlideShow" height="0" border="1" bordercolor="black"/>
      </xsl:when>
      <xsl:when test="count(//PERSONEN/PERSOON/PERSONAL/PHOTOS/PHOTO)!=0 and $parFotoAantal = 1">
        <h4>
          <xsl:value-of select="$Txt_Geenfotosinstellingen"/>
        </h4>
      </xsl:when>
      <xsl:otherwise>
        <h4>
          <xsl:value-of select="$Txt_Geenfotos"/>
        </h4>
      </xsl:otherwise>
    </xsl:choose>
	</div>
	<div align="center" id="Fototekst">
	</div>

</xsl:template>

</xsl:stylesheet>
