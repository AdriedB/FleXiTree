<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">
<!--
// <author>Adrie den Blanken</author>
// <file>$Workfile: Nageslacht.xsl $</file><date>$Date: 15-01-15 19:56 $</date>
// <revision>$Revision: 24 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this
// header stays intact. No responsibility is accepted
// for use of this software.</disclaimer>
-->
<xsl:output method="html"/>

<xsl:include href="Header.xsl"/>
<xsl:include href="Talen.xsl"/>

<xsl:param name="HuidigPersoon"/>
<xsl:param name="Browser"/>
<xsl:param name="parIEGui"/>
<xsl:param name="Printing"/>
<xsl:param name="parToonVoornaam"/>
<xsl:param name="parToonVoettekst"/>
<xsl:param name="parNrGeneraties"/>
<xsl:param name="parRefOwner"/>
<xsl:param name="parRefOwnerEMail"/>
<xsl:param name="parToonKalender"/>
<xsl:param name="parStuurSorteersleutel"/>
<xsl:param name="parToonNieuws"/>
<xsl:param name="parNrGenParenteel"/>
<xsl:param name="parTaal"/>

<!--
Het begin
-->

<xsl:template match="PERSONEN">

  <xsl:call-template name="ShowMenu"/>

  <blockquote>
    <h2>
      <xsl:value-of select="$Txt_Nageslachtrapportentitel"/>
      <xsl:for-each select="PERSOON[@link=$HuidigPersoon]/PERSONAL">
        <xsl:for-each select="NAME">
          <xsl:value-of select="@first"/>
          <xsl:if test="string-length(@nick)>0"><xsl:text> </xsl:text></xsl:if>
          <xsl:if test="string-length(@first)>0 and string-length(@nick)>0">(</xsl:if>
          <xsl:value-of select="@nick"/>
          <xsl:if test="string-length(@first)>0 and string-length(@nick)>0">)</xsl:if>
          <xsl:if test="string-length(@pref)>0"><xsl:text> </xsl:text><xsl:value-of select="@pref"/></xsl:if>
          <xsl:text> </xsl:text><xsl:value-of select="@surn"/>
        </xsl:for-each>
      </xsl:for-each>
    </h2>

    <xsl:if test="$Browser = 'IE'">

    <h3><xsl:value-of select="$Txt_Nageslacht"/></h3>
    <table border="0" cellspacing="3" cellpadding="0" class="tbl-tekst">
      <tr>
        <td width="20"><xsl:value-of select="$nbsp"/></td>
        <td><a href="javascript:KiesXSL(9,'{$HuidigPersoon}','')"><xsl:value-of select="$Txt_Kleinkinderen"/></a></td>
      </tr>
      <tr>
        <td><xsl:value-of select="$nbsp"/></td>
        <td><a href="javascript:KiesXSL(10,'{$HuidigPersoon}','')"><xsl:value-of select="$Txt_Achterkleinkinderen"/></a></td>
      </tr>
    </table>
    <h3>
    <xsl:value-of select="$Txt_Grafisch"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_nageslacht"/><xsl:text> </xsl:text>
    (<xsl:value-of select="$Txt_aantal"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_generaties"/><xsl:text> </xsl:text>(<xsl:value-of select="$Txt_is"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_nu"/>: 
    <xsl:if test="$parNrGeneraties = 0"><xsl:value-of select="$Txt_alle"/></xsl:if>
    <xsl:if test="$parNrGeneraties != 0"><xsl:value-of select="$parNrGeneraties"/></xsl:if>)
     <xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_fotos"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_via"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_Instellingen"/>)
    </h3>
    <table border="0" cellspacing="3" cellpadding="0" class="tbl-tekst">
      <tr>
        <td width="20"><xsl:value-of select="$nbsp"/></td>
        <td><a href="javascript:KiesXSL(24,'{$HuidigPersoon}','','1')"><xsl:value-of select="$Txt_Rechthoek"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_uitgebreid"/></a></td>
      </tr>
      <tr>
        <td><xsl:value-of select="$nbsp"/></td>
        <td><a href="javascript:KiesXSL(24,'{$HuidigPersoon}','','2')"><xsl:value-of select="$Txt_Rechthoek"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_kompakt"/></a></td>
      </tr>
      <xsl:if test="$parIEGui != 'METRO'">
        <tr>
          <td><xsl:value-of select="$nbsp"/></td>
          <td><a href="javascript:KiesXSL(26,'{$HuidigPersoon}','','')"><xsl:value-of select="$Txt_Cirkel"/></a></td>
        </tr>
      </xsl:if>
    </table>

    </xsl:if>

    <xsl:if test="$parNrGenParenteel != 0">
    <h3>
    	<xsl:value-of select="$Txt_Nageslachtrapportenintekstvorm"/>
    	<xsl:if test="$parNrGenParenteel &lt; 99">
		    (<xsl:value-of select="$Txt_maximaal"/><xsl:text> </xsl:text>
		    <xsl:if test="$parNrGenParenteel = 1"><xsl:value-of select="$Txt_generatie"/></xsl:if>
		    <xsl:if test="$parNrGenParenteel != 1"><xsl:value-of select="$Txt_generaties"/></xsl:if>)
		</xsl:if>
    </h3>
    <table border="0" cellspacing="3" cellpadding="0" class="tbl-tekst">
      <tr>
        <td width="20"><xsl:value-of select="$nbsp"/></td>
        <td><a href="javascript:KiesXSL(35,'{$HuidigPersoon}','B','1')">
            <xsl:value-of select="$Txt_Parenteel"/><xsl:text> </xsl:text>(=<xsl:text> </xsl:text><xsl:value-of select="$Txt_beide"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_lijnen"/>)</a></td>
      </tr>
      <tr>
        <td><xsl:value-of select="$nbsp"/></td>
        <td><a href="javascript:KiesXSL(35,'{$HuidigPersoon}','M','1')">
            <xsl:value-of select="$Txt_Genealogie"/><xsl:text> </xsl:text>(=<xsl:text> </xsl:text><xsl:value-of select="$Txt_mannelijkelijn"/>)</a></td>
      </tr>
      <tr>
        <td><xsl:value-of select="$nbsp"/></td>
        <td><a href="javascript:KiesXSL(35,'{$HuidigPersoon}','V','1')">
            <xsl:value-of select="$Txt_Nageslachtvrouwlijn"/><xsl:text> </xsl:text>(=<xsl:text> </xsl:text><xsl:value-of select="$Txt_vrouwelijkelijn"/>)</a></td>
      </tr>
    </table>
    </xsl:if>
    <h3><xsl:value-of select="$Txt_Verkort_parenteel"/></h3>
    <table border="0" cellspacing="0" cellpadding="0" class="tbl-tekst">
      <tr>
        <td width="20"><xsl:value-of select="$nbsp"/></td>
  	    <td><a href="javascript:KiesXSL(38,'{$HuidigPersoon}','B','1')"><xsl:value-of select="$Txt_Verkort_parenteel"/></a></td>
      </tr>
    </table>
    <h3><xsl:value-of select="$Txt_Stamreeks"/></h3>
    <table border="0" cellspacing="0" cellpadding="0" class="tbl-tekst">
      <tr>
        <td width="20"><xsl:value-of select="$nbsp"/></td>
  	    <td><a href="javascript:KiesXSL(38,'{$HuidigPersoon}','B','0')"><xsl:value-of select="$Txt_Parenteel"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_stamvader"/></a></td>
      </tr>
    </table>
    <xsl:if test="$Browser = 'IE'">
      <h3><xsl:value-of select="$Txt_Leeftijd"/>-<xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_generatieoverzichten"/></h3>
      <table border="0" cellspacing="0" cellpadding="0" class="tbl-tekst">
        <tr>
        <td width="20"><xsl:value-of select="$nbsp"/></td>
  	<td><a href="javascript:KiesXSL(37,'{$HuidigPersoon}','nageslacht','histogram')"><xsl:value-of select="$Txt_Histogram"/></a></td>
        </tr>
        <tr>
  	<td><xsl:value-of select="$nbsp"/></td>
  	<td><a href="javascript:KiesXSL(37,'{$HuidigPersoon}','nageslacht','tabel')"><xsl:value-of select="$Txt_Tabellen"/></a></td>
        </tr>
      </table>
    </xsl:if>
    <br/>
    <xsl:if test="$parNrGenParenteel &gt; 9">
      <strong>
        <xsl:value-of select="$Txt_Nageslachttekstwaarschuwing"/>
      </strong>
      <xsl:if test="$Browser = 'IE'">
        <strong>
          <xsl:text> </xsl:text><xsl:value-of select="$Txt_Nageslachtgrafischwaarschuwing1"/>
        </strong>
      </xsl:if>
    </xsl:if>
    <xsl:if test="$parNrGenParenteel &lt; 10">
      <xsl:if test="$Browser = 'IE'">
      <strong>
          <xsl:text> </xsl:text><xsl:value-of select="$Txt_Nageslachtgrafischwaarschuwing2"/>
      </strong>
    </xsl:if>
    </xsl:if>
  </blockquote>

  <xsl:call-template name="ShowFooter"/>

</xsl:template>

</xsl:stylesheet>
