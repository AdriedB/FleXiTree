<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">
<!--
// <author>Adrie den Blanken</author>
// <file>$Workfile: Help.xsl $</file><date>$Date: 15-01-15 8:20 $</date>
// <revision>$Revision: 27 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this
// header stays intact. No responsibility is accepted
// for use of this software.</disclaimer>
-->

<xsl:output method="html"/>

<xsl:include href="Header.xsl"/>
<xsl:include href="Talen.xsl"/>

<xsl:param name="HuidigPersoon"/>
<xsl:param name="Browser"/>
<xsl:param name="LijstWoord"/>
<xsl:param name="Printing"/>
<xsl:param name="parToonVoornaam"/>
<xsl:param name="parToonVoettekst"/>
<xsl:param name="parRefOwner"/>
<xsl:param name="parRefOwnerEMail"/>
<xsl:param name="parToonKalender"/>
<xsl:param name="parStuurSorteersleutel"/>
<xsl:param name="parToonNieuws"/>
<xsl:param name="parTaal"/>

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

  <xsl:call-template name="ShowMenu"/>

<br/>
<div align="center">
<table class="pk-width tbl-tekst" style="border-color:black; margin-left:auto; margin-right:auto; text-align:justify">
<tr><td>

<xsl:if test="$parTaal = 'nederlands'">
Op deze website zijn allerlei overzichten te vinden van deze <xsl:value-of select="$Txt_stamboom"/>. Bovenaan elke pagina staan twee regels: één met overzichten van een persoon
en één met algemene overzichten. Door hier op te klikken verschijnt het betreffende rapport, of verschijnt een vervolgpagina waar rapporten van
deze categorie gekozen kunnen worden.
<br/><br/>
De overzichten van een persoon hebben steeds betrekking op de laatst geselecteerde persoon.
Op dit moment is dat 
      <xsl:for-each select="PERSOON[@link=$linkPersoon]/PERSONAL">
        <xsl:call-template name="ShowPersoon">
          <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
          <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
          <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
          <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
          <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
          <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>.
	<br /><br />
Wilt u dus een rapport zien van een bepaalde persoon, dan moet u deze eerst ergens selecteren.
Dit selecteren kan overal gebeuren waar de naam in <a href="javascript:KiesXSL(5,{$HuidigPersoon},'','')">deze kleur</a> staat. Dit is op heel veel plaatsen.
<br/><br/>
Bijna alle pagina's worden pas aangemaakt op het moment dat u ergens op klikt.
Dit betekent dat het even kan duren voor de betreffende pagina op het beeldscherm verschijnt.
Dit geldt met name bij grote overzichten (b.v. een nageslacht-overzicht van iemand met veel nakomelingen).
<br/><br/>
Door te klikken op de knop <xsl:value-of select="$Txt_Instellingen"/> kunt u de rapporten naar eigen smaak aanpassen. De instellingen blijven bewaard zodat ze in een volgende sessie weer beschikbaar zijn.
Hiertoe worden deze <xsl:value-of select="$Txt_instellingen"/> opgeslagen via zogenaamde cookies. Wilt u van deze mogelijkheid gebruik maken, dan moet uw computer zo zijn ingesteld dat cookies geaccepteerd worden.
<br/><br/>
<table class="tbl-tekst">
<tbody>
<tr><td valign="top"> - De rapporten van elk persoon omvatten:</td></tr>
<tr><td valign="top"><ul>
<li>een <xsl:value-of select="$Txt_persoonskaart"/>, met gegevens over de persoon (eventueel met foto's), diens ouders, <xsl:value-of select="$Txt_relaties"/> en <xsl:value-of select="$Txt_kinderen"/>;</li>
<xsl:choose>
  <xsl:when test="$Browser = 'IE'">
    <li>weergave van het <xsl:value-of select="$Txt_voorgeslacht"/> van deze persoon in tekst- en in diverse grafische vormen: als <xsl:value-of select="$Txt_vooroudercirkel"/>,
        <xsl:value-of select="$Txt_sierstamboom"/>, <xsl:value-of select="$Txt_waaier"/>, <xsl:value-of select="$Txt_zandloper"/>, standaardkwartieren of schema
        alsmede enkele statistische gegevens;</li>
    <li>weergave van het <xsl:value-of select="$Txt_nageslacht"/> van deze persoon in tekst- en in diverse grafische vormen:
        een overzicht van <xsl:value-of select="$Txt_kleinkinderen"/> en <xsl:value-of select="$Txt_achterkleinkinderen"/>, een grafisch <xsl:value-of select="$Txt_nageslacht"/>
        in rechthoekvorm, al of niet met foto's of in cirkelvorm, en een <xsl:value-of select="$Txt_parenteel"/> in mannelijke of vrouwelijke lijn of in beide lijnen,
        alle met of zonder foto's, alsmede enkele statistische gegevens;</li>
    <li><xsl:value-of select="$Txt_verwantschap"/> en grafische weergave van alle <xsl:value-of select="$Txt_verwantschapslijnen"/> met een willekeurig ander te kiezen persoon;</li>
  </xsl:when>
  <xsl:otherwise>
    <li>weergave van het <xsl:value-of select="$Txt_voorgeslacht"/> van deze persoon in standaardkwartieren; voor andere grafische overzichten is Internet Explorer nodig;</li>
    <li>weergave van het <xsl:value-of select="$Txt_nageslacht"/> van deze persoon in tekstvorm; voor meer overzichten is Internet Explorer nodig;</li>
    <li>voor de verwantschapsberekening en grafische weergave van alle <xsl:value-of select="$Txt_verwantschapslijnen"/> is Internet Explorer nodig;</li>
  </xsl:otherwise>
</xsl:choose>
</ul></td></tr>
<tr><td valign="top"> - De rapporten van het totale bestand omvatten:</td></tr>
<tr><td valign="top">
<ul>
<li>Overzichten van:
<ul>
<li><xsl:value-of select="$Txt_Fotos"/>: Een overzicht van alle foto's, een fotogalerij (maximaal één foto per persoon) en een doorlopende <xsl:value-of select="$Txt_diavoorstelling"/> waarbij alle foto's achtereenvolgens automatisch op het scherm getoond worden</li>
<li><xsl:value-of select="$Txt_FotoMemory"/>: Een versie van het Memoryspel aan de hand van de foto's.</li>
<li> <xsl:value-of select="$Txt_Gebeurtenissen"/>:
<xsl:if test="$Browser = 'IE'">
  <xsl:text>Een overzicht op datum van alle </xsl:text><xsl:value-of select="$Txt_gebeurtenissen"/><xsl:text> en een overzicht van de </xsl:text><xsl:value-of select="$Txt_gebeurtenissen"/><xsl:text> van vandaag in enig jaar in het verleden. </xsl:text>
</xsl:if>
  <xsl:text>Een overzicht van personen van wie onlangs gegevens zijn gewijzigd. </xsl:text>
</li>
<li>
<xsl:value-of select="$Txt_Kalenders"/><xsl:text>: Een verjaardagskalender van nog levende personen</xsl:text>
<xsl:if test="$Browser = 'IE'">
  <xsl:text> en een </xsl:text><xsl:value-of select="$Txt_kalender"/><xsl:text> van alle </xsl:text><xsl:value-of select="$Txt_gebeurtenissen"/>
</xsl:if>.
</li>
<li><xsl:text>Diverse overzichten: overzichten van alle personen</xsl:text>
<xsl:if test="$Browser != 'OP'">
  <xsl:text>, roep- en achternamen, geboorte-, doop-, relatie-, overlijdens-, begrafenis- en woonplaatsen </xsl:text>
</xsl:if>
<xsl:text> en </xsl:text><xsl:value-of select="$Txt_relaties"/><xsl:text>. </xsl:text>
<xsl:if test="$Browser = 'IE'">
  <xsl:text>Verder een overzicht van alle </xsl:text><xsl:value-of select="$Txt_verwantschappen"/><xsl:text> tussen </xsl:text><xsl:value-of select="$Txt_personen"/><xsl:text> die een </xsl:text><xsl:value-of select="$Txt_relatie"/><xsl:text> hebben.</xsl:text>
</xsl:if>
</li>
</ul></li>
<li>Statistische gegevens; het aantal levende en overleden mannen en vrouwen, en een overzicht van elke categorie.
<xsl:if test="$Browser = 'IE'">
  <xsl:text>Ook bevat deze rubriek </xsl:text><xsl:value-of select="$Txt_leeftijdsoverzichten"/><xsl:text> als </xsl:text><xsl:value-of select="$Txt_histogram"/><xsl:text> en als </xsl:text><xsl:value-of select="$Txt_tabel"/>.
</xsl:if>
</li>
<li>Een zoekfunctie, met behulp waarvan <xsl:value-of select="$Txt_personen"/> gezocht kunnen worden. Er kan gezocht worden via de eerste letter van de achternaam of op
   <xsl:value-of select="$Txt_roepnaam"/>, <xsl:value-of select="$Txt_voornamen"/>, <xsl:value-of select="$Txt_tussenvoegsel"/>, <xsl:value-of select="$Txt_achternaam"/>, <xsl:value-of select="$Txt_geboortejaar"/> en <xsl:value-of select="$Txt_familie"/>.
Bij dit laatste wordt gezocht op aan de opgegeven naam verwante <xsl:value-of select="$Txt_achternamen"/>, zoals vastgelegd in Aldfaer bij "sorteren als"; </li>
<li><xsl:value-of select="$Txt_Vorige"/>: door hier op te klikken komt de vorige pagina in beeld; let op dat dit niet kan via de "vorige" knop van de browser.</li>
</ul></td></tr>
<tr><td valign="top"> - Bijzondere eigenschappen:</td></tr>
<tr><td><ul>
<li>De foto's kunnen vergroot worden door erop te klikken. Het fotovenster hoeft niet gesloten te worden. Wanneer op een andere foto wordt
geklikt, dan wordt deze in hetzelfde venster geopend.</li>
<xsl:if test="$Browser = 'IE'">
  <li>Op de namen in de grafische overzichten kan geklikt worden, zodat direct de <xsl:value-of select="$Txt_persoonskaart"/> van die persoon wordt getoond.</li>
  <li>De <xsl:value-of select="$Txt_leeftijd"/> van <xsl:value-of select="$Txt_levendepersonen"/> is de <xsl:value-of select="$Txt_leeftijd"/> op dit moment, de leeftijd van <xsl:value-of select="$Txt_overledenpersonen"/> is de <xsl:value-of select="$Txt_leeftijd"/> op het moment van <xsl:value-of select="$Txt_overlijden"/>.</li>
</xsl:if>
<xsl:if test="$Browser != 'IE'">
  <li>De <xsl:value-of select="$Txt_leeftijd"/> van <xsl:value-of select="$Txt_levendepersonen"/> is de <xsl:value-of select="$Txt_leeftijd"/> op het moment dat het stamboombestand gegenereerd is (<xsl:value-of select="//FLEXITREE/@date"/>), de leefijd van overleden personen is de leeftijd op het moment van overlijden.</li>
</xsl:if>
</ul></td></tr>
<xsl:if test="$Browser = 'IE'">
  <tr><td valign="top"> - Benodige externe plug-in</td></tr>
  <tr><td><ul>
  <li>Voor een aantal grafische weergaves wordt gebruikt gemaakt van de
  <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Adobe SVG viewer</a>.
  <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Download</a> en
  installeer dan eerst de <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Adobe SVG Viewer 3.0.3</a> indien er niets grafisch te zien is.</li>
  </ul></td></tr>
</xsl:if>
</tbody>
</table>
</xsl:if>

<xsl:if test="$parTaal = 'engels'">
  This website shows many reports of this <xsl:value-of select="$Txt_stamboom"/>.
  At the top of each page you will find two lines: one consisting of reports based on a person and one consisting of global reports.
  By clicking one of the blocks either the corresponding report will be displayed, or you will see a second page where reports of this category may be chosen.
  <br /><br />
  Reports regarding a person are always related to the last selected person.
  At this moment this person is
  <xsl:for-each select="PERSOON[@link=$linkPersoon]/PERSONAL">
    <xsl:call-template name="ShowPersoon">
      <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
      <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
      <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
      <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
      <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
      <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>.
  So if you wish to see a report about a certain person, you will first of all have to select him or her.
  You may do so anywhere the person's name is shown in <a href="javascript:KiesXSL(5,{$HuidigPersoon},'','')">this color</a>, which in many places is the case.
  <br /><br />
  Almost all pages will be generated at the time you click the corresponding link. This means that it may take some time before the appropriate page pops up.
  This is in particular true in case of bulky reports (e.g. a descendants report of someone having many descendants).
  <br /><br />
  By clicking <xsl:value-of select="$Txt_Instellingen"/> you may adapt the reports to your own liking.
  Your <xsl:value-of select="$Txt_instellingen"/> will be saved in so-called cookies in order that you may re-use them in your next session.
  In case you wish to use this option, your computer must be set to allow cookies.
  <br /><br />
  <table class="tbl-tekst">
    <tbody>
      <tr><td valign="top"> The reports of each person contain:</td></tr>
      <tr>
        <td valign="top">
          <ul>
            <li>
              a <xsl:value-of select="$Txt_persoonskaart"/>, with data about the person (possibly with photos), the parents, <xsl:value-of select="$Txt_relaties"/> and <xsl:value-of select="$Txt_kinderen"/>;
            </li>
            <xsl:choose>
              <xsl:when test="$Browser = 'IE'">
                <li>
                  display of this persons <xsl:value-of select="$Txt_voorgeslacht"/> in textform and in several graphical forms: <xsl:value-of select="$Txt_vooroudercirkel"/>,
                  <xsl:value-of select="$Txt_sierstamboom"/>, <xsl:value-of select="$Txt_waaier"/>, <xsl:value-of select="$Txt_zandloper"/>, standard quarters and
                  some statistical data;
                </li>
                <li>
                  display of this persons <xsl:value-of select="$Txt_nageslacht"/> in textform and in several graphical shapes:
                  <xsl:value-of select="$Txt_kleinkinderen"/> and <xsl:value-of select="$Txt_achterkleinkinderen"/>, a rectangular graphical <xsl:value-of select="$Txt_nageslacht"/>
                  with or without photos or in the shape of a circle, and a <xsl:value-of select="$Txt_parenteel"/> report by male and female line or by both lines,
                  all with or without photos, and some statistical data;
                </li>
                <li>
                  <xsl:value-of select="$Txt_verwantschap"/> and graphical display of all <xsl:value-of select="$Txt_verwantschapslijnen"/> with an arbitrary other selectable person;
                </li>
              </xsl:when>
              <xsl:otherwise>
                <li>display of this persons <xsl:value-of select="$Txt_voorgeslacht"/> in standard quarters; other graphical surveys require Internet Explorer;</li>
                <li>display of this persons <xsl:value-of select="$Txt_nageslacht"/> in textform; other surveys require Internet Explorer;</li>
                <li>display of <xsl:value-of select="$Txt_verwantschap"/> and graphical display of all <xsl:value-of select="$Txt_verwantschapslijnen"/> requires Internet Explorer;</li>
              </xsl:otherwise>
            </xsl:choose>
          </ul>
        </td>
      </tr>
      <tr><td valign="top"> The global reports contain:</td></tr>
      <tr>
        <td valign="top">
          <ul>
            <li>
              Reports of:
              <ul>
                <li><xsl:value-of select="$Txt_Fotos"/>: A display of all photos, a photo gallery (at most one photo per person) and a continuous <xsl:value-of select="$Txt_diavoorstelling"/> which automatically displays all photos on the screen</li>
                <li><xsl:value-of select="$Txt_FotoMemory"/>: A version of the Memory game using the photos.</li>
                <li>
                  <xsl:value-of select="$Txt_Gebeurtenissen"/>:
                  <xsl:if test="$Browser = 'IE'">
                    <xsl:text>A display by date of all </xsl:text><xsl:value-of select="$Txt_gebeurtenissen"/><xsl:text> and a display of today's </xsl:text><xsl:value-of select="$Txt_gebeurtenissen"/><xsl:text> in any past year. </xsl:text>
                  </xsl:if>
                  <xsl:text>A display of persons where data recently has changed.</xsl:text>
                </li>
                <li>
                  <xsl:value-of select="$Txt_Kalenders"/><xsl:text>: A birthday calendar of living persons</xsl:text>
                  <xsl:if test="$Browser = 'IE'">
                    <xsl:text> and a </xsl:text><xsl:value-of select="$Txt_kalender"/><xsl:text> of all </xsl:text><xsl:value-of select="$Txt_gebeurtenissen"/>
                  </xsl:if>.
                </li>
                <li>
                  <xsl:text>Several displays: of all persons</xsl:text>
                  <xsl:if test="$Browser != 'OP'">
                    <xsl:text>, nicknames, surnames, places of birth, baptism, relation, decease, funeral and residences </xsl:text>
                  </xsl:if>
                  <xsl:text> and </xsl:text><xsl:value-of select="$Txt_relaties"/><xsl:text>. </xsl:text>
                  <xsl:if test="$Browser = 'IE'">
                    <xsl:text>Further a display of all </xsl:text><xsl:value-of select="$Txt_verwantschappen"/><xsl:text> between </xsl:text><xsl:value-of select="$Txt_personen"/><xsl:text> having a </xsl:text><xsl:value-of select="$Txt_relatie"/>.
                  </xsl:if>
                </li>
              </ul>
            </li>
            <li>
              Statistical data; the number of living and deceased men and women, and a report of those persons by category.
                <xsl:if test="$Browser = 'IE'">
                  <xsl:text>Also here you will find </xsl:text><xsl:value-of select="$Txt_leeftijdsoverzichten"/><xsl:text> in the shape of </xsl:text><xsl:value-of select="$Txt_histogrammen"/><xsl:text> and </xsl:text><xsl:value-of select="$Txt_tabellen"/>.
                </xsl:if>
            </li>
            <li>
              A search function, whereby <xsl:value-of select="$Txt_personen"/> may be found.
              Searching can be done <xsl:value-of select="$Txt_via2"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_de_v"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_eersteletter"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_vande_m"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_achternaam"/>
              or via the search fields
              <xsl:value-of select="$Txt_roepnaam"/>, <xsl:value-of select="$Txt_voornamen"/>, <xsl:value-of select="$Txt_tussenvoegsel"/>, <xsl:value-of select="$Txt_achternaam"/>, <xsl:value-of select="$Txt_geboortejaar"/> and <xsl:value-of select="$Txt_familie"/>.
              The last one searches for <xsl:value-of select="$Txt_achternamen"/> related to the search string name, as stored in the Aldfaer "sorting as" field;
            </li>
            <li><xsl:value-of select="$Txt_Vorige"/>: this brings you back to the previous page; note that you may not do this via the "Back" button of your Browser.</li>
          </ul>
        </td>
      </tr>
      <tr><td valign="top"> Special properties:</td></tr>
      <tr>
        <td>
          <ul>
            <li>Clicking a photo will display it in a separate window. You don't need to close this window: clicking another photo will display it in the same window.</li>
            <xsl:if test="$Browser = 'IE'">
              <li>The names in the graphical reports are clickable, linking you directly to the appropriate <xsl:value-of select="$Txt_persoonskaart"/>.</li>
              <li>The <xsl:value-of select="$Txt_leeftijd"/> of <xsl:value-of select="$Txt_levendepersonen"/> is their current <xsl:value-of select="$Txt_leeftijd"/>, the age of <xsl:value-of select="$Txt_overledenpersonen"/> is the <xsl:value-of select="$Txt_leeftijd"/> at the moment of <xsl:value-of select="$Txt_overlijden"/>.</li>
            </xsl:if>
            <xsl:if test="$Browser != 'IE'">
              <li>The <xsl:value-of select="$Txt_leeftijd"/> of <xsl:value-of select="$Txt_levendepersonen"/> is the <xsl:value-of select="$Txt_leeftijd"/> on the moment the database was generated (<xsl:value-of select="//FLEXITREE/@date"/>), the age of <xsl:value-of select="$Txt_overledenpersonen"/> is the <xsl:value-of select="$Txt_leeftijd"/> at the moment of <xsl:value-of select="$Txt_overlijden"/>..</li>
            </xsl:if>
          </ul>
        </td>
      </tr>
      <xsl:if test="$Browser = 'IE'">
        <tr><td valign="top"> Required plug-in</td></tr>
        <tr>
          <td>
            <ul>
              <li>
                A number of graphical reports require the
                <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Adobe SVG viewer</a>.
                <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Download</a> and
                install first <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Adobe SVG Viewer 3.0.3</a> if you don't see the output of graphical reports.
              </li>
            </ul>
          </td>
        </tr>
      </xsl:if>
    </tbody>
  </table>
</xsl:if>

<xsl:if test="$parTaal = 'frans'">
  Ce site vous propose différents résumés de cette généalogie. 
 En tête de chaque page se trouvent deux lignes de cases: l'une présentant les résumés d'une personne et l'autre, un résumé de l'ensemble. 
 En cliquant sur une des case, le rapport correspondant sera affiché ou une page apparaîtra, sur laquelle un résumé au choix peut être sélectionné.
  <br /><br />
  Les résumés d'une personne sont relatifs à la dernière personne sélectionnée. En ce moment il s'agit de 
  <xsl:for-each select="PERSOON[@link=$linkPersoon]/PERSONAL">
    <xsl:call-template name="ShowPersoon">
      <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
      <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
      <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
      <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
      <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
      <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>.
  Pour voir les résumés d'une personne au choix, il vous faudra d'abord la sélectionner sur ce site. 
  La sélection peut se faire sur chaque page par le lien du nom imprimé en <a href="javascript:KiesXSL(5,{$HuidigPersoon},'','')">cette couleur</a>. 
  Il y a plusieurs endroits du genre. 
  <br /><br />
  La plupart des pages ne sont générées qu'à partir du moment ou vous cliquez le lien correspondant. 
  Ceci entraine parfois un délai assez important avant l'apparition de la page.  Par exemple pour des résumés de descendances étendues. 
  <br /><br />
  En cliquant la case Préférences, il vous est possible d'adapter la représentation des résumés à votre guise. 
  Après avoir confirmé votre choix en cliquent sur le bouton "OK", vos préférences seront sauvegardées 
  et conservées pour la session suivante, à l'aide de cookies. A cette fin votre ordinateur doit être configuré pour accepter des cookies.
  <br /><br />
  <table class="tbl-tekst">
    <tbody>
      <tr><td valign="top">Les résumés de chaque personne comprennent:</td></tr>
      <tr>
        <td valign="top">
          <ul>
            <li>
              sa <xsl:value-of select="$Txt_persoonskaart"/> contenant les données de la personne (éventuellement avec des photos), ses parents, 
              <xsl:value-of select="$Txt_relaties"/> et <xsl:value-of select="$Txt_kinderen"/>;
            </li>
            <xsl:choose>
              <xsl:when test="$Browser = 'IE'">
                <li>
                  les <xsl:value-of select="$Txt_voorgeslacht"/> de cette personne en format texte ou graphique: <xsl:value-of select="$Txt_vooroudercirkel"/>,
                  <xsl:value-of select="$Txt_sierstamboom"/>, <xsl:value-of select="$Txt_waaier"/>, <xsl:value-of select="$Txt_zandloper"/>,
                  quartiers standards ou schémas ainsi que quelques données statistiques;
                </li>
                <li>
                  les <xsl:value-of select="$Txt_nageslacht"/> de cette personne en format texte et graphique:
                  comprenant les <xsl:value-of select="$Txt_kleinkinderen"/> et les <xsl:value-of select="$Txt_achterkleinkinderen"/>,
                  le graphique rectangulaire avec ou sans les photos, un circle des descendants, une circulaire avec l'ascendance de la lignée masculine ou féminine ou les deux, toujours accompagnés ou non de photos
                  et quelques données statistiques;
                </li>
                <li>
                  la <xsl:value-of select="$Txt_verwantschap"/> et la présentation graphique de toutes les <xsl:value-of select="$Txt_verwantschapslijnen"/> avec n'importe quelle autre personne choisie;
                </li>
              </xsl:when>
              <xsl:otherwise>
                <li>ces <xsl:value-of select="$Txt_voorgeslacht"/> par quartiers standards; autres présentations graphiques nécessitant Internet Explorer;</li>
                <li>sa descendance rédigée; autres présentations graphiques nécessitant Internet Explorer;</li>
                <li>la <xsl:value-of select="$Txt_verwantschap"/> et la présentation graphique de toutes les <xsl:value-of select="$Txt_verwantschapslijnen"/> nécessitant Internet Explorer</li>
              </xsl:otherwise>
            </xsl:choose>
          </ul>
        </td>
      </tr>
      <tr><td valign="top"> Les résumés de l'ensemble comprennent :</td></tr>
      <tr>
        <td valign="top">
          <ul>
            <li>
              Les présentations de:
              <ul>
                <li><xsl:value-of select="$Txt_Fotos"/>: toutes les photos présentées, une galerie photo (une seule photo par personne) et une <xsl:value-of select="$Txt_diavoorstelling"/> automatique</li>
                <li><xsl:value-of select="$Txt_FotoMemory"/>: un jeu de mémoires des photos.</li>
                <li>
                  <xsl:value-of select="$Txt_Gebeurtenissen"/>:
                  <xsl:if test="$Browser = 'IE'">
                    <xsl:text>Chronologie des </xsl:text><xsl:value-of select="$Txt_gebeurtenissen"/><xsl:text> passés et une présentation des </xsl:text><xsl:value-of select="$Txt_gebeurtenissen"/> d'aujourd'hui en n'importe quelle année passée.
                  </xsl:if>
                  <xsl:text>un résumé des personnes dont les données ont été mise à jour récemment.</xsl:text>
                </li>
                <li>
                  <xsl:value-of select="$Txt_Kalenders"/><xsl:text>: un calendrier d'anniversaires des personnes vivantes</xsl:text>
                  <xsl:if test="$Browser = 'IE'">
                    <xsl:text> et un </xsl:text><xsl:value-of select="$Txt_kalender"/><xsl:text> des </xsl:text><xsl:value-of select="$Txt_gebeurtenissen"/>
                  </xsl:if>.
                </li>
                <li>
                  <xsl:text>Divers résumés : de toutes les personnes</xsl:text>
                  <xsl:if test="$Browser != 'OP'">
                    <xsl:text> avec leur surnom et nom de famille, lieux de naissance, de baptême, de relation, de décès, d'inhumation, ainsi que </xsl:text>
                  </xsl:if>
                  <xsl:text> leurs </xsl:text><xsl:value-of select="$Txt_relaties"/> et domiciles.<xsl:text>. </xsl:text>
                  <xsl:if test="$Browser = 'IE'">
                    <xsl:text>Ainsi qu'une présentation de toutes les </xsl:text><xsl:value-of select="$Txt_verwantschappen"/><xsl:text> entre les </xsl:text><xsl:value-of select="$Txt_personen"/><xsl:text> qui ont une </xsl:text><xsl:value-of select="$Txt_relatie"/>.
                  </xsl:if>
                </li>
              </ul>
            </li>
            <li>
                Les données statistiques: par catégorie, le nombre d'hommes et de femmes étant encore en vie où décédé.
                <xsl:if test="$Browser = 'IE'">
                  <xsl:text>Il y a également des </xsl:text><xsl:value-of select="$Txt_leeftijdsoverzichten"/><xsl:text> sous forme d' </xsl:text><xsl:value-of select="$Txt_histogram"/><xsl:text> ou de </xsl:text><xsl:value-of select="$Txt_tabel"/>.
                </xsl:if>
            </li>
            <li>
              Un outil de recherche de personnes <xsl:value-of select="$Txt_via2"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_de_v"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_eersteletter"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_vande_m"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_achternaam"/>
              ou  ayant comme critères de recherche le petit nom, les <xsl:value-of select="$Txt_voornamen"/>, 
              <xsl:value-of select="$Txt_tussenvoegsel"/>, <xsl:value-of select="$Txt_achternaam"/>, <xsl:value-of select="$Txt_geboortejaar"/> et <xsl:value-of select="$Txt_familie"/>.
              Avec ce dernier, les recherches se concentrent sur les noms de famille ayant une filiation avec le nom saisis, équivalent à l'outil  "trier par" prévu dans Aldfaer;
            </li>
            <li><xsl:value-of select="$Txt_Vorige"/>: cliquer cette page, vous renvoyai à la page précédente. Notez cependant, que ce mouvement ne fonctionne pas via le bouton retour de votre navigateur.</li>
          </ul>
        </td>
      </tr>
      <tr><td valign="top"> Particularités:</td></tr>
      <tr>
        <td>
          <ul>
            <li>Cliquez sur une photo pour l'agrandir. Il n'est pas nécessaire de fermez cette fenêtre pour en visualiser une autre, il suffit de cliquer dessus.</li>
            <xsl:if test="$Browser = 'IE'">
              <li>On peut cliquer sur les noms des présentations graphiques pour afficher la <xsl:value-of select="$Txt_persoonskaart"/> en question.</li>
              <li>L'<xsl:value-of select="$Txt_leeftijd"/> des <xsl:value-of select="$Txt_levendepersonen"/> est l'<xsl:value-of select="$Txt_leeftijd"/> actuel, l'<xsl:value-of select="$Txt_leeftijd"/> des <xsl:value-of select="$Txt_overledenpersonen"/> est l'<xsl:value-of select="$Txt_leeftijd"/> à la date du <xsl:value-of select="$Txt_overlijden"/>.</li>
            </xsl:if>
            <xsl:if test="$Browser != 'IE'">
              <li>L'<xsl:value-of select="$Txt_leeftijd"/> des personnes en vie, est celui à la date d’affichage des données de cet arbre généalogique, (<xsl:value-of select="//FLEXITREE/@date"/>).
              Celui des personnes décédées, à la date du déces.</li>
            </xsl:if>
          </ul>
        </td>
      </tr>
      <xsl:if test="$Browser = 'IE'">
        <tr><td valign="top"> Utilitaire externe de plug-in </td></tr>
        <tr>
          <td>
            <ul>
              <li>
                Pour la présentation graphique il faut utiliser l'
                <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Adobe SVG viewer</a>.
                <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Téléchargez</a>
                et installez d'abord l'<a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Adobe SVG Viewer 3.0.3</a> si vous ne voyez pas les graphiques.
              </li>
            </ul>
          </td>
        </tr>
      </xsl:if>
    </tbody>
  </table>
</xsl:if>

<xsl:if test="$parTaal = 'duits'">
Diese Webseite zeigt Ihnen alle Angebote dieses Stammbaumes.
Am oberen Rand jeder Seite finden Sie zwei Zeilen: eine mit Daten zu einer Person
und eine mit allgemeinen Übersichten. Mit einem Klick auf einen der Blöcke wird entweder der entsprechende Bereich angezeigt, oder Sie sehen eine zweite Seite, wo Berichte
dieser Kategorie ausgewählt werden können. 
<br/><br/>
Die Daten eine Person beziehen sich immer auf die zuletzt gewählte Person.
Zu diesem Zeitpunkt ist diese Person
      <xsl:for-each select="PERSOON[@link=$linkPersoon]/PERSONAL">
        <xsl:call-template name="ShowPersoon">
          <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
          <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
          <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
          <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
          <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
          <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>.
	<br /><br />
Wenn Sie also einen Bericht über eine bestimmte Person haben wollen, sollten Sie zuerst diese Person auswählen.
Sie können das überall machen, wo der Name der Person in <a href="javascript:KiesXSL(5,{$HuidigPersoon},'','')">dieser Farbe</a> aufgeführt ist. Das ist an vielen Orten der Fall.
<br/><br/>
Fast alle Seiten werden mit einem Klick auf den entsprechenden Link fertig gemacht.
Es kann dann einige Zeit dauern, bis sich die entsprechende Seite öffnet.
Dies gilt besonders im Fall von großen Berichten (z.B. Berichten von jemandem mit vielen Nachkommen).
<br/><br/>
Durch Klicken auf den Block "<xsl:value-of select="$Txt_Instellingen"/>" können Sie die Bericht Ihren Vorstellungen anpassen.
Die <xsl:value-of select="$Txt_Instellingen"/> bleiben erhalten, so dass Sie in der nächsten Sitzung wieder zur Verfügung stehen.
Zu diesem Zweck werden diese <xsl:value-of select="$Txt_Instellingen"/> über Cookies gespeichert. Falls Sie diese Option benutzen wollen, muss der Computer so eingestellt werden, dass Cookies akzeptiert werden. 
<br/><br/>
<table class="tbl-tekst">
<tbody>
<tr><td valign="top"> - Die Berichte der einzelnen Person enthalten:</td></tr>
<tr><td valign="top"><ul>
<li>eine <xsl:value-of select="$Txt_persoonskaart"/>, mit Daten über die Person (möglichst mit Fotos), die Eltern, <xsl:value-of select="$Txt_relaties"/> und <xsl:value-of select="$Txt_kinderen"/>;</li>
<xsl:choose>
  <xsl:when test="$Browser = 'IE'">
    <li>Anzeige der <xsl:value-of select="$Txt_voorgeslacht"/> dieser Person in Textform und in verschiedene graphische Formen: wie <xsl:value-of select="$Txt_vooroudercirkel"/>,
        <xsl:value-of select="$Txt_sierstamboom"/>, <xsl:value-of select="$Txt_waaier"/>, <xsl:value-of select="$Txt_zandloper"/>, Standard-Viertel oder Schema
        sowie einige statistische Daten;</li>
    <li>Anzeige von <xsl:value-of select="$Txt_nageslacht"/> dieser Person in Textform und in verschiedene graphische Formen:
        Eine Übersicht von <xsl:value-of select="$Txt_kleinkinderen"/> und <xsl:value-of select="$Txt_achterkleinkinderen"/>, ein graphisch <xsl:value-of select="$Txt_nageslacht"/>
        in Rechteckform (möglichst mit Fotos) oder in Kreisform, und ein <xsl:value-of select="$Txt_parenteel"/> in <xsl:value-of select="$Txt_mannelijkelijn"/>
        oder in <xsl:value-of select="$Txt_vrouwelijkelijn"/> oder in beide Linien,
        alle mit oder ohne <xsl:value-of select="$Txt_fotos"/>, sowie einige statistische Daten;</li>
    <li><xsl:value-of select="$Txt_verwantschap"/> und graphische Anzeige aller <xsl:value-of select="$Txt_verwantschapslijnen"/> mit einer willkürlicher andere Person;</li>
  </xsl:when>
  <xsl:otherwise>
    <li>Anzeige der <xsl:value-of select="$Txt_voorgeslacht"/> im Standard-Viertel. Für weitere grafische Erhebungen ist Internet Explorer erforderlich;</li>
    <li>Anzeige von <xsl:value-of select="$Txt_nageslacht"/> dieser Person in Textform. Andere Erhebungen erfordern Internet Explorer;</li>
    <li>Anzeige der Verwandtschaft und grafische Darstellung aller <xsl:value-of select="$Txt_verwantschapslijnen"/> erfordert Internet Explorer;</li>
  </xsl:otherwise>
</xsl:choose>
</ul></td></tr>
<tr><td valign="top"> - Die allgemeinen Berichte enthalten:</td></tr>
<tr><td valign="top">
<ul>
<li>Berichte von:
<ul>
<li><xsl:value-of select="$Txt_Fotos"/>: Eine Übersicht aller Fotos, eine Fotogalerie (nur ein Foto pro Person) und eine <xsl:value-of select="$Txt_diavoorstelling"/> die automatisch alle Bilder auf dem Bildschirm zeigt.</li>
<li><xsl:value-of select="$Txt_FotoMemory"/>: Eine Version des Memory-Spiels mit den Fotos.</li>
<li> <xsl:value-of select="$Txt_Gebeurtenissen"/>:
<xsl:if test="$Browser = 'IE'">
  <xsl:text>Anzeige auf Datum aller </xsl:text><xsl:value-of select="$Txt_gebeurtenissen"/><xsl:text> und ein Anzeige von heutige </xsl:text><xsl:value-of select="$Txt_gebeurtenissen"/><xsl:text> in jedes Jahr in die Vergangenheit. </xsl:text>
</xsl:if>
  <xsl:text>Eine Liste von Personen, deren Daten sich kürzlich geändert haben.</xsl:text>
</li>
<li>
<xsl:value-of select="$Txt_Kalenders"/><xsl:text>: Geburtstagskalender von lebenden Personen</xsl:text>
<xsl:if test="$Browser = 'IE'">
  <xsl:text> und ein </xsl:text><xsl:value-of select="$Txt_kalender"/><xsl:text> aller </xsl:text><xsl:value-of select="$Txt_gebeurtenissen"/>
</xsl:if>.
</li>
<li><xsl:text>Verschiedene Angaben von allen Personen</xsl:text>
<xsl:if test="$Browser != 'OP'">
  <xsl:text>, Ruf- und Familiennamen, Geburts-, Taufes-, Todes-, Beziehungs-, Beerdigungs- und Wohnorte </xsl:text>
</xsl:if>
<xsl:text> und </xsl:text><xsl:value-of select="$Txt_relaties"/><xsl:text>. </xsl:text>
<xsl:if test="$Browser = 'IE'">
  <xsl:text>Weiterhin eine Anzeige aller </xsl:text><xsl:value-of select="$Txt_verwantschappen"/><xsl:text> zwischen </xsl:text><xsl:value-of select="$Txt_personen"/><xsl:text> die eine </xsl:text><xsl:value-of select="$Txt_relatie"/><xsl:text> haben.</xsl:text>
</xsl:if>
</li>
</ul></li>
<li>Statistische Daten, die Anzahl der lebenden und verstorbenen Männern und Frauen, und eine Übersicht der einzelnen Kategorien.
<xsl:if test="$Browser = 'IE'">
  <xsl:text>Auch in dieser Rubrik </xsl:text><xsl:value-of select="$Txt_leeftijdsoverzichten"/><xsl:text> wie </xsl:text><xsl:value-of select="$Txt_histogram"/><xsl:text> und wie </xsl:text><xsl:value-of select="$Txt_tabel"/>.
</xsl:if>
</li>
<li>Eine Suchfunktion, durch die <xsl:value-of select="$Txt_personen"/> gesucht werden
    <xsl:value-of select="$Txt_via2"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_de_v"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_eersteletter"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_vande_m"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_achternaam"/>
   oder via Suchfelder: 
   <xsl:value-of select="$Txt_roepnaam"/>, <xsl:value-of select="$Txt_voornamen"/>, <xsl:value-of select="$Txt_tussenvoegsel"/>, <xsl:value-of select="$Txt_achternaam"/>, <xsl:value-of select="$Txt_geboortejaar"/> und <xsl:value-of select="$Txt_familie"/>.
Die letzte Suche nach Namen im Zusammenhang mit der Such-String <xsl:value-of select="$Txt_achternamen"/>, wie im Aldfaer "Sortierung als" Bereich; </li>
<li><xsl:value-of select="$Txt_Vorige"/>: Das bringt Sie zurück zur vorherigen Seite. Beachten Sie, dass Sie das nicht über den "Zurück" Button Ihres Browsers können.</li>
</ul></td></tr>
<tr><td valign="top"> - Besondere Eigenschaften:</td></tr>
<tr><td><ul>
<li>Ein Klick auf ein Foto zeigt es in einem separaten Fenster. Es ist nicht nötig das Fenster zu schließen.
Wenn Sie auf ein anderes Foto klicken erscheint dies dann im selben Fenster.</li>
<xsl:if test="$Browser = 'IE'">
  <li>Man kann klicken auf die Namen in graphische Anzeigen, damit direkt die <xsl:value-of select="$Txt_persoonskaart"/> dieser Person gezeigt werd.</li>
  <li>Das <xsl:value-of select="$Txt_leeftijd"/> der <xsl:value-of select="$Txt_levendepersonen"/> ist das <xsl:value-of select="$Txt_leeftijd"/> in diesem Moment, das Alter der verstorbenen Personen ist das Alter zum Zeitpunkt des Todes.</li>
</xsl:if>
<xsl:if test="$Browser != 'IE'">
  <li>Das <xsl:value-of select="$Txt_leeftijd"/> der <xsl:value-of select="$Txt_levendepersonen"/> ist das <xsl:value-of select="$Txt_leeftijd"/> zum Zeitpunkt als die Datenbank erzeugt wurde
 (<xsl:value-of select="//FLEXITREE/@date"/>), das Alter der verstorbenen Personen ist das Alter zum Zeitpunkt des Todes.</li>
</xsl:if>
</ul></td></tr>
<xsl:if test="$Browser = 'IE'">
  <tr><td valign="top"> - Benötigte externe plug-in</td></tr>
  <tr><td><ul>
  <li>Einige graphische Anziegen fordern die
  <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Adobe SVG viewer</a>.
  <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Download</a> und
  installiere erstmal <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Adobe SVG Viewer 3.0.3</a> wenn Sie nichts Graphisches sehen.</li>
  </ul></td></tr>
</xsl:if>
</tbody>
</table>
</xsl:if>

<xsl:if test="$parTaal = 'fries'">
Op dizze webside binne allehanne oersichten te fine fan dizze stambeam. Boppe-oan elke side stean twa rigels: oersichten fan in persoan 
en ien mei algemiene oersichten. Troch hjir op te klikken ferskint it oangeande ferslach, of ferskint in in ferfolchside wer ferslachen fan dizze kategory kin wurde kozen.
<br/><br/>
De oersichten fan in persoan hawwe hieltyd betrekking op de lêst selektearde peroan.
Op dit momint  is dat
      <xsl:for-each select="PERSOON[@link=$linkPersoon]/PERSONAL">
        <xsl:call-template name="ShowPersoon">
          <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
          <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
          <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
          <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
          <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
          <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>.
	<br /><br />
Wolle jo dus in ferslach sjen fan in bepaalde persoan, dan moat jo dizze earst earne selektearje.
Dit selektearje kin oeral barre wêr de namme yn <a href="javascript:KiesXSL(5,{$HuidigPersoon},'','')">dizze kleur</a> stiet. Dit is op in hiel  protte plakken.
<br/><br/>
Omtrint alle pagina's wurde pas oanmakke op it momint dat jo earne op klikt.  
 Dit betsjut dat it efkes kin duorren foar de oangeande side op it byldskerm ferskynt.  
 Dit jildt mei namme by grutte oersichten (b.v. in nageslacht-overzicht fan immen mei in soad nakomelingen).
<br/><br/>
Troch te klikken op de knop Ynstellingen kiine jo de ferslachen nei eigen smaak oanpasse. De ynstellingen bliuwe bewarre dat se yn in folgjende sessy wer besikber binne.
Hjirta wurde dizze ynstellingen ynslein fia saneamde cookies. Wolle jo fan dizze mooglikheid brûke, dan moat jo kompjûter sa ynsteld wêze dat cookies aksepteard wurde.
<br/><br/>
<table class="tbl-tekst">
<tbody>
<tr><td valign="top"> - De ferslachen fan elke persoan omfetsje:</td></tr>
<tr><td valign="top"><ul>
<li>in persoanskaart, mei gegevens oer de persoan (mooglijk mei foto\'s), de aldelju, relaasjes en bern;;</li>
<xsl:choose>
  <xsl:when test="$Browser = 'IE'">
    <li>wejefte fan it foarteam fan dizze persoan yn tekst- en yn ferskate grafiske foarmje: as Foarâldensirkels, sierstambeam, waaier, sânglês, standertkertieren of skema asmede enkele statistyke gegevens</li>
    <li>wejefte fan it neiteam fan dizze peroan yn tekst- en yn ferskate grafiske foarmje:
        in oersicht fan bernsbern en achterbernsbern,in grafisk neiteam yn rjochthoekfoarm of yn sirkelfoarm, en in parenteel yn manlike of froulike streek of yn beide streken, asmede enkele statistyke gegevens</li>
    <li>besibbensgraad en grafiske wejefte fan alle besibbensgraadstreken mei in willekeurisch oar te kiezen persoan;</li>
  </xsl:when>
  <xsl:otherwise>
    <li>werjefte fan it voorgeslacht fan dizze persoan yn standaardkwartieren; foar oare grafyske oersichten is Internet Explorer nedich;</li>
    <li>werjefte fan it nageslacht fan dizze persoan yn tekstvorm; foar mear oersichten is Internet Explorer nedich;</li>
    <li>foar de verwantschapsberekening en grafyske werjefte fan alle verwantschapslijnen is Internet Explorer nedich;</li>
  </xsl:otherwise>
</xsl:choose>
</ul></td></tr>
<tr><td valign="top"> - De ferslachen fan it totale bestân omfetsje:</td></tr>
<tr><td valign="top">
<ul>
<li>Oersichten fan:
<ul>
<li>Foto's: In oersicht fan alle foto's, in fotogaley (maksimaal ien foto fan in persoan) en in trochrinnende diafoarstelling wêrby alle foto's achterinoar automatisk op it skerm toant wurde</li>
<li>FotoMemory: In ferzje fan it Memoryspul oan de hân fan de foto's.</li>
<li>Foarfallen:
<xsl:if test="$Browser = 'IE'">
  In oersicht op datum fan alle foarfallen en in oersicht fan de foarfallen fan hjoed yn iennichst year yn it ferline.
</xsl:if>
  <xsl:text>In oersicht fan persoanen fan wa lêsten gegevens wizige binne. </xsl:text>
</li>
<li>
Kalinders: In jierdaikalinder fan noch libbende persoanen
<xsl:if test="$Browser = 'IE'">
  en in kalinder fan alle foarfallen
</xsl:if>.
</li>
<li><xsl:text>Ferskate oersichten: oersichten fan alle peroanen</xsl:text>
<xsl:if test="$Browser != 'OP'">
  , rop- en famyljenammen, berte-, doop-, relaasje-, ferstoarn-. Begraffenis- en wenplakken
</xsl:if>
en relaasjes.
<xsl:if test="$Browser = 'IE'">
  Fjider in oersicht fan alle besibbensgraden tusken persoanen die in relaasje hawwe.
</xsl:if>
</li>
</ul></li>
<li>Statistyke gegevens; it oantal libbende en ferstoarne manlju en froulju, en in oersicht fan elke kategory.
<xsl:if test="$Browser = 'IE'">
  Ek bevettet dizze rubryk âldens-oersicht as hisogram as tabel.
</xsl:if>
</li>
 en op berte-, ferstjerre- en relaasjeplakke.
<li>In Sykjefunksje, mei help wêrfan persoanen zocht kinne wurde. Der kin zocht wurde fia de earste letter fan de skaainamme of ropnamme, foarnammen, skaainamme, bertejier en <xsl:value-of select="$Txt_familie"/>.
By dit lêste wurdt socht op oan de opjûn namme verwante famyljenammen, lykas fêstleien yn Aldfaer by "sorteren as"; </li>
<li><xsl:value-of select="$Txt_Vorige"/>: troch hjir op te klikke komt de foarige side yn byld; tink derom dat dit net kin fia de "foarige" knop fan de browser.</li>
</ul></td></tr>
<tr><td valign="top"> - Bysûndere eigenskippen:</td></tr>
<tr><td><ul>
<li>De foto's kinne fergrut wurde troch derop te klikken. It fotofinster hoegt net slûtte te wurde.  Wannear op in oare foto klikt wurd, dan wurd dizze yn it finster iepene.</li>
<xsl:if test="$Browser = 'IE'">
  <li>Op de nammen yn de grafiske oersichten kin klikt wurde, sadat direkt de persoanskaart fan die persoan toand wurd.</li>
  <li>De âldens fan libbende persoanen is de âldans op dit momint, de âldens fan ferstoarne persoanen is de âldens op it momint van fersterre.</li>
</xsl:if>
<xsl:if test="$Browser != 'IE'">
  <li>De <xsl:value-of select="$Txt_leeftijd"/> fan <xsl:value-of select="$Txt_levendepersonen"/> is de <xsl:value-of select="$Txt_leeftijd"/> op it momint dat it stamboombestand generearre is (<xsl:value-of select="//FLEXITREE/@date"/>), de âldens fan ferstoarne persoanen is de âldens op it momint van fersterre.</li>
</xsl:if>
</ul></td></tr>
<xsl:if test="$Browser = 'IE'">
  <tr><td valign="top"> - Nediche eksterne plug-in</td></tr>
  <tr><td><ul>
  <li>Foar in oantal grafiske werjeftes wurd brûk kakke fan de
  <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Adobe SVG viewer</a>.
  <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Download</a> en
  ynstallear dan earst de <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Adobe SVG Viewer 3.0.3</a> as der niks te sjen is.</li>
  </ul></td></tr>
</xsl:if>
</tbody>
</table>
</xsl:if>

<xsl:if test="$parTaal = 'noors'">
På denne webside finnes allslags oversikter av dette slektstre.
Øverst på hver side finnes to linjer; en med oversikten til en person, og en med generelle oversikter.
Ved å klikke på en av rammene åpnes den gjeldende rapport, eller det kommer opp en ny side hvor en kan velge rapporter som hører inn under denne kategorien.
<br/><br/>
En persons oversikt relateres bestandig på den sist valgte person.
Akkurat nå er dette
      <xsl:for-each select="PERSOON[@link=$linkPersoon]/PERSONAL">
        <xsl:call-template name="ShowPersoon">
          <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
          <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
          <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
          <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
          <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
          <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>.
	<br /><br />
Hvis man ønsker å se en bestemt persons rapport, må dette først velges noe sted.
Dette tvalg kan foretas på alle steder hvor dette navn er <a href="javascript:KiesXSL(5,{$HuidigPersoon},'','')">farget slik</a>. Det er på mange steder.
<br/><br/>
Nesten alle sidene er kun opprettet når du klikker på noe.
Dette betyr at det kan ta tid for siden vises på skjermen.
Dette gjelder spesielt for store oversikter (f.eks avkom disposisjon av noen med mye avkom).
<br/><br/>
Ved å klikke på "Instillinger" kan man forme rapportene etter eget behov. Instillingen blir lagret slik at de kan brukes ved en etterfølgende gjennomgang.
Derfor blir disse instillingene lagret i såkalte cookies. Hvis man ønsker å bruke denne muligheten, må komputeren deres være innstilt slik at cookies blir akseptert.
<br/><br/>
<table class="tbl-tekst">
<tbody>
<tr><td valign="top"> - Rapportene til hver person inneholder:</td></tr>
<tr><td valign="top"><ul>
<li>et personskort, med informasjon om personen (eventuell med bilder), foreldre, relasjoner og barn;</li>
<xsl:choose>
  <xsl:when test="$Browser = 'IE'">
    <li>Gjengjvelsen av personens forfedrer i tekst og i forskjellige grafiske former: sånn  som forfedre sirkel, prydslektstre, vifte, timeglass, standard anerapport eller skjema, samt noen enkle statistiske innformasjoner</li>
    <li>gjengivelse av personens etterkommere i tekst og i forskjellige grafiske former::
        en oversikt av barnebarn og oldebarn, en grafisk rektangulart eller sirkelært etterkommer rapport, og en etterkommer rapport i mannlig eller kvinnelig linje eller begge linjer, samt enkle statistiske informasjoner</li>
    <li>slektskap og grafisk gjengivelse av alle slektskapslinjer med en villekårlig valgt person;</li>
  </xsl:when>
  <xsl:otherwise>
    <li>representasjon av forfedrene til denne personen i standard kvartalene; andre grafiske oversikter Internet Explorer er nødvendig;</li>
    <li>representasjon av avkom av denne personen i tekstform; For oversikter Internet Explorer kreves;</li>
    <li>for slektskap beregning og grafisk visning av alle slektskapslinjer Internet Explorer kreves;</li>
  </xsl:otherwise>
</xsl:choose>
</ul></td></tr>
<tr><td valign="top"> - Rapporten av hele filen omfatter:</td></tr>
<tr><td valign="top">
<ul>
<li>Oversikter av:
<ul>
<li>Bilder: En oversikt av alle bilder, foto galleri ( maks et bilde pr person), en uavbrutt dia-framvisning hvor samtlige bilder automatisk blir vist på skjermen etter hverandre</li>
<li>Fotomemory: En versjon av Memorileken ved bruk av bildene.</li>
<li> Hendelser:
<xsl:if test="$Browser = 'IE'">
  En oversikt på dato av samtlige hendelser fra i dag til et valgt år tilbake.
</xsl:if>
  En oversikt over personer hvor det nylig ble endret info.
</li>
<li>
Kalender: En bursdagskalender av personer i live og
<xsl:if test="$Browser = 'IE'">
   en kalender av alle hendelser
</xsl:if>.
</li>
<li>Flere oversikter: oversikt over samtlige personer
<xsl:if test="$Browser != 'OP'">
  , kallenavn og etternavn, fødsel-, dop-, relasjon-, død-, begravelse-, bosteder
</xsl:if>
og relasjoner.
<xsl:if test="$Browser = 'IE'">
  Videre en oversikt over alle slektskap mellom personer som har en relasjon.
</xsl:if>
</li>
</ul></li>
<li>Statistiske opplysninger; antall menn og kvinner i live og døde, en oversikt av hver kategori.
<xsl:if test="$Browser = 'IE'">
  Denne rubrikken inneholder også oversikter over alder som histogram og som tabell.
</xsl:if>
</li>
<li>En søkefunksjon, hvormed en kan søke på personer. Man kan søke via den første bokstaven av etternavn, 
   <xsl:value-of select="$Txt_roepnaam"/>, <xsl:value-of select="$Txt_voornamen"/>, <xsl:value-of select="$Txt_tussenvoegsel"/>, <xsl:value-of select="$Txt_achternaam"/>, <xsl:value-of select="$Txt_geboortejaar"/> og <xsl:value-of select="$Txt_familie"/>.
Sistnevnte er ønsket på de oppgitte navnerelaterte etternavn, som fastsatt i Aldfaer til "sort som"; </li>
<li><xsl:value-of select="$Txt_Vorige"/>: ved å klikke her kommer den forrige side image; oppmerksom på at dette ikke er mulig gjennom "tilbake" -knappen i nettleseren.</li>
</ul></td></tr>
<tr><td valign="top"> - Spesielle egenskap:</td></tr>
<tr><td><ul>
<li>Bildene kan forstørres ved å klikke på dem. Det er ikke nødvendig å avslutte bildevinduet, når man klikker på et annet bilde blir dette åpnet i samme vinduet.</li>
<xsl:if test="$Browser = 'IE'">
  <li>I de grafiske oversikter kan man klikke på navn, slik at personens personskort blir vist.</li>
  <li>Alderen av personer i live er alderen akkurat nå. Alderen av døde personer er alderen på tiden av død.</li>
</xsl:if>
<xsl:if test="$Browser != 'IE'">
  <li>Alder av levende personer er alderen på den tiden at filen ble generert stamtavle (<xsl:value-of select="//FLEXITREE/@date"/>), alderen av døde personer er alderen på tiden av død.</li>
</xsl:if>
</ul></td></tr>
<xsl:if test="$Browser = 'IE'">
  <tr><td valign="top"> - Nødvendig ekstern plug-in</td></tr>
  <tr><td><ul>
  <li>For en del grafiske gjengivelser brukes
  <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Adobe SVG viewer</a>.
  <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Last ned</a> eogn
  installer <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Adobe SVG Viewer 3.0.3</a> hvis grafiken ikke blir vist.</li>
  </ul></td></tr>
</xsl:if>
</tbody>
</table>
</xsl:if>

<xsl:if test="$parTaal = 'spaans'">
En esta página web se puede encontrar algunas críticas de este pedigrí. En la parte superior de cada página hay dos reglas: una con declaraciones de una persona
y otra con declaraciones generales. Al hacer clic aquí se mostrará en el informe o una página desplegable que los resúmenes de esta categoría pueden ser elegidos.
<br/><br/>
Las declaraciones de una persona siempre se refieren a la última persona seleccionada.
En la actualidad, que 
      <xsl:for-each select="PERSOON[@link=$linkPersoon]/PERSONAL">
        <xsl:call-template name="ShowPersoon">
          <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
          <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
          <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
          <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
          <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
          <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>.
	<br /><br />
Así que si usted quiere ver un informe de una persona en particular, primero debe seleccionarlo en alguna parte.
Esta selección puede ocurrir en cualquier lugar donde el nombre es en <a href="javascript:KiesXSL(5,{$HuidigPersoon},'','')">este color</a>. Esto es, en muchos lugares.
<br/><br/>
Casi todas las páginas sólo se crean cuando se hace clic en algo.
Esto significa que puede tomar tiempo para que aparezca la página en la pantalla.
Esto es especialmente cierto para grandes visiones generales (por ejemplo, contorno descendencia de alguien con una gran cantidad de descendencia).
<br/><br/>
Al hacer clic, se pueden personalizar los resúmenes para degustar en el botón Configuración. Los ajustes se guardan de manera que estén disponibles de nuevo en la próxima sesión.
Para este propósito, estos ajustes se almacenan mediante cookies. Quieres hacer uso de esta opción, el ordenador debe estar configurado para aceptar cookies.
<br/><br/>
<table class="tbl-tekst">
<tbody>
<tr><td valign="top"> - Los resúmenes de cada persona son:</td></tr>
<tr><td valign="top"><ul>
<li>un mapa individual, con datos de la persona (con fotos), sus padres, las relaciones y los niños;</li>
<xsl:choose>
  <xsl:when test="$Browser = 'IE'">
    <li>representación de la ascendencia de esta persona en el texto y los gráficos en diversas formas: como círculo antepasado, árbol ornamental, fan, reloj de arena, cuartos estándar o el horario y algunas estadísticas;</li>
    <li>representación de los descendientes de este individuo en el texto y en diversas formas gráficas: una visión general de los nietos y bisnietos, una posteridad gráfico en forma de rectángulo o en forma circular, y un descendiente en el varón o la línea femenina o en ambas líneas, así como algunas estadísticas;</li>
    <li>parentesco y visualización gráfica de todas las líneas de parentesco para elegir cualquier otra persona;</li>
  </xsl:when>
  <xsl:otherwise>
    <li>representación de la ascendencia de esta persona en cuartos estándar; Se requiere otro gráfico resúmenes Internet Explorer;</li>
    <li>weergave van het <xsl:value-of select="$Txt_nageslacht"/> van deze persoon in tekstvorm; voor meer overzichten is Internet Explorer nodig;</li>
    <li>representación de la descendencia de esta persona en forma de texto; Para una visión general se requiere Internet Explorer;</li>
  </xsl:otherwise>
</xsl:choose>
</ul></td></tr>
<tr><td valign="top"> - Los resúmenes incluyen el total del archivo:</td></tr>
<tr><td valign="top">
<ul>
<li>Esquemas:
<ul>
<li>Foto: Una visión general de todas las fotos, una galería de fotos (máximo una foto por persona) y una presentación de diapositivas continua con todas las imágenes se visualizan secuencialmente de forma automática en la pantalla.</li>
<li>Memoria Foto: Una versión del juego de memoria basado en las imágenes.</li>
<li> Eventos:
<xsl:if test="$Browser = 'IE'">
  Una visión general de todos los eventos por fecha y un resumen de los acontecimientos del día en un año en el pasado.
</xsl:if>
  Una lista de las personas cuyos datos se ha cambiado recientemente.
</li>
<li>
Calendarios: Un calendario de cumpleaños de las personas que viven 
<xsl:if test="$Browser = 'IE'">
  y un calendario de todos los eventos
</xsl:if>.
</li>
<li>En varios resúmenes: una visión general de todas las personas
<xsl:if test="$Browser != 'OP'">
  , gritar y apellidos, nacimiento, bautismo, relación, muerte, sepultura y residencias 
</xsl:if>
y relaciones.
<xsl:if test="$Browser = 'IE'">
  Además, todas las relaciones entre las personas que tienen una relación.
</xsl:if>
</li>
</ul></li>
<li>Datos estadísticos; el número de la vida y los hombres fallecidos y las mujeres, y una visión general de cada categoría.
<xsl:if test="$Browser = 'IE'">
  Además, esta sección contiene declaraciones de edad como un histograma y una mesa.
</xsl:if>
</li>
<li>Una función de búsqueda, a través del cual las personas pueden ser buscados. Usted puede buscar utilizando la primera letra del apellido o
   <xsl:value-of select="$Txt_roepnaam"/>, <xsl:value-of select="$Txt_voornamen"/>, <xsl:value-of select="$Txt_tussenvoegsel"/>, <xsl:value-of select="$Txt_achternaam"/>, <xsl:value-of select="$Txt_geboortejaar"/> e <xsl:value-of select="$Txt_familie"/>.
Este último es buscado por el nombre relacionado apellidos especificados, según lo establecido en Aldfaer a "una especie de"; </li>
<li><xsl:value-of select="$Txt_Vorige"/>: haciendo clic aquí viene la imagen de la página anterior; tenga en cuenta que esto no es posible a través del botón "atrás" del navegador.</li>
</ul></td></tr>
<tr><td valign="top"> - Características especiales:</td></tr>
<tr><td><ul>
<li>Las imágenes se pueden ampliar haciendo clic sobre ellos. La ventana de imagen no necesita ser cerrado. Al hacer clic en otra imagen, luego se abre en la misma ventana.</li>
<xsl:if test="$Browser = 'IE'">
  <li>Los nombres de los resúmenes gráficos se puede hacer clic para que la persona se correlaciona directamente a esa persona se muestra.</li>
  <li>La edad de las personas que viven es la edad en este momento, la edad de las personas fallecidas, la edad en el momento de la muerte.</li>
</xsl:if>
<xsl:if test="$Browser != 'IE'">
  <li>La edad de las personas que viven es la edad en el momento en que el archivo se generó pedigrí (<xsl:value-of select="//FLEXITREE/@date"/>), la edad de las personas fallecidas, la edad en el momento de la muerte.</li>
</xsl:if>
</ul></td></tr>
<xsl:if test="$Browser = 'IE'">
  <tr><td valign="top"> - Se requiere el plug-in externo</td></tr>
  <tr><td><ul>
  <li>Para un número de gráficos, se utiliza el visor
  <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Adobe SVG viewer</a>.
  <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Descargue</a> e
  instale el <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Adobe SVG Viewer 3.0.3</a> si no hay nada que ver gráfico.</li>
  </ul></td></tr>
</xsl:if>
</tbody>
</table>
</xsl:if>

<xsl:if test="$parTaal = 'italiaans'">
Su questo sito potete trovare alcune recensioni di questo pedigree. Nella parte superiore di ogni pagina ci sono due regole: una con le dichiarazioni di una person
e una con dichiarazioni generali. Cliccando qui mostrerà il rapporto, o un drop-page che i sommari di questa categoria possono essere scelti.
<br/><br/>
Le dichiarazioni di una persona si riferiscono sempre all'ultima persona selezionata.
Allo stato attuale, che 
      <xsl:for-each select="PERSOON[@link=$linkPersoon]/PERSONAL">
        <xsl:call-template name="ShowPersoon">
          <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
          <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
          <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
          <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
          <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
          <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>.
	<br /><br />
Quindi, se volete vedere un report di una persona in particolare, è necessario selezionare prima da qualche parte.
Questa selezione può accadere ovunque il nome è in <a href="javascript:KiesXSL(5,{$HuidigPersoon},'','')">questo colore</a>. Questo è in molti luoghi.
<br/><br/>
Quasi tutte le pagine vengono creati solo quando si fa clic su qualcosa.
Ciò significa che si può prendere tempo per la pagina viene visualizzata sullo schermo.
Ciò è particolarmente vero per le grandi rassegne (ad esempio prole contorno di qualcuno con un sacco di figli).
<br/><br/>
Facendo clic, è possibile personalizzare i report per gustare il pulsante Impostazioni. Le impostazioni vengono salvate in modo che siano ancora disponibili nella sessione successiva.
A tal fine, le impostazioni vengono memorizzate tramite cookie. Vuoi fare uso di questa opzione, il computer deve essere impostato per accettare i cookie.
<br/><br/>
<table class="tbl-tekst">
<tbody>
<tr><td valign="top"> - I sommari di ogni persona includono:</td></tr>
<tr><td valign="top"><ul>
<li>una mappa individuale, con i dettagli della persona (con foto), i suoi genitori, le relazioni e figli;;</li>
<xsl:choose>
  <xsl:when test="$Browser = 'IE'">
    <li>rappresentazione del antenati di questa persona in testo e grafica in varie forme: come antenato cerchio, albero ornamentale, ventilatore, a clessidra, quarti standard o programma e alcune statistiche;</li>
    <li>rappresentazione dei discendenti di questo individuo in testo e in varie forme grafiche: una panoramica di nipoti e pronipoti, una posterità grafico in forma di rettangolo o in forma circolare, e un discendente nel maschio o linea femminile o in entrambe le linee, così come alcune statistiche;</li>
    <li>parentela e visualizzazione grafica di tutte le linee di parentela di scegliere qualsiasi altra persona;</li>
  </xsl:when>
  <xsl:otherwise>
    <li>rappresentazione del antenati di questa persona nei quartieri standard; è necessaria altra grafica panoramiche Internet Explorer;</li>
    <li>rappresentazione della prole di questa persona in forma scritta; Per una panoramica è necessario Internet Explorer;</li>
    <li>per il calcolo parentela e visualizzazione grafica di tutte le linee di parentela è necessario Internet Explorer;</li>
  </xsl:otherwise>
</xsl:choose>
</ul></td></tr>
<tr><td valign="top"> - I sommari delle intero file contiene:</td></tr>
<tr><td valign="top">
<ul>
<li>Sommari di:
<ul>
<li>Foto: una panoramica di tutte le foto, una galleria di foto (massimo una foto per persona) e una presentazione continuo con tutte le immagini vengono visualizzate in sequenza automaticamente sullo schermo.</li>
<li>Photo Memory: una versione del gioco di memoria basata sulle immagini.</li>
<li> Eventi:
<xsl:if test="$Browser = 'IE'">
  una panoramica di tutti gli eventi per data e una sintesi degli eventi del giorno in un anno nel passato.
</xsl:if>
  Un elenco di persone i cui dati sono stati modificati di recente.
</li>
<li>
Calendari: Un calendario compleanno di persone che vivono
<xsl:if test="$Browser = 'IE'">
  e un calendario di tutti gli eventi,
</xsl:if>.
</li>
<li><xsl:text>Diversi sommari: una panoramica di tutte le persone</xsl:text>
<xsl:if test="$Browser != 'OP'">
  , urlare e cognomi, nascita, battesimo, relazione, morte, sepoltura e residenze
</xsl:if>
 e le relazioni.
<xsl:if test="$Browser = 'IE'">
 Inoltre, tutti i sommari tra le persone che hanno una relazione.
</xsl:if>
</li>
</ul></li>
<li>Dati statistici; il numero di vivere e di uomini deceduti e le donne, e una panoramica di ogni categoria.
<xsl:if test="$Browser = 'IE'">
  Inoltre, questa sezione contiene dichiarazioni età come un istogramma e tavolo.
</xsl:if>
</li>
<li>Una funzione di ricerca, attraverso cui le persone possono essere cercati. È possibile cercare utilizzando la prima lettera del cognome o
   <xsl:value-of select="$Txt_roepnaam"/>, <xsl:value-of select="$Txt_voornamen"/>, <xsl:value-of select="$Txt_tussenvoegsel"/>, <xsl:value-of select="$Txt_achternaam"/>, <xsl:value-of select="$Txt_geboortejaar"/> e <xsl:value-of select="$Txt_familie"/>.
Quest'ultimo è ricercato sul nome correlati cognomi indicati, come previsto Aldfaer a "sorta come"; </li>
<li><xsl:value-of select="$Txt_Vorige"/>: cliccando qui arriva l'immagine della pagina precedente; notare che questo non è possibile attraverso il pulsante "indietro" del browser.</li>
</ul></td></tr>
<tr><td valign="top"> - Caratteristiche speciali:</td></tr>
<tr><td><ul>
<li>Le immagini possono essere ingrandite cliccandoci sopra. La finestra di immagine non deve essere chiuso. Quando si fa clic su un\'altra immagine, poi si apre nella stessa finestra.</li>
<xsl:if test="$Browser = 'IE'">
  <li>I nomi dei report grafici possono essere cliccati in modo che la persona mappa direttamente quella persona viene visualizzato.</li>
  <li>L'età delle persone che vivono è l'età in questo momento, l'età delle persone decedute, l'età al momento della morte.</li>
</xsl:if>
<xsl:if test="$Browser != 'IE'">
  <li>L'età delle persone che vivono l'età al momento che il file è stato generato pedigree (<xsl:value-of select="//FLEXITREE/@date"/>), l'età delle persone decedute, l'età al momento della morte.</li>
</xsl:if>
</ul></td></tr>
<xsl:if test="$Browser = 'IE'">
  <tr><td valign="top"> - Plug-in esterni necessari</td></tr>
  <tr><td><ul>
  <li>Per un numero di immagini, utilizza il visualizzatore
  <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Adobe SVG viewer</a>.
  <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Scaricare</a> e
  installare <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Adobe SVG Viewer 3.0.3</a> se non c'è niente da vedere grafico.</li>
  </ul></td></tr>
</xsl:if>
</tbody>
</table>
</xsl:if>

<xsl:if test="$parTaal = 'portugees'">
Neste site você pode encontrar alguns comentários do pedigree. No topo de cada página há duas regras: uma com declarações de uma pessoa e um com declarações gerais.
Clicando aqui vai mostrar o relatório ou uma página queda que os resumoes desta categoria podem ser escolhidos.
<br/><br/>
As declarações de uma pessoa sempre se relacionam com a última pessoa selecionada.
No presente, que 
      <xsl:for-each select="PERSOON[@link=$linkPersoon]/PERSONAL">
        <xsl:call-template name="ShowPersoon">
          <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
          <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
          <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
          <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
          <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
          <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>.
	<br /><br />
Então, se você quiser ver um relatório de uma pessoa em particular, você deve primeiro selecioná-lo em algum lugar.
Esta seleção pode acontecer em qualquer lugar onde o nome é <a href="javascript:KiesXSL(5,{$HuidigPersoon},'','')">nesta cor</a>. Isto é em muitos lugares.
<br/><br/>
Quase todas as páginas são criadas apenas quando você clica em alguma coisa.
Isso significa que ele pode levar algum tempo para a página aparece na tela.
Isto é especialmente verdadeiro para as grandes visões gerais (por exemplo esboço descendência de alguém com um monte de filhos).
<br/><br/>
Ao clicar, você pode personalizar os resumoes para provar o botão Configurações. As configurações são salvas de modo que eles estão disponíveis novamente na próxima sessão.
Para o efeito, essas configurações são armazenadas via cookies. Você quer fazer uso desta opção, em seguida, o computador deve estar configurado para aceitar cookies.
<br/><br/>
<table class="tbl-tekst">
<tbody>
<tr><td valign="top"> - Resumoes de cada pessoa incluem:</td></tr>
<tr><td valign="top"><ul>
<li>um mapa individual, com detalhes da pessoa (com fotos), seus pais, relacionamentos e filhos;</li>
<xsl:choose>
  <xsl:when test="$Browser = 'IE'">
    <li>representação da ascendência dessa pessoa em texto e gráficos em várias formas: como círculo ancestral, árvore ornamental, ventilador, ampulheta, quartos standard ou cronograma e algumas estatísticas;</li>
    <li>representação dos descendentes desse indivíduo em texto e em várias formas gráficas: uma visão geral dos netos e bisnetos, uma posteridade gráfico em forma de retângulo ou em forma circular, e um descendente na linha masculina ou feminina ou em ambas as linhas, bem como algumas estatísticas;</li>
    <li>parentesco e exibição gráfica de todas as linhas de parentesco para escolher qualquer outra pessoa;</li>
  </xsl:when>
  <xsl:otherwise>
    <li>representação da ascendência dessa pessoa em quartos padrão; outro gráfico súmulas Internet Explorer é necessário;</li>
    <li>representação da prole desta pessoa em forma de texto; Para súmulas Internet Explorer é necessário;</li>
    <li>para o cálculo do parentesco e exibição gráfica de todas as linhas de parentesco é necessário Internet Explorer;</li>
  </xsl:otherwise>
</xsl:choose>
</ul></td></tr>
<tr><td valign="top"> - Os resumoes incluem o arquivo total:</td></tr>
<tr><td valign="top">
<ul>
<li>Contornos:
<ul>
<li>Foto: Uma visão geral de todas as fotos, uma galeria de fotos (máximo de uma foto por pessoa) e uma apresentação de slides contínua com todas as imagens são exibidas em seqüência automaticamente na tela</li>
<li>Photo Memory: Uma versão do jogo da memória com base nas imagens.</li>
<li> Eventos:
<xsl:if test="$Browser = 'IE'">
  Uma visão geral de todos os eventos por data e um resumo dos acontecimentos do dia, em qualquer ano no passado.
</xsl:if>
  <xsl:text>A lista de pessoas cujos dados foi alterada recentemente. </xsl:text>
</li>
<li>
Calendários: Um calendário de aniversários das pessoas que vivem e um calendário de todos os eventos
<xsl:if test="$Browser = 'IE'">
  e um calendário de todos os eventos
</xsl:if>.
</li>
<li><xsl:text>Vários resumoes: visões gerais de todas as pessoas</xsl:text>
<xsl:if test="$Browser != 'OP'">
  , gritar e sobrenomes, nascimento, batismo, relacionamento, morte, sepultamento e residências
</xsl:if>
e relacionamentos.
<xsl:if test="$Browser = 'IE'">
  Além disso, todas as relações entre as pessoas que têm um relacionamento.
</xsl:if>
</li>
</ul></li>
<li>Os dados estatísticos; o número de vivos e falecidos homens e mulheres, e uma visão geral de cada categoria.
<xsl:if test="$Browser = 'IE'">
  Além disso, esta seção contém declarações de idade como um histograma e mesa.
</xsl:if>
</li>
<li>A função de pesquisa, através do qual as pessoas podem ser procurado. Você pode pesquisar usando a primeira letra do sobrenome ou
   <xsl:value-of select="$Txt_roepnaam"/>, <xsl:value-of select="$Txt_voornamen"/>, <xsl:value-of select="$Txt_tussenvoegsel"/>, <xsl:value-of select="$Txt_achternaam"/>, <xsl:value-of select="$Txt_geboortejaar"/> e <xsl:value-of select="$Txt_familie"/>.
Este último é procurado por os sobrenomes nome associado específicas, tal como previsto no Aldfaer para "classificar como"; </li>
<li><xsl:value-of select="$Txt_Vorige"/>: clicando aqui vem a imagem da página anterior; note que isso não é possível por meio do botão "back" do navegador.</li>
</ul></td></tr>
<tr><td valign="top"> - As características especiais:</td></tr>
<tr><td><ul>
<li>As imagens podem ser ampliadas clicando sobre eles. A janela de imagem não necessita de ser fechada. Quando você clica em outra foto, em seguida, ele abre na mesma janela.</li>
<xsl:if test="$Browser = 'IE'">
  <li>Os nomes dos resumoes gráficos pode ser clicado para que a pessoa mapear diretamente essa pessoa é exibida.</li>
  <li>A idade das pessoas que vivem é a idade, neste momento, a idade de pessoas falecidas, a idade no momento da morte.</li>
</xsl:if>
<xsl:if test="$Browser != 'IE'">
  <li>A idade das pessoas que vivem é a idade no momento em que o arquivo foi gerado pedigree (<xsl:value-of select="//FLEXITREE/@date"/>), a idade de pessoas falecidas, a idade no momento da morte.</li>
</xsl:if>
</ul></td></tr>
<xsl:if test="$Browser = 'IE'">
  <tr><td valign="top"> - Obrigatório plug-in externo</td></tr>
  <tr><td><ul>
  <li>Para um número de gráficos, ele usa o visualizador
  <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Adobe SVG viewer</a>.
  <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Baixe</a> e
  instale o <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Adobe SVG Viewer 3.0.3</a> se não há nada para ver gráfico.</li>
  </ul></td></tr>
</xsl:if>
</tbody>
</table>
</xsl:if>

</td></tr>
</table>

</div>

</xsl:template>

</xsl:stylesheet>
