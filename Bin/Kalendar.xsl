<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:user="http://www.adriedenblanken.nl/"
		version="1.0">
<!--
// <author>Adrie den Blanken</author>
// <file>$Workfile: Kalendar.xsl $</file><date>$Date: 15-01-15 19:56 $</date>
// <revision>$Revision: 21 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this
// header stays intact. No responsibility is accepted
// for use of this software.</disclaimer>
-->
<xsl:output method="html"/>

<xsl:include href="Header.xsl"/>
<xsl:include href="Talen.xsl"/>

<xsl:param name="HuidigPersoon"/>
<xsl:param name="LijstWoord"/>
<xsl:param name="Key2"/>
<xsl:param name="Browser"/>
<xsl:param name="Printing"/>
<xsl:param name="parToonVoornaam"/>
<xsl:param name="parToonVoettekst"/>
<xsl:param name="parThisMonth"/>
<xsl:param name="parThisDay"/>
<xsl:param name="parRefOwner"/>
<xsl:param name="parRefOwnerEMail"/>
<xsl:param name="parToonKalender"/>
<xsl:param name="parStuurSorteersleutel"/>
<xsl:param name="parToonNieuws"/>
<xsl:param name="parTaal"/>

<!--
Het begin
-->

<xsl:template match="PERSONEN">

  <xsl:call-template name="ShowMenu"/>

  <!-- XPATH voorbeelden zijn hier te vinden
       http://msdn.microsoft.com/library/default.asp?url=/library/en-us/xmlsdk/html/xmrefxpathexamples.asp -->
  <h2 align="center"><xsl:value-of select="$Txt_Kalender"/></h2>
  <xsl:if test="$LijstWoord='1'">
    <h3 align="center">
      <xsl:value-of select="$Txt_Van"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_alle"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_levendepersonen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_dragend"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_achternaam"/><xsl:text> </xsl:text>
      "<xsl:value-of select="$refAchternaam"/>"
    </h3>
  </xsl:if>
  <xsl:if test="$LijstWoord='0'">
    <h3 align="center"><xsl:value-of select="$Txt_Van"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_alle"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_levendepersonen"/></h3>
  </xsl:if>
  <xsl:if test="count(PERSOON[not(EVENTS/DEATH) and ($LijstWoord='0' or PERSONAL/NAME/@surn=$refAchternaam) and string-length(EVENTS/BIRTH/@date)=10 and not(EVENTS/BIRTH/@onz)])=0">
    <div align="center">
      <xsl:value-of select="$Txt_Geenpersonenselectie"/>
    </div>
  </xsl:if>
  <table align="center">
    <xsl:call-template name="KalenderMaand">
      <xsl:with-param name="maand">01</xsl:with-param>
      <xsl:with-param name="maandnaam"><xsl:value-of select="$Txt_Januari"/></xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="KalenderMaand">
      <xsl:with-param name="maand">02</xsl:with-param>
      <xsl:with-param name="maandnaam"><xsl:value-of select="$Txt_Februari"/></xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="KalenderMaand">
      <xsl:with-param name="maand">03</xsl:with-param>
      <xsl:with-param name="maandnaam"><xsl:value-of select="$Txt_Maart"/></xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="KalenderMaand">
      <xsl:with-param name="maand">04</xsl:with-param>
      <xsl:with-param name="maandnaam"><xsl:value-of select="$Txt_April"/></xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="KalenderMaand">
      <xsl:with-param name="maand">05</xsl:with-param>
      <xsl:with-param name="maandnaam"><xsl:value-of select="$Txt_Mei"/></xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="KalenderMaand">
      <xsl:with-param name="maand">06</xsl:with-param>
      <xsl:with-param name="maandnaam"><xsl:value-of select="$Txt_Juni"/></xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="KalenderMaand">
      <xsl:with-param name="maand">07</xsl:with-param>
      <xsl:with-param name="maandnaam"><xsl:value-of select="$Txt_Juli"/></xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="KalenderMaand">
      <xsl:with-param name="maand">08</xsl:with-param>
      <xsl:with-param name="maandnaam"><xsl:value-of select="$Txt_Augustus"/></xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="KalenderMaand">
      <xsl:with-param name="maand">09</xsl:with-param>
      <xsl:with-param name="maandnaam"><xsl:value-of select="$Txt_September"/></xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="KalenderMaand">
      <xsl:with-param name="maand">10</xsl:with-param>
      <xsl:with-param name="maandnaam"><xsl:value-of select="$Txt_Oktober"/></xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="KalenderMaand">
      <xsl:with-param name="maand">11</xsl:with-param>
      <xsl:with-param name="maandnaam"><xsl:value-of select="$Txt_November"/></xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="KalenderMaand">
      <xsl:with-param name="maand">12</xsl:with-param>
      <xsl:with-param name="maandnaam"><xsl:value-of select="$Txt_December"/></xsl:with-param>
    </xsl:call-template>
  </table>

  <xsl:call-template name="ShowFooter"/>

</xsl:template>

<xsl:template name="KalenderMaand">
  <xsl:param name="maand"></xsl:param>
  <xsl:param name="maandnaam"></xsl:param>
  
  <xsl:if test="count(PERSOON[not(EVENTS/DEATH) and ($LijstWoord='0' or PERSONAL/NAME/@surn=$refAchternaam) and string-length(EVENTS/BIRTH/@date)=10 and substring(EVENTS/BIRTH/@date,4,2)=$maand and not(EVENTS/BIRTH/@onz)])!=0">
  <tr><td class="tbl-kalender-maand"><br /><xsl:value-of select="$maandnaam"/></td></tr>
  <tr>
  <td>
  <table width="100%" border="1" bordercolor="black" cellspacing="0" cellpadding="4" class="tbl-data">
    <tr>
    <th class="tbl-head" width="5%"><xsl:value-of select="$Txt_Dag"/></th>
    <th class="tbl-head"><xsl:value-of select="$Txt_Naam"/></th>
    <th class="tbl-head" align="right"><xsl:value-of select="$Txt_Geboortejaar"/></th>
    <th class="tbl-head" align="right"><xsl:value-of select="$Txt_Leeftijd"/></th>
    </tr>
    <xsl:for-each select="PERSOON[not(EVENTS/DEATH) and ($LijstWoord='0' or PERSONAL/NAME/@surn=$refAchternaam) and string-length(EVENTS/BIRTH/@date)=10 and substring(EVENTS/BIRTH/@date,4,2)=$maand and not(EVENTS/BIRTH/@onz)]">
      <xsl:sort select="concat(substring(EVENTS/BIRTH/@date,4,2),substring(EVENTS/BIRTH/@date,1,2),substring(EVENTS/BIRTH/@date,7,4))"/>
        <xsl:variable name="day">
          <xsl:if test="substring(EVENTS/BIRTH/@date,1,1)=0">
           	<xsl:value-of select="substring(EVENTS/BIRTH/@date,2,1)"/>
          </xsl:if>
          <xsl:if test="substring(EVENTS/BIRTH/@date,1,1)!=0">
          	<xsl:value-of select="substring(EVENTS/BIRTH/@date,1,2)"/>
          </xsl:if>
        </xsl:variable>
        <xsl:variable name="intmaand">
          <xsl:if test="substring(EVENTS/BIRTH/@date,4,1)=0">
           	<xsl:value-of select="substring(EVENTS/BIRTH/@date,5,1)"/>
          </xsl:if>
          <xsl:if test="substring(EVENTS/BIRTH/@date,4,1)!=0">
          	<xsl:value-of select="substring(EVENTS/BIRTH/@date,4,2)"/>
          </xsl:if>
        </xsl:variable>
        <tr>
        <xsl:if test="$intmaand = $parThisMonth and $day = $parThisDay">
            <xsl:call-template name="RegelWeergaveBold"/>
        </xsl:if>
        <xsl:if test="$intmaand != $parThisMonth or $day != $parThisDay">
            <xsl:call-template name="RegelWeergave"/>
        </xsl:if>
        </tr>
    </xsl:for-each>
  </table>
  </td>
  </tr>
  </xsl:if>
</xsl:template>


<xsl:template name="RegelWeergave">
        <td align="center">
          <xsl:value-of select="EVENTS/BIRTH/@onz"/>
          <xsl:if test="substring(EVENTS/BIRTH/@date,1,1)=0">
           	<xsl:value-of select="substring(EVENTS/BIRTH/@date,2,1)"/><xsl:value-of select="$nbsp"/>
          </xsl:if>
          <xsl:if test="substring(EVENTS/BIRTH/@date,1,1)!=0">
          	<xsl:value-of select="substring(EVENTS/BIRTH/@date,1,2)"/><xsl:value-of select="$nbsp"/>
          </xsl:if>
        </td>
        <td class="tbl-td-noWrap">
          <xsl:for-each select="PERSONAL">
            <xsl:call-template name="ShowPersoon">
              <xsl:with-param name="relatie"></xsl:with-param>
              <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
              <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
              <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
              <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
              <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
              <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
            </xsl:call-template>
          </xsl:for-each>
          </td>
        <td align="center">
          <xsl:value-of select="substring(EVENTS/BIRTH/@date,7,4)"/><xsl:value-of select="$nbsp"/>
        </td>
        <td class="tbl-td-noWrap" align="right">
          <xsl:if test="string-length(PERSONAL/@age) > 0">
            <xsl:value-of select="PERSONAL/@onz"/>
            <xsl:if test="$Browser = 'IE' and string-length(EVENTS/DEATH/@date) = 0">
              <xsl:for-each select="EVENTS">
                <xsl:value-of select="user:leeftijd(.,string($parTaal),string($Txt_jaar),string($Txt_jaren))"/>
              </xsl:for-each> <!-- EVENTS -->
            </xsl:if>
            <xsl:if test="$Browser != 'IE' or string-length(EVENTS/DEATH/@date) != 0">
              		<xsl:choose>
                	  <xsl:when test="PERSONAL/@of=1">
                  		<xsl:value-of select="PERSONAL/@age - 1"/>
                  		<xsl:value-of select="$nbsp"/><xsl:value-of select="$Txt_of"/><xsl:value-of select="$nbsp"/>
                  		<xsl:value-of select="PERSONAL/@age"/>
                	  </xsl:when>
                	  <xsl:otherwise>
                  		<xsl:value-of select="PERSONAL/@age"/>
                	  </xsl:otherwise>
              		</xsl:choose>
              		<xsl:text> </xsl:text>
              		<xsl:choose>
              		  <xsl:when test="PERSONAL/@age = 0 or PERSONAL/@age = 1">
              			<xsl:value-of select="$Txt_jaar"/>
              		  </xsl:when>
              		  <xsl:otherwise>
              			<xsl:value-of select="$Txt_jaren"/>
              		  </xsl:otherwise>
              		</xsl:choose>
              		<xsl:text> </xsl:text>
            </xsl:if>
          </xsl:if>
          <xsl:if test="string-length(PERSONAL/@age) = 0">
            <xsl:value-of select="$nbsp"/>
          </xsl:if>
        </td>
</xsl:template>
        
<xsl:template name="RegelWeergaveBold">
        <td align="center">
         <b>
          <xsl:value-of select="EVENTS/BIRTH/@onz"/>
          <xsl:if test="substring(EVENTS/BIRTH/@date,1,1)=0">
           	<xsl:value-of select="substring(EVENTS/BIRTH/@date,2,1)"/><xsl:value-of select="$nbsp"/>
          </xsl:if>
          <xsl:if test="substring(EVENTS/BIRTH/@date,1,1)!=0">
          	<xsl:value-of select="substring(EVENTS/BIRTH/@date,1,2)"/><xsl:value-of select="$nbsp"/>
          </xsl:if>
         </b>
        </td>
        <td class="tbl-td-noWrap">
         <b>
          <xsl:for-each select="PERSONAL">
            <xsl:call-template name="ShowPersoon">
              <xsl:with-param name="relatie"></xsl:with-param>
              <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
              <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
              <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
              <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
              <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
              <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
            </xsl:call-template>
          </xsl:for-each>
         </b>
          </td>
        <td align="center">
         <b>
          <xsl:value-of select="substring(EVENTS/BIRTH/@date,7,4)"/><xsl:value-of select="$nbsp"/>
         </b>
        </td>
        <td class="tbl-td-noWrap" align="right">
         <b>
          <xsl:if test="string-length(PERSONAL/@age) > 0">
            <xsl:value-of select="PERSONAL/@onz"/>
            <xsl:if test="$Browser = 'IE' and string-length(EVENTS/DEATH/@date) = 0">
              <xsl:for-each select="EVENTS">
                <xsl:value-of select="user:leeftijd(.,string($parTaal),string($Txt_jaar),string($Txt_jaren))"/>
              </xsl:for-each> <!-- EVENTS -->
            </xsl:if>
            <xsl:if test="$Browser != 'IE' or string-length(EVENTS/DEATH/@date) != 0">
              		<xsl:choose>
                	  <xsl:when test="PERSONAL/@of=1">
                  		<xsl:value-of select="PERSONAL/@age - 1"/>
                  		<xsl:value-of select="$nbsp"/><xsl:value-of select="$Txt_of"/><xsl:value-of select="$nbsp"/>
                  		<xsl:value-of select="PERSONAL/@age"/>
                	  </xsl:when>
                	  <xsl:otherwise>
                  		<xsl:value-of select="PERSONAL/@age"/>
                	  </xsl:otherwise>
              		</xsl:choose>
              		<xsl:text> </xsl:text>
              		<xsl:choose>
              		  <xsl:when test="PERSONAL/@age = 0 or PERSONAL/@age = 1">
              			<xsl:value-of select="$Txt_jaar"/>
              		  </xsl:when>
              		  <xsl:otherwise>
              			<xsl:value-of select="$Txt_jaren"/>
              		  </xsl:otherwise>
              		</xsl:choose>
              		<xsl:text> </xsl:text>
            </xsl:if>
          </xsl:if>
          </b>
          <xsl:if test="string-length(PERSONAL/@age) = 0">
            <xsl:value-of select="$nbsp"/>
          </xsl:if>
        </td>
</xsl:template>
        
</xsl:stylesheet>
