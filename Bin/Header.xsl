<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:user="http://www.adriedenblanken.nl/"
		version="1.0">
<!--
// <author>Adrie den Blanken</author>
// <file>$Workfile: Header.xsl $</file><date>$Date: 30-12-13 15:12 $</date>
// <revision>$Revision: 49 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this
// header stays intact. No responsibility is accepted
// for use of this software.</disclaimer>
-->
<!-- Start of Remaining part -->
<xsl:param name="parRefCopyright"/>
<xsl:variable name="nbsp"    select="'&#160;'"/>     <!-- spatie -->
<xsl:variable name="dagger"  select="'&#8224;'"/>    <!-- Overledenteken -->
<xsl:variable name="degrees" select="'&#0176;'"/>    <!-- Geboorteteken -->
<xsl:variable name="squote"  select='"&#39;"'/>      <!-- Single quote -->
<xsl:variable name="tussenkol" select="1"/>          <!-- ruimte tussen kolommen in meerkoomslijsten (%) -->
<xsl:variable name="MinPerKolom" select="10"/>       <!-- minimaal aantal elementen in meerkolomslijsten voordat volgende kolom wordt gemaakt -->
<!-- Globale Instellingen -->
<xsl:variable name="refOwner"><xsl:value-of select="$parRefOwner"/></xsl:variable>
<xsl:variable name="refOwnerEMail"><xsl:value-of select="$parRefOwnerEMail"/></xsl:variable>
<xsl:variable name="refCopyright"><xsl:value-of select="$parRefCopyright"/></xsl:variable>
<xsl:variable name="varToonNieuws"><xsl:value-of select="$parToonNieuws"/></xsl:variable>
<xsl:variable name="varToonKalender"><xsl:value-of select="$parToonKalender"/></xsl:variable>
<xsl:variable name="varStuurSorteersleutel"><xsl:value-of select="$parStuurSorteersleutel"/></xsl:variable>
<!-- Instellingen per stamboom -->
<xsl:variable name="refPersoon"><xsl:value-of select="//INSTELLINGEN/REF/@link"/></xsl:variable>
<xsl:variable name="refPrefix"><xsl:value-of select="//INSTELLINGEN/REF/@pref"/></xsl:variable>
<xsl:variable name="refAchternaam"><xsl:value-of select="//INSTELLINGEN/REF/@surn"/></xsl:variable>
<xsl:variable name="varFolderFotoAlbum"><xsl:value-of select="//INSTELLINGEN/TOON/@fotofolder"/></xsl:variable>

<xsl:template name="ShowMenubar">
  <xsl:param name="NAMEFIRST"/>
  <xsl:param name="NAMENICK"/>
  <xsl:param name="NAMEPREF"/>
  <xsl:param name="SURN"/>
  <xsl:param name="src"/>
  
    <xsl:variable name="hyperName">
     <xsl:call-template name="Voornaam">
       <xsl:with-param name="nick"><xsl:value-of select="$NAMENICK"/></xsl:with-param>
       <xsl:with-param name="first"><xsl:value-of select="$NAMEFIRST"/></xsl:with-param>
     </xsl:call-template>
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
  
  <table align="center" border="0" cellpadding="0" cellspacing="0">
    <tr class="tr-menu-tekst">
      <td class="td-menu-tekst">
         <a href="javascript:KiesXSL(27,'{$src}','')"
           onMouseOver = "muisOver(12); window.status='{$Txt_Welkom}'; return true;"
           onMouseOut  = "muisUit(12); window.status='';">
           <DIV id="veld12a" style="cursor:pointer"><xsl:value-of select="$Txt_Welkom"/></DIV>
           <DIV id="veld12b" style="visibility:hidden; cursor:pointer"><xsl:value-of select="$Txt_Welkom"/></DIV>
         </a>
      </td>
      <td class="td-menu-tekst">
        <a href="javascript:KiesXSL(7,'{$src}','')"
           onMouseOver = "muisOver(2); window.status='{$Txt_Bekijk_Persoonskaart} {$hyperNameNoQuote}'; return true;"
           onMouseOut  = "muisUit(2); window.status='';">
          <DIV id="veld2a" style="cursor:pointer"><xsl:value-of select="$Txt_Persoonskaart"/></DIV>
          <DIV id="veld2b" style="visibility:hidden; cursor:pointer"><xsl:value-of select="$Txt_Persoonskaart"/></DIV>
        </a>
      </td>
      <td class="td-menu-tekst">
        <a href        = "javascript:KiesXSL(8,'{$src}','')"
           onMouseOver = "muisOver(1); window.status='{$Txt_Voorgeslacht} {$hyperNameNoQuote}'; return true;"
           onMouseOut  = "muisUit(1); window.status='';">
           <DIV id="veld1a" style="cursor:pointer"><xsl:value-of select="$Txt_Voorgeslacht"/></DIV>
           <DIV id="veld1b" style="visibility:hidden; cursor:pointer"><xsl:value-of select="$Txt_Voorgeslacht"/></DIV>
        </a>
      </td>
      <td class="td-menu-tekst">
        <a href        = "javascript:KiesXSL(6,'{$src}','B','1')"
           onMouseOver = "muisOver(3); window.status='{$Txt_Nageslacht} {$hyperNameNoQuote}'; return true;"
           onMouseOut  = "muisUit(3); window.status='';">
           <DIV id="veld3a" style="cursor:pointer"><xsl:value-of select="$Txt_Nageslacht"/></DIV>
           <DIV id="veld3b" style="visibility:hidden; cursor:pointer"><xsl:value-of select="$Txt_Nageslacht"/></DIV>
        </a>
      </td>
      <td class="td-menu-tekst">
      <xsl:choose>
        <xsl:when test="$Browser != 'OP'">
            <a href       ="javascript:KiesXSL(90,'{$src}','')"
               onMouseOver = "muisOver(4); window.status='{$Txt_Verwantschap} {$hyperNameNoQuote}'; return true;"
               onMouseOut  = "muisUit(4); window.status='';">
               <DIV id="veld4a" style="cursor:pointer"><xsl:value-of select="$Txt_Verwantschap"/></DIV>
               <DIV id="veld4b" style="visibility:hidden; cursor:pointer"><xsl:value-of select="$Txt_Verwantschap"/></DIV>
            </a>
        </xsl:when>
        <xsl:otherwise>
          <DIV id="veld4a" style="cursor:pointer"><xsl:value-of select="$nbsp"/></DIV>
        </xsl:otherwise>
      </xsl:choose>
      </td>
      <td class="td-menu-tekst">
        <a href       ="javascript:KiesXSL(5,'{$src}','')"
           onMouseOver = "muisOver(5); window.status='{$Txt_Help}'; return true;"
           onMouseOut  = "muisUit(5); window.status='';">
           <DIV id="veld5a" style="cursor:pointer"><xsl:value-of select="$Txt_Help"/></DIV>
           <DIV id="veld5b" style="visibility:hidden; cursor:pointer"><xsl:value-of select="$Txt_Help"/></DIV>
        </a>
      </td>
   </tr>
   <tr class="tr-menu-tekst">
      <td class="td-menu-tekst">
         <a href="javascript:KiesXSL(19,'{$src}','','')"
           onMouseOver = "muisOver(11); window.status='{$Txt_Instellingen}'; return true;"
           onMouseOut  = "muisUit(11); window.status='';">
           <DIV id="veld11a" style="cursor:pointer"><xsl:value-of select="$Txt_Instellingen"/></DIV>
           <DIV id="veld11b" style="visibility:hidden; cursor:pointer"><xsl:value-of select="$Txt_Instellingen"/></DIV>
         </a>
      </td>
      <td class="td-menu-tekst">
         <a href="javascript:KiesXSL(1,'{$src}','')"
           onMouseOver = "muisOver(7); window.status='{$Txt_Overzichten}'; return true;"
           onMouseOut  = "muisUit(7); window.status='';">
           <DIV id="veld7a" style="cursor:pointer"><xsl:value-of select="$Txt_Overzichten"/></DIV>
           <DIV id="veld7b" style="visibility:hidden; cursor:pointer"><xsl:value-of select="$Txt_Overzichten"/></DIV>
         </a>
      </td>
      <td class="td-menu-tekst">
         <a href="javascript:KiesXSL(2,'{$src}','')"
           onMouseOver = "muisOver(8); window.status='{$Txt_Statistiek}'; return true;"
           onMouseOut  = "muisUit(8); window.status='';">
           <DIV id="veld8a" style="cursor:pointer"><xsl:value-of select="$Txt_Statistiek"/></DIV>
           <DIV id="veld8b" style="visibility:hidden; cursor:pointer"><xsl:value-of select="$Txt_Statistiek"/></DIV>
         </a>
      </td>
      <td class="td-menu-tekst">
         <a href="javascript:KiesXSL(4,'{$src}','')"
           onMouseOver = "muisOver(6); window.status='{$Txt_ZoekPersoon}'; return true;"
           onMouseOut  = "muisUit(6); window.status='';">
           <DIV id="veld6a" style="cursor:pointer"><xsl:value-of select="$Txt_Zoeken"/></DIV>
           <DIV id="veld6b" style="visibility:hidden; cursor:pointer"><xsl:value-of select="$Txt_Zoeken"/></DIV>
         </a>
      </td>
      <td class="td-menu-tekst">
         <xsl:choose>
           <xsl:when test="$varToonKalender = 1">
             <a href="javascript:KiesXSL(34,'{$src}','0')"
               onMouseOver = "muisOver(9); window.status='{$Txt_Kalender}'; return true;"
               onMouseOut  = "muisUit(9); window.status='';">
               <DIV id="veld9a" style="cursor:pointer"><xsl:value-of select="$Txt_Kalender"/><xsl:value-of select="$nbsp"/></DIV>
               <DIV id="veld9b" style="visibility:hidden; cursor:pointer"><xsl:value-of select="$Txt_Kalender"/><xsl:value-of select="$nbsp"/></DIV>
             </a>
           </xsl:when>
           <xsl:otherwise>
             <xsl:choose>
               <xsl:when test="$varToonNieuws = 1">
                 <a href="javascript:KiesXSL(18,'{$src}','')"
                   onMouseOver = "muisOver(9); window.status='{$Txt_Nieuws}'; return true;"
                   onMouseOut  = "muisUit(9); window.status='';">
                   <DIV id="veld9a" style="cursor:pointer"><xsl:value-of select="$Txt_Nieuws"/><xsl:value-of select="$nbsp"/></DIV>
                   <DIV id="veld9b" style="visibility:hidden; cursor:pointer"><xsl:value-of select="$Txt_Nieuws"/><xsl:value-of select="$nbsp"/></DIV>
                 </a>
               </xsl:when>
               <xsl:otherwise>
                 <a href="javascript:VorigeKaart()"
                   onMouseOver = "muisOver(9); window.status='{$Txt_Vorige}'; return true;"
                   onMouseOut  = "muisUit(9); window.status='';">
                   <DIV id="veld9a" style="cursor:pointer"><xsl:value-of select="$Txt_Vorige"/></DIV>
                   <DIV id="veld9b" style="visibility:hidden; cursor:pointer"><xsl:value-of select="$Txt_Vorige"/></DIV>
                 </a>
               </xsl:otherwise>
             </xsl:choose>
           </xsl:otherwise>
         </xsl:choose>
      </td>
      <td class="td-menu-tekst">
         <xsl:choose>
           <xsl:when test="$varToonNieuws = 1 or $varToonKalender = 1">
             <a href="javascript:VorigeKaart()"
               onMouseOver = "muisOver(10); window.status='{$Txt_Vorige}'; return true;"
               onMouseOut  = "muisUit(10); window.status='';">
               <DIV id="veld10a" style="cursor:pointer"><xsl:value-of select="$Txt_Vorige"/></DIV>
               <DIV id="veld10b" style="visibility:hidden; cursor:pointer"><xsl:value-of select="$Txt_Vorige"/></DIV>
             </a>
           </xsl:when>
           <xsl:otherwise>
             <DIV id="veld10a"><xsl:value-of select="$nbsp"/></DIV>
           </xsl:otherwise>
         </xsl:choose>
      </td>
   </tr>
  </table>
  <br clear="all"/>
  <br/>
  <div id="EndOfHeader"></div>
</xsl:template>

<xsl:template name="ShowMenu">
  <xsl:if test="$Printing = 0">
    <xsl:for-each select="//PERSONEN/PERSOON[@link=$HuidigPersoon]">
      <xsl:for-each select="PERSONAL">
        <xsl:call-template name="ShowMenubar">
          <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
          <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
          <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
          <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
          <xsl:with-param name="src"><xsl:value-of select="$HuidigPersoon"/></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:if>
</xsl:template>

<xsl:template name="addColumn">
  <xsl:param name="name"></xsl:param>
  <xsl:param name="sort"></xsl:param>
  <xsl:param name="align">left</xsl:param>
  <xsl:param name="nowrap"></xsl:param>

  <th class="tbl-head" align="{$align}" style="white-space:{$nowrap}">
  <xsl:choose>
    <xsl:when test="$varStuurSorteersleutel=1">
      <a href="javascript:WijzigSortering({$sort})" name="sorteer"
         onMouseOver = "window.status='Sorteer op {$name}'; return true;"
         onMouseOut  = "window.status='';"><xsl:value-of select="$name"/></a>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$name"/>
    </xsl:otherwise>
  </xsl:choose>
  </th>
</xsl:template>

<xsl:template name="Voornaam">
  <xsl:param name="nick"></xsl:param>
  <xsl:param name="first"></xsl:param>

  <xsl:choose>
  <xsl:when test="$parToonVoornaam='1'">
    <xsl:choose>
      <xsl:when test="string-length($nick) = 0">
    	<xsl:choose>
            <!-- pak de eerste naam van de voornamen -->
      	  <xsl:when test="string-length(substring-before($first,' ')) != 0">
    		<xsl:value-of select="substring-before($first,' ')"/>
      	  </xsl:when>
      	  <xsl:otherwise>
			<xsl:value-of select="$first"/>
	  	  </xsl:otherwise>
		</xsl:choose>
	  </xsl:when>
	  <xsl:otherwise>
		<xsl:value-of select="$nick"/>
	  </xsl:otherwise>
	</xsl:choose>
  </xsl:when>
  <xsl:when test="$parToonVoornaam='2'">
	<xsl:choose>
	  <xsl:when test="string-length($first) = 0">
            <!-- pak de roepnaam -->
		<xsl:value-of select="$nick"/>
	  </xsl:when>
	  <xsl:otherwise>
		<xsl:value-of select="$first"/>
	  </xsl:otherwise>
	</xsl:choose>
  </xsl:when>
  <xsl:otherwise>
	<xsl:choose>
	  <xsl:when test="string-length($first) = 0">
            <!-- pak de roepnaam -->
		<xsl:value-of select="$nick"/>
	  </xsl:when>
	  <xsl:otherwise>
		<xsl:value-of select="$first"/>
	  </xsl:otherwise>
	</xsl:choose>
  </xsl:otherwise>
  </xsl:choose>

</xsl:template>

<xsl:template name="ShowPersoon">
  <xsl:param name="relatie"></xsl:param>
  <xsl:param name="NAMEFIRST"></xsl:param>
  <xsl:param name="NAMENICK"></xsl:param>
  <xsl:param name="NAMEPREF"></xsl:param>
  <xsl:param name="SURN"></xsl:param>
  <xsl:param name="src"></xsl:param>
  <xsl:param name="priv"></xsl:param>

    <xsl:variable name="hyperName">
      <xsl:call-template name="Voornaam">
        <xsl:with-param name="nick"><xsl:value-of select="$NAMENICK"/></xsl:with-param>
        <xsl:with-param name="first"><xsl:value-of select="$NAMEFIRST"/></xsl:with-param>
      </xsl:call-template>
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
    <xsl:variable name="NameNoQuote">
      <xsl:if test="string-length($relatie) > 0">
        <xsl:value-of select="$relatie"/><xsl:text> </xsl:text>
      </xsl:if>
      <xsl:value-of select="$hyperNameNoQuote"/>
    </xsl:variable>

    <xsl:if test="$priv = 1">
      <xsl:value-of select="$hyperName"/>
    </xsl:if>
    <xsl:if test="string-length($priv) = 0">
      <a href="javascript:ToonPersoonsKaart('{$src}')"
         onMouseOver = "window.status='Bekijk de kaart van {$NameNoQuote}'; return true;"
         onMouseOut  = "window.status='';"
        >
        <xsl:value-of select="$hyperName"/>
      </a>
    </xsl:if>
</xsl:template>

<xsl:template name="ShowLijstPersoon">
  <xsl:param name="relatie"></xsl:param>
  <xsl:param name="NAMEFIRST"></xsl:param>
  <xsl:param name="NAMENICK"></xsl:param>
  <xsl:param name="NAMEPREF"></xsl:param>
  <xsl:param name="SURN"></xsl:param>
  <xsl:param name="src"></xsl:param>
  <xsl:param name="priv"></xsl:param>
  <xsl:param name="naamweergave"></xsl:param>
  
  <xsl:choose>
   <xsl:when test="$naamweergave='1'">
    <xsl:variable name="hyperName">
      <xsl:call-template name="Voornaam">
        <xsl:with-param name="nick"><xsl:value-of select="$NAMENICK"/></xsl:with-param>
        <xsl:with-param name="first"><xsl:value-of select="$NAMEFIRST"/></xsl:with-param>
      </xsl:call-template>
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
    <xsl:variable name="NameNoQuote">
      <xsl:if test="string-length($relatie) > 0">
        <xsl:value-of select="$relatie"/><xsl:text> </xsl:text>
      </xsl:if>
      <xsl:value-of select="$hyperNameNoQuote"/>
    </xsl:variable>

    <xsl:if test="$priv = 1">
      <xsl:value-of select="$hyperName"/>
    </xsl:if>
    <xsl:if test="string-length($priv) = 0">
      <a href="javascript:ToonPersoonsKaart('{$src}')"
         onMouseOver = "window.status='Bekijk de kaart van {$NameNoQuote}'; return true;"
         onMouseOut  = "window.status='';"
        >
        <xsl:value-of select="$hyperName"/>
      </a>
    </xsl:if>
   </xsl:when>
   
   <xsl:otherwise>
      <xsl:variable name="voornaam">
        <xsl:call-template name="Voornaam">
          <xsl:with-param name="nick"><xsl:value-of select="$NAMENICK"/></xsl:with-param>
          <xsl:with-param name="first"><xsl:value-of select="$NAMEFIRST"/></xsl:with-param>
        </xsl:call-template>
      </xsl:variable>
    <xsl:variable name="hyperName">
      <xsl:value-of select="$SURN"/>
      <xsl:if test="string-length($SURN) !=0 and (string-length($NAMEPREF) != 0 or string-length($voornaam) != 0)">
        <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:value-of select="$voornaam"/>
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
    <xsl:variable name="NameNoQuote">
      <xsl:if test="string-length($relatie) > 0">
        <xsl:value-of select="$relatie"/><xsl:text> </xsl:text>
      </xsl:if>
      <xsl:value-of select="$hyperNameNoQuote"/>
    </xsl:variable>

    <xsl:if test="$priv = 1">
      <xsl:value-of select="$hyperName"/>
    </xsl:if>
    <xsl:if test="string-length($priv) = 0">
      <a href="javascript:ToonPersoonsKaart('{$src}')"
         onMouseOver = "window.status='Bekijk de kaart van {$NameNoQuote}'; return true;"
         onMouseOut  = "window.status='';"
        >
        <xsl:value-of select="$hyperName"/>
      </a>
    </xsl:if>
   </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="showTypeKind">
  <xsl:param name="type"/>

  <xsl:choose>
    <xsl:when test="$type=1"> <!-- Adoptiekind -->
      <xsl:text> [A]</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="$type=2">
          <xsl:text> [P]</xsl:text> <!-- Pleegkind -->
        </xsl:when>
        <xsl:otherwise>
          <xsl:choose>
            <xsl:when test="$type=3">
              <xsl:text> [S]</xsl:text> <!-- Stiefkind -->
            </xsl:when>
            <xsl:otherwise>
              <xsl:if test="$type=4">
                  <xsl:text> [W]</xsl:text> <!-- Gewettigd kind -->
              </xsl:if>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>

</xsl:template>

<xsl:template name="OnzTekst">
  <xsl:param name="onz"/>
  <xsl:if test="string-length($onz)!=0">
  <xsl:choose>
    <xsl:when test="$onz = '&gt;'"><xsl:text> </xsl:text><xsl:value-of select="$Txt_minstens"/><xsl:text> </xsl:text></xsl:when>
    <xsl:when test="$onz = '&lt;'"><xsl:text> </xsl:text><xsl:value-of select="$Txt_hoogstens"/><xsl:text> </xsl:text></xsl:when>
    <xsl:otherwise><xsl:text> </xsl:text><xsl:value-of select="$Txt_ongeveer"/><xsl:text> </xsl:text></xsl:otherwise>
  </xsl:choose>
  </xsl:if>
</xsl:template>

<!-- Functie replace-substring(original, substring, replacement) -->
<xsl:template name="replace-substring">
  <xsl:param name="original"/>
  <xsl:param name="substring"/>
  <xsl:param name="replacement" select="''"/>
  <xsl:variable name="first">
    <xsl:choose>
      <xsl:when test="contains($original, $substring)">
        <xsl:value-of select="substring-before($original, $substring)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$original"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="middle">
    <xsl:choose>
      <xsl:when test="contains($original, $substring)">
        <xsl:value-of select="$replacement"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text></xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="last">
    <xsl:choose>
      <xsl:when test="contains($original, $substring)">
        <xsl:choose>
          <xsl:when test="contains(substring-after($original, $substring), $substring)">
            <xsl:call-template name="replace-substring">
              <xsl:with-param name="original"><xsl:value-of select="substring-after($original, $substring)"/></xsl:with-param>
              <xsl:with-param name="substring"><xsl:value-of select="$substring"/></xsl:with-param>
              <xsl:with-param name="replacement"><xsl:value-of select="$replacement"/></xsl:with-param>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="substring-after($original, $substring)"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text></xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:value-of select="concat($first, $middle, $last)"/>
</xsl:template>
<!-- End of Remaining part -->

<!-- Start of Javascript functions part -->

<!--  define the Javascript functions that you want to include within
        a msxsl:script element.
        - language indicates the scripting language
        - implements-prefix gives the namespace prefix that you
          declared for your function (i.e. foo) -->
<msxsl:script language="javascript" implements-prefix="user">
<![CDATA[
    var splitDate = null;

    function leeftijd(nodelist1,taal,txt_jaar,txt_jaren)
    {
        var objNextNode = nodelist1.nextNode();

        var birthNode  = objNextNode.selectSingleNode("BIRTH");
        var deathNode  = objNextNode.selectSingleNode("DEATH");

        return berekenleeftijd(birthNode, deathNode,taal,txt_jaar,txt_jaren);
    }

    function relatieduur(nodelist1,taal,txt_jaar,txt_jaren)
    {
        var objNextNode = nodelist1.nextNode();

        var birthDate = "";
        var deathDate = "";

        var relaNode  = objNextNode.selectSingleNode("BEGIN");
        var deathNode = null;
        
        return berekenleeftijd(relaNode, deathNode,taal,txt_jaar,txt_jaren);
    }

    function berekenleeftijd(birthNode, deathNode,taal,txt_jaar,txt_jaren)
    {
        var birthDate = "";
        var deathDate = "";

        if (birthNode == null)
           return ""

        if (birthNode != null)
        {
          var attr = birthNode.attributes;
          var n_attr = attr.length;
          for (var i = 0; i < n_attr; i++)
          {
            if (attr.item(i).name == 'date')
            {
              birthDate = attr.item(i).text;
              break;
            }
          }
        }

        if (deathNode != null)
        {
          var attr = deathNode.attributes;
          var n_attr = attr.length;
          for (var i = 0; i < n_attr; i++)
          {
            if (attr.item(i).name == 'date')
            {
              deathDate = attr.item(i).text;
              break;
            }
          }
        }

        if (string_split(birthDate) == 0)
           return "";

        birtDate = splitDate;

        if (deathDate == "")
           deatDate = new Date();
        else
        {
          string_split(deathDate);
          deatDate = splitDate;
        }

        var month      = birtDate.getMonth();
        var day        = birtDate.getDate();
        var year       = birtDate.getYear();
        if (year < 100) year += 1900;
        var thisMonth  = deatDate.getMonth();
        var thisDay    = deatDate.getDate();
        var thisYear   = deatDate.getYear();
        if (thisYear < 100) thisYear += 1900;
        var age     = HowOld(day,month,year,thisDay,thisMonth,thisYear,taal,txt_jaar,txt_jaren);

        return age;
    }

    function string_split(value)
    {
      var splitIndex = 0;
      var splitArray = new Array();

      var string = value + ' ';
      var separator = '-';

      while ((string.length > 0) && (separator.length > 0))
      {

          var i = string.indexOf(separator);
          if ((!i) && (separator != string.substring(0,separator.length))) break;
          if (i == -1)
          {
              splitArray[splitIndex++] = new Array(string);
              break;
          }
          splitArray[splitIndex++] = new Array(string.substring(0,i));

          string = string.substring(i+separator.length,string.length);
      }

      if (splitIndex == 3)
      {
            if (splitArray[2] == ' ') // toch geen jaar ingevuld!
               return 0;
            splitDate = new Date(splitArray[2], splitArray[1]-1, splitArray[0]);
            return 1;
      }
      if (splitIndex == 2)
      {
            splitDate = new Date(splitArray[1], splitArray[0]-1, 1);
            return 1;
      }
      if (splitIndex == 1)
      {
         if (parseInt(splitArray[0]) > 1000)         /* Alleen een jaartal */
         {
            splitDate = new Date(splitArray[0], 0, 1);
            return 1;
         }
      }
      return 0;
    }

    function HowOld(day,month,year,thisDay,thisMonth,thisYear,taal,txt_jaar,txt_jaren)
    {
        var yearsold = thisYear - year, monthsold = 0, daysold = 0, string = '';

        if (thisMonth >= month)
            monthsold = thisMonth - month;
        else
        {
            yearsold--;
            monthsold = thisMonth + 12 - month;
        }

        if (thisDay >= day)
        {
            daysold = thisDay - day;
        }
        else
        {
            if (monthsold > 0)
                monthsold--;
            else
            {
                yearsold--;
                monthsold+=11;
            }
            daysold = thisDay + 31 - day;
        }

        if (yearsold < 0)
            return '?';

        if (yearsold > 120)
            return '?';

        if ((yearsold == 0) && (monthsold == 0) && (daysold == 0))
            return '?';

        if (yearsold >= 2)
        {
            string = yearsold + ' ' + txt_jaren + ' ';
            string += ' ';
        }
        if (yearsold == 0 || yearsold == 1)
        {
            string = yearsold + ' ' + txt_jaar + ' ';
            string += ' ';
        }
        /* Onderstaande even niet
        if (monthsold > 0)
        {
            string += monthsold + ' maand';
            if (monthsold > 1) string += 'en';
            string += ' ';
        }
        if (daysold > 0)
        {
            string += daysold + ' dag';
            if (daysold > 1) string += 'en';
            string += ' ';
        }
        */
        return string;
    }

    function weekdag(strDate,d1,d2,d3,d4,d5,d6,d7)
    {
    	if (strDate.length!=10)
    	{
    		return "";
    	}

        if (string_split(strDate) == 0)
           return "";

        var weekday=new Array(d1,d2,d3,d4,d5,d6,d7);

        return weekday[splitDate.getDay()];
    }

    function printdatum(strDate,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12)
    {
    	if (strDate.length!=10)
    	{
           return strDate;
    	}

        if (string_split(strDate) == 0)
           return strDate;

        var month=new Array(m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12);

        var year       = splitDate.getYear();
        if (year < 100) year += 1900;

        return splitDate.getDate() + " " + month[splitDate.getMonth()] + " " + year;
    }
]]>
</msxsl:script>
<!-- End of Javascript functions part -->

<!-- Start of printDatum part -->

<xsl:template name="printDatum">
  <xsl:param name="datum"/>
  <xsl:param name="onz"/>

  <xsl:text> </xsl:text>
  <xsl:choose>
    <xsl:when test="string-length($onz) &gt; 0">
      <xsl:choose>
        <xsl:when test="$onz = '&gt;'">
          <xsl:text> </xsl:text><xsl:value-of select="$Txt_na"/><xsl:text> </xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:choose>
            <xsl:when test="$onz = '&lt;'">
              <xsl:text> </xsl:text><xsl:value-of select="$Txt_voor"/><xsl:text> </xsl:text>
            </xsl:when>
            <xsl:otherwise>  <!-- &#177; = +/- -->
              <xsl:text> </xsl:text><xsl:value-of select="$Txt_omstreeks"/><xsl:text> </xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:if test="string-length($datum) = 10">
        <xsl:text> </xsl:text><xsl:value-of select="$Txt_opdatum"/><xsl:text> </xsl:text>
      </xsl:if>
      <xsl:if test="$datum and string-length($datum) != 10">
        <xsl:text> </xsl:text><xsl:value-of select="$Txt_inmaandjaar"/><xsl:text> </xsl:text>
      </xsl:if>
    </xsl:otherwise>
  </xsl:choose>

  <xsl:choose>
    <xsl:when test="$Browser = 'IE'">
      <xsl:value-of select="user:weekdag(string($datum),string($Txt_zondag),string($Txt_maandag),string($Txt_dinsdag),string($Txt_woensdag),string($Txt_donderdag),string($Txt_vrijdag),string($Txt_zaterdag))"/><xsl:text> </xsl:text>
      <xsl:if test="string-length($datum) = 10">
        <xsl:value-of select="$Txt_dedatum"/><xsl:text> </xsl:text>
      </xsl:if>
      <xsl:value-of select="user:printdatum(string($datum),string($Txt_januari),string($Txt_februari),string($Txt_maart),string($Txt_april),string($Txt_mei),string($Txt_juni),string($Txt_juli),string($Txt_augustus),string($Txt_september),string($Txt_oktober),string($Txt_november),string($Txt_december))"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:if test="string-length($datum) = 10">
        <xsl:value-of select="$Txt_dedatum"/><xsl:text> </xsl:text>
      </xsl:if>
      <xsl:value-of select="string($datum)"/>
    </xsl:otherwise>
  </xsl:choose>

</xsl:template>
<!-- End of printDatum part -->

<xsl:template name="ShowFooter">
 <xsl:if test="$parToonVoettekst=3">  <!-- waarde 3 kan niet voorkomen; footer is vervallen; code nog maar even bewaard -->
  <blockquote>
  <p>
    Hier kunt u altijd terug naar de referentiepersoon
    <xsl:for-each select="//PERSONEN/PERSOON[@link=$refPersoon]">
      <xsl:for-each select="PERSONAL">
        <xsl:call-template name="ShowPersoon">
          <xsl:with-param name="relatie">referentiepersoon</xsl:with-param>
          <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
          <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
          <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
          <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
          <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
          <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>        <!-- PERSONAL -->

      <xsl:for-each select="EVENTS/BIRTH[@date or @place]">
        <xsl:text>, geboren</xsl:text>
        <xsl:if test="@date">
          <xsl:text> </xsl:text>
          <xsl:call-template name="printDatum">
           <xsl:with-param name="datum"><xsl:value-of select="@date"/></xsl:with-param>
           <xsl:with-param name="onz"><xsl:value-of select="@onz"/></xsl:with-param>
          </xsl:call-template>
        </xsl:if>
        <xsl:if test="@place">
          <xsl:text> te </xsl:text>
          <xsl:value-of select="@place"/>
        </xsl:if>
      </xsl:for-each>  <!-- EVENTS/BIRTH -->
      <xsl:text>.</xsl:text>
    </xsl:for-each> <!-- document -->
    <xsl:text> Dit voor het geval u de weg in de stamboom bent kwijtgeraakt.</xsl:text>
  </p>
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
  </xsl:variable>
  <h6>&#169; 2003-2008, <a href="mailto:{$refOwnerEMail}?subject={$subject}"><xsl:value-of select="$refCopyright"/></a></h6>
  </blockquote>
 </xsl:if>
</xsl:template>

</xsl:stylesheet>
