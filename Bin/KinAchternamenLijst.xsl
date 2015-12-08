<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">
<!--
// <author>Paul Kallenberg</author>
// <file>$Workfile: KinAchternamenLijst.xsl $</file><date>$Date: 21-10-13 11:14 $</date>
// <revision>$Revision: 22 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this
// header stays intact. No responsibility is accepted
// for use of this software.</disclaimer>
-->
<xsl:output method="xml"/>               <!-- ivm met umlaut etc -->

<xsl:include href="Header.xsl"/>
<xsl:include href="Talen.xsl"/>

<xsl:param name="HuidigPersoon"/>
<xsl:param name="Browser"/>
<xsl:param name="LijstWoord"/>
<xsl:param name="Printing"/>
<xsl:param name="parToonVoornaam"/>
<xsl:param name="parToonVoettekst"/>
<xsl:param name="parSortKey"/>
<xsl:param name="parSortOrder"/>
<xsl:param name="parNrKol"/>
<xsl:param name="parToonNaam"/>
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

<xsl:if test="$Browser = 'IE'">

  <h4 align="center"><xsl:value-of select="$Txt_Verwantschap"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text>
  <xsl:for-each select="PERSOON[@link=$HuidigPersoon]">
    <xsl:for-each select="PERSONAL">
	<xsl:call-template name="ShowPersoon">
          <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
          <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
          <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
          <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
          <xsl:with-param name="src"><xsl:value-of select="$HuidigPersoon"/></xsl:with-param>
          <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
        </xsl:call-template>
    </xsl:for-each>
  </xsl:for-each>
	
	<xsl:text> </xsl:text><xsl:value-of select="$Txt_met"/><xsl:text> </xsl:text> ...</h4>
  <h4 align="center"><xsl:value-of select="$Txt_Kies"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_tweede"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_persoon"/>
   (<xsl:value-of select="$Txt_achternaam"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_is"/><xsl:text> </xsl:text><xsl:value-of select="$LijstWoord"/>)</h4>

   	<xsl:variable name="cntr">
   	  <xsl:value-of select="count(PERSOON[PERSONAL/NAME/@surn=$LijstWoord])"/>
   	</xsl:variable>
    <xsl:variable name="varNrKol">
      <xsl:choose>
        <xsl:when test="$parNrKol = '1'">1</xsl:when>
        <xsl:otherwise>
          <xsl:choose>
            <xsl:when test="$cntr &gt; $MinPerKolom">2</xsl:when>
            <xsl:otherwise>1</xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
   	<xsl:variable name="perkolom">
   	  <xsl:value-of select="floor($cntr div $varNrKol)"/>
   	</xsl:variable>
   	<xsl:variable name="rest">
   	  <xsl:value-of select="$cntr mod $varNrKol"/>
   	</xsl:variable>
       	 
  <div align="center">
    <xsl:if test="$cntr &gt; 1">
      <xsl:call-template name="Txt_sorteervolgorde">
        <xsl:with-param name="orde"><xsl:value-of select="$parSortOrder"/></xsl:with-param>
      </xsl:call-template>
      <xsl:choose>
        <xsl:when test="$parSortKey=1">
          <xsl:value-of select="$Txt_naam"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$Txt_Geboortedoopdatum"/>
        </xsl:otherwise>
      </xsl:choose>
      <br />
      <xsl:if test="$varStuurSorteersleutel=1">
        <xsl:value-of select="$Txt_Verandersorteer"/><br />
      </xsl:if>
    </xsl:if>
  <br />

  <table border="0" bordercolor="black" cellspacing="0" cellpadding="0" class="tbl-data">
    <tr>
      <xsl:call-template name="KolomWeergave">
	<xsl:with-param name="kolom">1</xsl:with-param>
        <xsl:with-param name="cntr"><xsl:value-of select="$cntr"/></xsl:with-param>
        <xsl:with-param name="nrkol"><xsl:value-of select="$varNrKol"/></xsl:with-param>
        <xsl:with-param name="perkolom"><xsl:value-of select="$perkolom"/></xsl:with-param>
        <xsl:with-param name="rest"><xsl:value-of select="$rest"/></xsl:with-param>
      </xsl:call-template>
    </tr>
  </table>
  </div>
</xsl:if>

  <xsl:call-template name="ShowFooter"/>

</xsl:template>

<xsl:template name="KinAchternamenlijstWeergave">
    <xsl:param name="kolom"/>
   	<xsl:param name="cntr"/>
   	<xsl:param name="nrkol"/>
   	<xsl:param name="perkolom"/>
   	<xsl:param name="rest"/>
   	
    <xsl:variable name="lb">
      <xsl:if test="$kolom - 1 &lt; $rest+1">
        <xsl:value-of select="($kolom - 1)*($perkolom + 1)+ 1 div ($cntr+1)"/>
      </xsl:if>
      <xsl:if test="$kolom - 1 &gt; $rest">
        <xsl:value-of select="$rest*($perkolom + 1)+(($kolom) - ($rest + 1))*$perkolom + 1 div ($cntr+1)"/>
      </xsl:if>
    </xsl:variable>
    <xsl:variable name="ub">
      <xsl:if test="$kolom &lt; $rest + 1">
        <xsl:value-of select="$kolom*($perkolom + 1)+1"/>
      </xsl:if>
      <xsl:if test="$kolom &gt; $rest">
        <xsl:value-of select="$rest*($perkolom + 1)+(($kolom)-($rest))*$perkolom+1"/>
      </xsl:if>
    </xsl:variable>
    <xsl:if test="$lb &lt; position() and position() &lt; $ub">
        <tr align="left">
          <td>
            <xsl:for-each select="PERSONAL">
              <xsl:call-template name="KinShowLijstPersoon">
                <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
                <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
                <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
                <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
                <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
                <xsl:with-param name="naamweergave"><xsl:value-of select="$parToonNaam"/></xsl:with-param>
              </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="EVENTS/DEATH">
              <xsl:text>&#8224;</xsl:text>
            </xsl:for-each>
          </td>
          <td align="right">
            <xsl:value-of select="EVENTS/BIRTH/@onz"/><xsl:value-of select="EVENTS/BIRTH/@date"/><xsl:text>&#160;</xsl:text>
          </td>
        </tr>
    </xsl:if>
</xsl:template>

<xsl:template name="KinShowLijstPersoon">
  <xsl:param name="NAMEFIRST"></xsl:param>
  <xsl:param name="NAMENICK"></xsl:param>
  <xsl:param name="NAMEPREF"></xsl:param>
  <xsl:param name="SURN"></xsl:param>
  <xsl:param name="src"></xsl:param>
  <xsl:param name="naamweergave"></xsl:param>

  <xsl:choose>
   <xsl:when test="$naamweergave='1'">
    <xsl:variable name="hyperName">
     <xsl:if test="$parToonVoornaam=1">
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
     </xsl:if>
     <xsl:if test="$parToonVoornaam=2">
      <xsl:choose>
        <xsl:when test="string-length($NAMEFIRST) = 0">
            <!-- pak de roepnaam -->
              <xsl:value-of select="$NAMENICK"/>
        </xsl:when>
        <xsl:otherwise>
           <xsl:value-of select="$NAMEFIRST"/>
        </xsl:otherwise>
      </xsl:choose>
     </xsl:if>
      <xsl:if test="string-length($NAMEPREF) != 0">
        <xsl:text> </xsl:text><xsl:value-of select="$NAMEPREF"/>
      </xsl:if>
      <xsl:text> </xsl:text>
      <xsl:value-of select="$SURN"/>
    </xsl:variable>
<!--
    Nu nog de ' verwijderen uit $hyperName om geen problemen te krijgen
-->
    <xsl:variable name="hyperNameNoQuote">
      <xsl:call-template name="replace-substring">
        <xsl:with-param name="original"><xsl:value-of select="$hyperName"/></xsl:with-param>
        <xsl:with-param name="substring"><xsl:value-of select="$squote"/></xsl:with-param>
        <xsl:with-param name="replacement">\<xsl:value-of select="$squote"/></xsl:with-param>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="srcNoQuote">
      <xsl:call-template name="replace-substring">
        <xsl:with-param name="original"><xsl:value-of select="$src"/></xsl:with-param>
        <xsl:with-param name="substring"><xsl:value-of select="$squote"/></xsl:with-param>
        <xsl:with-param name="replacement">\<xsl:value-of select="$squote"/></xsl:with-param>
      </xsl:call-template>
    </xsl:variable>

    <xsl:element name="a">
      <xsl:attribute name="href">javascript:KiesXSL(92,<xsl:value-of select="$HuidigPersoon"/>,'<xsl:value-of select="$srcNoQuote"/>','')</xsl:attribute>
      <xsl:attribute name="onMouseOver"><xsl:text>window.status='</xsl:text><xsl:value-of select="$Txt_Bekijk_Verwantschap"/><xsl:value-of select="$hyperNameNoQuote"/><xsl:text>'; return true;</xsl:text></xsl:attribute>
      <xsl:attribute name="onMouseOut"><xsl:text>window.status='';</xsl:text></xsl:attribute>
      <xsl:value-of select="$hyperName"/>
    </xsl:element>
  </xsl:when>
  
   <xsl:otherwise>
    <xsl:variable name="hyperName">
      <xsl:value-of select="$SURN"/>
      <xsl:if test="string-length($SURN) !=0 and (string-length($NAMEPREF) != 0 or string-length($NAMENICK) != 0 or string-length($NAMEFIRST) != 0)">
        <xsl:text>, </xsl:text>
      </xsl:if>
     <xsl:if test="$parToonVoornaam=1">
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
     </xsl:if>
     <xsl:if test="$parToonVoornaam=2">
      <xsl:choose>
        <xsl:when test="string-length($NAMEFIRST) = 0">
            <!-- pak de roepnaam -->
              <xsl:value-of select="$NAMENICK"/>
        </xsl:when>
        <xsl:otherwise>
           <xsl:value-of select="$NAMEFIRST"/>
        </xsl:otherwise>
      </xsl:choose>
     </xsl:if>
      <xsl:if test="string-length($NAMEPREF) != 0">
        <xsl:text> </xsl:text><xsl:value-of select="$NAMEPREF"/>
      </xsl:if>
      <xsl:text> </xsl:text>
    </xsl:variable>
<!--
    Nu nog de ' verwijderen uit $hyperName om geen problemen te krijgen
-->
    <xsl:variable name="hyperNameNoQuote">
      <xsl:call-template name="replace-substring">
        <xsl:with-param name="original"><xsl:value-of select="$hyperName"/></xsl:with-param>
        <xsl:with-param name="substring"><xsl:value-of select="$squote"/></xsl:with-param>
        <xsl:with-param name="replacement">\<xsl:value-of select="$squote"/></xsl:with-param>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="srcNoQuote">
      <xsl:call-template name="replace-substring">
        <xsl:with-param name="original"><xsl:value-of select="$src"/></xsl:with-param>
        <xsl:with-param name="substring"><xsl:value-of select="$squote"/></xsl:with-param>
        <xsl:with-param name="replacement">\<xsl:value-of select="$squote"/></xsl:with-param>
      </xsl:call-template>
    </xsl:variable>

    <xsl:element name="a">
      <xsl:attribute name="href">javascript:KiesXSL(92,<xsl:value-of select="$HuidigPersoon"/>,'<xsl:value-of select="$srcNoQuote"/>','')</xsl:attribute>
      <xsl:attribute name="onMouseOver"><xsl:text>window.status='</xsl:text><xsl:value-of select="$Txt_Bekijk_Verwantschap"/><xsl:value-of select="$hyperNameNoQuote"/><xsl:text>'; return true;</xsl:text></xsl:attribute>
      <xsl:attribute name="onMouseOut"><xsl:text>window.status='';</xsl:text></xsl:attribute>
      <xsl:value-of select="$hyperName"/>
    </xsl:element>
  </xsl:otherwise>
 </xsl:choose>
</xsl:template>

<xsl:template name="KolomWeergave">
	<xsl:param name="kolom"/>
   	<xsl:param name="cntr"/>
   	<xsl:param name="nrkol"/>
   	<xsl:param name="perkolom"/>
   	<xsl:param name="rest"/>

    <xsl:if test="$cntr &gt; ($kolom - 1)">
    <xsl:element name="td">
      <xsl:attribute name="valign">top</xsl:attribute>
      <xsl:attribute name="width">
        <xsl:if test="$cntr &gt; $nrkol - 1">
          <xsl:value-of select="(100 - $tussenkol*($nrkol - 1)) div $nrkol "/>%
        </xsl:if>
      </xsl:attribute>
    <table border="1" bordercolor="black" cellspacing="0" cellpadding="4" class="tbl-data" width="100%">
       <tr>
         <xsl:call-template name="addColumn">
            <xsl:with-param name="name"><xsl:value-of select="$Txt_Naam"/></xsl:with-param>
            <xsl:with-param name="sort">1</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="addColumn">
            <xsl:with-param name="name"><xsl:value-of select="$Txt_Geboortedoopdatum"/></xsl:with-param>
            <xsl:with-param name="sort">2</xsl:with-param>
            <xsl:with-param name="align">right</xsl:with-param>
         </xsl:call-template>
        </tr>
        <xsl:for-each select="PERSOON[PERSONAL/NAME/@surn=$LijstWoord]">
          <xsl:sort select="PERSONAL/NAME/@surn" order="ascending"/>
          <xsl:sort select="PERSONAL/NAME/@pref" order="ascending"/>
          <xsl:sort select="concat(PERSONAL/NAME/@nick,PERSONAL/NAME/@first)" order="ascending"/>
     	  <xsl:sort select="concat(substring(EVENTS/BIRTH/@date,string-length(EVENTS/BIRTH/@date)-3,4),substring(EVENTS/BIRTH/@date,4,2),substring(EVENTS/BIRTH/@date,1,2),substring(EVENTS/BAPT/@date,string-length(EVENTS/BAPT/@date)-3,4),substring(EVENTS/BAPT/@date,4,2),substring(EVENTS/BAPT/@date,1,2))" order="ascending"/>
          <xsl:call-template name="KinAchternamenlijstWeergave">
            <xsl:with-param name="cntr"><xsl:value-of select="$cntr"/></xsl:with-param>
            <xsl:with-param name="nrkol"><xsl:value-of select="$nrkol"/></xsl:with-param>
            <xsl:with-param name="perkolom"><xsl:value-of select="$perkolom"/></xsl:with-param>
            <xsl:with-param name="rest"><xsl:value-of select="$rest"/></xsl:with-param>
            <xsl:with-param name="kolom"><xsl:value-of select="$kolom"/></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
        <xsl:if test="$kolom &gt; $rest and $rest &gt; 0">
          <tr>
            <td><xsl:value-of select="$nbsp"/></td>
            <td><xsl:value-of select="$nbsp"/></td>
          </tr>
        </xsl:if>
    </table>
    </xsl:element>
    </xsl:if>
    <xsl:if test="$kolom &lt; $nrkol">
      <td width="$tussenkol" class="tbl-tussenkolom"><xsl:value-of select="$nbsp"/></td>
	  <xsl:call-template name="KolomWeergave">
	      <xsl:with-param name="kolom"><xsl:value-of select="$kolom + 1"/></xsl:with-param>
          <xsl:with-param name="cntr"><xsl:value-of select="$cntr"/></xsl:with-param>
          <xsl:with-param name="nrkol"><xsl:value-of select="$nrkol"/></xsl:with-param>
          <xsl:with-param name="perkolom"><xsl:value-of select="$perkolom"/></xsl:with-param>
          <xsl:with-param name="rest"><xsl:value-of select="$rest"/></xsl:with-param>
	  </xsl:call-template>
    </xsl:if>
</xsl:template>

</xsl:stylesheet>
