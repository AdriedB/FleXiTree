<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">
<!--
// <author>Paul Kallenberg</author>
// <file>$Workfile: WijzigInstellingen.xsl $</file>
// <date>$Date: 15-01-15 19:56 $</date>
// <revision>$Revision: 16 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this header stays intact.
// No responsibility is accepted for use of this software.</disclaimer>
-->
<xsl:output method="html"/>

<xsl:include href="Header.xsl"/>
<xsl:include href="Talen.xsl"/>

<xsl:param name="Browser"/>
<xsl:param name="HuidigPersoon"/>
<xsl:param name="Printing"/>
<xsl:param name="parToonVoornaam"/>
<xsl:param name="parToonBron"/>
<xsl:param name="parToonGetuige"/>
<xsl:param name="parToonNotitie"/>
<xsl:param name="parToonFeiten"/>
<xsl:param name="parToonVoettekst"/>
<xsl:param name="parToonPKVoettekst"/>
<xsl:param name="parDiaVolgorde"/>
<xsl:param name="parSortKey"/>
<xsl:param name="parFotoAantal"/>
<xsl:param name="parMaxPhotos"/>
<xsl:param name="parDiaDuur"/>
<xsl:param name="parNrKol"/>
<xsl:param name="parNrGeneraties"/>
<xsl:param name="parToonNaam"/>
<xsl:param name="parStuurFooter"/>
<xsl:param name="parStuurVoornaam"/>
<xsl:param name="parStuurDiaVolgorde"/>
<xsl:param name="parStuurDiaDuur"/>
<xsl:param name="parStuurAantalKolommen"/>
<xsl:param name="parStuurNaam"/>
<xsl:param name="parRefOwner"/>
<xsl:param name="parRefOwnerEMail"/>
<xsl:param name="parToonKalender"/>
<xsl:param name="parStuurSorteersleutel"/>
<xsl:param name="parToonNieuws"/>
<xsl:param name="parTaal"/>
<xsl:param name="parToonSortnaam"/>

<!--
Het begin
-->

<xsl:template match="PERSONEN">
<xsl:variable name="varStuurFooter"><xsl:value-of select="$parStuurFooter"/></xsl:variable>
<xsl:variable name="varStuurVoornaam"><xsl:value-of select="$parStuurVoornaam"/></xsl:variable>
<xsl:variable name="varStuurDiaVolgorde"><xsl:value-of select="$parStuurDiaVolgorde"/></xsl:variable>
<xsl:variable name="varStuurDiaDuur"><xsl:value-of select="$parStuurDiaDuur"/></xsl:variable>
<xsl:variable name="varStuurAantalKolommen"><xsl:value-of select="$parStuurAantalKolommen"/></xsl:variable>
<xsl:variable name="varStuurNaam"><xsl:value-of select="$parStuurNaam"/></xsl:variable>

  <xsl:call-template name="ShowMenu"/>
  
  <xsl:variable name="nr_bronnen">
  	<xsl:value-of select="count(PERSOON/EVENTS/BIRTH/@src) + count(PERSOON/EVENTS/REGB/@src) + count(PERSOON/EVENTS/BAPT/@src) + count(PERSOON/EVENTS/DEATH/@src) +count(PERSOON/EVENTS/REG/@src)+count(PERSOON/EVENTS/BURI/@src)+count(PERSOON/RELATIONS/RELA/@src)+count(PERSOON/RELATIONS/RELA/MARL/@src)+count(PERSOON/RELATIONS/RELA/MARC/@src)"/>
  </xsl:variable>
  <xsl:variable name="nr_getuigen">
  	<xsl:value-of select="count(PERSOON/EVENTS/REGB/WITN) + count(PERSOON/EVENTS/BAPT/WITN) + count(PERSOON/EVENTS/REG/WITN) + count(PERSOON/EVENTS/BURI/WITN) + count(PERSOON/RELATIONS/RELA/BEGIN/WITN) + count(PERSOON/RELATIONS/RELA/MARC/WITN) + count(PERSOON/RELATIONS/RELA/MARL/WITN)"/>
  </xsl:variable>
  <xsl:variable name="nr_notities">
  	<xsl:value-of select="count(PERSOON/PERSONAL/NOTE) + count(PERSOON/EVENTS/BIRTH/NOTE) + count(PERSOON/EVENTS/DEATH/NOTE) + count(PERSOON/RELATIONS/RELA/NOTE) + count(PERSOON/FACTS/FACT/NOTE)"/>
  </xsl:variable>
  <xsl:variable name="nr_feiten">
  	<xsl:value-of select="count(PERSOON/FACTS/FACT)"/>
  </xsl:variable>
  <xsl:variable name="nr_fotos">
  	<xsl:value-of select="count(PERSOON/PERSONAL/PHOTOS/PHOTO)"/>
  </xsl:variable>
  <xsl:variable name="varStuurAantalGeneraties">1</xsl:variable>  <!-- nog via sjabloon? -->
  
 <div align="center">
  <blockquote>
    <xsl:choose>
    <xsl:when test="$varStuurVoornaam = 1 or $varStuurNaam = 1 or nr_bronnen &gt; 0 or $nr_getuigen &gt; 0 or $nr_notities &gt; 0 or $nr_feiten &gt; 0 or $varStuurFooter=1 or $varStuurSorteersleutel=1 or $nr_fotos &gt; 0 or ($varStuurDiaVolgorde=1 and $nr_fotos &gt; 0) or ($varStuurDiaDuur=1 and $nr_fotos &gt; 0) or $varStuurAantalKolommen=1 or ($varStuurAantalGeneraties=1 and $Browser='IE')">
    <h2><xsl:value-of select="$Txt_Verander"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_instellingen"/></h2>
    <xsl:call-template name="Txt_instellingtitel"/>
    
    <form name="form2">
    <table class="tbl-tekst">
    <tr>
    <td valign="top">
      <table class="tbl-tekst">
        <xsl:if test="$varStuurVoornaam = 1">
        <tr>
          <td>
            <i><xsl:value-of select="$Txt_Weergave"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_eerste"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_naam"/></i>
          </td>
        </tr>
        <tr>
          <td>
            <xsl:element name="input">
              <xsl:attribute name="name">voornaam</xsl:attribute>
              <xsl:attribute name="type">radio</xsl:attribute>
              <xsl:if test="$parToonVoornaam = '1'">
                <xsl:attribute name="checked"/>
              </xsl:if>  
            </xsl:element>
            <xsl:value-of select="$Txt_Roepnaam"/>
          </td>
        </tr>
        <tr>
          <td>
            <xsl:element name="input">
              <xsl:attribute name="name">voornaam</xsl:attribute>
              <xsl:attribute name="type">radio</xsl:attribute>
              <xsl:if test="$parToonVoornaam = '2'">
                <xsl:attribute name="checked"/>
              </xsl:if>
            </xsl:element>
            <xsl:value-of select="$Txt_Volledigevoornamen"/>
           </td>
        </tr>
        <tr>
        	<td>
        		<br />
        	</td>
        </tr>
        </xsl:if>
        <xsl:if test="$varStuurNaam = 1">
        <tr>
          <td>
            <i><xsl:value-of select="$Txt_Weergave"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_naam"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_in"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_lijsten"/></i>
          </td>
        </tr>
        <tr>
          <td>
            <xsl:element name="input">
              <xsl:attribute name="name">naam</xsl:attribute>
              <xsl:attribute name="type">radio</xsl:attribute>
              <xsl:if test="$parToonNaam = '1'">
                <xsl:attribute name="checked"/>
              </xsl:if>  
            </xsl:element>
            <xsl:value-of select="$Txt_Voornaam"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_Achternaam"/>
          </td>
        </tr>
        <tr>
          <td>
            <xsl:element name="input">
              <xsl:attribute name="name">naam</xsl:attribute>
              <xsl:attribute name="type">radio</xsl:attribute>
              <xsl:if test="$parToonNaam = '2'">
                <xsl:attribute name="checked"/>
              </xsl:if>
            </xsl:element>
            <xsl:value-of select="$Txt_Achternaam"/><xsl:text>, </xsl:text><xsl:value-of select="$Txt_Voornaam"/>
           </td>
        </tr>
        <tr>
        	<td>
        		<br />
        	</td>
        </tr>
        </xsl:if>
        <xsl:if test="$varStuurAantalKolommen=1">
        <tr>
          <td>
            <i><xsl:value-of select="$Txt_Weergave"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_lijsten"/></i>
          </td>
        </tr>
        <tr>
          <td>
            <xsl:element name="input">
              <xsl:attribute name="name">kolommen</xsl:attribute>
              <xsl:attribute name="type">radio</xsl:attribute>
              <xsl:if test="$parNrKol = '1'">
                <xsl:attribute name="checked"/>
              </xsl:if>  
            </xsl:element>
            <xsl:value-of select="$Txt_Eenkolomslijsten"/>
          </td>
        </tr>
        <tr>
          <td>
            <xsl:element name="input">
              <xsl:attribute name="name">kolommen</xsl:attribute>
              <xsl:attribute name="type">radio</xsl:attribute>
              <xsl:if test="$parNrKol = '2'">
                <xsl:attribute name="checked"/>
              </xsl:if>
            </xsl:element>
            <xsl:value-of select="$Txt_Meerkolomslijsten"/>
           </td>
        </tr>
        <tr>
        	<td>
        		<br />
        	</td>
        </tr>
        </xsl:if>
        <xsl:if test="nr_bronnen &gt; 0 or $nr_getuigen &gt; 0 or $nr_notities &gt; 0 or $nr_feiten &gt; 0 or $varStuurFooter=1">
        <tr>
          <td>
            <i><xsl:value-of select="$Txt_Weergeven"/>:</i>
          </td>
        </tr>
        <xsl:if test="$nr_bronnen &gt; 0">
          <tr>
            <td>
              <xsl:element name="input">
                <xsl:attribute name="name">bronnen</xsl:attribute>
                <xsl:attribute name="type">checkbox</xsl:attribute>
                <xsl:if test="$parToonBron = '2'">
                  <xsl:attribute name="checked"/>
                </xsl:if>
              </xsl:element>
              <xsl:value-of select="$Txt_Bronnen"/>
             </td>
          </tr>
        </xsl:if>
        <xsl:if test="$nr_getuigen &gt; 0">
          <tr>
            <td>
              <xsl:element name="input">
                <xsl:attribute name="name">getuigen</xsl:attribute>
                <xsl:attribute name="type">checkbox</xsl:attribute>
                <xsl:if test="$parToonGetuige = '2'">
                  <xsl:attribute name="checked"/>
                </xsl:if>
              </xsl:element>
              <xsl:value-of select="$Txt_Getuigen"/>
             </td>
          </tr>
        </xsl:if>
        <xsl:if test="$nr_notities &gt; 0">
          <tr>
            <td>
              <xsl:element name="input">
                <xsl:attribute name="name">notities</xsl:attribute>
                <xsl:attribute name="type">checkbox</xsl:attribute>
                <xsl:if test="$parToonNotitie = '2'">
                  <xsl:attribute name="checked"/>
                </xsl:if>
              </xsl:element>
              <xsl:value-of select="$Txt_Notities"/>
             </td>
          </tr>
        </xsl:if>
        <xsl:if test="$nr_feiten &gt; 0">
          <tr>
            <td>
              <xsl:element name="input">
                <xsl:attribute name="name">feiten</xsl:attribute>
                <xsl:attribute name="type">checkbox</xsl:attribute>
                <xsl:if test="$parToonFeiten = '2'">
                  <xsl:attribute name="checked"/>
                </xsl:if>
              </xsl:element>
              <xsl:value-of select="$Txt_Feiten"/>
             </td>
          </tr>
        </xsl:if>
        <xsl:if test="$varStuurFooter=1">
          <tr>
            <td>
              <xsl:element name="input">
                <xsl:attribute name="name">pkvoettekst</xsl:attribute>
                <xsl:attribute name="type">checkbox</xsl:attribute>
                <xsl:if test="$parToonPKVoettekst = '2'">
                  <xsl:attribute name="checked"/>
                </xsl:if>
              </xsl:element>
              <xsl:value-of select="$Txt_Voettekst"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_op"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_persoonskaart"/>
             </td>
          </tr>
        </xsl:if>
        </xsl:if>
        <tr>
        	<td>
        		<br />
        	</td>
        </tr>
        <tr>
          <td>
            <i><xsl:value-of select="$Txt_Statistiek"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_perby"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_achternaam"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_of"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_perby"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_familie"/></i>
          </td>
        </tr>
        <tr>
          <td>
            <xsl:element name="input">
              <xsl:attribute name="name">sortnaam</xsl:attribute>
              <xsl:attribute name="type">radio</xsl:attribute>
              <xsl:if test="$parToonSortnaam = '1'">
                <xsl:attribute name="checked"/>
              </xsl:if>  
            </xsl:element>
            <xsl:value-of select="$Txt_Achternaam"/>
          </td>
        </tr>
        <tr>
          <td>
            <xsl:element name="input">
              <xsl:attribute name="name">sortnaam</xsl:attribute>
              <xsl:attribute name="type">radio</xsl:attribute>
              <xsl:if test="$parToonSortnaam = '2'">
                <xsl:attribute name="checked"/>
              </xsl:if>
            </xsl:element>
            <xsl:value-of select="$Txt_Familie"/>
           </td>
        </tr>
      </table>
    </td>
    <td width="15%">
      <xsl:value-of select="$nbsp"/>
    </td>
    <td valign="top">
      <table class="tbl-tekst">
        <xsl:if test="$nr_fotos &gt; 0">
        <xsl:if test="$parMaxPhotos = 1">
        <tr>
          <td>
            <i><xsl:value-of select="$Txt_Weergave"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_fotos"/><br />
            <xsl:text>(</xsl:text>
            <xsl:if test="$Browser='IE'">
              <xsl:value-of select="$Txt_grafisch"/><xsl:text>; </xsl:text>
            </xsl:if>
            <xsl:value-of select="$Txt_tekstoverzichten"/><xsl:text>; </xsl:text><xsl:value-of select="$Txt_diavoorstelling"/><xsl:text>; </xsl:text><xsl:value-of select="$Txt_persoonskaart"/>)</i>
          </td>
        </tr>
        <tr>
          <td>
            <xsl:element name="input">
              <xsl:attribute name="name">fotos</xsl:attribute>
              <xsl:attribute name="type">radio</xsl:attribute>
              <xsl:if test="$parFotoAantal = '1'">
                <xsl:attribute name="checked"/>
              </xsl:if>  
            </xsl:element>
            <xsl:value-of select="$Txt_Geen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_fotos"/>
          </td>
        </tr>
        <tr>
          <td>
            <xsl:element name="input">
              <xsl:attribute name="name">fotos</xsl:attribute>
              <xsl:attribute name="type">radio</xsl:attribute>
              <xsl:if test="$parFotoAantal = '2'">
                <xsl:attribute name="checked"/>
              </xsl:if>
            </xsl:element>
            <xsl:value-of select="$Txt_Fotos"/>
           </td>
        </tr>
        <tr>
        	<td>
        		<br />
        	</td>
        </tr>
        </xsl:if>
        <xsl:if test="$parMaxPhotos &gt; 1">
        <tr>
          <td>
            <i><xsl:value-of select="$Txt_Weergave"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_fotos"/><br />
            <xsl:text>(</xsl:text>
            <xsl:if test="$Browser='IE'">
              <xsl:value-of select="$Txt_grafisch"/><xsl:text> (max. 1); </xsl:text>
            </xsl:if>
            <xsl:value-of select="$Txt_tekstoverzichten"/><xsl:text>; </xsl:text><xsl:value-of select="$Txt_diavoorstelling"/><xsl:text>; </xsl:text><xsl:value-of select="$Txt_persoonskaart"/>)</i>
          </td>
        </tr>
        <tr>
          <td>
            <xsl:element name="input">
              <xsl:attribute name="name">fotos</xsl:attribute>
              <xsl:attribute name="type">radio</xsl:attribute>
              <xsl:if test="$parFotoAantal = '1'">
                <xsl:attribute name="checked"/>
              </xsl:if>  
            </xsl:element>
            <xsl:value-of select="$Txt_Geen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_fotos"/>
          </td>
        </tr>
        <tr>
          <td>
            <xsl:element name="input">
              <xsl:attribute name="name">fotos</xsl:attribute>
              <xsl:attribute name="type">radio</xsl:attribute>
              <xsl:if test="$parFotoAantal = '2'">
                <xsl:attribute name="checked"/>
              </xsl:if>
            </xsl:element>
            <xsl:value-of select="$Txt_Maximaal"/><xsl:text> 1 </xsl:text><xsl:value-of select="$Txt_per"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_persoon"/>
           </td>
        </tr>
        <tr>
          <td>
            <xsl:element name="input">
              <xsl:attribute name="name">fotos</xsl:attribute>
              <xsl:attribute name="type">radio</xsl:attribute>
              <xsl:if test="$parFotoAantal = '3'">
                <xsl:attribute name="checked"/>
              </xsl:if>
            </xsl:element>
            <xsl:value-of select="$Txt_Alle"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_fotos"/>
           </td>
        </tr>
        <tr>
        	<td>
        		<br />
        	</td>
        </tr>
        </xsl:if>
        </xsl:if>
        
        <xsl:if test="$nr_fotos &gt; 0">
        <xsl:if test="$varStuurDiaVolgorde=1">
        <tr>
          <td>
            <i><xsl:value-of select="$Txt_Volgorde"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_fotos"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_in"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_diavoorstelling"/>:</i>
          </td>
        </tr>
        <tr>
          <td>
            <xsl:element name="input">
              <xsl:attribute name="name">diavolgorde</xsl:attribute>
              <xsl:attribute name="type">radio</xsl:attribute>
              <xsl:if test="$parDiaVolgorde = '1'">
                <xsl:attribute name="checked"/>
              </xsl:if>  
            </xsl:element>
            <xsl:value-of select="$Txt_Willekeurig"/>
          </td>
        </tr>
        <tr>
          <td>
            <xsl:element name="input">
              <xsl:attribute name="name">diavolgorde</xsl:attribute>
              <xsl:attribute name="type">radio</xsl:attribute>
              <xsl:if test="$parDiaVolgorde = '2'">
                <xsl:attribute name="checked"/>
              </xsl:if>
            </xsl:element>
            <xsl:value-of select="$Txt_Opvolgorde"/>
           </td>
        </tr>
        </xsl:if>
        <xsl:if test="$varStuurDiaDuur=1">
        <tr>
          <td>
            <xsl:value-of select="$Txt_Tijdsduur"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_per"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_foto"/><xsl:text> (</xsl:text><xsl:value-of select="$Txt_secondes"/><xsl:text>)    </xsl:text><input name="diaduurInput" size="4" value="{$parDiaDuur}" maxlength="10"/>
          </td>
        </tr>
        </xsl:if>
        <tr>
        	<td>
        		<br />
        	</td>
        </tr>
        </xsl:if>
        <xsl:if test="$varStuurAantalGeneraties=1 and $Browser='IE'">
        <tr>
          <td>
            <i>
              <xsl:value-of select="$Txt_Aantal"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_generaties"/><xsl:text> </xsl:text>
              <xsl:value-of select="$Txt_in"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_grafisch"/><xsl:text> </xsl:text>
              <xsl:value-of select="$Txt_voorgeslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_nageslacht"/><xsl:text>: </xsl:text>
              <input name="generaties" size="4" value="{$parNrGeneraties}" maxlength="10"/><br />
              (0 = <xsl:value-of select="$Txt_geen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_beperking"/>)
              <br /><br />
              <xsl:call-template name="Txt_Wijziginstellingwaarschuwing"/>
            </i>
          </td>
        </tr>
        </xsl:if>
      </table>
    </td>
    </tr>
        <tr>
          <td align="center" colspan="3">
            <button type="button" onclick="WijzigInstellingen()">
              <xsl:value-of select="$nbsp"/><xsl:value-of select="$nbsp"/><xsl:value-of select="$nbsp"/>
              OK
              <xsl:value-of select="$nbsp"/><xsl:value-of select="$nbsp"/><xsl:value-of select="$nbsp"/>
            </button>
          </td>
        </tr>
    </table>
    </form>
    </xsl:when>
    <xsl:otherwise>
    <h4>
      <xsl:value-of select="$Txt_instellingniettewijzigen"/>
    </h4>
    </xsl:otherwise>
    </xsl:choose>
  </blockquote>
  </div>

</xsl:template>

</xsl:stylesheet>
