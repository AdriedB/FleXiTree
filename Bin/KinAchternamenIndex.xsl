<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:modulus="http://home.zonnet.nl/ablanken"
                version="1.0">
<!--
// <author>Paul Kallenberg</author>
// <file>$Workfile: KinAchternamenIndex.xsl $</file><date>$Date: 15-01-15 19:56 $</date>
// <revision>$Revision: 22 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this
// header stays intact. No responsibility is accepted
// for use of this software.</disclaimer>
-->
<xsl:output method = "html"/>

<xsl:include href="Header.xsl"/>
<xsl:include href="Talen.xsl"/>

<xsl:param name="Browser"/>
<xsl:param name="Printing"/>
<xsl:param name="HuidigPersoon"/>
<xsl:param name="parToonVoornaam"/>
<xsl:param name="parToonVoettekst"/>
<xsl:param name="parNrKol"/>
<xsl:param name="parSortKey"/>
<xsl:param name="parSortOrder"/>
<xsl:param name="parRefOwner"/>
<xsl:param name="parRefOwnerEMail"/>
<xsl:param name="parToonKalender"/>
<xsl:param name="parStuurSorteersleutel"/>
<xsl:param name="parToonNieuws"/>
<xsl:param name="parTaal"/>

<!-- **********************************************************************************
Stylesheet : Met behulp van dit stylesheet worden alle record van 1 en dezelfde
             item mbv 1 regel in het datavenster afgebeeld.
             In dit voorbeeld unieke stratenm dus vervang WSTRAAT door de gewenste
             kolomnaam om iets anders uniek af te beelden.
Notities :
             Het html bestand waarin deze gegenereerde html wordt ingeplakt is Default.htm
*********************************************************************************** -->
<!-- **********************************************************************************
     generate-id(node) geeft (genereert indien nodig) een unieke ID voor 'node';
     key(index,object) geeft de nodes in 'index' waarvoor de key 'object' is
*********************************************************************************** -->
<xsl:key name="items-index" match="//PERSONEN/PERSOON" use="PERSONAL/NAME/@surn"/>

<!-- **********************************************************************************
Template :   Onderstaande template beeld een tabel af.
             Als er meerdere RECORDs met dezelfde item voorkomen, dan worden
             deze RECORDs samengevoegd en het aantal dezelfde RECORDs afgebeeld in
             de kolom aantal.
Parameters : Geen
*********************************************************************************** -->
<xsl:template name="items-lijst">
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
  <xsl:for-each select="PERSOON[generate-id() = generate-id(key('items-index',PERSONAL/NAME/@surn)[1])]">
    <xsl:sort select="PERSONAL/NAME/@surn"  order="ascending" data-type="text"/>
    <xsl:sort select="PERSONAL/NAME/@first" order="ascending" data-type="text"/>
    <xsl:variable name="selectie" select="key('items-index',PERSONAL/NAME/@surn)"/>
    <xsl:if test="$lb &lt; position() and position() &lt; $ub">
    <tr align="left">
      <td align="center">
        <xsl:value-of select="count($selectie)"/>
      </td>
      <td>
        <xsl:variable name="surnNoQuote">
          <xsl:call-template name="replace-substring">
            <xsl:with-param name="original"><xsl:value-of select="PERSONAL/NAME/@surn"/></xsl:with-param>
            <xsl:with-param name="substring"><xsl:value-of select="$squote"/></xsl:with-param>
            <xsl:with-param name="replacement">\<xsl:value-of select="$squote"/></xsl:with-param>
          </xsl:call-template>
        </xsl:variable>

        <xsl:element name="a">
       	  <xsl:attribute name="href">javascript:KiesXSL(91,<xsl:value-of select="$HuidigPersoon"/>,'<xsl:value-of select="$surnNoQuote"/>','')</xsl:attribute>
          <xsl:attribute name="onMouseOver">
            <xsl:text>window.status='</xsl:text><xsl:value-of select="$Txt_Kies"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_achternaam"/><xsl:text> </xsl:text>
            <xsl:value-of select="$surnNoQuote"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_voordebepaling"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_verwantschap"/>'<xsl:text> ; return true;</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="onMouseOut"><xsl:text>window.status='';</xsl:text></xsl:attribute>
          <xsl:value-of select="PERSONAL/NAME/@surn"/>
    	</xsl:element>
      </td>
    </tr>
    </xsl:if>
  </xsl:for-each>
</xsl:template>

<!-- **********************************************************************************
Template :   Het werkelijk begin.
*********************************************************************************** -->
<xsl:template match="PERSONEN">

<xsl:call-template name="ShowMenu"/>

<xsl:if test="$Browser != 'IE'">
  <blockquote><b>
    <xsl:value-of select="$Txt_geenbrowserondersteuning"/>
  </b></blockquote>
</xsl:if>

<xsl:if test="$Browser = 'IE'">
   	<xsl:variable name="cntr">
   	  <xsl:value-of select="count(PERSOON[generate-id() = generate-id(key('items-index',PERSONAL/NAME/@surn)[1])])"/>
   	</xsl:variable>
    <xsl:variable name="varNrKol">
      <xsl:choose>
        <xsl:when test="$parNrKol = '1'">1</xsl:when>
        <xsl:otherwise>
          <xsl:choose>
            <xsl:when test="$cntr &gt; 2*$MinPerKolom">3</xsl:when>
            <xsl:when test="$cntr &lt; 2*$MinPerKolom + 1 and $cntr &gt; $MinPerKolom">2</xsl:when>
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
	<div align="center">
	   <h4><xsl:value-of select="$Txt_Kies"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_de_m"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_achternaam"/>
	   <xsl:text> </xsl:text><xsl:value-of select="$Txt_van_de_tweede"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_persoon"/><br/></h4>
       <xsl:call-template name="Txt_sorteervolgorde">
         <xsl:with-param name="orde"><xsl:value-of select="$parSortOrder"/></xsl:with-param>
       </xsl:call-template>
       <xsl:choose>
         <xsl:when test="$parSortKey=19">
           <xsl:value-of select="$Txt_Achternaam"/>
         </xsl:when>
         <xsl:otherwise>
           <xsl:value-of select="$Txt_AantalTabel"/>
         </xsl:otherwise>
       </xsl:choose>
       <br />
       <xsl:if test="$varStuurSorteersleutel=1">
         <xsl:value-of select="$Txt_Verandersorteer"/><br />
       </xsl:if>
       <br />

   	  <table border="0" bordercolor="black" cellspacing="0" cellpadding="0" class="tbl-data">
    	<tr>
          <xsl:call-template name="KolomWeergave">
	        <xsl:with-param name="kolom"><xsl:value-of select="1"/></xsl:with-param>
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
              <xsl:with-param name="name"><xsl:value-of select="$Txt_AantalTabel"/></xsl:with-param>
              <xsl:with-param name="sort">20</xsl:with-param>
              <xsl:with-param name="align">center</xsl:with-param>
           </xsl:call-template>
           <xsl:call-template name="addColumn">
              <xsl:with-param name="name"><xsl:value-of select="$Txt_Achternaam"/></xsl:with-param>
              <xsl:with-param name="sort">19</xsl:with-param>
           </xsl:call-template>
          </tr>
      	  <xsl:call-template name="items-lijst">
              <xsl:with-param name="cntr"><xsl:value-of select="$cntr"/></xsl:with-param>
              <xsl:with-param name="nrkol"><xsl:value-of select="$nrkol"/></xsl:with-param>
              <xsl:with-param name="perkolom"><xsl:value-of select="$perkolom"/></xsl:with-param>
              <xsl:with-param name="rest"><xsl:value-of select="$rest"/></xsl:with-param>
              <xsl:with-param name="kolom"><xsl:value-of select="$kolom"/></xsl:with-param>
          </xsl:call-template>
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
