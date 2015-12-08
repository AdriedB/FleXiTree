<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">
<!--
// <author>Adrie den Blanken</author>
// <file>$Workfile: Lijsten.xsl $</file><date>$Date: 15-01-15 19:56 $</date>
// <revision>$Revision: 25 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this
// header stays intact. No responsibility is accepted
// for use of this software.</disclaimer>
-->
<xsl:output method="html"/>

<xsl:include href="Header.xsl"/>
<xsl:include href="Talen.xsl"/>

<xsl:param name="Browser"/>
<xsl:param name="HuidigPersoon"/>
<xsl:param name="Printing"/>
<xsl:param name="parToonVoornaam"/>
<xsl:param name="parToonVoettekst"/>
<xsl:param name="parToonControle"/>
<xsl:param name="parRefOwner"/>
<xsl:param name="parRefOwnerEMail"/>
<xsl:param name="parToonKalender"/>
<xsl:param name="parStuurSorteersleutel"/>
<xsl:param name="parToonNieuws"/>
<xsl:param name="parToonHistKalender"/>
<xsl:param name="parToonPersonen"/>
<xsl:param name="parNrMaandenMutatie"/>
<xsl:param name="parToonHuwelijk"/>
<xsl:param name="parToonRelatieVerwant"/>
<xsl:param name="parToonMemory"/>
<xsl:param name="parTaal"/>

<!--
Het begin
-->

<xsl:template match="PERSONEN">
<xsl:variable name="varToonControleLijsten"><xsl:value-of select="$parToonControle"/></xsl:variable>

  <xsl:call-template name="ShowMenu"/>

  <blockquote>
    <h2><xsl:value-of select="$Txt_Fotos"/></h2>
    <ul>
      <li><a href="javascript:KiesXSL(94,'{$HuidigPersoon}','','')"><xsl:value-of select="$Txt_Diavoorstelling"/></a></li>
      <li><a href="javascript:KiesXSL(81,'{$HuidigPersoon}','','1')"><xsl:value-of select="$Txt_Fotogalerij"/></a></li>
      <xsl:if test="$parToonMemory = 1">
	    <li><a href="javascript:KiesXSL(95,'{$HuidigPersoon}','','')"><xsl:value-of select="$Txt_FotoMemory"/></a></li>
	  </xsl:if>
      <li><a href="javascript:KiesXSL(03,'{$HuidigPersoon}','','')"><xsl:value-of select="$Txt_Overzicht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_alle_m"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_fotos"/></a></li>
    </ul>
    <h2><xsl:value-of select="$Txt_Gebeurtenissen"/></h2>
    <ul>
     <xsl:if test="$parNrMaandenMutatie != 0">
      <li><a href="javascript:KiesXSL(25,'{$HuidigPersoon}','','')">
        <xsl:value-of select="$Txt_Laatstgewijzigdtitel2"/>
      </a></li>
     </xsl:if>
      <xsl:if test="$Browser = 'IE'">
        <xsl:if test="$parToonHistKalender = 1">
          <li><a href="javascript:KiesXSL(89,'{$HuidigPersoon}','','')">
            <xsl:value-of select="$Txt_OverzichtGebeurtenissen"/>
          </a></li>
        </xsl:if>
        <li><a href="javascript:KiesXSL(87,'{$HuidigPersoon}','','')">
          <xsl:value-of select="$Txt_OverzichtGebeurtenissenVandaag"/>
        </a></li>
      </xsl:if>
    </ul>
    <h2><xsl:value-of select="$Txt_Kalenders"/></h2>
    <ul>
      <li><a href="javascript:KiesXSL(34,'{$HuidigPersoon}','1','')">
        <xsl:value-of select="$Txt_Kalender"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_vande"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_personen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_dragend"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_achternaam"/><xsl:text> </xsl:text>
        "<xsl:value-of select="$refAchternaam"/>"
      </a></li>
      <li><a href="javascript:KiesXSL(34,'{$HuidigPersoon}','0','')">
        <xsl:value-of select="$Txt_Kalender"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_alle"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_levendepersonen"/>
      </a></li>
      <xsl:if test="$Browser = 'IE'">
        <li><a href="javascript:KiesXSL(88,'{$HuidigPersoon}','0','')">
          <xsl:value-of select="$Txt_Kalender"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_alle_m"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_gebeurtenissen"/>
        </a></li>
      </xsl:if>
    </ul>
    <h2><xsl:value-of select="$Txt_Andere"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_overzichten"/></h2>
    <ul>
      <xsl:if test="$parToonPersonen = 1">
        <li><a href="javascript:KiesXSL(20,'{$HuidigPersoon}','0','')"><xsl:value-of select="$Txt_Overzicht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_alle_v"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_personen"/></a></li>
      </xsl:if>
      <xsl:if test="$varToonControleLijsten = 1">
        <ul>
            <li><a href="javascript:KiesXSL(11,'{$HuidigPersoon}','','')">
              <xsl:value-of select="$Txt_Personen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_zonder_vader"/><xsl:text> </xsl:text>(<xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_achternaam"/>
              "<xsl:value-of select="$refAchternaam"/>")
            </a></li>
            <li><a href="javascript:KiesXSL(12,'{$HuidigPersoon}','','')">
              <xsl:value-of select="$Txt_Personen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_zonder_moeder"/><xsl:text> </xsl:text>(<xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_achternaam"/>
              "<xsl:value-of select="$refAchternaam"/>")
            </a></li>
            <li><a href="javascript:KiesXSL(13,'{$HuidigPersoon}','','')">
              <xsl:value-of select="$Txt_Personen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_zonder"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_vader"/>/<xsl:value-of select="$Txt_moeder"/>/<xsl:value-of select="$Txt_relatie"/>/<xsl:value-of select="$Txt_kinderen"/><xsl:text> </xsl:text>(<xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_achternaam"/>
              "<xsl:value-of select="$refAchternaam"/>")
            </a></li>
            <li><a href="javascript:KiesXSL(17,'{$HuidigPersoon}','','')">
              <xsl:value-of select="$Txt_Personen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_met"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_meerdaneen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_vader"/>/<xsl:value-of select="$Txt_moeder"/>
            </a></li>
        </ul>
      </xsl:if>
      <xsl:if test="$Browser != 'OP'">
        <!-- Opera kan niet met xsl:key omgaan -->
        <li><a href="javascript:KiesXSL(16,'{$HuidigPersoon}','','')"><xsl:value-of select="$Txt_Overzicht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_roepnamen"/></a></li>
        <li><a href="javascript:KiesXSL(14,'{$HuidigPersoon}','','')"><xsl:value-of select="$Txt_Overzicht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_achternamen"/></a></li>
        <li><a href="javascript:KiesXSL(15,'{$HuidigPersoon}','','')"><xsl:value-of select="$Txt_Overzicht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_geboorteplaatsen"/></a></li>
        <li><a href="javascript:KiesXSL(60,'{$HuidigPersoon}','','')"><xsl:value-of select="$Txt_Overzicht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_doopplaatsen"/></a></li>
        <li><a href="javascript:KiesXSL(96,'{$HuidigPersoon}','','')"><xsl:value-of select="$Txt_Overzicht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_relatieplaatsen"/></a></li>
        <li><a href="javascript:KiesXSL(62,'{$HuidigPersoon}','','')"><xsl:value-of select="$Txt_Overzicht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_overlijdensplaatsen"/></a></li>
        <li><a href="javascript:KiesXSL(64,'{$HuidigPersoon}','','')"><xsl:value-of select="$Txt_Overzicht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_begrafenisplaatsen"/></a></li>
        <li><a href="javascript:KiesXSL(66,'{$HuidigPersoon}','','')"><xsl:value-of select="$Txt_Overzicht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_woonplaatsen"/></a></li>
      </xsl:if>
      <xsl:if test="$parToonHuwelijk = 1">
        <li><a href="javascript:KiesXSL(28,'{$HuidigPersoon}','','')"><xsl:value-of select="$Txt_Overzicht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_huwelijken"/>/<xsl:value-of select="$Txt_relaties"/></a></li>
      </xsl:if>
      <xsl:if test="$Browser = 'IE'">
        <xsl:if test="$parToonRelatieVerwant = 1">
          <li><a href="javascript:KiesXSL(93,'{$HuidigPersoon}','','')">
            <xsl:value-of select="$Txt_Overzicht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_verwantschappen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_tussen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_personen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_met"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_relatie"/>
          </a></li>
        </xsl:if>
      </xsl:if>
    </ul>

  </blockquote>

  <xsl:call-template name="ShowFooter"/>

</xsl:template>

</xsl:stylesheet>
