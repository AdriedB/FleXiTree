<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:user="http://www.adriedenblanken.nl/"
                version="1.0">
<!--
// <author>Adrie den Blanken</author>
// <file>$Workfile: Persoonskaart.xsl $</file><date>$Date: 24-10-15 14:37 $</date>
// <revision>$Revision: 59 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this
// header stays intact. No responsibility is accepted
// for use of this software.</disclaimer>
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
<xsl:param name="parFotoAantal"/>
<xsl:param name="parRefOwner"/>
<xsl:param name="parRefOwnerEMail"/>
<xsl:param name="parToonKalender"/>
<xsl:param name="parStuurSorteersleutel"/>
<xsl:param name="parToonNieuws"/>
<xsl:param name="parTaal"/>
<xsl:param name="parAkteNL"/>
<xsl:param name="parAkteEN"/>
<xsl:param name="parAkteFR"/>
<xsl:param name="parAkteDU"/>
<xsl:param name="parToonPKKaart"/>

<xsl:strip-space elements="*"/>

<xsl:template match="PERSONEN">

<xsl:variable name="linkPersoon">
  <xsl:choose>
    <xsl:when test="$HuidigPersoon = 0 or count(PERSOON[@link=$HuidigPersoon])=0">
       <xsl:value-of select="$refPersoon"/>
    </xsl:when>
    <xsl:otherwise>
       <xsl:value-of select="$HuidigPersoon"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xsl:for-each select="PERSOON[@link=$linkPersoon]">

<xsl:for-each select="PERSONAL">
    <xsl:call-template name="ShowMenubar">
      <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
      <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
      <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
      <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
      <xsl:with-param name="src"><xsl:value-of select="$linkPersoon"/></xsl:with-param>
    </xsl:call-template>
</xsl:for-each>

<div align="center">
<br />
  <table border="1" bordercolor="black" cellspacing="0" cellpadding="4" class="pk-data pk-width">
<!--    <xsl:if test="$parToonPKVoettekst=2">
      <caption><strong>Dit is de persoonskaart van</strong></caption>
    </xsl:if> -->
    <tr>
      <td colspan="2" class="pk-head">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="pk-head">
          <tr>
            <xsl:for-each select="PERSONAL">
              <td height="60" align="center" width="70%">
                <div align="center">
                  <strong>
                    <font face="Comic Sans MS" size="5">
                     <xsl:for-each select="NAME">
                      <xsl:value-of select="@first"/>
                      <xsl:if test="@nick">
                          <!-- pak de eerste naam van de voornamen -->
                          <xsl:if test="substring-before(@first,' ') != @nick and @nick != @first or string-length(@first)=0">
                            <xsl:text> </xsl:text>
                            <xsl:if test="@first">(</xsl:if>
                            <xsl:value-of select="@nick"/>
                            <xsl:if test="@first">)</xsl:if>
                          </xsl:if>
                      </xsl:if>
                      <xsl:if test="string-length(@pref)>0"><xsl:text> </xsl:text><xsl:value-of select="@pref"/></xsl:if>
                      <xsl:text> </xsl:text><xsl:value-of select="@surn"/>
                     </xsl:for-each>
                    </font>
                  </strong>
                </div>
              </td>
              <xsl:if test="$parFotoAantal = 2 or $parFotoAantal = 3">
              <xsl:for-each select="PHOTOS">
                <td align="center">
                  <xsl:variable name="foto" select="PHOTO[position()=1]/@name"/>
                  <xsl:variable name="title">
                    <xsl:value-of select="PHOTO[position()=1]/@title"/>
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="$Txt_klik_voor_foto_in_apart_venster"/>
                    <xsl:text>)</xsl:text>
                  </xsl:variable>
                  <a href="javascript:OpenFoto('{$linkPersoon}',0)" name="afbeelding"
                     onMouseOver = "window.status='Open foto'; return true;"
                     onMouseOut  = "window.status='';"
                     onMouseDown = "window.status='Open foto'; geenRechterMuis();">
                     <img src="{$varFolderFotoAlbum}/{$foto}" title="{$title}" alt="{$foto}" name="afbeelding" height="120" border="1" bordercolor="black"/>
                  </a>
                  <xsl:if test="count(PHOTO) &gt; 1 and $parFotoAantal = 3">
                    <br/> <!-- knoppen onder de foto -->
                    <span id="Vorige" style="display:none">
                      <input type="button" value="{$Txt_Vorige}"  alt="{$Txt_Vorige_foto}" onclick="fotoarray({$linkPersoon});prevPhoto({$linkPersoon});"/>
                    </span>
                    <span id="Volgende" style="display:inline">
                      <input type="button" value="{$Txt_Volgende}" alt="{$Txt_Volgende_foto}" onclick="fotoarray({$linkPersoon});nextPhoto({$linkPersoon});"/>
                    </span>
                  </xsl:if>
                </td>
              </xsl:for-each>
              </xsl:if>
            </xsl:for-each> <!-- PERSONAL -->
          </tr>
        </table>
      </td>
    </tr>

    <!-- =========================================================================== -->
    <!-- Tweede blok met links eigen gegevens en rechts gegevens van vader en moeder -->
    <!-- =========================================================================== -->
    <tr>
      <!-- Linkerhelft, zie width=50% -->
      <td width="50%" valign="top">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="pk-data">
          <xsl:if test="contains(PERSONAL/@sex,'M') or contains(PERSONAL/@sex,'V')">
          <tr align="left">
            <td width="24%" valign="top"><xsl:value-of select="$Txt_Geslacht"/></td>
            <td colspan="3" valign="top">
              <xsl:for-each select="PERSONAL">
                <xsl:choose>
                  <xsl:when test="contains(@sex,'M')"><xsl:value-of select="$Txt_Man"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:choose>
                      <xsl:when test="contains(@sex,'V')"><xsl:value-of select="$Txt_Vrouw"/>
                      </xsl:when>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:for-each> <!-- PERSONAL -->
            </td>
          </tr>
          </xsl:if>
          <xsl:if test="string-length(PERSONAL/@age) > 0">
            <tr align="left">
              <td width="24%" valign="top"><xsl:value-of select="$Txt_Leeftijd"/></td>
              <td align="left" valign="top">
                <xsl:choose>
                  <xsl:when test="$Browser = 'IE' and not(EVENTS/DEATH) and
                                  string-length(EVENTS/BIRTH/@date)=10 and string-length(PERSONAL/@onz) = 0">
                    <xsl:for-each select="EVENTS">
                      <xsl:value-of select="user:leeftijd(.,string($parTaal),string($Txt_jaar),string($Txt_jaren))"/>
                    </xsl:for-each> <!-- EVENTS -->
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="PERSONAL/@onz"/><xsl:text> </xsl:text>
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
              		<xsl:choose>
              		  <xsl:when test="PERSONAL/@age = 0 or PERSONAL/@age = 1">
              			<xsl:text> </xsl:text><xsl:value-of select="$Txt_jaar"/>
              		  </xsl:when>
              		  <xsl:otherwise>
              			<xsl:text> </xsl:text><xsl:value-of select="$Txt_jaren"/>
              		  </xsl:otherwise>
              		</xsl:choose>
              		<xsl:text> </xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:value-of select="$nbsp"/>
              </td>
            </tr>
          </xsl:if>
          <xsl:for-each select="EVENTS">
            <xsl:for-each select="BIRTH[@date or @place]">
              <tr align="left">
                <td width="24%" valign="top"><xsl:value-of select="$Txt_Geboorte"/></td>
                <td width="32%" valign="top">
                  <xsl:value-of select="@onz"/><xsl:text> </xsl:text>
                  <xsl:call-template name="Txt_wd">
                    <xsl:with-param name="wd"><xsl:value-of select="@wd"/></xsl:with-param>
                  </xsl:call-template>
                  <xsl:text> </xsl:text><xsl:value-of select="@date"/>
                  <xsl:if test="@time">
                    <br /><xsl:value-of select="$Txt_om"/><xsl:text> </xsl:text><xsl:value-of select="@time"/>
                  </xsl:if>
                </td>
                <td valign="top">
                  <xsl:if test="@place">
                  <xsl:value-of select="$Txt_te"/>
                  </xsl:if>
                  <xsl:value-of select="$nbsp"/>
                </td>
                <td width="35%" valign="top">
                  <xsl:choose>
                    <xsl:when test="$parToonPKKaart = 1">
                	  <xsl:call-template name="plaatsinfo">
                		<xsl:with-param name="plaats"><xsl:value-of select="@place"/></xsl:with-param>
                	  </xsl:call-template>
                	</xsl:when>
                	<xsl:otherwise>
                	  <xsl:value-of select="@place"/>
                	</xsl:otherwise>
                 </xsl:choose>
                </td>
              </tr>
            </xsl:for-each>  <!-- BIRTH -->
            <xsl:for-each select="DEATH[@ovl=1]">
              <tr align="left">
                <xsl:choose>
                  <xsl:when test="not(../BIRTH/@date) and not(../BIRTH/@place)">
                    <td width="24%" valign="top"><xsl:value-of select="$Txt_Geboorte"/></td>
                  </xsl:when>
                  <xsl:otherwise>
                    <td width="24%" valign="top"><xsl:value-of select="$nbsp"/></td>
                  </xsl:otherwise>
                </xsl:choose>
                <td width="32%" valign="top">
                  <xsl:value-of select="$Txt_levenloos"/>
                </td>
              </tr>
            </xsl:for-each>

            <xsl:for-each select="REGB[@date]">
              <tr align="left">
                <td width="24%" valign="top"><xsl:value-of select="$Txt_AangifteGeboorte"/></td>
                <td width="32%" valign="top">
                  <xsl:value-of select="@onz"/><xsl:text> </xsl:text>
                  <xsl:call-template name="Txt_wd">
                    <xsl:with-param name="wd"><xsl:value-of select="@wd"/></xsl:with-param>
                  </xsl:call-template>
                  <xsl:text> </xsl:text><xsl:value-of select="@date"/>
                </td>
                <td valign="top">
                  <xsl:if test="@place">
                  <xsl:value-of select="$Txt_te"/>
                  </xsl:if>
                  <xsl:value-of select="$nbsp"/>
                </td>
                <td width="35%" valign="top">
                  <xsl:choose>
                    <xsl:when test="$parToonPKKaart = 1">
                	  <xsl:call-template name="plaatsinfo">
                		<xsl:with-param name="plaats"><xsl:value-of select="@place"/></xsl:with-param>
                	  </xsl:call-template>
                	</xsl:when>
                	<xsl:otherwise>
                	  <xsl:value-of select="@place"/>
                	</xsl:otherwise>
                 </xsl:choose>
                </td>
              </tr>
            </xsl:for-each>  <!-- REGB -->

            <xsl:for-each select="BAPT">
              <tr align="left">
                <td width="24%" valign="top"><xsl:value-of select="$Txt_Doop"/></td>
                <td width="32%" valign="top">
                  <xsl:value-of select="@onz"/><xsl:text> </xsl:text>
                  <xsl:call-template name="Txt_wd">
                    <xsl:with-param name="wd"><xsl:value-of select="@wd"/></xsl:with-param>
                  </xsl:call-template>
                  <xsl:text> </xsl:text><xsl:value-of select="@date"/>
                </td>
                <td valign="top">
                  <xsl:if test="@place">
                  <xsl:value-of select="$Txt_te"/>
                  </xsl:if>
                  <xsl:value-of select="$nbsp"/>
                </td>
                <td width="35%" valign="top">
                  <xsl:choose>
                    <xsl:when test="$parToonPKKaart = 1">
                	  <xsl:call-template name="plaatsinfo">
                		<xsl:with-param name="plaats"><xsl:value-of select="@place"/></xsl:with-param>
                	  </xsl:call-template>
                	</xsl:when>
                	<xsl:otherwise>
                	  <xsl:value-of select="@place"/>
                	</xsl:otherwise>
                 </xsl:choose>
                </td>
              </tr>
            </xsl:for-each> <!-- BAPT -->

            <xsl:for-each select="DEATH">
              <tr align="left" valign="top">
                <td width="24%" valign="top"><xsl:value-of select="$Txt_Overlijden"/></td>
                <td width="32%" valign="top">
                  <xsl:value-of select="@onz"/><xsl:text> </xsl:text>
                  <xsl:call-template name="Txt_wd">
                    <xsl:with-param name="wd"><xsl:value-of select="@wd"/></xsl:with-param>
                  </xsl:call-template>
                  <xsl:text> </xsl:text><xsl:value-of select="@date"/>
                  <xsl:if test="@time">
                    <br /><xsl:value-of select="$Txt_om"/><xsl:text> </xsl:text><xsl:value-of select="@time"/>
                  </xsl:if>
                </td>
                <td valign="top">
                  <xsl:if test="@place">
                  <xsl:value-of select="$Txt_te"/>
                  </xsl:if>
                  <xsl:value-of select="$nbsp"/>
                </td>
                <td width="35%" valign="top">
                  <xsl:choose>
                    <xsl:when test="$parToonPKKaart = 1">
                	  <xsl:call-template name="plaatsinfo">
                		<xsl:with-param name="plaats"><xsl:value-of select="@place"/></xsl:with-param>
                	  </xsl:call-template>
                	</xsl:when>
                	<xsl:otherwise>
                	  <xsl:value-of select="@place"/>
                	</xsl:otherwise>
                 </xsl:choose>
                </td>
              </tr>
            </xsl:for-each> <!-- DEATH -->

            <xsl:for-each select="REG[@date]">
              <tr align="left">
                <td width="24%" valign="top"><xsl:value-of select="$Txt_AangifteOverlijden"/></td>
                <td width="32%" valign="top">
                  <xsl:value-of select="@onz"/><xsl:text> </xsl:text>
                  <xsl:call-template name="Txt_wd">
                    <xsl:with-param name="wd"><xsl:value-of select="@wd"/></xsl:with-param>
                  </xsl:call-template>
                  <xsl:text> </xsl:text><xsl:value-of select="@date"/>
                </td>
                <td valign="top">
                  <xsl:if test="@place">
                  <xsl:value-of select="$Txt_te"/>
                  </xsl:if>
                  <xsl:value-of select="$nbsp"/>
                </td>
                <td width="35%" valign="top">
                  <xsl:choose>
                    <xsl:when test="$parToonPKKaart = 1">
                	  <xsl:call-template name="plaatsinfo">
                		<xsl:with-param name="plaats"><xsl:value-of select="@place"/></xsl:with-param>
                	  </xsl:call-template>
                	</xsl:when>
                	<xsl:otherwise>
                	  <xsl:value-of select="@place"/>
                	</xsl:otherwise>
                 </xsl:choose>
                </td>
              </tr>
            </xsl:for-each> <!-- REG -->

            <xsl:for-each select="BURI">
              <tr align="left">
                <td width="24%" valign="top">
                  <xsl:choose>
                    <xsl:when test="@how=1"><xsl:value-of select="$Txt_Crematie"/></xsl:when>
                    <xsl:when test="@how=2">
                    	<xsl:if test="string-length(concat(@date,@place)) !=0">
                    		<xsl:value-of select="$Txt_Begrafenis"/>
                    	</xsl:if>
                    </xsl:when>
                    <xsl:when test="@how=3"><xsl:value-of select="$Txt_Wetenschap"/></xsl:when>
                    <xsl:when test="@how=4"><xsl:value-of select="$Txt_Vermist"/></xsl:when>
                    <xsl:otherwise><xsl:value-of select="$Txt_Lijkbezorging"/></xsl:otherwise>
                  </xsl:choose>
                </td>
                <td width="32%" valign="top">
                  <xsl:value-of select="@onz"/><xsl:text> </xsl:text>
                  <xsl:call-template name="Txt_wd">
                    <xsl:with-param name="wd"><xsl:value-of select="@wd"/></xsl:with-param>
                  </xsl:call-template>
                  <xsl:text> </xsl:text><xsl:value-of select="@date"/>
                </td>
                <td valign="top">
                  <xsl:if test="@place">
                  <xsl:value-of select="$Txt_te"/>
                  </xsl:if>
                  <xsl:value-of select="$nbsp"/>
                </td>
                <td width="35%" valign="top">
                  <xsl:choose>
                    <xsl:when test="$parToonPKKaart = 1">
                	  <xsl:call-template name="plaatsinfo">
                		<xsl:with-param name="plaats"><xsl:value-of select="@place"/></xsl:with-param>
                	  </xsl:call-template>
                	</xsl:when>
                	<xsl:otherwise>
                	  <xsl:value-of select="@place"/>
                	</xsl:otherwise>
                 </xsl:choose>
                </td>
              </tr>
            </xsl:for-each> <!-- BURI -->
          </xsl:for-each> <!-- EVENTS -->
        </table>
      </td>

      <!-- Rechterhelft, zie width=50% -->
      <td width="50%" valign="top">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="pk-data">
          <xsl:if test="count(FATHER)=0 and count(MOTHER)=0">
            <tr align="left">
              <td valign="top">
                <!-- In geval er geen vader of moeder is toch iets hier plaatsen ander
                     valt dat tabel layout in het water (bij FireFox) -->
                <xsl:value-of select="$nbsp"/>
              </td>
            </tr>
          </xsl:if>
          <!-- ============================================================= -->
          <!-- ========= En dan nu de gegevens van VADER =================== -->
          <!-- ============================================================= -->
          <xsl:for-each select="FATHER">
            <xsl:call-template name="ShowPAofMa">
              <xsl:with-param name="relatie"><xsl:value-of select="$Txt_Vader"/></xsl:with-param>
              <xsl:with-param name="linkpers"><xsl:value-of select="@link"/></xsl:with-param>
              <xsl:with-param name="oudertype"><xsl:value-of select="@type"/></xsl:with-param>
            </xsl:call-template>
          </xsl:for-each>         <!-- FATHER -->
          <!-- ============================================================= -->
          <!-- ========= En dan nu de gegevens van MOEDER ================== -->
          <!-- ============================================================= -->
          <xsl:for-each select="MOTHER">
            <xsl:call-template name="ShowPAofMa">
              <xsl:with-param name="relatie"><xsl:value-of select="$Txt_Moeder"/></xsl:with-param>
              <xsl:with-param name="linkpers"><xsl:value-of select="@link"/></xsl:with-param>
              <xsl:with-param name="oudertype"><xsl:value-of select="@type"/></xsl:with-param>
            </xsl:call-template>
          </xsl:for-each>  <!-- Moeder -->
        </table>
      </td>
    </tr>

    <!-- ============================================================= -->
    <!-- Tabel gedeelte met links relatie en rechts de kinderen           -->
    <!-- ============================================================= -->

    <xsl:for-each select="RELATIONS">
      <xsl:for-each select="RELA">
        <tr>
          <td valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="pk-data">
              <tr align="left">
                <td width="24%" valign="top">
<!--  Aldfaer _RELATYPE("Huwelijk;Geregistreerd partnerschap;Samenleven;Relatie ;Ontbrekende relatie;Onbekende relatie")-->
                  <xsl:choose>
                    <xsl:when test="@type=1"><xsl:value-of select="$Txt_Huwelijk"/></xsl:when>
                    <xsl:when test="@type=2"><xsl:value-of select="$Txt_Notarieel"/></xsl:when>
                    <xsl:when test="@type=3"><xsl:value-of select="$Txt_Samenleven"/></xsl:when>
                    <xsl:when test="@type=4"><xsl:value-of select="$Txt_Relatie"/></xsl:when>
                    <xsl:when test="@type=5"><xsl:value-of select="$Txt_OntbrekendeRelatie"/></xsl:when>
                    <xsl:otherwise><xsl:value-of select="$Txt_OnbekendeRelatie"/></xsl:otherwise>
                  </xsl:choose>
                </td>
                <td width="32%" valign="top">
                  <xsl:value-of select="BEGIN/@onz"/><xsl:text> </xsl:text>
                  <xsl:call-template name="Txt_wd">
                    <xsl:with-param name="wd"><xsl:value-of select="BEGIN/@wd"/></xsl:with-param>
                  </xsl:call-template>
                  <xsl:text> </xsl:text><xsl:value-of select="BEGIN/@date"/>
                </td>
                <td valign="top">
                  <xsl:if test="BEGIN/@place">
                  <xsl:value-of select="$Txt_te"/>
                  </xsl:if>
                  <xsl:value-of select="$nbsp"/>
                </td>
                <td align="left" width="35%" valign="top">
                  <xsl:choose>
                    <xsl:when test="$parToonPKKaart = 1">
                	  <xsl:call-template name="plaatsinfo">
                		<xsl:with-param name="plaats"><xsl:value-of select="BEGIN/@place"/></xsl:with-param>
                	  </xsl:call-template>
                	</xsl:when>
                	<xsl:otherwise>
                	  <xsl:value-of select="BEGIN/@place"/>
                	</xsl:otherwise>
                 </xsl:choose>
                </td>
              </tr>

              <xsl:for-each select="MARL[@date or @place]">
                <tr align="left">
                  <td width="24%" valign="top">
                    <xsl:value-of select="$Txt_Ondertrouw"/><xsl:value-of select="$nbsp"/>
                  </td>
                  <td width="32%" valign="top">
                  <xsl:value-of select="@onz"/><xsl:text> </xsl:text>
                  <xsl:call-template name="Txt_wd">
                    <xsl:with-param name="wd"><xsl:value-of select="@wd"/></xsl:with-param>
                  </xsl:call-template>
                  <xsl:text> </xsl:text><xsl:value-of select="@date"/>
                  </td>
                  <td valign="top">
                    <xsl:if test="@place">
                    <xsl:value-of select="$Txt_te"/>
                    </xsl:if>
                    <xsl:value-of select="$nbsp"/>
                  </td>
                  <td align="left" width="35%" valign="top">
                  <xsl:choose>
                    <xsl:when test="$parToonPKKaart = 1">
                	  <xsl:call-template name="plaatsinfo">
                		<xsl:with-param name="plaats"><xsl:value-of select="@place"/></xsl:with-param>
                	  </xsl:call-template>
                	</xsl:when>
                	<xsl:otherwise>
                	  <xsl:value-of select="@place"/>
                	</xsl:otherwise>
                 </xsl:choose>
                  </td>
                </tr>
              </xsl:for-each>

              <xsl:for-each select="MARC[@date or @place]">
                <tr align="left">
                  <td width="24%" valign="top">
                    <xsl:value-of select="$Txt_KerkelijkHuwelijk"/>
                  </td>
                  <td width="32%" valign="top">
                  <xsl:value-of select="@onz"/><xsl:text> </xsl:text>
                  <xsl:call-template name="Txt_wd">
                    <xsl:with-param name="wd"><xsl:value-of select="@wd"/></xsl:with-param>
                  </xsl:call-template>
                  <xsl:text> </xsl:text><xsl:value-of select="@date"/>
                  </td>
                  <td valign="top">
                    <xsl:if test="@place">
                    <xsl:value-of select="$Txt_te"/>
                    </xsl:if>
                    <xsl:value-of select="$nbsp"/>
                  </td>
                  <td align="left" width="35%" valign="top">
                  <xsl:choose>
                    <xsl:when test="$parToonPKKaart = 1">
                	  <xsl:call-template name="plaatsinfo">
                		<xsl:with-param name="plaats"><xsl:value-of select="@place"/></xsl:with-param>
                	  </xsl:call-template>
                	</xsl:when>
                	<xsl:otherwise>
                	  <xsl:value-of select="@place"/>
                	</xsl:otherwise>
                 </xsl:choose>
                  </td>
                </tr>
              </xsl:for-each>

              <xsl:for-each select="END">
              <tr align="left">
                <td width="24%" valign="top">
                  <xsl:value-of select="$Txt_Beeindigd"/>
                </td>
                <td width="32%" valign="top">
                  <xsl:value-of select="@onz"/><xsl:text> </xsl:text>
                  <xsl:call-template name="Txt_wd">
                    <xsl:with-param name="wd"><xsl:value-of select="@wd"/></xsl:with-param>
                  </xsl:call-template>
                  <xsl:text> </xsl:text><xsl:value-of select="@date"/>
                </td>
                <td valign="top">
                  <xsl:if test="@place">
                  <xsl:value-of select="$Txt_te"/>
                  </xsl:if>
                  <xsl:value-of select="$nbsp"/>
                </td>
                <td align="left" width="35%" valign="top">
                  <xsl:choose>
                    <xsl:when test="$parToonPKKaart = 1">
                	  <xsl:call-template name="plaatsinfo">
                		<xsl:with-param name="plaats"><xsl:value-of select="@place"/></xsl:with-param>
                	  </xsl:call-template>
                	</xsl:when>
                	<xsl:otherwise>
                	  <xsl:value-of select="@place"/>
                	</xsl:otherwise>
                 </xsl:choose>
                </td>
              </tr>
              </xsl:for-each>

              <xsl:variable name="relatie" select="@link"/>
              <xsl:for-each select="//PERSONEN/PERSOON[@link=$relatie]">
                <tr align="left">
                  <td valign="top">
                    <xsl:if test="$relatie != 0">
                    <xsl:value-of select="$Txt_Met"/>
                    </xsl:if>
                    <xsl:value-of select="$nbsp"/>
                  </td>
                  <td colspan="3" valign="top">
                    <xsl:for-each select="PERSONAL">
                      <xsl:call-template name="ShowPersoon">
                        <xsl:with-param name="relatie">partner</xsl:with-param>
                        <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
                        <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
                        <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
                        <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
                        <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
                        <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
                      </xsl:call-template>
                    </xsl:for-each> <!-- PERSONAL -->
                  </td>
                </tr>

                <xsl:for-each select="EVENTS">
                  <xsl:for-each select="BIRTH[@date or @place]">
                    <tr align="left">
                      <td width="24%" valign="top"><xsl:value-of select="$Txt_Geboorte"/></td>
                      <td width="32%" valign="top">
                  <xsl:value-of select="@onz"/><xsl:text> </xsl:text>
                  <xsl:call-template name="Txt_wd">
                    <xsl:with-param name="wd"><xsl:value-of select="@wd"/></xsl:with-param>
                  </xsl:call-template>
                  <xsl:text> </xsl:text><xsl:value-of select="@date"/>
                  <xsl:if test="@time">
                    <br /><xsl:value-of select="$Txt_om"/><xsl:text> </xsl:text><xsl:value-of select="@time"/>
                  </xsl:if>
                      </td>
                      <td valign="top">
                        <xsl:if test="@place">
                        <xsl:value-of select="$Txt_te"/>
                        </xsl:if>
                        <xsl:value-of select="$nbsp"/>
                      </td>
                      <td width="35%" align="left" valign="top">
                  <xsl:choose>
                    <xsl:when test="$parToonPKKaart = 1">
                	  <xsl:call-template name="plaatsinfo">
                		<xsl:with-param name="plaats"><xsl:value-of select="@place"/></xsl:with-param>
                	  </xsl:call-template>
                	</xsl:when>
                	<xsl:otherwise>
                	  <xsl:value-of select="@place"/>
                	</xsl:otherwise>
                 </xsl:choose>
                      </td>
                    </tr>
                  </xsl:for-each> <!-- BIRTH -->
                  <xsl:for-each select="DEATH">
                    <tr align="left" valign="top">
                      <td width="24%" valign="top"><xsl:value-of select="$Txt_Overlijden"/></td>
                      <td width="32%" valign="top">
                  <xsl:value-of select="@onz"/><xsl:text> </xsl:text>
                  <xsl:call-template name="Txt_wd">
                    <xsl:with-param name="wd"><xsl:value-of select="@wd"/></xsl:with-param>
                  </xsl:call-template>
                  <xsl:text> </xsl:text><xsl:value-of select="@date"/>
                  <xsl:if test="@time">
                    <br /><xsl:value-of select="$Txt_om"/><xsl:text> </xsl:text><xsl:value-of select="@time"/>
                  </xsl:if>
                      </td>
                      <td valign="top">
                        <xsl:if test="@place">
                        <xsl:value-of select="$Txt_te"/>
                        </xsl:if>
                        <xsl:value-of select="$nbsp"/>
                      </td>
                      <td width="35%" align="left" valign="top">
                  <xsl:choose>
                    <xsl:when test="$parToonPKKaart = 1">
                	  <xsl:call-template name="plaatsinfo">
                		<xsl:with-param name="plaats"><xsl:value-of select="@place"/></xsl:with-param>
                	  </xsl:call-template>
                	</xsl:when>
                	<xsl:otherwise>
                	  <xsl:value-of select="@place"/>
                	</xsl:otherwise>
                 </xsl:choose>
                      </td>
                    </tr>
                  </xsl:for-each>  <!-- DEATH -->
                </xsl:for-each>  <!-- EVENTS -->
              </xsl:for-each> <!-- select="PERSOON" -->
            </table>
          </td>

          <td valign="top">
            <xsl:if test="count(CHILDREN/CHIL) = 0">
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="pk-data">
                <td valign="top"><xsl:text> </xsl:text></td>
              </table>
            </xsl:if>
            <xsl:for-each select="CHILDREN">
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="pk-data">
                <tr align="left">
                  <td width="24%" valign="top">
                    <xsl:value-of select="$Txt_Kinderen"/> (<xsl:value-of select="count(CHIL)"/>)
                  </td>
                  <td width="76%" align="left" valign="top">
                    <xsl:for-each select="CHIL">
                      <xsl:variable name="kind" select="@link"/>
                      <xsl:variable name="type" select="@type"/>

                      <xsl:for-each select="//PERSONEN/PERSOON[@link=$kind]">
                        <xsl:for-each select="PERSONAL">
                          <xsl:call-template name="ShowPersoon">
                            <xsl:with-param name="relatie">kind</xsl:with-param>
                            <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
                            <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
                            <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
                            <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
                            <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
                            <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
                          </xsl:call-template>
                        </xsl:for-each>  <!-- PERSONAL -->
                        <xsl:for-each select="EVENTS/DEATH">
                          <xsl:text> &#8224;</xsl:text>
                        </xsl:for-each>
                        <xsl:if test="string-length($type)">
                          <xsl:call-template name="showTypeKind">
                            <xsl:with-param name="type"><xsl:value-of select="$type"/></xsl:with-param>
                          </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="count(RELATIONS/RELA/CHILDREN/CHIL) != 0">
                      	  (<xsl:value-of select="count(RELATIONS/RELA/CHILDREN/CHIL)"/>)
                      	</xsl:if>
                      </xsl:for-each>  <!-- select="document(@link)/PERSOON" -->
                      <br></br>            <!-- Nieuwe regel voor elk kind -->
                    </xsl:for-each>  <!-- CHIL -->
                  </td>
                </tr>
              </table>
            </xsl:for-each> <!-- CHILDREN -->
          </td>
        </tr>
      </xsl:for-each> <!-- RELA -->
    </xsl:for-each> <!-- RELATIONS -->

    <!-- ============================================================= -->
    <!-- Tabel gedeelte met feiten                                     -->
    <!-- ============================================================= -->
    
	<xsl:if test="$parToonFeiten='2'">
    <xsl:for-each select="FACTS">
      <xsl:for-each select="FACT">
      <tr>
        <td colspan="2" valign="top">
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="pk-data">
            <tr>
              <xsl:choose>
                <xsl:when test="OCCU">
                  <td width="12%" valign="top"><xsl:value-of select="$Txt_Beroep"/></td>
                  <td valign="top" width="38%">
                    <xsl:value-of select="OCCU"/><xsl:value-of select="$nbsp"/>
                  </td>
                </xsl:when>
                <xsl:when test="RELI">
                  <td width="12%" valign="top"><xsl:value-of select="$Txt_Religie"/></td>
                  <td valign="top" width="38%">
                    <xsl:value-of select="RELI"/><xsl:value-of select="$nbsp"/>
                  </td>
                </xsl:when>
                <xsl:when test="ADDR">
                  <td width="12%" valign="top"><xsl:value-of select="$Txt_Adres"/></td>
                  <td valign="top" width="38%">
                    <xsl:variable name="strStraat">
                      <xsl:choose>
                        <xsl:when test="string-length(ADDR/@street)!=0">
                           <xsl:value-of select="ADDR/@street"/>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text></xsl:text>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="strZip">
                      <xsl:choose>
                        <xsl:when test="string-length(ADDR/@zip)!=0">
                           <xsl:if test="string-length($strStraat)!=0">
                             <xsl:value-of select="$strStraat"/><xsl:text>, </xsl:text>
                           </xsl:if>
                           <xsl:value-of select="ADDR/@zip"/>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:value-of select="$strStraat"/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="strCity">
                      <xsl:choose>
                        <xsl:when test="string-length(ADDR/@city)!=0">
                           <xsl:if test="string-length($strZip)!=0">
                             <xsl:value-of select="$strZip"/><xsl:text>, </xsl:text>
                           </xsl:if>
                           <xsl:value-of select="ADDR/@city"/>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:value-of select="$strZip"/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="strCountry">
                      <xsl:choose>
                        <xsl:when test="string-length(ADDR/@ctr)!=0">
                           <xsl:if test="string-length($strCity)!=0">
                             <xsl:value-of select="$strCity"/><xsl:text>, </xsl:text>
                           </xsl:if>
                           <xsl:value-of select="ADDR/@ctr"/>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:value-of select="$strCity"/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:variable>
                    <!-- En dan nu eindelijk het eindresultaat presenteren -->
                    <xsl:value-of select="$strCountry"/>
                    <xsl:value-of select="$nbsp"/>
                  </td>
                </xsl:when>
                <xsl:when test="PROM">
                  <td width="12%" valign="top">
                  <xsl:value-of select="$Txt_Onderscheiding"/>
                  </td>
                  <td width="38%" valign="top">
                    <xsl:value-of select="PROM"/><xsl:value-of select="$nbsp"/>
                  </td>
                </xsl:when>
                <xsl:when test="EDUC">
                  <td width="12%" valign="top">
                  <xsl:value-of select="$Txt_Opleiding"/>
                  </td>
                  <td valign="top">
                    <xsl:value-of select="EDUC"/><xsl:value-of select="$nbsp"/>
                  </td>
                </xsl:when>
                <xsl:when test="TITL">
                  <td width="12%" valign="top">
                  <xsl:value-of select="$Txt_Titel"/>
                  </td>
                  <td width="38%" valign="top">
                    <xsl:value-of select="TITL"/><xsl:value-of select="$nbsp"/>
                  </td>
                </xsl:when>
                <xsl:when test="SOCF">
                  <td width="12%" valign="top">
                  <xsl:value-of select="$Txt_Functie"/>
                  </td>
                  <td width="38%" valign="top">
                    <xsl:value-of select="SOCF"/><xsl:value-of select="$nbsp"/>
                  </td>
                </xsl:when>
                <xsl:when test="ESTA">
                  <td width="12%" valign="top">
                  <xsl:value-of select="$Txt_Heerlijkheid"/>
                  </td>
                  <td width="38%" valign="top">
                    <xsl:value-of select="ESTA"/><xsl:value-of select="$nbsp"/>
                  </td>
                </xsl:when>
                <xsl:when test="PRED">
                  <td width="12%" valign="top">
                  <xsl:value-of select="$Txt_Predikaat"/>
                  </td>
                  <td width="38%" valign="top">
                    <xsl:value-of select="PRED"/><xsl:value-of select="$nbsp"/>
                  </td>
                </xsl:when>
                <xsl:when test="MENT">
                  <td width="12%" valign="top">
                  <xsl:value-of select="$Txt_Vermelding"/>
                  </td>
                  <td width="38%" valign="top">
                    <xsl:value-of select="MENT"/><xsl:value-of select="$nbsp"/>
                  </td>
                </xsl:when>
                <xsl:when test="MISC">
                  <td width="12%" valign="top">
                    <xsl:value-of select="MISC/@cat"/>
                  </td>
                  <td width="38%" valign="top">
                    <xsl:value-of select="MISC" disable-output-escaping="yes"/><xsl:value-of select="$nbsp"/>
                  </td>
                </xsl:when>
                <xsl:otherwise>
                  <td width="12%" valign="top">
                  Onbekend feit
                  </td>
                  <td width="38%" valign="top">
                    <xsl:value-of select="$nbsp"/>
                  </td>
                  <td valign="top">
                    <xsl:value-of select="$nbsp"/>
                  </td>
                </xsl:otherwise>
              </xsl:choose>
              
              <xsl:choose>
                <xsl:when test="@bdate or @edate">
                  <xsl:variable name="begindatum">
                    <xsl:if test="@bdate">
                      <xsl:value-of select="@bonz"/><xsl:value-of select="@bdate"/>
                    </xsl:if>
                  </xsl:variable>
                  <xsl:variable name="einddatum">
                    <xsl:if test="@edate">
                      <xsl:value-of select="@eonz"/><xsl:value-of select="@edate"/>
                    </xsl:if>
                  </xsl:variable>
                  <td width="50%" valign="top" align="left">
                    <xsl:value-of select="$nbsp"/><xsl:value-of select="$Txt_Periode"/><xsl:text>: </xsl:text>
                    <xsl:choose>
                      <xsl:when test="$begindatum = $einddatum">
                        <xsl:value-of select="@bonz"/><xsl:value-of select="@bdate"/><xsl:value-of select="$nbsp"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:if test="@bdate">
                          <xsl:value-of select="$Txt_vanaf"/><xsl:value-of select="$nbsp"/><xsl:value-of select="$nbsp"/><xsl:value-of select="@bonz"/><xsl:value-of select="@bdate"/><xsl:value-of select="$nbsp"/>
                        </xsl:if>
                        <xsl:if test="@edate">
                          <xsl:value-of select="$Txt_tot"/><xsl:value-of select="$nbsp"/><xsl:value-of select="@eonz"/><xsl:value-of select="@edate"/>
                        </xsl:if>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                </xsl:when>
                <xsl:otherwise>
                  <td width="12%" valign="top">
                    <xsl:value-of select="$nbsp"/>
                  </td>
                  <td width="38%" valign="top">
                    <xsl:value-of select="$nbsp"/>
                  </td>
                </xsl:otherwise>
              </xsl:choose>
            </tr>
            <xsl:if test="string-length(@src) != 0 and $parToonBron='2'">
              <tr>
                  <td valign="top" align="left">
                  <xsl:value-of select="$Txt_Bron"/>
                  </td>
                  <td colspan="3" valign="top" align="left">
                    <xsl:value-of select="@src"/>
                  </td>
              </tr>
            </xsl:if>
            <xsl:if test="string-length(NOTE) != 0 and $parToonNotitie='2'">
              <tr>
                <td valign="top"><xsl:value-of select="$Txt_Notitie"/></td>
                <td colspan="3" valign="top">
                  <xsl:value-of select="NOTE" disable-output-escaping="yes"/>
                </td>
              </tr>
            </xsl:if>

          </table>
        </td>
      </tr>
      </xsl:for-each> <!-- FACT -->
    </xsl:for-each> <!-- FACTS -->
    </xsl:if>

    <!-- ================================= -->
    <!-- Bronnenblok van de tabel -->
    <!-- ================================= -->
    
    <xsl:if test="$parToonBron='2'">
    <xsl:if test="EVENTS/BIRTH/@src or EVENTS/REGB/@src or EVENTS/BAPT/@src or EVENTS/DEATH/@src or EVENTS/REG/@src or EVENTS/BURI/@src or count (RELATIONS/RELA/@src)!=0 or count (RELATIONS/RELA/MARL/@src)!=0 or count (RELATIONS/RELA/MARC/@src)!=0">
      <tr>
      	<td colspan="2" valign="top">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="pk-data">
				<tr align="left">
					<td width="12%" valign="top"><xsl:value-of select="$Txt_Bronnen"/></td>
					<td valign="top">
					  <xsl:choose>
					    <xsl:when test="EVENTS/BIRTH/@scan or EVENTS/REGB/@scan or EVENTS/BAPT/@scan or EVENTS/DEATH/@scan or EVENTS/REG/@scan or EVENTS/BURI/@scan or count (RELATIONS/RELA/@scan)!=0 or count (RELATIONS/RELA/MARL/@scan)!=0 or count (RELATIONS/RELA/MARC/@scan)!=0">
					      <xsl:variable name="titletekst">
					        <xsl:if test="$parTaal='nederlands'"><xsl:value-of select="$parAkteNL"/></xsl:if>
					        <xsl:if test="$parTaal='engels'"><xsl:value-of select="$parAkteEN"/></xsl:if>
					        <xsl:if test="$parTaal='frans'"><xsl:value-of select="$parAkteFR"/></xsl:if>
					        <xsl:if test="$parTaal='duits'"><xsl:value-of select="$parAkteDU"/></xsl:if>
					      </xsl:variable>
					      <xsl:if test="string-length($titletekst) &gt; 0">
					        <xsl:if test="../@priv = 1">
					          <xsl:value-of select="$Txt_akteopvraagbaar"/><span><xsl:value-of select="$titletekst"/></span>
					        </xsl:if>
					        <xsl:if test="string-length(../@priv) = 0">
                              <a class="tooltip" href="javascript:KiesXSL(7,{$HuidigPersoon},'','')"><xsl:value-of select="$Txt_akteopvraagbaar"/><span><xsl:value-of select="$titletekst"/></span></a>
                            </xsl:if>
                          </xsl:if>
					    </xsl:when>
					    <xsl:otherwise>
					    </xsl:otherwise>
					  </xsl:choose>
					</td>
				</tr>
			    <xsl:if test="EVENTS/BIRTH/@src">
    			  <xsl:call-template name="dummy"/>
      			  <xsl:call-template name="BronWeergave">
    				<xsl:with-param name="tekst"><xsl:value-of select="$Txt_Geboorte"/></xsl:with-param>
    				<xsl:with-param name="source"><xsl:value-of select="EVENTS/BIRTH/@src"/></xsl:with-param>
      			  </xsl:call-template>
    			</xsl:if>
    
    			<xsl:if test="EVENTS/REGB/@src">
    			  <xsl:call-template name="dummy"/>
      			  <xsl:call-template name="BronWeergave">
    				<xsl:with-param name="tekst"><xsl:value-of select="$Txt_AangifteGeboorte"/></xsl:with-param>
    				<xsl:with-param name="source"><xsl:value-of select="EVENTS/REGB/@src"/></xsl:with-param>
    				<xsl:with-param name="scan"><xsl:value-of select="EVENTS/REGB/@scan"/></xsl:with-param>
    				<xsl:with-param name="akte_type">gb-akte</xsl:with-param>
      			  </xsl:call-template>
    			</xsl:if>

    			<xsl:if test="EVENTS/BAPT/@src">
    			  <xsl:call-template name="dummy"/>
      			  <xsl:call-template name="BronWeergave">
    				<xsl:with-param name="tekst"><xsl:value-of select="$Txt_Doop"/></xsl:with-param>
    				<xsl:with-param name="source"><xsl:value-of select="EVENTS/BAPT/@src"/></xsl:with-param>
      			  </xsl:call-template>
    			</xsl:if>

    			<xsl:if test="EVENTS/DEATH/@src">
    			  <xsl:call-template name="dummy"/>
      			  <xsl:call-template name="BronWeergave">
    				<xsl:with-param name="tekst"><xsl:value-of select="$Txt_Overlijden"/></xsl:with-param>
    				<xsl:with-param name="source"><xsl:value-of select="EVENTS/DEATH/@src"/></xsl:with-param>
      			  </xsl:call-template>
    			</xsl:if>

    			<xsl:if test="EVENTS/REG/@src">
    			  <xsl:call-template name="dummy"/>
      			  <xsl:call-template name="BronWeergave">
    				<xsl:with-param name="tekst"><xsl:value-of select="$Txt_AangifteOverlijden"/></xsl:with-param>
    				<xsl:with-param name="source"><xsl:value-of select="EVENTS/REG/@src"/></xsl:with-param>
    				<xsl:with-param name="scan"><xsl:value-of select="EVENTS/REG/@scan"/></xsl:with-param>
    				<xsl:with-param name="akte_type">ov-akte</xsl:with-param>
      			  </xsl:call-template>
    			</xsl:if>

    			<xsl:if test="EVENTS/BURI/@src">
    			  <xsl:call-template name="dummy"/>
      			  <xsl:call-template name="BronWeergave">
    				<xsl:with-param name="tekst">
                  	  <xsl:choose>
                    	<xsl:when test="EVENTS/BURI/@how=1"><xsl:value-of select="$Txt_Crematie"/></xsl:when>
                    	<xsl:when test="EVENTS/BURI/@how=2"><xsl:value-of select="$Txt_Begrafenis"/></xsl:when>
                    	<xsl:when test="EVENTS/BURI/@how=3"><xsl:value-of select="$Txt_Wetenschap"/></xsl:when>
                    	<xsl:when test="EVENTS/BURI/@how=4"><xsl:value-of select="$Txt_Vermist"/></xsl:when>
                    	<xsl:otherwise><xsl:value-of select="$Txt_Lijkbezorging"/></xsl:otherwise>
                  	  </xsl:choose>
    				</xsl:with-param>
    				<xsl:with-param name="source"><xsl:value-of select="EVENTS/BURI/@src"/></xsl:with-param>
      			  </xsl:call-template>
    			</xsl:if>

    			<xsl:for-each select="RELATIONS/RELA">
    			  <xsl:if test="@src">
    			    <xsl:call-template name="dummy"/>
      				<xsl:call-template name="BronRelatieWeergave">
    				  <xsl:with-param name="tp"><xsl:value-of select="@type"/></xsl:with-param>
    				  <xsl:with-param name="cntr"><xsl:value-of select="count(../RELA)"/></xsl:with-param>
    				  <xsl:with-param name="lnk"><xsl:value-of select="@link"/></xsl:with-param>
    				  <xsl:with-param name="source"><xsl:value-of select="@src"/></xsl:with-param>
    				  <xsl:with-param name="scan"><xsl:value-of select="@scan"/></xsl:with-param>
    				  <xsl:with-param name="akte_type">bh-akte</xsl:with-param>
      				</xsl:call-template>
    			  </xsl:if>
    			</xsl:for-each>

    			<xsl:for-each select="RELATIONS/RELA/MARL">
    			  <xsl:if test="@src">
    			    <xsl:call-template name="dummy"/>
      				<xsl:call-template name="BronRelatieWeergave">
    				  <xsl:with-param name="tp">11</xsl:with-param>
    				  <xsl:with-param name="cntr"><xsl:value-of select="count(../../RELA)"/></xsl:with-param>
    				  <xsl:with-param name="lnk"><xsl:value-of select="../@link"/></xsl:with-param>
    				  <xsl:with-param name="source"><xsl:value-of select="@src"/></xsl:with-param>
      				</xsl:call-template>
    			  </xsl:if>
    			</xsl:for-each>

    			<xsl:for-each select="RELATIONS/RELA/MARC">
    			  <xsl:if test="@src">
    			    <xsl:call-template name="dummy"/>
      				<xsl:call-template name="BronRelatieWeergave">
    				  <xsl:with-param name="tp">12</xsl:with-param>
    				  <xsl:with-param name="cntr"><xsl:value-of select="count(../../RELA)"/></xsl:with-param>
    				  <xsl:with-param name="lnk"><xsl:value-of select="../@link"/></xsl:with-param>
    				  <xsl:with-param name="source"><xsl:value-of select="@src"/></xsl:with-param>
    				  <xsl:with-param name="scan"><xsl:value-of select="@scan"/></xsl:with-param>
    				  <xsl:with-param name="akte_type">kh-akte</xsl:with-param>
      				</xsl:call-template>
    			</xsl:if>
    		  </xsl:for-each>
    
    		</table>
      	</td>
      </tr>
    </xsl:if>
    </xsl:if>
    
    <!-- ================================= -->
    <!-- Getuigenblok van de tabel -->
    <!-- ================================= -->
    
    <xsl:if test="$parToonGetuige='2'">
    
    <xsl:if test="EVENTS/REGB/WITN or EVENTS/BAPT/WITN or EVENTS/REG/WITN or EVENTS/BURI/WITN or count(RELATIONS/RELA/BEGIN/WITN)!=0 or count(RELATIONS/RELA/MARC/WITN) or count(RELATIONS/RELA/MARL/WITN)!=0">
      <tr>
      	<td colspan="2" valign="top">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="pk-data">
				<tr align="left">
					<td width="12%" valign="top"><xsl:value-of select="$Txt_Getuigen"/></td>
				</tr>
    			<xsl:if test="EVENTS/REGB/WITN">
      			  <tr>
              		<td valign="top">
                	  <xsl:value-of select="$Txt_AangifteGeboorte"/>
              		</td>
              		<td valign="top">
               		  <xsl:for-each select="EVENTS/REGB/WITN">
                 		<xsl:if test="count(../WITN) >1">
                   		  (<xsl:value-of select="position()"/>)
                 		</xsl:if>
                		<xsl:if test="@link">
                 		  <xsl:variable name="getuige" select="@link"/>
                 			<xsl:for-each select="//PERSONEN/PERSOON[@link=$getuige]">
                      		  <xsl:for-each select="PERSONAL">
                        		<xsl:call-template name="ShowPersoon">
                          		  <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
                          		  <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
                          		  <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
                          		  <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
                          		  <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
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
                		<br></br>
               		  </xsl:for-each>
              		</td>
      			  </tr>
    			</xsl:if>

    			<xsl:if test="EVENTS/BAPT/WITN">
      			  <tr>
              		<td valign="top">
                	  <xsl:value-of select="$Txt_Doop"/>
              		</td>
              		<td valign="top">
               		  <xsl:for-each select="EVENTS/BAPT/WITN">
                 		<xsl:if test="count(../WITN) >1">
                   		  (<xsl:value-of select="position()"/>)
                 		</xsl:if>
                		<xsl:if test="@link">
                 		  <xsl:variable name="getuige" select="@link"/>
                 			<xsl:for-each select="//PERSONEN/PERSOON[@link=$getuige]">
                      		  <xsl:for-each select="PERSONAL">
                        		<xsl:call-template name="ShowPersoon">
                          		  <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
                          		  <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
                          		  <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
                          		  <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
                          		  <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
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
                		<br></br>
               		  </xsl:for-each>
              		</td>
      			  </tr>
    			</xsl:if>

    			<xsl:if test="EVENTS/REG/WITN">
      			  <tr>
              		<td valign="top">
                	  <xsl:value-of select="$Txt_AangifteOverlijden"/>
              		</td>
              		<td valign="top">
               		  <xsl:for-each select="EVENTS/REG/WITN">
                 		<xsl:if test="count(../WITN) >1">
                   		  (<xsl:value-of select="position()"/>)
                 		</xsl:if>
                		<xsl:if test="@link">
                 		  <xsl:variable name="getuige" select="@link"/>
                 			<xsl:for-each select="//PERSONEN/PERSOON[@link=$getuige]">
                      		  <xsl:for-each select="PERSONAL">
                        		<xsl:call-template name="ShowPersoon">
                          		  <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
                          		  <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
                          		  <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
                          		  <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
                          		  <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
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
                		<br></br>
               		  </xsl:for-each>
              		</td>
      			  </tr>
    			</xsl:if>

    			<xsl:if test="EVENTS/BURI/WITN">
      			  <tr>
              		<td valign="top">
                 	  <xsl:choose>
                        <xsl:when test="EVENTS/BURI/@how=1"><xsl:value-of select="$Txt_Crematie"/></xsl:when>
                        <xsl:when test="EVENTS/BURI/@how=2"><xsl:value-of select="$Txt_Begrafenis"/></xsl:when>
                        <xsl:when test="EVENTS/BURI/@how=3"><xsl:value-of select="$Txt_Wetenschap"/></xsl:when>
                        <xsl:when test="EVENTS/BURI/@how=4"><xsl:value-of select="$Txt_Vermist"/></xsl:when>
                        <xsl:otherwise><xsl:value-of select="$Txt_Lijkbezorging"/></xsl:otherwise>
                      </xsl:choose>
              		</td>
              		<td valign="top">
               		  <xsl:for-each select="EVENTS/BURI/WITN">
                 		<xsl:if test="count(../WITN) >1">
                   		  (<xsl:value-of select="position()"/>)
                 		</xsl:if>
                		<xsl:if test="@link">
                 		  <xsl:variable name="getuige" select="@link"/>
                 			<xsl:for-each select="//PERSONEN/PERSOON[@link=$getuige]">
                      		  <xsl:for-each select="PERSONAL">
                        		<xsl:call-template name="ShowPersoon">
                          		  <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
                          		  <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
                          		  <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
                          		  <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
                          		  <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
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
                		<br></br>
               		  </xsl:for-each>
              		</td>
      			  </tr>
    			</xsl:if>

    			  <xsl:for-each select="RELATIONS/RELA/MARL">
    				<xsl:if test="WITN">
      				  <tr>
              			<td valign="top">
                		  <xsl:value-of select="$Txt_Ondertrouw"/><xsl:value-of select="$nbsp"/>
                		</td>
                		<td valign="top">
                 		  <xsl:if test="count(../../RELA) > 1">
                  			<xsl:value-of select="$Txt_met"/><xsl:text> </xsl:text>
                 			<xsl:variable name="relatie" select="../@link"/>
                 			<xsl:for-each select="//PERSONEN/PERSOON[@link=$relatie]">
                      		  <xsl:for-each select="PERSONAL">
                        		<xsl:call-template name="ShowPersoon">
                          		  <xsl:with-param name="relatie">partner</xsl:with-param>
                          		  <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
                          		  <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
                          		  <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
                          		  <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
                          		  <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
                          		  <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
                        		</xsl:call-template>
                      		  </xsl:for-each> <!-- PERSONAL -->
                  			</xsl:for-each>
                  		  <br></br>
                  		  </xsl:if>
               			  <xsl:for-each select="WITN">
                 			<xsl:if test="count(../WITN) >1">
                   			  (<xsl:value-of select="position()"/>)
                 			</xsl:if>
                			<xsl:if test="@link">
                 			  <xsl:variable name="getuige" select="@link"/>
                 			  <xsl:for-each select="//PERSONEN/PERSOON[@link=$getuige]">
                      			<xsl:for-each select="PERSONAL">
                        		  <xsl:call-template name="ShowPersoon">
                          			<xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
                          			<xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
                          			<xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
                          			<xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
                          			<xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
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
                			<br></br>
               			  </xsl:for-each>
              			</td>
      				  </tr>
    				</xsl:if>
    			  </xsl:for-each>
    			  
    			<xsl:for-each select="RELATIONS/RELA/BEGIN">
    			  <xsl:if test="WITN">
      				<tr>
              		  <td valign="top">
                  		<xsl:choose>
                    	  <xsl:when test="../@type=1"><xsl:value-of select="$Txt_Huwelijk"/></xsl:when>
                    	  <xsl:when test="../@type=2"><xsl:value-of select="$Txt_Notarieel"/></xsl:when>
                    	  <xsl:when test="../@type=3"><xsl:value-of select="$Txt_Samenleven"/></xsl:when>
                    	  <xsl:when test="../@type=4"><xsl:value-of select="$Txt_Relatie"/></xsl:when>
                    	  <xsl:when test="../@type=5"><xsl:value-of select="$Txt_OntbrekendeRelatie"/></xsl:when>
                    	  <xsl:otherwise><xsl:value-of select="$Txt_OnbekendeRelatie"/></xsl:otherwise>
                  		</xsl:choose>
                  	  </td>
                  	  <td valign="top">
                 		<xsl:if test="count(../../RELA) > 1">
                  		  <xsl:value-of select="$Txt_met"/><xsl:text> </xsl:text>
                 		  <xsl:variable name="relatie" select="../@link"/>
                 			<xsl:for-each select="//PERSONEN/PERSOON[@link=$relatie]">
                      		  <xsl:for-each select="PERSONAL">
                        		<xsl:call-template name="ShowPersoon">
                          		  <xsl:with-param name="relatie">partner</xsl:with-param>
                          		  <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
                          		  <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
                          		  <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
                          		  <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
                          		  <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
                          		  <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
                        		</xsl:call-template>
                      		  </xsl:for-each> <!-- PERSONAL -->
                  			</xsl:for-each>
                  		  <br></br>
                  		  </xsl:if>
               			  <xsl:for-each select="WITN">
                 			<xsl:if test="count(../WITN) >1">
                   			  (<xsl:value-of select="position()"/>)
                 			</xsl:if>
                			<xsl:if test="@link">
                 			  <xsl:variable name="getuige" select="@link"/>
                 			  <xsl:for-each select="//PERSONEN/PERSOON[@link=$getuige]">
                      			<xsl:for-each select="PERSONAL">
                        		  <xsl:call-template name="ShowPersoon">
                          			<xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
                          			<xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
                          			<xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
                          			<xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
                          			<xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
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
                			<br></br>
               			  </xsl:for-each>
              			</td>
      				  </tr>
    				</xsl:if>
    			  </xsl:for-each>

    			  <xsl:for-each select="RELATIONS/RELA/MARC">
    				<xsl:if test="WITN">
      				  <tr>
              			<td valign="top">
                		  <xsl:value-of select="$Txt_KerkelijkHuwelijk"/>
                		</td>
                		<td valign="top">
                 		  <xsl:if test="count(../../RELA) > 1">
                  			<xsl:value-of select="$Txt_met"/><xsl:text> </xsl:text>
                 			<xsl:variable name="relatie" select="../@link"/>
                 			<xsl:for-each select="//PERSONEN/PERSOON[@link=$relatie]">
                      		  <xsl:for-each select="PERSONAL">
                        		<xsl:call-template name="ShowPersoon">
                          		  <xsl:with-param name="relatie">partner</xsl:with-param>
                          		  <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
                          		  <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
                          		  <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
                          		  <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
                          		  <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
                          		  <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
                        		</xsl:call-template>
                      		  </xsl:for-each> <!-- PERSONAL -->
                  			</xsl:for-each>
                  		  <br></br>
                  		  </xsl:if>
               			  <xsl:for-each select="WITN">
                 			<xsl:if test="count(../WITN) >1">
                   			  (<xsl:value-of select="position()"/>)
                 			</xsl:if>
                			<xsl:if test="@link">
                 			  <xsl:variable name="getuige" select="@link"/>
                 			  <xsl:for-each select="//PERSONEN/PERSOON[@link=$getuige]">
                      			<xsl:for-each select="PERSONAL">
                        		  <xsl:call-template name="ShowPersoon">
                          			<xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
                          			<xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
                          			<xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
                          			<xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
                          			<xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
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
                			<br></br>
               			  </xsl:for-each>
              			</td>
      				  </tr>
    				</xsl:if>
    			  </xsl:for-each>
    			  
    		  </table>
      	  </td>
      	</tr>
    </xsl:if>
    </xsl:if>
    
    <!-- ================================= -->
    <!-- Getuigen-bij-blok van de tabel -->
    <!-- ================================= -->
    
    <xsl:if test="$parToonGetuige='2'">
      <xsl:variable name="persoonlink">
      	<xsl:value-of select="@link"/>
      </xsl:variable>
    
      <xsl:if test="count(//PERSONEN/PERSOON/EVENTS/REGB/WITN[@link=$persoonlink])!=0 or count(//PERSONEN/PERSOON/EVENTS/BAPT/WITN[@link=$persoonlink])!=0 or count(//PERSONEN/PERSOON/EVENTS/REG/WITN[@link=$persoonlink])!=0 or count(//PERSONEN/PERSOON/EVENTS/BURI/WITN[@link=$persoonlink])!=0 or count(//PERSONEN/PERSOON/RELATIONS/RELA/BEGIN/WITN[@link=$persoonlink])!=0 or count(//PERSONEN/PERSOON/RELATIONS/RELA/MARC/WITN[@link=$persoonlink]) or count(//PERSONEN/PERSOON/RELATIONS/RELA/MARL/WITN[@link=$persoonlink])!=0">
        <tr>
      	  <td colspan="2" valign="top">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="pk-data">
				<tr align="left">
					<td width="12%" valign="top"><xsl:value-of select="$Txt_Getuige"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_bij"/></td>
				</tr>
    			<xsl:for-each select="//PERSONEN/PERSOON/EVENTS/REGB/WITN[@link=$persoonlink]">
      			  <tr>
              		<td valign="top">
                	  <xsl:value-of select="$Txt_AangifteGeboorte"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/>
              		</td>
              		<td valign="top">
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
              		<td valign="top">
                	  <xsl:value-of select="$Txt_Doop"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/>
              		</td>
              		<td valign="top">
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
              		<td valign="top">
                	  <xsl:value-of select="$Txt_AangifteOverlijden"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/>
              		</td>
              		<td valign="top">
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
              		<td valign="top">
                 	  <xsl:choose>
                        <xsl:when test="../@how=1"><xsl:value-of select="$Txt_Crematie"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/></xsl:when>
                        <xsl:when test="../@how=2"><xsl:value-of select="$Txt_Begrafenis"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/></xsl:when>
                        <xsl:when test="../@how=3"><xsl:value-of select="$Txt_Wetenschap"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/></xsl:when>
                        <xsl:when test="../@how=4"><xsl:value-of select="$Txt_Vermist"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/></xsl:when>
                        <xsl:otherwise><xsl:value-of select="$Txt_Lijkbezorging"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/></xsl:otherwise>
                      </xsl:choose>
              		</td>
              		<td valign="top">
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

    			<xsl:for-each select="//PERSONEN/PERSOON/RELATIONS/RELA/BEGIN/WITN[@link=$persoonlink]">
              	  <xsl:variable name="partner1">
              		<xsl:value-of select="../../../../@link"/>
              	  </xsl:variable>
              	  <xsl:variable name="partner2">
              		<xsl:value-of select="../../@link"/>
              	  </xsl:variable>
              	  <xsl:if test="$partner1 &lt; $partner2">
      			    <tr>
              		  <td valign="top">
                  		<xsl:choose>
                    	  <xsl:when test="../../@type=1"><xsl:value-of select="$Txt_Huwelijk"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/></xsl:when>
                    	  <xsl:when test="../../@type=2"><xsl:value-of select="$Txt_Notarieel"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/></xsl:when>
                    	  <xsl:when test="../../@type=3"><xsl:value-of select="$Txt_Samenleven"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/></xsl:when>
                    	  <xsl:when test="../../@type=4"><xsl:value-of select="$Txt_Relatie"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/></xsl:when>
                    	  <xsl:when test="../../@type=5"><xsl:value-of select="$Txt_OntbrekendeRelatie"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/></xsl:when>
                    	  <xsl:otherwise><xsl:value-of select="$Txt_OnbekendeRelatie"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/></xsl:otherwise>
                  		</xsl:choose>
              		  </td>
              		  <td valign="top">
                        <xsl:call-template name="ShowPersoon">
                          <xsl:with-param name="NAMEFIRST"><xsl:value-of select="../../../../PERSONAL/NAME/@first"/></xsl:with-param>
                          <xsl:with-param name="NAMENICK"><xsl:value-of select="../../../../PERSONAL/NAME/@nick"/></xsl:with-param>
                          <xsl:with-param name="NAMEPREF"><xsl:value-of select="../../../../PERSONAL/NAME/@pref"/></xsl:with-param>
                          <xsl:with-param name="SURN"><xsl:value-of select="../../../../PERSONAL/NAME/@surn"/></xsl:with-param>
                          <xsl:with-param name="src"><xsl:value-of select="$partner1"/></xsl:with-param>
                          <xsl:with-param name="priv"><xsl:value-of select="../../../../@priv"/></xsl:with-param>
                        </xsl:call-template>
              		    en
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
              		  <td valign="top">
                		<xsl:value-of select="$Txt_KerkelijkHuwelijk"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/>
              		  </td>
              		  <td valign="top">
                        <xsl:call-template name="ShowPersoon">
                          <xsl:with-param name="NAMEFIRST"><xsl:value-of select="../../../../PERSONAL/NAME/@first"/></xsl:with-param>
                          <xsl:with-param name="NAMENICK"><xsl:value-of select="../../../../PERSONAL/NAME/@nick"/></xsl:with-param>
                          <xsl:with-param name="NAMEPREF"><xsl:value-of select="../../../../PERSONAL/NAME/@pref"/></xsl:with-param>
                          <xsl:with-param name="SURN"><xsl:value-of select="../../../../PERSONAL/NAME/@surn"/></xsl:with-param>
                          <xsl:with-param name="src"><xsl:value-of select="$partner1"/></xsl:with-param>
                          <xsl:with-param name="priv"><xsl:value-of select="../../../../@priv"/></xsl:with-param>
                        </xsl:call-template>
              		    en
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

    			<xsl:for-each select="//PERSONEN/PERSOON/RELATIONS/RELA/MARL/WITN[@link=$persoonlink]">
              	  <xsl:variable name="partner1">
              		<xsl:value-of select="../../../../@link"/>
              	  </xsl:variable>
              	  <xsl:variable name="partner2">
              		<xsl:value-of select="../../@link"/>
              	  </xsl:variable>
              	  <xsl:if test="$partner1 &lt; $partner2">
      			    <tr>
              		  <td valign="top">
                		<xsl:value-of select="$Txt_Ondertrouw"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/>
              		  </td>
              		  <td valign="top">
                        <xsl:call-template name="ShowPersoon">
                          <xsl:with-param name="NAMEFIRST"><xsl:value-of select="../../../../PERSONAL/NAME/@first"/></xsl:with-param>
                          <xsl:with-param name="NAMENICK"><xsl:value-of select="../../../../PERSONAL/NAME/@nick"/></xsl:with-param>
                          <xsl:with-param name="NAMEPREF"><xsl:value-of select="../../../../PERSONAL/NAME/@pref"/></xsl:with-param>
                          <xsl:with-param name="SURN"><xsl:value-of select="../../../../PERSONAL/NAME/@surn"/></xsl:with-param>
                          <xsl:with-param name="src"><xsl:value-of select="$partner1"/></xsl:with-param>
                          <xsl:with-param name="priv"><xsl:value-of select="../../../../@priv"/></xsl:with-param>
                        </xsl:call-template>
              		    en
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
		  </td>
		</tr>
      </xsl:if>
    </xsl:if>
    
    	  

    <!-- ================================= -->
    <!-- Notitie blok van de tabel -->
    <!-- ================================= -->
    
    <xsl:if test="$parToonNotitie='2'">
    <xsl:if test="PERSONAL/NOTE or EVENTS/BIRTH/NOTE or EVENTS/DEATH/NOTE or count(RELATIONS/RELA/NOTE) != 0">
      <tr>
      	<td colspan="2" valign="top">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="pk-data">
				<tr align="left">
					<td width="12%" valign="top"><xsl:value-of select="$Txt_Notities"/></td>
				</tr>
    			<xsl:if test="PERSONAL/NOTE">
    			  <xsl:call-template name="NotitieWeergave">
    				<xsl:with-param name="tekst"><xsl:value-of select="$Txt_Algemeen"/></xsl:with-param>
    				<xsl:with-param name="note"><xsl:value-of select="PERSONAL/NOTE"/></xsl:with-param>
    			  </xsl:call-template>
   				</xsl:if>

    			<xsl:if test="EVENTS/BIRTH/NOTE">
    			  <xsl:call-template name="NotitieWeergave">
    				<xsl:with-param name="tekst"><xsl:value-of select="$Txt_Geboorte"/></xsl:with-param>
    				<xsl:with-param name="note"><xsl:value-of select="EVENTS/BIRTH/NOTE"/></xsl:with-param>
    			  </xsl:call-template>
    			</xsl:if>
    
    			<xsl:if test="EVENTS/DEATH/NOTE">
    			  <xsl:call-template name="NotitieWeergave">
    				<xsl:with-param name="tekst"><xsl:value-of select="$Txt_Overlijden"/></xsl:with-param>
    				<xsl:with-param name="note"><xsl:value-of select="EVENTS/DEATH/NOTE"/></xsl:with-param>
    			  </xsl:call-template>
    			</xsl:if>
    
    			<xsl:for-each select="RELATIONS/RELA">
      			  <xsl:if test="NOTE">
        			<tr>
                	  <td valign="top">
                  		<xsl:choose>
                    	  <xsl:when test="@type=1"><xsl:value-of select="$Txt_Huwelijk"/></xsl:when>
                    	  <xsl:when test="@type=2"><xsl:value-of select="$Txt_Notarieel"/></xsl:when>
                    	  <xsl:when test="@type=3"><xsl:value-of select="$Txt_Samenleven"/></xsl:when>
                    	  <xsl:when test="@type=4"><xsl:value-of select="$Txt_Relatie"/></xsl:when>
                    	  <xsl:when test="@type=5"><xsl:value-of select="$Txt_OntbrekendeRelatie"/></xsl:when>
                    	  <xsl:otherwise><xsl:value-of select="$Txt_OnbekendeRelatie"/></xsl:otherwise>
                  		</xsl:choose>
                  		</td>
                  		<td valign="top">
                 		<xsl:if test="count(../RELA) > 1">
                  		  <xsl:value-of select="$Txt_met"/><xsl:text> </xsl:text>
                 		  <xsl:variable name="relatie" select="@link"/>
                 		  <xsl:for-each select="//PERSONEN/PERSOON[@link=$relatie]">
                      		<xsl:for-each select="PERSONAL">
                        	  <xsl:call-template name="ShowPersoon">
                          		<xsl:with-param name="relatie">partner</xsl:with-param>
                          		<xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
                          		<xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
                          		<xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
                          		<xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
                          		<xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
                          		<xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
                        	  </xsl:call-template>
                      		</xsl:for-each> <!-- PERSONAL -->
                  		  </xsl:for-each>
                  		  <br></br>
                  		</xsl:if>
                  		  <xsl:value-of select="NOTE" disable-output-escaping="yes"/>
                		  <br></br><xsl:value-of select="$nbsp"/>
                		</td>
        			  </tr>
      			  </xsl:if>
    			</xsl:for-each>
    		</table>
      	</td>
      </tr>
    </xsl:if>
    </xsl:if>
       <xsl:if test="$parToonPKKaart = 1">
      <tr>
      	<td colspan="2" valign="top" align="center">
      		<div id="map" style="width:100%; height: 300px"></div>
      	</td>
      </tr>
      </xsl:if>
    
  		</table>

<xsl:if test="$parToonPKVoettekst=2">
<blockquote class="pk-width" style="text-align:left">
  <p>
  <xsl:variable name="subject">
    <xsl:text>FleXiTree</xsl:text>
    <xsl:choose>
  	  <xsl:when test="$refAchternaam">
  	    <xsl:text>: Stamboom familie </xsl:text>
  	    <xsl:if test="$refPrefix">
  	      <xsl:value-of select="$refPrefix"/><xsl:text> </xsl:text>
  	    </xsl:if>
  	    <xsl:value-of select="$refAchternaam"/>
  	  </xsl:when>
  	  <xsl:otherwise>
	  </xsl:otherwise>
  	</xsl:choose>
	<xsl:text>. Informatie over </xsl:text>
      <xsl:for-each select="PERSONAL/NAME">
         <xsl:if test="string-length(@first)>0"><xsl:value-of select="@first"/></xsl:if>
         <xsl:if test="string-length(@first)=0"><xsl:value-of select="@nick"/></xsl:if>
         <xsl:if test="string-length(@pref)>0"><xsl:text> </xsl:text><xsl:value-of select="@pref"/></xsl:if>
         <xsl:text> </xsl:text><xsl:value-of select="@surn"/>
      </xsl:for-each>
    <xsl:text>; interne code </xsl:text><xsl:value-of select="@link"/>.
  </xsl:variable>
  <xsl:call-template name="Txt_Persoonskaartvoettekst">
    <xsl:with-param name="first"><xsl:value-of select="PERSONAL/NAME/@first"/></xsl:with-param>
    <xsl:with-param name="nick"><xsl:value-of select="PERSONAL/NAME/@nick"/></xsl:with-param>
    <xsl:with-param name="pref"><xsl:value-of select="PERSONAL/NAME/@pref"/></xsl:with-param>
    <xsl:with-param name="surn"><xsl:value-of select="PERSONAL/NAME/@surn"/></xsl:with-param>
    <xsl:with-param name="link"><xsl:value-of select="@link"/></xsl:with-param>
    <xsl:with-param name="chg"><xsl:value-of select="@chg"/></xsl:with-param>
    <xsl:with-param name="subject"><xsl:value-of select="$subject"/></xsl:with-param>
  </xsl:call-template>
  </p>
</blockquote>

</xsl:if>
</div>

<xsl:call-template name="ShowFooter"/>

</xsl:for-each>

</xsl:template>

<xsl:template name="NotitieWeergave">
  <xsl:param name="tekst"></xsl:param>
  <xsl:param name="note"></xsl:param>
      <tr>
        <td valign="top">
          <xsl:value-of select="$tekst"/>
        </td>
        <td valign="top">
          <xsl:value-of select="$note" disable-output-escaping="yes"/>
          <br></br><xsl:value-of select="$nbsp"/>
        </td>
      </tr>
</xsl:template>

<xsl:template name="BronWeergave">
  <xsl:param name="tekst"></xsl:param>
  <xsl:param name="source"></xsl:param>
  <xsl:param name="scan"></xsl:param>
  <xsl:param name="akte_type"></xsl:param>
      <tr>
        <td valign="top">
          <xsl:value-of select="$tekst"/>
        </td>
        <td valign="top">
    	  <xsl:choose>
    		<xsl:when test="$scan = 1">
    		  <xsl:variable name="subject">
    			<xsl:text>Aanvraag </xsl:text><xsl:value-of select="@link"/><xsl:text> </xsl:text><xsl:value-of select="$akte_type"/><xsl:text> </xsl:text><xsl:value-of select="$source"/>
    		  </xsl:variable>
    		  <a href="mailto:{$refOwnerEMail}?subject={$subject}"><xsl:value-of select="$source"/></a>
    	    </xsl:when>
    		<xsl:otherwise>
    		  <xsl:value-of select="$source"/>
    		</xsl:otherwise>
    	  </xsl:choose>
        </td>
      </tr>
</xsl:template>

<xsl:template name="BronRelatieWeergave">
  <xsl:param name="tp"></xsl:param>
  <xsl:param name="cntr"></xsl:param>
  <xsl:param name="lnk"></xsl:param>
  <xsl:param name="source"></xsl:param>
  <xsl:param name="scan"></xsl:param>
  <xsl:param name="akte_type"></xsl:param>
        <tr>
          <td valign="top">
            <xsl:choose>
              <xsl:when test="$tp=1"><xsl:value-of select="$Txt_Huwelijk"/></xsl:when>
              <xsl:when test="$tp=2"><xsl:value-of select="$Txt_Notarieel"/></xsl:when>
              <xsl:when test="$tp=3"><xsl:value-of select="$Txt_Samenleven"/></xsl:when>
              <xsl:when test="$tp=4"><xsl:value-of select="$Txt_Relatie"/></xsl:when>
              <xsl:when test="$tp=5"><xsl:value-of select="$Txt_OntbrekendeRelatie"/></xsl:when>
              <xsl:when test="$tp=11"><xsl:value-of select="$Txt_Ondertrouw"/></xsl:when>
              <xsl:when test="$tp=12"><xsl:value-of select="$Txt_KerkelijkHuwelijk"/></xsl:when>
              <xsl:otherwise><xsl:value-of select="$Txt_OnbekendeRelatie"/></xsl:otherwise>
            </xsl:choose>
          </td>
          <td valign="top">
            <xsl:if test="$cntr > 1">
              <xsl:value-of select="$Txt_met"/><xsl:text> </xsl:text>
              <xsl:variable name="relatie" select="$lnk"/>
              <xsl:for-each select="//PERSONEN/PERSOON[@link=$relatie]">
                <xsl:for-each select="PERSONAL">
                  <xsl:call-template name="ShowPersoon">
                    <xsl:with-param name="relatie">partner</xsl:with-param>
                    <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
                    <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
                    <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
                    <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
                    <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
                    <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
                  </xsl:call-template>
                </xsl:for-each> <!-- PERSONAL -->
              </xsl:for-each>
              <br></br>
            </xsl:if>
    	  <xsl:choose>
    		<xsl:when test="$scan = 1">
    		  <xsl:variable name="subject">
    			<xsl:text>Aanvraag </xsl:text><xsl:value-of select="$HuidigPersoon"/><xsl:text> </xsl:text><xsl:value-of select="$akte_type"/><xsl:text> </xsl:text><xsl:value-of select="$source" disable-output-escaping="yes"/>
    		  </xsl:variable>
    		  <a href="mailto:{$refOwnerEMail}?subject={$subject}"><xsl:value-of select="$source" disable-output-escaping="yes"/></a>
    	    </xsl:when>
    		<xsl:otherwise>
    		  <xsl:value-of select="$source" disable-output-escaping="yes"/>
    		</xsl:otherwise>
    	  </xsl:choose>
          </td>
        </tr>
</xsl:template>

<xsl:template name="ShowPAofMa">
  <xsl:param name="relatie"></xsl:param>
  <xsl:param name="linkpers"></xsl:param>
  <xsl:param name="oudertype"></xsl:param>

  <xsl:for-each select="//PERSONEN/PERSOON[@link=$linkpers]">
    <xsl:for-each select="PERSONAL">
      <tr align="left">
        <td width="24%" valign="top">
          <xsl:value-of select="$relatie"/>
        </td>
        <td colspan="3" valign="top">
          <xsl:call-template name="ShowPersoon">
            <xsl:with-param name="relatie"><xsl:value-of select="$relatie"/></xsl:with-param>
            <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
            <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
            <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
            <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
            <xsl:with-param name="src"><xsl:value-of select="$linkpers"/></xsl:with-param>
            <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
          </xsl:call-template>
          <xsl:if test="string-length($oudertype)">
            <xsl:call-template name="showTypeKind">
              <xsl:with-param name="type"><xsl:value-of select="$oudertype"/></xsl:with-param>
            </xsl:call-template>
          </xsl:if>
        </td>
      </tr>
    </xsl:for-each> <!-- PERSONAL -->

    <xsl:for-each select="EVENTS">
      <xsl:for-each select="BIRTH[@date or @place]">
        <tr align="left">
          <td width="24%" valign="top">
            <xsl:value-of select="$Txt_Geboorte"/>
          </td>
          <td valign="top">
                  <xsl:value-of select="@onz"/><xsl:text> </xsl:text>
                  <xsl:call-template name="Txt_wd">
                    <xsl:with-param name="wd"><xsl:value-of select="@wd"/></xsl:with-param>
                  </xsl:call-template>
                  <xsl:text> </xsl:text><xsl:value-of select="@date"/>
                  <xsl:if test="@time">
                    <br /><xsl:value-of select="$Txt_om"/><xsl:text> </xsl:text><xsl:value-of select="@time"/>
                  </xsl:if>
          </td>
          <td valign="top">
            <xsl:if test="@place">
            <xsl:value-of select="$Txt_te"/>
            </xsl:if>
            <xsl:value-of select="$nbsp"/>
          </td>
          <td width="35%" valign="top">
                  <xsl:choose>
                    <xsl:when test="$parToonPKKaart = 1">
                	  <xsl:call-template name="plaatsinfo">
                		<xsl:with-param name="plaats"><xsl:value-of select="@place"/></xsl:with-param>
                	  </xsl:call-template>
                	</xsl:when>
                	<xsl:otherwise>
                	  <xsl:value-of select="@place"/>
                	</xsl:otherwise>
                 </xsl:choose>
          </td>
        </tr>
      </xsl:for-each>  <!-- BIRTH -->
      <xsl:for-each select="DEATH">
        <tr align="left">
          <td width="24%" valign="top">
            <xsl:value-of select="$Txt_Overlijden"/>
          </td>
          <td valign="top">
                  <xsl:value-of select="@onz"/><xsl:text> </xsl:text>
                  <xsl:call-template name="Txt_wd">
                    <xsl:with-param name="wd"><xsl:value-of select="@wd"/></xsl:with-param>
                  </xsl:call-template>
                  <xsl:text> </xsl:text><xsl:value-of select="@date"/>
                  <xsl:if test="@time">
                    <br /><xsl:value-of select="$Txt_om"/><xsl:text> </xsl:text><xsl:value-of select="@time"/>
                  </xsl:if>
          </td>
          <td valign="top">
            <xsl:if test="@place">
            <xsl:value-of select="$Txt_te"/>
            </xsl:if>
            <xsl:value-of select="$nbsp"/>
          </td>
          <td width="35%" valign="top">
                  <xsl:choose>
                    <xsl:when test="$parToonPKKaart = 1">
                	  <xsl:call-template name="plaatsinfo">
                		<xsl:with-param name="plaats"><xsl:value-of select="@place"/></xsl:with-param>
                	  </xsl:call-template>
                	</xsl:when>
                	<xsl:otherwise>
                	  <xsl:value-of select="@place"/>
                	</xsl:otherwise>
                 </xsl:choose>
          </td>
        </tr>
      </xsl:for-each>         <!-- DEATH -->
    </xsl:for-each>         <!-- EVENTS -->
  </xsl:for-each>         <!-- PERSOON -->
</xsl:template>

<xsl:template name="dummy">
</xsl:template>

<xsl:template name="plaatsinfo">
	<xsl:param name="plaats"/>

      <xsl:variable name="plc">
      	<xsl:value-of select="$plaats"/>
      </xsl:variable>
      <xsl:variable name="id_nr">
      	<xsl:for-each select="//PLAATSEN/PLAATS[@naam = $plc]">
      	  <xsl:value-of select="@id"/>
      	</xsl:for-each>
      </xsl:variable>
      <xsl:choose>
      <xsl:when test="$id_nr >= 0">
        <xsl:element name="a">
           <xsl:attribute name="href">javascript:plaatsinfo(plaats_ind_inv[<xsl:value-of select="$id_nr"/>],lat[<xsl:value-of select="$id_nr"/>],lng[<xsl:value-of select="$id_nr"/>],plaatsnaam[<xsl:value-of select="$id_nr"/>])</xsl:attribute>
           <xsl:value-of select="$plaats"/>
        </xsl:element>
       </xsl:when>
       <xsl:otherwise><xsl:value-of select="$plaats"/></xsl:otherwise>
       </xsl:choose>
</xsl:template>


</xsl:stylesheet>
