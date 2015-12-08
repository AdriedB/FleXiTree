<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
<!--
// <author>Adrie den Blanken</author>
// <file>$Workfile: DoopplaatsenIndex.xsl $</file><date>$Date: 15-01-15 19:56 $</date>
// <revision>$Revision: 15 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this
// header stays intact. No responsibility is accepted
// for use of this software.</disclaimer>
-->
<xsl:output method = "html"/>

<xsl:include href="Header.xsl"/>
<xsl:include href="Talen.xsl"/>

<xsl:param name="HuidigPersoon"/>
<xsl:param name="Browser"/>
<xsl:param name="LijstWoord"/>
<xsl:param name="Printing"/>
<xsl:param name="parToonVoornaam"/>
<xsl:param name="parToonVoettekst"/>
<xsl:param name="parNrKol"/>
<xsl:param name="parSortOrder"/>
<xsl:param name="parSortKey"/>
<xsl:param name="parRefOwner"/>
<xsl:param name="parRefOwnerEMail"/>
<xsl:param name="parToonKalender"/>
<xsl:param name="parStuurSorteersleutel"/>
<xsl:param name="parToonNieuws"/>
<xsl:param name="parTaal"/>
<xsl:param name="parToonOvzKaart"/>

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
     
     Eventueel met [PERSONAL/NAME/@surn=$refAchternaam] zodat alleen een lijst met
     deze achternaam aangemaakt wordt
*********************************************************************************** -->
<xsl:key name="items-index" match="//PERSONEN/PERSOON" use="EVENTS/BAPT/@place"/>

<!-- **********************************************************************************
Template :   Onderstaande template beeld een tabel af.
             Als er meerdere RECORDs met dezelfde item voorkomen, dan worden
             deze RECORDs samengevoegd en het aantal dezelfde RECORDs afgebeeld in
             de kolom aantal.
  <xsl:for-each select="PERSOON[generate-id() = generate-id(key('items-index',EVENTS/BAPT/@place)[1]) and PERSONAL/NAME/@surn='Blanken']">
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
  <xsl:for-each select="PERSOON[EVENTS/BAPT/@place != '' and generate-id() = generate-id(key('items-index',EVENTS/BAPT/@place)[1])]">
    <xsl:sort select="EVENTS/BAPT/@place" order="ascending" data-type="text"/>
    <xsl:sort select="EVENTS/BAPT/@date" order="ascending" data-type="text"/>
    <xsl:variable name="selectie" select="key('items-index',EVENTS/BAPT/@place)"/>
    <xsl:if test="$lb &lt; position() and position() &lt; $ub">
    <tr align="left">
      <td align="center">
        <xsl:value-of select="count($selectie)"/>
      </td>
      <td class="tbl-td-noWrap">
        <xsl:variable name="placeNoQuote">
          <xsl:call-template name="replace-substring">
            <xsl:with-param name="original"><xsl:value-of select="EVENTS/BAPT/@place"/></xsl:with-param>
            <xsl:with-param name="substring"><xsl:value-of select="$squote"/></xsl:with-param>
            <xsl:with-param name="replacement">\<xsl:value-of select="$squote"/></xsl:with-param>
          </xsl:call-template>
        </xsl:variable>
        <xsl:element name="a">
           <xsl:attribute name="href">javascript:KiesXSL(61,<xsl:value-of select="$HuidigPersoon"/>,'<xsl:value-of select="$placeNoQuote"/>','')</xsl:attribute>
           <xsl:value-of select="EVENTS/BAPT/@place"/>
        </xsl:element>
      </td>
      <xsl:if test="$parToonOvzKaart = 1">
      <td align="center">
      <xsl:variable name="plc">
      	<xsl:value-of select="EVENTS/BAPT/@place"/>
      </xsl:variable>
      <xsl:variable name="id_nr">
      	<xsl:for-each select="//PLAATSEN/PLAATS[@naam = $plc]">
      	  <xsl:value-of select="@id"/>
      	</xsl:for-each>
      </xsl:variable>
      <xsl:choose>
      <xsl:when test="$id_nr >= 0">
        <xsl:element name="a">
           <xsl:attribute name="href">javascript:plaatsinfo(<xsl:value-of select="$id_nr"/>,lat[<xsl:value-of select="$id_nr"/>],lng[<xsl:value-of select="$id_nr"/>],htmls[<xsl:value-of select="$id_nr"/>])</xsl:attribute>
           -->
        </xsl:element>
       </xsl:when>
       <xsl:otherwise><xsl:value-of select="$nbsp"/></xsl:otherwise>
       </xsl:choose>
      </td>
      </xsl:if>
    </tr>
    </xsl:if>
  </xsl:for-each>
</xsl:template>

<!-- **********************************************************************************
Template :   Het werkelijk begin.
*********************************************************************************** -->
<xsl:template match="PERSONEN">

  <xsl:call-template name="ShowMenu"/>

   	<xsl:variable name="cntr">
   	  <xsl:value-of select="count(PERSOON[generate-id() = generate-id(key('items-index',EVENTS/BAPT/@place)[1])])"/>
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
       	 
  <div align="center">
  
   	<xsl:call-template name="Txt_overzichtshoofdregels">
   	  <xsl:with-param name="orde">
   	    <xsl:value-of select="$parSortOrder"/>
   	  </xsl:with-param>
   	  <xsl:with-param name="aantal">
   	    <xsl:value-of select="$cntr"/>
   	  </xsl:with-param>
   	  <xsl:with-param name="overzichtstype_enkelvoud">
   	    <xsl:value-of select="$Txt_doopplaats"/>
   	  </xsl:with-param>
   	  <xsl:with-param name="overzichtstype_meervoud">
   	    <xsl:value-of select="$Txt_doopplaatsen"/>
   	  </xsl:with-param>
   	  <xsl:with-param name="overzichtstype_met">
   	  </xsl:with-param>
   	  <xsl:with-param name="sleutel">
        <xsl:choose>
          <xsl:when test="$parSortKey=8">
            <xsl:value-of select="$Txt_AantalTabel"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$Txt_Doopplaats"/>
          </xsl:otherwise>
        </xsl:choose>
   	  </xsl:with-param>
   	</xsl:call-template>
   	<xsl:if test="$cntr &gt; 0">
   	<xsl:if test="$parToonOvzKaart = 1">
	  <xsl:value-of select="$Txt_PlaatskaartenTitel"/><br /><br />
	</xsl:if>

	<table class="tbl-tussenkolom" border="0">
	  <tr>
		<td valign="top">
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
        </td>
		<xsl:if test="$parToonOvzKaart = 1">
		  <td width="3%"><xsl:value-of select="$nbsp"/></td>
		  <td valign="top"><div id="map" style="width: 580px; height: 580px"></div></td>
		</xsl:if>
      </tr>
    </table>
    </xsl:if>
  </div>
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
              <xsl:with-param name="sort">8</xsl:with-param>
              <xsl:with-param name="align">center</xsl:with-param>
           </xsl:call-template>
           <xsl:call-template name="addColumn">
              <xsl:with-param name="name"><xsl:value-of select="$Txt_Doopplaats"/></xsl:with-param>
              <xsl:with-param name="sort">7</xsl:with-param>
              <xsl:with-param name="nowrap">nowrap</xsl:with-param>
           </xsl:call-template>
           <xsl:if test="$parToonOvzKaart = 1">
             <th class="tbl-head" align="center">
                <xsl:value-of select="$Txt_Kaart"/>
             </th>
           </xsl:if>
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
