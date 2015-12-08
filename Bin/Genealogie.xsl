<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                version="1.0">
<!--
// <author>Adrie den Blanken</author>
// <file>$Workfile: Genealogie.xsl $</file><date>$Date: 15-01-15 8:20 $</date>
// <revision>$Revision: 36 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this
// header stays intact. No responsibility is accepted
// for use of this software.</disclaimer>
-->
<xsl:output method="html"/>

<xsl:include href="Header.xsl"/>
<xsl:include href="Talen.xsl"/>

<!-- <xsl:param name="HuidigPersoon" select="1003954325"/> -->
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

<!--  define the Javascript functions that you want to include within
        a msxsl:script element.
        - language indicates the scripting language
        - implements-prefix gives the namespace prefix that you
          declared for your function (i.e. foo) -->

<xsl:variable name="varTekstOVL"><xsl:value-of select="$parTekstOvl"/></xsl:variable>
<xsl:template match="PERSONEN">

<xsl:call-template name="ShowMenu"/>

    <div align="center">
<table class="pk-width tbl-tekst" style="border-color:black; margin-left:auto; margin-right:auto; text-align:justify">
<tr><td>
<xsl:for-each select="PERSOON[@link=$HuidigPersoon]">

  <blockquote>
    <h2>
      <xsl:if test="$LijstWoord='B'">
        <xsl:value-of select="$Txt_Parenteel"/>
      </xsl:if>
      <xsl:if test="$LijstWoord='M'">
        <xsl:value-of select="$Txt_Genealogie"/>
      </xsl:if>
      <xsl:if test="$LijstWoord='V'">
        <xsl:value-of select="$Txt_Nageslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_vrouwelijkelijn"/>
      </xsl:if>
      <xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text>
      <xsl:for-each select="PERSONAL">
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

    <xsl:choose>
	  <xsl:when test="$LijstWoord='B' or //PERSOON[@link=$HuidigPersoon]/PERSONAL/@sex = $LijstWoord">
	    <xsl:call-template name="dummy"/>
        <xsl:call-template name="ShowGezin">
          <xsl:with-param name="LinkVanDezePersoon"><xsl:value-of select="$HuidigPersoon"/></xsl:with-param>
          <xsl:with-param name="RangNummer">1</xsl:with-param>
          <xsl:with-param name="GeneratieNummer">2</xsl:with-param>
        </xsl:call-template>
	  </xsl:when>
      <xsl:otherwise>
	    <xsl:value-of select="$Txt_Geenpersonenselectie"/>.
	  </xsl:otherwise>
    </xsl:choose>
  </blockquote>
  <br/>
</xsl:for-each>
</td></tr>
</table>

    </div>

</xsl:template>

<xsl:template name="ShowGezin">
  <xsl:param name="LinkVanDezePersoon"/>
  <xsl:param name="RangNummer"/>
  <xsl:param name="GeneratieNummer"/>
  <xsl:for-each select="//PERSONEN/PERSOON[@link=$LinkVanDezePersoon]">
<!-- ===== Toon ook All Events als persoon een relatie heeft (gehad) ==== -->
    <xsl:if test="count(RELATIONS/RELA/CHILDREN) &gt; 0 or RELATIONS/RELA/@link &gt; 0 or $GeneratieNummer=2">
    <xsl:if test="$RangNummer != ''">
      <br/>
    </xsl:if>
<!-- === Maak label om naar te kunnen verwijzen == -->
	  <xsl:element name="a">
        <xsl:attribute name="name"><xsl:value-of select="$LinkVanDezePersoon"/></xsl:attribute>
      </xsl:element>
          <strong>
        <xsl:value-of select="$RangNummer"/><xsl:text> </xsl:text>
      </strong>  
      <xsl:call-template name="ShowAllEvents">
        <xsl:with-param name="link" select="$LinkVanDezePersoon"/>
        <xsl:with-param name="volledig" select="1"/>
        <xsl:with-param name="vet" select="1"/>
      </xsl:call-template>
<!-- ===== Afsluiten if, in volgend blok begint meteen weer nieuwe if === -->
    </xsl:if>
  
<!-- ====== Toon alleen Kind(eren) van, als er binnen deze relatie kinderen zijn;
            Schrijf Kind bij 1 kind, anders Kinderen ========================== -->  
    	<xsl:for-each select="RELATIONS/RELA">
			<xsl:if test="count(CHILDREN) &gt; 0">
				<br clear="all"/>
				<xsl:if test="count(CHILDREN/CHIL) = 1">
        			<xsl:value-of select="$Txt_Kind"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text>
       			</xsl:if>
       			<xsl:if test="count(CHILDREN/CHIL) &gt; 1">
        			<xsl:value-of select="$Txt_Kinderen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text>
       			</xsl:if>

        <!--
        ABL: 2-12-2007 eerst het aantal kinderen uit vorige relaties optellen
        -->
        <xsl:variable name="aantalKinderenVorigeRelaties">
          <xsl:call-template name="TelKinderenVorigeRelaties">
            <xsl:with-param name="totRelatie" select="position()"/>
            <xsl:with-param name="huidigeRelatie" select="0"/>
            <xsl:with-param name="aantalKinderen" select="0"/>
          </xsl:call-template>
        </xsl:variable>

       			
        <xsl:for-each select="../../PERSONAL">
          <xsl:for-each select="NAME">
            <xsl:call-template name="VolledigeNaam">
              <xsl:with-param name="link" select="$LinkVanDezePersoon"/>
              <xsl:with-param name="first" select="@first"/>
              <xsl:with-param name="pref" select="@pref"/>
              <xsl:with-param name="nick" select="@nick"/>
              <xsl:with-param name="surn" select="@surn"/>
              <xsl:with-param name="vet" select="0"/>
              <xsl:with-param name="voluit" select="0"/>
              <xsl:with-param name="priv" select="../../@priv"/>
            </xsl:call-template>
          </xsl:for-each>
        </xsl:for-each>
        <xsl:variable name="relalink" select="@link"/>
        <xsl:if test="@link!=0">
          <xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_vantweedeouder"/><xsl:text> </xsl:text>
        </xsl:if>
        <xsl:for-each select="//PERSONEN/PERSOON[@link=$relalink]/PERSONAL">
          <xsl:for-each select="NAME">
            <xsl:call-template name="VolledigeNaam">
              <xsl:with-param name="link" select="$relalink"/>
              <xsl:with-param name="first" select="@first"/>
              <xsl:with-param name="pref" select="@pref"/>
              <xsl:with-param name="nick" select="@nick"/>
              <xsl:with-param name="surn" select="@surn"/>
              <xsl:with-param name="vet" select="0"/>
              <xsl:with-param name="voluit" select="0"/>
              <xsl:with-param name="priv" select="../../@priv"/>
            </xsl:call-template>
          </xsl:for-each>
        </xsl:for-each>
        <xsl:text>: </xsl:text>
        <table>
          <xsl:for-each select="CHILDREN/CHIL">
<!-- === Maak variabele rng, om hier af te drukken, en om verderop in Volgt-href te kunnen gebruiken -->
            <xsl:variable name="rng">
            <xsl:value-of select="$RangNummer"/>
            <xsl:if test="string-length($RangNummer) != 0">
              <xsl:text>.</xsl:text>
            </xsl:if>
              <!--
               ABL: 2-12-2007: het aantal kinderen uit vorige relaties optellen
              -->
              <xsl:value-of select="position()+$aantalKinderenVorigeRelaties"/>
            </xsl:variable>
            <tr>
              <td width="5%" class="tbl-tekst">
              </td>
              <td valign="top" class="tbl-tekst">
              <strong>
                <xsl:value-of select="$rng"/>
              </strong>
              </td>
              <td class="tbl-tekst">
                <xsl:if test="count(@type)!=0">
                  <strong>
                    (<xsl:call-template name="showTypeKindVolledig">
                      <xsl:with-param name="type"><xsl:value-of select="@type"/></xsl:with-param>
                    </xsl:call-template>)
                  </strong>
                </xsl:if>
              
              	<xsl:variable name="childLink" select="@link"/>
              	<xsl:for-each select="//PERSONEN/PERSOON[@link=$childLink]">
				    <xsl:choose>
              			<xsl:when test="RELATIONS/RELA and ($LijstWoord='B' or PERSONAL/@sex=$LijstWoord) and ($GeneratieNummer &lt; $parNrGenParenteel)">
              				<xsl:call-template name="ShowAllEvents">
                				<xsl:with-param name="link" select="@link"/>
                				<xsl:with-param name="volledig" select="0"/>
                				<xsl:with-param name="vet" select="0"/>
              				</xsl:call-template>
<!-- === Maak verwijzing naar label waar details van deze persoon worden getoond -->
              	  			<xsl:variable name="verwijzing">
		              		    #<xsl:value-of select="@link"/>
        		    		</xsl:variable>
              				<a href="{$verwijzing}">
		              		  	<xsl:value-of select="$Txt_Volgt"/><xsl:text> </xsl:text><xsl:value-of select="$rng"/>
        		      		</a>
              			</xsl:when>
              			<xsl:otherwise>
              				<xsl:call-template name="ShowAllEvents">
                				<xsl:with-param name="link" select="@link"/>
	                			<xsl:with-param name="volledig" select="1"/>
    	            			<xsl:with-param name="vet" select="0"/>
        	      			</xsl:call-template>
              			</xsl:otherwise>
					</xsl:choose>
              	</xsl:for-each>
              </td>
            </tr>
          </xsl:for-each>
        </table>
       </xsl:if>  <!-- test="count(CHILDREN) &gt; 0" -->
      </xsl:for-each>
      
      <xsl:for-each select="RELATIONS/RELA">
<!-- === Mijn toevoeging; ook hier weer eerst aantal kinderen uit vorige relaties tellen -->      
        <xsl:variable name="aantalKinderenVorigeRelaties">
          <xsl:call-template name="TelKinderenVorigeRelaties">
            <xsl:with-param name="totRelatie" select="position()"/>
            <xsl:with-param name="huidigeRelatie" select="0"/>
            <xsl:with-param name="aantalKinderen" select="0"/>
          </xsl:call-template>
        </xsl:variable>

        <xsl:for-each select="CHILDREN/CHIL">
          <xsl:variable name="childLink" select="@link"/>

          <xsl:if test="$LijstWoord='B' or //PERSOON[@link=$childLink]/PERSONAL/@sex = $LijstWoord">

          <xsl:if test="$GeneratieNummer &lt; $parNrGenParenteel">  
          <xsl:call-template name="ShowGezin">
              <xsl:with-param name="LinkVanDezePersoon"><xsl:value-of select="@link"/></xsl:with-param>
              <xsl:with-param name="RangNummer">
                <xsl:value-of select="$RangNummer"/>
                <xsl:if test="string-length($RangNummer) != 0">
                  <xsl:text>.</xsl:text>
                </xsl:if>
<!-- ==== positie opgehoogd met # kinderen uit vorige realties -->                
                <xsl:value-of select="position()+$aantalKinderenVorigeRelaties"/></xsl:with-param>
              <xsl:with-param name="GeneratieNummer"><xsl:value-of select="$GeneratieNummer + 1"/></xsl:with-param>
            </xsl:call-template>
            </xsl:if>
          </xsl:if>
        </xsl:for-each>
      </xsl:for-each>
<!-- ===== Deze if is al eerder afgesloten ==== -->
<!--    </xsl:if> -->
  </xsl:for-each>
</xsl:template>

<xsl:template name="mv">
  <xsl:param name="sex"></xsl:param>
  <xsl:param name="cap"></xsl:param>
  <xsl:param name="naamwoord"></xsl:param>
  
  <xsl:if test="$naamwoord=1">
  	<xsl:if test="$sex = 'M'">
    	<xsl:if test="$cap = 1">
    		<xsl:value-of select="$Txt_Hij"/>
     	</xsl:if>
     	<xsl:if test="$cap = 0">
       		<xsl:value-of select="$Txt_hij"/>
     	</xsl:if>
  	</xsl:if>
  	<xsl:if test="$sex = 'V'">
     	<xsl:if test="$cap = 1">
       		<xsl:value-of select="$Txt_Zij"/>
     	</xsl:if>
     	<xsl:if test="$cap = 0">
       		<xsl:value-of select="$Txt_zij"/>
     	</xsl:if>
  	</xsl:if>
  	<xsl:if test="$sex = '?'">
     	<xsl:if test="$cap = 1">
       		<xsl:value-of select="$Txt_HijZij"/>
     	</xsl:if>
     	<xsl:if test="$cap = 0">
       		<xsl:value-of select="$Txt_hijzij"/>
     	</xsl:if>
  	</xsl:if>
  </xsl:if>
  
  <xsl:if test="$naamwoord=2">
  	<xsl:if test="$sex = 'M'">
    	<xsl:if test="$cap = 1">
    		<xsl:value-of select="$Txt_Zijn"/>
     	</xsl:if>
     	<xsl:if test="$cap = 0">
       		<xsl:value-of select="$Txt_zijn"/>
     	</xsl:if>
  	</xsl:if>
  	<xsl:if test="$sex = 'V'">
     	<xsl:if test="$cap = 1">
       		<xsl:value-of select="$Txt_Haar"/>
     	</xsl:if>
     	<xsl:if test="$cap = 0">
       		<xsl:value-of select="$Txt_haar"/>
     	</xsl:if>
  	</xsl:if>
  	<xsl:if test="$sex = '?'">
     	<xsl:if test="$cap = 1">
       		<xsl:value-of select="$Txt_ZijnHaar"/>
     	</xsl:if>
     	<xsl:if test="$cap = 0">
       		<xsl:value-of select="$Txt_zijnhaar"/>
     	</xsl:if>
  	</xsl:if>
  </xsl:if>
  
  <xsl:if test="$naamwoord=3">
  	<xsl:if test="$sex = 'M'">
    	<xsl:if test="$cap = 1">
    		<xsl:value-of select="$Txt_Hem"/>
     	</xsl:if>
     	<xsl:if test="$cap = 0">
       		<xsl:value-of select="$Txt_hem"/>
     	</xsl:if>
  	</xsl:if>
  	<xsl:if test="$sex = 'V'">
     	<xsl:if test="$cap = 1">
       		<xsl:value-of select="$Txt_Haar"/>
     	</xsl:if>
     	<xsl:if test="$cap = 0">
       		<xsl:value-of select="$Txt_haar"/>
     	</xsl:if>
  	</xsl:if>
  	<xsl:if test="$sex = '?'">
     	<xsl:if test="$cap = 1">
       		<xsl:value-of select="$Txt_HemHaar"/>
     	</xsl:if>
     	<xsl:if test="$cap = 0">
       		<xsl:value-of select="$Txt_hemhaar"/>
     	</xsl:if>
  	</xsl:if>
  </xsl:if>
</xsl:template>

<xsl:template name="dz">
  <xsl:param name="sex"></xsl:param>
  <xsl:param name="cap"></xsl:param>

  <xsl:if test="$sex = 'M'">
     <xsl:if test="$cap = 1">
       <xsl:value-of select="$Txt_Zoon"/>
     </xsl:if>
     <xsl:if test="$cap = 0">
       <xsl:value-of select="$Txt_zoon"/>
     </xsl:if>
  </xsl:if>
  <xsl:if test="$sex = 'V'">
     <xsl:if test="$cap = 1">
       <xsl:value-of select="$Txt_Dochter"/>
     </xsl:if>
     <xsl:if test="$cap = 0">
       <xsl:value-of select="$Txt_dochter"/>
     </xsl:if>
  </xsl:if>
  <xsl:if test="$sex = '?'">
     <xsl:if test="$cap = 1">
       <xsl:value-of select="$Txt_Kind"/>
     </xsl:if>
     <xsl:if test="$cap = 0">
       <xsl:value-of select="$Txt_kind"/>
     </xsl:if>
  </xsl:if>
</xsl:template>

<xsl:template name="Roepnaam">
  <xsl:param name="link"></xsl:param>
  <xsl:param name="cap"></xsl:param>
  <xsl:param name="naamwoord"></xsl:param>
    <xsl:choose>
      <xsl:when test="string-length(//PERSOON[@link=$link]/PERSONAL/NAME/@nick) = 0">
    	<xsl:choose>
            <!-- pak de eerste naam van de voornamen -->
      	  <xsl:when test="string-length(substring-before(//PERSOON[@link=$link]/PERSONAL/NAME/@first,' ')) != 0">
    		<xsl:value-of select="substring-before(//PERSOON[@link=$link]/PERSONAL/NAME/@first,' ')"/>
      	  </xsl:when>
      	  <xsl:otherwise>
      	    <xsl:choose>
      	      <xsl:when test="string-length(//PERSOON[@link=$link]/PERSONAL/NAME/@first)!=0">
			    <xsl:value-of select="//PERSOON[@link=$link]/PERSONAL/NAME/@first"/>
			  </xsl:when>
			  <xsl:otherwise>
			    <xsl:call-template name="mv">
			      <xsl:with-param name="sex"><xsl:value-of select="//PERSOON[@link=$link]/PERSONAL/@sex"/></xsl:with-param>
			      <xsl:with-param name="cap"><xsl:value-of select="$cap"/></xsl:with-param>
			      <xsl:with-param name="naamwoord"><xsl:value-of select="$naamwoord"/></xsl:with-param>
			    </xsl:call-template>
			  </xsl:otherwise>
			</xsl:choose>
	  	  </xsl:otherwise>
		</xsl:choose>
	  </xsl:when>
	  <xsl:otherwise>
		<xsl:value-of select="//PERSOON[@link=$link]/PERSONAL/NAME/@nick"/>
	  </xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="VolledigeNaam">
  <xsl:param name="link"></xsl:param>
  <xsl:param name="first"></xsl:param>
  <xsl:param name="pref"></xsl:param>
  <xsl:param name="nick"></xsl:param>
  <xsl:param name="surn"></xsl:param>
  <xsl:param name="vet"></xsl:param>
  <xsl:param name="voluit"></xsl:param>
  <xsl:param name="priv"></xsl:param>

  <xsl:if test="$vet = 1 and $Browser = 'IE'">

    <xsl:text disable-output-escaping="yes">&lt;strong&gt;</xsl:text>
  </xsl:if>
  
  <xsl:variable name="naam">
    <xsl:if test="$voluit = 1">
      <xsl:choose>
        <xsl:when test="string-length($nick) > 0 and string-length($first) > 0">
          <xsl:if test="$first != $nick">
            <xsl:value-of select="$first"/><xsl:text> (</xsl:text>
          </xsl:if>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$first"/><xsl:if test="string-length($nick) > 0"><xsl:text> </xsl:text></xsl:if>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>

    <xsl:if test="string-length($nick) > 0"><xsl:value-of select="$nick"/></xsl:if>
    <xsl:if test="string-length($nick) = 0 and $voluit = 0"><xsl:value-of select="$first"/></xsl:if>

    <xsl:if test="$voluit = 1">
      <xsl:choose>
        <xsl:when test="string-length($nick) > 0 and string-length($first) > 0">
          <xsl:if test="$first != $nick">
            <xsl:text>)</xsl:text>
          </xsl:if>
        </xsl:when>
        <xsl:otherwise>
            <xsl:if test="string-length($nick) > 0"><xsl:text></xsl:text></xsl:if>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
    <xsl:if test="string-length($pref)>0"><xsl:text> </xsl:text><xsl:value-of select="$pref"/></xsl:if>
    <xsl:text> </xsl:text><xsl:value-of select="$surn"/>

  </xsl:variable>

  <xsl:if test="$priv = 1">
    <xsl:value-of select="$naam"/>
  </xsl:if>
  <xsl:if test="string-length($priv) = 0">
    <a href="javascript:ToonPersoonsKaart('{$link}')">
      <xsl:value-of select="$naam"/>
    </a>
  </xsl:if>

  <xsl:if test="$vet = 1 and $Browser = 'IE'">
    <xsl:text disable-output-escaping="yes">&lt;/strong&gt;</xsl:text>
  </xsl:if>

</xsl:template>

<xsl:template name="ShowAllEvents">
  <xsl:param name="link"/>
  <xsl:param name="volledig"/>
  <xsl:param name="vet"/>

  <xsl:for-each select="//PERSOON[@link=$link]">
    <xsl:variable name="mv" select="PERSONAL/@sex"/>

    <!-- Nieuwe zin "Catherina (Roos) Rood, geboren op woensdag 10 oktober 2001 om 03:30 te Woerden." -->
    <xsl:for-each select="PERSONAL">
      <xsl:for-each select="NAME">
        <xsl:call-template name="VolledigeNaam">
          <xsl:with-param name="link" select="$link"/>
          <xsl:with-param name="first" select="@first"/>
          <xsl:with-param name="pref" select="@pref"/>
          <xsl:with-param name="nick" select="@nick"/>
          <xsl:with-param name="surn" select="@surn"/>
          <xsl:with-param name="vet" select="$vet"/>
          <xsl:with-param name="voluit" select="1"/>
          <xsl:with-param name="priv" select="../../@priv"/>
        </xsl:call-template>
      </xsl:for-each>
    </xsl:for-each>

      <xsl:if test="EVENTS/BIRTH/@date or EVENTS/BIRTH/@place or EVENTS/DEATH/@ovl=1">
        <xsl:if test="$vet=0">
          <xsl:text>, </xsl:text>
        </xsl:if>
        <xsl:if test="$vet=1">
          <xsl:text> </xsl:text><xsl:value-of select="$Txt_isvt"/>
        </xsl:if>
        <xsl:choose>
          <xsl:when test="EVENTS/DEATH/@ovl=1">
            <xsl:text> </xsl:text><xsl:value-of select="$Txt_levenloosgeboren"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text> </xsl:text>
            <xsl:choose>
              <xsl:when test="PERSONAL/@sex='V'">
                <xsl:value-of select="$Txt_geborenv"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$Txt_geborenm"/>
            </xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
      <xsl:if test="(not(EVENTS/BIRTH/@date or EVENTS/BIRTH/@place or EVENTS/DEATH/@ovl=1)) and EVENTS/BAPT">
        <xsl:if test="$vet=0">
          <xsl:text>, </xsl:text>
        </xsl:if>
        <xsl:if test="$vet=1">
          <xsl:text> </xsl:text><xsl:value-of select="$Txt_isvvt"/><xsl:text> </xsl:text>
        </xsl:if>
        <xsl:choose>
          <xsl:when test="PERSONAL/@sex='V'">
            <xsl:value-of select="$Txt_gedooptv"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$Txt_gedooptm"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
      <xsl:choose>
	    <xsl:when test="EVENTS/BIRTH/@date or EVENTS/BIRTH/@place">
	      <xsl:call-template name="printDatum">
	        <xsl:with-param name="datum"><xsl:value-of select="EVENTS/BIRTH/@date"/></xsl:with-param>
	        <xsl:with-param name="onz"><xsl:value-of select="EVENTS/BIRTH/@onz"/></xsl:with-param>
          </xsl:call-template>
      	  <xsl:if test="EVENTS/BIRTH/BIRTTIME/text()">
            <xsl:text> </xsl:text><xsl:value-of select="$Txt_om"/><xsl:text> </xsl:text><xsl:value-of select="EVENTS/BIRTH/BIRTTIME"/>
      	  </xsl:if>
      	  <xsl:if test="string-length(EVENTS/BIRTH/@place) != 0">
            <xsl:text> </xsl:text><xsl:value-of select="$Txt_inplaats"/><xsl:text> </xsl:text><xsl:value-of select="EVENTS/BIRTH/@place"/>
      	  </xsl:if>
        </xsl:when>
        <xsl:otherwise>
          <xsl:if test="string-length(EVENTS/BAPT/@date) !=0">
	        <xsl:call-template name="printDatum">
	          <xsl:with-param name="datum"><xsl:value-of select="EVENTS/BAPT/@date"/></xsl:with-param>
	          <xsl:with-param name="onz"><xsl:value-of select="EVENTS/BAPT/@onz"/></xsl:with-param>
    	    </xsl:call-template>
  	        <xsl:if test="EVENTS/BAPT/BAPTTIME/text()">
    	      <xsl:text> </xsl:text><xsl:value-of select="$Txt_om"/><xsl:text> </xsl:text><xsl:value-of select="EVENTS/BAPT/BAPTTIME"/>
  	        </xsl:if>
  	        <xsl:if test="string-length(EVENTS/BAPT/@place) != 0">
              <xsl:text> </xsl:text><xsl:value-of select="$Txt_inplaats"/><xsl:text> </xsl:text><xsl:value-of select="EVENTS/BAPT/@place"/>
  	        </xsl:if>
	      </xsl:if>
        </xsl:otherwise>
     </xsl:choose>
     <xsl:if test="$volledig =0 ">
       <xsl:text>. </xsl:text>
     </xsl:if>
    
  <xsl:if test="$volledig &gt;0 ">
    <xsl:if test="$parToonBron='2'">
      <xsl:if test="EVENTS/BIRTH/@src">
        <xsl:text> [</xsl:text><xsl:value-of select="$Txt_bron"/><xsl:text>: </xsl:text>
        <xsl:value-of select="EVENTS/BIRTH/@src" disable-output-escaping="yes"/>
        <xsl:text>]</xsl:text>
      </xsl:if>
    </xsl:if>
    <xsl:text>. </xsl:text>
<!--    <xsl:for-each select="EVENTS/BIRTH"> -->
      <!-- Nieuwe zin " Bij de geboorte woog Roos 2760 gram en was zij 49 centimeter lang." -->
<!--      <xsl:if test="BIRTWEIG">
        <xsl:text>Bij de geboorte woog </xsl:text>
        <xsl:call-template name="Roepnaam">
            <xsl:with-param name="link"><xsl:value-of select="$link"/></xsl:with-param>
            <xsl:with-param name="cap">0</xsl:with-param>
            <xsl:with-param name="naamwoord">1</xsl:with-param>
        </xsl:call-template>
        <xsl:text> </xsl:text><xsl:value-of select="BIRTWEIG"/>
        <xsl:text> gram</xsl:text>
        <xsl:if test="string-length(BIRTLENG) != 0">
          <xsl:text> en was </xsl:text>
          <xsl:call-template name="mv">
            <xsl:with-param name="sex"><xsl:value-of select="$mv"/></xsl:with-param>
            <xsl:with-param name="cap">0</xsl:with-param>
            <xsl:with-param name="naamwoord">1</xsl:with-param>
          </xsl:call-template>
          <xsl:text> </xsl:text><xsl:value-of select="BIRTLENG"/><xsl:text> centimeter lang</xsl:text>
        </xsl:if>
        <xsl:text>. </xsl:text>
      </xsl:if>
    </xsl:for-each> -->
    <xsl:if test="EVENTS/REGB">
      <xsl:value-of select="$Txt_Geboorteaangifte"/>
      <xsl:if test="string-length(EVENTS/REGB/@date) != 0">
        <xsl:call-template name="printDatum">
          <xsl:with-param name="datum"><xsl:value-of select="EVENTS/REGB/@date"/></xsl:with-param>
          <xsl:with-param name="onz"><xsl:value-of select="EVENTS/REGB/@onz"/></xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <xsl:if test="$parToonBron='2'">
          <xsl:if test="EVENTS/REGB/@src">
            <xsl:text> [</xsl:text><xsl:value-of select="$Txt_bron"/><xsl:text>: </xsl:text>
            <xsl:value-of select="EVENTS/REGB/@src" disable-output-escaping="yes"/>
            <xsl:text>]</xsl:text>
          </xsl:if>
      </xsl:if>
      <xsl:text>. </xsl:text>
      <xsl:if test="$parToonGetuige='2'">
        <xsl:if test="count(EVENTS/REGB/WITN) &gt; 0">
          <xsl:value-of select="$Txt_Bij_de_geboorteaangifte"/>
            <xsl:if test="count(EVENTS/REGB/WITN) =1">
              <xsl:value-of select="$Txt_Getuige_aanwezig"/><xsl:text>: </xsl:text>
            </xsl:if>
            <xsl:if test="count(EVENTS/REGB/WITN) &gt; 1">
              <xsl:value-of select="$Txt_Getuigen_aanwezig"/><xsl:text>: </xsl:text>
            </xsl:if>
        </xsl:if>
        <xsl:variable name="nr_witn">
          <xsl:value-of select="count(EVENTS/REGB/WITN)"/>
        </xsl:variable>
        <xsl:for-each select="EVENTS/REGB/WITN">
          <xsl:call-template name="GetuigeWeergave">
            <xsl:with-param name="nr_witn"><xsl:value-of select="$nr_witn"/></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
      </xsl:if>
    </xsl:if>

    <!-- Nieuwe zin "Hij is gedoopt op maandag 1 januari 1980 te Woerden -->
    <xsl:for-each select="EVENTS/BAPT">
<!-- ==== Maak onderscheid tussen situatie met wel en met geen geboortegegevens -->
      <xsl:if test="../BIRTH/@date or ../BIRTH/@place or EVENTS/DEATH/@ovl=1">
        <xsl:call-template name="mv">
          <xsl:with-param name="sex"><xsl:value-of select="$mv"/></xsl:with-param>
          <xsl:with-param name="cap">1</xsl:with-param>
            <xsl:with-param name="naamwoord">1</xsl:with-param>
        </xsl:call-template>
        <xsl:text> </xsl:text><xsl:value-of select="$Txt_isvvt"/><xsl:text> </xsl:text>
        <xsl:choose>
          <xsl:when test="PERSONAL/@sex='V'">
            <xsl:value-of select="$Txt_gedooptv"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$Txt_gedooptm"/>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="@date = ../BIRTH/@date">
          <xsl:text> </xsl:text><xsl:value-of select="$Txt_opdezelfdedag"/>
        </xsl:if>
        <xsl:if test="(not (../BIRTH/@date)) or @date != ../BIRTH/@date">
          <xsl:if test="string-length(@date) != 0">
            <xsl:call-template name="printDatum">
              <xsl:with-param name="datum"><xsl:value-of select="@date"/></xsl:with-param>
              <xsl:with-param name="onz"><xsl:value-of select="@onz"/></xsl:with-param>
            </xsl:call-template>
          </xsl:if>
        </xsl:if>
        <xsl:if test="string-length(@place) != 0">
          <xsl:text> </xsl:text><xsl:value-of select="$Txt_te"/><xsl:text> </xsl:text><xsl:value-of select="@place"/>
        </xsl:if>
      </xsl:if>
      <xsl:if test="$parToonBron='2'">
        <xsl:if test="@src">
          <xsl:text> [</xsl:text><xsl:value-of select="$Txt_bron"/><xsl:text>: </xsl:text>
          <xsl:value-of select="@src" disable-output-escaping="yes"/>
          <xsl:text>]</xsl:text>
        </xsl:if>
      </xsl:if>
      <xsl:if test="../BIRTH/@date or ../BIRTH/@place or EVENTS/DEATH/@ovl=1">
        <xsl:text>. </xsl:text>
      </xsl:if>
      <xsl:if test="$parToonGetuige='2'">
        <xsl:if test="count(WITN) &gt; 0">
          <xsl:value-of select="$Txt_Bij_de_doop"/>
            <xsl:if test="count(WITN) =1">
              <xsl:value-of select="$Txt_Getuige_aanwezig"/><xsl:text>: </xsl:text>
            </xsl:if>
            <xsl:if test="count(WITN) &gt; 1">
              <xsl:value-of select="$Txt_Getuigen_aanwezig"/><xsl:text>: </xsl:text>
            </xsl:if>
        </xsl:if>
        <xsl:variable name="nr_witn">
          <xsl:value-of select="count(WITN)"/>
        </xsl:variable>
        <xsl:for-each select="WITN">
          <xsl:call-template name="GetuigeWeergave">
            <xsl:with-param name="nr_witn"><xsl:value-of select="$nr_witn"/></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
      </xsl:if>
    </xsl:for-each>
    
    <xsl:if test="$parToonNotitie='2'">
	  <xsl:if test="EVENTS/BIRTH/NOTE">
	    <br /><u><xsl:value-of select="$Txt_Notitie"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_bij_de_geboorte_van"/>
	    <xsl:call-template name="Roepnaam">
          <xsl:with-param name="link"><xsl:value-of select="$link"/></xsl:with-param>
          <xsl:with-param name="cap">0</xsl:with-param>
          <xsl:with-param name="naamwoord">3</xsl:with-param>
	    </xsl:call-template>:</u>
        <i><xsl:text> </xsl:text>
        <xsl:value-of select="EVENTS/BIRTH/NOTE" disable-output-escaping="yes"/>
	    </i>
	    <br />
   	  </xsl:if>
    </xsl:if>
  
    <!--
    Jan is overleden op vrijdag 24 mei 2002 om 15:15 in Tiel, 69 jaar oud
    (oorzaak: Aan de gevolgen van de ziekte PSP).
    -->
    <xsl:for-each select="EVENTS/DEATH">
     <xsl:if test="not(@ovl=1)">
      <xsl:if test="string-length($varTekstOVL) = 0">
        <xsl:call-template name="Roepnaam">
          <xsl:with-param name="link"><xsl:value-of select="$link"/></xsl:with-param>
          <xsl:with-param name="cap">1</xsl:with-param>
          <xsl:with-param name="naamwoord">1</xsl:with-param>
        </xsl:call-template>
        <xsl:text> </xsl:text>
        <xsl:choose>
          <xsl:when test="../../PERSONAL/@sex='V'">
            <xsl:value-of select="$Txt_isoverledenv"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$Txt_isoverledenm"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
      <xsl:if test="string-length($varTekstOVL) != 0">
        <xsl:choose>
          <xsl:when test="string-length(concat(@date,@place,@cause,../../PERSONAL/@age))!=0 or (@src and $parToonBron='2')">
            <xsl:call-template name="Roepnaam">
              <xsl:with-param name="link"><xsl:value-of select="$link"/></xsl:with-param>
          	  <xsl:with-param name="cap">1</xsl:with-param>
          	  <xsl:with-param name="naamwoord">1</xsl:with-param>
            </xsl:call-template>
        <xsl:text> </xsl:text>
        <xsl:choose>
          <xsl:when test="../../PERSONAL/@sex='V'">
            <xsl:value-of select="$Txt_isoverledenv"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$Txt_isoverledenm"/>
          </xsl:otherwise>
        </xsl:choose>
          </xsl:when>
          <xsl:otherwise>
            <xsl:choose>
              <xsl:when test="@dyear">
                <xsl:call-template name="Roepnaam">
                  <xsl:with-param name="link"><xsl:value-of select="$link"/></xsl:with-param>
          		  <xsl:with-param name="cap">1</xsl:with-param>
          		  <xsl:with-param name="naamwoord">1</xsl:with-param>
                </xsl:call-template>
                <xsl:text> </xsl:text><xsl:value-of select="$varTekstOVL"/>
              </xsl:when>
              <xsl:otherwise>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
<!-- ==== op resp. in, alleen als datum bekend is -->
      <xsl:if test="string-length(@date) != 0">
        <xsl:call-template name="printDatum">
	  <xsl:with-param name="datum"><xsl:value-of select="@date"/></xsl:with-param>
	  <xsl:with-param name="onz"><xsl:value-of select="@onz"/></xsl:with-param>
       	</xsl:call-template>
      </xsl:if>
      <xsl:if test="string-length(@place) != 0">
      <xsl:text> </xsl:text><xsl:value-of select="$Txt_te"/><xsl:text> </xsl:text><xsl:value-of select="@place"/>
      </xsl:if>
      <xsl:if test="string-length(@caus) != 0">
        <xsl:text> (</xsl:text><xsl:value-of select="$Txt_oorzaak"/><xsl:text>: </xsl:text>
          <xsl:value-of select="@caus"/>
        <xsl:text>)</xsl:text>
      </xsl:if>
<!-- ==== Leeftijd bij overlijden == -->
      <xsl:if test="../../PERSONAL/@age">
        <xsl:text>, </xsl:text>
        <xsl:value-of select="$Txt_opdeleeftijdvanvoor"/>
        <xsl:call-template name="OnzTekst">
         <xsl:with-param name="onz"><xsl:value-of select="../../PERSONAL/@onz"/></xsl:with-param>
        </xsl:call-template>
        <xsl:choose>
          <xsl:when test="../../PERSONAL/@of=1">
        	<xsl:value-of select="../../PERSONAL/@age - 1"/>
        	<xsl:text> </xsl:text><xsl:value-of select="$Txt_of"/><xsl:text> </xsl:text>
        	<xsl:value-of select="../../PERSONAL/@age"/>
          </xsl:when>
          <xsl:otherwise>
        	<xsl:value-of select="../../PERSONAL/@age"/>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="$Txt_opdeleeftijdvanna"/>
      </xsl:if>
      
      <xsl:if test="$parToonBron='2'">
        <xsl:if test="@src">
          <xsl:text> [</xsl:text><xsl:value-of select="$Txt_bron"/><xsl:text>: </xsl:text>
          <xsl:value-of select="@src" disable-output-escaping="yes"/>
          <xsl:text>]</xsl:text>
        </xsl:if>
      </xsl:if>
      <xsl:if test="string-length($varTekstOVL) = 0 or (string-length(concat(@date,@place,@cause,../../PERSONAL/@age))!=0 or (@src and $parToonBron='2')) or (@dyear)">
        <xsl:text>. </xsl:text>
      </xsl:if>
     </xsl:if>
    </xsl:for-each>
    
    <!-- Overlijdensaangifte -->
    
    <xsl:if test="EVENTS/REG/@date or (EVENTS/REG/@src and $parToonBron='2') or (EVENTS/REG/WITN and $parToonGetuige='2')">
      <xsl:value-of select="$Txt_Overlijdenaangifte"/>
      <xsl:if test="string-length(EVENTS/REG/@date) != 0">
        <xsl:call-template name="printDatum">
          <xsl:with-param name="datum"><xsl:value-of select="EVENTS/REG/@date"/></xsl:with-param>
          <xsl:with-param name="onz"><xsl:value-of select="EVENTS/REG/@onz"/></xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <xsl:if test="$parToonBron='2'">
          <xsl:if test="EVENTS/REG/@src">
            <xsl:text> [</xsl:text><xsl:value-of select="$Txt_bron"/><xsl:text>: </xsl:text>
            <xsl:value-of select="EVENTS/REG/@src" disable-output-escaping="yes"/>
            <xsl:text>]</xsl:text>
          </xsl:if>
      </xsl:if>
      <xsl:text>. </xsl:text>
      <xsl:if test="$parToonGetuige='2'">
        <xsl:if test="count(EVENTS/REG/WITN) &gt; 0">
          <xsl:value-of select="$Txt_Bij_de_overlijdensaangifte"/>
            <xsl:if test="count(EVENTS/REG/WITN) =1">
              <xsl:value-of select="$Txt_Getuige_aanwezig"/><xsl:text>: </xsl:text>
            </xsl:if>
            <xsl:if test="count(EVENTS/REG/WITN) &gt; 1">
              <xsl:value-of select="$Txt_Getuigen_aanwezig"/><xsl:text>: </xsl:text>
            </xsl:if>
        </xsl:if>
        <xsl:variable name="nr_witn">
          <xsl:value-of select="count(EVENTS/REG/WITN)"/>
        </xsl:variable>
        <xsl:for-each select="EVENTS/REG/WITN">
          <xsl:call-template name="GetuigeWeergave">
            <xsl:with-param name="nr_witn"><xsl:value-of select="$nr_witn"/></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
      </xsl:if>
    </xsl:if>
    
    <!-- Hij is begraven op woensdag 22 mei 2002 in Papekop. -->
    <xsl:for-each select="EVENTS/BURI">
      <xsl:if test="@how!=2 or string-length(concat(@date,@place))!=0 or (WITN and $parToonGetuige='2') or (@src and $parToonBron='2')">
        <xsl:if test="@how=1 or @how=2 or @how=3 or @how=4">
          <xsl:call-template name="mv">
            <xsl:with-param name="sex"><xsl:value-of select="$mv"/></xsl:with-param>
            <xsl:with-param name="cap">1</xsl:with-param>
            <xsl:with-param name="naamwoord">1</xsl:with-param>
          </xsl:call-template>
          <xsl:text> </xsl:text><xsl:value-of select="$Txt_isvvt"/><xsl:text> </xsl:text>
          <xsl:choose>
            <xsl:when test="@how=1">
              <xsl:choose>
                <xsl:when test="../../PERSONAL/@sex='V'">
                  <xsl:value-of select="$Txt_gecremeerdv"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="$Txt_gecremeerdm"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:when test="@how=2">
              <xsl:choose>
                <xsl:when test="../../PERSONAL/@sex='V'">
                  <xsl:value-of select="$Txt_begravenv"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="$Txt_begravenm"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:when test="@how=3">
              <xsl:value-of select="$Txt_aan_wetenschap"/>
            </xsl:when>
            <xsl:when test="@how=4">
              <xsl:choose>
                <xsl:when test="../../PERSONAL/@sex='V'">
                  <xsl:value-of select="$Txt_vermistv"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="$Txt_vermistm"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
          </xsl:choose>
        </xsl:if>
<!--        <xsl:if test="@how=5">
          <xsl:call-template name="mv">
            <xsl:with-param name="sex"><xsl:value-of select="$mv"/></xsl:with-param>
            <xsl:with-param name="cap">1</xsl:with-param>
            <xsl:with-param name="naamwoord">2</xsl:with-param>
          </xsl:call-template>
          <xsl:if test="@how=5"><xsl:text> lijkbezorging vond plaats</xsl:text></xsl:if>
        </xsl:if> -->

<!-- === Maak onderscheid tussen op en in == -->
        <xsl:if test="string-length(@date) !=0">
          <xsl:call-template name="printDatum">
	        <xsl:with-param name="datum"><xsl:value-of select="@date"/></xsl:with-param>
	        <xsl:with-param name="onz"><xsl:value-of select="@onz"/></xsl:with-param>
          </xsl:call-template>
        </xsl:if>
        <xsl:if test="string-length(@place) != 0">
          <xsl:text> </xsl:text><xsl:value-of select="$Txt_te"/><xsl:text> </xsl:text><xsl:value-of select="@place"/>
        </xsl:if>
        <xsl:if test="$parToonBron='2'">
          <xsl:if test="@src">
            <xsl:text> [</xsl:text><xsl:value-of select="$Txt_bron"/><xsl:text>: </xsl:text>
            <xsl:value-of select="@src" disable-output-escaping="yes"/>
            <xsl:text>]</xsl:text>
          </xsl:if>
        </xsl:if>
        <xsl:text>. </xsl:text>
      </xsl:if>
      <xsl:if test="@how=1 or @how=2">
      <xsl:if test="$parToonGetuige='2'">
        <xsl:if test="count(WITN) &gt; 0">
        <xsl:choose>
          <xsl:when test="@how=1"><xsl:value-of select="$Txt_Bij_de_crematie"/></xsl:when>
          <xsl:when test="@how=2"><xsl:value-of select="$Txt_Bij_de_begrafenis"/></xsl:when>
        </xsl:choose>
        <xsl:if test="count(WITN) =1">
          <xsl:value-of select="$Txt_Getuige_aanwezig"/><xsl:text>: </xsl:text>
        </xsl:if>
          <xsl:if test="count(WITN) &gt; 1">
            <xsl:value-of select="$Txt_Getuigen_aanwezig"/><xsl:text>: </xsl:text>
          </xsl:if>
        </xsl:if>
        <xsl:variable name="nr_witn">
          <xsl:value-of select="count(WITN)"/>
        </xsl:variable>
        <xsl:for-each select="WITN">
          <xsl:call-template name="GetuigeWeergave">
            <xsl:with-param name="nr_witn"><xsl:value-of select="$nr_witn"/></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
      </xsl:if>
      </xsl:if>
    </xsl:for-each>
  
    <xsl:if test="$parToonNotitie='2'">
	  <xsl:if test="EVENTS/DEATH/NOTE">
	    <br /><u><xsl:value-of select="$Txt_Notitie"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_bij_het_overlijden_van"/>
	    <xsl:call-template name="Roepnaam">
          <xsl:with-param name="link"><xsl:value-of select="$link"/></xsl:with-param>
          <xsl:with-param name="cap">0</xsl:with-param>
          <xsl:with-param name="naamwoord">3</xsl:with-param>
	    </xsl:call-template>:</u>
        <i><xsl:text> </xsl:text>
        <xsl:value-of select="EVENTS/DEATH/NOTE" disable-output-escaping="yes"/>
	    </i>
	    <br />
   	  </xsl:if>
    </xsl:if>
  
    <xsl:if test="$parToonNotitie='2'">
	  <xsl:if test="PERSONAL/NOTE">
	    <br /><u><xsl:value-of select="$Txt_Notitie"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_bij_notitie"/>
	    <xsl:call-template name="Roepnaam">
          <xsl:with-param name="link"><xsl:value-of select="$link"/></xsl:with-param>
          <xsl:with-param name="cap">0</xsl:with-param>
          <xsl:with-param name="naamwoord">3</xsl:with-param>
	    </xsl:call-template>:</u>
        <i><xsl:text> </xsl:text>
        <xsl:value-of select="PERSONAL/NOTE" disable-output-escaping="yes"/>
	    </i>
	    <br />
   	  </xsl:if>
    </xsl:if>
  
  <xsl:call-template name="Feiten"/>
  <xsl:call-template name="GetuigeBij"/>

  </xsl:if> <!-- volledig gt 0 -->

    <xsl:if test="$volledig=1 or ($LijstWoord!='B' and $mv!=$LijstWoord)">

      <xsl:for-each select="RELATIONS">
        <xsl:for-each select="RELA">
<!-- ==== test op dummy relatie met link=0 -->
         <xsl:if test="@link!=0">
          <br />
          <xsl:call-template name="Roepnaam">
              <xsl:with-param name="link"><xsl:value-of select="$link"/></xsl:with-param>
          	  <xsl:with-param name="cap">1</xsl:with-param>
          	  <xsl:with-param name="naamwoord">1</xsl:with-param>
          </xsl:call-template>
          <xsl:text> </xsl:text>
          <xsl:choose>
<!-- ==== vul juiste relatietype in -->
            <xsl:when test="@type=1"><xsl:value-of select="$Txt_trouwde"/></xsl:when>
            <xsl:when test="@type=2">
              <xsl:choose>
                <xsl:when test="../../PERSONAL/@sex = 'V'">
                  <xsl:value-of select="$Txt_ging_partnerschap_aan_v"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="$Txt_ging_partnerschap_aan_m"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:when test="@type=3"><xsl:value-of select="$Txt_ging_samenleven"/></xsl:when>
            <xsl:otherwise><xsl:value-of select="$Txt_kreeg_relatie"/></xsl:otherwise>
          </xsl:choose>
          <xsl:text> </xsl:text>
          <xsl:choose>
            <xsl:when test="@type=1"><xsl:value-of select="$Txt_trouwdemet"/></xsl:when>
            <xsl:otherwise><xsl:value-of select="$Txt_met"/></xsl:otherwise>
          </xsl:choose>
          <xsl:text> </xsl:text>
          <xsl:variable name="relalink" select="@link"/>
          <xsl:for-each select="//PERSOON[@link=$relalink]">
            <xsl:variable name="rela-mv" select="PERSONAL/@sex"/>
            <xsl:for-each select="PERSONAL">
              <xsl:for-each select="NAME">
                <xsl:call-template name="VolledigeNaam">
                  <xsl:with-param name="link" select="$relalink"/>
                  <xsl:with-param name="first" select="@first"/>
                  <xsl:with-param name="pref" select="@pref"/>
                  <xsl:with-param name="nick" select="@nick"/>
                  <xsl:with-param name="surn" select="@surn"/>
                  <xsl:with-param name="vet" select="0"/>
                  <xsl:with-param name="voluit" select="1"/>
                  <xsl:with-param name="priv" select="../../@priv"/>
                </xsl:call-template>
              </xsl:for-each>
            </xsl:for-each>
          </xsl:for-each>
<!-- ==== Maak onderscheid tussen op en in === -->
          <xsl:if test="string-length(BEGIN/@date) != 0">
            <xsl:text> </xsl:text>
	        <xsl:call-template name="printDatum">
	          <xsl:with-param name="datum"><xsl:value-of select="BEGIN/@date"/></xsl:with-param>
		      <xsl:with-param name="onz"><xsl:value-of select="BEGIN/@onz"/></xsl:with-param>
            </xsl:call-template>
          </xsl:if>
          <xsl:if test="BEGIN/@place != ''">
            <xsl:text> </xsl:text><xsl:value-of select="$Txt_te"/><xsl:text> </xsl:text>
            <xsl:value-of select="BEGIN/@place"/>
          </xsl:if>
      	  <xsl:if test="$parToonBron='2'">
            <xsl:if test="@src">
              <xsl:text> [</xsl:text><xsl:value-of select="$Txt_bron"/><xsl:text>: </xsl:text>
              <xsl:value-of select="@src" disable-output-escaping="yes"/>
              <xsl:text>]</xsl:text>
            </xsl:if>
          </xsl:if>
          
          <xsl:if test="MARL">
            <xsl:text>, </xsl:text><xsl:value-of select="$Txt_nadat_ondertrouw"/>
            <xsl:if test="string-length(MARL/@date) != 0">
            <xsl:call-template name="printDatum">
              <xsl:with-param name="datum"><xsl:value-of select="MARL/@date"/></xsl:with-param>
              <xsl:with-param name="onz"><xsl:value-of select="MARL/@onz"/></xsl:with-param>
            </xsl:call-template>
            </xsl:if>
            <xsl:if test="MARL/@place != ''">
              <xsl:text> </xsl:text><xsl:value-of select="$Txt_te"/><xsl:text> </xsl:text>
              <xsl:value-of select="MARL/@place"/>
            </xsl:if>
      	    <xsl:if test="$parToonBron='2'">
              <xsl:if test="MARL/@src">
                <xsl:text> [</xsl:text><xsl:value-of select="$Txt_bron"/><xsl:text>: </xsl:text>
                <xsl:value-of select="MARL/@src" disable-output-escaping="yes"/>
                <xsl:text>]</xsl:text>
              </xsl:if>
            </xsl:if>
          </xsl:if>
          <xsl:text>. </xsl:text>
          
          <xsl:if test="$parToonGetuige='2'">
            <xsl:if test="count(MARL/WITN) &gt; 0">
              <xsl:value-of select="$Txt_Bij_de_ondertrouw"/><xsl:text> </xsl:text>
                <xsl:if test="count(MARL/WITN) =1">
                  <xsl:value-of select="$Txt_Getuige_aanwezig"/><xsl:text>: </xsl:text>
                </xsl:if>
                <xsl:if test="count(MARL/WITN) &gt; 1">
                  <xsl:value-of select="$Txt_Getuigen_aanwezig"/><xsl:text>: </xsl:text>
                </xsl:if>
            </xsl:if>
            <xsl:variable name="nr_witn">
              <xsl:value-of select="count(MARL/WITN)"/>
            </xsl:variable>
            <xsl:for-each select="MARL/WITN">
              <xsl:call-template name="GetuigeWeergave">
                <xsl:with-param name="nr_witn"><xsl:value-of select="$nr_witn"/></xsl:with-param>
              </xsl:call-template>
            </xsl:for-each>
          </xsl:if>
          
          <xsl:if test="$parToonGetuige='2'">
            <xsl:if test="count(BEGIN/WITN) &gt; 0">
              <xsl:value-of select="$Txt_Bij_burgelijk_huwelijk"/><xsl:text> </xsl:text>
                <xsl:if test="count(BEGIN/WITN) =1">
                  <xsl:value-of select="$Txt_Getuige_aanwezig"/><xsl:text>: </xsl:text>
                </xsl:if>
                <xsl:if test="count(BEGIN/WITN) &gt; 1">
                  <xsl:value-of select="$Txt_Getuigen_aanwezig"/><xsl:text>: </xsl:text>
                </xsl:if>
            </xsl:if>
            <xsl:variable name="nr_witn">
              <xsl:value-of select="count(BEGIN/WITN)"/>
            </xsl:variable>
            <xsl:for-each select="BEGIN/WITN">
              <xsl:call-template name="GetuigeWeergave">
                <xsl:with-param name="nr_witn"><xsl:value-of select="$nr_witn"/></xsl:with-param>
              </xsl:call-template>
            </xsl:for-each>
          </xsl:if>
          
          <xsl:if test="MARC">
            <xsl:if test="@type=1">
              <xsl:value-of select="$Txt_Kerkelijk_huwelijk_vond_plaats"/>
            </xsl:if>
            <xsl:if test="@type=2">
              <xsl:value-of select="$Txt_voornemen_geregistreerd_partner"/>
            </xsl:if>
            <xsl:if test="@type=3">
              <xsl:value-of select="$Txt_samenlevingscontract_getekend"/>
            </xsl:if>
            <xsl:if test="string-length(MARC/@date) != 0">
              <xsl:text> </xsl:text>
              <xsl:call-template name="printDatum">
                <xsl:with-param name="datum"><xsl:value-of select="MARC/@date"/></xsl:with-param>
                <xsl:with-param name="onz"><xsl:value-of select="MARC/@onz"/></xsl:with-param>
              </xsl:call-template>
            </xsl:if>
            <xsl:if test="MARC/@place != ''">
              <xsl:text> </xsl:text><xsl:value-of select="$Txt_te"/><xsl:text> </xsl:text>
              <xsl:value-of select="MARC/@place"/>
            </xsl:if>
      	    <xsl:if test="$parToonBron='2'">
              <xsl:if test="MARC/@src">
                <xsl:text> [</xsl:text><xsl:value-of select="$Txt_bron"/><xsl:text>: </xsl:text>
                <xsl:value-of select="MARC/@src" disable-output-escaping="yes"/>
                <xsl:text>]</xsl:text>
              </xsl:if>
            </xsl:if>
            <xsl:text>. </xsl:text>
          </xsl:if>
          
          <xsl:if test="$parToonGetuige='2'">
            <xsl:if test="count(MARC/WITN) &gt; 0">
              <xsl:value-of select="$Txt_Bij_kerkelijk_huwelijk"/><xsl:text> </xsl:text>
                <xsl:if test="count(MARC/WITN) =1">
                  <xsl:value-of select="$Txt_Getuige_aanwezig"/><xsl:text>: </xsl:text>
                </xsl:if>
                <xsl:if test="count(MARC/WITN) &gt; 1">
                  <xsl:value-of select="$Txt_Getuigen_aanwezig"/><xsl:text>: </xsl:text>
                </xsl:if>
            </xsl:if>
            <xsl:variable name="nr_witn">
              <xsl:value-of select="count(MARC/WITN)"/>
            </xsl:variable>
            <xsl:for-each select="MARC/WITN">
              <xsl:call-template name="GetuigeWeergave">
                <xsl:with-param name="nr_witn"><xsl:value-of select="$nr_witn"/></xsl:with-param>
              </xsl:call-template>
            </xsl:for-each>
          </xsl:if>
          
          <xsl:if test="$parToonNotitie='2'">
	        <xsl:if test="NOTE">
	          <br /><u><xsl:value-of select="$Txt_Notitie"/><xsl:text> </xsl:text>
              <xsl:choose>
                <xsl:when test="@type=1"><xsl:value-of select="$Txt_bij_het_huwelijk_van"/></xsl:when>
                <xsl:when test="@type=2"><xsl:value-of select="$Txt_bij_het_partnerschap_van"/></xsl:when>
                <xsl:when test="@type=3"><xsl:value-of select="$Txt_bij_het_samenleven_van"/></xsl:when>
                <xsl:otherwise><xsl:value-of select="$Txt_bij_de_relatie_van"/></xsl:otherwise>
              </xsl:choose>
	          <xsl:call-template name="Roepnaam">
                <xsl:with-param name="link"><xsl:value-of select="$link"/></xsl:with-param>
          		<xsl:with-param name="cap">0</xsl:with-param>
          		<xsl:with-param name="naamwoord">3</xsl:with-param>
	          </xsl:call-template>
	          <xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text>
	          <xsl:call-template name="Roepnaam">
                <xsl:with-param name="link"><xsl:value-of select="$relalink"/></xsl:with-param>
          		<xsl:with-param name="cap">0</xsl:with-param>
          		<xsl:with-param name="naamwoord">3</xsl:with-param>
	          </xsl:call-template>
	          :</u>
              <i><xsl:text> </xsl:text>
              <xsl:value-of select="NOTE" disable-output-escaping="yes"/>
	          </i>
	          <br />
   	        </xsl:if>
          </xsl:if>
  
          <xsl:for-each select="//PERSOON[@link=$relalink]">
            <xsl:variable name="rela-mv" select="PERSONAL/@sex"/>
            <xsl:for-each select="EVENTS/BIRTH">
              <xsl:if test="@date or @place">
	            <xsl:call-template name="Roepnaam">
                  <xsl:with-param name="link"><xsl:value-of select="$relalink"/></xsl:with-param>
          		  <xsl:with-param name="cap">1</xsl:with-param>
          		  <xsl:with-param name="naamwoord">1</xsl:with-param>
	            </xsl:call-template>
   	            <xsl:text> </xsl:text><xsl:value-of select="$Txt_isvt"/><xsl:text> </xsl:text>
            <xsl:text> </xsl:text>
            <xsl:choose>
              <xsl:when test="$rela-mv='V'">
                <xsl:value-of select="$Txt_geborenv"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$Txt_geborenm"/>
            </xsl:otherwise>
            </xsl:choose>
                <xsl:if test="string-length(@date) != 0">
<!-- ==== Maak onderscheid tussen op en in === -->
	              <xsl:call-template name="printDatum">
		            <xsl:with-param name="datum"><xsl:value-of select="@date"/></xsl:with-param>
		            <xsl:with-param name="onz"><xsl:value-of select="@onz"/></xsl:with-param>
        	      </xsl:call-template>
                </xsl:if>
                <xsl:if test="BIRTTIME/text()">
                  <xsl:text> </xsl:text><xsl:value-of select="$Txt_om"/><xsl:text> </xsl:text><xsl:value-of select="BIRTTIME"/>
                </xsl:if>
                <xsl:if test="string-length(@place) != 0">
                  <xsl:text> </xsl:text><xsl:value-of select="$Txt_te"/><xsl:text> </xsl:text><xsl:value-of select="@place"/>
                </xsl:if>
            <xsl:if test="$parToonBron='2'">
              <xsl:if test="@src">
                <xsl:text> [</xsl:text><xsl:value-of select="$Txt_bron"/><xsl:text>: </xsl:text>
                <xsl:value-of select="@src" disable-output-escaping="yes"/>
                <xsl:text>]</xsl:text>
              </xsl:if>
            </xsl:if>
                <xsl:text>. </xsl:text>
              </xsl:if>
            </xsl:for-each>
            <xsl:if test="FATHER or MOTHER">
              <xsl:call-template name="mv">
                <xsl:with-param name="sex"><xsl:value-of select="$rela-mv"/></xsl:with-param>
                <xsl:with-param name="cap">1</xsl:with-param>
            	<xsl:with-param name="naamwoord">1</xsl:with-param>
              </xsl:call-template>
                <xsl:text> </xsl:text><xsl:value-of select="$Txt_is"/><xsl:text> </xsl:text>
                <xsl:choose>
                  <xsl:when test="$rela-mv = 'V'"><xsl:value-of select="$Txt_de_v"/></xsl:when>
                  <xsl:otherwise><xsl:value-of select="$Txt_de_m"/></xsl:otherwise>
                </xsl:choose>
              <xsl:text> </xsl:text>
              <xsl:call-template name="dz">
                <xsl:with-param name="sex"><xsl:value-of select="$rela-mv"/></xsl:with-param>
                <xsl:with-param name="cap">0</xsl:with-param>
              </xsl:call-template>
<!-- Deze regel voor FATHER-selectie: als geen vader dan zou er komen te staan "als zoon/dochter Moeder" -->
              <xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text>  </xsl:text>
              <xsl:for-each select="FATHER">
                <xsl:variable name="father-link" select="@link"/>
                <xsl:for-each select="//PERSOON[@link=$father-link]">
                  <xsl:for-each select="PERSONAL">
                    <xsl:for-each select="NAME">
                      <xsl:call-template name="VolledigeNaam">
                        <xsl:with-param name="link" select="$father-link"/>
                        <xsl:with-param name="first" select="@first"/>
                        <xsl:with-param name="pref" select="@pref"/>
                        <xsl:with-param name="nick" select="@nick"/>
                        <xsl:with-param name="surn" select="@surn"/>
                        <xsl:with-param name="vet" select="0"/>
                        <xsl:with-param name="voluit" select="1"/>
                        <xsl:with-param name="priv" select="../../@priv"/>
                      </xsl:call-template>
                    </xsl:for-each>
                  </xsl:for-each>
                </xsl:for-each>
              </xsl:for-each>
              <xsl:for-each select="MOTHER">
                <xsl:if test="../FATHER">
                  <xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text>  </xsl:text><xsl:value-of select="$Txt_vantweedeouder"/><xsl:text>  </xsl:text>
                </xsl:if>
                <xsl:variable name="mother-link" select="@link"/>
                <xsl:for-each select="//PERSOON[@link=$mother-link]">
                  <xsl:for-each select="PERSONAL">
                    <xsl:for-each select="NAME">
                      <xsl:call-template name="VolledigeNaam">
                        <xsl:with-param name="link" select="$mother-link"/>
                        <xsl:with-param name="first" select="@first"/>
                        <xsl:with-param name="pref" select="@pref"/>
                        <xsl:with-param name="nick" select="@nick"/>
                        <xsl:with-param name="surn" select="@surn"/>
                        <xsl:with-param name="vet" select="0"/>
                        <xsl:with-param name="voluit" select="1"/>
                        <xsl:with-param name="priv" select="../../@priv"/>
                      </xsl:call-template>
                    </xsl:for-each>
                  </xsl:for-each>
                </xsl:for-each>
              </xsl:for-each>
            </xsl:if>
            <xsl:if test="FATHER or MOTHER">
              <xsl:text>. </xsl:text>
            </xsl:if>
            
    <xsl:if test="EVENTS/REGB">
      <xsl:value-of select="$Txt_Geboorteaangifte"/>
      <xsl:if test="string-length(EVENTS/REGB/@date) != 0">
        <xsl:call-template name="printDatum">
          <xsl:with-param name="datum"><xsl:value-of select="EVENTS/REGB/@date"/></xsl:with-param>
          <xsl:with-param name="onz"><xsl:value-of select="EVENTS/REGB/@onz"/></xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <xsl:if test="$parToonBron='2'">
          <xsl:if test="EVENTS/REGB/@src">
            <xsl:text> [</xsl:text><xsl:value-of select="$Txt_bron"/><xsl:text>: </xsl:text>
            <xsl:value-of select="EVENTS/REGB/@src" disable-output-escaping="yes"/>
            <xsl:text>]</xsl:text>
          </xsl:if>
      </xsl:if>
      <xsl:text>. </xsl:text>
      <xsl:if test="$parToonGetuige='2'">
        <xsl:if test="count(EVENTS/REGB/WITN) &gt; 0">
          <xsl:value-of select="$Txt_Bij_de_geboorteaangifte"/>
            <xsl:if test="count(EVENTS/REGB/WITN) =1">
              <xsl:value-of select="$Txt_Getuige_aanwezig"/><xsl:text>: </xsl:text>
            </xsl:if>
            <xsl:if test="count(EVENTS/REGB/WITN) &gt; 1">
              <xsl:value-of select="$Txt_Getuigen_aanwezig"/><xsl:text>: </xsl:text>
            </xsl:if>
        </xsl:if>
        <xsl:variable name="nr_witn">
          <xsl:value-of select="count(EVENTS/REGB/WITN)"/>
        </xsl:variable>
        <xsl:for-each select="EVENTS/REGB/WITN">
          <xsl:call-template name="GetuigeWeergave">
            <xsl:with-param name="nr_witn"><xsl:value-of select="$nr_witn"/></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
      </xsl:if>
    </xsl:if>

            <xsl:for-each select="EVENTS/BAPT">
              <xsl:call-template name="mv">
                <xsl:with-param name="sex"><xsl:value-of select="$rela-mv"/></xsl:with-param>
                <xsl:with-param name="cap">1</xsl:with-param>
            	<xsl:with-param name="naamwoord">1</xsl:with-param>
              </xsl:call-template>
      <xsl:text> </xsl:text><xsl:value-of select="$Txt_isvvt"/><xsl:text> </xsl:text>
            <xsl:choose>
              <xsl:when test="$rela-mv='V'">
                <xsl:value-of select="$Txt_gedooptv"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$Txt_gedooptm"/>
            </xsl:otherwise>
            </xsl:choose>
              <xsl:if test="@date = ../BIRTH/@date">
        <xsl:text> </xsl:text><xsl:value-of select="$Txt_opdezelfdedag"/>
              </xsl:if>
              <xsl:if test="not(@date = ../BIRTH/@date)">
                <xsl:if test="string-length(@date) != 0">
                  <xsl:call-template name="printDatum">
		            <xsl:with-param name="datum"><xsl:value-of select="@date"/></xsl:with-param>
		            <xsl:with-param name="onz"><xsl:value-of select="@onz"/></xsl:with-param>
		          </xsl:call-template>
       	        </xsl:if>
       	      </xsl:if>
		      <xsl:if test="string-length(@place) != 0">
    		    <xsl:text> </xsl:text><xsl:value-of select="$Txt_te"/><xsl:text> </xsl:text><xsl:value-of select="@place"/>
              </xsl:if>

      <xsl:if test="$parToonBron='2'">
        <xsl:if test="@src">
          <xsl:text> [</xsl:text><xsl:value-of select="$Txt_bron"/><xsl:text>: </xsl:text>
          <xsl:value-of select="@src" disable-output-escaping="yes"/>
          <xsl:text>]</xsl:text>
        </xsl:if>
      </xsl:if>
      <xsl:text>. </xsl:text>
            </xsl:for-each>
      <xsl:if test="$parToonGetuige='2'">
        <xsl:if test="count(EVENTS/BAPT/WITN) &gt; 0">
          <xsl:value-of select="$Txt_Bij_de_doop"/>
            <xsl:if test="count(EVENTS/BAPT/WITN) =1">
              <xsl:value-of select="$Txt_Getuige_aanwezig"/><xsl:text>: </xsl:text>
            </xsl:if>
            <xsl:if test="count(EVENTS/BAPT/WITN) &gt; 1">
              <xsl:value-of select="$Txt_Getuigen_aanwezig"/><xsl:text>: </xsl:text>
            </xsl:if>
        </xsl:if>
        <xsl:variable name="nr_witn">
          <xsl:value-of select="count(EVENTS/BAPT/WITN)"/>
        </xsl:variable>
        <xsl:for-each select="EVENTS/BAPT/WITN">
          <xsl:call-template name="GetuigeWeergave">
            <xsl:with-param name="nr_witn"><xsl:value-of select="$nr_witn"/></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
      </xsl:if>

    <xsl:if test="$parToonNotitie='2'">
	  <xsl:if test="EVENTS/BIRTH/NOTE">
	    <br /><u><xsl:value-of select="$Txt_Notitie"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_bij_de_geboorte_van"/>
	    <xsl:call-template name="Roepnaam">
          <xsl:with-param name="link"><xsl:value-of select="$relalink"/></xsl:with-param>
          <xsl:with-param name="cap">0</xsl:with-param>
          <xsl:with-param name="naamwoord">3</xsl:with-param>
	    </xsl:call-template>:</u>
        <i><xsl:text> </xsl:text>
        <xsl:value-of select="EVENTS/BIRTH/NOTE" disable-output-escaping="yes"/>
	    </i>
	    <br />
   	  </xsl:if>
    </xsl:if>
  
<!-- ==== Voeg eventuele overlijdensgegevens van partner toe -->
    	    <xsl:for-each select="EVENTS/DEATH">
              <xsl:if test="string-length($varTekstOVL) = 0">
                <xsl:call-template name="Roepnaam">
                  <xsl:with-param name="link"><xsl:value-of select="$relalink"/></xsl:with-param>
          		  <xsl:with-param name="cap">1</xsl:with-param>
          		  <xsl:with-param name="naamwoord">1</xsl:with-param>
                </xsl:call-template>
        <xsl:text> </xsl:text>
        <xsl:choose>
          <xsl:when test="../../PERSONAL/@sex='V'">
            <xsl:value-of select="$Txt_isoverledenv"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$Txt_isoverledenm"/>
          </xsl:otherwise>
        </xsl:choose>
              </xsl:if>
              <xsl:if test="string-length($varTekstOVL) != 0">
                <xsl:choose>
                  <xsl:when test="string-length(concat(@date,@place,@cause,../../PERSONAL/@age))!=0 or (@src and $parToonBron='2')">
                    <xsl:call-template name="Roepnaam">
                      <xsl:with-param name="link"><xsl:value-of select="$relalink"/></xsl:with-param>
          			  <xsl:with-param name="cap">1</xsl:with-param>
          			  <xsl:with-param name="naamwoord">1</xsl:with-param>
                    </xsl:call-template>
        <xsl:text> </xsl:text>
        <xsl:choose>
          <xsl:when test="../../PERSONAL/@sex='V'">
            <xsl:value-of select="$Txt_isoverledenv"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$Txt_isoverledenm"/>
          </xsl:otherwise>
        </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:choose>
                      <xsl:when test="@dyear">
                        <xsl:call-template name="Roepnaam">
                          <xsl:with-param name="link"><xsl:value-of select="$relalink"/></xsl:with-param>
          				  <xsl:with-param name="cap">1</xsl:with-param>
          				  <xsl:with-param name="naamwoord">1</xsl:with-param>
                        </xsl:call-template>
                        <xsl:text> </xsl:text><xsl:value-of select="$varTekstOVL"/>
                      </xsl:when>
                      <xsl:otherwise>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
   			  <xsl:if test="string-length(@date) != 0">
			    <xsl:call-template name="printDatum">
			      <xsl:with-param name="datum"><xsl:value-of select="@date"/></xsl:with-param>
			      <xsl:with-param name="onz"><xsl:value-of select="@onz"/></xsl:with-param>
			    </xsl:call-template>
      		  </xsl:if>
      		  <xsl:if test="string-length(@place) != 0">
	      		<xsl:text> </xsl:text><xsl:value-of select="$Txt_te"/><xsl:text> </xsl:text><xsl:value-of select="@place"/>
	      	  </xsl:if>
    	  	  <xsl:if test="string-length(@caus) != 0">
        		<xsl:text> (</xsl:text><xsl:value-of select="$Txt_oorzaak"/><xsl:text>: </xsl:text>
          		<xsl:value-of select="@caus"/>
        		<xsl:text>)</xsl:text>
      		  </xsl:if>
              <xsl:if test="../../PERSONAL/@age">
                <xsl:text>, </xsl:text>
                <xsl:value-of select="$Txt_opdeleeftijdvanvoor"/>
                <xsl:call-template name="OnzTekst">
                  <xsl:with-param name="onz"><xsl:value-of select="../../PERSONAL/@onz"/></xsl:with-param>
                </xsl:call-template>
              	<xsl:choose>
                  <xsl:when test="../../PERSONAL/@of=1">
                	<xsl:value-of select="../../PERSONAL/@age - 1"/>
                	<xsl:text> </xsl:text><xsl:value-of select="$Txt_of"/><xsl:text> </xsl:text>
                	<xsl:value-of select="../../PERSONAL/@age"/>
                  </xsl:when>
                  <xsl:otherwise>
                	<xsl:value-of select="../../PERSONAL/@age"/>
                  </xsl:otherwise>
              	</xsl:choose>
                <xsl:value-of select="$Txt_opdeleeftijdvanna"/>
              </xsl:if>
              <xsl:if test="$parToonBron='2'">
                <xsl:if test="@src">
                  <xsl:text> [</xsl:text><xsl:value-of select="$Txt_bron"/><xsl:text>: </xsl:text>
                  <xsl:value-of select="@src" disable-output-escaping="yes"/>
                  <xsl:text>]</xsl:text>
                </xsl:if>
              </xsl:if>
              <xsl:if test="string-length($varTekstOVL) = 0 or (string-length(concat(@date,@place,@cause,../../PERSONAL/@age))!=0 or (@src and $parToonBron='2')) or (@dyear)">
                <xsl:text>. </xsl:text>
              </xsl:if>
	    	</xsl:for-each>
    <xsl:if test="EVENTS/REG/@date or (EVENTS/REG/@src and $parToonBron='2') or (EVENTS/REG/WITN and $parToonGetuige='2')">
      <xsl:value-of select="$Txt_Overlijdenaangifte"/>
      <xsl:if test="string-length(EVENTS/REG/@date) != 0">
        <xsl:call-template name="printDatum">
          <xsl:with-param name="datum"><xsl:value-of select="EVENTS/REG/@date"/></xsl:with-param>
          <xsl:with-param name="onz"><xsl:value-of select="EVENTS/REG/@onz"/></xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <xsl:if test="$parToonBron='2'">
          <xsl:if test="EVENTS/REG/@src">
            <xsl:text> [</xsl:text><xsl:value-of select="$Txt_bron"/><xsl:text>: </xsl:text>
            <xsl:value-of select="EVENTS/REG/@src" disable-output-escaping="yes"/>
            <xsl:text>]</xsl:text>
          </xsl:if>
      </xsl:if>
      <xsl:text>. </xsl:text>
      <xsl:if test="$parToonGetuige='2'">
        <xsl:if test="count(EVENTS/REG/WITN) &gt; 0">
          <xsl:value-of select="$Txt_Bij_de_overlijdensaangifte"/>
            <xsl:if test="count(EVENTS/REG/WITN) =1">
              <xsl:value-of select="$Txt_Getuige_aanwezig"/><xsl:text>: </xsl:text>
            </xsl:if>
            <xsl:if test="count(EVENTS/REG/WITN) &gt; 1">
              <xsl:value-of select="$Txt_Getuigen_aanwezig"/><xsl:text>: </xsl:text>
            </xsl:if>
        </xsl:if>
        <xsl:variable name="nr_witn">
          <xsl:value-of select="count(EVENTS/REG/WITN)"/>
        </xsl:variable>
        <xsl:for-each select="EVENTS/REG/WITN">
          <xsl:call-template name="GetuigeWeergave">
            <xsl:with-param name="nr_witn"><xsl:value-of select="$nr_witn"/></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
      </xsl:if>
    </xsl:if>
    
    		<!-- Hij is begraven op woensdag 22 mei 2002 in Papekop. -->
    		<xsl:for-each select="EVENTS/BURI">
              <xsl:if test="@how!=2 or string-length(concat(@date,@place))!=0 or (WITN and $parToonGetuige='2') or (@src and $parToonBron='2')">
        			<xsl:if test="@how=1 or @how=2 or @how=3 or @how=4">
	          			<xsl:call-template name="mv">
    	        			<xsl:with-param name="sex"><xsl:value-of select="$rela-mv"/></xsl:with-param>
        	    			<xsl:with-param name="cap">1</xsl:with-param>
            				<xsl:with-param name="naamwoord">1</xsl:with-param>
          				</xsl:call-template>
          				<xsl:text> </xsl:text><xsl:value-of select="$Txt_isvvt"/><xsl:text> </xsl:text>
	          			<xsl:choose>
                          <xsl:when test="@how=1">
                            <xsl:choose>
                              <xsl:when test="$rela-mv='V'">
                                <xsl:value-of select="$Txt_gecremeerdv"/>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:value-of select="$Txt_gecremeerdm"/>
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:when>
       	    			  <xsl:when test="@how=2">
                            <xsl:choose>
                              <xsl:when test="$rela-mv='V'">
                                <xsl:value-of select="$Txt_begravenv"/>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:value-of select="$Txt_begravenm"/>
                              </xsl:otherwise>
                            </xsl:choose>
       	    			  </xsl:when>
	          			  <xsl:when test="@how=3"><xsl:value-of select="$Txt_aan_wetenschap"/></xsl:when>
            			  <xsl:when test="@how=4">
                            <xsl:choose>
                              <xsl:when test="$rela-mv='V'">
                                <xsl:value-of select="$Txt_vermistv"/>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:value-of select="$Txt_vermistm"/>
                              </xsl:otherwise>
                            </xsl:choose>
            			  </xsl:when>
          				</xsl:choose>
        			</xsl:if>
<!--	        		<xsl:if test="@how=5">
    	      			<xsl:call-template name="mv">
        	    			<xsl:with-param name="sex"><xsl:value-of select="$rela-mv"/></xsl:with-param>
            				<xsl:with-param name="cap">1</xsl:with-param>
            				<xsl:with-param name="naamwoord">2</xsl:with-param>
          				</xsl:call-template>
    	      			<xsl:if test="@how=5"><xsl:text> lijkbezorging vond plaats</xsl:text></xsl:if>
        			</xsl:if> -->

<!-- === Maak onderscheid tussen op en in == -->
        			<xsl:if test="string-length(@date) !=0">
          				<xsl:call-template name="printDatum">
	        				<xsl:with-param name="datum"><xsl:value-of select="@date"/></xsl:with-param>
	        				<xsl:with-param name="onz"><xsl:value-of select="@onz"/></xsl:with-param>
	          			</xsl:call-template>
    	    		</xsl:if>
        			<xsl:if test="string-length(@place) != 0">
          				<xsl:text> </xsl:text><xsl:value-of select="$Txt_te"/><xsl:text> </xsl:text><xsl:value-of select="@place"/>
        			</xsl:if>
                    <xsl:if test="$parToonBron='2'">
                      <xsl:if test="@src">
                        <xsl:text> [</xsl:text><xsl:value-of select="$Txt_bron"/><xsl:text>: </xsl:text>
                        <xsl:value-of select="@src" disable-output-escaping="yes"/>
                        <xsl:text>]</xsl:text>
                      </xsl:if>
                    </xsl:if>
        			<xsl:text>. </xsl:text>
      			</xsl:if>
                <xsl:if test="$parToonGetuige='2'">
                  <xsl:if test="count(WITN) &gt; 0">
                    <xsl:choose>
                      <xsl:when test="@how=1"><xsl:value-of select="$Txt_Bij_de_crematie"/></xsl:when>
                      <xsl:when test="@how=2"><xsl:value-of select="$Txt_Bij_de_begrafenis"/></xsl:when>
                    </xsl:choose>
                    <xsl:if test="count(WITN) =1">
                      <xsl:value-of select="$Txt_Getuige_aanwezig"/><xsl:text>: </xsl:text>
                    </xsl:if>
                    <xsl:if test="count(WITN) &gt; 1">
                      <xsl:value-of select="$Txt_Getuigen_aanwezig"/><xsl:text>: </xsl:text>
                    </xsl:if>
                  </xsl:if>
                  <xsl:variable name="nr_witn">
                    <xsl:value-of select="count(WITN)"/>
                  </xsl:variable>
                  <xsl:for-each select="WITN">
                    <xsl:call-template name="GetuigeWeergave">
                      <xsl:with-param name="nr_witn"><xsl:value-of select="$nr_witn"/></xsl:with-param>
                    </xsl:call-template>
                  </xsl:for-each>
                </xsl:if>
	    	</xsl:for-each>
	    	
    		<xsl:if test="$parToonNotitie='2'">
	  			<xsl:if test="EVENTS/DEATH/NOTE">
	    			<br /><u><xsl:value-of select="$Txt_Notitie"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_bij_het_overlijden_van"/>
	    			<xsl:call-template name="Roepnaam">
          				<xsl:with-param name="link"><xsl:value-of select="$relalink"/></xsl:with-param>
          				<xsl:with-param name="cap">0</xsl:with-param>
          				<xsl:with-param name="naamwoord">3</xsl:with-param>
	    			</xsl:call-template>:</u>
        			<i><xsl:text> </xsl:text>
        			<xsl:value-of select="EVENTS/DEATH/NOTE" disable-output-escaping="yes"/>
	    			</i>
	    			<br />
   	  			</xsl:if>
    		</xsl:if>
  
    		<xsl:if test="$parToonNotitie='2'">
	  			<xsl:if test="PERSONAL/NOTE">
	    			<br /><u><xsl:value-of select="$Txt_Notitie"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_bij_notitie"/>
	    				<xsl:call-template name="Roepnaam">
          					<xsl:with-param name="link"><xsl:value-of select="$relalink"/></xsl:with-param>
          					<xsl:with-param name="cap">0</xsl:with-param>
          					<xsl:with-param name="naamwoord">3</xsl:with-param>
	    				</xsl:call-template>:</u>
        				<i><xsl:text> </xsl:text>
        				<xsl:value-of select="PERSONAL/NOTE" disable-output-escaping="yes"/>
	    				</i>
	    			<br />
   	  			</xsl:if>
    		</xsl:if>
  
  			<xsl:call-template name="Feiten"/>
		    <xsl:call-template name="GetuigeBij"/>

          </xsl:for-each>
         </xsl:if>     <!-- @link != 0 -->
        </xsl:for-each> <!-- RELA -->
      </xsl:for-each>   <!-- RELATIONS -->

<!-- ==== Druk foto af van persoon, en van zijn relaties als Key2=1 -->      
	  <xsl:if test="$Key2='1'">
        <xsl:if test="//PERSOON[@link=$link]/PERSONAL/PHOTOS">
            <table border="0" cellspacing="0" cellpadding="4" STYLE="font-size:8pt;font-family:verdana">
            <xsl:call-template name="ToonFotos">
              <xsl:with-param name="link"><xsl:value-of select="$link"/></xsl:with-param>
              <xsl:with-param name="eerste">1</xsl:with-param>
              <xsl:with-param name="aantal">6</xsl:with-param>
            </xsl:call-template>
			</table>
		</xsl:if>
	    <xsl:for-each select="RELATIONS">
        	<xsl:for-each select="RELA">
        		<xsl:variable name="relalink" select="@link"/>
        		<xsl:if test="//PERSOON[@link=$relalink]/PERSONAL/PHOTOS">
            		<table border="0" cellspacing="0" cellpadding="4" STYLE="font-size:8pt;font-family:verdana">
            			<xsl:call-template name="ToonFotos">
              				<xsl:with-param name="link"><xsl:value-of select="$relalink"/></xsl:with-param>
              				<xsl:with-param name="eerste">1</xsl:with-param>
              				<xsl:with-param name="aantal">6</xsl:with-param>
            			</xsl:call-template>
					</table>
				</xsl:if>
			</xsl:for-each>
		</xsl:for-each>
	  </xsl:if>
      
    </xsl:if> <!-- $volledig=1 or $mv='V' -->
  </xsl:for-each> <!-- //PERSOON[@link=$link] -->
</xsl:template>

<xsl:template name="ToonFotos">
  <xsl:param name="link"/>
  <xsl:param name="eerste"/>
  <xsl:param name="aantal"/>
  
    <xsl:if test="$parFotoAantal = 2 or $parFotoAantal = 3">
      <xsl:variable name="nr_fotos">
        <xsl:value-of select="count(//PERSOON[@link=$link]/PERSONAL/PHOTOS/PHOTO)"/>
      </xsl:variable>
	            <tr>
             		<xsl:for-each select="//PERSOON[@link=$link]/PERSONAL">
              			<xsl:for-each select="PHOTOS">
              			  <xsl:for-each select="PHOTO">
              			  <xsl:if test="($eerste &lt; position()+1) and (position() &lt; $eerste+$aantal) and ( (($parFotoAantal = 2) and (position() = 1) ) or ($parFotoAantal = 3) )">
              				<td align="center" valign="top" width="140">
                  				<xsl:variable name="foto" select="@name"/>
                                <xsl:variable name="title">
                                  <xsl:value-of select="@title"/>
                                  <xsl:text> (</xsl:text>
                                  <xsl:value-of select="$Txt_klik_voor_foto_in_apart_venster"/>
                                  <xsl:text>)</xsl:text>
                                </xsl:variable>
                  				<xsl:variable name="nummer" select="position() - 1"/>
                  				<a href="javascript:OpenFoto('{$link}','{$nummer}')" name="afbeelding"
                     				onMouseOver = "window.status='Open foto'; return true;"
                     				onMouseOut  = "window.status='';"
                     				onMouseDown = "window.status='Open foto'; geenRechterMuis();">
                     				<img src="{$varFolderFotoAlbum}/{$foto}" title="{$title}" alt="{$foto}" name="afbeelding" height="120" border="1" bordercolor="black"/>
                  				</a>
                  				<br />
        	          			<xsl:value-of select="@title" disable-output-escaping="yes"/>
                  			</td>
                  		  </xsl:if>
                  		  </xsl:for-each>
              			</xsl:for-each>
            		</xsl:for-each>
            	</tr>
            	<xsl:if test="($eerste + $aantal &lt; $nr_fotos + 1) and $parFotoAantal = 3">
            	  <xsl:call-template name="ToonFotos">
            	    <xsl:with-param name="link"><xsl:value-of select="$link"/></xsl:with-param>
            	    <xsl:with-param name="eerste"><xsl:value-of select="$eerste + $aantal"/></xsl:with-param>
            	    <xsl:with-param name="aantal"><xsl:value-of select="$aantal"/></xsl:with-param>
            	  </xsl:call-template>
            	</xsl:if>
   </xsl:if>
</xsl:template>

<!--
// ABL: 2-12-2007
// Template om het aantal kinderen tot de huidige relatie te tellen
-->
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

<xsl:template name="showTypeKindVolledig">
  <xsl:param name="type"/>

  <xsl:choose>
    <xsl:when test="$type=1"><xsl:value-of select="$Txt_Adoptie"/></xsl:when>
    <xsl:when test="$type=2"><xsl:value-of select="$Txt_Pleeg"/></xsl:when>
    <xsl:when test="$type=3"><xsl:value-of select="$Txt_Stief"/></xsl:when>
    <xsl:when test="$type=4"><xsl:value-of select="$Txt_Gewettigd"/></xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template name="Feiten">
  <xsl:if test="$parToonFeiten='2'">
    <xsl:if test="count(FACTS/FACT/ADDR) &gt; 1">
      <br />
      <u><xsl:value-of select="$Txt_Adressen"/><xsl:text>:</xsl:text></u>
      <br />
    </xsl:if>
    <xsl:if test="count(FACTS/FACT/ADDR) = 1">
      <br />
      <u><xsl:value-of select="$Txt_Adres"/><xsl:text>:</xsl:text></u><xsl:text> </xsl:text>
    </xsl:if>
    <xsl:for-each select="FACTS">
      <xsl:for-each select="FACT">
        <xsl:for-each select="ADDR">
          <xsl:value-of select="@street"/>
          <xsl:if test="@street and @zip">
            <xsl:text>, </xsl:text>
          </xsl:if>
          <xsl:value-of select="@zip"/>
          <xsl:if test="(@street or @zip) and @city">
            <xsl:text>, </xsl:text>
          </xsl:if>
          <xsl:value-of select="@city"/>
          <xsl:if test="(@street or @zip or @city) and @ctr">
            <xsl:text>, </xsl:text>
          </xsl:if>
          <xsl:value-of select="@ctr"/>
          <xsl:call-template name="FeitenPeriodeNote"/>
        </xsl:for-each>
      </xsl:for-each> <!-- FACT -->
    </xsl:for-each> <!-- FACTS -->
    
    <xsl:if test="count(FACTS/FACT/OCCU) &gt; 1">
      <br />
      <u><xsl:value-of select="$Txt_Beroepen"/><xsl:text>:</xsl:text></u>
      <br />
    </xsl:if>
    <xsl:if test="count(FACTS/FACT/OCCU) = 1">
      <br />
      <u><xsl:value-of select="$Txt_Beroep"/><xsl:text>:</xsl:text></u><xsl:text> </xsl:text>
    </xsl:if>
    <xsl:for-each select="FACTS">
      <xsl:for-each select="FACT">
        <xsl:for-each select="OCCU">
          <xsl:value-of select="."/>
          <xsl:call-template name="FeitenPeriodeNote"/>
        </xsl:for-each>
      </xsl:for-each> <!-- FACT -->
    </xsl:for-each> <!-- FACTS -->
    
    <xsl:if test="count(FACTS/FACT/RELI) &gt; 1">
      <br />
      <u><xsl:value-of select="$Txt_Religies"/><xsl:text>:</xsl:text></u>
      <br />
    </xsl:if>
    <xsl:if test="count(FACTS/FACT/RELI) = 1">
      <br />
      <u><xsl:value-of select="$Txt_Religie"/><xsl:text>:</xsl:text></u><xsl:text> </xsl:text>
    </xsl:if>
    <xsl:for-each select="FACTS">
      <xsl:for-each select="FACT">
        <xsl:for-each select="RELI">
          <xsl:value-of select="."/>
          <xsl:call-template name="FeitenPeriodeNote"/>
        </xsl:for-each>
      </xsl:for-each> <!-- FACT -->
    </xsl:for-each> <!-- FACTS -->
    
    <xsl:if test="count(FACTS/FACT/PROM) &gt; 1">
      <br />
      <u><xsl:value-of select="$Txt_Onderscheidingen"/><xsl:text>:</xsl:text></u>
      <br />
    </xsl:if>
    <xsl:if test="count(FACTS/FACT/PROM) = 1">
      <br />
      <u><xsl:value-of select="$Txt_Onderscheiding"/><xsl:text>:</xsl:text></u><xsl:text> </xsl:text>
    </xsl:if>
    <xsl:for-each select="FACTS">
      <xsl:for-each select="FACT">
        <xsl:for-each select="PROM">
          <xsl:value-of select="."/>
          <xsl:call-template name="FeitenPeriodeNote"/>
        </xsl:for-each>
      </xsl:for-each> <!-- FACT -->
    </xsl:for-each> <!-- FACTS -->
    
    <xsl:if test="count(FACTS/FACT/EDUC) &gt; 1">
      <br />
      <u><xsl:value-of select="$Txt_Opleidingen"/><xsl:text>:</xsl:text></u>
      <br />
    </xsl:if>
    <xsl:if test="count(FACTS/FACT/EDUC) = 1">
      <br />
      <u><xsl:value-of select="$Txt_Opleiding"/><xsl:text>:</xsl:text></u><xsl:text> </xsl:text>
    </xsl:if>
    <xsl:for-each select="FACTS">
      <xsl:for-each select="FACT">
        <xsl:for-each select="EDUC">
          <xsl:value-of select="."/>
          <xsl:call-template name="FeitenPeriodeNote"/>
        </xsl:for-each>
      </xsl:for-each> <!-- FACT -->
    </xsl:for-each> <!-- FACTS -->
    
    <xsl:if test="count(FACTS/FACT/TITL) &gt; 1">
      <br />
      <u><xsl:value-of select="$Txt_Titels"/><xsl:text>:</xsl:text></u>
      <br />
    </xsl:if>
    <xsl:if test="count(FACTS/FACT/TITL) = 1">
      <br />
      <u><xsl:value-of select="$Txt_Titel"/><xsl:text>:</xsl:text></u><xsl:text> </xsl:text>
    </xsl:if>
    <xsl:for-each select="FACTS">
      <xsl:for-each select="FACT">
        <xsl:for-each select="TITL">
          <xsl:value-of select="."/>
          <xsl:call-template name="FeitenPeriodeNote"/>
        </xsl:for-each>
      </xsl:for-each> <!-- FACT -->
    </xsl:for-each> <!-- FACTS -->
    
    <xsl:if test="count(FACTS/FACT/SOCF) &gt; 1">
      <br />
      <u><xsl:value-of select="$Txt_Functies"/><xsl:text>:</xsl:text></u>
      <br />
    </xsl:if>
    <xsl:if test="count(FACTS/FACT/SOCF) = 1">
      <br />
      <u><xsl:value-of select="$Txt_Functie"/><xsl:text>:</xsl:text></u><xsl:text> </xsl:text>
    </xsl:if>
    <xsl:for-each select="FACTS">
      <xsl:for-each select="FACT">
        <xsl:for-each select="SOCF">
          <xsl:value-of select="."/>
          <xsl:call-template name="FeitenPeriodeNote"/>
        </xsl:for-each>
      </xsl:for-each> <!-- FACT -->
    </xsl:for-each> <!-- FACTS -->
    
    <xsl:if test="count(FACTS/FACT/ESTA) &gt; 1">
      <br />
      <u><xsl:value-of select="$Txt_Heerlijkheden"/><xsl:text>:</xsl:text></u>
      <br />
    </xsl:if>
    <xsl:if test="count(FACTS/FACT/ESTA) = 1">
      <br />
      <u><xsl:value-of select="$Txt_Heerlijkheid"/><xsl:text>:</xsl:text></u><xsl:text> </xsl:text>
    </xsl:if>
    <xsl:for-each select="FACTS">
      <xsl:for-each select="FACT">
        <xsl:for-each select="ESTA">
          <xsl:value-of select="."/>
          <xsl:call-template name="FeitenPeriodeNote"/>
        </xsl:for-each>
      </xsl:for-each> <!-- FACT -->
    </xsl:for-each> <!-- FACTS -->
    
    <xsl:if test="count(FACTS/FACT/PRED) &gt; 1">
      <br />
      <u><xsl:value-of select="$Txt_Predikaten"/><xsl:text>:</xsl:text></u>
      <br />
    </xsl:if>
    <xsl:if test="count(FACTS/FACT/PRED) = 1">
      <br />
      <u><xsl:value-of select="$Txt_Predikaat"/><xsl:text>:</xsl:text></u><xsl:text> </xsl:text>
    </xsl:if>
    <xsl:for-each select="FACTS">
      <xsl:for-each select="FACT">
        <xsl:for-each select="PRED">
          <xsl:value-of select="."/>
          <xsl:call-template name="FeitenPeriodeNote"/>
        </xsl:for-each>
      </xsl:for-each> <!-- FACT -->
    </xsl:for-each> <!-- FACTS -->
    
    <xsl:if test="count(FACTS/FACT/MENT) &gt; 1">
      <br />
      <u><xsl:value-of select="$Txt_Vermeldingen"/><xsl:text>:</xsl:text></u>
      <br />
    </xsl:if>
    <xsl:if test="count(FACTS/FACT/MENT) = 1">
      <br />
      <u><xsl:value-of select="$Txt_Vermelding"/><xsl:text>:</xsl:text></u><xsl:text> </xsl:text>
    </xsl:if>
    <xsl:for-each select="FACTS">
      <xsl:for-each select="FACT">
        <xsl:for-each select="MENT">
          <xsl:value-of select="."/>
          <xsl:call-template name="FeitenPeriodeNote"/>
        </xsl:for-each>
      </xsl:for-each> <!-- FACT -->
    </xsl:for-each> <!-- FACTS -->
    
    <xsl:for-each select="FACTS/FACT/MISC">
      <br />
      <u><xsl:value-of select="@cat"/></u><xsl:text>: </xsl:text>
          <xsl:value-of select="." disable-output-escaping="yes"/>
          <xsl:call-template name="FeitenPeriodeNote"/>
    </xsl:for-each> <!-- FACTS -->
    
  </xsl:if>
</xsl:template>

<xsl:template name="FeitenPeriodeNote">
  <xsl:if test="string-length(../@bdate)!=0 or string-length(../@edate)!=0">
    <xsl:text> (</xsl:text>
  </xsl:if>
  <xsl:if test="string-length(../@bdate)!=0 and string-length(../@edate)!=0 and ../@bdate != ../@edate">
    <xsl:value-of select="$Txt_Vantijd"/><xsl:text> </xsl:text>
  </xsl:if>
  <xsl:if test="string-length(../@bdate)!=0 and not(../@edate)">
    <xsl:value-of select="$Txt_Vanaf"/><xsl:text> </xsl:text>
  </xsl:if>
  <xsl:value-of select="../@bonz"/><xsl:value-of select="../@bdate"/>
  <xsl:if test="../@bdate != ../@edate">
  <xsl:text> </xsl:text>
   </xsl:if>
  <xsl:if test="string-length(../@bdate)!=0 and string-length(../@edate)!=0 and ../@bdate != ../@edate">
    <xsl:text> </xsl:text><xsl:value-of select="$Txt_tot"/><xsl:text> </xsl:text>
  </xsl:if>
  <xsl:if test="not(../@bdate) and string-length(../@edate)!=0">
    <xsl:value-of select="$Txt_Tot"/><xsl:text> </xsl:text>
  </xsl:if>
  <xsl:if test="../@bdate != ../@edate">
    <xsl:value-of select="../@eonz"/><xsl:value-of select="../@edate"/>
   </xsl:if>
  <xsl:if test="string-length(../@bdate)!=0 or string-length(../@edate)!=0">
    <xsl:text>) </xsl:text>
  </xsl:if>
  <xsl:if test="../NOTE">
    <xsl:text> </xsl:text>(<xsl:value-of select="../NOTE" disable-output-escaping="yes"/>)
  </xsl:if>
  <br />
</xsl:template>

<xsl:template name="GetuigeWeergave">
  <xsl:param name="nr_witn"/>
          <xsl:if test="@link">
            <xsl:variable name="getuige" select="@link"/>
            <xsl:for-each select="//PERSOON[@link=$getuige]">
              <xsl:for-each select="PERSONAL">
                <xsl:call-template name="ShowPersoon">
                  <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
                  <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
                  <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
                  <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
                  <xsl:with-param name="src"><xsl:value-of select="$getuige"/></xsl:with-param>
                  <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
                </xsl:call-template>
              </xsl:for-each> <!-- PERSONAL -->
            </xsl:for-each>
          </xsl:if>
          <xsl:if test="not(@link)">
            <xsl:call-template name="Voornaam">
              <xsl:with-param name="nick"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
              <xsl:with-param name="first"><xsl:value-of select="NAME/@first"/></xsl:with-param>
            </xsl:call-template>
            <xsl:text> </xsl:text><xsl:value-of select="NAME/@pref"/><xsl:text> </xsl:text><xsl:value-of select="NAME/@surn"/>
          </xsl:if>
          <xsl:if test="position()+1 &lt; $nr_witn">
            <xsl:text>, </xsl:text>
          </xsl:if>
          <xsl:if test="position()+1 = $nr_witn">
            <xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text>
          </xsl:if>
          <xsl:if test="position() = $nr_witn">
            <xsl:text>. </xsl:text>
          </xsl:if>
</xsl:template>

<xsl:template name="GetuigeBij">

    <!-- ================================= -->
    <!-- Getuigen-bij-blok van de tabel -->
    <!-- ================================= -->
    
    <xsl:if test="$parToonGetuige='2'">
      <xsl:variable name="persoonlink">
      	<xsl:value-of select="@link"/>
      </xsl:variable>
    
      <xsl:if test="count(//PERSONEN/PERSOON/EVENTS/REGB/WITN[@link=$persoonlink])!=0 or count(//PERSONEN/PERSOON/EVENTS/BAPT/WITN[@link=$persoonlink])!=0 or count(//PERSONEN/PERSOON/EVENTS/REG/WITN[@link=$persoonlink])!=0 or count(//PERSONEN/PERSOON/EVENTS/BURI/WITN[@link=$persoonlink])!=0 or count(//PERSONEN/PERSOON/RELATIONS/RELA/BEGIN/WITN[@link=$persoonlink])!=0 or count(//PERSONEN/PERSOON/RELATIONS/RELA/MARC/WITN[@link=$persoonlink]) or count(//PERSONEN/PERSOON/RELATIONS/RELA/MARL/WITN[@link=$persoonlink])!=0">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr align="left">
					<td valign="top" class="tbl-tekst"><u><xsl:value-of select="$Txt_Getuige"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_bij"/><xsl:text>:</xsl:text></u></td>
				</tr>
    			<xsl:for-each select="//PERSONEN/PERSOON/EVENTS/REGB/WITN[@link=$persoonlink]">
      			  <tr>
              		<td valign="top" class="tbl-tekst">
                	  <xsl:value-of select="$Txt_AangifteGeboorte"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/>
              		</td>
              		<td class="tbl-tekst"><xsl:value-of select="$nbsp"/></td>
              		<td valign="top" class="tbl-tekst">
                      <xsl:call-template name="ShowPersoon">
                        <xsl:with-param name="NAMEFIRST"><xsl:value-of select="../../../PERSONAL/NAME/@first"/></xsl:with-param>
                        <xsl:with-param name="NAMENICK"><xsl:value-of select="../../../PERSONAL/NAME/@nick"/></xsl:with-param>
                        <xsl:with-param name="NAMEPREF"><xsl:value-of select="../../../PERSONAL/NAME/@pref"/></xsl:with-param>
                        <xsl:with-param name="SURN"><xsl:value-of select="../../../PERSONAL/NAME/@surn"/></xsl:with-param>
                        <xsl:with-param name="src"><xsl:value-of select="../../../@link"/></xsl:with-param>
                        <xsl:with-param name="priv"><xsl:value-of select="../../../@priv"/></xsl:with-param>
                      </xsl:call-template>
              		</td>
      			  </tr>
    			</xsl:for-each>

    			<xsl:for-each select="//PERSONEN/PERSOON/EVENTS/BAPT/WITN[@link=$persoonlink]">
      			  <tr>
              		<td valign="top" class="tbl-tekst">
                	  <xsl:value-of select="$Txt_Doop"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/>
              		</td>
              		<td class="tbl-tekst"><xsl:value-of select="$nbsp"/></td>
              		<td valign="top" class="tbl-tekst">
                      <xsl:call-template name="ShowPersoon">
                        <xsl:with-param name="NAMEFIRST"><xsl:value-of select="../../../PERSONAL/NAME/@first"/></xsl:with-param>
                        <xsl:with-param name="NAMENICK"><xsl:value-of select="../../../PERSONAL/NAME/@nick"/></xsl:with-param>
                        <xsl:with-param name="NAMEPREF"><xsl:value-of select="../../../PERSONAL/NAME/@pref"/></xsl:with-param>
                        <xsl:with-param name="SURN"><xsl:value-of select="../../../PERSONAL/NAME/@surn"/></xsl:with-param>
                        <xsl:with-param name="src"><xsl:value-of select="../../../@link"/></xsl:with-param>
                        <xsl:with-param name="priv"><xsl:value-of select="../../../@priv"/></xsl:with-param>
                      </xsl:call-template>
              		</td>
      			  </tr>
    			</xsl:for-each>

    			<xsl:for-each select="//PERSONEN/PERSOON/EVENTS/REG/WITN[@link=$persoonlink]">
      			  <tr>
              		<td valign="top" class="tbl-tekst">
                	  <xsl:value-of select="$Txt_AangifteOverlijden"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/>
              		</td>
              		<td class="tbl-tekst"><xsl:value-of select="$nbsp"/></td>
              		<td valign="top" class="tbl-tekst">
                      <xsl:call-template name="ShowPersoon">
                        <xsl:with-param name="NAMEFIRST"><xsl:value-of select="../../../PERSONAL/NAME/@first"/></xsl:with-param>
                        <xsl:with-param name="NAMENICK"><xsl:value-of select="../../../PERSONAL/NAME/@nick"/></xsl:with-param>
                        <xsl:with-param name="NAMEPREF"><xsl:value-of select="../../../PERSONAL/NAME/@pref"/></xsl:with-param>
                        <xsl:with-param name="SURN"><xsl:value-of select="../../../PERSONAL/NAME/@surn"/></xsl:with-param>
                        <xsl:with-param name="src"><xsl:value-of select="../../../@link"/></xsl:with-param>
                        <xsl:with-param name="priv"><xsl:value-of select="../../../@priv"/></xsl:with-param>
                      </xsl:call-template>
              		</td>
      			  </tr>
    			</xsl:for-each>

    			<xsl:for-each select="//PERSONEN/PERSOON/EVENTS/BURI/WITN[@link=$persoonlink]">
      			  <tr>
              		<td valign="top" class="tbl-tekst">
                 	  <xsl:choose>
                        <xsl:when test="../@how=1"><xsl:value-of select="$Txt_Crematie"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/></xsl:when>
                        <xsl:when test="../@how=2"><xsl:value-of select="$Txt_Begrafenis"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/></xsl:when>
                        <xsl:when test="../@how=3"><xsl:value-of select="$Txt_Wetenschap"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/></xsl:when>
                        <xsl:when test="../@how=4"><xsl:value-of select="$Txt_Vermist"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/></xsl:when>
                      </xsl:choose>
              		</td>
              		<td class="tbl-tekst"><xsl:value-of select="$nbsp"/></td>
              		<td valign="top" class="tbl-tekst">
                      <xsl:call-template name="ShowPersoon">
                        <xsl:with-param name="NAMEFIRST"><xsl:value-of select="../../../PERSONAL/NAME/@first"/></xsl:with-param>
                        <xsl:with-param name="NAMENICK"><xsl:value-of select="../../../PERSONAL/NAME/@nick"/></xsl:with-param>
                        <xsl:with-param name="NAMEPREF"><xsl:value-of select="../../../PERSONAL/NAME/@pref"/></xsl:with-param>
                        <xsl:with-param name="SURN"><xsl:value-of select="../../../PERSONAL/NAME/@surn"/></xsl:with-param>
                        <xsl:with-param name="src"><xsl:value-of select="../../../@link"/></xsl:with-param>
                        <xsl:with-param name="priv"><xsl:value-of select="../../../@priv"/></xsl:with-param>
                      </xsl:call-template>
              		</td>
      			  </tr>
    			</xsl:for-each>

    			<xsl:for-each select="//PERSONEN/PERSOON/RELATIONS/RELA/MARL/WITN[@link=$persoonlink]">
              	  <xsl:variable name="partner1">
              		<xsl:value-of select="../../../../@link"/>
              	  </xsl:variable>
              	  <xsl:variable name="partner2">
              		<xsl:value-of select="../../@link"/>
              	  </xsl:variable>
              	  <xsl:if test="$partner1 &lt; $partner2">
      			    <tr>
              		  <td valign="top" class="tbl-tekst">
                		<xsl:value-of select="$Txt_Ondertrouw"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/>
              		  </td>
              		<td class="tbl-tekst"><xsl:value-of select="$nbsp"/></td>
              		  <td valign="top" class="tbl-tekst">
                        <xsl:call-template name="ShowPersoon">
                          <xsl:with-param name="NAMEFIRST"><xsl:value-of select="../../../../PERSONAL/NAME/@first"/></xsl:with-param>
                          <xsl:with-param name="NAMENICK"><xsl:value-of select="../../../../PERSONAL/NAME/@nick"/></xsl:with-param>
                          <xsl:with-param name="NAMEPREF"><xsl:value-of select="../../../../PERSONAL/NAME/@pref"/></xsl:with-param>
                          <xsl:with-param name="SURN"><xsl:value-of select="../../../../PERSONAL/NAME/@surn"/></xsl:with-param>
                          <xsl:with-param name="src"><xsl:value-of select="$partner1"/></xsl:with-param>
                          <xsl:with-param name="priv"><xsl:value-of select="../../../../@priv"/></xsl:with-param>
                        </xsl:call-template>
              		    <xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text>
              		    <xsl:for-each select="//PERSONEN/PERSOON[@link=$partner2]">
                          <xsl:call-template name="ShowPersoon">
                            <xsl:with-param name="NAMEFIRST"><xsl:value-of select="PERSONAL/NAME/@first"/></xsl:with-param>
                            <xsl:with-param name="NAMENICK"><xsl:value-of select="PERSONAL/NAME/@nick"/></xsl:with-param>
                            <xsl:with-param name="NAMEPREF"><xsl:value-of select="PERSONAL/NAME/@pref"/></xsl:with-param>
                            <xsl:with-param name="SURN"><xsl:value-of select="PERSONAL/NAME/@surn"/></xsl:with-param>
                            <xsl:with-param name="src"><xsl:value-of select="$partner2"/></xsl:with-param>
                            <xsl:with-param name="priv"><xsl:value-of select="@priv"/></xsl:with-param>
                          </xsl:call-template>
                        </xsl:for-each>
              		  </td>
      			    </tr>
                  </xsl:if>
    			</xsl:for-each>

    			<xsl:for-each select="//PERSONEN/PERSOON/RELATIONS/RELA/BEGIN/WITN[@link=$persoonlink]">
              	  <xsl:variable name="partner1">
              		<xsl:value-of select="../../../../@link"/>
              	  </xsl:variable>
              	  <xsl:variable name="partner2">
              		<xsl:value-of select="../../@link"/>
              	  </xsl:variable>
              	  <xsl:if test="$partner1 &lt; $partner2">
      			    <tr>
              		  <td valign="top" class="tbl-tekst">
                  		<xsl:choose>
                    	  <xsl:when test="../../@type=1"><xsl:value-of select="$Txt_Huwelijk"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/></xsl:when>
                    	  <xsl:when test="../../@type=2"><xsl:value-of select="$Txt_Notarieel"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/></xsl:when>
                    	  <xsl:when test="../../@type=3"><xsl:value-of select="$Txt_Samenleven"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/></xsl:when>
                    	  <xsl:when test="../../@type=4"><xsl:value-of select="$Txt_Relatie"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/></xsl:when>
                    	  <xsl:when test="../../@type=5"><xsl:value-of select="$Txt_OntbrekendeRelatie"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/></xsl:when>
                    	  <xsl:otherwise><xsl:value-of select="$Txt_OnbekendeRelatie"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/></xsl:otherwise>
                  		</xsl:choose>
              		  </td>
              		<td class="tbl-tekst"><xsl:value-of select="$nbsp"/></td>
              		  <td valign="top" class="tbl-tekst">
                        <xsl:call-template name="ShowPersoon">
                          <xsl:with-param name="NAMEFIRST"><xsl:value-of select="../../../../PERSONAL/NAME/@first"/></xsl:with-param>
                          <xsl:with-param name="NAMENICK"><xsl:value-of select="../../../../PERSONAL/NAME/@nick"/></xsl:with-param>
                          <xsl:with-param name="NAMEPREF"><xsl:value-of select="../../../../PERSONAL/NAME/@pref"/></xsl:with-param>
                          <xsl:with-param name="SURN"><xsl:value-of select="../../../../PERSONAL/NAME/@surn"/></xsl:with-param>
                          <xsl:with-param name="src"><xsl:value-of select="$partner1"/></xsl:with-param>
                          <xsl:with-param name="priv"><xsl:value-of select="../../../../@priv"/></xsl:with-param>
                        </xsl:call-template>
              		    <xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text>
              		    <xsl:for-each select="//PERSONEN/PERSOON[@link=$partner2]">
                          <xsl:call-template name="ShowPersoon">
                            <xsl:with-param name="NAMEFIRST"><xsl:value-of select="PERSONAL/NAME/@first"/></xsl:with-param>
                            <xsl:with-param name="NAMENICK"><xsl:value-of select="PERSONAL/NAME/@nick"/></xsl:with-param>
                            <xsl:with-param name="NAMEPREF"><xsl:value-of select="PERSONAL/NAME/@pref"/></xsl:with-param>
                            <xsl:with-param name="SURN"><xsl:value-of select="PERSONAL/NAME/@surn"/></xsl:with-param>
                            <xsl:with-param name="src"><xsl:value-of select="$partner2"/></xsl:with-param>
                            <xsl:with-param name="priv"><xsl:value-of select="@priv"/></xsl:with-param>
                          </xsl:call-template>
                        </xsl:for-each>
              		  </td>
      			    </tr>
                  </xsl:if>
    			</xsl:for-each>

    			<xsl:for-each select="//PERSONEN/PERSOON/RELATIONS/RELA/MARC/WITN[@link=$persoonlink]">
              	  <xsl:variable name="partner1">
              		<xsl:value-of select="../../../../@link"/>
              	  </xsl:variable>
              	  <xsl:variable name="partner2">
              		<xsl:value-of select="../../@link"/>
              	  </xsl:variable>
              	  <xsl:if test="$partner1 &lt; $partner2">
      			    <tr>
              		  <td valign="top" class="tbl-tekst">
                		<xsl:value-of select="$Txt_KerkelijkHuwelijk"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/>
              		  </td>
              		<td class="tbl-tekst"><xsl:value-of select="$nbsp"/></td>
              		  <td valign="top" class="tbl-tekst">
                        <xsl:call-template name="ShowPersoon">
                          <xsl:with-param name="NAMEFIRST"><xsl:value-of select="../../../../PERSONAL/NAME/@first"/></xsl:with-param>
                          <xsl:with-param name="NAMENICK"><xsl:value-of select="../../../../PERSONAL/NAME/@nick"/></xsl:with-param>
                          <xsl:with-param name="NAMEPREF"><xsl:value-of select="../../../../PERSONAL/NAME/@pref"/></xsl:with-param>
                          <xsl:with-param name="SURN"><xsl:value-of select="../../../../PERSONAL/NAME/@surn"/></xsl:with-param>
                          <xsl:with-param name="src"><xsl:value-of select="$partner1"/></xsl:with-param>
                          <xsl:with-param name="priv"><xsl:value-of select="../../../../@priv"/></xsl:with-param>
                        </xsl:call-template>
              		    <xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text>
              		    <xsl:for-each select="//PERSONEN/PERSOON[@link=$partner2]">
                          <xsl:call-template name="ShowPersoon">
                            <xsl:with-param name="NAMEFIRST"><xsl:value-of select="PERSONAL/NAME/@first"/></xsl:with-param>
                            <xsl:with-param name="NAMENICK"><xsl:value-of select="PERSONAL/NAME/@nick"/></xsl:with-param>
                            <xsl:with-param name="NAMEPREF"><xsl:value-of select="PERSONAL/NAME/@pref"/></xsl:with-param>
                            <xsl:with-param name="SURN"><xsl:value-of select="PERSONAL/NAME/@surn"/></xsl:with-param>
                            <xsl:with-param name="src"><xsl:value-of select="$partner2"/></xsl:with-param>
                            <xsl:with-param name="priv"><xsl:value-of select="@priv"/></xsl:with-param>
                          </xsl:call-template>
                        </xsl:for-each>
              		  </td>
      			    </tr>
                  </xsl:if>
    			</xsl:for-each>

			</table>
      </xsl:if>
    </xsl:if>
</xsl:template>

<xsl:template name="dummy">
</xsl:template>    
</xsl:stylesheet>
