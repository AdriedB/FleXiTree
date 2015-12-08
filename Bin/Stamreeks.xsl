<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                version="1.0">
<!--
// <author>Paul Kallenberg</author>
// <file>$Workfile: Stamreeks.xsl $</file><date>$Date: 15-01-15 19:56 $</date>
// <revision>$Revision: 4 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this
// header stays intact. No responsibility is accepted
// for use of this software.</disclaimer>
-->
<xsl:output method="html"/>

<xsl:include href="Header.xsl"/>
<xsl:include href="Talen.xsl"/>

<xsl:param name="HuidigPersoon"/>
<xsl:param name="Browser"/>
<xsl:param name="LijstWoord"/>	<!-- LijstWoord = 'M' voor mannelijke lijn, 'V' voor vrouwelijke, en 'B' voor beide, werkt nog niet -->
<xsl:param name="Key2"/> <!-- met foto's (1) of zonder (0) -->
<xsl:param name="Printing"/>
<xsl:param name="parToonVoornaam"/>
<xsl:param name="parToonVoettekst"/>
<xsl:param name="parToonBron"/>
<xsl:param name="parToonNotitie"/>
<xsl:param name="parToonGetuige"/>
<xsl:param name="parToonFeiten"/>
<xsl:param name="parFotoAantal"/>
<xsl:param name="parTekstOvl"/>
<xsl:param name="parRefOwner"/>
<xsl:param name="parRefOwnerEMail"/>
<xsl:param name="parToonKalender"/>
<xsl:param name="parStuurSorteersleutel"/>
<xsl:param name="parToonNieuws"/>
<xsl:param name="parNrGenParenteel"/>
<xsl:param name="parTaal"/>

<xsl:template match="PERSONEN">

<xsl:call-template name="ShowMenu"/>

<xsl:variable name="LinkOudsteStamvader">
  <xsl:call-template name="OudsteStamvader">
    <xsl:with-param name="linkpers"><xsl:value-of select="$HuidigPersoon"/></xsl:with-param>
  </xsl:call-template>
</xsl:variable>

<xsl:variable name="LinkStartPersoon">
  <xsl:if test="$Key2 = 0">
    <xsl:value-of select="$LinkOudsteStamvader"/>
  </xsl:if>
  <xsl:if test="$Key2 = 1">
    <xsl:value-of select="$HuidigPersoon"/>
  </xsl:if>
</xsl:variable>
  
<xsl:for-each select="PERSOON[@link=$LinkStartPersoon]">

  <blockquote>
    <h2>
      <xsl:if test="$Key2 = 1">
        <xsl:if test="$LijstWoord='B'">
          <xsl:value-of select="$Txt_Verkort_parenteel"/>
          <xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/>
        </xsl:if>
      </xsl:if>
      <xsl:if test="$Key2 = 0">
        <xsl:if test="$LijstWoord='B'">
          <xsl:value-of select="$Txt_Parenteel"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_stamvader"/>
        </xsl:if>
      </xsl:if>
      <xsl:if test="$LijstWoord='M'">
        <xsl:value-of select="$Txt_Genealogie"/>
      </xsl:if>
      <xsl:if test="$LijstWoord='V'">
        <xsl:value-of select="$Txt_Nageslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_vrouwelijkelijn"/>
      </xsl:if>
      <xsl:text> </xsl:text>
      <xsl:for-each select="PERSONAL">
        <xsl:call-template name="ShowPersoon">
          <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
          <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
          <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
          <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
          <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
          <xsl:with-param name="priv">1</xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
    </h2>
    <xsl:if test="$HuidigPersoon != $LinkStartPersoon">
      <p><i>
        <xsl:value-of select="$nbsp"/><xsl:value-of select="$nbsp"/><xsl:value-of select="$nbsp"/><xsl:value-of select="$nbsp"/><xsl:value-of select="$Txt_stamvader"/><xsl:value-of select="$nbsp"/><xsl:value-of select="$Txt_van"/><xsl:value-of select="$nbsp"/>
        <xsl:for-each select="//PERSONEN/PERSOON[@link=$HuidigPersoon]">
          <xsl:for-each select="PERSONAL">
            <xsl:call-template name="ShowPersoon">
              <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
              <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
              <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
              <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
              <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
              <xsl:with-param name="priv">1</xsl:with-param>
            </xsl:call-template>
          </xsl:for-each>  <!-- PERSONAL -->
        </xsl:for-each>  <!-- select="//PERSONEN/PERSOON[@link=$HuidigPersoon]"> -->
      </i></p>
    </xsl:if>
  </blockquote>
  <br/>
  <p>
  <u><b><xsl:value-of select="$Txt_Legenda"/>:</b></u><br />
  <xsl:value-of select="$Txt_Geslacht"/>: <xsl:value-of select="$Txt_man_legend"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_vrouw_legend"/>
  ;  <xsl:value-of select="$Txt_Geborenmv"/>: * ; <xsl:value-of select="$Txt_Overledenmv"/>: <xsl:value-of select="$dagger"/>  ; <xsl:value-of select="$Txt_Relatie"/>: x; <xsl:value-of select="$Txt_Ouder"/>: [ ];
  <xsl:text> </xsl:text><xsl:value-of select="$Txt_Kinderloos"/>: (<xsl:value-of select="$Txt_Kinderloos_afk"/>)
  </p>
  <table border="0" cellspacing="3" cellpadding="3">
  <xsl:choose>
    <xsl:when test="$LijstWoord='B' or //PERSOON[@link=$LinkStartPersoon]/PERSONAL/@sex = $LijstWoord">
      <xsl:call-template name="dummy"/>
      <xsl:call-template name="ShowGezin">
        <xsl:with-param name="LinkVanDezePersoon"><xsl:value-of select="$LinkStartPersoon"/></xsl:with-param>
        <xsl:with-param name="RangNummer">1</xsl:with-param>
        <xsl:with-param name="GeneratieNummer">2</xsl:with-param>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
	  <xsl:value-of select="$Txt_Geenpersonenselectie"/>.
	</xsl:otherwise>
  </xsl:choose>
  </table>
  
</xsl:for-each>
  
</xsl:template>

<xsl:template name="OudsteStamvader">
  <xsl:param name="linkpers"/>
  <xsl:for-each select="//PERSONEN/PERSOON[@link=$linkpers]">
    <xsl:if test="count(FATHER)!=0">
      <xsl:for-each select="FATHER[string-length(@type)=0]">
        <xsl:call-template name="OudsteStamvader">
          <xsl:with-param name="linkpers"><xsl:value-of select="@link"/></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
    </xsl:if>
    <xsl:if test="count(FATHER[string-length(@type)=0]) = 0">
      <xsl:value-of select="$linkpers"/>
    </xsl:if>
  </xsl:for-each>
</xsl:template>

<xsl:template name="ShowGezin">
  <xsl:param name="LinkVanDezePersoon"/>
  <xsl:param name="RangNummer"/>
  <xsl:param name="GeneratieNummer"/>
  <xsl:param name="RelatieNummer"/>
  <xsl:for-each select="//PERSONEN/PERSOON[@link=$LinkVanDezePersoon]">
    <tr><td class="tbl-tekst">
      <xsl:call-template name="BeginPunten">
        <xsl:with-param name="GenNr"><xsl:value-of select="$GeneratieNummer - 2"/></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="ToRoman">
        <xsl:with-param name="k"><xsl:value-of select="$GeneratieNummer - 1"/></xsl:with-param>
      </xsl:call-template>
<!--      <xsl:value-of select="$RangNummer"/> --> <!-- Dit is t.b.v. Subnummering, wordt nu niet gebruikt -->
      <xsl:value-of select="$nbsp"/>
      <xsl:for-each select="PERSONAL">
        <xsl:call-template name="ShowPersoon">
          <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
          <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
          <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
          <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
          <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
          <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
        </xsl:call-template>
        <xsl:value-of select="$RelatieNummer"/>
        
        <xsl:if test="@sex='M'"><xsl:text> (</xsl:text><xsl:value-of select="substring($Txt_man,1,1)"/> <xsl:text>)</xsl:text></xsl:if>
        <xsl:if test="@sex='V'"><xsl:text> (</xsl:text><xsl:value-of select="substring($Txt_vrouw,1,1)"/> <xsl:text>)</xsl:text></xsl:if>
        
      </xsl:for-each>  <!-- PERSONAL -->
     
      <xsl:for-each select="EVENTS">
        <xsl:for-each select="BIRTH[@date or @place]">
          <xsl:text> * </xsl:text>
          <xsl:value-of select="@onz"/><xsl:text> </xsl:text><xsl:value-of select="@date"/>
          <xsl:if test="@place">
            <xsl:text> </xsl:text><xsl:value-of select="$Txt_te"/><xsl:text> </xsl:text><xsl:value-of select="@place"/>
          </xsl:if>
        </xsl:for-each>
      </xsl:for-each>
          
      <xsl:for-each select="EVENTS">
        <xsl:for-each select="DEATH[@date or @place]">
          <xsl:if test="../../EVENTS/BIRTH[@date or @place]">
            <xsl:text>;</xsl:text>
          </xsl:if>
          <xsl:text> </xsl:text><xsl:value-of select="$dagger"/><xsl:text> </xsl:text>
          <xsl:value-of select="@onz"/><xsl:text> </xsl:text><xsl:value-of select="@date"/>
          <xsl:if test="@place">
            <xsl:text> </xsl:text><xsl:value-of select="$Txt_te"/><xsl:text> </xsl:text><xsl:value-of select="@place"/>
          </xsl:if>
          <xsl:if test="@ovl = 2">
            <xsl:value-of select="$nbsp"/>(<xsl:value-of select="$Txt_Kinderloos_afk"/>)
          </xsl:if>
        </xsl:for-each>
      </xsl:for-each>
     
    </td></tr>
    <xsl:for-each select="RELATIONS/RELA">
      <xsl:if test="@link and (@link != 0)">
        <xsl:variable name="RelaLink">
          <xsl:value-of select="@link"/>
        </xsl:variable>
        <tr><td class="tbl-tekst">
          <xsl:call-template name="BeginPunten">
            <xsl:with-param name="GenNr"><xsl:value-of select="$GeneratieNummer - 2"/></xsl:with-param>
          </xsl:call-template>
          . <xsl:value-of select="$nbsp"/>. <xsl:value-of select="$nbsp"/>. <xsl:value-of select="$nbsp"/>. <xsl:value-of select="$nbsp"/>. <xsl:value-of select="$nbsp"/>. <xsl:value-of select="$nbsp"/>. <xsl:value-of select="$nbsp"/>. <xsl:value-of select="$nbsp"/>. <xsl:value-of select="$nbsp"/>. <xsl:value-of select="$nbsp"/>
          <xsl:if test="count(../RELA) &gt; 1">
            <xsl:text>[</xsl:text><xsl:value-of select="position()"/><xsl:text>] </xsl:text>
          </xsl:if>
          <xsl:text>x </xsl:text>
          <xsl:for-each select="BEGIN">
            <xsl:value-of select="@onz"/><xsl:text> </xsl:text><xsl:value-of select="@date"/>
            <xsl:if test="@place">
              <xsl:text> </xsl:text><xsl:value-of select="$Txt_te"/><xsl:text> </xsl:text><xsl:value-of select="@place"/>
            </xsl:if>
          </xsl:for-each>
          <xsl:for-each select="//PERSONEN/PERSOON[@link=$RelaLink]">
            <xsl:for-each select="PERSONAL">
              <xsl:value-of select="$nbsp"/>
              <xsl:call-template name="ShowPersoon">
                <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
                <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
                <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
                <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
                <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
                <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
              </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="EVENTS">
              <xsl:for-each select="BIRTH[@date or @place]">
                <xsl:text> * </xsl:text>
                <xsl:value-of select="@onz"/><xsl:text> </xsl:text><xsl:value-of select="@date"/>
                <xsl:if test="@place">
                  <xsl:text> </xsl:text><xsl:value-of select="$Txt_te"/><xsl:text> </xsl:text><xsl:value-of select="@place"/>
                </xsl:if>
              </xsl:for-each>
            </xsl:for-each>
          
            <xsl:for-each select="EVENTS">
              <xsl:for-each select="DEATH[@date or @place]">
                <xsl:if test="../../EVENTS/BIRTH[@date or @place]">
                  <xsl:text>;</xsl:text>
                </xsl:if>
                <xsl:text> </xsl:text><xsl:value-of select="$dagger"/><xsl:text> </xsl:text>
                <xsl:value-of select="@onz"/><xsl:text> </xsl:text><xsl:value-of select="@date"/>
                <xsl:if test="@place">
                  <xsl:text> </xsl:text><xsl:value-of select="$Txt_te"/><xsl:text> </xsl:text><xsl:value-of select="@place"/>
                </xsl:if>
              </xsl:for-each>
            </xsl:for-each>
          </xsl:for-each>
        </td></tr>
        <xsl:for-each select="//PERSONEN/PERSOON[@link=$RelaLink]">
          <xsl:if test="FATHER/@link &gt; 0 or MOTHER/@link &gt; 0">
            <tr><td class="tbl-tekst">
              <xsl:call-template name="BeginPunten">
                <xsl:with-param name="GenNr"><xsl:value-of select="$GeneratieNummer - 2"/></xsl:with-param>
              </xsl:call-template>
              . <xsl:value-of select="$nbsp"/>. <xsl:value-of select="$nbsp"/>. <xsl:value-of select="$nbsp"/>. <xsl:value-of select="$nbsp"/>. <xsl:value-of select="$nbsp"/>. <xsl:value-of select="$nbsp"/>. <xsl:value-of select="$nbsp"/>. <xsl:value-of select="$nbsp"/>. <xsl:value-of select="$nbsp"/>. <xsl:value-of select="$nbsp"/>. <xsl:value-of select="$nbsp"/>
              <xsl:choose>
                <xsl:when test="PERSONAL/@sex='M'">
                  <xsl:value-of select="$Txt_Zoon"/>
                </xsl:when>
                <xsl:when test="PERSONAL/@sex='V'">
                  <xsl:value-of select="$Txt_Dochter"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="$Txt_Kind"/>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:value-of select="$nbsp"/><xsl:value-of select="$Txt_van"/>
              <xsl:variable name="FatherLink">
                <xsl:value-of select="FATHER/@link"/>
              </xsl:variable>
              <xsl:for-each select="//PERSONEN/PERSOON[@link=$FatherLink]">
                <xsl:for-each select="PERSONAL">
                  <xsl:value-of select="$nbsp"/>
                  <xsl:call-template name="ShowPersoon">
                    <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
                    <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
                    <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
                    <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
                    <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
                    <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
                  </xsl:call-template>
                </xsl:for-each>
              </xsl:for-each>
              <xsl:variable name="MotherLink">
                <xsl:value-of select="MOTHER/@link"/>
              </xsl:variable>
              <xsl:if test="$FatherLink &gt; 0 and $MotherLink &gt; 0">
                <xsl:value-of select="$nbsp"/><xsl:value-of select="$Txt_en"/>
              </xsl:if>
              <xsl:for-each select="//PERSONEN/PERSOON[@link=$MotherLink]">
                <xsl:for-each select="PERSONAL">
                  <xsl:value-of select="$nbsp"/>
                  <xsl:call-template name="ShowPersoon">
                    <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
                    <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
                    <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
                    <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
                    <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
                    <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
                  </xsl:call-template>
                </xsl:for-each>
              </xsl:for-each>
            </td></tr>
          </xsl:if>
        </xsl:for-each>
      </xsl:if>
    </xsl:for-each>
    <xsl:for-each select="RELATIONS/RELA">
      <xsl:variable name="aantalKinderenVorigeRelaties">
        <xsl:call-template name="TelKinderenVorigeRelaties">
          <xsl:with-param name="totRelatie" select="position()"/>
          <xsl:with-param name="huidigeRelatie" select="0"/>
          <xsl:with-param name="aantalKinderen" select="0"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="RelNr">
        <xsl:if test="count(../RELA) = 1">
          <xsl:text></xsl:text>
        </xsl:if>
      	<xsl:if test="count(../RELA) &gt; 1">
      	  <xsl:text> [</xsl:text><xsl:value-of select="position()"/><xsl:text>] </xsl:text>
      	</xsl:if>
      </xsl:variable>
      <xsl:for-each select="CHILDREN/CHIL">
        <xsl:call-template name="ShowGezin">
          <xsl:with-param name="LinkVanDezePersoon"><xsl:value-of select="@link"/></xsl:with-param>
          <xsl:with-param name="RangNummer">
            <xsl:value-of select="$RangNummer"/>
            <xsl:if test="string-length($RangNummer) != 0">
              <xsl:text>.</xsl:text>
            </xsl:if>
<!-- ==== positie opgehoogd met # kinderen uit vorige relaties -->                
            <xsl:value-of select="position()+$aantalKinderenVorigeRelaties"/>
          </xsl:with-param>
          <xsl:with-param name="GeneratieNummer"><xsl:value-of select="$GeneratieNummer + 1"/></xsl:with-param>
          <xsl:with-param name="RelatieNummer"><xsl:value-of select="$RelNr"/></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:for-each>  <!-- select="//PERSONEN/PERSOON[@link=$LinkVanDezePersoon]"> -->
</xsl:template>

<xsl:template name="BeginPunten">
	<xsl:param name="GenNr"/>
	<xsl:if test="$GenNr &gt; 0">
	  . <xsl:value-of select="$nbsp"/>
	  <xsl:call-template name="BeginPunten">
	  	<xsl:with-param name="GenNr"><xsl:value-of select="$GenNr - 1"/></xsl:with-param>
	  </xsl:call-template>
	</xsl:if>
</xsl:template>

<xsl:template name="TelKinderenVorigeRelaties">
  <xsl:param name="huidigeRelatie"/>
  <xsl:param name="totRelatie"/>
  <xsl:param name="aantalKinderen"/>

  <xsl:choose>
    <xsl:when test="$huidigeRelatie = $totRelatie">
      <xsl:value-of select="$aantalKinderen"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="TelKinderenVorigeRelaties">
        <xsl:with-param name="totRelatie" select="$totRelatie"/>
        <xsl:with-param name="huidigeRelatie" select="$huidigeRelatie+1"/>
        <xsl:with-param name="aantalKinderen" select="count(../RELA[position()=$huidigeRelatie]/CHILDREN/CHIL)+$aantalKinderen"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>

</xsl:template>

<xsl:template name="ToRoman">    <!-- schrijf k (numeriek) in Romeinse cijfers -->
	<xsl:param name="k"/>
	<xsl:if test="$k &gt; 999">
	  <xsl:text>M</xsl:text>
	  <xsl:call-template name="ToRoman">
	    <xsl:with-param name="k"><xsl:value-of select="$k - 1000"/></xsl:with-param>
	  </xsl:call-template>
	</xsl:if>
	<xsl:if test="$k &lt; 1000 and $k &gt; 899">
	  <xsl:text>CM</xsl:text>
	  <xsl:call-template name="ToRoman">
	    <xsl:with-param name="k"><xsl:value-of select="$k - 900"/></xsl:with-param>
	  </xsl:call-template>
	</xsl:if>
	<xsl:if test="$k &lt; 900 and $k &gt; 499">
	  <xsl:text>D</xsl:text>
	  <xsl:call-template name="ToRoman">
	    <xsl:with-param name="k"><xsl:value-of select="$k - 500"/></xsl:with-param>
	  </xsl:call-template>
	</xsl:if>
	<xsl:if test="$k &lt; 500 and $k &gt; 399">
	  <xsl:text>CD</xsl:text>
	  <xsl:call-template name="ToRoman">
	    <xsl:with-param name="k"><xsl:value-of select="$k - 400"/></xsl:with-param>
	  </xsl:call-template>
	</xsl:if>
	<xsl:if test="$k &lt; 400 and $k &gt; 99">
	  <xsl:text>C</xsl:text>
	  <xsl:call-template name="ToRoman">
	    <xsl:with-param name="k"><xsl:value-of select="$k - 100"/></xsl:with-param>
	  </xsl:call-template>
	</xsl:if>
	<xsl:if test="$k &lt; 100 and $k &gt; 89">
	  <xsl:text>XC</xsl:text>
	  <xsl:call-template name="ToRoman">
	    <xsl:with-param name="k"><xsl:value-of select="$k - 90"/></xsl:with-param>
	  </xsl:call-template>
	</xsl:if>
	<xsl:if test="$k &lt; 90 and $k &gt; 49">
	  <xsl:text>L</xsl:text>
	  <xsl:call-template name="ToRoman">
	    <xsl:with-param name="k"><xsl:value-of select="$k - 50"/></xsl:with-param>
	  </xsl:call-template>
	</xsl:if>
	<xsl:if test="$k &lt; 50 and $k &gt; 39">
	  <xsl:text>XL</xsl:text>
	  <xsl:call-template name="ToRoman">
	    <xsl:with-param name="k"><xsl:value-of select="$k - 40"/></xsl:with-param>
	  </xsl:call-template>
	</xsl:if>
	<xsl:if test="$k &lt; 40 and $k &gt; 9">
	  <xsl:text>X</xsl:text>
	  <xsl:call-template name="ToRoman">
	    <xsl:with-param name="k"><xsl:value-of select="$k - 10"/></xsl:with-param>
	  </xsl:call-template>
	</xsl:if>
	<xsl:if test="$k &lt; 10 and $k &gt; 8">
	  <xsl:text>IX</xsl:text>
	  <xsl:call-template name="ToRoman">
	    <xsl:with-param name="k"><xsl:value-of select="$k - 9"/></xsl:with-param>
	  </xsl:call-template>
	</xsl:if>
	<xsl:if test="$k &lt; 9 and $k &gt; 4">
	  <xsl:text>V</xsl:text>
	  <xsl:call-template name="ToRoman">
	    <xsl:with-param name="k"><xsl:value-of select="$k - 5"/></xsl:with-param>
	  </xsl:call-template>
	</xsl:if>
	<xsl:if test="$k &lt; 5 and $k &gt; 3">
	  <xsl:text>IV</xsl:text>
	  <xsl:call-template name="ToRoman">
	    <xsl:with-param name="k"><xsl:value-of select="$k - 4"/></xsl:with-param>
	  </xsl:call-template>
	</xsl:if>
	<xsl:if test="$k &lt; 4 and $k &gt; 0">
	  <xsl:text>I</xsl:text>
	  <xsl:call-template name="ToRoman">
	    <xsl:with-param name="k"><xsl:value-of select="$k - 1"/></xsl:with-param>
	  </xsl:call-template>
	</xsl:if>
</xsl:template>

<xsl:template name="dummy">
</xsl:template>    
</xsl:stylesheet>
