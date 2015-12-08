<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">
<!--
// <author>Adrie den Blanken</author>
// <file>$Workfile: ZoekPersoon.xsl $</file><date>$Date: 15-01-15 19:56 $</date>
// <revision>$Revision: 23 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this
// header stays intact. No responsibility is accepted
// for use of this software.</disclaimer>
-->
<xsl:output method="html"/>

<xsl:include href="Header.xsl"/>
<xsl:include href="Talen.xsl"/>
<xsl:key name="items-index" match="//PERSONEN/PERSOON" use="substring(PERSONAL/NAME/@surn,1,1)"/>
  
<xsl:template name="achternamenletters">

  <xsl:for-each select="PERSOON[generate-id() = generate-id(key('items-index',substring(PERSONAL/NAME/@surn,1,1))[1])]">
    <xsl:sort select="PERSONAL/NAME/@surn" order="ascending" data-type="text"/>
    <xsl:sort select="PERSONAL/NAME/@first" order="ascending" data-type="text"/>
        <xsl:variable name="surnNoQuote">
          <xsl:call-template name="replace-substring">
            <xsl:with-param name="original"><xsl:value-of select="substring(PERSONAL/NAME/@surn,1,1)"/></xsl:with-param>
            <xsl:with-param name="substring"><xsl:value-of select="$squote"/></xsl:with-param>
            <xsl:with-param name="replacement">\<xsl:value-of select="$squote"/></xsl:with-param>
          </xsl:call-template>
        </xsl:variable>
        <xsl:element name="a">
           <xsl:attribute name="href">javascript:KiesXSL(30,<xsl:value-of select="$HuidigPersoon"/>,'<xsl:value-of select="$surnNoQuote"/>','')</xsl:attribute>
           <xsl:value-of select="substring(PERSONAL/NAME/@surn,1,1)"/>
        </xsl:element>
        <xsl:text> </xsl:text>
  </xsl:for-each>
</xsl:template>


<xsl:param name="Browser"/>
<xsl:param name="HuidigPersoon"/>
<xsl:param name="Printing"/>
<xsl:param name="parToonVoornaam"/>
<xsl:param name="parToonVoettekst"/>
<xsl:param name="parToonNaam"/>
<xsl:param name="Roepnaam"/>
<xsl:param name="Voornamen"/>
<xsl:param name="Tussenvoegsel"/>
<xsl:param name="Achternaam"/>
<xsl:param name="Familie"/>
<xsl:param name="Geboortejaar"/>
<xsl:param name="EnOF">OF</xsl:param>
<xsl:param name="Exact">Ja</xsl:param>
<xsl:param name="parSortKey"/>
<xsl:param name="parSortOrder"/>
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
  
  <blockquote>
    <h2>
      <xsl:value-of select="$Txt_ZoekPersoon"/><xsl:text> ...</xsl:text>
    </h2>
    <xsl:value-of select="$Txt_via2"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_de_v"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_eersteletter"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_vande_m"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_achternaam"/>
    <xsl:text>: </xsl:text>
    <xsl:call-template name="achternamenletters"/>
    <br /><br />
    <xsl:value-of select="$Txt_of"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_via2"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_zoekteksten"/>
    <xsl:text>: </xsl:text>
    <h4><i>
      <xsl:value-of select="$Txt_Geenonderscheidletters"/>
    </i></h4>
    
    <form name="form1">
      <table class="tbl-tekst">
        <tr>
          <td><xsl:value-of select="$Txt_Roepnaam"/><xsl:text>      :</xsl:text></td>
          <td><input name="roepnaam" size="8" value="{$Roepnaam}" maxlength="20"/></td>
          <td width="10">
          </td>
          <td>
            <xsl:element name="input">
              <xsl:attribute name="name">enof</xsl:attribute>
              <xsl:attribute name="type">radio</xsl:attribute>
              <xsl:if test="$EnOF = 'OF'">
                <xsl:attribute name="checked"/>
              </xsl:if>  
            </xsl:element>
            <xsl:value-of select="$Txt_Met1gegeven"/>
          </td>
        </tr>
        <tr>
          <td><xsl:value-of select="$Txt_Voornamen"/><xsl:text>      :</xsl:text></td>
          <td><input name="voornaam" size="40" value="{$Voornamen}" maxlength="40"/></td>
          <td width="10">
          </td>
          <td>
            <xsl:element name="input">
              <xsl:attribute name="name">enof</xsl:attribute>
              <xsl:attribute name="type">radio</xsl:attribute>
              <xsl:if test="$EnOF = 'EN'">
                <xsl:attribute name="checked"/>
              </xsl:if>
            </xsl:element>
            <xsl:value-of select="$Txt_Metallegegevens"/>
           </td>
        </tr>
        <tr>
          <td><xsl:value-of select="$Txt_Tussenvoegsel"/><xsl:text> : </xsl:text></td>
          <td><input name="tussenvoegsel" size="8" value="{$Tussenvoegsel}" maxlength="20"/></td>
        </tr>
        <tr>
          <td><xsl:value-of select="$Txt_Achternaam"/><xsl:text>    :</xsl:text></td>
          <td><input name="achternaam" size="40" value="{$Achternaam}" maxlength="40"/></td>
          <td width="10">
          </td>
          <td>
            <xsl:element name="input">
              <xsl:attribute name="name">exact</xsl:attribute>
              <xsl:attribute name="type">radio</xsl:attribute>
              <xsl:if test="$Exact = 'Ja'">
                <xsl:attribute name="checked"/>
              </xsl:if>  
            </xsl:element>
            <xsl:value-of select="$Txt_Uitvoergelijkzoekteksten"/>
          </td>
        </tr>
        <tr>
          <td><xsl:value-of select="$Txt_Familie"/><xsl:text>    : </xsl:text></td>
          <td><input name="familie" size="40" value="{$Familie}" maxlength="40"/></td>
          <td width="10">
          </td>
          <td>
            <xsl:element name="input">
              <xsl:attribute name="name">exact</xsl:attribute>
              <xsl:attribute name="type">radio</xsl:attribute>
              <xsl:if test="$Exact = 'Nee'">
                <xsl:attribute name="checked"/>
              </xsl:if>
            </xsl:element>
            <xsl:value-of select="$Txt_Uitvoerbevatzoekteksten"/>
          </td>
        </tr>
        <tr>
          <td><xsl:value-of select="$Txt_Geboortejaar"/><xsl:text>    : </xsl:text></td>
          <td><input name="geboortejaar" size="4" value="{$Geboortejaar}" maxlength="4"/></td>
        </tr>
        <tr>
          <td/>
          <td/>
          <td>
            <button type="button" onclick="Zoeken()"><xsl:value-of select="$Txt_Zoek"/></button>
          </td>
        </tr>
      </table>
    </form>
  </blockquote>
  
  <xsl:variable name="uppercase">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
  <xsl:variable name="lowercase">abcdefghijklmnopqrstuvwxyz</xsl:variable>


  <xsl:variable name="AllesSamen" select="concat($Voornamen,$Roepnaam,$Tussenvoegsel,$Achternaam,$Familie,$Geboortejaar)"/>
  <!-- even kijken of er wel wat ingevuld is -->
  <xsl:if test="string-length($AllesSamen) != 0">
    
    <xsl:variable name="query" select="PERSOON/PERSONAL/NAME[
      ($EnOF = 'EN' and $Exact = 'Nee' and (
        ($Voornamen = '' or contains(translate(@first, $lowercase, $uppercase),translate($Voornamen,$lowercase, $uppercase))) and
        ($Roepnaam = '' or contains(translate(@nick, $lowercase, $uppercase),translate($Roepnaam,$lowercase, $uppercase))) and
        ($Achternaam = '' or contains(translate(@surn, $lowercase, $uppercase),translate($Achternaam,$lowercase, $uppercase))) and
        ($Familie = '' or (contains(translate(@sort, $lowercase, $uppercase),translate($Familie,$lowercase, $uppercase)) or contains(translate(@surn, $lowercase, $uppercase),translate($Familie,$lowercase, $uppercase)))) and
        ($Tussenvoegsel = '' or contains(translate(@pref, $lowercase, $uppercase),translate($Tussenvoegsel,$lowercase, $uppercase))) and
        ($Geboortejaar = '' or contains(substring(../../EVENTS/BIRTH/@date,string-length(../../EVENTS/BIRTH/@date)-3,4),$Geboortejaar))))
      or
        ($EnOF = 'OF' and $Exact = 'Nee' and (
        ($Voornamen != '' and contains(translate(@first, $lowercase, $uppercase),translate($Voornamen,$lowercase, $uppercase))) or
        ($Roepnaam != '' and contains(translate(@nick, $lowercase, $uppercase),translate($Roepnaam,$lowercase, $uppercase))) or
        ($Achternaam != '' and contains(translate(@surn, $lowercase, $uppercase),translate($Achternaam,$lowercase, $uppercase))) or
        ($Familie != '' and (contains(translate(@sort, $lowercase, $uppercase),translate($Familie,$lowercase, $uppercase)) or contains(translate(@surn, $lowercase, $uppercase),translate($Familie,$lowercase, $uppercase)))) or
        ($Tussenvoegsel != '' and contains(translate(@pref, $lowercase, $uppercase),translate($Tussenvoegsel,$lowercase, $uppercase))) or
        ($Geboortejaar != '' and contains(substring(../../EVENTS/BIRTH/@date,string-length(../../EVENTS/BIRTH/@date)-3,4),$Geboortejaar))))
      or
        ($EnOF = 'EN' and $Exact = 'Ja' and (
          ($Voornamen = '' or translate(@first, $lowercase, $uppercase)=translate($Voornamen,$lowercase, $uppercase)) and
          ($Roepnaam = '' or translate(@nick, $lowercase, $uppercase)=translate($Roepnaam,$lowercase, $uppercase)) and
          ($Achternaam = '' or translate(@surn, $lowercase, $uppercase)=translate($Achternaam,$lowercase, $uppercase)) and
          ($Familie = '' or (translate(@sort, $lowercase, $uppercase)=translate($Familie,$lowercase, $uppercase) or translate(@surn, $lowercase, $uppercase)=translate($Familie,$lowercase, $uppercase))) and
          ($Tussenvoegsel = '' or translate(@pref, $lowercase, $uppercase)=translate($Tussenvoegsel,$lowercase, $uppercase)) and
          ($Geboortejaar = '' or string(substring(../../EVENTS/BIRTH/@date,string-length(../../EVENTS/BIRTH/@date)-3,4))=string($Geboortejaar))))
      or
        ($EnOF = 'OF' and $Exact = 'Ja' and (
          ($Voornamen != '' and translate(@first, $lowercase, $uppercase)=translate($Voornamen,$lowercase, $uppercase)) or
          ($Roepnaam != '' and translate(@nick, $lowercase, $uppercase)=translate($Roepnaam,$lowercase, $uppercase)) or
          ($Achternaam != '' and translate(@surn, $lowercase, $uppercase)=translate($Achternaam,$lowercase, $uppercase)) or
          ($Familie != '' and (translate(@sort, $lowercase, $uppercase)=translate($Familie,$lowercase, $uppercase) or translate(@surn, $lowercase, $uppercase)=translate($Familie,$lowercase, $uppercase))) or
          ($Tussenvoegsel != '' and translate(@pref, $lowercase, $uppercase)=translate($Tussenvoegsel,$lowercase, $uppercase)) or
          ($Geboortejaar != '' and string(substring(../../EVENTS/BIRTH/@date,string-length(../../EVENTS/BIRTH/@date)-3,4))=string($Geboortejaar))))
      ]"/>
  
    <xsl:choose>
      <xsl:when test="not($query)">
        <blockquote>
          <h3>
            <xsl:value-of select="$Txt_Geenpersonenselectie"/>
          </h3>
        </blockquote>
      </xsl:when>
      <xsl:otherwise>
        <div align="center">
        <xsl:call-template name="Txt_sorteervolgorde">
          <xsl:with-param name="orde"><xsl:value-of select="$parSortOrder"/></xsl:with-param>
        </xsl:call-template>
          <xsl:choose>
            <xsl:when test="$parSortKey=38">
              <xsl:value-of select="$Txt_Naam"/>
            </xsl:when>
            <xsl:when test="$parSortKey=36">
              <xsl:value-of select="$Txt_Geboortedoopdatum"/>
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
           <table border="1" bordercolor="black" cellspacing="0" cellpadding="4" class="tbl-data">
            <xsl:for-each select="$query">
            <xsl:sort order="ascending" select="concat(substring(../../EVENTS/BIRTH/@date,string-length(../../EVENTS/BIRTH/@date)-3,4),substring(../../EVENTS/BIRTH/@date,4,2),substring(../../EVENTS/BIRTH/@date,1,2))"/>
            <xsl:sort order="ascending" select="@surn"/>

              <xsl:if test="position() = 1">
               <tr>
                 <xsl:call-template name="addColumn">
                    <xsl:with-param name="name"><xsl:value-of select="$Txt_Naam"/></xsl:with-param>
                    <xsl:with-param name="sort">38</xsl:with-param>
                    <xsl:with-param name="align">left</xsl:with-param>
                 </xsl:call-template>
                 <xsl:call-template name="addColumn">
                    <xsl:with-param name="name"><xsl:value-of select="$Txt_Geboortedoopdatum"/></xsl:with-param>
                    <xsl:with-param name="sort">36</xsl:with-param>
                    <xsl:with-param name="align">right</xsl:with-param>
                 </xsl:call-template>
                 <xsl:call-template name="addColumn">
                    <xsl:with-param name="name"><xsl:value-of select="$Txt_Overlijdensdatum"/></xsl:with-param>
                    <xsl:with-param name="sort">37</xsl:with-param>
                    <xsl:with-param name="align">right</xsl:with-param>
                 </xsl:call-template>
                <xsl:if test="$Roepnaam!=''">
                	<th class="tbl-head" align="left"><xsl:value-of select="$Txt_Roepnaam"/></th>
                </xsl:if>
                <xsl:if test="$Voornamen!=''">
                	<th class="tbl-head" align="left"><xsl:value-of select="$Txt_Voornamen"/></th>
                </xsl:if>
                <xsl:if test="$Tussenvoegsel!=''">
                	<th class="tbl-head" align="left"><xsl:value-of select="$Txt_Tussenvoegsel"/></th>
                </xsl:if>
                <xsl:if test="$Achternaam!=''">
                	<th class="tbl-head" align="left"><xsl:value-of select="$Txt_Achternaam"/></th>
                </xsl:if>
                <xsl:if test="$Familie!=''">
                	<th class="tbl-head" align="left"><xsl:value-of select="$Txt_Familie"/></th>
                </xsl:if>
                </tr>
              </xsl:if>
              <tr>
                <td>
                    <xsl:call-template name="ShowLijstPersoon">
                      <xsl:with-param name="relatie"></xsl:with-param>
                      <xsl:with-param name="NAMEFIRST"><xsl:value-of select="@first"/></xsl:with-param>
                      <xsl:with-param name="NAMENICK"><xsl:value-of select="@nick"/></xsl:with-param>
                      <xsl:with-param name="NAMEPREF"><xsl:value-of select="@pref"/></xsl:with-param>
                      <xsl:with-param name="SURN"><xsl:value-of select="@surn"/></xsl:with-param>
                      <xsl:with-param name="src"><xsl:value-of select="../../@link"/></xsl:with-param>
                      <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
                      <xsl:with-param name="naamweergave"><xsl:value-of select="$parToonNaam"/></xsl:with-param>
                    </xsl:call-template>
                  <xsl:for-each select="../../EVENTS/DEATH">
                    <xsl:if test="not(../../EVENTS/DEATH/@date)">
                      <xsl:value-of select="$dagger"/>
                    </xsl:if>
                  </xsl:for-each>
                </td>
                <td align="right">
                  <xsl:value-of select="../../EVENTS/BIRTH/@onz"/><xsl:value-of select="../../EVENTS/BIRTH/@date"/><xsl:value-of select="$nbsp"/>
                </td>
                <td align="right">
                  <xsl:value-of select="../../EVENTS/DEATH/@onz"/><xsl:value-of select="../../EVENTS/DEATH/@date"/><xsl:value-of select="$nbsp"/>
                </td>
                <xsl:if test="$Roepnaam!=''">
                	<td>
	                	<xsl:value-of select="@nick"/><xsl:value-of select="$nbsp"/>
	                </td>
	            </xsl:if>
                <xsl:if test="$Voornamen!=''">
                	<td>
	                	<xsl:value-of select="@first"/><xsl:value-of select="$nbsp"/>
	                </td>
	            </xsl:if>
                <xsl:if test="$Tussenvoegsel!=''">
                	<td>
	                	<xsl:value-of select="@pref"/><xsl:value-of select="$nbsp"/>
	                </td>
	            </xsl:if>
                <xsl:if test="$Achternaam!=''">
                	<td>
	                	<xsl:value-of select="@surn"/><xsl:value-of select="$nbsp"/>
	                </td>
	            </xsl:if>
                <xsl:if test="$Familie!=''">
                	<td>
                		<xsl:if test="@sort">
                			<xsl:value-of select="@sort"/>
                		</xsl:if>
                		<xsl:if test="not(@sort)">
		                	<xsl:value-of select="@surn"/>
		                </xsl:if>
	                	<xsl:value-of select="$nbsp"/>
	                </td>
	            </xsl:if>
              </tr>
            </xsl:for-each>
          </table>
        </div>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:if>

  <br/>
  
  <xsl:call-template name="ShowFooter"/>

</xsl:template>

</xsl:stylesheet>
