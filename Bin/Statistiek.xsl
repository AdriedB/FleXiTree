<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">
<!--
// <author>Adrie den Blanken</author>
// <file>$Workfile: Statistiek.xsl $</file><date>$Date: 15-01-15 19:56 $</date>
// <revision>$Revision: 13 $</revision><release>1.0</release>
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
<xsl:param name="parRefOwner"/>
<xsl:param name="parRefOwnerEMail"/>
<xsl:param name="parToonKalender"/>
<xsl:param name="parStuurSorteersleutel"/>
<xsl:param name="parToonNieuws"/>
<xsl:param name="parToonPersonen"/>
<xsl:param name="parTaal"/>
<xsl:param name="parToonSortnaam"/>

<!--
Het begin
-->

<xsl:template match="PERSONEN">

  <xsl:call-template name="ShowMenu"/>

  <blockquote>
    <h2>
      <xsl:value-of select="$Txt_Statistiektitel"/>
    </h2>
  
    <strong><xsl:value-of select="$Txt_Overzicht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_vande"/><xsl:text> </xsl:text>
    <xsl:if test="$parToonPersonen = 1">
    	<a href="javascript:KiesXSL(20,'{$HuidigPersoon}','0','')"><xsl:value-of select="$Txt_personen"/></a>: 
    </xsl:if>
    <xsl:if test="$parToonPersonen = 0">
    	<xsl:value-of select="$Txt_personen"/>: 
    </xsl:if>
    <xsl:value-of select="count(PERSOON) - count(PERSOON[@link=0])"/></strong>
    <ul>
      <li><xsl:value-of select="count(PERSOON/PERSONAL[@sex='M'])"/><xsl:text> </xsl:text><a href="javascript:KiesXSL(31,'{$HuidigPersoon}','M','0')"><xsl:value-of select="$Txt_mannen"/></a> (<xsl:value-of select="count(PERSOON[not(EVENTS/DEATH) and PERSONAL[@sex='M']])"/> <xsl:text> </xsl:text><a href="javascript:KiesXSL(32,'{$HuidigPersoon}','0','M')"><xsl:value-of select="$Txt_levenden_m"/></a><xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text><xsl:value-of select="count(PERSOON[EVENTS/DEATH and PERSONAL[@sex='M']])"/> <xsl:text> </xsl:text><a href="javascript:KiesXSL(33,'{$HuidigPersoon}','0','M')"><xsl:value-of select="$Txt_overledenen_m"/></a>)</li>
      <li><xsl:value-of select="count(PERSOON/PERSONAL[@sex='V'])"/><xsl:text> </xsl:text><a href="javascript:KiesXSL(31,'{$HuidigPersoon}','V','0')"><xsl:value-of select="$Txt_vrouwen"/></a> (<xsl:value-of select="count(PERSOON[not(EVENTS/DEATH) and PERSONAL[@sex='V']])"/> <xsl:text> </xsl:text><a href="javascript:KiesXSL(32,'{$HuidigPersoon}','0','V')"><xsl:value-of select="$Txt_levenden_v"/></a><xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text><xsl:value-of select="count(PERSOON[EVENTS/DEATH and PERSONAL[@sex='V']])"/> <xsl:text> </xsl:text><a href="javascript:KiesXSL(33,'{$HuidigPersoon}','0','V')"><xsl:value-of select="$Txt_overledenen_v"/></a>)</li>
      <xsl:if test="count(PERSOON) - count(PERSOON[@link=0]) - count(PERSOON/PERSONAL[@sex='M']) - count(PERSOON/PERSONAL[@sex='V']) != 0">
        <li><xsl:value-of select="count(PERSOON) - count(PERSOON[@link=0]) - count(PERSOON/PERSONAL[@sex='M']) - count(PERSOON/PERSONAL[@sex='V'])"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/> <xsl:text> </xsl:text><a href="javascript:KiesXSL(31,'{$HuidigPersoon}','?','0')"><xsl:value-of select="$Txt_onbekend_geslacht"/></a></li>
      </xsl:if>
      <li><xsl:value-of select="count(PERSOON[not(EVENTS/DEATH)])- count(PERSOON[@link=0])"/><xsl:text> </xsl:text><a href="javascript:KiesXSL(32,'{$HuidigPersoon}','0','0')"><xsl:value-of select="$Txt_levenden_v"/></a></li>
      <li><xsl:value-of select="count(PERSOON) - count(PERSOON[not(EVENTS/DEATH)])"/><xsl:text> </xsl:text><a href="javascript:KiesXSL(33,'{$HuidigPersoon}','0','0')"><xsl:value-of select="$Txt_overledenen_v"/></a></li>
    </ul>

    <xsl:if test="$parToonSortnaam = '1'">
      <strong><xsl:value-of select="$Txt_Aantal"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_personen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_dragend"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_achternaam"/> "<xsl:value-of select="$refAchternaam"/>"</strong>
      <ul>
        <li><xsl:value-of select="count(PERSOON/PERSONAL/NAME[@surn=$refAchternaam])"/> <xsl:text> </xsl:text><a href="javascript:KiesXSL(20,'{$HuidigPersoon}','1','')"><xsl:value-of select="$Txt_personen"/></a> (<xsl:value-of select="count(PERSOON[not(EVENTS/DEATH) and PERSONAL/NAME[@surn=$refAchternaam]])"/><xsl:text> </xsl:text><a href="javascript:KiesXSL(32,'{$HuidigPersoon}','1','0')"><xsl:value-of select="$Txt_levenden_v"/></a><xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text><xsl:value-of select="count(PERSOON[EVENTS/DEATH and PERSONAL/NAME[@surn=$refAchternaam]])"/><xsl:text> </xsl:text><a href="javascript:KiesXSL(33,'{$HuidigPersoon}','1','0')"><xsl:value-of select="$Txt_overledenen_v"/></a>)</li>
        <li><xsl:value-of select="count(PERSOON[PERSONAL/NAME[@surn=$refAchternaam] and PERSONAL[@sex='M']])"/><xsl:text> </xsl:text><a href="javascript:KiesXSL(31,'{$HuidigPersoon}','M','1')"><xsl:value-of select="$Txt_mannen"/></a> (<xsl:value-of select="count(PERSOON[not(EVENTS/DEATH) and PERSONAL[@sex='M'] and PERSONAL/NAME[@surn=$refAchternaam]])"/> <xsl:text> </xsl:text><a href="javascript:KiesXSL(32,'{$HuidigPersoon}','1','M')"><xsl:value-of select="$Txt_levenden_m"/></a><xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text><xsl:value-of select="count(PERSOON[EVENTS/DEATH and PERSONAL[@sex='M']  and PERSONAL/NAME[@surn=$refAchternaam]])"/> <xsl:text> </xsl:text><a href="javascript:KiesXSL(33,'{$HuidigPersoon}','1','M')"><xsl:value-of select="$Txt_overledenen_m"/></a>)</li>
        <li><xsl:value-of select="count(PERSOON[PERSONAL/NAME[@surn=$refAchternaam] and PERSONAL[@sex='V']])"/><xsl:text> </xsl:text><a href="javascript:KiesXSL(31,'{$HuidigPersoon}','V','1')"><xsl:value-of select="$Txt_vrouwen"/></a> (<xsl:value-of select="count(PERSOON[not(EVENTS/DEATH) and PERSONAL[@sex='V'] and PERSONAL/NAME[@surn=$refAchternaam]])"/> <xsl:text> </xsl:text><a href="javascript:KiesXSL(32,'{$HuidigPersoon}','1','V')"><xsl:value-of select="$Txt_levenden_v"/></a><xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text><xsl:value-of select="count(PERSOON[EVENTS/DEATH and PERSONAL[@sex='V'] and PERSONAL/NAME[@surn=$refAchternaam]])"/> <xsl:text> </xsl:text><a href="javascript:KiesXSL(33,'{$HuidigPersoon}','1','V')"><xsl:value-of select="$Txt_overledenen_v"/></a>)</li>
      </ul>
    </xsl:if>

    <xsl:if test="$parToonSortnaam = '2'">
      <strong><xsl:value-of select="$Txt_Aantal"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_personen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_familie"/> "<xsl:value-of select="$refAchternaam"/>"</strong>
      <ul>
        <li><xsl:value-of select="count(PERSOON/PERSONAL/NAME[@sort=$refAchternaam or @surn=$refAchternaam])"/> <xsl:text> </xsl:text><a href="javascript:KiesXSL(20,'{$HuidigPersoon}','1','')"><xsl:value-of select="$Txt_personen"/></a> (<xsl:value-of select="count(PERSOON[not(EVENTS/DEATH) and PERSONAL/NAME[@sort=$refAchternaam or @surn=$refAchternaam]])"/><xsl:text> </xsl:text><a href="javascript:KiesXSL(32,'{$HuidigPersoon}','1','0')"><xsl:value-of select="$Txt_levenden_v"/></a><xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text><xsl:value-of select="count(PERSOON[EVENTS/DEATH and PERSONAL/NAME[@sort=$refAchternaam or @surn=$refAchternaam]])"/><xsl:text> </xsl:text><a href="javascript:KiesXSL(33,'{$HuidigPersoon}','1','0')"><xsl:value-of select="$Txt_overledenen_v"/></a>)</li>
        <li><xsl:value-of select="count(PERSOON[PERSONAL/NAME[@sort=$refAchternaam or @surn=$refAchternaam] and PERSONAL[@sex='M']])"/><xsl:text> </xsl:text><a href="javascript:KiesXSL(31,'{$HuidigPersoon}','M','1')"><xsl:value-of select="$Txt_mannen"/></a> (<xsl:value-of select="count(PERSOON[not(EVENTS/DEATH) and PERSONAL[@sex='M'] and PERSONAL/NAME[@sort=$refAchternaam or @surn=$refAchternaam]])"/> <xsl:text> </xsl:text><a href="javascript:KiesXSL(32,'{$HuidigPersoon}','1','M')"><xsl:value-of select="$Txt_levenden_m"/></a><xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text><xsl:value-of select="count(PERSOON[EVENTS/DEATH and PERSONAL[@sex='M']  and PERSONAL/NAME[@sort=$refAchternaam or @surn=$refAchternaam]])"/> <xsl:text> </xsl:text><a href="javascript:KiesXSL(33,'{$HuidigPersoon}','1','M')"><xsl:value-of select="$Txt_overledenen_m"/></a>)</li>
        <li><xsl:value-of select="count(PERSOON[PERSONAL/NAME[@sort=$refAchternaam or @surn=$refAchternaam] and PERSONAL[@sex='V']])"/><xsl:text> </xsl:text><a href="javascript:KiesXSL(31,'{$HuidigPersoon}','V','1')"><xsl:value-of select="$Txt_vrouwen"/></a> (<xsl:value-of select="count(PERSOON[not(EVENTS/DEATH) and PERSONAL[@sex='V'] and PERSONAL/NAME[@sort=$refAchternaam or @surn=$refAchternaam]])"/> <xsl:text> </xsl:text><a href="javascript:KiesXSL(32,'{$HuidigPersoon}','1','V')"><xsl:value-of select="$Txt_levenden_v"/></a><xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text><xsl:value-of select="count(PERSOON[EVENTS/DEATH and PERSONAL[@sex='V'] and PERSONAL/NAME[@sort=$refAchternaam or @surn=$refAchternaam]])"/> <xsl:text> </xsl:text><a href="javascript:KiesXSL(33,'{$HuidigPersoon}','1','V')"><xsl:value-of select="$Txt_overledenen_v"/></a>)</li>
      </ul>
    </xsl:if>

    <xsl:if test="$Browser = 'IE'">
      <strong><xsl:value-of select="$Txt_Leeftijdsoverzichten"/></strong>
      <ul>
        <li><a href="javascript:KiesXSL(37,'{$HuidigPersoon}','geheel','histogram')"><xsl:value-of select="$Txt_Histogrammen"/></a></li>
        <li><a href="javascript:KiesXSL(37,'{$HuidigPersoon}','geheel','tabel')"><xsl:value-of select="$Txt_Tabellen"/></a></li>
      </ul>
    </xsl:if>

    <!--
    Aanvullende stamboom specifieke informatie
    <xsl:call-template name="ExtraStatistiek"/>
    -->

  </blockquote>
  <xsl:call-template name="ShowFooter"/>

</xsl:template>

</xsl:stylesheet>
