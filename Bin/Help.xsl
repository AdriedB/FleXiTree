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
Op deze website zijn allerlei overzichten te vinden van deze <xsl:value-of select="$Txt_stamboom"/>. Bovenaan elke pagina staan twee regels: ��n met overzichten van een persoon
en ��n met algemene overzichten. Door hier op te klikken verschijnt het betreffende rapport, of verschijnt een vervolgpagina waar rapporten van
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
<li><xsl:value-of select="$Txt_Fotos"/>: Een overzicht van alle foto's, een fotogalerij (maximaal ��n foto per persoon) en een doorlopende <xsl:value-of select="$Txt_diavoorstelling"/> waarbij alle foto's achtereenvolgens automatisch op het scherm getoond worden</li>
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
  Ce site vous propose diff�rents r�sum�s de cette g�n�alogie. 
 En t�te de chaque page se trouvent deux lignes de cases: l'une pr�sentant les r�sum�s d'une personne et l'autre, un r�sum� de l'ensemble. 
 En cliquant sur une des case, le rapport correspondant sera affich� ou une page appara�tra, sur laquelle un r�sum� au choix peut �tre s�lectionn�.
  <br /><br />
  Les r�sum�s d'une personne sont relatifs � la derni�re personne s�lectionn�e. En ce moment il s'agit de 
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
  Pour voir les r�sum�s d'une personne au choix, il vous faudra d'abord la s�lectionner sur ce site. 
  La s�lection peut se faire sur chaque page par le lien du nom imprim� en <a href="javascript:KiesXSL(5,{$HuidigPersoon},'','')">cette couleur</a>. 
  Il y a plusieurs endroits du genre. 
  <br /><br />
  La plupart des pages ne sont g�n�r�es qu'� partir du moment ou vous cliquez le lien correspondant. 
  Ceci entraine parfois un d�lai assez important avant l'apparition de la page.  Par exemple pour des r�sum�s de descendances �tendues. 
  <br /><br />
  En cliquant la case Pr�f�rences, il vous est possible d'adapter la repr�sentation des r�sum�s � votre guise. 
  Apr�s avoir confirm� votre choix en cliquent sur le bouton "OK", vos pr�f�rences seront sauvegard�es 
  et conserv�es pour la session suivante, � l'aide de cookies. A cette fin votre ordinateur doit �tre configur� pour accepter des cookies.
  <br /><br />
  <table class="tbl-tekst">
    <tbody>
      <tr><td valign="top">Les r�sum�s de chaque personne comprennent:</td></tr>
      <tr>
        <td valign="top">
          <ul>
            <li>
              sa <xsl:value-of select="$Txt_persoonskaart"/> contenant les donn�es de la personne (�ventuellement avec des photos), ses parents, 
              <xsl:value-of select="$Txt_relaties"/> et <xsl:value-of select="$Txt_kinderen"/>;
            </li>
            <xsl:choose>
              <xsl:when test="$Browser = 'IE'">
                <li>
                  les <xsl:value-of select="$Txt_voorgeslacht"/> de cette personne en format texte ou graphique: <xsl:value-of select="$Txt_vooroudercirkel"/>,
                  <xsl:value-of select="$Txt_sierstamboom"/>, <xsl:value-of select="$Txt_waaier"/>, <xsl:value-of select="$Txt_zandloper"/>,
                  quartiers standards ou sch�mas ainsi que quelques donn�es statistiques;
                </li>
                <li>
                  les <xsl:value-of select="$Txt_nageslacht"/> de cette personne en format texte et graphique:
                  comprenant les <xsl:value-of select="$Txt_kleinkinderen"/> et les <xsl:value-of select="$Txt_achterkleinkinderen"/>,
                  le graphique rectangulaire avec ou sans les photos, un circle des descendants, une circulaire avec l'ascendance de la lign�e masculine ou f�minine ou les deux, toujours accompagn�s ou non de photos
                  et quelques donn�es statistiques;
                </li>
                <li>
                  la <xsl:value-of select="$Txt_verwantschap"/> et la pr�sentation graphique de toutes les <xsl:value-of select="$Txt_verwantschapslijnen"/> avec n'importe quelle autre personne choisie;
                </li>
              </xsl:when>
              <xsl:otherwise>
                <li>ces <xsl:value-of select="$Txt_voorgeslacht"/> par quartiers standards; autres pr�sentations graphiques n�cessitant Internet Explorer;</li>
                <li>sa descendance r�dig�e; autres pr�sentations graphiques n�cessitant Internet Explorer;</li>
                <li>la <xsl:value-of select="$Txt_verwantschap"/> et la pr�sentation graphique de toutes les <xsl:value-of select="$Txt_verwantschapslijnen"/> n�cessitant Internet Explorer</li>
              </xsl:otherwise>
            </xsl:choose>
          </ul>
        </td>
      </tr>
      <tr><td valign="top"> Les r�sum�s de l'ensemble comprennent :</td></tr>
      <tr>
        <td valign="top">
          <ul>
            <li>
              Les pr�sentations de:
              <ul>
                <li><xsl:value-of select="$Txt_Fotos"/>: toutes les photos pr�sent�es, une galerie photo (une seule photo par personne) et une <xsl:value-of select="$Txt_diavoorstelling"/> automatique</li>
                <li><xsl:value-of select="$Txt_FotoMemory"/>: un jeu de m�moires des photos.</li>
                <li>
                  <xsl:value-of select="$Txt_Gebeurtenissen"/>:
                  <xsl:if test="$Browser = 'IE'">
                    <xsl:text>Chronologie des </xsl:text><xsl:value-of select="$Txt_gebeurtenissen"/><xsl:text> pass�s et une pr�sentation des </xsl:text><xsl:value-of select="$Txt_gebeurtenissen"/> d'aujourd'hui en n'importe quelle ann�e pass�e.
                  </xsl:if>
                  <xsl:text>un r�sum� des personnes dont les donn�es ont �t� mise � jour r�cemment.</xsl:text>
                </li>
                <li>
                  <xsl:value-of select="$Txt_Kalenders"/><xsl:text>: un calendrier d'anniversaires des personnes vivantes</xsl:text>
                  <xsl:if test="$Browser = 'IE'">
                    <xsl:text> et un </xsl:text><xsl:value-of select="$Txt_kalender"/><xsl:text> des </xsl:text><xsl:value-of select="$Txt_gebeurtenissen"/>
                  </xsl:if>.
                </li>
                <li>
                  <xsl:text>Divers r�sum�s : de toutes les personnes</xsl:text>
                  <xsl:if test="$Browser != 'OP'">
                    <xsl:text> avec leur surnom et nom de famille, lieux de naissance, de bapt�me, de relation, de d�c�s, d'inhumation, ainsi que </xsl:text>
                  </xsl:if>
                  <xsl:text> leurs </xsl:text><xsl:value-of select="$Txt_relaties"/> et domiciles.<xsl:text>. </xsl:text>
                  <xsl:if test="$Browser = 'IE'">
                    <xsl:text>Ainsi qu'une pr�sentation de toutes les </xsl:text><xsl:value-of select="$Txt_verwantschappen"/><xsl:text> entre les </xsl:text><xsl:value-of select="$Txt_personen"/><xsl:text> qui ont une </xsl:text><xsl:value-of select="$Txt_relatie"/>.
                  </xsl:if>
                </li>
              </ul>
            </li>
            <li>
                Les donn�es statistiques: par cat�gorie, le nombre d'hommes et de femmes �tant encore en vie o� d�c�d�.
                <xsl:if test="$Browser = 'IE'">
                  <xsl:text>Il y a �galement des </xsl:text><xsl:value-of select="$Txt_leeftijdsoverzichten"/><xsl:text> sous forme d' </xsl:text><xsl:value-of select="$Txt_histogram"/><xsl:text> ou de </xsl:text><xsl:value-of select="$Txt_tabel"/>.
                </xsl:if>
            </li>
            <li>
              Un outil de recherche de personnes <xsl:value-of select="$Txt_via2"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_de_v"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_eersteletter"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_vande_m"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_achternaam"/>
              ou  ayant comme crit�res de recherche le petit nom, les <xsl:value-of select="$Txt_voornamen"/>, 
              <xsl:value-of select="$Txt_tussenvoegsel"/>, <xsl:value-of select="$Txt_achternaam"/>, <xsl:value-of select="$Txt_geboortejaar"/> et <xsl:value-of select="$Txt_familie"/>.
              Avec ce dernier, les recherches se concentrent sur les noms de famille ayant une filiation avec le nom saisis, �quivalent � l'outil  "trier par" pr�vu dans Aldfaer;
            </li>
            <li><xsl:value-of select="$Txt_Vorige"/>: cliquer cette page, vous renvoyai � la page pr�c�dente. Notez cependant, que ce mouvement ne fonctionne pas via le bouton retour de votre navigateur.</li>
          </ul>
        </td>
      </tr>
      <tr><td valign="top"> Particularit�s:</td></tr>
      <tr>
        <td>
          <ul>
            <li>Cliquez sur une photo pour l'agrandir. Il n'est pas n�cessaire de fermez cette fen�tre pour en visualiser une autre, il suffit de cliquer dessus.</li>
            <xsl:if test="$Browser = 'IE'">
              <li>On peut cliquer sur les noms des pr�sentations graphiques pour afficher la <xsl:value-of select="$Txt_persoonskaart"/> en question.</li>
              <li>L'<xsl:value-of select="$Txt_leeftijd"/> des <xsl:value-of select="$Txt_levendepersonen"/> est l'<xsl:value-of select="$Txt_leeftijd"/> actuel, l'<xsl:value-of select="$Txt_leeftijd"/> des <xsl:value-of select="$Txt_overledenpersonen"/> est l'<xsl:value-of select="$Txt_leeftijd"/> � la date du <xsl:value-of select="$Txt_overlijden"/>.</li>
            </xsl:if>
            <xsl:if test="$Browser != 'IE'">
              <li>L'<xsl:value-of select="$Txt_leeftijd"/> des personnes en vie, est celui � la date d�affichage des donn�es de cet arbre g�n�alogique, (<xsl:value-of select="//FLEXITREE/@date"/>).
              Celui des personnes d�c�d�es, � la date du d�ces.</li>
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
                Pour la pr�sentation graphique il faut utiliser l'
                <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Adobe SVG viewer</a>.
                <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">T�l�chargez</a>
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
und eine mit allgemeinen �bersichten. Mit einem Klick auf einen der Bl�cke wird entweder der entsprechende Bereich angezeigt, oder Sie sehen eine zweite Seite, wo Berichte
dieser Kategorie ausgew�hlt werden k�nnen. 
<br/><br/>
Die Daten eine Person beziehen sich immer auf die zuletzt gew�hlte Person.
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
Wenn Sie also einen Bericht �ber eine bestimmte Person haben wollen, sollten Sie zuerst diese Person ausw�hlen.
Sie k�nnen das �berall machen, wo der Name der Person in <a href="javascript:KiesXSL(5,{$HuidigPersoon},'','')">dieser Farbe</a> aufgef�hrt ist. Das ist an vielen Orten der Fall.
<br/><br/>
Fast alle Seiten werden mit einem Klick auf den entsprechenden Link fertig gemacht.
Es kann dann einige Zeit dauern, bis sich die entsprechende Seite �ffnet.
Dies gilt besonders im Fall von gro�en Berichten (z.B. Berichten von jemandem mit vielen Nachkommen).
<br/><br/>
Durch Klicken auf den Block "<xsl:value-of select="$Txt_Instellingen"/>" k�nnen Sie die Bericht Ihren Vorstellungen anpassen.
Die <xsl:value-of select="$Txt_Instellingen"/> bleiben erhalten, so dass Sie in der n�chsten Sitzung wieder zur Verf�gung stehen.
Zu diesem Zweck werden diese <xsl:value-of select="$Txt_Instellingen"/> �ber Cookies gespeichert. Falls Sie diese Option benutzen wollen, muss der Computer so eingestellt werden, dass Cookies akzeptiert werden. 
<br/><br/>
<table class="tbl-tekst">
<tbody>
<tr><td valign="top"> - Die Berichte der einzelnen Person enthalten:</td></tr>
<tr><td valign="top"><ul>
<li>eine <xsl:value-of select="$Txt_persoonskaart"/>, mit Daten �ber die Person (m�glichst mit Fotos), die Eltern, <xsl:value-of select="$Txt_relaties"/> und <xsl:value-of select="$Txt_kinderen"/>;</li>
<xsl:choose>
  <xsl:when test="$Browser = 'IE'">
    <li>Anzeige der <xsl:value-of select="$Txt_voorgeslacht"/> dieser Person in Textform und in verschiedene graphische Formen: wie <xsl:value-of select="$Txt_vooroudercirkel"/>,
        <xsl:value-of select="$Txt_sierstamboom"/>, <xsl:value-of select="$Txt_waaier"/>, <xsl:value-of select="$Txt_zandloper"/>, Standard-Viertel oder Schema
        sowie einige statistische Daten;</li>
    <li>Anzeige von <xsl:value-of select="$Txt_nageslacht"/> dieser Person in Textform und in verschiedene graphische Formen:
        Eine �bersicht von <xsl:value-of select="$Txt_kleinkinderen"/> und <xsl:value-of select="$Txt_achterkleinkinderen"/>, ein graphisch <xsl:value-of select="$Txt_nageslacht"/>
        in Rechteckform (m�glichst mit Fotos) oder in Kreisform, und ein <xsl:value-of select="$Txt_parenteel"/> in <xsl:value-of select="$Txt_mannelijkelijn"/>
        oder in <xsl:value-of select="$Txt_vrouwelijkelijn"/> oder in beide Linien,
        alle mit oder ohne <xsl:value-of select="$Txt_fotos"/>, sowie einige statistische Daten;</li>
    <li><xsl:value-of select="$Txt_verwantschap"/> und graphische Anzeige aller <xsl:value-of select="$Txt_verwantschapslijnen"/> mit einer willk�rlicher andere Person;</li>
  </xsl:when>
  <xsl:otherwise>
    <li>Anzeige der <xsl:value-of select="$Txt_voorgeslacht"/> im Standard-Viertel. F�r weitere grafische Erhebungen ist Internet Explorer erforderlich;</li>
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
<li><xsl:value-of select="$Txt_Fotos"/>: Eine �bersicht aller Fotos, eine Fotogalerie (nur ein Foto pro Person) und eine <xsl:value-of select="$Txt_diavoorstelling"/> die automatisch alle Bilder auf dem Bildschirm zeigt.</li>
<li><xsl:value-of select="$Txt_FotoMemory"/>: Eine Version des Memory-Spiels mit den Fotos.</li>
<li> <xsl:value-of select="$Txt_Gebeurtenissen"/>:
<xsl:if test="$Browser = 'IE'">
  <xsl:text>Anzeige auf Datum aller </xsl:text><xsl:value-of select="$Txt_gebeurtenissen"/><xsl:text> und ein Anzeige von heutige </xsl:text><xsl:value-of select="$Txt_gebeurtenissen"/><xsl:text> in jedes Jahr in die Vergangenheit. </xsl:text>
</xsl:if>
  <xsl:text>Eine Liste von Personen, deren Daten sich k�rzlich ge�ndert haben.</xsl:text>
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
<li>Statistische Daten, die Anzahl der lebenden und verstorbenen M�nnern und Frauen, und eine �bersicht der einzelnen Kategorien.
<xsl:if test="$Browser = 'IE'">
  <xsl:text>Auch in dieser Rubrik </xsl:text><xsl:value-of select="$Txt_leeftijdsoverzichten"/><xsl:text> wie </xsl:text><xsl:value-of select="$Txt_histogram"/><xsl:text> und wie </xsl:text><xsl:value-of select="$Txt_tabel"/>.
</xsl:if>
</li>
<li>Eine Suchfunktion, durch die <xsl:value-of select="$Txt_personen"/> gesucht werden
    <xsl:value-of select="$Txt_via2"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_de_v"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_eersteletter"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_vande_m"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_achternaam"/>
   oder via Suchfelder: 
   <xsl:value-of select="$Txt_roepnaam"/>, <xsl:value-of select="$Txt_voornamen"/>, <xsl:value-of select="$Txt_tussenvoegsel"/>, <xsl:value-of select="$Txt_achternaam"/>, <xsl:value-of select="$Txt_geboortejaar"/> und <xsl:value-of select="$Txt_familie"/>.
Die letzte Suche nach Namen im Zusammenhang mit der Such-String <xsl:value-of select="$Txt_achternamen"/>, wie im Aldfaer "Sortierung als" Bereich; </li>
<li><xsl:value-of select="$Txt_Vorige"/>: Das bringt Sie zur�ck zur vorherigen Seite. Beachten Sie, dass Sie das nicht �ber den "Zur�ck" Button Ihres Browsers k�nnen.</li>
</ul></td></tr>
<tr><td valign="top"> - Besondere Eigenschaften:</td></tr>
<tr><td><ul>
<li>Ein Klick auf ein Foto zeigt es in einem separaten Fenster. Es ist nicht n�tig das Fenster zu schlie�en.
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
  <tr><td valign="top"> - Ben�tigte externe plug-in</td></tr>
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
De oersichten fan in persoan hawwe hieltyd betrekking op de l�st selektearde peroan.
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
Dit selektearje kin oeral barre w�r de namme yn <a href="javascript:KiesXSL(5,{$HuidigPersoon},'','')">dizze kleur</a> stiet. Dit is op in hiel  protte plakken.
<br/><br/>
Omtrint alle pagina's wurde pas oanmakke op it momint dat jo earne op klikt.  
 Dit betsjut dat it efkes kin duorren foar de oangeande side op it byldskerm ferskynt.  
 Dit jildt mei namme by grutte oersichten (b.v. in nageslacht-overzicht fan immen mei in soad nakomelingen).
<br/><br/>
Troch te klikken op de knop Ynstellingen kiine jo de ferslachen nei eigen smaak oanpasse. De ynstellingen bliuwe bewarre dat se yn in folgjende sessy wer besikber binne.
Hjirta wurde dizze ynstellingen ynslein fia saneamde cookies. Wolle jo fan dizze mooglikheid br�ke, dan moat jo kompj�ter sa ynsteld w�ze dat cookies aksepteard wurde.
<br/><br/>
<table class="tbl-tekst">
<tbody>
<tr><td valign="top"> - De ferslachen fan elke persoan omfetsje:</td></tr>
<tr><td valign="top"><ul>
<li>in persoanskaart, mei gegevens oer de persoan (mooglijk mei foto\'s), de aldelju, relaasjes en bern;;</li>
<xsl:choose>
  <xsl:when test="$Browser = 'IE'">
    <li>wejefte fan it foarteam fan dizze persoan yn tekst- en yn ferskate grafiske foarmje: as Foar�ldensirkels, sierstambeam, waaier, s�ngl�s, standertkertieren of skema asmede enkele statistyke gegevens</li>
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
<tr><td valign="top"> - De ferslachen fan it totale best�n omfetsje:</td></tr>
<tr><td valign="top">
<ul>
<li>Oersichten fan:
<ul>
<li>Foto's: In oersicht fan alle foto's, in fotogaley (maksimaal ien foto fan in persoan) en in trochrinnende diafoarstelling w�rby alle foto's achterinoar automatisk op it skerm toant wurde</li>
<li>FotoMemory: In ferzje fan it Memoryspul oan de h�n fan de foto's.</li>
<li>Foarfallen:
<xsl:if test="$Browser = 'IE'">
  In oersicht op datum fan alle foarfallen en in oersicht fan de foarfallen fan hjoed yn iennichst year yn it ferline.
</xsl:if>
  <xsl:text>In oersicht fan persoanen fan wa l�sten gegevens wizige binne. </xsl:text>
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
  Ek bevettet dizze rubryk �ldens-oersicht as hisogram as tabel.
</xsl:if>
</li>
 en op berte-, ferstjerre- en relaasjeplakke.
<li>In Sykjefunksje, mei help w�rfan persoanen zocht kinne wurde. Der kin zocht wurde fia de earste letter fan de skaainamme of ropnamme, foarnammen, skaainamme, bertejier en <xsl:value-of select="$Txt_familie"/>.
By dit l�ste wurdt socht op oan de opj�n namme verwante famyljenammen, lykas f�stleien yn Aldfaer by "sorteren as"; </li>
<li><xsl:value-of select="$Txt_Vorige"/>: troch hjir op te klikke komt de foarige side yn byld; tink derom dat dit net kin fia de "foarige" knop fan de browser.</li>
</ul></td></tr>
<tr><td valign="top"> - Bys�ndere eigenskippen:</td></tr>
<tr><td><ul>
<li>De foto's kinne fergrut wurde troch derop te klikken. It fotofinster hoegt net sl�tte te wurde.  Wannear op in oare foto klikt wurd, dan wurd dizze yn it finster iepene.</li>
<xsl:if test="$Browser = 'IE'">
  <li>Op de nammen yn de grafiske oersichten kin klikt wurde, sadat direkt de persoanskaart fan die persoan toand wurd.</li>
  <li>De �ldens fan libbende persoanen is de �ldans op dit momint, de �ldens fan ferstoarne persoanen is de �ldens op it momint van fersterre.</li>
</xsl:if>
<xsl:if test="$Browser != 'IE'">
  <li>De <xsl:value-of select="$Txt_leeftijd"/> fan <xsl:value-of select="$Txt_levendepersonen"/> is de <xsl:value-of select="$Txt_leeftijd"/> op it momint dat it stamboombestand generearre is (<xsl:value-of select="//FLEXITREE/@date"/>), de �ldens fan ferstoarne persoanen is de �ldens op it momint van fersterre.</li>
</xsl:if>
</ul></td></tr>
<xsl:if test="$Browser = 'IE'">
  <tr><td valign="top"> - Nediche eksterne plug-in</td></tr>
  <tr><td><ul>
  <li>Foar in oantal grafiske werjeftes wurd br�k kakke fan de
  <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Adobe SVG viewer</a>.
  <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Download</a> en
  ynstallear dan earst de <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Adobe SVG Viewer 3.0.3</a> as der niks te sjen is.</li>
  </ul></td></tr>
</xsl:if>
</tbody>
</table>
</xsl:if>

<xsl:if test="$parTaal = 'noors'">
P� denne webside finnes allslags oversikter av dette slektstre.
�verst p� hver side finnes to linjer; en med oversikten til en person, og en med generelle oversikter.
Ved � klikke p� en av rammene �pnes den gjeldende rapport, eller det kommer opp en ny side hvor en kan velge rapporter som h�rer inn under denne kategorien.
<br/><br/>
En persons oversikt relateres bestandig p� den sist valgte person.
Akkurat n� er dette
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
Hvis man �nsker � se en bestemt persons rapport, m� dette f�rst velges noe sted.
Dette tvalg kan foretas p� alle steder hvor dette navn er <a href="javascript:KiesXSL(5,{$HuidigPersoon},'','')">farget slik</a>. Det er p� mange steder.
<br/><br/>
Nesten alle sidene er kun opprettet n�r du klikker p� noe.
Dette betyr at det kan ta tid for siden vises p� skjermen.
Dette gjelder spesielt for store oversikter (f.eks avkom disposisjon av noen med mye avkom).
<br/><br/>
Ved � klikke p� "Instillinger" kan man forme rapportene etter eget behov. Instillingen blir lagret slik at de kan brukes ved en etterf�lgende gjennomgang.
Derfor blir disse instillingene lagret i s�kalte cookies. Hvis man �nsker � bruke denne muligheten, m� komputeren deres v�re innstilt slik at cookies blir akseptert.
<br/><br/>
<table class="tbl-tekst">
<tbody>
<tr><td valign="top"> - Rapportene til hver person inneholder:</td></tr>
<tr><td valign="top"><ul>
<li>et personskort, med informasjon om personen (eventuell med bilder), foreldre, relasjoner og barn;</li>
<xsl:choose>
  <xsl:when test="$Browser = 'IE'">
    <li>Gjengjvelsen av personens forfedrer i tekst og i forskjellige grafiske former: s�nn  som forfedre sirkel, prydslektstre, vifte, timeglass, standard anerapport eller skjema, samt noen enkle statistiske innformasjoner</li>
    <li>gjengivelse av personens etterkommere i tekst og i forskjellige grafiske former::
        en oversikt av barnebarn og oldebarn, en grafisk rektangulart eller sirkel�rt etterkommer rapport, og en etterkommer rapport i mannlig eller kvinnelig linje eller begge linjer, samt enkle statistiske informasjoner</li>
    <li>slektskap og grafisk gjengivelse av alle slektskapslinjer med en villek�rlig valgt person;</li>
  </xsl:when>
  <xsl:otherwise>
    <li>representasjon av forfedrene til denne personen i standard kvartalene; andre grafiske oversikter Internet Explorer er n�dvendig;</li>
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
<li>Bilder: En oversikt av alle bilder, foto galleri ( maks et bilde pr person), en uavbrutt dia-framvisning hvor samtlige bilder automatisk blir vist p� skjermen etter hverandre</li>
<li>Fotomemory: En versjon av Memorileken ved bruk av bildene.</li>
<li> Hendelser:
<xsl:if test="$Browser = 'IE'">
  En oversikt p� dato av samtlige hendelser fra i dag til et valgt �r tilbake.
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
  , kallenavn og etternavn, f�dsel-, dop-, relasjon-, d�d-, begravelse-, bosteder
</xsl:if>
og relasjoner.
<xsl:if test="$Browser = 'IE'">
  Videre en oversikt over alle slektskap mellom personer som har en relasjon.
</xsl:if>
</li>
</ul></li>
<li>Statistiske opplysninger; antall menn og kvinner i live og d�de, en oversikt av hver kategori.
<xsl:if test="$Browser = 'IE'">
  Denne rubrikken inneholder ogs� oversikter over alder som histogram og som tabell.
</xsl:if>
</li>
<li>En s�kefunksjon, hvormed en kan s�ke p� personer. Man kan s�ke via den f�rste bokstaven av etternavn, 
   <xsl:value-of select="$Txt_roepnaam"/>, <xsl:value-of select="$Txt_voornamen"/>, <xsl:value-of select="$Txt_tussenvoegsel"/>, <xsl:value-of select="$Txt_achternaam"/>, <xsl:value-of select="$Txt_geboortejaar"/> og <xsl:value-of select="$Txt_familie"/>.
Sistnevnte er �nsket p� de oppgitte navnerelaterte etternavn, som fastsatt i Aldfaer til "sort som"; </li>
<li><xsl:value-of select="$Txt_Vorige"/>: ved � klikke her kommer den forrige side image; oppmerksom p� at dette ikke er mulig gjennom "tilbake" -knappen i nettleseren.</li>
</ul></td></tr>
<tr><td valign="top"> - Spesielle egenskap:</td></tr>
<tr><td><ul>
<li>Bildene kan forst�rres ved � klikke p� dem. Det er ikke n�dvendig � avslutte bildevinduet, n�r man klikker p� et annet bilde blir dette �pnet i samme vinduet.</li>
<xsl:if test="$Browser = 'IE'">
  <li>I de grafiske oversikter kan man klikke p� navn, slik at personens personskort blir vist.</li>
  <li>Alderen av personer i live er alderen akkurat n�. Alderen av d�de personer er alderen p� tiden av d�d.</li>
</xsl:if>
<xsl:if test="$Browser != 'IE'">
  <li>Alder av levende personer er alderen p� den tiden at filen ble generert stamtavle (<xsl:value-of select="//FLEXITREE/@date"/>), alderen av d�de personer er alderen p� tiden av d�d.</li>
</xsl:if>
</ul></td></tr>
<xsl:if test="$Browser = 'IE'">
  <tr><td valign="top"> - N�dvendig ekstern plug-in</td></tr>
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
En esta p�gina web se puede encontrar algunas cr�ticas de este pedigr�. En la parte superior de cada p�gina hay dos reglas: una con declaraciones de una persona
y otra con declaraciones generales. Al hacer clic aqu� se mostrar� en el informe o una p�gina desplegable que los res�menes de esta categor�a pueden ser elegidos.
<br/><br/>
Las declaraciones de una persona siempre se refieren a la �ltima persona seleccionada.
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
As� que si usted quiere ver un informe de una persona en particular, primero debe seleccionarlo en alguna parte.
Esta selecci�n puede ocurrir en cualquier lugar donde el nombre es en <a href="javascript:KiesXSL(5,{$HuidigPersoon},'','')">este color</a>. Esto es, en muchos lugares.
<br/><br/>
Casi todas las p�ginas s�lo se crean cuando se hace clic en algo.
Esto significa que puede tomar tiempo para que aparezca la p�gina en la pantalla.
Esto es especialmente cierto para grandes visiones generales (por ejemplo, contorno descendencia de alguien con una gran cantidad de descendencia).
<br/><br/>
Al hacer clic, se pueden personalizar los res�menes para degustar en el bot�n Configuraci�n. Los ajustes se guardan de manera que est�n disponibles de nuevo en la pr�xima sesi�n.
Para este prop�sito, estos ajustes se almacenan mediante cookies. Quieres hacer uso de esta opci�n, el ordenador debe estar configurado para aceptar cookies.
<br/><br/>
<table class="tbl-tekst">
<tbody>
<tr><td valign="top"> - Los res�menes de cada persona son:</td></tr>
<tr><td valign="top"><ul>
<li>un mapa individual, con datos de la persona (con fotos), sus padres, las relaciones y los ni�os;</li>
<xsl:choose>
  <xsl:when test="$Browser = 'IE'">
    <li>representaci�n de la ascendencia de esta persona en el texto y los gr�ficos en diversas formas: como c�rculo antepasado, �rbol ornamental, fan, reloj de arena, cuartos est�ndar o el horario y algunas estad�sticas;</li>
    <li>representaci�n de los descendientes de este individuo en el texto y en diversas formas gr�ficas: una visi�n general de los nietos y bisnietos, una posteridad gr�fico en forma de rect�ngulo o en forma circular, y un descendiente en el var�n o la l�nea femenina o en ambas l�neas, as� como algunas estad�sticas;</li>
    <li>parentesco y visualizaci�n gr�fica de todas las l�neas de parentesco para elegir cualquier otra persona;</li>
  </xsl:when>
  <xsl:otherwise>
    <li>representaci�n de la ascendencia de esta persona en cuartos est�ndar; Se requiere otro gr�fico res�menes Internet Explorer;</li>
    <li>weergave van het <xsl:value-of select="$Txt_nageslacht"/> van deze persoon in tekstvorm; voor meer overzichten is Internet Explorer nodig;</li>
    <li>representaci�n de la descendencia de esta persona en forma de texto; Para una visi�n general se requiere Internet Explorer;</li>
  </xsl:otherwise>
</xsl:choose>
</ul></td></tr>
<tr><td valign="top"> - Los res�menes incluyen el total del archivo:</td></tr>
<tr><td valign="top">
<ul>
<li>Esquemas:
<ul>
<li>Foto: Una visi�n general de todas las fotos, una galer�a de fotos (m�ximo una foto por persona) y una presentaci�n de diapositivas continua con todas las im�genes se visualizan secuencialmente de forma autom�tica en la pantalla.</li>
<li>Memoria Foto: Una versi�n del juego de memoria basado en las im�genes.</li>
<li> Eventos:
<xsl:if test="$Browser = 'IE'">
  Una visi�n general de todos los eventos por fecha y un resumen de los acontecimientos del d�a en un a�o en el pasado.
</xsl:if>
  Una lista de las personas cuyos datos se ha cambiado recientemente.
</li>
<li>
Calendarios: Un calendario de cumplea�os de las personas que viven 
<xsl:if test="$Browser = 'IE'">
  y un calendario de todos los eventos
</xsl:if>.
</li>
<li>En varios res�menes: una visi�n general de todas las personas
<xsl:if test="$Browser != 'OP'">
  , gritar y apellidos, nacimiento, bautismo, relaci�n, muerte, sepultura y residencias 
</xsl:if>
y relaciones.
<xsl:if test="$Browser = 'IE'">
  Adem�s, todas las relaciones entre las personas que tienen una relaci�n.
</xsl:if>
</li>
</ul></li>
<li>Datos estad�sticos; el n�mero de la vida y los hombres fallecidos y las mujeres, y una visi�n general de cada categor�a.
<xsl:if test="$Browser = 'IE'">
  Adem�s, esta secci�n contiene declaraciones de edad como un histograma y una mesa.
</xsl:if>
</li>
<li>Una funci�n de b�squeda, a trav�s del cual las personas pueden ser buscados. Usted puede buscar utilizando la primera letra del apellido o
   <xsl:value-of select="$Txt_roepnaam"/>, <xsl:value-of select="$Txt_voornamen"/>, <xsl:value-of select="$Txt_tussenvoegsel"/>, <xsl:value-of select="$Txt_achternaam"/>, <xsl:value-of select="$Txt_geboortejaar"/> e <xsl:value-of select="$Txt_familie"/>.
Este �ltimo es buscado por el nombre relacionado apellidos especificados, seg�n lo establecido en Aldfaer a "una especie de"; </li>
<li><xsl:value-of select="$Txt_Vorige"/>: haciendo clic aqu� viene la imagen de la p�gina anterior; tenga en cuenta que esto no es posible a trav�s del bot�n "atr�s" del navegador.</li>
</ul></td></tr>
<tr><td valign="top"> - Caracter�sticas especiales:</td></tr>
<tr><td><ul>
<li>Las im�genes se pueden ampliar haciendo clic sobre ellos. La ventana de imagen no necesita ser cerrado. Al hacer clic en otra imagen, luego se abre en la misma ventana.</li>
<xsl:if test="$Browser = 'IE'">
  <li>Los nombres de los res�menes gr�ficos se puede hacer clic para que la persona se correlaciona directamente a esa persona se muestra.</li>
  <li>La edad de las personas que viven es la edad en este momento, la edad de las personas fallecidas, la edad en el momento de la muerte.</li>
</xsl:if>
<xsl:if test="$Browser != 'IE'">
  <li>La edad de las personas que viven es la edad en el momento en que el archivo se gener� pedigr� (<xsl:value-of select="//FLEXITREE/@date"/>), la edad de las personas fallecidas, la edad en el momento de la muerte.</li>
</xsl:if>
</ul></td></tr>
<xsl:if test="$Browser = 'IE'">
  <tr><td valign="top"> - Se requiere el plug-in externo</td></tr>
  <tr><td><ul>
  <li>Para un n�mero de gr�ficos, se utiliza el visor
  <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Adobe SVG viewer</a>.
  <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Descargue</a> e
  instale el <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Adobe SVG Viewer 3.0.3</a> si no hay nada que ver gr�fico.</li>
  </ul></td></tr>
</xsl:if>
</tbody>
</table>
</xsl:if>

<xsl:if test="$parTaal = 'italiaans'">
Su questo sito potete trovare alcune recensioni di questo pedigree. Nella parte superiore di ogni pagina ci sono due regole: una con le dichiarazioni di una person
e una con dichiarazioni generali. Cliccando qui mostrer� il rapporto, o un drop-page che i sommari di questa categoria possono essere scelti.
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
Quindi, se volete vedere un report di una persona in particolare, � necessario selezionare prima da qualche parte.
Questa selezione pu� accadere ovunque il nome � in <a href="javascript:KiesXSL(5,{$HuidigPersoon},'','')">questo colore</a>. Questo � in molti luoghi.
<br/><br/>
Quasi tutte le pagine vengono creati solo quando si fa clic su qualcosa.
Ci� significa che si pu� prendere tempo per la pagina viene visualizzata sullo schermo.
Ci� � particolarmente vero per le grandi rassegne (ad esempio prole contorno di qualcuno con un sacco di figli).
<br/><br/>
Facendo clic, � possibile personalizzare i report per gustare il pulsante Impostazioni. Le impostazioni vengono salvate in modo che siano ancora disponibili nella sessione successiva.
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
    <li>rappresentazione dei discendenti di questo individuo in testo e in varie forme grafiche: una panoramica di nipoti e pronipoti, una posterit� grafico in forma di rettangolo o in forma circolare, e un discendente nel maschio o linea femminile o in entrambe le linee, cos� come alcune statistiche;</li>
    <li>parentela e visualizzazione grafica di tutte le linee di parentela di scegliere qualsiasi altra persona;</li>
  </xsl:when>
  <xsl:otherwise>
    <li>rappresentazione del antenati di questa persona nei quartieri standard; � necessaria altra grafica panoramiche Internet Explorer;</li>
    <li>rappresentazione della prole di questa persona in forma scritta; Per una panoramica � necessario Internet Explorer;</li>
    <li>per il calcolo parentela e visualizzazione grafica di tutte le linee di parentela � necessario Internet Explorer;</li>
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
  Inoltre, questa sezione contiene dichiarazioni et� come un istogramma e tavolo.
</xsl:if>
</li>
<li>Una funzione di ricerca, attraverso cui le persone possono essere cercati. � possibile cercare utilizzando la prima lettera del cognome o
   <xsl:value-of select="$Txt_roepnaam"/>, <xsl:value-of select="$Txt_voornamen"/>, <xsl:value-of select="$Txt_tussenvoegsel"/>, <xsl:value-of select="$Txt_achternaam"/>, <xsl:value-of select="$Txt_geboortejaar"/> e <xsl:value-of select="$Txt_familie"/>.
Quest'ultimo � ricercato sul nome correlati cognomi indicati, come previsto Aldfaer a "sorta come"; </li>
<li><xsl:value-of select="$Txt_Vorige"/>: cliccando qui arriva l'immagine della pagina precedente; notare che questo non � possibile attraverso il pulsante "indietro" del browser.</li>
</ul></td></tr>
<tr><td valign="top"> - Caratteristiche speciali:</td></tr>
<tr><td><ul>
<li>Le immagini possono essere ingrandite cliccandoci sopra. La finestra di immagine non deve essere chiuso. Quando si fa clic su un\'altra immagine, poi si apre nella stessa finestra.</li>
<xsl:if test="$Browser = 'IE'">
  <li>I nomi dei report grafici possono essere cliccati in modo che la persona mappa direttamente quella persona viene visualizzato.</li>
  <li>L'et� delle persone che vivono � l'et� in questo momento, l'et� delle persone decedute, l'et� al momento della morte.</li>
</xsl:if>
<xsl:if test="$Browser != 'IE'">
  <li>L'et� delle persone che vivono l'et� al momento che il file � stato generato pedigree (<xsl:value-of select="//FLEXITREE/@date"/>), l'et� delle persone decedute, l'et� al momento della morte.</li>
</xsl:if>
</ul></td></tr>
<xsl:if test="$Browser = 'IE'">
  <tr><td valign="top"> - Plug-in esterni necessari</td></tr>
  <tr><td><ul>
  <li>Per un numero di immagini, utilizza il visualizzatore
  <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Adobe SVG viewer</a>.
  <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Scaricare</a> e
  installare <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Adobe SVG Viewer 3.0.3</a> se non c'� niente da vedere grafico.</li>
  </ul></td></tr>
</xsl:if>
</tbody>
</table>
</xsl:if>

<xsl:if test="$parTaal = 'portugees'">
Neste site voc� pode encontrar alguns coment�rios do pedigree. No topo de cada p�gina h� duas regras: uma com declara��es de uma pessoa e um com declara��es gerais.
Clicando aqui vai mostrar o relat�rio ou uma p�gina queda que os resumoes desta categoria podem ser escolhidos.
<br/><br/>
As declara��es de uma pessoa sempre se relacionam com a �ltima pessoa selecionada.
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
Ent�o, se voc� quiser ver um relat�rio de uma pessoa em particular, voc� deve primeiro selecion�-lo em algum lugar.
Esta sele��o pode acontecer em qualquer lugar onde o nome � <a href="javascript:KiesXSL(5,{$HuidigPersoon},'','')">nesta cor</a>. Isto � em muitos lugares.
<br/><br/>
Quase todas as p�ginas s�o criadas apenas quando voc� clica em alguma coisa.
Isso significa que ele pode levar algum tempo para a p�gina aparece na tela.
Isto � especialmente verdadeiro para as grandes vis�es gerais (por exemplo esbo�o descend�ncia de algu�m com um monte de filhos).
<br/><br/>
Ao clicar, voc� pode personalizar os resumoes para provar o bot�o Configura��es. As configura��es s�o salvas de modo que eles est�o dispon�veis novamente na pr�xima sess�o.
Para o efeito, essas configura��es s�o armazenadas via cookies. Voc� quer fazer uso desta op��o, em seguida, o computador deve estar configurado para aceitar cookies.
<br/><br/>
<table class="tbl-tekst">
<tbody>
<tr><td valign="top"> - Resumoes de cada pessoa incluem:</td></tr>
<tr><td valign="top"><ul>
<li>um mapa individual, com detalhes da pessoa (com fotos), seus pais, relacionamentos e filhos;</li>
<xsl:choose>
  <xsl:when test="$Browser = 'IE'">
    <li>representa��o da ascend�ncia dessa pessoa em texto e gr�ficos em v�rias formas: como c�rculo ancestral, �rvore ornamental, ventilador, ampulheta, quartos standard ou cronograma e algumas estat�sticas;</li>
    <li>representa��o dos descendentes desse indiv�duo em texto e em v�rias formas gr�ficas: uma vis�o geral dos netos e bisnetos, uma posteridade gr�fico em forma de ret�ngulo ou em forma circular, e um descendente na linha masculina ou feminina ou em ambas as linhas, bem como algumas estat�sticas;</li>
    <li>parentesco e exibi��o gr�fica de todas as linhas de parentesco para escolher qualquer outra pessoa;</li>
  </xsl:when>
  <xsl:otherwise>
    <li>representa��o da ascend�ncia dessa pessoa em quartos padr�o; outro gr�fico s�mulas Internet Explorer � necess�rio;</li>
    <li>representa��o da prole desta pessoa em forma de texto; Para s�mulas Internet Explorer � necess�rio;</li>
    <li>para o c�lculo do parentesco e exibi��o gr�fica de todas as linhas de parentesco � necess�rio Internet Explorer;</li>
  </xsl:otherwise>
</xsl:choose>
</ul></td></tr>
<tr><td valign="top"> - Os resumoes incluem o arquivo total:</td></tr>
<tr><td valign="top">
<ul>
<li>Contornos:
<ul>
<li>Foto: Uma vis�o geral de todas as fotos, uma galeria de fotos (m�ximo de uma foto por pessoa) e uma apresenta��o de slides cont�nua com todas as imagens s�o exibidas em seq��ncia automaticamente na tela</li>
<li>Photo Memory: Uma vers�o do jogo da mem�ria com base nas imagens.</li>
<li> Eventos:
<xsl:if test="$Browser = 'IE'">
  Uma vis�o geral de todos os eventos por data e um resumo dos acontecimentos do dia, em qualquer ano no passado.
</xsl:if>
  <xsl:text>A lista de pessoas cujos dados foi alterada recentemente. </xsl:text>
</li>
<li>
Calend�rios: Um calend�rio de anivers�rios das pessoas que vivem e um calend�rio de todos os eventos
<xsl:if test="$Browser = 'IE'">
  e um calend�rio de todos os eventos
</xsl:if>.
</li>
<li><xsl:text>V�rios resumoes: vis�es gerais de todas as pessoas</xsl:text>
<xsl:if test="$Browser != 'OP'">
  , gritar e sobrenomes, nascimento, batismo, relacionamento, morte, sepultamento e resid�ncias
</xsl:if>
e relacionamentos.
<xsl:if test="$Browser = 'IE'">
  Al�m disso, todas as rela��es entre as pessoas que t�m um relacionamento.
</xsl:if>
</li>
</ul></li>
<li>Os dados estat�sticos; o n�mero de vivos e falecidos homens e mulheres, e uma vis�o geral de cada categoria.
<xsl:if test="$Browser = 'IE'">
  Al�m disso, esta se��o cont�m declara��es de idade como um histograma e mesa.
</xsl:if>
</li>
<li>A fun��o de pesquisa, atrav�s do qual as pessoas podem ser procurado. Voc� pode pesquisar usando a primeira letra do sobrenome ou
   <xsl:value-of select="$Txt_roepnaam"/>, <xsl:value-of select="$Txt_voornamen"/>, <xsl:value-of select="$Txt_tussenvoegsel"/>, <xsl:value-of select="$Txt_achternaam"/>, <xsl:value-of select="$Txt_geboortejaar"/> e <xsl:value-of select="$Txt_familie"/>.
Este �ltimo � procurado por os sobrenomes nome associado espec�ficas, tal como previsto no Aldfaer para "classificar como"; </li>
<li><xsl:value-of select="$Txt_Vorige"/>: clicando aqui vem a imagem da p�gina anterior; note que isso n�o � poss�vel por meio do bot�o "back" do navegador.</li>
</ul></td></tr>
<tr><td valign="top"> - As caracter�sticas especiais:</td></tr>
<tr><td><ul>
<li>As imagens podem ser ampliadas clicando sobre eles. A janela de imagem n�o necessita de ser fechada. Quando voc� clica em outra foto, em seguida, ele abre na mesma janela.</li>
<xsl:if test="$Browser = 'IE'">
  <li>Os nomes dos resumoes gr�ficos pode ser clicado para que a pessoa mapear diretamente essa pessoa � exibida.</li>
  <li>A idade das pessoas que vivem � a idade, neste momento, a idade de pessoas falecidas, a idade no momento da morte.</li>
</xsl:if>
<xsl:if test="$Browser != 'IE'">
  <li>A idade das pessoas que vivem � a idade no momento em que o arquivo foi gerado pedigree (<xsl:value-of select="//FLEXITREE/@date"/>), a idade de pessoas falecidas, a idade no momento da morte.</li>
</xsl:if>
</ul></td></tr>
<xsl:if test="$Browser = 'IE'">
  <tr><td valign="top"> - Obrigat�rio plug-in externo</td></tr>
  <tr><td><ul>
  <li>Para um n�mero de gr�ficos, ele usa o visualizador
  <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Adobe SVG viewer</a>.
  <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Baixe</a> e
  instale o <a href="http://www.adobe.com/nl/svg/viewer/install/index.html" title="Download SVG Viewer" target="blank">Adobe SVG Viewer 3.0.3</a> se n�o h� nada para ver gr�fico.</li>
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
