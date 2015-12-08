<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:user="http://www.adriedenblanken.nl/"
		version="1.0">
<!--
// <author>Adrie den Blanken</author>
// <file>$Workfile: SvgHeader.xsl $</file><date>$Date: 15-01-15 8:20 $</date>
// <revision>$Revision: 28 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this
// header stays intact. No responsibility is accepted
// for use of this software.</disclaimer>
-->
<xsl:variable name="achtGeneraties" select="8"/>

<xsl:template name="ShowPersonInSvg">
  <xsl:param name="nr"/>
  <xsl:param name="alsoPlace" select="1"/>

  <xsl:if test="string-length(@priv)=0">
    <text id="lnk-{$nr}">javascript:KiesXSL(7,<xsl:value-of select="@link"/>,'','');</text>
  </xsl:if>
  <xsl:for-each select="PERSONAL">
    <text id="vnm-{$nr}"><xsl:value-of select="NAME/@first"/> </text>
    <text id="anm-{$nr}">
    <xsl:if test="string-length(NAME/@pref) != 0">
      <xsl:value-of select="NAME/@pref"/><xsl:text> </xsl:text>
    </xsl:if>
    <xsl:value-of select="NAME/@surn"/></text>
  </xsl:for-each>
  <xsl:for-each select="EVENTS">
    <xsl:for-each select="BIRTH">
      <xsl:if test="string-length(@date) > 0"><text id="birt-{$nr}"><xsl:value-of select="$degrees"/> <xsl:value-of select="@onz"/><xsl:value-of select="@date"/><xsl:if test="$alsoPlace != 0"><xsl:text> </xsl:text><xsl:value-of select="@place"/></xsl:if></text></xsl:if>
    </xsl:for-each>
    <xsl:for-each select="DEATH">
      <xsl:if test="string-length(@date) > 0"><text id="deat-{$nr}"><xsl:value-of select="$dagger"/> <xsl:value-of select="@onz"/><xsl:value-of select="@date"/><xsl:if test="$alsoPlace != 0"><xsl:text> </xsl:text><xsl:value-of select="@place"/></xsl:if></text></xsl:if>
    </xsl:for-each>
  </xsl:for-each>
</xsl:template>

<xsl:template name="ShowPersoonInHourGlass">
  <xsl:param name="nr"/>

  <text id="vnm-{$nr}"><xsl:value-of select="PERSONAL/NAME/@first"/> </text>
  <text id="anm-{$nr}">
    <xsl:if test="string-length(PERSONAL/NAME/@pref) != 0">
      <xsl:value-of select="PERSONAL/NAME/@pref"/><xsl:text> </xsl:text>
    </xsl:if>
    <xsl:value-of select="PERSONAL/NAME/@surn"/></text>
  <text id="lnk-{$nr}">javascript:KiesXSL(7,<xsl:value-of select="@link"/>,'','');</text>
  <xsl:for-each select="EVENTS/BIRTH">
    <xsl:if test="string-length(@date) > 0"><text id="birt-{$nr}"><xsl:value-of select="$degrees"/><xsl:text> </xsl:text><xsl:value-of select="@onz"/><xsl:value-of select="@date"/></text></xsl:if>
  </xsl:for-each>
  <xsl:for-each select="EVENTS/DEATH">
    <xsl:if test="string-length(@date) > 0"><text id="deat-{$nr}"><xsl:value-of select="$dagger"/><xsl:text> </xsl:text><xsl:value-of select="@onz"/><xsl:value-of select="@date"/></text></xsl:if>
  </xsl:for-each>

</xsl:template>

<xsl:template name="ShowGezinInSvg">
  <xsl:param name="positie" select="1"/>
  <xsl:param name="generatie" select="1"/>
  <xsl:param name="aantalGeneraties"/>
  <xsl:param name="linkGezin"/>
  <xsl:param name="alsoPlace" select="1"/>

  <xsl:for-each select="//PERSOON[@link=$linkGezin]">

  <xsl:call-template name="ShowPersonInSvg">
    <xsl:with-param name="nr"><xsl:value-of select="$positie"/></xsl:with-param>
    <xsl:with-param name="alsoPlace"><xsl:value-of select="$alsoPlace"/></xsl:with-param>
  </xsl:call-template>

  <xsl:for-each select="FATHER[count(@type)=0]">
    <xsl:variable name="linkF" select="@link"/>

    <xsl:if test="$aantalGeneraties > $generatie">
      <xsl:call-template name="ShowGezinInSvg">
        <xsl:with-param name="generatie"><xsl:value-of select="$generatie+1"/></xsl:with-param>
        <xsl:with-param name="aantalGeneraties"><xsl:value-of select="$aantalGeneraties"/></xsl:with-param>
        <xsl:with-param name="positie"><xsl:value-of select="$positie*2"/></xsl:with-param>
        <xsl:with-param name="linkGezin"><xsl:value-of select="$linkF"/></xsl:with-param>
        <xsl:with-param name="alsoPlace"><xsl:value-of select="$alsoPlace"/></xsl:with-param>
      </xsl:call-template>

    </xsl:if>

    <xsl:if test="8 > $generatie">
      <xsl:for-each select="//PERSONEN/PERSOON/RELATIONS/RELA[CHILDREN/CHIL/@link=$linkGezin]">
        <xsl:if test="position()=1">
          <text id="marr-{$positie*2}"><xsl:value-of select="BEGIN/@onz"/><xsl:value-of select="BEGIN/@date"/><xsl:text> </xsl:text><xsl:value-of select="RELAPLAC"/></text>
        </xsl:if>
      </xsl:for-each>
    </xsl:if>

  </xsl:for-each>

  <xsl:for-each select="MOTHER[count(@type)=0]">
    <xsl:variable name="linkM" select="@link"/>

    <xsl:if test="$aantalGeneraties > $generatie">

      <xsl:call-template name="ShowGezinInSvg">
        <xsl:with-param name="generatie"><xsl:value-of select="$generatie+1"/></xsl:with-param>
        <xsl:with-param name="aantalGeneraties"><xsl:value-of select="$aantalGeneraties"/></xsl:with-param>
        <xsl:with-param name="positie"><xsl:value-of select="$positie*2+1"/></xsl:with-param>
        <xsl:with-param name="linkGezin"><xsl:value-of select="$linkM"/></xsl:with-param>
        <xsl:with-param name="alsoPlace"><xsl:value-of select="$alsoPlace"/></xsl:with-param>
      </xsl:call-template>

    </xsl:if>

  </xsl:for-each>

  </xsl:for-each>

</xsl:template>

<xsl:template name="SvgNavigatie">
  <xsl:param name="IsPrinting"/>
  <xsl:param name="IsSvg"/>
  <xsl:param name="WelkeSvg"/>
  <xsl:param name="MaxNrGen"/>

  <xsl:if test="$IsPrinting = 0">
    <xsl:if test="$IsSvg = 1 and $Browser = 'IE'">
      <blockquote>
       <xsl:if test="$parTaal = 'nederlands'">
        <h3>Navigatie op de afbeelding:</h3>
        <ul>
          <li>Via rechtermuisknop: "Inzoomen", "Uitzoomen" en "Originele weergave"</li>
          <li>Via CTRL + linkermuisknop: Gericht inzoomen</li>
          <li>Via CTRL + SHIFT + linkermuisknop: Uitzoomen</li>
          <li>Via ALT + muis-slepen: Beeld verplaatsen</li>
          <li>Klikken op een naam: Ga naar de persoonskaart van die persoon</li>
          <li>Ziet u niets? Download en installeer dan de <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" alt="Installeer Adobe SVG Viewer">Adobe SVG Viewer 3.0.3</a></li>
        </ul>
       </xsl:if>
       <xsl:if test="$parTaal = 'engels'">
        <h3>Navigation on the image:</h3>
        <ul>
          <li>Via right mouse button: "Zoom in", "Zoom out" and "Original view"</li>
          <li>Via CTRL + left mouse button: Aimed zooming in</li>
          <li>Via CTRL + SHIFT + left mouse button: Zoom out</li>
          <li>Via ALT + mouse-move: Move image</li>
          <li>Click a name: Display the personal sheet of that person</li>
          <li>See nothing? Then download and install the <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" alt="Installeer Adobe SVG Viewer">Adobe SVG Viewer 3.0.3</a></li>
        </ul>
       </xsl:if>
       <xsl:if test="$parTaal = 'frans'">
        <h3>Navigation sur l'image:</h3>
        <ul>
          <li>Par click droit de la souris de droite: "Zoom avant", "Zoom arrière" et "Vue originelle"</li>
          <li>Par CTRL + click gauche de la souris : Zoom avant orienté</li>
          <li>Par CTRL + SHIFT + click gauche de la souris : Zoom arrière</li>
          <li>Par ALT + déplacer la souris: Déplacer l'image</li>
          <li>En cliquant un nom: Allez à la fiche personnelle de cette personne</li>
          <li>Vous ne voyez rien? Téléchargez et installez l'<a href="http://www.adobe.com/nl/svg/viewer/install/index.html" alt="Installeer Adobe SVG Viewer">Adobe SVG Viewer 3.0.3</a></li>
        </ul>
       </xsl:if>
       <xsl:if test="$parTaal = 'duits'">
        <h3>Navigation auf die Abbildung:</h3>
        <ul>
          <li>Via rechter Maus Knopf: "Zoom in", "Zoom aus" en "Original Bild"</li>
          <li>Via CTRL + linker Maus Knopf: Gerichtet Zoom in</li>
          <li>Via CTRL + SHIFT + linker Maus Knopf: Zoom aus</li>
          <li>Via ALT + Maus bewegen: Bild versetzen</li>
          <li>Drücken auf eine Name: Gehe zum persönliche Karte von dieser Person</li>
          <li>Sehen Sie nichts? Download und installieren Sie dann den <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" alt="Installeer Adobe SVG Viewer">Adobe SVG Viewer 3.0.3</a></li>
        </ul>
       </xsl:if>
       <xsl:if test="$parTaal = 'fries'">
        <h3>Navigaasje op de ôfbylding:</h3>
        <ul>
          <li>Fia rechtermuisknop: "Inzoomen", "Uitzoomen" en "Orizjinele werjefte"</li>
          <li>Fia CTRL + linkermuisknop: Rjochte inzoomen</li>
          <li>Fia CTRL + SHIFT + linkermuisknop: Uitzoomen</li>
          <li>Fia ALT + muis-slepen: Byld ferpleat  </li>
          <li>Klikke op in namme: Gean nei de persoonskaart fan dy persoan</li>
          <li>Sjocht jo neat? Download en installeer dan de <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" alt="Installeer Adobe SVG Viewer">Adobe SVG Viewer 3.0.3</a></li>
        </ul>
       </xsl:if>
       <xsl:if test="$parTaal = 'noors'">
        <h3>Navigasjon på bildet:</h3>
        <ul>
          <li>Høyre gjennom "Zoom", "zoom" og "Original skjerm"</li>
          <li>Bruke CTRL + venstre museknapp: Rettet zoom</li>
          <li>Bruke CTRL + SHIFT + venstre museknapp: Zoom</li>
          <li>ALT + mus dra: Moving Picture</li>
          <li>Ved å klikke på et navn: Gå til kartet person som person</li>
          <li>Ser du noe? Last ned og installer <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" alt="Installeer Adobe SVG Viewer">Adobe SVG Viewer 3.0.3</a></li>
        </ul>
       </xsl:if>
       <xsl:if test="$parTaal = 'spaans'">
        <h3>Navegación en la imagen:</h3>
        <ul>
          <li>Derecho a través de "Zoom", "Zoom" y "Visualización original"</li>
          <li>Utilizar CTRL + botón izquierdo del ratón: zoom Dirigido</li>
          <li>Utilizar CTRL + SHIFT + botón izquierdo del ratón: Zoom</li>
          <li>Utilizando ALT + arrastrar el ratón: Imagen en Movimiento</li>
          <li>Al hacer clic en un nombre: Ir al mapa de persona que persona</li>
          <li>¿Ves algo? Descargar e instalar el <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" alt="Installeer Adobe SVG Viewer">Adobe SVG Viewer 3.0.3</a></li>
        </ul>
       </xsl:if>
       <xsl:if test="$parTaal = 'italiaans'">
        <h3>Navigazione sull'immagine:</h3>
        <ul>
          <li>Proprio attraverso "Zoom", "Zoom" e "Display Original"</li>
          <li>Utilizzando CTRL + tasto sinistro del mouse: zoom Mirato</li>
          <li>Utilizzando CTRL + SHIFT + tasto sinistro del mouse: Zoom</li>
          <li>Utilizzando ALT + trascinare il mouse: immagini mobili</li>
          <li>Cliccando su un nome: Vai alla mappa di persona che persona</li>
          <li>Vedi qualcosa? Scaricare e installare il <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" alt="Installeer Adobe SVG Viewer">Adobe SVG Viewer 3.0.3</a></li>
        </ul>
       </xsl:if>
       <xsl:if test="$parTaal = 'portugees'">
        <h3>Navegação na imagem:</h3>
        <ul>
          <li>Direito através "Zoom", "Zoom" e "display Original"</li>
          <li>Usando CTRL + botão esquerdo do mouse: zoom Destinado</li>
          <li>Usando CTRL + SHIFT + botão esquerdo do mouse: Zoom</li>
          <li>Usando ALT + arrastar do mouse: imagem em movimento</li>
          <li>Ao clicar em um nome: Vá para o mapa de pessoa a pessoa</li>
          <li>Você vê alguma coisa? Baixe e instale o <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" alt="Installeer Adobe SVG Viewer">Adobe SVG Viewer 3.0.3</a></li>
        </ul>
       </xsl:if>
      </blockquote>
    </xsl:if>
    <xsl:if test="$Browser = 'IE'">
    <blockquote>
      <a href="javascript:KiesXSL(10{$WelkeSvg},{$HuidigPersoon},'','');"
         onMouseOver = "window.status='{$Txt_Printversie}'; return true;"
         onMouseOut  = "window.status='';">
         <xsl:if test="$parTaal = 'nederlands'">
           Klik hier voor een printversie
         </xsl:if>
         <xsl:if test="$parTaal = 'engels'">
           Click here for a print version
         </xsl:if>
         <xsl:if test="$parTaal = 'frans'">
           Cliquez ici pour une version à imprimer
         </xsl:if>
         <xsl:if test="$parTaal = 'duits'">
           Drücken Sie hier für eine Abdruckversion
         </xsl:if>
         <xsl:if test="$parTaal = 'fries'">
           Klik hjir foar in printversie
         </xsl:if>
         <xsl:if test="$parTaal = 'noors'">
           Klikk her for en utskriftsvennlig versjon
         </xsl:if>
         <xsl:if test="$parTaal = 'spaans'">
           Haga clic aquí para ver una versión imprimible
         </xsl:if>
         <xsl:if test="$parTaal = 'italiaans'">
           Clicca qui per una versione stampabile
         </xsl:if>
         <xsl:if test="$parTaal = 'portugees'">
           Clique aqui para obter uma versão para impressão
         </xsl:if>
         </a>
         <xsl:if test="$parIEGui = 'DESKTOP'">
         <xsl:if test="$parTaal = 'nederlands'">
           of ga naar de <xsl:value-of select="$Txt_vooroudercirkels"/> met
         </xsl:if>
         <xsl:if test="$parTaal = 'engels'">
           or go to the <xsl:value-of select="$Txt_vooroudercirkels"/> with
         </xsl:if>
         <xsl:if test="$parTaal = 'frans'">
           ou allez vers les <xsl:value-of select="$Txt_vooroudercirkels"/> avec
         </xsl:if>
         <xsl:if test="$parTaal = 'duits'">
           oder gehe zum <xsl:value-of select="$Txt_vooroudercirkels"/> mit
         </xsl:if>
         <xsl:if test="$parTaal = 'fries'">
           of gean nei de <xsl:value-of select="$Txt_vooroudercirkels"/> mei
         </xsl:if>
         <xsl:if test="$parTaal = 'noors'">
           of ga naar de <xsl:value-of select="$Txt_vooroudercirkels"/> med
         </xsl:if>
         <xsl:if test="$parTaal = 'spaans'">
           o ir a la <xsl:value-of select="$Txt_vooroudercirkels"/> con
         </xsl:if>
         <xsl:if test="$parTaal = 'italiaans'">
           o andare al <xsl:value-of select="$Txt_vooroudercirkels"/> con
         </xsl:if>
         <xsl:if test="$parTaal = 'portugees'">
           ou ir para o <xsl:value-of select="$Txt_vooroudercirkels"/> com
         </xsl:if>
      <a href="javascript:KiesXSL(40,{$HuidigPersoon},'','');"
         onMouseOver = "window.status='1 {$Txt_generatie}'; return true;"
         onMouseOut  = "window.status='';"><b>1</b></a><xsl:text> - </xsl:text>
      <a href="javascript:KiesXSL(41,{$HuidigPersoon},'','');"
         onMouseOver = "window.status='2 {$Txt_generaties}'; return true;"
         onMouseOut  = "window.status='';"><b>2</b></a><xsl:text> - </xsl:text>
      <a href="javascript:KiesXSL(42,{$HuidigPersoon},'','');"
         onMouseOver = "window.status='3 {$Txt_generaties}'; return true;"
         onMouseOut  = "window.status='';"><b>3</b></a><xsl:text> - </xsl:text>
      <a href="javascript:KiesXSL(43,{$HuidigPersoon},'','');"
         onMouseOver = "window.status='4 {$Txt_generaties}'; return true;"
         onMouseOut  = "window.status='';"><b>4</b></a><xsl:text> - </xsl:text>
      <a href="javascript:KiesXSL(44,{$HuidigPersoon},'','');"
         onMouseOver = "window.status='5 {$Txt_generaties}'; return true;"
         onMouseOut  = "window.status='';"><b>5</b></a><xsl:text> - </xsl:text>
      <a href="javascript:KiesXSL(45,{$HuidigPersoon},'','');"
         onMouseOver = "window.status='6 {$Txt_generaties}'; return true;"
         onMouseOut  = "window.status='';"><b>6</b></a><xsl:text> - </xsl:text>
      <a href="javascript:KiesXSL(46,{$HuidigPersoon},'','');"
         onMouseOver = "window.status='7 {$Txt_generaties}'; return true;"
         onMouseOut  = "window.status='';"><b>7</b></a>
      <xsl:text> </xsl:text><xsl:value-of select="$Txt_generaties"/>,
      <xsl:value-of select="$Txt_hogeresolutie"/>
      <a href="javascript:KiesXSL(50,{$HuidigPersoon},'HQ','');"
         onMouseOver = "window.status='{$Txt_Sierstamboom} 5 {$Txt_generaties}'; return true;"
         onMouseOut  = "window.status='';"><b>5</b></a><xsl:text>, </xsl:text>
      <a href="javascript:KiesXSL(51,{$HuidigPersoon},'HQ','');"
         onMouseOver = "window.status='{$Txt_Sierstamboom} 6 {$Txt_generaties}'; return true;"
         onMouseOut  = "window.status='';"><b> 6</b></a><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:value-of select="$Txt_of"/>
      <a href="javascript:KiesXSL(69,{$HuidigPersoon},'HQ','');"
         onMouseOver = "window.status='{$Txt_Sierstamboom} 7 {$Txt_generaties}'; return true;"
         onMouseOut  = "window.status='';"><b> 7</b></a><xsl:text> </xsl:text><xsl:value-of select="$Txt_generaties"/>
      <xsl:if test="$parTaal = 'nederlands'">
        (vereist internet-verbinding) of ga naar de lage-resolutie <xsl:value-of select="$Txt_sierstamboom"/> met
      </xsl:if>
      <xsl:if test="$parTaal = 'engels'">
        (requires internet connection) or go to the low-resolution <xsl:value-of select="$Txt_sierstamboom"/> with
      </xsl:if>
      <xsl:if test="$parTaal = 'frans'">
        (demande connexion internet) ou allez vers l'<xsl:value-of select="$Txt_sierstamboom"/> de basse resolution avec
      </xsl:if>
      <xsl:if test="$parTaal = 'duits'">
        (fordert Internet-Verbindung) oder gehe zum <xsl:value-of select="$Txt_sierstamboom"/> mit geringen Auflösungsgrad mit
      </xsl:if>
      <xsl:if test="$parTaal = 'fries'">
        (fereasket internet-verbinding) of gean nei de lage-resolutie <xsl:value-of select="$Txt_sierstamboom"/> mei
      </xsl:if>
      <xsl:if test="$parTaal = 'noors'">
        (krever Internett-tilkobling) eller gå til lav oppløsning <xsl:value-of select="$Txt_sierstamboom"/> med
      </xsl:if>
      <xsl:if test="$parTaal = 'spaans'">
        (requiere conexión a Internet) o ir a la baja resolución <xsl:value-of select="$Txt_sierstamboom"/> con
      </xsl:if>
      <xsl:if test="$parTaal = 'italiaans'">
        (richiede una connessione internet) o andare alla bassa risoluzione <xsl:value-of select="$Txt_sierstamboom"/> con
      </xsl:if>
      <xsl:if test="$parTaal = 'portugees'">
        (requer conexão à internet) ou ir para a baixa resolução <xsl:value-of select="$Txt_sierstamboom"/> com
      </xsl:if>
      <a href="javascript:KiesXSL(68,{$HuidigPersoon},'LQ','');"
         onMouseOver = "window.status='{$Txt_Sierstamboom} 4 {$Txt_generaties}'; return true;"
         onMouseOut  = "window.status='';"><b>4</b></a><xsl:text>, </xsl:text>
      <a href="javascript:KiesXSL(50,{$HuidigPersoon},'LQ','');"
         onMouseOver = "window.status='{$Txt_Sierstamboom} 5 {$Txt_generaties}'; return true;"
         onMouseOut  = "window.status='';"><b>5</b></a><xsl:text>, </xsl:text>
      <a href="javascript:KiesXSL(51,{$HuidigPersoon},'LQ','');"
         onMouseOver = "window.status='{$Txt_Sierstamboom} 6 {$Txt_generaties}'; return true;"
         onMouseOut  = "window.status='';"><b> 6</b></a><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:value-of select="$Txt_of"/>
      <a href="javascript:KiesXSL(69,{$HuidigPersoon},'LQ','');"
         onMouseOver = "window.status='{$Txt_Sierstamboom} 7 {$Txt_generaties}'; return true;"
         onMouseOut  = "window.status='';"><b> 7</b></a><xsl:text> </xsl:text><xsl:value-of select="$Txt_generaties"/>.
      <xsl:if test="$parTaal = 'nederlands'">
        Ook mogelijk is een overzicht van de voorouders in een waaiervorm van bijvoorbeeld
      </xsl:if>
      <xsl:if test="$parTaal = 'engels'">
        Another possibility is a fan shaped overview of the ancestors, with your choice of 
      </xsl:if>
      <xsl:if test="$parTaal = 'frans'">
        Il est aussi possible de visionner la généalogie en <xsl:value-of select="$Txt_waaier"/> de par example
      </xsl:if>
      <xsl:if test="$parTaal = 'duits'">
        Auch möglich ist ein Übersicht von den Ureltern in eine Fächergestalt von zum Beispiel
      </xsl:if>
      <xsl:if test="$parTaal = 'fries'">
        Ek mooglik is in oersjoch fan de foarâlders yn in waaiervorm fan bygelyks  
      </xsl:if>
      <xsl:if test="$parTaal = 'noors'">
        Alternativt en liste med forfedre i en vifteform, for eksempel,
      </xsl:if>
      <xsl:if test="$parTaal = 'spaans'">
        Alternativamente, una lista de los antepasados en forma de abanico, por ejemplo,
      </xsl:if>
      <xsl:if test="$parTaal = 'italiaans'">
        In alternativa, un elenco di antenati a ventaglio, per esempio,
      </xsl:if>
      <xsl:if test="$parTaal = 'portugees'">
        Alternativamente, uma lista de antepassados em forma de leque, por exemplo,
      </xsl:if>
      <a href="javascript:KiesXSL(55,{$HuidigPersoon},'','');"
         onMouseOver = "window.status='{$Txt_Waaier} {$Txt_met} 5 {$Txt_generaties}'; return true;"
         onMouseOut  = "window.status='';"><b>5</b></a>,
      <a href="javascript:KiesXSL(56,{$HuidigPersoon},'','');"
         onMouseOver = "window.status='{$Txt_Waaier} {$Txt_met} 6 {$Txt_generaties}'; return true;"
         onMouseOut  = "window.status='';"><b>6</b></a>,
      <a href="javascript:KiesXSL(57,{$HuidigPersoon},'','');"
         onMouseOver = "window.status='{$Txt_Waaier} {$Txt_met} 7 {$Txt_generaties}'; return true;"
         onMouseOut  = "window.status='';"><b>7</b></a>,
      <a href="javascript:KiesXSL(58,{$HuidigPersoon},'','');"
         onMouseOver = "window.status='{$Txt_Waaier} {$Txt_met} 8 {$Txt_generaties}'; return true;"
         onMouseOut  = "window.status='';"><b>8</b></a><xsl:text> </xsl:text><xsl:value-of select="$Txt_of"/><xsl:text> </xsl:text>
      <a href="javascript:KiesXSL(59,{$HuidigPersoon},'','');"
         onMouseOver = "window.status='{$Txt_Waaier} {$Txt_met} 9 {$Txt_generaties}'; return true;"
         onMouseOut  = "window.status='';"><b>9</b></a><xsl:text> </xsl:text><xsl:value-of select="$Txt_generaties"/>.
      <xsl:if test="$parTaal = 'nederlands'">
        Ook mooi is de zandloper met
      </xsl:if>
      <xsl:if test="$parTaal = 'engels'">
        There is also a beautiful hourglass overview with
      </xsl:if>
      <xsl:if test="$parTaal = 'frans'">
        Egalement très joli est un sablier avec
      </xsl:if>
      <xsl:if test="$parTaal = 'duits'">
        Auch schön ist eine Sanduhr mit
      </xsl:if>
      <xsl:if test="$parTaal = 'fries'">
        Ek moai is de zandloper mei
      </xsl:if>
      <xsl:if test="$parTaal = 'noors'">
        Også hyggelig er timeglass
      </xsl:if>
      <xsl:if test="$parTaal = 'spaans'">
        También agradable es el reloj de arena
      </xsl:if>
      <xsl:if test="$parTaal = 'italiaans'">
        Anche bello è la clessidra
      </xsl:if>
      <xsl:if test="$parTaal = 'portugees'">
        Também interessante é a ampulheta
      </xsl:if>
      <a href="javascript:KiesXSL(52,{$HuidigPersoon},'','');"
         onMouseOver = "window.status='{$Txt_Zandloper} {$Txt_met} 5 {$Txt_generaties}'; return true;"
         onMouseOut  = "window.status='';"><b>5</b></a><xsl:text> </xsl:text><xsl:value-of select="$Txt_generaties"/>
      <xsl:if test="$parTaal = 'nederlands'">
        of ga terug naar het standaard
      </xsl:if>
      <xsl:if test="$parTaal = 'engels'">
        or you can go back to the standard
      </xsl:if>
      <xsl:if test="$parTaal = 'frans'">
        ou revenez au 
      </xsl:if>
      <xsl:if test="$parTaal = 'duits'">
        oder gehe zurück nach das
      </xsl:if>
      <xsl:if test="$parTaal = 'fries'">
        of gean werom nei it standert
      </xsl:if>
      <xsl:if test="$parTaal = 'noors'">
        eller gå tilbake til standard
      </xsl:if>
      <xsl:if test="$parTaal = 'spaans'">
        o volver a la configuración predeterminada
      </xsl:if>
      <xsl:if test="$parTaal = 'italiaans'">
        o tornare al default
      </xsl:if>
      <xsl:if test="$parTaal = 'portugees'">
        ou voltar para o padrão
      </xsl:if>
      <a href="javascript:KiesXSL(8,{$HuidigPersoon},'','');"
         onMouseOver = "window.status='{$Txt_Kwartieren} 4 {$Txt_generaties}'; return true;"
         onMouseOut  = "window.status='';"> <xsl:value-of select="$Txt_kwartieren"/></a><xsl:text> </xsl:text><xsl:value-of select="$Txt_overzicht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_met"/>
      <a href="javascript:KiesXSL(8,{$HuidigPersoon},'','');"
         onMouseOver = "window.status='{$Txt_Kwartieren} 4 {$Txt_generaties}'; return true;"
         onMouseOut  = "window.status='';"><b> 4 </b></a> <xsl:value-of select="$Txt_generaties"/>.
        </xsl:if>  <!-- DESKTOP GUI TEST -->
        <xsl:if test="$parIEGui = 'METRO'">
          <br/><br/>
        </xsl:if>  <!-- METRO GUI TEST -->

        <xsl:if test="$Browser = 'IE'">
         <xsl:if test="$MaxNrGen != 0">
        <xsl:if test="$parTaal = 'nederlands'">
          Wat natuurlijk ook gemaakt kan worden is een
        </xsl:if>
        <xsl:if test="$parTaal = 'engels'">
          Of course, a
        </xsl:if>
        <xsl:if test="$parTaal = 'frans'">
          Il est aussi possible de former une
        </xsl:if>
        <xsl:if test="$parTaal = 'duits'">
          Wass auch gemacht werden kann ist eines
        </xsl:if>
      <xsl:if test="$parTaal = 'fries'">
        Wat fansels ek makke kin wurde is in
      </xsl:if>
      <xsl:if test="$parTaal = 'noors'">
        Hva som kan gjøres, er selvfølgelig også en
      </xsl:if>
      <xsl:if test="$parTaal = 'spaans'">
        Qué se puede hacer, por supuesto, es también un
      </xsl:if>
      <xsl:if test="$parTaal = 'italiaans'">
        Che cosa può essere fatto, naturalmente, è anche un
      </xsl:if>
      <xsl:if test="$parTaal = 'portugees'">
        O que pode ser feito, é claro, é também um
      </xsl:if>
           <a href="javascript:KiesXSL(36,{$HuidigPersoon},'','1');"
              onMouseOver = "window.status='{$Txt_kwartierstaattekst}'; return true;"
              onMouseOut  = "window.status='';"><b><xsl:text> </xsl:text><xsl:value-of select="$Txt_kwartierstaattekst"/></b>
              <xsl:if test="$MaxNrGen &lt; 99">
              	<xsl:text>(maximaal </xsl:text><xsl:value-of select="$MaxNrGen"/><xsl:text> generatie</xsl:text>
              	<xsl:if test="$MaxNrGen != 1"><xsl:text>s</xsl:text></xsl:if><xsl:text>)</xsl:text>
              </xsl:if>
            </a>
        <xsl:if test="$parTaal = 'engels'">
          <xsl:text> may be made</xsl:text>
        </xsl:if>.
        <br/>
        </xsl:if>
        <xsl:if test="$parTaal = 'nederlands'">
          Ook een leeftijdsoverzicht in de vorm van
        </xsl:if>
        <xsl:if test="$parTaal = 'engels'">
          An age based overview in the shape of
        </xsl:if>
        <xsl:if test="$parTaal = 'frans'">
          Vous pouvez également produire un rapport par âges en forme d'
        </xsl:if>
        <xsl:if test="$parTaal = 'duits'">
          Auch ein Alter basiert List in die Gestalt von
        </xsl:if>
      <xsl:if test="$parTaal = 'fries'">
       Ek in leeftijdsoverzicht yn de foarm fan  
      </xsl:if>
      <xsl:if test="$parTaal = 'noors'">
        Også, i en alder av en oversikt i form av
      </xsl:if>
      <xsl:if test="$parTaal = 'spaans'">
        Además, la edad de un resumen en forma de
      </xsl:if>
      <xsl:if test="$parTaal = 'italiaans'">
        Inoltre, l'età di una visione in forma di
      </xsl:if>
      <xsl:if test="$parTaal = 'portugees'">
        Além disso, a idade de uma síntese sob a forma de
      </xsl:if>
        <a href="javascript:KiesXSL(37,{$HuidigPersoon},'voorgeslacht','histogram');"
           onMouseOver = "window.status=''; return true;"
           onMouseOut  = "window.status='';"><b><xsl:text> </xsl:text><xsl:value-of select="$Txt_histogrammen"/></b></a>
        <xsl:if test="$parTaal = 'nederlands'">
          of in de vorm van
        </xsl:if>
        <xsl:if test="$parTaal = 'engels'">
          or in the shape of
        </xsl:if>
        <xsl:if test="$parTaal = 'frans'">
          ou en forme des
        </xsl:if>
        <xsl:if test="$parTaal = 'duits'">
          oder in die Gestalt von
        </xsl:if>
      <xsl:if test="$parTaal = 'fries'">
       of yn de foarm fan
      </xsl:if>
      <xsl:if test="$parTaal = 'noors'">
        eller i form av
      </xsl:if>
      <xsl:if test="$parTaal = 'spaans'">
        o en la forma de
      </xsl:if>
      <xsl:if test="$parTaal = 'italiaans'">
        o sotto forma di
      </xsl:if>
      <xsl:if test="$parTaal = 'portugees'">
        ou sob a forma de
      </xsl:if>
        <a href="javascript:KiesXSL(37,{$HuidigPersoon},'voorgeslacht','tabel');"
           onMouseOver = "window.status=''; return true;"
           onMouseOut  = "window.status='';"><b><xsl:text> </xsl:text><xsl:value-of select="$Txt_tabellen"/></b></a>
        <xsl:if test="$parTaal = 'nederlands'">
          kan aangemaakt worden.
        </xsl:if>
        <xsl:if test="$parTaal = 'engels'">
          may also be made.
        </xsl:if>
        <xsl:if test="$parTaal = 'frans'">
          <xsl:text>.</xsl:text>
        </xsl:if>
        <xsl:if test="$parTaal = 'duits'">
          kann gemacht werden.
        </xsl:if>
      <xsl:if test="$parTaal = 'fries'">
       kin makke wurde. 
      </xsl:if>
      <xsl:if test="$parTaal = 'noors'">
        kan gjøres.
      </xsl:if>
      <xsl:if test="$parTaal = 'spaans'">
        se puede hacer.
      </xsl:if>
      <xsl:if test="$parTaal = 'italiaans'">
        può essere fatto.
      </xsl:if>
      <xsl:if test="$parTaal = 'portugees'">
        pode ser feita.
      </xsl:if>
        <br />
        <xsl:if test="$parTaal = 'nederlands'">
          Of maak een
        </xsl:if>
        <xsl:if test="$parTaal = 'engels'">
          You may also make an
        </xsl:if>
        <xsl:if test="$parTaal = 'frans'">
          Ou faites un graphique
        </xsl:if>
        <xsl:if test="$parTaal = 'duits'">
          Oder mache eines
        </xsl:if>
      <xsl:if test="$parTaal = 'fries'">
       Of meitsje in
      </xsl:if>
      <xsl:if test="$parTaal = 'noors'">
        Eller skape en
      </xsl:if>
      <xsl:if test="$parTaal = 'spaans'">
        O crear una
      </xsl:if>
      <xsl:if test="$parTaal = 'italiaans'">
        O creare un
      </xsl:if>
      <xsl:if test="$parTaal = 'portugees'">
        Ou criar um
      </xsl:if>
        <a href="javascript:KiesXSL(29,{$HuidigPersoon},'','1');"
           onMouseOver = "window.status='{$Txt_Uitgebreid} {$Txt_grafisch} {$Txt_kwartieren} {$Txt_overzicht}'; return true;"
           onMouseOut  = "window.status='';"><b><xsl:text> </xsl:text><xsl:value-of select="$Txt_uitgebreid"/></b></a>
        <xsl:text> </xsl:text><xsl:value-of select="$Txt_of"/>
        <a href="javascript:KiesXSL(29,{$HuidigPersoon},'','2');"
           onMouseOver = "window.status='{$Txt_Kompakt} {$Txt_grafisch} {$Txt_kwartieren} {$Txt_overzicht}'; return true;"
           onMouseOut  = "window.status='';"><b><xsl:text> </xsl:text><xsl:value-of select="$Txt_kompakt"/></b></a>
         <xsl:text> </xsl:text><xsl:value-of select="$Txt_grafisch"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_kwartieren"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_overzicht"/>
        <xsl:if test="$parTaal = 'nederlands'">
          (aantal generaties (is nu:
        </xsl:if>
        <xsl:if test="$parTaal = 'engels'">
          (number of generations (currently:
        </xsl:if>
        <xsl:if test="$parTaal = 'frans'">
          (le nombre de générations (maintenant:
        </xsl:if>
        <xsl:if test="$parTaal = 'duits'">
          (Generationszahl (jetzt:
        </xsl:if>
      <xsl:if test="$parTaal = 'fries'">
       (oantal generaasjes (is no
      </xsl:if>
      <xsl:if test="$parTaal = 'noors'">
        (antall generasjoner (nå
      </xsl:if>
      <xsl:if test="$parTaal = 'spaans'">
        (número de generaciones (ahora
      </xsl:if>
      <xsl:if test="$parTaal = 'italiaans'">
        (numero di generazioni (ora
      </xsl:if>
      <xsl:if test="$parTaal = 'portugees'">
        (número de gerações (agora
      </xsl:if>
    <xsl:if test="$parNrGeneraties = 0"><xsl:value-of select="$Txt_alle"/></xsl:if>
    <xsl:if test="$parNrGeneraties != 0"><xsl:value-of select="$parNrGeneraties"/></xsl:if>)
        <xsl:if test="$parTaal = 'nederlands'">
          en foto's via <xsl:value-of select="$Txt_Instellingen"/>).
        </xsl:if>
        <xsl:if test="$parTaal = 'engels'">
          and photos via <xsl:value-of select="$Txt_Instellingen"/>).
        </xsl:if>
        <xsl:if test="$parTaal = 'frans'">
          et des photos via <xsl:value-of select="$Txt_Instellingen"/>).
        </xsl:if>
        <xsl:if test="$parTaal = 'duits'">
          und Fotos via <xsl:value-of select="$Txt_Instellingen"/>).
        </xsl:if>
      <xsl:if test="$parTaal = 'fries'">
       en foto's fia <xsl:value-of select="$Txt_Instellingen"/>).
      </xsl:if>
      <xsl:if test="$parTaal = 'noors'">
        og bilder via <xsl:value-of select="$Txt_Instellingen"/>).
      </xsl:if>
      <xsl:if test="$parTaal = 'spaans'">
        y fotos a través de <xsl:value-of select="$Txt_Instellingen"/>).
      </xsl:if>
      <xsl:if test="$parTaal = 'italiaans'">
        e foto via <xsl:value-of select="$Txt_Instellingen"/>).
      </xsl:if>
      <xsl:if test="$parTaal = 'portugees'">
        e fotos via <xsl:value-of select="$Txt_Instellingen"/>).
      </xsl:if>
    
      </xsl:if>
    </blockquote>
    </xsl:if>
    <xsl:call-template name="ShowFooter"/>
  </xsl:if>
</xsl:template>

</xsl:stylesheet>
