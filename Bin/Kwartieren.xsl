<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">
<!--
// <author>Adrie den Blanken</author>
// <file>$Workfile: Kwartieren.xsl $</file><date>$Date: 15-01-15 8:20 $</date>
// <revision>$Revision: 19 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this
// header stays intact. No responsibility is accepted
// for use of this software.</disclaimer>
-->
<xsl:output method="html"/>

<xsl:include href="Header.xsl"/>
<xsl:include href="Talen.xsl"/>

<xsl:param name="Browser"/>
<xsl:param name="parIEGui"/>
<xsl:param name="HuidigPersoon"/>
<xsl:param name="Printing"/>
<xsl:param name="parToonVoornaam"/>
<xsl:param name="parToonVoettekst"/>
<xsl:param name="parRefOwner"/>
<xsl:param name="parRefOwnerEMail"/>
<xsl:param name="parToonKalender"/>
<xsl:param name="parStuurSorteersleutel"/>
<xsl:param name="parToonNieuws"/>
<xsl:param name="parNrGenKwartier"/>
<xsl:param name="parNrGeneraties"/>
<xsl:param name="parTaal"/>

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

<xsl:template match="PERSONEN">

  <xsl:call-template name="ShowMenu"/>

  <xsl:for-each select="PERSOON[@link=$HuidigPersoon]">
    <div align="center">
      <xsl:if test="$Printing = 1">
        <div align="center">
          <a href="javascript:KiesXSL(8,{$HuidigPersoon},'','');"
             onMouseOver = "window.status='{$Txt_terug}'; return true;"
             onMouseOut  = "window.status='';"><h3><xsl:value-of select="$Txt_Kwartieren"/> (4 <xsl:value-of select="$Txt_generaties"/>) <xsl:value-of select="$Txt_van"/></h3></a>
        </div>
      </xsl:if>
      <xsl:if test="$Printing = 0">
        <h3><xsl:value-of select="$Txt_Kwartieren"/> (4 <xsl:value-of select="$Txt_generaties"/>) <xsl:value-of select="$Txt_van"/></h3>
      </xsl:if>
      <h2>
        <xsl:for-each select="PERSONAL">
          <xsl:for-each select="NAME">
            <xsl:if test="string-length(@first) != 0">
              <xsl:value-of select="@first"/>
            </xsl:if>
            <xsl:if test="string-length(@first) = 0">
              <xsl:value-of select="@nick"/>
            </xsl:if>
            <xsl:if test="string-length(@pref) != 0">
              <xsl:text> </xsl:text><xsl:value-of select="@pref"/>
            </xsl:if>
            <xsl:text> </xsl:text><xsl:value-of select="@surn"/>
          </xsl:for-each>
        </xsl:for-each>
      </h2>
    </div>
    <br/>

    <table width="100%">
      <!-- Hier begint de grote stamboom tabel -->
      <tbody>
        <tr>
          <!-- Eerste regel -->
          <td>
            <!-- Eerste kolom -->
            <xsl:element name="table">
              <xsl:attribute name="class">kw-tbl</xsl:attribute>
              <tbody>
                <tr>
                  <!-- Ps: Werkt alleen als preserve="white-space" oid niet in de kopregel aanwezig is -->
                  <xsl:element name="TD">
                    <xsl:attribute name="class">
                      <xsl:choose>
                        <xsl:when test="contains(PERSONAL/@sex,'M')">
                          <xsl:text>kw-td-dad</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:choose>
                            <xsl:when test="contains(PERSONAL/@sex,'V')">
                              <xsl:text>kw-td-mom</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:text>kw-td-none</xsl:text>
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
                    <font size="1">
                      <xsl:for-each select="PERSONAL">
                        <xsl:call-template name="ShowPersoon2">
                          <xsl:with-param name="relatie"/>
                          <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
                          <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
                          <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
                          <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
                          <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
                          <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
                        </xsl:call-template>
                      </xsl:for-each>
                      <!-- PERSONAL -->
                      <br/>
                      <xsl:for-each select="EVENTS">
                        <xsl:for-each select="BIRTH">
                          <xsl:if test="string-length(@date)>0">
                            *<xsl:value-of select="@onz"/><xsl:value-of select="@date"/>
                          </xsl:if>
                        </xsl:for-each>
                        <!-- BIRTH -->
                        <xsl:for-each select="DEATH">
                          <xsl:if test="string-length(@date)>0">
                            &#8224;<xsl:value-of select="@onz"/><xsl:value-of select="@date"/>
                          <!-- &#8224; == Dagger == + -->
                          </xsl:if>
                        </xsl:for-each>
                        <xsl:value-of select="$nbsp"/>
                        <!-- DEATH -->
                      </xsl:for-each>
                      <!-- EVENTS -->
                    </font>
                  </xsl:element>
                </tr>
              </tbody>
            </xsl:element>
          </td>
          <!-- Einde eerste kolom -->
          <td>
            <!-- Begin tweede kolom -->
            <table class="kw-tbl">
              <tbody>
                <tr>
                  <xsl:choose>
                    <xsl:when test="count(FATHER) = count(FATHER/@type)">
                      <xsl:call-template name="NoParent"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:for-each select="FATHER[count(@type)=0]">
                        <xsl:variable name="vader1" select="@link"/>
                        <xsl:for-each select="//PERSONEN/PERSOON[@link=$vader1]">
                          <xsl:call-template name="Vader">
                            <xsl:with-param name="relatie">vader</xsl:with-param>
                          </xsl:call-template>
                        </xsl:for-each>
                        <!-- document-->
                      </xsl:for-each>
                      <!-- FATHER-->
                    </xsl:otherwise>
                  </xsl:choose>
                </tr>
              </tbody>
            </table>
            <!-- Lege regels tussen vader en moeder -->
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            <table width="100%" border="0" cellspacing="0" cellpadding="4">
              <tbody>
                <tr>
                  <xsl:choose>
                    <xsl:when test="count(MOTHER) = count(MOTHER/@type)">
                      <xsl:call-template name="NoParent"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:for-each select="MOTHER[count(@type)=0]">
                        <xsl:variable name="moeder1" select="@link"/>
                        <xsl:for-each select="//PERSONEN/PERSOON[@link=$moeder1]">
                          <xsl:call-template name="Moeder">
                            <xsl:with-param name="relatie">moeder</xsl:with-param>
                          </xsl:call-template>
                        </xsl:for-each>
                        <!-- document-->
                      </xsl:for-each>
                      <!-- MOTHER-->
                    </xsl:otherwise>
                  </xsl:choose>
                </tr>
              </tbody>
            </table>
          </td>
          <!-- Einde tweede kolom -->
          <td>
            <!-- Begin derde kolom -->
            <table class="kw-tbl">
              <tbody>
                <tr>
                  <xsl:choose>
                    <xsl:when test="count(FATHER) = count(FATHER/@type)">
                      <xsl:call-template name="NoParent"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:for-each select="FATHER[count(@type)=0]">
                        <xsl:variable name="vader2" select="@link"/>
                        <xsl:for-each select="//PERSONEN/PERSOON[@link=$vader2]">
                          <xsl:choose>
                            <xsl:when test="count(FATHER) = count(FATHER/@type)">
                              <xsl:call-template name="NoParent"/>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:call-template name="GrootVader"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:for-each>
                        <!-- document-->
                      </xsl:for-each>
                      <!-- FATHER-->
                    </xsl:otherwise>
                  </xsl:choose>
                </tr>
              </tbody>
            </table>
            <br/>
            <br/>
            <br/>
            <table width="100%" border="0" cellspacing="0" cellpadding="4">
              <tbody>
                <tr>
                  <xsl:choose>
                    <xsl:when test="count(FATHER) = count(FATHER/@type)">
                      <xsl:call-template name="NoParent"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:for-each select="FATHER[count(@type)=0]">
                        <xsl:variable name="vader3" select="@link"/>
                        <xsl:for-each select="//PERSONEN/PERSOON[@link=$vader3]">
                          <xsl:choose>
                            <xsl:when test="count(MOTHER) = count(MOTHER/@type)">
                              <xsl:call-template name="NoParent"/>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:call-template name="GrootMoeder"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:for-each>
                        <!-- document-->
                      </xsl:for-each>
                      <!-- FATHER-->
                    </xsl:otherwise>
                  </xsl:choose>
                </tr>
              </tbody>
            </table>
            <br/>
            <br/>
            <br/>
            <table class="kw-tbl">
              <tbody>
                <tr>
                  <xsl:choose>
                    <xsl:when test="count(MOTHER) = count(MOTHER/@type)">
                      <xsl:call-template name="NoParent"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:for-each select="MOTHER[count(@type)=0]">
                        <xsl:variable name="moeder2" select="@link"/>
                        <xsl:for-each select="//PERSONEN/PERSOON[@link=$moeder2]">
                          <xsl:choose>
                            <xsl:when test="count(FATHER) = count(FATHER/@type)">
                              <xsl:call-template name="NoParent"/>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:call-template name="GrootVader"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:for-each>
                        <!-- document -->
                      </xsl:for-each>
                      <!-- MOTHER -->
                    </xsl:otherwise>
                  </xsl:choose>
                </tr>
              </tbody>
            </table>
            <br/>
            <br/>
            <br/>
            <table class="kw-tbl">
              <tbody>
                <tr>
                  <xsl:choose>
                    <xsl:when test="count(MOTHER) = count(MOTHER/@type)">
                      <xsl:call-template name="NoParent"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:for-each select="MOTHER[count(@type)=0]">
                        <xsl:variable name="moeder3" select="@link"/>
                        <xsl:for-each select="//PERSONEN/PERSOON[@link=$moeder3]">
                          <xsl:choose>
                            <xsl:when test="count(MOTHER) = count(MOTHER/@type)">
                              <xsl:call-template name="NoParent"/>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:call-template name="GrootMoeder"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:for-each>
                        <!-- document -->
                      </xsl:for-each>
                      <!-- MOTHER -->
                    </xsl:otherwise>
                  </xsl:choose>
                </tr>
              </tbody>
            </table>
          </td>
          <!-- Einde derde kolom -->
          <td>
            <!-- Begin vierde kolom -->
            <table class="kw-tbl">
              <tbody>
                <tr>
                  <xsl:choose>
                    <xsl:when test="count(FATHER) = count(FATHER/@type)">
                      <xsl:call-template name="NoParent"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:for-each select="FATHER[count(@type)=0]">
                        <xsl:variable name="vader4" select="@link"/>
                        <xsl:for-each select="//PERSONEN/PERSOON[@link=$vader4]">
                          <xsl:choose>
                            <xsl:when test="count(FATHER) = count(FATHER/@type)">
                              <xsl:call-template name="NoParent"/>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:for-each select="FATHER[count(@type)=0]">
                                <xsl:variable name="vader5" select="@link"/>
                                <xsl:for-each select="//PERSONEN/PERSOON[@link=$vader5]">
                                  <xsl:choose>
                                    <xsl:when test="count(FATHER) = count(FATHER/@type)">
                                      <xsl:call-template name="NoParent"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <xsl:call-template name="OverGrootVader"/>
                                    </xsl:otherwise>
                                  </xsl:choose>
                                </xsl:for-each>
                                <!-- document-->
                              </xsl:for-each>
                              <!-- FATHER-->
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:for-each>
                        <!-- document-->
                      </xsl:for-each>
                      <!-- FATHER-->
                    </xsl:otherwise>
                  </xsl:choose>
                </tr>
              </tbody>
            </table>
            <table class="kw-tbl">
              <tbody>
                <tr>
                  <xsl:choose>
                    <xsl:when test="count(FATHER) = count(FATHER/@type)">
                      <xsl:call-template name="NoParent"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:for-each select="FATHER[count(@type)=0]">
                        <xsl:variable name="vader6" select="@link"/>
                        <xsl:for-each select="//PERSONEN/PERSOON[@link=$vader6]">
                          <xsl:choose>
                            <xsl:when test="count(FATHER) = count(FATHER/@type)">
                              <xsl:call-template name="NoParent"/>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:for-each select="FATHER[count(@type)=0]">
                                <xsl:variable name="vader7" select="@link"/>
                                <xsl:for-each select="//PERSONEN/PERSOON[@link=$vader7]">
                                  <xsl:call-template name="OverGrootMoeder"/>
                                </xsl:for-each>
                                <!-- document-->
                              </xsl:for-each>
                              <!-- FATHER-->
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:for-each>
                        <!-- document-->
                      </xsl:for-each>
                      <!-- FATHER-->
                    </xsl:otherwise>
                  </xsl:choose>
                </tr>
              </tbody>
            </table>
            <br/>
            <table class="kw-tbl">
              <tbody>
                <tr>
                  <xsl:choose>
                    <xsl:when test="count(FATHER) = count(FATHER/@type)">
                      <xsl:call-template name="NoParent"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:for-each select="FATHER[count(@type)=0]">
                        <xsl:variable name="vader8" select="@link"/>
                        <xsl:for-each select="//PERSONEN/PERSOON[@link=$vader8]">
                          <xsl:choose>
                            <xsl:when test="count(MOTHER) = count(MOTHER/@type)">
                              <xsl:call-template name="NoParent"/>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:for-each select="MOTHER[count(@type)=0]">
                                <xsl:variable name="moeder4" select="@link"/>
                                <xsl:for-each select="//PERSONEN/PERSOON[@link=$moeder4]">
                                  <xsl:choose>
                                    <xsl:when test="count(FATHER) = count(FATHER/@type)">
                                      <xsl:call-template name="NoParent"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <xsl:call-template name="OverGrootVader"/>
                                    </xsl:otherwise>
                                  </xsl:choose>
                                </xsl:for-each>
                                <!-- document -->
                              </xsl:for-each>
                              <!-- MOTHER -->
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:for-each>
                        <!-- document -->
                      </xsl:for-each>
                      <!-- FATHER -->
                    </xsl:otherwise>
                  </xsl:choose>
                </tr>
              </tbody>
            </table>
            <table class="kw-tbl">
              <tbody>
                <tr>
                  <xsl:choose>
                    <xsl:when test="count(FATHER) = count(FATHER/@type)">
                      <xsl:call-template name="NoParent"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:for-each select="FATHER[count(@type)=0]">
                        <xsl:variable name="vader9" select="@link"/>
                        <xsl:for-each select="//PERSONEN/PERSOON[@link=$vader9]">
                          <xsl:choose>
                            <xsl:when test="count(MOTHER) = count(MOTHER/@type)">
                              <xsl:call-template name="NoParent"/>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:for-each select="MOTHER[count(@type)=0]">
                                <xsl:variable name="moeder5" select="@link"/>
                                <xsl:for-each select="//PERSONEN/PERSOON[@link=$moeder5]">
                                  <xsl:call-template name="OverGrootMoeder"/>
                                </xsl:for-each>
                                <!-- document -->
                              </xsl:for-each>
                              <!-- MOTHER -->
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:for-each>
                        <!-- document -->
                      </xsl:for-each>
                      <!-- FATHER -->
                    </xsl:otherwise>
                  </xsl:choose>
                </tr>
              </tbody>
            </table>
            <br/>
            <table class="kw-tbl">
              <tbody>
                <tr>
                  <xsl:choose>
                    <xsl:when test="count(MOTHER) = count(MOTHER/@type)">
                      <xsl:call-template name="NoParent"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:for-each select="MOTHER[count(@type)=0]">
                        <xsl:variable name="moeder6" select="@link"/>
                        <xsl:for-each select="//PERSONEN/PERSOON[@link=$moeder6]">
                          <xsl:choose>
                            <xsl:when test="count(FATHER) = count(FATHER/@type)">
                              <xsl:call-template name="NoParent"/>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:for-each select="FATHER[count(@type)=0]">
                                <xsl:variable name="vader10" select="@link"/>
                                <xsl:for-each select="//PERSONEN/PERSOON[@link=$vader10]">
                                  <xsl:choose>
                                    <xsl:when test="count(FATHER) = count(FATHER/@type)">
                                      <xsl:call-template name="NoParent"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <xsl:call-template name="OverGrootVader"/>
                                    </xsl:otherwise>
                                  </xsl:choose>
                                </xsl:for-each>
                                <!-- document -->
                              </xsl:for-each>
                              <!-- FATHER -->
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:for-each>
                        <!-- document -->
                      </xsl:for-each>
                      <!-- MOTHER -->
                    </xsl:otherwise>
                  </xsl:choose>
                </tr>
              </tbody>
            </table>
            <table class="kw-tbl">
              <tbody>
                <tr>
                  <xsl:choose>
                    <xsl:when test="count(MOTHER) = count(MOTHER/@type)">
                      <xsl:call-template name="NoParent"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:for-each select="MOTHER[count(@type)=0]">
                        <xsl:variable name="moeder7" select="@link"/>
                        <xsl:for-each select="//PERSONEN/PERSOON[@link=$moeder7]">
                          <xsl:choose>
                            <xsl:when test="count(FATHER) = 0">
                              <xsl:call-template name="NoParent"/>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:for-each select="FATHER[count(@type)=0]">
                                <xsl:variable name="vader11" select="@link"/>
                                <xsl:for-each select="//PERSONEN/PERSOON[@link=$vader11]">
                                  <xsl:call-template name="OverGrootMoeder"/>
                                </xsl:for-each>
                                <!-- document -->
                              </xsl:for-each>
                              <!-- FATHER -->
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:for-each>
                        <!-- document -->
                      </xsl:for-each>
                      <!-- MOTHER -->
                    </xsl:otherwise>
                  </xsl:choose>
                </tr>
              </tbody>
            </table>
            <br/>
            <table class="kw-tbl">
              <tbody>
                <tr>
                  <xsl:choose>
                    <xsl:when test="count(MOTHER) = count(MOTHER/@type)">
                      <xsl:call-template name="NoParent"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:for-each select="MOTHER[count(@type)=0]">
                        <xsl:variable name="moeder8" select="@link"/>
                        <xsl:for-each select="//PERSONEN/PERSOON[@link=$moeder8]">
                          <xsl:choose>
                            <xsl:when test="count(MOTHER) = count(MOTHER/@type)">
                              <xsl:call-template name="NoParent"/>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:for-each select="MOTHER[count(@type)=0]">
                                <xsl:variable name="moeder9" select="@link"/>
                                <xsl:for-each select="//PERSONEN/PERSOON[@link=$moeder9]">
                                  <xsl:call-template name="OverGrootVader"/>
                                </xsl:for-each>
                                <!-- document -->
                              </xsl:for-each>
                              <!-- MOTHER -->
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:for-each>
                        <!-- document -->
                      </xsl:for-each>
                      <!-- MOTHER -->
                    </xsl:otherwise>
                  </xsl:choose>
                </tr>
              </tbody>
            </table>
            <!-- -->
            <table class="kw-tbl">
              <tbody>
                <tr>
                  <xsl:choose>
                    <xsl:when test="count(MOTHER) = count(MOTHER/@type)">
                      <xsl:call-template name="NoParent"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:for-each select="MOTHER[count(@type)=0]">
                        <xsl:variable name="moeder10" select="@link"/>
                        <xsl:for-each select="//PERSONEN/PERSOON[@link=$moeder10]">
                          <xsl:choose>
                            <xsl:when test="count(MOTHER) = count(MOTHER/@type)">
                              <xsl:call-template name="NoParent"/>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:for-each select="MOTHER[count(@type)=0]">
                                <xsl:variable name="moeder11" select="@link"/>
                                <xsl:for-each select="//PERSONEN/PERSOON[@link=$moeder11]">
                                  <xsl:call-template name="OverGrootMoeder"/>
                                </xsl:for-each>
                                <!-- document -->
                              </xsl:for-each>
                              <!-- MOTHER -->
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:for-each>
                        <!-- document -->
                      </xsl:for-each>
                      <!-- MOTHER -->
                    </xsl:otherwise>
                  </xsl:choose>
                </tr>
              </tbody>
            </table>
          </td>
          <!-- Einde vierde kolom -->
        </tr>
      </tbody>
    </table>
  </xsl:for-each>

  <xsl:call-template name="SvgNavigatie">
      <xsl:with-param name="IsPrinting"><xsl:value-of select="$Printing"/></xsl:with-param>
      <xsl:with-param name="IsSvg">0</xsl:with-param>
      <xsl:with-param name="WelkeSvg">08</xsl:with-param>
      <xsl:with-param name="MaxNrGen"><xsl:value-of select="$parNrGenKwartier"/></xsl:with-param>
  </xsl:call-template>

</xsl:template>

<!-- ============================================ -->
<!-- Start van de templates / functions / modules -->
<!-- ============================================ -->
<xsl:template name="Moeder">
  <xsl:param name="relatie"/>
  <td class="kw-td-mom">
    <font size="1">
      <xsl:for-each select="PERSONAL">
        <xsl:if test="$relatie = 'overgrootmoeder'">
          <xsl:call-template name="ShowPersoon2">
            <xsl:with-param name="relatie"><xsl:value-of select="$Txt_overgrootmoeder"/></xsl:with-param>
            <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
            <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
            <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
            <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
            <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
            <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
         </xsl:call-template>
        </xsl:if>
        <xsl:if test="$relatie = 'grootmoeder'">
          <xsl:call-template name="ShowPersoon2">
            <xsl:with-param name="relatie"><xsl:value-of select="$Txt_grootmoeder"/></xsl:with-param>
            <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
            <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
            <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
            <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
            <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
            <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
          </xsl:call-template>
        </xsl:if>
        <xsl:if test="$relatie = 'moeder'">
          <xsl:call-template name="ShowPersoon2">
            <xsl:with-param name="relatie"><xsl:value-of select="$Txt_moeder"/></xsl:with-param>
            <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
            <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
            <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
            <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
            <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
            <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
          </xsl:call-template>
        </xsl:if>
      </xsl:for-each>
      <!-- NAME -->
      <br/>
      <xsl:for-each select="EVENTS">
        <xsl:for-each select="BIRTH">
          <xsl:if test="string-length(@date)>0">
            *<xsl:value-of select="@onz"/><xsl:value-of select="@date"/>
          </xsl:if>
        </xsl:for-each>
        <!-- BIRTH -->
        <xsl:for-each select="DEATH">
          <xsl:if test="string-length(@date)>0">
            &#8224;<xsl:value-of select="@onz"/><xsl:value-of select="@date"/>
          <!-- &#8224; == Dagger == + -->
          </xsl:if>
        </xsl:for-each>
        <xsl:value-of select="$nbsp"/>
        <!-- DEATH -->
      </xsl:for-each>
      <!-- EVENTS -->
      <xsl:if test="string-length(EVENTS/BIRTH/@date) = 0 and string-length(EVENTS/DEATH/@date) = 0">
        <xsl:value-of select="$nbsp"/>
      </xsl:if>      
    </font>
  </td>
</xsl:template>

<xsl:template name="Vader">
  <xsl:param name="relatie"/>
  <td class="kw-td-dad">
    <font size="1">
      <xsl:for-each select="PERSONAL">
        <xsl:if test="$relatie = 'overgrootvader'">
          <xsl:call-template name="ShowPersoon2">
            <xsl:with-param name="relatie"><xsl:value-of select="$Txt_overgrootvader"/></xsl:with-param>
            <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
            <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
            <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
            <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
            <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
            <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
          </xsl:call-template>
        </xsl:if>
        <xsl:if test="$relatie = 'grootvader'">
          <xsl:call-template name="ShowPersoon2">
            <xsl:with-param name="relatie"><xsl:value-of select="$Txt_grootvader"/></xsl:with-param>
            <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
            <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
            <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
            <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
            <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
            <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
          </xsl:call-template>
        </xsl:if>
        <xsl:if test="$relatie = 'vader'">
          <xsl:call-template name="ShowPersoon2">
            <xsl:with-param name="relatie"><xsl:value-of select="$Txt_vader"/></xsl:with-param>
            <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
            <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
            <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
            <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
            <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
            <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
          </xsl:call-template>
        </xsl:if>
      </xsl:for-each>
      <!-- NAME -->
      <br/>
      <xsl:for-each select="EVENTS">
        <xsl:for-each select="BIRTH">
          <xsl:if test="string-length(@date)>0">
            *<xsl:value-of select="@onz"/><xsl:value-of select="@date"/>
          </xsl:if>
        </xsl:for-each>
        <!-- BIRTH -->
        <xsl:for-each select="DEATH">
          <xsl:if test="string-length(@date)>0">
            &#8224;<xsl:value-of select="@onz"/><xsl:value-of select="@date"/>
          <!-- &#8224; == Dagger == + -->
          </xsl:if>
        </xsl:for-each>
        <xsl:value-of select="$nbsp"/>
        <!-- DEATH -->
      </xsl:for-each>
      <!-- EVENTS -->
      <xsl:if test="string-length(EVENTS/BIRTH/@date) = 0 and string-length(EVENTS/DEATH/@date) = 0">
        <xsl:value-of select="$nbsp"/>
      </xsl:if>
    </font>
  </td>
</xsl:template>

<xsl:template name="GrootVader">
  <xsl:for-each select="FATHER[count(@type)=0]">
    <xsl:variable name="grootvader" select="@link"/>
    <xsl:for-each select="//PERSONEN/PERSOON[@link=$grootvader]">
      <xsl:call-template name="Vader">
        <xsl:with-param name="relatie">grootvader</xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <!-- select="document(@link)/PERSOON -->
  </xsl:for-each>
  <!-- FATHER -->
</xsl:template>

<xsl:template name="GrootMoeder">
  <xsl:for-each select="MOTHER[count(@type)=0]">
    <xsl:variable name="grootmoeder" select="@link"/>
    <xsl:for-each select="//PERSONEN/PERSOON[@link=$grootmoeder]">
      <xsl:call-template name="Moeder">
        <xsl:with-param name="relatie">grootmoeder</xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <!-- select="document(@link)/PERSOON -->
  </xsl:for-each>
  <!-- MOTHER -->
</xsl:template>

<xsl:template name="OverGrootVader">
  <xsl:choose>
    <xsl:when test="count(MOTHER) = count(MOTHER/@type)">
      <xsl:call-template name="NoParent"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:for-each select="FATHER[count(@type)=0]">
        <xsl:variable name="overgrootvader" select="@link"/>
        <xsl:for-each select="//PERSONEN/PERSOON[@link=$overgrootvader]">
          <xsl:call-template name="Vader">
            <xsl:with-param name="relatie">overgrootvader</xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
        <!-- select="document(@link)/PERSOON -->
      </xsl:for-each>
      <!-- FATHER -->
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="OverGrootMoeder">
  <xsl:choose>
    <xsl:when test="count(MOTHER) = count(MOTHER/@type)">
      <xsl:call-template name="NoParent"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:for-each select="MOTHER[count(@type)=0]">
        <xsl:variable name="moeder" select="@link"/>
        <xsl:for-each select="//PERSONEN/PERSOON[@link=$moeder]">
          <xsl:call-template name="Moeder">
            <xsl:with-param name="relatie">overgrootmoeder</xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
        <!-- select="document(@link)/PERSOON -->
      </xsl:for-each>
      <!-- MOTHER -->
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="NoParent">
  <td class="kw-td-none">
    <font size="2">
      <xsl:value-of select="$Txt_Nietbekend"/>
      <xsl:value-of select="$nbsp"/>
      <xsl:value-of select="$nbsp"/>
      <xsl:value-of select="$nbsp"/>
      <xsl:value-of select="$nbsp"/>
    </font>
    <br/>
    <font size="1">
      <xsl:value-of select="$nbsp"/>
    </font>
  </td>
</xsl:template>

<xsl:template name="ShowPersoon2">
  <xsl:param name="relatie"/>
  <xsl:param name="NAMEFIRST"/>
  <xsl:param name="NAMENICK"/>
  <xsl:param name="NAMEPREF"/>
  <xsl:param name="SURN"/>
  <xsl:param name="src"/>
  <xsl:param name="priv"/>
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

      <xsl:if test="string-length($priv) = 0">
        <font size="2">
          <strong>
            <a href="javascript:ToonPersoonsKaart('{$src}')" OnMouseOver="window.status='{$Txt_Bekijk_kwartieren} {$relatie} {$hyperNameNoQuote}'; return true;" OnMouseOut="window.status='';">
              <xsl:value-of select="$hyperName"/>
            </a>
          </strong>
        </font>
      </xsl:if>
      <xsl:if test="$priv = 1">
        <font size="2">
          <xsl:value-of select="$hyperName"/>
        </font>
      </xsl:if>
</xsl:template>

  <!--
================================================
/  Begin at the root of the document
//  Descendant-or-self
.  Self axis
..  Parent axis
@  Attribute axis
|  Union bv math="a|b" matches all a and b
*  Any node
[]  Used to predicate expression that filters a group of nodes
$  Variable operator, indate that a given symbol is a variable name

Voorbeeld van testen op aanwezigheid van een bepaald label
   <xsl:if test="count(BURI) = 0">...Geen BURI aanwezig...</xsl:if>

Voorbeeld van testen op een lege entiteit
   <xsl:if test="BAPTDATE = ''">Deze is leeg</xsl:if>

Hexadecimale getallen ipv bijzondere karakters kan op de volgende manier
   &#x0020;    Dit is een spatie (code 32 is hex 20)
================================================
-->

</xsl:stylesheet>

