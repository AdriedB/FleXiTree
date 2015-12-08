<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">
<!--
// <author>Adrie den Blanken</author>
// <file>$Workfile: LaatstGewijzigd.xsl $</file><date>$Date: 15-01-15 19:56 $</date>
// <revision>$Revision: 20 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this
// header stays intact. No responsibility is accepted
// for use of this software.</disclaimer>
-->
<xsl:output method="html"/>

<xsl:include href="Header.xsl"/>
<xsl:include href="Talen.xsl"/>

<xsl:param name="HuidigPersoon"/>
<xsl:param name="Browser"/>
<xsl:param name="LijstWoord"/>
<xsl:param name="Key2"/>
<xsl:param name="Printing"/>
<xsl:param name="parToonVoornaam"/>
<xsl:param name="parToonVoettekst"/>
<xsl:param name="parSortKey"/>
<xsl:param name="parSortOrder"/>
<xsl:param name="parToonNaam"/>
<xsl:param name="parRefOwner"/>
<xsl:param name="parRefOwnerEMail"/>
<xsl:param name="parToonKalender"/>
<xsl:param name="parStuurSorteersleutel"/>
<xsl:param name="parToonNieuws"/>
<xsl:param name="parNrMaandenMutatie"/>
<xsl:param name="parTaal"/>

<!--
Het begin
-->
  <xsl:variable name="bestandmaand">
  		<xsl:value-of select="1 * substring(//FLEXITREE/@date,4,2)"/>
  </xsl:variable>
  <xsl:variable name="bestandjaar">
  		<xsl:value-of select="1 * substring(//FLEXITREE/@date,7,4)"/>
  </xsl:variable>
  <xsl:variable name="sindsjaar">
  	<xsl:value-of select="floor((12 * $bestandjaar + $bestandmaand - $parNrMaandenMutatie) div 12)"/>
  </xsl:variable>
  <xsl:variable name="sindsmaand">
  	<xsl:value-of select="((12 * $bestandjaar + $bestandmaand - $parNrMaandenMutatie) mod 12) + 1"/>
  </xsl:variable>

<xsl:template match="PERSONEN">

  <xsl:call-template name="ShowMenu"/>

  <div align="center">
    <h2>
      <xsl:value-of select="$Txt_Laatstgewijzigdtitel"/>
      <xsl:choose>
  	    <xsl:when test="$sindsmaand = 1"><xsl:value-of select="$Txt_januari"/><xsl:text> </xsl:text></xsl:when>
  	    <xsl:when test="$sindsmaand = 2"><xsl:value-of select="$Txt_februari"/><xsl:text> </xsl:text></xsl:when>
  	    <xsl:when test="$sindsmaand = 3"><xsl:value-of select="$Txt_maart"/><xsl:text> </xsl:text></xsl:when>
  	    <xsl:when test="$sindsmaand = 4"><xsl:value-of select="$Txt_april"/><xsl:text> </xsl:text></xsl:when>
  	    <xsl:when test="$sindsmaand = 5"><xsl:value-of select="$Txt_mei"/><xsl:text> </xsl:text></xsl:when>
  	    <xsl:when test="$sindsmaand = 6"><xsl:value-of select="$Txt_juni"/><xsl:text> </xsl:text></xsl:when>
  	    <xsl:when test="$sindsmaand = 7"><xsl:value-of select="$Txt_juli"/><xsl:text> </xsl:text></xsl:when>
  	    <xsl:when test="$sindsmaand = 8"><xsl:value-of select="$Txt_augustus"/><xsl:text> </xsl:text></xsl:when>
  	    <xsl:when test="$sindsmaand = 9"><xsl:value-of select="$Txt_september"/><xsl:text> </xsl:text></xsl:when>
  	    <xsl:when test="$sindsmaand = 10"><xsl:value-of select="$Txt_oktober"/><xsl:text> </xsl:text></xsl:when>
  	    <xsl:when test="$sindsmaand = 11"><xsl:value-of select="$Txt_november"/><xsl:text> </xsl:text></xsl:when>
  	    <xsl:when test="$sindsmaand = 12"><xsl:value-of select="$Txt_december"/><xsl:text> </xsl:text></xsl:when>
      </xsl:choose>
      <xsl:value-of select="$sindsjaar"/>
    </h2>
    <xsl:call-template name="Txt_sorteervolgorde">
      <xsl:with-param name="orde"><xsl:value-of select="$parSortOrder"/></xsl:with-param>
    </xsl:call-template>
    <xsl:choose>
      <xsl:when test="$parSortKey=27">
        <xsl:value-of select="$Txt_Wijzigingsdatum"/>
      </xsl:when>
      <xsl:when test="$parSortKey=28">
        <xsl:value-of select="$Txt_Naam"/>
      </xsl:when>
      <xsl:when test="$parSortKey=29">
        <xsl:value-of select="$Txt_Geboortedatum"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$Txt_Overlijdensdatum"/>
      </xsl:otherwise>
    </xsl:choose>
    <br />
    <xsl:if test="$varStuurSorteersleutel=1">
       <xsl:value-of select="$Txt_Verandersorteer"/><br />
    </xsl:if>
    <br />
    <xsl:call-template name="KolomWeergave"/>
  </div>

  <xsl:call-template name="ShowFooter"/>

</xsl:template>

<xsl:template name="LaatstGewijzigdWeergave">
        <tr>
          <td align="left">
            <xsl:for-each select="PERSONAL">
              <xsl:call-template name="ShowLijstPersoon">
                <xsl:with-param name="relatie"></xsl:with-param>
                <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
                <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
                <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
                <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
                <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
                <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
                <xsl:with-param name="naamweergave"><xsl:value-of select="$parToonNaam"/></xsl:with-param>
              </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="EVENTS/DEATH">
              <xsl:value-of select="$dagger"/>
            </xsl:for-each>
          </td>
          <td align="right">
            <xsl:value-of select="@chg"/><xsl:text>&#160;</xsl:text>
          </td>
          <td align="right">
            <xsl:value-of select="EVENTS/BIRTH/@onz"/><xsl:value-of select="EVENTS/BIRTH/@date"/><xsl:text>&#160;</xsl:text>
          </td>
          <td align="right">
            <xsl:value-of select="EVENTS/DEATH/@onz"/><xsl:value-of select="EVENTS/DEATH/@date"/><xsl:text>&#160;</xsl:text>
          </td>
        </tr>
</xsl:template>

<xsl:template name="KolomWeergave">
    <table border="1" bordercolor="black" cellspacing="0" cellpadding="4" class="tbl-data">
     <tr>
       <xsl:call-template name="addColumn">
          <xsl:with-param name="name"><xsl:value-of select="$Txt_Naam"/></xsl:with-param>
          <xsl:with-param name="sort">28</xsl:with-param>
       </xsl:call-template>
       <xsl:call-template name="addColumn">
          <xsl:with-param name="name"><xsl:value-of select="$Txt_Wijzigingsdatum"/></xsl:with-param>
          <xsl:with-param name="sort">27</xsl:with-param>
          <xsl:with-param name="align">right</xsl:with-param>
       </xsl:call-template>
       <xsl:call-template name="addColumn">
          <xsl:with-param name="name"><xsl:value-of select="$Txt_Geboortedatum"/></xsl:with-param>
          <xsl:with-param name="sort">29</xsl:with-param>
          <xsl:with-param name="align">right</xsl:with-param>
       </xsl:call-template>
       <xsl:call-template name="addColumn">
          <xsl:with-param name="name"><xsl:value-of select="$Txt_Overlijdensdatum"/></xsl:with-param>
          <xsl:with-param name="sort">30</xsl:with-param>
          <xsl:with-param name="align">right</xsl:with-param>
       </xsl:call-template>
     </tr>
     <xsl:for-each select="PERSOON[string-length(@chg) != 0]">
      	<xsl:sort select="concat(PERSONAL/NAME/@surn,PERSONAL/NAME/@first)" order="ascending"/>
        <xsl:sort select="concat(substring(EVENTS/BIRTH/@date,string-length(EVENTS/BIRTH/@date)-3,4),substring(EVENTS/BIRTH/@date,4,2),substring(EVENTS/BIRTH/@date,1,2))" order="ascending"/>
        <xsl:sort select="concat(substring(@chg,string-length(@chg)-3,4),substring(@chg,4,2),substring(@chg,1,2))" order="ascending"/>
        <xsl:sort select="concat(substring(EVENTS/DEATH/@date,string-length(EVENTS/DEATH/@date)-3,4),substring(EVENTS/DEATH/@date,4,2),substring(EVENTS/DEATH/@date,1,2))" order="ascending"/>
        <xsl:variable name="chgmaand">
        	<xsl:value-of select="1 * substring(@chg,4,2)"/>
        </xsl:variable>
        <xsl:variable name="chgjaar">
        	<xsl:value-of select="1 * substring(@chg,7,4)"/>
        </xsl:variable>
        <xsl:if test="$parNrMaandenMutatie &gt; 12 * ($bestandjaar - $chgjaar) + $bestandmaand - $chgmaand">
	        <xsl:call-template name="LaatstGewijzigdWeergave"/>
	    </xsl:if>
      </xsl:for-each>
    </table>
</xsl:template>

</xsl:stylesheet>
