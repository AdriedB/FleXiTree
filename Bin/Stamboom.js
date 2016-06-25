<!--//
// <author>Adrie den Blanken</author>
// <file>$Workfile: Stamboom.js $</file><date>$Date: 19-05-16 20:25 $</date>
// <revision>$Revision: 93 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this
// header stays intact. No responsibility is accepted
// for use of this software.</disclaimer>
//
// See also http://www.codeproject.com/jscript/CrossBrowserJavaScript.asp
//-->
var bookwin = null;
var source = null;
var stylesI= null;  // instellingen.xsl
var xp     = null;
var xmls   = null;
var bookWindow = null;
var refPersoon= 0;
var printOpmaak = 0;
var svgDocument = null;
var iFotoCnt = 0;
var arrayPhotos    = new Array();
var arrayPhotosAlts= new Array();
var arrayPhotosTitles= new Array();
var arrayPhotosW= new Array();
var arrayPhotosH= new Array();
var fotomap = ".";
var iHistCnt = 0;
var vorigeWhat     = new Array();
var vorigeNaam     = new Array();
var vorigePage     = new Array();
var vorigeKeyword1 = new Array();
var vorigeKeyword2 = new Array();
var slideShowRunning = false;
var slideShowStillShowRunning = false;
var iSlideCounter = 0;
var iTotaalFotoCnt = 0;
var wijzigSortering = 0;
var startxsl = 0;
var NodeGroepsfotos;
var groepsfoto = new Array();
var nr_Hotspots = new Array();
var Hotspotleft = new Array();
var Hotspottop = new Array();
var Hotspotwidth = new Array();
var Hotspotpadd = new Array();
var Hotspottitle = new Array();

var iAmFF = 0;          // FireFox
var iAmIE = 0;          // Internet Explorer
var iAmOp = 0;          // Opera (9.5 heeft nog problemen met xsl:key)
var iAmSafari = 0;      // Apple Safari (Safari 1.3 and above supports XSL transformations of XML pages at load time.
                        // XSLT support is limited to XSL page processing instructions embedded at the top of an XML page:
var iAmChrome = 0;      // Google Chrome
var iAmMetro = false;   // IE10 met Metro interface
// SVG variabelen
var isSVG  = false;
//var strSVG = '';
var strSVG = '<svg width="100%" viewBox="0 0 420 300" preserveAspectRatio="xMinYMin meet"><line x1="30" y1="30" x2="30" y2="270" style="stroke: black;" /></svg>';

// Instellingsvariabelen
// JS variabele                  beginwaarde          xsl parameter         menu-inputnaam  cookie
// -----------------------------------------------------------------------------------------------------------------------------------------------------
// naam (parameter in functies)                       HuidigPersoon         nvt             LaatstePersoon
// voornaamweergave             @voornaam             parToonVoornaam       voornaam        LaatsteVoornaamweergave     1 = roepnaam;             2 = volledige voornamen
// bronweergave                                       parToonBron           bronnen         LaatsteBronweergave         1 = niet weergeven;       2 = wel weergeven
// getuigeweergave                                    parToonGetuige        getuigen        LaatsteGetuigeweergave      1 = niet weergeven;       2 = wel weergeven
// notitieweergave                                    parToonNotitie        notities        LaatsteNotitieweergave      1 = niet weergeven;       2 = wel weergeven
// feitenweergave                                     parToonFeiten         feiten          LaatsteFeitenweergave       1 = niet weergeven;       2 = wel weergeven
// voettekstweergave            @footer               parToonVoettekst      voettekst       LaatsteVoettekstweergave    1 = niet weergeven;       2 = wel weergeven
// pkvoettekstweergave          @footer               parToonPKVoettekst    pkvoettekst     LaatstePKVoettekstweergave  1 = niet weergeven;       2 = wel weergeven
// sorteersleutel                                     parSortKey            sorteren        LaatsteSortKey              1 = naam, datum;          2 = datum, naam;          3 = leeftijd, datum, naam;  4 = overig
// fotoaantal                                         parFotoAantal         fotos           LaatsteFotoAantal           1 = geen;                 2 = max. 1 per persoon;   3 = alle
// diaweergave                  @diavolgorde          parDiaVolgorde        diavolgorde     LaatsteDiaVolgorde          1 = willekeurig;          2 = op volgorde
// diaduur                      @diaduur              parDiaDuur            diaduurInput    LaatsteDiaDuur              tijd in secondes
// nrkolommen                   @nrkol                parNrKol              kolommen        LaatsteNrKol                1 = eenkoloms;            2 = meerkoloms
// max_nr_photos_pp                                   parMaxPhotos          nvt             nvt                         maximaal aantal foto's per persoon; berekening stop zodra persoon met meer dan 1 foto gevonden
// startxsl                     @startxsl             nvt                   nvt             nvt                         0 = welkom-pagina;        1 = persoonskaart
// nrgeneraties                 @nrgen                parNrGeneraties       generaties      LaatsteNrGeneraties         aantal generaties in grafisch nageslacht (0 = geen beperking)
// naamweergave                 @naam                 parToonNaam           naam            LaatsteNaamweergave         1 = Voornaam Achternaam;  2 = Achternaam, Voornaam
// sorteersleutelmedia                                parSortKeyMedia       nvt             LaatsteSortKeyMedia         1 = omschrijving;         2 = fotonaam;             3 = naam
// nieuwsweergave               @nieuws               parToonNieuws         nvt             nvt                         0 = niet weergeven;       1 = wel weergeven
// controleweergave             @controle             parToonControle       nvt             nvt                         0 = niet weergeven;       1 = wel weergeven
// kalenderweergave             @kalender             parToonKalender       nvt             nvt                         0 = niet weergeven;       1 = wel weergeven
// histkalweergave              @histkal              parToonHistKalender   nvt             nvt                         0 = niet weergeven;       1 = wel weergeven
// personenweergave             @personen             parToonPersonen       nvt             nvt                         0 = niet weergeven;       1 = wel weergeven (lijst van alle personen)
// nrgenkwartier                @kwartier             parNrGenKwartier      nvt             nvt                         0 = niet weergeven;       n = aantal generaties in kwartierstaat tekst
// nrgenparenteel               @parenteel            parNrGenParenteel     nvt             nvt                         0 = niet weergeven;       n = aantal generaties in parenteel tekst
// nrmaandenmutatie             @mutatie              parNrMaandenMutatie   nvt             nvt                         0 = niet weergeven;       n = aantal maanden sinds mutatie (mutatieoverzicht)
// huwelijkweergave             @huwelijk             parToonHuwelijk       nvt             nvt                         0 = niet weergeven;       1 = wel weergeven
// relatieverwantweergave       @relatieverwant       parRelatieVerwant     nvt             nvt                         0 = niet weergeven;       1 = wel weergeven
// memoryweergave               @memory               parToonMemory         nvt             nvt                         0 = niet weergeven;       1 = wel weergeven
// taal                                               parTaal               nvt             LaatsteTaal
// pkkaartweergave              @kaartpk              parToonPKKaart        nvt             nvt                         0 = niet weergeven;       1 = wel weergeven
// ovzkaartweergave             @kaartovz             parToonOvzKaart       nvt             nvt                         0 = niet weergeven;       1 = wel weergeven
// sortnaamweergave             @sortnaam             parToonSortnaam       sortnaam        LaatsteSortnaam             0 = Achternaam;           1 = Sortnaam
//
var voornaamweergave = 2;
var bronweergave = 2;
var getuigeweergave = 2;
var notitieweergave = 2;
var feitenweergave = 2;
var voettekstweergave = 1;
var pkvoettekstweergave = 1;
var sorteersleutel = 1;
var vorigesorteersleutel = 0;
var sortorder = 0;
var fotoaantal = 3;
var diaweergave = 1;
var diaduur = 4;
var nrkolommen = 1;
var nrgeneraties = 5;
var naamweergave = 1;
var sorteersleutelmedia = 1;

var stuurfooter = 1;
var stuurvoornaam = 1;
var stuurdiavolgorde = 1;
var stuurdiaduur = 1;
var stuursorteersleutel = 1;
var stuuraantalkolommen = 1;
var stuurnaam = 1;
var toonduits = 1;
var toonengels = 1;
var toonfrans = 1;
var toonfries = 1;
var toonnoors = 1;
var toonspaans = 1;
var toonitaliaans = 1;
var toonportugees = 1;
var aktetekstnl = "";
var akteteksten = "";
var aktetekstfr = "";
var aktetekstdu = "";
var aktetekstfy = "";
var aktetekstno = "";
var aktetekstes = "";
var aktetekstit = "";
var aktetekstpt = "";

var max_nr_photos_pp = 0;
var strBeginPersoon;
var thismonth;
var thisday;
var refOwner="";
var refOwnerEMail="";
var refCopyright="";
var nieuwsweergave = 1;
var controleweergave = 1;
var kalenderweergave = 1;
var tekstovl="";
var histkalweergave = 1;
var personenweergave = 1;
var nrgenkwartier = 5;
var nrgenparenteel = 5;
var nrmaandenmutatie = 12;
var huwelijkweergave = 1;
var relatieverwantweergave = 1;
var memoryweergave = 0;
var taal = 'nederlands';
var pkkaartweergave = 1;
var ovzkaartweergave = 1;
var sortnaamweergave = 0;

// ================================== XPATH methodes =================================================

// XPATH methodes
if( document.implementation.hasFeature("XPath", "3.0") )
{
  // Opera fix
  // It appears that Opera doesn't have the XMLDocument object type, and the oXml.responseXML is infact Document
  if( typeof XMLDocument == "undefined" ){ XMLDocument = Document; }

  // prototying the XMLDocument
  XMLDocument.prototype.selectNodes = function(cXPathString, xNode)
  {
    if( !xNode ) { xNode = this; }
    var oNSResolver = this.createNSResolver(this.documentElement)
    var aItems = this.evaluate(cXPathString, xNode, oNSResolver, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null)
    var aResult = [];
    for( var i = 0; i < aItems.snapshotLength; i++)
    { 
      aResult[i] =  aItems.snapshotItem(i);
    }
    return aResult;
  }
  // prototying the Element
  Element.prototype.selectNodes = function(cXPathString)
  {
    if (iAmChrome)
    {
      var oEvaluator = new XPathEvaluator(); 
      var oResult = oEvaluator.evaluate(cXPathString, this, NSResolver, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null); 
      if (oResult != null)
      {
        var bResult = [];
        for( var i = 0; i < oResult.snapshotLength; i++)
        { 
          bResult[i] =  oResult.snapshotItem(i);
        }
        return bResult; 
      }
      else
      {
        throw "For XML Elements Only";
      }
    }
    else
    {
      if(this.ownerDocument.selectNodes)
      {
        return this.ownerDocument.selectNodes(cXPathString, this);
      }
      else
      {
        throw "For XML Elements Only";
      }
    }
  }
}
// check for XPath implementation
if( document.implementation.hasFeature("XPath", "3.0") )
{
  // Opera fix
  // It appears that Opera doesn't have the XMLDocument object type, and the oXml.responseXML is infact Document
  if( typeof XMLDocument == "undefined" ){ XMLDocument = Document; }

  // prototying the XMLDocument
  XMLDocument.prototype.selectSingleNode = function(cXPathString, xNode)
  {
    if( !xNode ) { xNode = this; }
    var xItems = this.selectNodes(cXPathString, xNode);
    if( xItems.length > 0 )
    {
      return xItems[0];
    }
    else
    {
      return null;
    }
  }
  // prototying the Element
  Element.prototype.selectSingleNode = function(cXPathString)
  {
    if (iAmChrome)
    {
      var oEvaluator = new XPathEvaluator(); 
      var oResult = oEvaluator.evaluate(cXPathString, this, NSResolver, XPathResult.FIRST_ORDERED_NODE_TYPE, null); 
      if (oResult != null)
      { 
        return oResult.singleNodeValue; 
      }
      else
      {
        throw "For XML Elements Only";
      }
    }
    else
    {
      if(this.ownerDocument.selectSingleNode)
      {
        return this.ownerDocument.selectSingleNode(cXPathString, this);
      }
      else
      {
        throw "For XML Elements Only";
      }
    }
  }
}
// ================================== Einde XPATH methodes =================================================

//  =========================== Stylesheet afhandeling =====================
// KiesXSL
// DoToon1
// DoToon2
// DoToon3
// ToonPersoon1
// ToonPersoon2
// ToonPersoon3
// DoTransform
// ImportStylesheet
// IEImportStylesheet
// FireFoxImportStylesheet
// VorigeKaart
// ToonResultaat
// ToonPersoonsKaart

function KiesXSL(what,naam,keyword1,keyword2)
{
  isSVG = false;
  slideShowRunning = false;

  vorigeWhat[iHistCnt]     = what
  vorigeNaam[iHistCnt]     = naam;
  vorigePage[iHistCnt]     = null;
  vorigeKeyword1[iHistCnt] = keyword1;
  vorigeKeyword2[iHistCnt] = keyword2;

  iHistCnt++;

  printOpmaak = 0;
  if (what > 1000)
  {
      what = what - 1000;
      printOpmaak = 1;
  }
  switch(what)
  {
    case 1:   DoToon1(naam, "Bin/Lijsten.xsl");             break;
    case 2:   DoToon1(naam, "Bin/Statistiek.xsl");          break;
    case 3:   DoToon1(naam, "Bin/Media.xsl");               break;
    case 4:   DoToon1(naam, "Bin/ZoekPersoon.xsl");         break;
    case 5:   DoToon1(naam, "Bin/Help.xsl");                break;
    case 6:   DoToon1(naam, "Bin/Nageslacht.xsl");          break;
    case 7:   if (iAmIE) {DoToon1(naam, "Bin/PersoonskaartIE.xsl");} else {DoToon1(naam, "Bin/Persoonskaart.xsl");}; if (pkkaartweergave == 1) {KaartPersoon(naam);}  break;
    case 8:   DoToon1(naam, "Bin/Kwartieren.xsl");          break;
    case 9:   DoToon1(naam, "Bin/KleinKinderen.xsl");       break;
    case 10:  DoToon1(naam, "Bin/AchterKleinKinderen.xsl"); break;
    case 11:  DoToon1(naam, "Bin/GeenVader.xsl");           break;
    case 12:  DoToon1(naam, "Bin/GeenMoeder.xsl");          break;
    case 13:  DoToon1(naam, "Bin/GeenRelaties.xsl");        break;
    case 14:  DoToon1(naam, "Bin/AchternamenIndex.xsl");    break;
    case 15:  DoToon1(naam, "Bin/GeboorteplaatsenIndex.xsl"); if (ovzkaartweergave == 1) {MaakKaart('geboorte');} break;
    case 16:  DoToon1(naam, "Bin/VoornamenIndex.xsl");      break;
    case 17:  DoToon1(naam, "Bin/MeerOuders.xsl");          break;
    case 18:  DoToon1(naam, "Bin/Nieuws.xsl");              break;
    case 19:  DoToon1(naam, "Bin/WijzigInstellingen.xsl");              break;
    case 20:  if (iAmIE) {DoToon2(naam, "Bin/PersonenLijstIE.xsl", keyword1);} else {DoToon2(naam, "Bin/PersonenLijst.xsl", keyword1);}         break;
    case 21:  if (iAmIE) {DoToon2(naam, "Bin/AchternamenLijst.xsl", decodeURIComponent(escape(keyword1)));} else {DoToon2(naam, "Bin/AchternamenLijst.xsl", keyword1);};      break;
    case 22:  if (iAmIE) {DoToon2(naam, "Bin/VoornamenLijst.xsl", decodeURIComponent(escape(keyword1)));} else {DoToon2(naam, "Bin/VoornamenLijst.xsl", keyword1);};      break;
    case 23:  if (iAmIE) {DoToon2(naam, "Bin/GeboorteplaatsenLijst.xsl", decodeURIComponent(escape(keyword1)));} else {DoToon2(naam, "Bin/GeboorteplaatsenLijst.xsl", keyword1);};      break;
    case 24:  DoToon3(naam, "Bin/NageslachtGrafisch.xsl", keyword1, keyword2);    break;
    case 25:  DoToon2(naam, "Bin/LaatstGewijzigd.xsl", keyword1);    break;
    case 26:  DoToon2(naam, "Bin/NageslachtCirkel.xsl", keyword1);   break;
    case 27:  DoToon1(naam, "Bin/Voorpagina.xsl");		 		     break;
    case 28:  if (iAmIE) {DoToon2(naam, "Bin/RelatiesLijstIE.xsl", keyword1);} else {DoToon2(naam, "Bin/RelatiesLijst.xsl", keyword1);};      break;
    case 29:  DoToon3(naam, "Bin/VoorgeslachtGrafisch.xsl", keyword1, keyword2);    break;
    case 30:  DoToon2(naam, "Bin/AchternamenLetterIndex.xsl",keyword1);             break;
    case 31:  if (iAmIE) {DoToon3(naam, "Bin/GeslachtIE.xsl", keyword1, keyword2);} else {DoToon3(naam, "Bin/Geslacht.xsl", keyword1, keyword2);}; break;
    case 32:  if (iAmIE) {DoToon3(naam, "Bin/LevendIE.xsl",   keyword1, keyword2);} else {DoToon3(naam, "Bin/Levend.xsl",   keyword1, keyword2);}; break;
    case 33:  DoToon3(naam, "Bin/Overleden.xsl",keyword1, keyword2); break;
    case 34:  if (iAmIE) {DoToon2(naam, "Bin/KalendarIE.xsl", keyword1, keyword2);} else {DoToon2(naam, "Bin/Kalendar.xsl", keyword1, keyword2);}; break;
    case 35:  if (iAmIE) {DoToon3(naam, "Bin/GenealogieIE.xsl",keyword1,keyword2);} else {DoToon3(naam, "Bin/Genealogie.xsl",keyword1,keyword2);}; break;
    case 36:  DoToon3(naam, "Bin/KwartierenTekst.xsl",keyword1,keyword2); break;
    case 37:  DoToon3(naam, "Bin/StatDiagram.xsl",keyword1,keyword2); break;
    case 38:  DoToon3(naam, "Bin/Stamreeks.xsl",keyword1,keyword2); break;

    case 40:
              isSVG = true;
              DoToon1(naam, "Bin/Svg-5G-data.xsl");
              isSVG = false;
              DoToon1(naam, "Bin/Cirkel1G.xsl");
              SVGloadSVG();
              break;
    case 41:
              isSVG = true;
              DoToon1(naam, "Bin/Svg-5G-data.xsl");
              isSVG = false;
              DoToon1(naam, "Bin/Cirkel2G.xsl");
              SVGloadSVG();
              break;
    case 42:
              isSVG = true;
              DoToon1(naam, "Bin/Svg-5G-data.xsl");
              isSVG = false;
              DoToon1(naam, "Bin/Cirkel3G.xsl");
              SVGloadSVG();
              break;
    case 43:
              isSVG = true;
              DoToon1(naam, "Bin/Svg-5G-data.xsl");
              isSVG = false;
              DoToon1(naam, "Bin/Cirkel4G.xsl");
              SVGloadSVG();
              break;
    case 44:
              isSVG = true;
              DoToon1(naam, "Bin/Svg-5G-data.xsl");
              isSVG = false;
              DoToon1(naam, "Bin/Cirkel5G.xsl");
              SVGloadSVG();
              break;
    case 45:
              isSVG = true;
              DoToon1(naam, "Bin/Svg-6G-data.xsl");
              isSVG = false;
              DoToon1(naam, "Bin/Cirkel6G.xsl");
              SVGloadSVG();
              break;
    case 46:
              isSVG = true;
              DoToon1(naam, "Bin/Svg-7G-data.xsl");
              isSVG = false;
              DoToon1(naam, "Bin/Cirkel7G.xsl");
              SVGloadSVG();
              break;
    case 50:
              isSVG = true;
              DoToon1(naam, "Bin/Svg-5G-data.xsl");
              isSVG = false;
              DoToon2(naam, "Bin/Sier5G.xsl", keyword1);
              SVGloadSVG();
              break;
    case 51:
              isSVG = true;
              DoToon1(naam, "Bin/Svg-6G-data.xsl");
              isSVG = false;
              DoToon2(naam, "Bin/Sier6G.xsl", keyword1);
              SVGloadSVG();
              break;
    case 52:
              isSVG = true;
              DoToon1(naam, "Bin/Svg-5G-data-noplace.xsl");
              isSVG = false;
              DoToon1(naam, "Bin/HourGlass.xsl");
              SVGloadSVG();
              break;
    case 55:
              isSVG = true;
              DoToon1(naam, "Bin/Svg-5G-data.xsl");
              isSVG = false;
              DoToon1(naam, "Bin/Waaier-5G.xsl");
              SVGloadSVG();
              break;
    case 56:
              isSVG = true;
              DoToon1(naam, "Bin/Svg-6G-data.xsl");
              isSVG = false;
              DoToon1(naam, "Bin/Waaier-6G.xsl");
              SVGloadSVG();
              break;
    case 57:
              isSVG = true;
              DoToon1(naam, "Bin/Svg-7G-data.xsl");
              isSVG = false;
              DoToon1(naam, "Bin/Waaier-7G.xsl");
              SVGloadSVG();
              break;
    case 58:
              isSVG = true;
              DoToon1(naam, "Bin/Svg-8G-data.xsl");
              isSVG = false;
              DoToon1(naam, "Bin/Waaier-8G.xsl");
              SVGloadSVG();
              break;
    case 59:
              isSVG = true;
              DoToon1(naam, "Bin/Svg-9G-data.xsl");
              isSVG = false;
              DoToon1(naam, "Bin/Waaier-9G.xsl");
              SVGloadSVG();
              break;
              
    case 60:  DoToon1(naam, "Bin/DoopplaatsenIndex.xsl"); if (ovzkaartweergave == 1) {MaakKaart('doop');} break;
    case 61:  if (iAmIE) {DoToon2(naam, "Bin/DoopplaatsenLijst.xsl", decodeURIComponent(escape(keyword1)));} else {DoToon2(naam, "Bin/DoopplaatsenLijst.xsl", keyword1);};      break;
    case 62:  DoToon1(naam, "Bin/OverlijdensplaatsenIndex.xsl"); if (ovzkaartweergave == 1) {MaakKaart('overlijden');} break;
    case 63:  if (iAmIE) {DoToon2(naam, "Bin/OverlijdensplaatsenLijst.xsl", decodeURIComponent(escape(keyword1)));} else {DoToon2(naam, "Bin/OverlijdensplaatsenLijst.xsl", keyword1);};      break;
    case 64:  DoToon1(naam, "Bin/BegrafenisplaatsenIndex.xsl"); if (ovzkaartweergave == 1) {MaakKaart('begrafenis');} break;
    case 65:  if (iAmIE) {DoToon2(naam, "Bin/BegrafenisplaatsenLijst.xsl", decodeURIComponent(escape(keyword1)));} else {DoToon2(naam, "Bin/BegrafenisplaatsenLijst.xsl", keyword1);};      break;
    case 66:  DoToon1(naam, "Bin/WoonplaatsenIndex.xsl"); if (ovzkaartweergave == 1) {MaakKaart('woon');} break;
    case 67:  if (iAmIE) {DoToon2(naam, "Bin/WoonplaatsenLijst.xsl", decodeURIComponent(escape(keyword1)));} else {DoToon2(naam, "Bin/WoonplaatsenLijst.xsl", keyword1);};      break;
    case 68:
              isSVG = true;
              DoToon1(naam, "Bin/Svg-5G-data.xsl");
              isSVG = false;
              DoToon1(naam, "Bin/Sier4G.xsl");
              SVGloadSVG();
              break;
    case 69:
              isSVG = true;
              DoToon1(naam, "Bin/Svg-7G-data.xsl");
              isSVG = false;
              DoToon2(naam, "Bin/Sier7G.xsl", keyword1);
              SVGloadSVG();
              break;
    
    case 81:  DoToon3(naam, "Bin/FotoGalerij.xsl",keyword1,keyword2); break;
    case 87:  DoToon1(naam, "Bin/VandaagIn.xsl"); break;
    case 88:  DoToon1(naam, "Bin/GebeurtenisKalender.xsl"); break;
    case 89:  DoToon1(naam, "Bin/HistKalender.xsl"); break;
    case 90:  DoToon1(naam, "Bin/KinAchternamenIndex.xsl"); break;
    case 91:  if (iAmIE) {DoToon2(naam, "Bin/KinAchternamenLijst.xsl", decodeURIComponent(escape(keyword1)));} else {DoToon2(naam, "Bin/KinAchternamenLijst.xsl", keyword1);};      break;
    case 92:  DoToon2(naam, "Bin/KinBerekening.xsl", keyword1); break;
    case 93:  DoToon1(naam, "Bin/KinBerekeningRelaties.xsl");             break;
    case 94:  DoToon1(naam, "Bin/Diavoorstelling.xsl");
              diavoorstelling(naam); break;
    case 95:  DoToon1(naam, "Bin/Memory.xsl");
              memory(naam);
              iTotaalFotoCnt = 0;    break;
    case 96:  DoToon1(naam, "Bin/RelatieplaatsenIndex.xsl"); if (ovzkaartweergave == 1) {MaakKaart('relatie');} break;
    case 97:  if (iAmIE) {DoToon2(naam, "Bin/RelatieplaatsenLijst.xsl", decodeURIComponent(escape(keyword1)));} else {DoToon2(naam, "Bin/RelatieplaatsenLijst.xsl", keyword1);};      break;

    default:  alert("Geen XSL opgegeven voor " + what); break;
  }
}

function DoToon1(naam, newstylesheet)
{
  if (ImportStylesheet(newstylesheet) != 0)
      return;
  ToonPersoon1(naam);
}

function DoToon2(naam, newstylesheet, keyword)
{
  if (ImportStylesheet(newstylesheet) != 0)
      return;
  ToonPersoon2(naam, keyword)
}

function DoToon3(naam, newstylesheet, keyword1, keyword2)
{
  if (ImportStylesheet(newstylesheet) != 0)
      return;
  ToonPersoon3(naam, keyword1, keyword2)
}

function ToonPersoon3(naam, keyword1, keyword2)
{
  setParameter("LijstWoord",keyword1);
  setParameter("Key2",keyword2);
  ToonPersoon1(naam);
}

function ToonPersoon2(naam, keyword)
{
  setParameter("LijstWoord",keyword);
  ToonPersoon1(naam);
}

function ToonPersoon1(naam)
{
  setParameter("HuidigPersoon",naam);
  setParameter("Browser",iAmIE ? "IE" : iAmOp ? "OP" : iAmChrome ? "Chrome" : iAmSafari ? "Safari" : "FF");
  setParameter("parIEGui",iAmMetro ? "METRO" : "DESKTOP");
  setParameter("Printing",printOpmaak ? "1" : "0");
  setParameter("parToonVoornaam",voornaamweergave);
  setParameter("parToonBron",bronweergave);
  setParameter("parToonGetuige",getuigeweergave);
  setParameter("parToonNotitie",notitieweergave);
  setParameter("parToonFeiten",feitenweergave);
  setParameter("parToonVoettekst",voettekstweergave);
  setParameter("parToonPKVoettekst",pkvoettekstweergave);
  setParameter("parSortKey",sorteersleutel);
  setParameter("parFotoAantal",fotoaantal);
  setParameter("parDiaVolgorde",diaweergave);
  setParameter("parDiaDuur",diaduur);
  setParameter("parNrKol",nrkolommen);
  setParameter("parMaxPhotos",max_nr_photos_pp);
  setParameter("parNrGeneraties",nrgeneraties);
  setParameter("parToonNaam",naamweergave);
  setParameter("parSortKeyMedia",sorteersleutelmedia);
  setParameter("parThisMonth",thismonth);
  setParameter("parThisDay",thisday);
  setParameter("parRefOwner",refOwner);
  setParameter("parRefOwnerEMail",refOwnerEMail);
  setParameter("parRefCopyright",refCopyright);
  setParameter("parToonNieuws",nieuwsweergave);
  setParameter("parToonControle",controleweergave);
  setParameter("parToonKalender",kalenderweergave);
  setParameter("parFolderFotoAlbum",fotomap);
  setParameter("parTekstOvl",tekstovl);
  setParameter("parStuurFooter",stuurfooter);
  setParameter("parStuurVoornaam",stuurvoornaam);
  setParameter("parStuurDiaVolgorde",stuurdiavolgorde);
  setParameter("parStuurDiaDuur",stuurdiaduur);
  setParameter("parStuurSorteersleutel",stuursorteersleutel);
  setParameter("parStuurAantalKolommen",stuuraantalkolommen);
  setParameter("parStuurNaam",stuurnaam);
  setParameter("parToonHistKalender",histkalweergave);
  setParameter("parToonPersonen",personenweergave);
  setParameter("parNrGenKwartier",nrgenkwartier);
  setParameter("parNrGenParenteel",nrgenparenteel);
  setParameter("parNrMaandenMutatie",nrmaandenmutatie);
  setParameter("parToonHuwelijk",huwelijkweergave);
  setParameter("parToonRelatieVerwant",relatieverwantweergave);
  setParameter("parToonMemory",memoryweergave);
  setParameter("parTaal",taal);
  setParameter("parToonDuits",toonduits);
  setParameter("parToonEngels",toonengels);
  setParameter("parToonFrans",toonfrans);
  setParameter("parToonFries",toonfries);
  setParameter("parToonNoors",toonnoors);
  setParameter("parToonSpaans",toonspaans);
  setParameter("parToonItaliaans",toonitaliaans);
  setParameter("parToonPortugees",toonportugees);
  setParameter("parAkteNL",aktetekstnl);
  setParameter("parAkteEN",akteteksten);
  setParameter("parAkteFR",aktetekstfr);
  setParameter("parAkteDU",aktetekstdu);
  setParameter("parAkteFY",aktetekstfy);
  setParameter("parAkteNO",aktetekstno);
  setParameter("parAkteES",aktetekstes);
  setParameter("parAkteIT",aktetekstit);
  setParameter("parAktePT",aktetekstpt);
  setParameter("parToonPKKaart",pkkaartweergave);
  setParameter("parToonOvzKaart",ovzkaartweergave);
  setParameter("parToonSortnaam",sortnaamweergave);
  var sortering = sortorder;
  if (sorteersleutel == 34)
     sortering = 1 - sortering;
  setParameter("parSortOrder", sortering ? 'aflopend' : 'oplopend');

  setCookie('LaatstePersoon' + xml_bestand,naam);

  if (wijzigSortering == 1 && vorigeWhat[iHistCnt-1] == 4)   //Zoeken
    Zoeken()
  else
    DoTransform();
}

function ReplaceSortKey(n, selectattr, datatypeattr, orderattr)
{
  if (!(vorigeWhat[iHistCnt-1] == 4))	// omdat het template achternamenletters nu in ZoekPersoon.xsl is opgenomen; anders worden de eerste letters van de achternaam niet goed gesorteerd
  {
    var nodeAlleSorts = stylesheet.selectNodes("//xsl:sort");
    if (nodeAlleSorts != null)
    {
      //alert( "Dit werkt, aantal xsl:sort nodes: " + nodeAlleSorts.length );
      for (i=0;i<nodeAlleSorts.length;i++)
      {
        var nodeSelect = nodeAlleSorts[i].selectSingleNode("@select");
        var nodeOrder  = nodeAlleSorts[i].selectSingleNode("@order");
        var nodeType   = nodeAlleSorts[i].selectSingleNode("@data-type");
        if (i == (n-1))
        {
           if (nodeSelect != null && selectattr != null)
               nodeSelect.nodeValue = selectattr;
           if (nodeType != null && datatypeattr != null)
               nodeType.nodeValue = datatypeattr;
           if (nodeOrder != null && orderattr != null)
           {
              if (orderattr == 0)
                 nodeOrder.nodeValue = 'ascending';
              else
                 nodeOrder.nodeValue = 'descending';
           }
           break;
        }
      }
    }
  }
}

function SetSortKeys(testOpVorige)
{
    var sortorderGezet = 0;
    if (wijzigSortering == 0)
        vorigesorteersleutel = -1;

    if (testOpVorige)
    {
      switch (vorigeWhat[iHistCnt-1])
      {
      case  3:  // media
          sorteersleutel = sorteersleutelmedia = wijzigSortering ? sorteersleutelmedia : 39;
          break;
      case  4:  // zoekpersoon
          if (wijzigSortering == 0)
          {
             sorteersleutel = 38;
             sortorder = 1;
             sortorderGezet = 1;
          }
          break;
      case  9:  // kleinkinderen
      case 10:  // achterkleinkinderen
      case 11:  // geenvader
      case 12:  // geenmoeder
      case 13:  // geen relaties
      case 17:  // MeerOuder
      case 20:  // Personen lijst
      case 21:  // achternamen lijst
      case 22:  // roepnamen list
      case 23:  // Birth @place list
      case 31:  // Gelacht M/V
      case 32:  // Levende
      case 33:  // Overledene
      case 67:  // woonplaatsen lijst
      case 91:  // KinAchternamenLijst
          sorteersleutel = wijzigSortering ? sorteersleutel : 1;
          break;
      case 14:  // achternamen index
      case 30:  // achternamenletter index
      case 90:  // KinAchternamenindex
          sorteersleutel = wijzigSortering ? sorteersleutel : 19;
          break;
      case 16:  // roepnamen index
          sorteersleutel = wijzigSortering ? sorteersleutel : 21;
          break;
      case 15:  // Birth @place index
          sorteersleutel = wijzigSortering ? sorteersleutel : 5;
          break;
      case 25:  // Laatst gewijzigd
          if (wijzigSortering == 0)
          {
             sorteersleutel = 27;
             sortorder = 1;
             sortorderGezet = 1;
          }
         break;
      case 28:  // relaties list
          sorteersleutel = wijzigSortering ? sorteersleutel : iAmIE ? 34 : 33;
         break;
      case 60:  // Bapt @place index
          sorteersleutel = wijzigSortering ? sorteersleutel : 7;
          break;
      case 61:  // Bapt @place list
          sorteersleutel = wijzigSortering ? sorteersleutel : 11;
         break;
      case 62:  // deat @place index
          sorteersleutel = wijzigSortering ? sorteersleutel : 9;
          break;
      case 63:  // deat @place list
          sorteersleutel = wijzigSortering ? sorteersleutel : 13;
         break;
      case 64:  // buri @place index
          sorteersleutel = wijzigSortering ? sorteersleutel : 15;
          break;
      case 65:  // buri @place list
          sorteersleutel = wijzigSortering ? sorteersleutel : 17;
         break;
      case 66:  // woonplaatsen index
          sorteersleutel = wijzigSortering ? sorteersleutel : 24;
         break;
      case 96:  // relatieplaatsen index
          sorteersleutel = wijzigSortering ? sorteersleutel : 41;
         break;
      case 97:  // relaties list
          sorteersleutel = wijzigSortering ? sorteersleutel : 31;
         break;
      default:
         sortorder = 0;
         return; // niets te doen
      }
    }

    if (!sortorderGezet)
    {
      if (vorigesorteersleutel == sorteersleutel)
          sortorder = 1 - sortorder;
      else
          sortorder = 0;     // ascending

      if (wijzigSortering == 0)
          sortorder = 0;     // ascending
    }

    // Sorteren op de naam
    switch (sorteersleutel)
    {
    case 1:      // Gebruikt in Geboorteplaatsen,Woonplaatsen, voornamen lijst
    case 11:     // Gebruikt in doopplaatsen lijst
    case 13:     // Gebruikt in overlijdensplaatsen lijst
    case 17:     // Gebruikt in begrafenisplaatsen lijst
    case 28:     // Gebruikt in relaties lijst
      sorteerOpNaamWeergave(1);
      var date1,date2;
      if (sorteersleutel == 1)
      {
         date1 = 'BIRTH';
         date2 = 'BAPT';
      }
      else if (sorteersleutel == 11)
      {
         date1 = 'BAPT';
         date2 = 'BIRTH';
      }
      else if (sorteersleutel == 13)
      {
         date1 = 'DEATH';
         date2 = 'BURI';
      }
      else
      {
         date1 = 'BURI';
         date2 = 'DEATH';
      }
      ReplaceSortKey(4,'concat(substring(EVENTS/'+date1+'/@date,string-length(EVENTS/'+date1+'/@date)-3,4),substring(EVENTS/'+date1+'/@date,4,2),substring(EVENTS/'+date1+'/@date,1,2),substring(EVENTS/'+date2+'/@date,string-length(EVENTS/'+date2+'/@date)-3,4),substring(EVENTS/'+date2+'/@date,4,2),substring(EVENTS/'+date2+'/@date,1,2))',null,sortorder);
      break;

    case 2:     // Gebruikt in geboorteplaatsen lijst
    case 12:    // Gebruikt in doopplaatsen lijst
    case 14:    // Gebruikt in overlijdensplaatsen lijst
    case 18:    // Gebruikt in overlijdensplaatsen lijst
	  var date1,date2;
	  if (sorteersleutel == 2)
	  {
           date1 = 'BIRTH';
           date2 = 'BAPT';
	  }
	  else if (sorteersleutel == 12)
	  {
           date1 = 'BAPT';
           date2 = 'BIRTH';
	  }
	  else if (sorteersleutel == 14)
	  {
           date1 = 'DEATH';
           date2 = 'BURI';
	  }
	  else
	  {
           date1 = 'BURI';
           date2 = 'DEATH';
	  }
	  ReplaceSortKey(1,'concat(substring(EVENTS/'+date1+'/@date,string-length(EVENTS/'+date1+'/@date)-3,4),substring(EVENTS/'+date1+'/@date,4,2),substring(EVENTS/'+date1+'/@date,1,2),substring(EVENTS/'+date2+'/@date,string-length(EVENTS/'+date2+'/@date)-3,4),substring(EVENTS/'+date2+'/@date,4,2),substring(EVENTS/'+date2+'/@date,1,2))',null,sortorder);
	  sorteerOpNaamWeergave(2);
	  break;

    case 3:   // Gebruikt in o.a. personen lijst, en geslacht
	  ReplaceSortKey(1,'PERSONAL/@age','number',sortorder);
	  ReplaceSortKey(2,'PERSONAL/@of','text',1-sortorder);
	  ReplaceSortKey(3,'concat(substring(EVENTS/BIRTH/@date,string-length(EVENTS/BIRTH/@date)-3,4),substring(EVENTS/BIRTH/@date,4,2),substring(EVENTS/BIRTH/@date,1,2),substring(EVENTS/BAPT/@date,string-length(EVENTS/BAPT/@date)-3,4),substring(EVENTS/BAPT/@date,4,2),substring(EVENTS/BAPT/@date,1,2))','text',1-sortorder);
	  sorteerOpNaamWeergave(4);
      break;

   case 5:  // Gebruikt in o.a. geboorteplaatsen index
	  ReplaceSortKey(1,'EVENTS/BIRTH/@place','text',sortorder);
	  ReplaceSortKey(2,"count(key('items-index',EVENTS/BIRTH/@place))",'number',sortorder);
	  break;

   case 6:  // Gebruikt in o.a. geboorteplaatsen index
  	  ReplaceSortKey(1,"count(key('items-index',EVENTS/BIRTH/@place))",'number',sortorder);
  	  ReplaceSortKey(2,'EVENTS/BIRTH/@place','text',sortorder);
  	  break;
  	  
   case 7:  // Gebruikt in o.a. doopplaatsen index
  	  ReplaceSortKey(1,'EVENTS/BAPT/@place','text',sortorder);
  	  ReplaceSortKey(2,"count(key('items-index',EVENTS/BAPT/@place))",'number',sortorder);
  	  break;

   case 8:  // Gebruikt in o.a. doopplaatsen index
  	  ReplaceSortKey(1,"count(key('items-index',EVENTS/BAPT/@place))",'number',sortorder);
  	  ReplaceSortKey(2,'EVENTS/BAPT/@place','text',sortorder);
  	  break;
   
   case 9:  // Gebruikt in o.a. overlijdensplaatsen index
  	  ReplaceSortKey(1,'EVENTS/DEATH/@place','text',sortorder);
  	  ReplaceSortKey(2,"count(key('items-index',EVENTS/DEATH/@place))",'number',sortorder);
  	  break;

   case 10:  // Gebruikt in o.a. overlijdensplaatsen index
  	  ReplaceSortKey(1,"count(key('items-index',EVENTS/DEATH/@place))",'number',sortorder);
  	  ReplaceSortKey(2,'EVENTS/DEATH/@place','text',sortorder);
  	  break;

   case 15:  // Gebruikt in o.a. begrafenisplaatsen index
  	  ReplaceSortKey(1,'EVENTS/BURI/@place','text',sortorder);
  	  ReplaceSortKey(2,"count(key('items-index',EVENTS/BURI/@place))",'number',sortorder);
  	  break;

   case 16:  // Gebruikt in o.a. begrafenisplaatsen index
  	  ReplaceSortKey(1,"count(key('items-index',EVENTS/BURI/@place))",'number',sortorder);
  	  ReplaceSortKey(2,'EVENTS/BURI/@place','text',sortorder);
  	  break;

   case 19:  // Gebruikt in o.a. achternamen index, KinachternamenIndex
  	  ReplaceSortKey(1,'PERSONAL/NAME/@surn','text',sortorder);
  	  ReplaceSortKey(2,"count(key('items-index',PERSONAL/NAME/@surn))",'number',sortorder);
  	  break;

   case 20:  // Gebruikt in o.a. achternamen index
  	  ReplaceSortKey(1,"count(key('items-index',PERSONAL/NAME/@surn))",'number',sortorder);
  	  ReplaceSortKey(2,'PERSONAL/NAME/@surn','text',sortorder);
  	  break;

   case 21:  // Gebruikt in o.a. roepnamen index
  	  ReplaceSortKey(1,'PERSONAL/NAME/@nick','text',sortorder);
  	  ReplaceSortKey(2,"count(key('items-index',PERSONAL/NAME/@nick))",'number',sortorder);
  	  break;

   case 22:  // Gebruikt in o.a. roepnamen index
  	  ReplaceSortKey(1,"count(key('items-index',PERSONAL/NAME/@nick))",'number',sortorder);
  	  ReplaceSortKey(2,'PERSONAL/NAME/@nick','text',sortorder);
  	  break;

   case 23:  // Gebruikt in o.a. woonplaatsen index
  	  ReplaceSortKey(1,"count(key('items-index',FACTS/FACT/ADDR/@city))",'number',sortorder);
  	  ReplaceSortKey(2,'FACTS/FACT/ADDR/@city','text',sortorder);
  	  break;

   case 24:  // Gebruikt in o.a. woonplaatsen index
  	  ReplaceSortKey(1,'FACTS/FACT/ADDR/@city','text',sortorder);
  	  ReplaceSortKey(2,"count(key('items-index',FACTS/FACT/ADDR/@city))",'number',sortorder);
  	  break;

   case 27:  // Gebruikt in o.a. Laatstgewijzigd lijst
   case 28:  // Gebruikt in o.a. Laatstgewijzigd lijst
          if (sorteersleutel == 27)
  	     ReplaceSortKey(1,'concat(substring(@chg,string-length(@chg)-3,4),substring(@chg,4,2),substring(@chg,1,2))','text',sortorder);
          else
  	     ReplaceSortKey(1,'concat(PERSONAL/NAME/@surn,PERSONAL/NAME/@first)','text',sortorder);
  	  ReplaceSortKey(2,'concat(substring(EVENTS/BIRTH/@date,string-length(EVENTS/BIRTH/@date)-3,4),substring(EVENTS/BIRTH/@date,4,2),substring(EVENTS/BIRTH/@date,1,2))','text',sortorder);
          if (sorteersleutel == 27)
  	     ReplaceSortKey(3,'concat(PERSONAL/NAME/@surn,PERSONAL/NAME/@first)','text',sortorder);
          else
  	     ReplaceSortKey(3,'concat(substring(@chg,string-length(@chg)-3,4),substring(@chg,4,2),substring(@chg,1,2))','text',sortorder);
  	  ReplaceSortKey(4,'concat(substring(EVENTS/DEATH/@date,string-length(EVENTS/DEATH/@date)-3,4),substring(EVENTS/DEATH/@date,4,2),substring(EVENTS/DEATH/@date,1,2))','text',sortorder);
          break;

   case 29:  // Gebruikt in o.a. Laatstgewijzigd lijst
   case 30:  // Gebruikt in o.a. Laatstgewijzigd lijst
          if (sorteersleutel == 29)
  	     ReplaceSortKey(1,'concat(substring(EVENTS/BIRTH/@date,string-length(EVENTS/BIRTH/@date)-3,4),substring(EVENTS/BIRTH/@date,4,2),substring(EVENTS/BIRTH/@date,1,2))','text',sortorder);
          else
  	     ReplaceSortKey(1,'concat(substring(EVENTS/DEATH/@date,string-length(EVENTS/DEATH/@date)-3,4),substring(EVENTS/DEATH/@date,4,2),substring(EVENTS/DEATH/@date,1,2))','text',sortorder);
  	  ReplaceSortKey(2,'concat(PERSONAL/NAME/@surn,PERSONAL/NAME/@first)','text',sortorder);
          if (sorteersleutel == 29)
  	     ReplaceSortKey(3,'concat(substring(EVENTS/DEATH/@date,string-length(EVENTS/DEATH/@date)-3,4),substring(EVENTS/DEATH/@date,4,2),substring(EVENTS/DEATH/@date,1,2))','text',sortorder);
          else
  	     ReplaceSortKey(3,'concat(substring(EVENTS/BIRTH/@date,string-length(EVENTS/BIRTH/@date)-3,4),substring(EVENTS/BIRTH/@date,4,2),substring(EVENTS/BIRTH/@date,1,2))','text',sortorder);
  	  ReplaceSortKey(4,'concat(substring(@chg,string-length(@chg)-3,4),substring(@chg,4,2),substring(@chg,1,2))','text',sortorder);
          break;
   case 31:  // Gebruikt in Relatieslijst (naam1)
   case 32:  // Gebruikt in Relatieslijst (naam2)
          sorteerOpNaamWeergaveRela(1);
          ReplaceSortKey(4,'concat(substring(BEGIN/@date,string-length(BEGIN/@date)-3,4),substring(BEGIN/@date,4,2),substring(BEGIN/@date,1,2))','text',sortorder);
          break;
   case 33:  // Gebruikt in Relatieslijst (datum)
   case 34:  // Gebruikt in Relatieslijst (duur)
          ReplaceSortKey(1,'concat(substring(BEGIN/@date,string-length(BEGIN/@date)-3,4),substring(BEGIN/@date,4,2),substring(BEGIN/@date,1,2))','text',sortorder);
          sorteerOpNaamWeergaveRela(2);
          break;
   case 35:  // Gebruikt in Relatieslijst (type)
          ReplaceSortKey(1,'@type*(10.4 - @type)*(10.4 - @type)','number',sortorder);
          ReplaceSortKey(2,'concat(substring(BEGIN/@date,string-length(BEGIN/@date)-3,4),substring(BEGIN/@date,4,2),substring(BEGIN/@date,1,2))','text',sortorder);
          break;
   case 36:  // Gebruikt in zoekpersoon
          ReplaceSortKey(1,'concat(substring(../../EVENTS/BIRTH/@date,string-length(../../EVENTS/BIRTH/@date)-3,4),substring(../../EVENTS/BIRTH/@date,4,2),substring(../../EVENTS/BIRTH/@date,1,2))','text',sortorder);
          sorteerOpNaamWeergaveRela(2);
          break;
   case 37:  // Gebruikt in zoekpersoon
          ReplaceSortKey(1,'concat(substring(../../EVENTS/DEATH/@date,string-length(../../EVENTS/DEATH/@date)-3,4),substring(../../EVENTS/DEATH/@date,4,2),substring(../../EVENTS/DEATH/@date,1,2))','text',sortorder);
          sorteerOpNaamWeergaveRela(2);
          break;
   case 38:  // Gebruikt in zoekpersoon
          sorteerOpNaamWeergaveRela(1);
          break;
   case 39:  // Gebruikt in media
          sorteerOpVoornaamWeergave(1,'../NAME/');
          ReplaceSortKey(3,'@title','text',sortorder);
          break;
   case 40:
          if (naamweergave == 1)
          {
            sorteerOpVoornaamWeergave(4,'../NAME/');
            ReplaceSortKey(5,'../NAME/@surn','text',sortorder);
            ReplaceSortKey(6,'../NAME/@pref','text',sortorder);
          }
          else if (naamweergave == 2)
          {
            ReplaceSortKey(4,'../NAME/@surn','text',sortorder);
            ReplaceSortKey(5,'../NAME/@pref','text',sortorder);
            sorteerOpVoornaamWeergave(6,'../NAME/');
          }
          break;
   case 41:  // Gebruikt in o.a. relatieplaatsen index
	  ReplaceSortKey(1,'BEGIN/@place','text',sortorder);
	  ReplaceSortKey(2,"count(key('items-index',BEGIN/@place))",'number',sortorder);
	  break;
   case 42:  // Gebruikt in o.a. geboorteplaatsen index
  	  ReplaceSortKey(1,"count(key('items-index',BEGIN/@place))",'number',sortorder);
  	  ReplaceSortKey(2,'BEGIN/@place','text',sortorder);
  	  break;
  	  

   default: // Doe maar niet
      break;
    }

   vorigesorteersleutel = sorteersleutel;
}

function sorteerOpNaamWeergave(vanaf)
{
  sorteerOpNaamWeergave2(vanaf, '')
}

function sorteerOpNaamWeergaveRela(vanaf)
{
  sorteerOpNaamWeergave2(vanaf, '../../')
}

function sorteerOpNaamWeergave2(vanaf, extraPad)
{
  if (naamweergave == 1)       // Voornaam Achternaam
  {
    sorteerOpVoornaamWeergave(vanaf,extraPad+'PERSONAL/NAME/');
    ReplaceSortKey(vanaf+1,''+extraPad+'PERSONAL/NAME/@surn','text',sortorder);
    ReplaceSortKey(vanaf+2,''+extraPad+'PERSONAL/NAME/@pref','text',sortorder);
  }
  else  // Achternaam, Voornaam
  {
    ReplaceSortKey(vanaf,''+extraPad+'PERSONAL/NAME/@surn','text',sortorder);
    ReplaceSortKey(vanaf+1,''+extraPad+'PERSONAL/NAME/@pref','text',sortorder);
    sorteerOpVoornaamWeergave(vanaf+2,extraPad+'PERSONAL/NAME/');
  }
}

function sorteerOpVoornaamWeergave(vanaf,extraPad)
{
  if (voornaamweergave == 1) // Roepnaam
    ReplaceSortKey(vanaf,'concat('+extraPad+'@nick,substring('+extraPad+'@first,100*string-length('+extraPad+'/@nick)))',null,sortorder);
  else // Voornamen eerst
    ReplaceSortKey(vanaf,'concat('+extraPad+'@first,substring('+extraPad+'@nick,100*string-length('+extraPad+'/@first)))',null,sortorder);
}

function DoTransform()
{
  var result;
  try
  {
    if (iAmIE)
    {
       // alert(stylesheet.src);
       result = source.transformNode(stylesheet.XMLDocument);
    }
    else if (iAmFF)
    {
      var resultDOC = xp.transformToDocument(source);
      result = xmls.serializeToString(resultDOC);
    }
    else if (iAmChrome || iAmSafari)
    {
      var resultDOC = xp.transformToDocument(source);
      result = xmls.serializeToString(resultDOC);
    }
  }
  catch (exception)
  {
      result = "Fout in transformNode: " + (exception.description?exception.description:exception.message);
      alert(result);
      if (iAmFF)
      {
          var node = document.getElementById("showHeader");
          node.innerHTML = "<p><b>FireFox snapt dit niet</b></p>";
      }
  }

  if (isSVG == true)
  {
     strSVG = result;
     // alert(strSVG.substring(100,500));
     isSVG = false;
  }
  else
  {
	  EndOfHeaderString1 = '"EndOfHeader"';
	  EndOfHeaderIndex1 = result.indexOf(EndOfHeaderString1);
	  if (EndOfHeaderIndex1 != -1)
	  {
	  	EndOfHeaderString2 = '</div>';
	  	EndOfHeaderIndex2 = result.substr(EndOfHeaderIndex1).indexOf(EndOfHeaderString2);
	  }
	  else
	  {
	  	EndOfHeaderIndex2 = -1;
	  }
	  if ((EndOfHeaderIndex1 != -1) && (EndOfHeaderIndex2 != -1))
	  {
		  result1 = result.substr(0, EndOfHeaderIndex1 + EndOfHeaderIndex2 + EndOfHeaderString2.length);
		  result2 = result.substr(EndOfHeaderIndex1 + EndOfHeaderIndex2 + EndOfHeaderString2.length);
	  }
	  else
	  {
		  result1 = '';
		  result2 = result;
	  }
    if (iAmFF)
    {
      // alert(result.substring(8000,10000));
//      result = result.replace(/&lt;br\/&gt;/g, "<br/>");
//      result = result.replace(/&lt;a /g, "<a ");
//      result = result.replace(/&lt;\/a&gt;/g, "</a>");
//      result = result.replace(/\"&gt;/g, "\">");
        result1 = result1.replace(/&lt;/g, "<");
        result1 = result1.replace(/&gt;/g, ">");
        result2 = result2.replace(/&lt;/g, "<");
        result2 = result2.replace(/&gt;/g, ">");

      var node1 = document.getElementById("showHeader");
      node1.innerHTML = result1;
      var node2 = document.getElementById("showBody");
      node2.innerHTML = result2;
    }
    else if (iAmIE)
    {
      showHeader.innerHTML = result1;
      showBody.innerHTML = result2;
    }
    else if (iAmChrome || iAmSafari)
    {
      var node1 = document.getElementById("showHeader");
      node1.innerHTML = result1;
      var node2 = document.getElementById("showBody");
      node2.innerHTML = result2;
	}
  }
  
  // Bewaar het resultaat
  vorigePage[iHistCnt-1]     = result;
}

function IEImportStylesheet(stylesheetName)
{
    stylesheet.async = false;
    stylesheet.validateOnParse=true;
    stylesheet.load(stylesheetName);
    if (stylesheet.parseError.errorCode != 0)
    {
      result = reportParseError(stylesheet.parseError);
      showHeader.innerHTML = result;
      return 1;
    }

    SetSortKeys(1); // Sortering aanpassen

    return 0;
}

function FireFoxImportStylesheet(stylesheetName)
{
    xp = new XSLTProcessor();
    try
    {
      stylesheet.async = false;
      stylesheet.validateOnParse=true;
      stylesheet.load(stylesheetName);
      SetSortKeys(1);                  // Sortering aanpassen
      nresult = xp.importStylesheet(stylesheet);
    }
    catch (exception)
    {
      result = "Fout tijdens importStylesheet: " + (exception.description?exception.description:exception.message);
      alert(result);
      var node = document.getElementById("showHeader");
      if (result.indexOf("Access to restricted URI denied") > 0)    // "NS_ERROR_DOM_BAD_URI"
          node.innerHTML = '<p><b>FireFox: Er is iets fout gegaan bij het importeren, ' +
                           'de oorzaak is dat een lokaal bestand wordt geladen.' +
                           '<br/><br/>FireFox 3.0 staat dit niet toe!</b></p>' + 
                            '<a href="javascript:history.go(0)">Terug naar het stamboombestand</a>';
      else
          node.innerHTML = "<p><b>FireFox: Er is iets fout gegaan bij het importeren van " + stylesheetName + "</b></p>";
      return 1;
    }
    return 0;
}

function ChromeImportStylesheet(stylesheetName)
{
    try
    {
    xp = new XSLTProcessor();
       var xmlhttp = new window.XMLHttpRequest(); 
       xmlhttp.open("GET",stylesheetName,false); 
       xmlhttp.send(null); 
       stylesheet = xmlhttp.responseXML.documentElement; 
      SetSortKeys(1);                  // Sortering aanpassen
      nresult = xp.importStylesheet(stylesheet);
    }
    catch (exception)
    {
      result = "Fout tijdens importStylesheet: " + (exception.description?exception.description:exception.message);
      alert(result);
      var node = document.getElementById("showHeader");
      if (result.indexOf("Access to restricted URI denied") > 0)    // "NS_ERROR_DOM_BAD_URI"
          node.innerHTML = '<p><b>Chrome / Safari: Er is iets fout gegaan bij het importeren, ' +
                           'de oorzaak is dat een lokaal bestand wordt geladen.' +
                           '<br/><br/>Chrome / Safari staat dit niet toe!</b></p>' + 
                            '<a href="javascript:history.go(0)">Terug naar het stamboombestand</a>';
      else
          node.innerHTML = "<p><b>Chrome / Safari: Er is iets fout gegaan bij het importeren van " + stylesheetName + "</b></p>";
      return 1;
    }
    return 0;
}

function ImportStylesheet(stylesheetName)
{
  if (iAmIE)
  {
    if (IEImportStylesheet(stylesheetName) != 0)
        return 1;
  }
  else if (iAmFF)
  {
    if (FireFoxImportStylesheet(stylesheetName) != 0)
        return 1;
  }
  else if (iAmChrome || iAmSafari)
  {
    if (ChromeImportStylesheet(stylesheetName) != 0)
        return 1;
  }
  return 0;
}

function getParameter(parameter, waarde)
{
  if (iAmIE)
  {
    node = stylesI.selectSingleNode("//xsl:variable[@name='" + parameter + "']");
    if (node)
    {
      //alert(parameter + '=' + node.text;
      return node.text;
    }
  }
  else if (iAmFF)
  {
    var nodeAlleSorts = stylesI.selectNodes("//xsl:variable[@name='" + parameter + "']");
    if (nodeAlleSorts != null)
    {
      for (i=0;i<nodeAlleSorts.length;i++)
      {
        var nodeSelect = nodeAlleSorts[i].selectSingleNode("@name");
        if (nodeSelect)
        {
           if (nodeSelect.nodeValue == parameter)
           {
              //alert(nodeSelect.nodeValue + '=' + nodeAlleSorts[i].textContent);
              return nodeAlleSorts[i].textContent;
           }
        }
      }
    }
  }
  return waarde;
}

function getParameterXML(NodeNaam, AttrNaam, waarde)
{
	var nodetmp = source.selectSingleNode("//INSTELLINGEN/" + NodeNaam);
	if (nodetmp != null)
	{
		var nodeattr = selectSingleNode(source,AttrNaam,nodetmp);
    	if (nodeattr != null)
	    {
    		return nodeattr.nodeValue;
	    }
	}
  return waarde;
}

function setParameter(parameter, waarde)
{
  if (iAmIE)
  {
    var node;
    node = stylesheet.selectSingleNode("//xsl:param[@name='" + parameter + "']");
    if (node != null)
        node.text = waarde;
  }
  else if (iAmFF || iAmChrome || iAmSafari)
  {
    xp.setParameter(null,parameter,waarde);
  }
}

function VorigeKaart()
{
  vorigesorteersleutel = 0;
  slideShowRunning = false;
  var iNextHistCnt = iHistCnt-2;

  if (iHistCnt < 1)
  {
     iHistCnt = iNextHistCnt = 0;
  }

  if (vorigeWhat[iNextHistCnt]>0)
  {
    iHistCnt = iNextHistCnt;
    if (vorigePage[iNextHistCnt]!=null &&
        vorigeWhat[iNextHistCnt] != 7 && 
        vorigeWhat[iNextHistCnt] != 15 && 
        vorigeWhat[iNextHistCnt] != 27 && 
        vorigeWhat[iNextHistCnt] != 60 && 
        vorigeWhat[iNextHistCnt] != 62 && 
        vorigeWhat[iNextHistCnt] != 64 && 
        vorigeWhat[iNextHistCnt] != 66 && 
        vorigeWhat[iNextHistCnt] != 94 && 
        vorigeWhat[iNextHistCnt] != 96 && 
        (vorigeWhat[iNextHistCnt] < 40 || vorigeWhat[iNextHistCnt] >= 60))
    {
      ToonResultaat(vorigePage[iNextHistCnt]);
      iHistCnt++;
    }
    else
    {
      // Uitzonderingen voor bewaarde history, o.a dia en svg en plaatskaarten
      KiesXSL(vorigeWhat[iNextHistCnt],vorigeNaam[iNextHistCnt],vorigeKeyword1[iNextHistCnt],vorigeKeyword2[iNextHistCnt]);
    }
  }
}

function ToonResultaat(strResult)
{
  // alert(result.substring(8000,10000));
	  EndOfHeaderString1 = '"EndOfHeader"';
	  EndOfHeaderIndex1 = strResult.indexOf(EndOfHeaderString1);
	  if (EndOfHeaderIndex1 != -1)
	  {
	  	EndOfHeaderString2 = '</div>';
	  	EndOfHeaderIndex2 = strResult.substr(EndOfHeaderIndex1).indexOf(EndOfHeaderString2);
	  }
	  else
	  {
	  	EndOfHeaderIndex2 = -1;
	  }
	  if ((EndOfHeaderIndex1 != -1) && (EndOfHeaderIndex2 != -1))
	  {
		  result1 = strResult.substr(0, EndOfHeaderIndex1 + EndOfHeaderIndex2 + EndOfHeaderString2.length);
		  result2 = strResult.substr(EndOfHeaderIndex1 + EndOfHeaderIndex2 + EndOfHeaderString2.length);
	  }
	  else
	  {
		  result1 = "";
		  result2 = strResult;
	  }
  if (iAmFF)
  {
    var node1 = document.getElementById("showHeader");
    var node2 = document.getElementById("showBody");
    node1.innerHTML = result1;
    node2.innerHTML = result2;
  }
  else
  {
    showHeader.innerHTML = result1;
    showBody.innerHTML = result2;
  }
}

function ToonPersoonsKaart(naam)
{
  KiesXSL(7,naam,'','',null,0);
}

//  =========================== Einde Stylesheet afhandeling =====================

// ============================ Laden instellingen en stamboom =====================
// laden
// IELeesInstellingen
// NSResolver
// FireFoxLeesInstellingen
// HaalCookiesOp

function laden(startPersoon)
{
  // Browser detectie
  var ua = navigator.userAgent.toLowerCase();
  if (ua.indexOf('opera/') != -1)
  {
     iAmOp = window.opera ? 1 : 0;
  }
  else if (ua.indexOf('chrome/') != -1)
  {
     iAmChrome = 1;
//     alert("Google Chrome ondersteunt de hier gebruikte functionaliteit helaas nog niet!");
     // source.load(xml_bestand) wordt nog niet ondersteund, wel native xml/xslt translatie
     // via de xsl die in de xml gekoppeld is. Open hiervoor rechtstreeks stamboom.xml
//     alert("Hierna wordt alleen een complete personenlijst getoond in een nieuw scherm!");
//     window.location=xml_bestand;
//     return;
  }
  else if (ua.indexOf('safari/') != -1)
  {
     iAmSafari = 1;
//     alert("Apple Safari ondersteunt de hier gebruikte functionaliteit helaas nog niet!");
     // XML/XSL transformaties worden nog niet ondersteund, wel native xml/xslt translatie
     // via de xsl die in de xml gekoppeld is. Open hiervoor rechtstreeks stamboom.xml
//     alert("Hierna wordt alleen een complete personenlijst getoond in een nieuw scherm!");
//     window.location=xml_bestand;
//     return;
  }

  if (window.ActiveXObject)
  {
     iAmIE = 1;
     if (ua.indexOf('windows nt 6.2') != -1)                              // Windows 8
     {
        iAmMetro = !isBrowserSupportPlugin();                             // IE 10 (Metro interface?)
     }
     if (ua.indexOf('win64') != -1)                                       // Windows 64 bits
     {
          if (ua.indexOf('x64') != -1)                                    // IE 64 bits
          {
             iAmMetro = true;                                             // Vergelijkbaar met Metro (Geen SVG onder 64 bits IE)
          }
     }
     source = new ActiveXObject("Microsoft.XMLDOM");                      // IE 5+
     stylesI = new ActiveXObject("Microsoft.XMLDOM");                     // IE 5+
     stylesI.resolveExternals=true;
  }
  else if ((document.implementation && document.implementation.createDocument && (!iAmChrome) && (!iAmSafari)) || iAmOp)
  {
     iAmFF = 1;
     source     = document.implementation.createDocument("","doc",null);    // NS 6+ FF 1+
     stylesheet = document.implementation.createDocument("","stijl",null);  // NS 6+ FF 1+
     stylesI    = document.implementation.createDocument("","inst",null);   // NS 6+ FF 1+
     xp     = new XSLTProcessor();
     xmls   = new XMLSerializer();
  }
  else if ((!iAmChrome) && (!iAmSafari))
  {
     alert("Deze browser " + ua + " wordt nog niet ondersteund!")
     return;
  }

  if (iAmIE || iAmFF)
  {  
    source.async = false;
    source.validateOnParse=true;
    source.resolveExternals=true;
    source.load("instellingen.xml");
  }
  if (iAmChrome || iAmSafari)
  {
       var xmlhttp = new window.XMLHttpRequest(); 
       xmlhttp.open("GET","instellingen.xml",false); 
       xmlhttp.send(null); 
       source = xmlhttp.responseXML.documentElement; 
       xp     = new XSLTProcessor();
       xmls   = new XMLSerializer();
  }
  if (iAmIE)
  {
    if (source.parseError.errorCode != 0)
    {
      // result = reportParseError(source.parseError);
      showHeader.innerHTML = "Fout bij inlezen van instellingen.xml";
      return;
    }
  }
  LeesGlobaleInstellingen();
  
  if (iAmIE || iAmFF)
    source.load(xml_bestand);
  if (iAmChrome || iAmSafari)
  {
       var xmlhttp = new window.XMLHttpRequest(); 
       xmlhttp.open("GET",xml_bestand,false); 
       xmlhttp.send(null); 
       source = xmlhttp.responseXML.documentElement; 
  }
  if (iAmIE)
  {
    if (source.parseError.errorCode != 0)
    {
      // result = reportParseError(source.parseError);
      showHeader.innerHTML = "Fout bij inlezen van " + xml_bestand;
      return;
    }
  }
  LeesStamboomInstellingen();
  
// check of maximaal aantal foto's per persoon groter dan 1
  nr_photos_pp();
  lees_groepsfotos();

// Cookies ophalen
  HaalCookiesOp();
  
  var today = new Date();
  thismonth = today.getMonth()+1;
  thisday = today.getDate();
  
// Als begonnen wordt met Persoonskaart, begin dan met referentiepersoon
  if (startxsl == 1)
  {
     strBeginPersoon = refPersoon;
  }
  
  // Als er een parameter op de commandline is meegegeven in de vorm van id=xyz dan gaan we direct
  // naar deze persoon in de stamboom
  if (startPersoon > 0)
  {
     // alert(startPersoon);
     strBeginPersoon = startPersoon;
     startxsl = 1;
  }

  vorigeNaam[iHistCnt]     = strBeginPersoon;
  vorigeKeyword1[iHistCnt] = '';
  vorigeKeyword2[iHistCnt] = '';

  if (startPersoon == 'Nieuws')
  {
     // naar de nieuws pagina
     vorigeWhat[iHistCnt]     = 18
     KiesXSL(18,strBeginPersoon,'','')
  }
  else
  {
    if (iAmFF)
    {
		if(startxsl == 0)
		{
    		vorigeWhat[iHistCnt]     = 27
			KiesXSL(27,strBeginPersoon,'','')
		}
		else
		{
    		vorigeWhat[iHistCnt]     = 7
			KiesXSL(7,strBeginPersoon,'','')
		}
    }
    else if (iAmIE)
    {
      // Nodig in geval van nood // strBeginPersoon = refPersoon;
//      ToonPersoon1(strBeginPersoon);
//      iHistCnt++
		if(startxsl == 0)
		{
    		vorigeWhat[iHistCnt]     = 27
			KiesXSL(27,strBeginPersoon,'','')
		}
		else
		{
    		vorigeWhat[iHistCnt]     = 7
			KiesXSL(7,strBeginPersoon,'','')
		}
    }
    else if (iAmSafari)
    {
		if(startxsl == 0)
		{
    		vorigeWhat[iHistCnt]     = 27
			KiesXSL(27,strBeginPersoon,'','')
		}
		else
		{
    		vorigeWhat[iHistCnt]     = 7
			KiesXSL(7,strBeginPersoon,'','')
		}
    }
    else if (iAmChrome)
    {
		if(startxsl == 0)
		{
    		vorigeWhat[iHistCnt]     = 27
			KiesXSL(27,strBeginPersoon,'','')
		}
		else
		{
    		vorigeWhat[iHistCnt]     = 7
			KiesXSL(7,strBeginPersoon,'','')
		}
    }
  }
}

function LeesGlobaleInstellingen()
{
	refOwner               = getParameterXML('REF','@owner',refOwner);
	refOwnerEMail          = getParameterXML('REF','@owneremail',refOwnerEMail);
	refCopyright           = getParameterXML('REF','@copyright',refCopyright);
    voettekstweergave      = parseInt(getParameterXML('TOON','@footer',voettekstweergave))+1;
    pkvoettekstweergave    = voettekstweergave;
    if ((iAmChrome) || (iAmSafari))
    {
        nieuwsweergave     = 0;
    }
    else
    {
        nieuwsweergave     = getParameterXML('TOON','@nieuws',nieuwsweergave);
    }
    kalenderweergave       = getParameterXML('TOON','@kalender',kalenderweergave);
    voornaamweergave       = parseInt(getParameterXML('TOON','@voornaam',voornaamweergave))+1;
    startxsl               = getParameterXML('TOON','@start',startxsl);
    diaweergave            = parseInt(getParameterXML('TOON','@diavolgorde',diaweergave))+1;
    diaduur                = getParameterXML('TOON','@diaduur',diaduur);
	tekstovl               = getParameterXML('TOON','@ovl',tekstovl);
    nrkolommen             = parseInt(getParameterXML('TOON','@nrkol',nrkolommen))+1;
    nrgeneraties           = getParameterXML('TOON','@nrgen',nrgeneraties);
    naamweergave           = parseInt(getParameterXML('TOON','@naam',naamweergave))+1;
    stuurfooter            = getParameterXML('STUUR','@footer',stuurfooter);
    stuurvoornaam          = getParameterXML('STUUR','@voornaam',stuurvoornaam);
    stuurdiavolgorde       = getParameterXML('STUUR','@diavolgorde',stuurdiavolgorde);
    stuurdiaduur           = getParameterXML('STUUR','@diaduur',stuurdiaduur);
    stuursorteersleutel    = getParameterXML('STUUR','@sorteersleutel',stuursorteersleutel);
    stuuraantalkolommen    = getParameterXML('STUUR','@nrkol',stuuraantalkolommen);
    stuurnaam              = getParameterXML('STUUR','@naam',stuurnaam);
    controleweergave       = getParameterXML('RAPPORTEN','@controle',controleweergave);
    histkalweergave        = getParameterXML('RAPPORTEN','@histkal',histkalweergave);
    personenweergave       = getParameterXML('RAPPORTEN','@personen',personenweergave);
    nrgenkwartier          = getParameterXML('RAPPORTEN','@kwartier',nrgenkwartier);
    nrgenparenteel         = getParameterXML('RAPPORTEN','@parenteel',nrgenparenteel);
    nrmaandenmutatie       = getParameterXML('RAPPORTEN','@mutatie',nrmaandenmutatie);
    huwelijkweergave       = getParameterXML('RAPPORTEN','@huwelijk',huwelijkweergave);
    relatieverwantweergave = getParameterXML('RAPPORTEN','@relatieverwant',relatieverwantweergave);
    memoryweergave         = getParameterXML('RAPPORTEN','@memory',memoryweergave);
    toonduits              = getParameterXML('TOON','@duits',toonduits);
    toonengels             = getParameterXML('TOON','@engels',toonengels);
    toonfrans              = getParameterXML('TOON','@frans',toonfrans);
    toonfries              = getParameterXML('TOON','@fries',toonfries);
    toonnoors              = getParameterXML('TOON','@noors',toonnoors);
    toonspaans             = getParameterXML('TOON','@spaans',toonspaans);
    toonitaliaans          = getParameterXML('TOON','@italiaans',toonitaliaans);
    toonportugees          = getParameterXML('TOON','@portugees',toonportugees);
    aktetekstnl            = getParameterXML('AKTETEKST','@nederlands',aktetekstnl);
    akteteksten            = getParameterXML('AKTETEKST','@engels',akteteksten);
    aktetekstfr            = getParameterXML('AKTETEKST','@frans',aktetekstfr);
    aktetekstdu            = getParameterXML('AKTETEKST','@duits',aktetekstdu);
    aktetekstfy            = getParameterXML('AKTETEKST','@fries',aktetekstfy);
    aktetekstno            = getParameterXML('AKTETEKST','@noors',aktetekstno);
    aktetekstes            = getParameterXML('AKTETEKST','@spaans',aktetekstes);
    aktetekstit            = getParameterXML('AKTETEKST','@italiaans',aktetekstit);
    aktetekstpt            = getParameterXML('AKTETEKST','@portugees',aktetekstpt);
    pkkaartweergave        = getParameterXML('TOON','@kaartpk',pkkaartweergave);
    ovzkaartweergave       = getParameterXML('TOON','@kaartovz',ovzkaartweergave);
    sortnaamweergave       = parseInt(getParameterXML('TOON','@sortnaam',sortnaamweergave))+1;
    
    if (iAmIE || iAmFF)
    {
      stylesI.async = false;
      stylesI.validateOnParse=true;
    }
}

function LeesStamboomInstellingen()
{
	refPersoon        = getParameterXML('REF','@link',refPersoon);
	var refAchternaam = getParameterXML('REF','@surn',refAchternaam);
    var sbAchternaam  = "Stamboom familie \"";
    if (refAchternaam != "")
    {
        sbAchternaam += refAchternaam + "\"";
        document.title = sbAchternaam;
    }
    fotomap          = getParameterXML('TOON','@fotofolder',fotomap);
}

function NSResolver(prefix) {
  if(prefix == 'html') {
    return 'http://www.w3.org/1999/xhtml';
  }
  else if(prefix == 'xsl') {
    return 'http://www.w3.org/1999/XSL/Transform'
  }
  else  {
  //this shouldn't ever happen
    return null;
  }
}

function HaalCookieOp(cookieNaam, stuur, varNaam)
{
  var naam_tmp = varNaam;
  if ((getCookie(cookieNaam) != null) && (stuur == 1))
  {
    naam_tmp = getCookie(cookieNaam);
  }
  return naam_tmp;
}

function HaalCookiesOp()
{
  strBeginPersoon = refPersoon;
  strBeginPersoon =     HaalCookieOp("LaatstePersoon" + xml_bestand, 1, strBeginPersoon);
  voornaamweergave =    HaalCookieOp("LaatsteVoornaamweergave", stuurvoornaam, voornaamweergave);
  bronweergave =        HaalCookieOp("LaatsteBronweergave", 1, bronweergave);
  getuigeweergave =     HaalCookieOp("LaatsteGetuigeweergave", 1, getuigeweergave);
  notitieweergave =     HaalCookieOp("LaatsteNotitieweergave", 1, notitieweergave);
  feitenweergave =      HaalCookieOp("LaatsteFeitenweergave", 1, feitenweergave);
  voettekstweergave =   HaalCookieOp("LaatsteVoettekstweergave", stuurfooter, voettekstweergave);
  pkvoettekstweergave = HaalCookieOp("LaatstePKVoettekstweergave", stuurfooter, pkvoettekstweergave);
  foto_tmp =            HaalCookieOp("LaatsteFotoAantal", 1, fotoaantal);
  if ((foto_tmp == 3) && (max_nr_photos_pp == 1))
  {
	  fotoaantal = 2;
  }
  else
  {
	  fotoaantal = foto_tmp;
  }
  diaweergave =         HaalCookieOp("LaatsteDiaVolgorde", stuurdiavolgorde, diaweergave);
  diaduur =             HaalCookieOp("LaatsteDiaDuur", stuurdiaduur, diaduur);
  nrkolommen =          HaalCookieOp("LaatsteNrKol", stuuraantalkolommen, nrkolommen);
  sorteersleutel =      HaalCookieOp("LaatsteSortKey", stuursorteersleutel, sorteersleutel);
  nrgeneraties =        HaalCookieOp("LaatsteNrGeneraties", 1, nrgeneraties);
  naamweergave =        HaalCookieOp("LaatsteNaamweergave", stuurnaam, naamweergave);
  sorteersleutelmedia = HaalCookieOp("LaatsteSortKeyMedia", 1, sorteersleutelmedia);
  taal =                HaalCookieOp("LaatsteTaal", 1, taal);
  if (taal == 'duits' && toonduits == 0)
  {
	  taal = 'nederlands';
  }
  if (taal == 'frans' && toonfrans == 0)
  {
	  taal = 'nederlands';
  }
  if (taal == 'engels' && toonengels == 0)
  {
	  taal = 'nederlands';
  }
  if (taal == 'fries' && toonfries == 0)
  {
	  taal = 'nederlands';
  }
  if (taal == 'noors' && toonnoors == 0)
  {
	  taal = 'nederlands';
  }
  if (taal == 'spaans' && toonspaans == 0)
  {
	  taal = 'nederlands';
  }
  if (taal == 'italiaans' && toonitaliaans == 0)
  {
	  taal = 'nederlands';
  }
  if (taal == 'portugees' && toonportugees == 0)
  {
	  taal = 'nederlands';
  }
  sortnaamweergave =    HaalCookieOp("LaatsteSortnaam", 1, sortnaamweergave);
}
// ============================ Einde laden instellingen en stamboom =====================

// ============================= Ondersteunende functies ==================================
// WijzigInstellingen
// WijzigSortering
// WijzigSorteringMedia
// Zoeken

function WijzigInstellingen()
{
  if (document.form2.voornaam != null)
  {
	for (i = 0; i != document.form2.voornaam.length; i++)
	{
		if (document.form2.voornaam[i].checked == true)
		{
			voornaamweergave= i ? 2 : 1;
    			setParameter("parToonVoornaam",voornaamweergave+'');
		}
	}
  }
  if (document.form2.naam != null)
  {
	for (i = 0; i != document.form2.naam.length; i++)
  	{
      		if (document.form2.naam[i].checked == true)
      		{
           		naamweergave = i ? 2 : 1;
    			setParameter("parToonNaam",naamweergave+'');
      		}
  	}
  }
  if (document.form2.bronnen != null)
  {
      bronweergave = document.form2.bronnen.checked ? 2 : 1;
      setParameter("parToonBron",bronweergave+'');
  }
  if (document.form2.getuigen != null)
  {
      getuigeweergave = document.form2.getuigen.checked ? 2 : 1;
      setParameter("parToonGetuige",getuigeweergave+'');
  }
  if (document.form2.notities != null)
  {
      notitieweergave = document.form2.notities.checked ? 2 : 1;
      setParameter("parToonNotitie",notitieweergave+'');
  }
  if (document.form2.feiten != null)
  {
      feitenweergave = document.form2.feiten.checked ? 2 : 1;
      setParameter("parToonFeiten",feitenweergave+'');
  }
  if (document.form2.voettekst != null)
  {
      voettekstweergave = document.form2.voettekst.checked ? 2 : 1;
      setParameter("parToonVoettekst",voettekstweergave+'');
  }
  if (document.form2.pkvoettekst != null)
  {
      pkvoettekstweergave = document.form2.pkvoettekst.checked ? 2 : 1;
      setParameter("parToonPKVoettekst",pkvoettekstweergave+'');
  }
  if (document.form2.sorteren != null)
  {
	for (i = 0; i != document.form2.sorteren.length; i++)
  	{
      		if (document.form2.sorteren[i].checked == true)
      		{
           		sorteersleutel = i + 1;
    			setParameter("parSortKey",sorteersleutel+'');
      		}
  	}
  }
  if (document.form2.fotos != null)
  {
	for (i = 0; i != document.form2.fotos.length; i++)
  	{
      		if (document.form2.fotos[i].checked == true)
      		{
           		fotoaantal = i + 1;
    			setParameter("parFotoAantal",fotoaantal+'');
      		}
  	}
  }
  if (document.form2.diavolgorde != null)
  {
	for (i = 0; i != document.form2.diavolgorde.length; i++)
  	{
      		if (document.form2.diavolgorde[i].checked == true)
      		{
           		diaweergave = i ? 2 : 1;
    			setParameter("parDiaVolgorde",diaweergave+'');
      		}
  	}
  }
  if (document.form2.diaduurInput != null)
  {
        diaduur = document.form2.diaduurInput.value;
	setParameter("parDiaDuur",diaweergave+'');
  }
  if (document.form2.kolommen != null)
  {
	for (i = 0; i != document.form2.kolommen.length; i++)
  	{
      		if (document.form2.kolommen[i].checked == true)
      		{
           		nrkolommen = i ? 2 : 1;
    			setParameter("parNrKol",nrkolommen+'');
      		}
  	}
  }
  if (document.form2.generaties != null)
  {
        nrgeneraties = document.form2.generaties.value;
	setParameter("parNrGeneraties",nrgeneraties+'');
  }
  if (document.form2.sortnaam != null)
  {
	for (i = 0; i != document.form2.sortnaam.length; i++)
  	{
      		if (document.form2.sortnaam[i].checked == true)
      		{
           		sortnaamweergave = i ? 2 : 1;
    			setParameter("parToonSortnaam",sortnaamweergave+'');
      		}
  	}
  }

  setCookie('LaatsteVoornaamweergave',voornaamweergave);
  setCookie('LaatsteBronweergave',bronweergave);
  setCookie('LaatsteGetuigeweergave',getuigeweergave);
  setCookie('LaatsteNotitieweergave',notitieweergave);
  setCookie('LaatsteFeitenweergave',feitenweergave);
  setCookie('LaatsteVoettekstweergave',voettekstweergave);
  setCookie('LaatstePKVoettekstweergave',pkvoettekstweergave);
  setCookie('LaatsteFotoAantal',fotoaantal);
  setCookie('LaatsteDiaVolgorde',diaweergave);
  setCookie('LaatsteDiaDuur',diaduur);
  setCookie('LaatsteNrKol',nrkolommen);
  setCookie('LaatsteNrGeneraties',nrgeneraties);
  setCookie('LaatsteSortKey',sorteersleutel);
  setCookie('LaatsteNaamweergave',naamweergave);
  setCookie('LaatsteSortKeyMedia',sorteersleutelmedia);
  setCookie('LaatsteTaal',taal);
  setCookie('LaatsteSortnaam',sortnaamweergave);
  strBeginPersoon = refPersoon;
  strBeginPersoon = HaalCookieOp("LaatstePersoon" + xml_bestand, 1, strBeginPersoon);

  iTotaalFotoCnt = 0;  // diavoorstelling opnieuw initialiseren
  for (i=0;i<=iHistCnt;i++)
  {
      vorigePage[i] = null;
  }
  VorigeKaart()
}

//function function3() {
//  document.all.Layer1.style.cursor = "wait";
//}
//function function4() {
//  document.all.Layer1.style.cursor = "default";
//}

function WijzigTaal(NieuweTaal,naam)
{
  taal = NieuweTaal;
  setCookie('LaatsteTaal',taal);
  KiesXSL(27,naam,'','');
}

function WijzigSortering(n)
{
  sorteersleutel = n;

  setParameter("parSortKey",sorteersleutel+'');
  setCookie('LaatsteSortKey',sorteersleutel);

  wijzigSortering = 1;
  iHistCnt--;
  if (vorigeWhat[iHistCnt] == 3)  // Media
  {
    sorteersleutelmedia = n;
    setParameter("parSortKeyMedia",sorteersleutelmedia+'');
    setCookie('LaatsteSortKeyMedia',sorteersleutelmedia);
  }
  KiesXSL(vorigeWhat[iHistCnt],vorigeNaam[iHistCnt],vorigeKeyword1[iHistCnt],vorigeKeyword2[iHistCnt]);
  wijzigSortering = 0;
}

function Zoeken()
{
  if (wijzigSortering == 0)
  {
    sortorder = 0;
    sorteersleutel = 38;
    sorteerOpNaamWeergaveRela(1);
  }
  setParameter("Voornamen",document.form1.voornaam.value);
  setParameter("Roepnaam",document.form1.roepnaam.value);
  setParameter("Tussenvoegsel",document.form1.tussenvoegsel.value);
  setParameter("Achternaam",document.form1.achternaam.value);
  setParameter("Familie",document.form1.familie.value);
  setParameter("Geboortejaar",document.form1.geboortejaar.value);
  setParameter("parSortKey",sorteersleutel);
  setParameter("parSortOrder",sortorder ? 'aflopend' : 'oplopend');

  for (i = 0; i != document.form1.enof.length; i++)
  {
    if (document.form1.enof[i].checked == true)
    {
        setParameter("EnOF", i ? "EN" : "OF");
    }
  }
  for (i = 0; i != document.form1.exact.length; i++)
  {
    if (document.form1.exact[i].checked == true)
    {
      setParameter("Exact", i ? "Nee" : "Ja");
    }
  }
  DoTransform();
}
// ============================= Einde ondersteunende functies ==================================

// ============================= Fotofuncties ===========================================
// fotoarray
// nextPhoto
// prevPhoto
// volgendefoto
// OpenFoto
// nr_photos_pp
// lees_groepsfotos

function fotoarray(naam)
{
  // Teller begint weer op 0
  iFotoCnt = 0;
  var nodePhotos;
  nodePhotos = source.selectSingleNode("//PERSOON[@link=" + naam + "]/PERSONAL/PHOTOS");
  if (nodePhotos != null)
  {
    if (nodePhotos.hasChildNodes())
    {
      var nodePhoto = nodePhotos.firstChild;
      for(;;)
      {
	    if (nodePhoto.nodeType == 1)	// Chrome / Safari heeft een text-node tussen elk tweetal opvolgende nodes in de xml-file; de echte nodes hebben nodeType = 1
	    {
          var nodePhotoName = selectSingleNode(source,"@name",nodePhoto);
          if (nodePhotoName != null)
      	  {
            arrayPhotos[iFotoCnt] = nodePhotoName.nodeValue;
      	    var nodePhotoTitle = selectSingleNode(source,"@title",nodePhoto);
            if (nodePhotoTitle != null)
            {
              arrayPhotosTitles[iFotoCnt] = nodePhotoTitle.nodeValue;
            }
            else
            {
              arrayPhotosTitles[iFotoCnt] ='';
            }

      	    var nodePhotoAlt = selectSingleNode(source,"@name",nodePhoto);
            if (nodePhotoAlt != null)
            {
              arrayPhotosAlts[iFotoCnt] = nodePhotoAlt.nodeValue;
            }
            else
            {
              arrayPhotosAlts[iFotoCnt] = "";
            }
            var nodePhotoWidth = selectSingleNode(source,"@w",nodePhoto);
            if (nodePhotoWidth != null)
               arrayPhotosW[iFotoCnt] = nodePhotoWidth.nodeValue;
            else
               arrayPhotosW[iFotoCnt] = 100;

            var nodePhotoHeight = selectSingleNode(source,"@h",nodePhoto);
            if (nodePhotoHeight != null)
               arrayPhotosH[iFotoCnt] = nodePhotoHeight.nodeValue;
            else
               arrayPhotosH[iFotoCnt] = 100;

            iFotoCnt++;
          }
        }

        nodePhoto = nodePhoto.nextSibling;
        if (nodePhoto == null)
           break;
      }
    }
  }
}

function nextPhoto(naam)
{
  for (i=0;i<iFotoCnt;i++)
  {
    if (document.images.afbeelding.src.match('/' + arrayPhotos[i]))
    {
      if (i < iFotoCnt-1)
        volgendefoto(i+1,naam);  // Volgende

      if (i+1 >= iFotoCnt-1)
      	 document.getElementById("Volgende").style.display="none";
      else
      	 document.getElementById("Volgende").style.display="inline";

      document.getElementById("Vorige").style.display="inline";
      break;
    }
  }
}

function prevPhoto(naam)
{
  for (i=0;i<iFotoCnt;i++)
  {
    if (document.images.afbeelding.src.match('/' + arrayPhotos[i]))
    {
      if (i > 0)
        volgendefoto(i-1,naam);  // Vorige

      if ((i-1) <= 0)
      	document.getElementById("Vorige").style.display="none";
      else
      	document.getElementById("Vorige").style.display="inline";

      document.getElementById("Volgende").style.display="inline";
      break;
    }
  }
}

function volgendefoto(nrFoto,naam)
{
  var fotoPath = "";
  var lengthPath = document.images.afbeelding.src.lastIndexOf("/");
  if (lengthPath >= 0)  // Gebruik het pad van de vorige foto
    fotoPath = document.images.afbeelding.src.substring(0,lengthPath+1);

  var echteNaam = arrayPhotos[nrFoto];
  document.images.afbeelding.src=fotoPath + echteNaam;
  document.images.afbeelding.title=arrayPhotosTitles[nrFoto] + ' (' + Txt_klik_voor_foto_in_apart_venster(taal) + ')';
  document.images.afbeelding.alt=arrayPhotosAlts[nrFoto];
  if (document.anchors[0].name == "afbeelding")
    document.anchors[0].href = "javascript:OpenFoto('" + naam + "','" + nrFoto + "')";
}

function geenRechterMuis()
{
	if ((iAmIE) && (event.button == 2 || event.button == 3))
	{
		alert('Er is geen rechtermuisselectie mogelijk');
		return false;
	}
	return false;
}

function OpenFoto (naam, nummer)
{
  if (bookWindow != null)
      if (!bookWindow.closed)
         bookWindow.close();
  var max_foto_breedte = 560;
  var max_foto_hoogte = 560;
  var min_tekst_breedte = 250;
  var tekst_hoogte = 20;
  var marge_x = 40;
  var marge_y = 55;
  var pix_per_letter = 8;
  var img_breedte;
  var img_hoogte;
  var venster_breedte;
  var venster_hoogte;
  var factor;

  fotoarray(naam);
  var map = fotomap + "/";
  var bookgif = map + arrayPhotos[nummer];
  var titel = arrayPhotosTitles[nummer];
  var breedte = arrayPhotosW[nummer];
  var hoogte = arrayPhotosH[nummer];
  if ((breedte <= max_foto_breedte) && (hoogte <= max_foto_hoogte))
  {
	  factor = 1;
  }
  else
  {
	  factor = Math.min(max_foto_breedte / breedte, max_foto_hoogte / hoogte);
  }
  img_breedte = breedte * factor;
  img_hoogte = hoogte * factor;
  venster_breedte = Math.max(img_breedte, min_tekst_breedte) + marge_x;
  var nr_tekst_regels = Math.ceil(pix_per_letter * titel.length / venster_breedte) + 2;
  venster_hoogte = img_hoogte + tekst_hoogte * nr_tekst_regels + marge_y;
  var is_groepsfoto = false;
  for (i=0;i<NodeGroepsfotos.length;i++)
  {
	  if (groepsfoto[i] == arrayPhotos[nummer])
	  {
		  is_groepsfoto = true;
		  var groepsfoto_nr = i;
	  }
  }
  if (is_groepsfoto)
  {
	var url_img = new Image;
	url_img.src = bookgif;
	var url_breedte = url_img.width;
	var url_hoogte = url_img.height;
	breedte_factor = url_breedte / breedte;
	hoogte_factor = url_hoogte / hoogte;
	bookWindow=open('','_blank',"top=10 ,left=10 ,toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1,width="+(1*url_breedte+40)+",height="+(1*url_hoogte+160));
	bookWindow.document.open();
	bookWindow.document.writeln('<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"');
	bookWindow.document.writeln('"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">');
	bookWindow.document.writeln('<html xmlns="http://www.w3.org/1999/xhtml">');
	bookWindow.document.writeln('<head><title>'+titel+'</title>');
	bookWindow.document.writeln('<meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1" />');
	bookWindow.document.writeln('<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />');
	bookWindow.document.writeln('<style type="text/css">');
	bookWindow.document.writeln('dl.image_map {display:block; width:' + url_breedte + 'px; height:' + url_hoogte + 'px; background:url(' + bookgif + '); position:relative; margin:2px auto 2px auto;}');
	bookWindow.document.writeln('a.LINK {background:transparent; display:block; height:0; overflow:hidden; position:absolute;}');
	bookWindow.document.writeln('a.LINK:hover  {border:1px solid black; color:black;}');
	bookWindow.document.writeln('.DLINKNOSHOW {visibility:hidden;}');
	for (i=0;i<nr_Hotspots[groepsfoto_nr];i++)
	{
		bookWindow.document.writeln("#NAME" + i + " {left:" + (Hotspotleft[groepsfoto_nr][i].nodeValue * breedte_factor) + "px; top:" + (Hotspottop[groepsfoto_nr][i].nodeValue * hoogte_factor) + "px; width:" + (Hotspotwidth[groepsfoto_nr][i].nodeValue * breedte_factor) + "px; height:" + (Hotspotpadd[groepsfoto_nr][i].nodeValue * hoogte_factor) + "px;}");
		bookWindow.document.writeln(".DLINKSHOW" + i + "  {left:" + (Hotspotleft[groepsfoto_nr][i].nodeValue * breedte_factor) + "px; top:" + (Hotspottop[groepsfoto_nr][i].nodeValue * hoogte_factor) + "px; background:transparent;display:block; width:" + (Hotspotwidth[groepsfoto_nr][i].nodeValue * breedte_factor) + "px; height:" + (Hotspotpadd[groepsfoto_nr][i].nodeValue * hoogte_factor) + "px; position:absolute; visibility:visible;border:1px solid black; color:black; text-align:center;}");
	}
	bookWindow.document.writeln('</style></head>');
	bookWindow.document.writeln('<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false" style="font-family:Verdana, Arial, Helvetica, sans-serif; font-size:12px;">');
	bookWindow.document.writeln('<dl class="image_map">');
	for (i=0;i<nr_Hotspots[groepsfoto_nr];i++)
	{
		bookWindow.document.writeln('<dd><div id="d' + i + '" class="DLINKNOSHOW"><div style="position:absolute; bottom:0px; width:' + (Hotspotwidth[groepsfoto_nr][i].nodeValue * breedte_factor) + 'px"><code style="background-color: #FCFCFC; color:black; font-family: Verdana, Helvetica, sans-serif; font-size: 12px; white-space:nowrap">' + Hotspottitle[groepsfoto_nr][i].nodeValue + '</code></div></div>');
		bookWindow.document.writeln('<a class="LINK" id="NAME' + i + '" title="' + Hotspottitle[groepsfoto_nr][i].nodeValue + '" onmouseover="document.getElementById(\'d' + i + '\').className=\'DLINKSHOW' + i + '\'" onmouseout="document.getElementById(\'d' + i + '\').className=\'DLINKNOSHOW\'"></a></dd>');
	}
	bookWindow.document.writeln('</dl><div style="text-align:center; font-size:12px; font-family:verdana; margin-left:auto; margin-right:auto; width:' + url_breedte + 'px;"><h3>' + titel + '</h3>');
	for (i=0;i<nr_Hotspots[groepsfoto_nr];i++)
	{
		bookWindow.document.writeln('<a style="text-decoration:none; color:black; font-size:12px; font-family:verdana;" title="' + Hotspottitle[groepsfoto_nr][i].nodeValue + '" onmouseover="document.getElementById(\'d' + i + '\').className=\'DLINKSHOW' + i + '\'" onmouseout="document.getElementById(\'d' + i + '\').className=\'DLINKNOSHOW\'">' + Hotspottitle[groepsfoto_nr][i].nodeValue + '</a>');
		if (i<nr_Hotspots[groepsfoto_nr]-1)
		{
			bookWindow.document.writeln(" | ");
		}
	}
	bookWindow.document.writeln('<br /><br />');
	bookWindow.document.writeln('<a style="text-decoration:none; color:black; font-size:12px; font-family:verdana;" onmouseover="');
	for (i=0;i<nr_Hotspots[groepsfoto_nr];i++)
	{
		bookWindow.document.writeln('document.getElementById(\'d' + i + '\').className=\'DLINKSHOW' + i + '\';');
	}
	bookWindow.document.writeln('" onmouseout="');
	for (i=0;i<nr_Hotspots[groepsfoto_nr];i++)
	{
		bookWindow.document.writeln('document.getElementById(\'d' + i + '\').className=\'DLINKNOSHOW\';');
	}
	bookWindow.document.writeln('">Alle labels</a>');
	bookWindow.document.writeln('</div>');
    bookWindow.document.writeln('<br /><center><i style="font-family:Verdana; font-size:8pt;">' + Txt_Vergroten(taal) + ': Ctrl + ; ' + Txt_verkleinen(taal) + ': Ctrl -; ' + Txt_standaard(taal) + ': Ctrl 0</i></center>');
	bookWindow.document.writeln('</body></html>');
    bookWindow.document.close();
  }
  else
  {
    bookWindow=open('','blank',"toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1,width="+venster_breedte+",height="+venster_hoogte);
    bookWindow.document.open(); 
	bookWindow.document.writeln('<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"');
	bookWindow.document.writeln('"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">');
	bookWindow.document.writeln('<html xmlns="http://www.w3.org/1999/xhtml">');
	bookWindow.document.writeln('<head><title>'+titel+'</title>');
	bookWindow.document.writeln('<meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1" />');
	bookWindow.document.writeln('<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />');
    bookWindow.document.writeln('</head>');
    bookWindow.document.writeln('<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false" >');
    bookWindow.document.writeln('<center><img src="'+bookgif+'" alt="" height="' + img_hoogte + '" width = "' + img_breedte + '" border="0"></center>');
    bookWindow.document.writeln('<center><h3>'+titel +'</h3></center>');
    bookWindow.document.writeln('<center><i style="font-family:Verdana; font-size:8pt;">' + Txt_Vergroten(taal) + ': Ctrl + ; ' + Txt_verkleinen(taal) + ': Ctrl -; ' + Txt_standaard(taal) + ': Ctrl 0</i></center>');
    bookWindow.document.writeln('</body></html>');
    bookWindow.document.close();
  }

}

function nr_photos_pp()
// bepaalt of er minstens 1 persoon is met meer dan 1 foto; dit ivm instelling weergave aantal foto's
{
	var nodePhotos = source.selectNodes("//PERSOON/PERSONAL/PHOTOS");
	for (i=0;i<nodePhotos.length;i++)
	{
		var nodePhoto = nodePhotos[i].selectNodes("PHOTO");
		if (nodePhoto != null)
		{
			max_nr_photos_pp = Math.max(max_nr_photos_pp,nodePhoto.length)
		}
		if (max_nr_photos_pp > 1)
		{
			break;
		}
	}
}

function lees_groepsfotos()
{
  NodeGroepsfotos = source.selectNodes("//GROEPSFOTOS/FOTO");
  groepsfoto.length = 0;
  for (i=0;i<NodeGroepsfotos.length;i++)
  {
    groepsfoto[i] = NodeGroepsfotos[i].getAttribute("name");
  }
  for (i=0;i<NodeGroepsfotos.length;i++)
  {
    nodeMap = source.selectSingleNode("//GROEPSFOTOS/FOTO[@name='" + groepsfoto[i] + "']");
	if (nodeMap.hasChildNodes())
	{
		var Hotspot = nodeMap.firstChild;
		indx_tmp=0;
		Hotspotleft[i] = new Array();
		Hotspottop[i] = new Array();
		Hotspotwidth[i] = new Array();
		Hotspotpadd[i] = new Array();
		Hotspottitle[i] = new Array();
		for(;;)
		{
		  if (Hotspot.nodeType == 1)	// Chrome / Safari heeft een text-node tussen elk tweetal opvolgende nodes in de xml-file; de echte nodes hebben nodeType = 1
		  {
			var Hotspotleft_tmp = selectSingleNode(source,"@left",Hotspot);
			if (Hotspotleft_tmp != null)
			{
				Hotspotleft[i][indx_tmp] = selectSingleNode(source,"@left",Hotspot);
				Hotspottop[i][indx_tmp] = selectSingleNode(source,"@top",Hotspot);
				Hotspotwidth[i][indx_tmp] = selectSingleNode(source,"@width",Hotspot);
				Hotspotpadd[i][indx_tmp] = selectSingleNode(source,"@padd",Hotspot);
				Hotspottitle[i][indx_tmp] = selectSingleNode(source,"@title",Hotspot);
				indx_tmp++;
			}
          }
		  Hotspot = Hotspot.nextSibling;
		  if (Hotspot == null) break;
		}
		nr_Hotspots[i] = indx_tmp;
	}
  }
}
// ============================= Fotofuncties ===========================================

// ============================= Diverse functies ======================================
// d2h
// h2d
// GeenFunctie
// getCookie
// setCookie
// muisOver
// muisUit
// selectSingleNode
// sluiten

function d2h(d) {return d.toString(16);}

function h2d(h) {return parseInt(h,16);}

function GeenFunctie()
{
  // dummy functie, voor lege knoppen!
}

function getCookie(name)
{
  arg=name+"=";
  i=0;
  while(i<document.cookie.length)
  {
    j=i+arg.length;
    if(document.cookie.substring(i,j)==arg)
    {
      endstr=document.cookie.indexOf(";",j);
      if(endstr==-1)endstr=document.cookie.length;
      return unescape(document.cookie.substring(j,endstr));
    }
    i=document.cookie.indexOf(" ", i)+1;
    if (i==0)break;
  }
  return null;
}

function setCookie(name,value)
{
  if(value!=null&&value!="")
  {
    var today=new Date();var expiry=new Date(today.getTime()+31536000000);
    document.cookie=name+"="+escape(value)+";expires="+expiry.toGMTString()+";path=/";
  }
}

function muisOver(x)
{
  // eval("veld" + x + "b.style.visibility = 'visible'");
  document.getElementById("veld" + x + "b").style.visibility = "visible";
}
function muisUit(x)
{
  document.getElementById("veld" + x + "b").style.visibility = "hidden";
}

// Implementatie met drie argumenten, werkt voor IE en FF
function selectSingleNode(d,x,c)
{
  /*
  d = XmlDocument
  x = xpath
  c = context node
  */
  var s,i,n;
  if(typeof d.evaluate != "undefined")
  {
    c = (c ? c : d.documentElement);
    s = d.evaluate(x,c,null,0,null);
    return s.iterateNext();
  }
  else if(typeof d.selectNodes != "undefined")
  {
    return (c ? c : d).selectSingleNode(x);
  }
  return null;
}

function sluiten()
{
  window.close();
  history.back();
}
// ============================= Einde diverse functies ======================================

// ============================= SVG functies =============================================
// handleEvent
// inlineSVGloadSVG
// SVGloadSVG
// triggerSVGLoading
// loadSVG

// SVG event handler
function handleEvent(evt,urlid)
{
  var doc  = evt.target.ownerDocument;
  var lnkid = doc.getElementById(urlid);
  if (lnkid == null)
    return;    // urlid niet gevonden
  var text = lnkid.getFirstChild();
  if (text == null)
     return;   // child niet gevonden
  document.location.href = text.data;
}

var inlineSVGwindowTimeoutId = null;

function inlineSVGloadSVG()
{
  if (inlineSVGwindowTimeoutId != null)
  {
    // Zet timer altijd direct weer uit, om te voorkomen
    // dat deze methode meerdere keren wordt aangeroepen
    window.clearInterval(inlineSVGwindowTimeoutId);
    inlineSVGwindowTimeoutId = null;
  }

  var bSetInterval = true;
  if (document.all('SVGEmbedIDAVJTVB').readyState == "complete")
  {
    var svgdoc = svgDocument;
    if (typeof(svgdoc) == "object")
    {
      try
      {
        var source = new ActiveXObject("Microsoft.XMLDOM");                    // IE 5+
        source.async = false;
        source.validateOnParse=true;
        source.resolveExternals=true;
        source.loadXML(strSVG);
        // var nodeXslSvg = source.selectSingleNode("//text[@id='anm-2']");
        var anodes = source.selectNodes("//text");
        for (var i=0; i < anodes.length; i++)
        {
          var textId = anodes(i).getAttribute("id");
          var node   = svgdoc.getElementById(textId);
          if (node != null)
          {
            node.getChildNodes().item(0).nodeValue=anodes(i).text;
          }
        }
        // Alles is nu eindelijk klaar, dus niet meer nodig
        // om dit opnieuw te proberen.
        bSetInterval = false;
      }
      catch(e)
      {
	      // Er is iets fout gegaan
	  }
    }
  }

  if (bSetInterval)
  {
     // probeer het nogmaals, totdat de SVG geladen is
     inlineSVGwindowTimeoutId = window.setInterval("inlineSVGloadSVG()", 300); // 300 milliseconds
  }
}

function SVGloadSVG()
{
  if (iAmIE)
  {
     // Controleer eerst of de vorige actie al afgelopen is, zo niet stop die vorige actie dan maar
     if (inlineSVGwindowTimeoutId != null)
         window.clearInterval(inlineSVGwindowTimeoutId);
     inlineSVGwindowTimeoutId = window.setInterval("inlineSVGloadSVG()", 300); // 300 milliseconds
  }
  else
  {
      var node = document.getElementById("SVGEmbedIDAVJTVB");
      alert(node);
      //svgDocument = node.getSVGDocument();  // null
      //svgDocument = node.documentElement;   // undefined
      return;

      // Hieronder staat nog wat test code voor FireFox.
      // Helaas werk dat nog niet omdat het niet lukt om de de svg in het emebd statement tekomen.
      // In IE gaat dit via getSVGDocument(), in FireFox is het me nog niet gelukt. En dat is wel
      // jammer wat dit is nodig om de namen in de svg te krijgen.
      var oParser = new DOMParser();
      source = oParser.parseFromString(strSVG,"text/xml");
      var oEvaluator = new XPathEvaluator();
      var oResult = oEvaluator.evaluate("//text",
      source.documentElement, null, XPathResult.ORDERED_NODE_ITERATOR_TYPE, null);
      if (oResult != null) {
      var oElement = oResult.iterateNext();
      var i = 0;
      while(oElement) {
              //alert(oElement.tagName);
              //alert(oElement.textContent);
            var textId = oElement.getAttribute("id");
            if (i < 2)
                alert(textId);
            var node   = document.getElementById(textId);
            if (node == null)
            {
               node = document.all[textId];
            if (i < 2)
            {
               if (node == null)
                  alert("node=null");
               else
                  alert(node);
            }
            }
            i++;
            if (node != null)
            {
              // node.getChildNodes().item(0).nodeValue=anodes(i).text;
            }
            oElement = oResult.iterateNext();
          }
      }
  }
}

function triggerSVGLoading(evt)
{
  if (iAmIE)
  {
    // IE komt hier wel!
    svgDocument = document.embeds['SVGEmbedIDAVJTVB'].getSVGDocument();
  }
  else
  {
    // Helaas komt Firefox hier niet vanuit de SVG!
    svgDocument = evt.target.ownerDocument;
  }
}

function loadSVG(imageXML, embedID)
{
   var svg = getDOMFromXML(imageXML);
   domtodom(svg, embedID);
}

function getDOMFromXML(XML)
{
   DOM = new ActiveXObject('Msxml2.FreeThreadedDOMDocument',null,0);
   DOM.async = false;
   DOM.validateOnParse = false;
   DOM.loadXML(XML);
   if (DOM.parseError.errorCode != 0) {
      alert('Error parsing XML:\n' + explainParseError(DOM.parseError));
      return;
   }
   return DOM;
}
// ============================= Einde SVG functies =============================================

// ============================= code voor Diavoorstelling ============
// laad_fotos
// foto_volgorde
// haal_foto_path_op
// run_slide_show
// diavoorstelling

var Pic_name = new Array();
var Pic_title = new Array();
var Pic_width = new Array();
var Pic_height = new Array();
var Pic_tekst = new Array();
var Pic_rnd_name = new Array();
var Pic_rnd_title = new Array();
var Pic_rnd_tekst = new Array();
var Pic_path = "";
var slideShowSpeed;
var imgSlideHeight = 600;
var crossFadeDuration = 5;
var preLoad = new Array();

function laad_fotos()
{
  iTotaalFotoCnt = 0;

  var nodePhotos;
  var nodeAllePhotos = source.selectNodes("//PERSOON/PERSONAL/PHOTOS/PHOTO");
  var ThisLink = 0;
  for(var i=0;i<nodeAllePhotos.length;i++)
  {
    var nodePhoto = nodeAllePhotos[i].selectSingleNode(".");
    var nodeLink = nodeAllePhotos[i].selectSingleNode("../../../@link");
    var nodeFirst = nodeAllePhotos[i].selectSingleNode("../../NAME/@first");
    var nodeNick = nodeAllePhotos[i].selectSingleNode("../../NAME/@nick");
    var nodePref = nodeAllePhotos[i].selectSingleNode("../../NAME/@pref");
    var nodeSurn = nodeAllePhotos[i].selectSingleNode("../../NAME/@surn");
    LastLink = ThisLink;
    ThisLink = nodeLink.nodeValue;
    if (((fotoaantal == 2) && (ThisLink != LastLink)) || (fotoaantal == 3))
    {
      var nodePhotoName = selectSingleNode(source,"@name",nodePhoto);
      if (nodePhotoName != null)
      {
        Pic_name[iTotaalFotoCnt] = nodePhotoName.nodeValue;
    	var nodePhotoTitle = selectSingleNode(source,"@title",nodePhoto);
        if (nodePhotoTitle != null)
        {
          Pic_title[iTotaalFotoCnt] = nodePhotoTitle.nodeValue;
        }
        else
        {
          Pic_title[iTotaalFotoCnt] = nodePhotoName.nodeValue;
        }
    	var nodePhotoWidth = selectSingleNode(source,"@w",nodePhoto);
        if (nodePhotoWidth != null)
        {
          Pic_width[iTotaalFotoCnt] = nodePhotoWidth.nodeValue;
        }
        else
        {
          Pic_width[iTotaalFotoCnt] = 1;
        }
    	var nodePhotoHeight = selectSingleNode(source,"@h",nodePhoto);
        if (nodePhotoHeight != null)
        {
          Pic_height[iTotaalFotoCnt] = nodePhotoHeight.nodeValue;
        }
        else
        {
          Pic_height[iTotaalFotoCnt] = 1;
        }
        Pic_tekst[iTotaalFotoCnt] = '<a href="javascript:KiesXSL(7,' + nodeLink.nodeValue + ')">';
        if (nodeFirst != null)
        {
        	Pic_tekst[iTotaalFotoCnt] += nodeFirst.nodeValue;
    	}
        if (nodeNick != null)
        {
	        if (nodeFirst == null)
	        {
        		Pic_tekst[iTotaalFotoCnt] += nodeNick.nodeValue;
	        }
	        else
	        {
		        if (nodeFirst.nodeValue != nodeNick.nodeValue)
		        {
			        Pic_tekst[iTotaalFotoCnt] += ' (' + nodeNick.nodeValue + ') ';
		        }
	        }
    	}
        if (nodePref != null)
        {
        	Pic_tekst[iTotaalFotoCnt] += ' ' + nodePref.nodeValue;
    	}
        if (nodeSurn != null)
        {
        	Pic_tekst[iTotaalFotoCnt] += ' ' + nodeSurn.nodeValue;
    	}
        Pic_tekst[iTotaalFotoCnt] += '</a>';
        iTotaalFotoCnt++;
      }
    }
  }
}

function foto_volgorde()
{
  var i;
  var nrfnd;
  var willekeurig=(diaweergave == 1);
  var fnd = new Array();
  var indx = new Array();

	for (i=0;i<iTotaalFotoCnt;i++)
	{
		fnd[i]=false;
	}

	if (willekeurig)
	{
		nrfnd=0;
		while (nrfnd<iTotaalFotoCnt)
		{
			x=Math.random();
			y=Math.floor(iTotaalFotoCnt*x);

			if (!(fnd[y]))
			{
				fnd[y]=true;
				indx[nrfnd]=y;
				nrfnd=nrfnd+1;
			}
		}

		for (i=0;i<iTotaalFotoCnt;i++)
		{
			Pic_rnd_name[i]=Pic_name[indx[i]];
			Pic_rnd_title[i]=Pic_title[indx[i]];
			Pic_rnd_tekst[i]=Pic_tekst[indx[i]];
		}
	}
	else
	{
		for (i=0;i<iTotaalFotoCnt;i++)
		{
			Pic_rnd_name[i]=Pic_name[i];
			Pic_rnd_title[i]=Pic_title[i];
			Pic_rnd_tekst[i]=Pic_tekst[i];
		}
	}

	for (i = 0; i < iTotaalFotoCnt; i++)
	{
		preLoad[i] = null;
	}
}

function haal_foto_path_op()
{
    Pic_path = document.images.SlideShow.src;
    //document.images.SlideShow.src = Pic_path + Pic_rnd_name[0];
    //document.images.SlideShow.text=Pic_rnd_title[0] + "<br /><br />" + Pic_rnd_tekst[0];
    return;
}

var stop_resume_id = 0;
var SlideShowTimeOut;
var FotoTekstId;

function run_slide_show()
{
	if (!slideShowRunning)
	{
		slideShowStillShowRunning = false;
		return;
	}
// Duration of crossfade (seconds)
	
	if (document.all)
	{
		document.images.SlideShow.style.filter="blendTrans(duration=crossFadeDuration)";
		document.images.SlideShow.filters.blendTrans.Apply();
	}

	if (preLoad[iSlideCounter] == null)
	{
		preLoad[iSlideCounter] = new Image();
		preLoad[iSlideCounter].src = Pic_path + Pic_rnd_name[iSlideCounter];
	}

	document.images.SlideShow.src = Pic_path + Pic_rnd_name[iSlideCounter];
	document.images.SlideShow.text=Pic_rnd_title[iSlideCounter] + "<br clear='all'/><br/>" + Pic_rnd_tekst[iSlideCounter];
	if (stop_resume_id == 0)
	{
		document.images.SlideShow.text += "<br /><br />" + Txt_pauzetekst(taal);
	}
	else
	{
		document.images.SlideShow.text += "<br /><br />" + Txt_doorgaantekst(taal);
	}
//	document.images.SlideShow.alt=Pic_rnd_title[iSlideCounter];
	document.images.SlideShow.height=imgSlideHeight;

	if (document.all)
	{
		document.images.SlideShow.filters.blendTrans.Play();
	}

	iSlideCounter++;
	if (iSlideCounter >= iTotaalFotoCnt)
	{
		iSlideCounter=0;
	}

    SlideShowTimeOut = setTimeout('run_slide_show()', slideShowSpeed);

	slideShowStillShowRunning = true;
	FotoTekstId = document.getElementById("Fototekst");
	if (!FotoTekstId)
	{
		return false;
	}
	if (typeof FotoTekstId.innerHTML == 'undefined')
	{
		return false;
	}

// Update the text
	FotoTekstId.innerHTML = document.images.SlideShow.text;
	return "";
}

function stop_resume_slideshow(e)
{
	if (slideShowRunning)
	{
		var evtobj=window.event? event : e //distinguish between IE's explicit event object (window.event) and Firefox's implicit.
		var unicode=evtobj.charCode? evtobj.charCode : evtobj.keyCode
		var actualkey=String.fromCharCode(unicode)
		if (actualkey==" ")
		{
			stop_resume_id = 1 - stop_resume_id;
			if (stop_resume_id == 1)
			{
				clearTimeout(SlideShowTimeOut);
				foto_nr = iSlideCounter-1;
				if (foto_nr == -1)
				{
					foto_nr = iTotaalFotoCnt-1;
				}
				document.images.SlideShow.text=Pic_rnd_title[foto_nr] + "<br clear='all'/><br/>" + Pic_rnd_tekst[foto_nr] + "<br /><br />" + Txt_doorgaantekst(taal);
				FotoTekstId.innerHTML = document.images.SlideShow.text;
			}
			else
			{
				iSlideCounter++;
				if (iSlideCounter >= iTotaalFotoCnt) iSlideCounter=0
				run_slide_show();
			}
	
		}
	}
}

function diavoorstelling(naam)
{
//  bij eerste aanroep of na wijziging instellingen opnieuw laden; bij wijziging van 1 naar alle foto's of omgekeerd kan het aantal foto's veranderen
    if (iTotaalFotoCnt == 0)
    {
      laad_fotos();
	  foto_volgorde();
  	  slideShowSpeed = Math.max(diaduur,1) * 1000;
    }
    if (iTotaalFotoCnt != 0)
    {

	  slideShowRunning = true;
	  document.onkeypress=stop_resume_slideshow;
// volgende regel niet in bovenstaande if, om bij nieuwe aanroep met foto 0 te beginnen
      iSlideCounter = -1;
    
	  if (iSlideCounter < 0)
	  {
  	    haal_foto_path_op();
  	    iSlideCounter = 0;
      }
      if (!slideShowStillShowRunning)
      {
        run_slide_show();
      }
      if (stop_resume_id == 1)
      {
	      stop_resume_id = 0;
	      run_slide_show();
      }
	}
}
// ============================= Einde code voor Diavoorstelling ============

// ============================= code voor FotoMemory ============
var gevonden = new Array();
var aangeklikt = new Array();
var nr_rows = 6;
var nr_col = 6;
var nr_aangeklikt = 0;
var aanklik_index = new Array();
var Pic_memory_name = new Array();
var Pic_memory_width = new Array();
var Pic_memory_height = new Array();
var Pic_memory_tekst = new Array();
var Pic_rnd_memory_name = new Array();
var Pic_rnd_memory_width = new Array();
var Pic_rnd_memory_height = new Array();
var Pic_rnd_memory_tekst = new Array();
var te_weinig_fotonamen;
var nr_pogingen;
var nr_goed;
var memory_duur = 2000;
var hrs_begin;
var min_begin;
var sec_begin;
var hrs_eind;
var min_eind;
var sec_eind;

function memory(naam)
{
	initialize_memory()
	laad_fotos();
	maak_random_foto_paren();
	if (te_weinig_fotonamen && (fotoaantal > 1) && (nr_foto_namen > 0))
	{
		maak_memory_fout_melding()
	}
	else
	{
		if ((fotoaantal > 1) && (nr_foto_namen > 0))
		{
			haal_foto_path_memory_op();
			var dte = new Date();
			hrs_begin = dte.getHours();
			min_begin = dte.getMinutes();
			sec_begin = dte.getSeconds();
			run_memory(naam,true);
		}
	}
}

function initialize_memory()
{
	nr_pogingen = 0;
	nr_goed = 0;
	for (i=1;i<=nr_rows;i++)
	{
		for (j=1;j<=nr_col;j++)
		{
			gevonden[(i-1)*nr_col + j] = false;
			aangeklikt[(i-1)*nr_col + j] = false;
		}
	}
}

function haal_foto_path_memory_op()
{
	var nodeToon = source.selectSingleNode("//INSTELLINGEN/TOON");
	var nodeFotoPath = selectSingleNode(source,"@fotofolder",nodeToon);
    Pic_path = nodeFotoPath.nodeValue + "/";
    return;
}

function maak_random_foto_paren()
{
	var gekozen = new Array();
	var name_assigned = new Array();
	nr_foto_namen = 0;
	for (i=0;i<iTotaalFotoCnt;i++)
	{
		dubbel = false;
		for (j=1;j<=nr_foto_namen;j++)
		{
			if (Pic_memory_name[j] == Pic_name[i])
			{
				dubbel = true;
			}
		}
		if (!dubbel)
		{
			nr_foto_namen++;
			Pic_memory_name[nr_foto_namen] = Pic_name[i];
			Pic_memory_width[nr_foto_namen] = Pic_width[i];
			Pic_memory_height[nr_foto_namen] = Pic_height[i];
			Pic_memory_tekst[nr_foto_namen] = Pic_tekst[i];
		}
	}
	te_weinig_fotonamen = (nr_foto_namen < nr_rows * nr_col / 2);
	if (te_weinig_fotonamen)
	{
		return;
	}
	for (i=1;i<=iTotaalFotoCnt;i++)
	{
		gekozen[i] = false;
	}
	nr_assigned = 0;
	for (i=1;i<=nr_rows;i++)
	{
		for (j=1;j<=nr_col;j++)
		{
			name_assigned[(i-1)*nr_col + j] = false;
		}
	}
	while (nr_assigned < nr_rows * nr_col)
	{
		do
		{
			k = rnd(nr_foto_namen);
			al_gekozen = (gekozen[k])
		}
		while (al_gekozen)
		gekozen[k] = true;
		nr_assigned = nr_assigned + 2;
		for (j=1;j<=2;j++)
		{
			do
			{
				i = rnd(nr_rows * nr_col);
				al_gekozen = (name_assigned[i])
			}
			while (al_gekozen)
			name_assigned[i] = true;
			Pic_rnd_memory_name[i] = Pic_memory_name[k];
			Pic_rnd_memory_width[i] = Pic_memory_width[k];
			Pic_rnd_memory_height[i] = Pic_memory_height[k];
			Pic_rnd_memory_tekst[i] = Pic_memory_tekst[k];
		}
	}
}

function run_memory(naam,met_href)
{
	var r = document.getElementById("Memory");
	if (!r)
	{
		return false;
	}
	if (typeof r.innerHTML == 'undefined')
	{
		return false;
	}

// Update the text
	r.innerHTML = maak_memory_tabel(naam,met_href);
	return "";
}

function maak_memory_tabel(naam,met_href)
{
	txt = Txt_FotoMemory(taal) + '<br /><br /><table style="font-size:10pt; cell-padding:0">';
	for (i=1;i<=nr_rows;i++)
	{
		txt+="<tr>";
		for (j=1;j<=nr_col;j++)
		{
			txt+='<td style="width:6em; height:6em; background-color:blue; text-align:center;">';
			if (gevonden[(i-1)*nr_col + j] || aangeklikt[(i-1)*nr_col + j])
			{
				txt+='<img src="' + Pic_path + Pic_rnd_memory_name[(i-1)*nr_col + j];
				if ((1 * Pic_rnd_memory_width[(i-1)*nr_col + j]) < (1 * Pic_rnd_memory_height[(i-1)*nr_col + j]))
				{
					txt+='" height="70"/>'
				}
				else
				{
					txt+='" width="70"/>'
				}
			}
			else
			{
				if (met_href)
				{
					txt+='<a href="javascript:update_memory(' + naam + ',' + i + ',' + j + ')">';
				}
				txt+='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				if (met_href)
				{
					txt+='</a>'
				}
			}
			txt+='</td>';
		}
		txt+="</tr>";
	}
	txt+="</table>";
	var dte = new Date();
	hrs_eind = dte.getHours();
	min_eind = dte.getMinutes();
	sec_eind = dte.getSeconds();
	var nr_sec;
	var nr_min;
	var nr_hrs;
	nr_sec = (hrs_eind - hrs_begin) * 3600;
	nr_sec += (min_eind - min_begin) * 60;
	nr_sec += (sec_eind - sec_begin);
	nr_hrs = Math.floor(nr_sec / 3600);
	nr_sec -= nr_hrs * 3600;
	nr_min = Math.floor(nr_sec / 60);
	nr_sec -= nr_min * 60;
	if (nr_sec < 0)
	{
		nr_sec += 3600 * 24;
	}
	if (nr_goed == nr_rows * nr_col / 2)
	{
		txt += Txt_Alles_gevonden_in(taal) + ' ' + (nr_pogingen - nr_goed + 1) + ' ' + Txt_beurten(taal) + '; ' + Txt_het_duurde(taal) + ' ';
		if (nr_hrs > 0)
		{
			txt+= nr_hrs + ' ' + Txt_uur(taal) + ', ';
		}
		if (nr_min == 1)
		{
			txt+= nr_min + ' ' + Txt_minuut(taal) + ' ' + Txt_en(taal) + ' ';
		}
		if (nr_min > 1)
		{
			txt+= nr_min + ' ' + Txt_minuten(taal) + ' ' + Txt_en(taal) + ' ';
		}
		txt+= nr_sec + ' ' + Txt_seconde(taal) + ' ';
		txt+='<br /><br /><a href="javascript:KiesXSL(95,' + naam + ')">' + Txt_nogmaals_spelen(taal) + '</a>';
		txt+='<br /><br />' + Txt_ander_rapport(taal);
	}
	else
	{
		txt+= Txt_aantal_beurten(taal) + ' = ' + (nr_pogingen - nr_goed) + ' ; ' + Txt_verstreken_tijd(taal) + ': ';
		if (nr_hrs > 0)
		{
			txt+= nr_hrs + ' ' + Txt_uur(taal) + ', ';
		}
		if (nr_min == 1)
		{
			txt+= nr_min + ' ' + Txt_minuut(taal) + ' ' + Txt_en(taal) + ' ';
		}
		if (nr_min > 1)
		{
			txt+= nr_min + ' ' + Txt_minuten(taal) + ' ' + Txt_en(taal) + ' ';;
		}
		txt+= nr_sec + ' ' + Txt_seconde(taal) + ' ';
	}
	return txt;
}

function update_memory(naam,i,j)
{
	nr_aangeklikt++;
	aanklik_index[nr_aangeklikt] = (i-1)*nr_col + j; 
	aangeklikt[(i-1)*nr_col + j] = true;
	run_memory(naam,true);
	if (nr_aangeklikt == 2)
	{
		nr_pogingen++;
		run_memory(naam,false);
		if (Pic_rnd_memory_name[aanklik_index[1]] == Pic_rnd_memory_name[aanklik_index[2]])
		{
			nr_goed++;
			gevonden[aanklik_index[1]] = true;
			gevonden[aanklik_index[2]] = true;
			update_memory_2(naam);
		}
		else
		{
			setTimeout('update_memory_2(' + naam + ')',memory_duur);
		}
	}
}

function update_memory_2(naam)
{
	nr_aangeklikt = 0;
	aangeklikt[aanklik_index[1]] = false;
	aangeklikt[aanklik_index[2]] = false;
	run_memory(naam,true);
}

function rnd(n)
{
	return (Math.floor(Math.random()*n) + 1)
}

function maak_memory_fout_melding()
{
	var r = document.getElementById("Memory");
	if (!r)
	{
		return false;
	}
	if (typeof r.innerHTML == 'undefined')
	{
		return false;
	}

// Update the text
	if (nr_foto_namen == 1)
	{
		r.innerHTML = Txt_Er_is_maar_1_foto(taal) + '; ' + Txt_er_zijn_minstens(taal) + ' ' + (nr_col * nr_rows / 2) + ' ' + Txt_fotos_nodig_om_memory_te_spelen(taal);
	}
	else
	{
		r.innerHTML = Txt_Er_zijn(taal) + ' ' + nr_foto_namen + ' ' + Txt_fotos(taal) + '; ' + Txt_er_zijn_minstens(taal) + ' ' + (nr_col * nr_rows / 2) + ' ' + Txt_fotos_nodig_om_memory_te_spelen(taal);
	}
	return "";
}
// ============================= Einde code voor FotoMemory ============

//=========================== Metro IE check ===========================
// http://stackoverflow.com/questions/8751479/javascript-detect-metro-ui-version-of-ie-10
var errorName = null;
function isBrowserSupportPlugin() {
    var supported = null;
    try {
        new ActiveXObject("");
    }
    catch (e) {
        // FF has ReferenceError here
        errorName = e.name; 
    }     
    try {
        supported = !!new ActiveXObject("htmlfile");
    } catch (e) {
        supported = false;
    }
    if(errorName != 'ReferenceError' && supported==false){
        supported = false;
    }else {
        supported =true;
    }
    return supported;
}
// =========================== Einde metro IE Check ===========================

// =========================== Code voor plaatskaarten ===========================
var gmarkers = [];
var lat = [];
var lng = [];
var htmls = [];
var plaatsnaam = [];
var plaatsen;
var plaatsmap;
var kaartGeladen = false;

function plaatsinfo(i,lat,lng, html)
{
	var latlng = new google.maps.LatLng(lat, lng); 
	plaatsmap.setZoom(8);
	var infowindow = new google.maps.InfoWindow({content:html});
	infowindow.open(plaatsmap, gmarkers[i]);
	plaatsmap.panTo(latlng);
}

function LaadKaartGegevens()
{
	plaatsen = source.selectNodes("//PLAATSEN/PLAATS");
	for (var i = 0; i < plaatsen.length; i++)
	{
		lat[i]        = parseFloat(plaatsen[i].getAttribute("lat"));
		lng[i]        = parseFloat(plaatsen[i].getAttribute("lng"));
		plaatsnaam[i] = plaatsen[i].getAttribute("naam");
	}
}

function MaakKaart(soort)
{
	if (!kaartGeladen)
	{
		LaadKaartGegevens();
		kaartGeladen = true;
	}
	var latlng = [];
	var enkelvoud;
	var meervoud;
	var gebeurtenis;
	var iAantal = [];
	var iaantalmax = 0;
	var ilatmax = 0;
	var ilatmin = 0;
	var ilngmax = 0;
	var ilngmin = 0;
	var iAantalPos = 0;
	var latmax = -1000;
	var latmin = 1000;
	var lngmax = -1000;
	var lngmin = 1000;
	var maxAantal = 0;

	for (var i = 0; i < plaatsen.length; i++)
	{
		iAantal[i] = 0;
		if ((soort == 'geboorte')   && (plaatsen[i].getAttribute("nr_geb")  != null)) {iAantal[i] = parseInt(plaatsen[i].getAttribute("nr_geb"));};
		if ((soort == 'doop')       && (plaatsen[i].getAttribute("nr_doop") != null)) {iAantal[i] = parseInt(plaatsen[i].getAttribute("nr_doop"));};
		if ((soort == 'overlijden') && (plaatsen[i].getAttribute("nr_ovl")  != null)) {iAantal[i] = parseInt(plaatsen[i].getAttribute("nr_ovl"));};
		if ((soort == 'begrafenis') && (plaatsen[i].getAttribute("nr_begr") != null)) {iAantal[i] = parseInt(plaatsen[i].getAttribute("nr_begr"));};
		if ((soort == 'relatie')    && (plaatsen[i].getAttribute("nr_rel")  != null)) {iAantal[i] = parseInt(plaatsen[i].getAttribute("nr_rel"));};
		if ((soort == 'woon')       && (plaatsen[i].getAttribute("nr_woon") != null)) {iAantal[i] = parseInt(plaatsen[i].getAttribute("nr_woon"));};
		if (iAantal[i] > 0 ) { iAantalPos ++; }
		if (iAantal[i] > 0)
		{
			if (iAantal[i] > maxAantal)	{iaantalmax = i; maxAantal = iAantal[i];}
			if (lat[i] > latmax) {ilatmax = i; latmax = lat[i];}
			if (lat[i] < latmin) {ilatmin = i; latmin = lat[i];}
			if (lng[i] > lngmax) {ilngmax = i; lngmax = lng[i];}
			if (lng[i] < lngmin) {ilngmin = i; lngmin = lng[i];}
		}
	}
	switch(soort)
	{
		case 'geboorte':
			gebeurtenis = Txt_geboren(taal);
			kleur = 'blue';
			break;
		case 'doop':
			gebeurtenis = Txt_gedoopt(taal);
			kleur = 'blue';
			break;
		case 'overlijden':
			gebeurtenis = Txt_overleden(taal);
			kleur = 'red';
			break;
		case 'begrafenis':
			gebeurtenis = Txt_begraven(taal);
			kleur = 'red';
			break;
		case 'relatie':
			gebeurtenis = Txt_begonnen(taal);
			kleur = 'green';
			break;
		case 'woon':
			gebeurtenis = Txt_woonachtig(taal);
			kleur = 'orange';
			break;
	}
	if (iAantalPos > 0)
	{
		var myLatlng = new google.maps.LatLng((latmin + latmax)/2,(lngmin + lngmax)/2); 
		var zoom = 1;
		var marge = 0.05;
		var latlngsw = new google.maps.LatLng(latmin - marge, lngmin - marge);
		var latlngne = new google.maps.LatLng(latmax + marge, lngmax + marge);
		var latlngb = new google.maps.LatLngBounds(latlngsw,latlngne);
		var myOptions = { zoom: zoom, center: myLatlng, mapTypeId: google.maps.MapTypeId.TERRAIN };
		plaatsmap = new google.maps.Map(document.getElementById("map"), myOptions);
		plaatsmap.fitBounds(latlngb);
		var nr_pos = 0;

		for (var i = 0; i < plaatsen.length; i++)
		{
			if (iAantal[i] > 0)
			{
				nr_pos++;
				htmls[i] = iAantal[i] + ' ';
				if (iAantal[i] == 1)
				{
					if (soort == 'relatie')
					{
						htmls[i] += Txt_relatie(taal);
					}
					else
					{
						htmls[i] += Txt_persoon(taal);
					}
					htmls[i] += ' ' + Txt_is(taal);
				}
				else
				{
					if (soort == 'relatie')
					{
						htmls[i] += Txt_relaties(taal);
					}
					else
					{
						htmls[i] += Txt_personen(taal);
					}
					htmls[i] += ' ' + Txt_zijn(taal);
				}
				htmls[i] += ' ' + gebeurtenis + ' ' + Txt_in(taal) + ' ' + plaatsnaam[i];
				var label     = plaatsnaam[i] + ' (' + iAantal[i] + ')';
				latlng[i]    = new google.maps.LatLng(lat[i],lng[i]);
				if (maxAantal == 1)	{var n = 30;}
				else {var n = 20 + iAantal[i] * 30 / maxAantal;}
				var image     = new google.maps.MarkerImage(
					'http://maps.google.com/mapfiles/ms/micons/' + kleur + '.png',
					new google.maps.Size(n, n), // The size
					new google.maps.Point(0, 0), // The origin
					new google.maps.Point(n/4, n), // The anchor
					new google.maps.Size(n/2, n) // The scalesize
				);
				var marker    = new google.maps.Marker({position: latlng[i], map: plaatsmap, title: htmls[i], icon:image});
				gmarkers[i]   = marker;
				(function(i, marker) {
					google.maps.event.addListener(gmarkers[i], 'click', function() {
						var infowindow = new google.maps.InfoWindow({content: htmls[i]});
						infowindow.open(plaatsmap, gmarkers[i]);
						});
					})(i, marker);
			}
		}
	}
}

var persoon_plaatsen = [];
var plaats_ind = [];
var plaats_ind_inv = [];
var persoon_kleur = [];

function KaartPersoon(naam)
{
	HaalGegevensPersoonsplaatsen(naam);
	MaakKaartPersoon();
}

function HaalGegevensPersoonsplaatsen(naam)
{
	plaats_ind.length = 0;
	plaats_ind_inv.length = 0;
	persoon_plaatsen.length = 0;
	persoon_kleur.length = 0;
	var indx = 0;
	var nodePersoon = source.selectSingleNode("//PERSOON[@link=" + naam + "]");
	var plaats;
	plaats = selectSingleNode(source,"EVENTS/BIRTH/@place",nodePersoon);
   	if (plaats != null) { if (VindPlaatsnaam(plaats.nodeValue,indx)) {persoon_plaatsen[indx] = plaats.nodeValue; persoon_kleur[indx] = 'red'; indx ++; }}
	plaats = selectSingleNode(source,"EVENTS/REGB/@place",nodePersoon);
   	if (plaats != null) { if (VindPlaatsnaam(plaats.nodeValue,indx)) {persoon_plaatsen[indx] = plaats.nodeValue; persoon_kleur[indx] = 'red'; indx ++; }}
	plaats = selectSingleNode(source,"EVENTS/BAPT/@place",nodePersoon);
   	if (plaats != null) { if (VindPlaatsnaam(plaats.nodeValue,indx)) {persoon_plaatsen[indx] = plaats.nodeValue; persoon_kleur[indx] = 'red'; indx ++; }}
	plaats = selectSingleNode(source,"EVENTS/DEATH/@place",nodePersoon);
   	if (plaats != null) { if (VindPlaatsnaam(plaats.nodeValue,indx)) {persoon_plaatsen[indx] = plaats.nodeValue; persoon_kleur[indx] = 'red'; indx ++; }}
	plaats = selectSingleNode(source,"EVENTS/REG/@place",nodePersoon);
   	if (plaats != null) { if (VindPlaatsnaam(plaats.nodeValue,indx)) {persoon_plaatsen[indx] = plaats.nodeValue; persoon_kleur[indx] = 'red'; indx ++; }}
	plaats = selectSingleNode(source,"EVENTS/BURI/@place",nodePersoon);
   	if (plaats != null) { if (VindPlaatsnaam(plaats.nodeValue,indx)) {persoon_plaatsen[indx] = plaats.nodeValue; persoon_kleur[indx] = 'red'; indx ++; }}
	var nodeRelations = selectSingleNode(source,"RELATIONS",nodePersoon);
	if (nodeRelations != null)
	{
		var relations = nodeRelations.selectNodes("RELA");
   		if (relations != null)
   		{
	   		for (i=0;i<relations.length;i++)
	   		{
				plaats = relations[i].selectSingleNode("BEGIN/@place");
   				if (plaats != null) { if (VindPlaatsnaam(plaats.nodeValue,indx)) {persoon_plaatsen[indx] = plaats.nodeValue; persoon_kleur[indx] = 'red'; indx ++; }}
				plaats = relations[i].selectSingleNode("MARL/@place");
   				if (plaats != null) { if (VindPlaatsnaam(plaats.nodeValue,indx)) {persoon_plaatsen[indx] = plaats.nodeValue; persoon_kleur[indx] = 'red'; indx ++; }}
				plaats = relations[i].selectSingleNode("MARC/@place");
   				if (plaats != null) { if (VindPlaatsnaam(plaats.nodeValue,indx)) {persoon_plaatsen[indx] = plaats.nodeValue; persoon_kleur[indx] = 'red'; indx ++; }}
				plaats = relations[i].selectSingleNode("END/@place");
   				if (plaats != null) { if (VindPlaatsnaam(plaats.nodeValue,indx)) {persoon_plaatsen[indx] = plaats.nodeValue; persoon_kleur[indx] = 'red'; indx ++; }}
				linkRelatie = relations[i].selectSingleNode("@link");
				if (linkRelatie != null)
				{
					var nodeRelatie = source.selectSingleNode("//PERSOON[@link=" + linkRelatie.nodeValue + "]");
					if (nodeRelatie != null)
					{
						plaats = selectSingleNode(source,"EVENTS/BIRTH/@place",nodeRelatie);
   						if (plaats != null) { if (VindPlaatsnaam(plaats.nodeValue,indx)) {persoon_plaatsen[indx] = plaats.nodeValue; persoon_kleur[indx] = 'blue'; indx ++; }}
						plaats = selectSingleNode(source,"EVENTS/DEATH/@place",nodeRelatie);
	   					if (plaats != null) { if (VindPlaatsnaam(plaats.nodeValue,indx)) {persoon_plaatsen[indx] = plaats.nodeValue; persoon_kleur[indx] = 'blue'; indx ++; }}
					}
				}
	   		}
   		}
	}
	var linkFather = selectSingleNode(source,"FATHER/@link",nodePersoon);
	if (linkFather != null)
	{
		var nodeFather = source.selectSingleNode("//PERSOON[@link=" + linkFather.nodeValue + "]");
		if (nodeFather != null)
		{
			plaats = selectSingleNode(source,"EVENTS/BIRTH/@place",nodeFather);
			if (plaats != null) { if (VindPlaatsnaam(plaats.nodeValue,indx)) {persoon_plaatsen[indx] = plaats.nodeValue; persoon_kleur[indx] = 'green'; indx ++; }}
			plaats = selectSingleNode(source,"EVENTS/DEATH/@place",nodeFather);
			if (plaats != null) { if (VindPlaatsnaam(plaats.nodeValue,indx)) {persoon_plaatsen[indx] = plaats.nodeValue; persoon_kleur[indx] = 'green'; indx ++; }}
		}
	}
	var linkMother = selectSingleNode(source,"MOTHER/@link",nodePersoon);
	if (linkMother != null)
	{
		var nodeMother = source.selectSingleNode("//PERSOON[@link=" + linkMother.nodeValue + "]");
		if (nodeMother != null)
		{
			plaats = selectSingleNode(source,"EVENTS/BIRTH/@place",nodeMother);
			if (plaats != null) { if (VindPlaatsnaam(plaats.nodeValue,indx)) {persoon_plaatsen[indx] = plaats.nodeValue; persoon_kleur[indx] = 'green'; indx ++; }}
			plaats = selectSingleNode(source,"EVENTS/DEATH/@place",nodeMother);
			if (plaats != null) { if (VindPlaatsnaam(plaats.nodeValue,indx)) {persoon_plaatsen[indx] = plaats.nodeValue; persoon_kleur[indx] = 'green'; indx ++; }}
		}
	}
}

function MaakKaartPersoon()
{
	var ilatmax = 0;
	var ilatmin = 0;
	var ilngmax = 0;
	var ilngmin = 0;
	var latmax = -1000;
	var latmin = 1000;
	var lngmax = -1000;
	var lngmin = 1000;
	var latlng = [];
	for (var i = 0; i < persoon_plaatsen.length; i++)
	{
		if (lat[plaats_ind[i]] > latmax) {ilatmax = plaats_ind[i]; latmax = lat[plaats_ind[i]];}
		if (lat[plaats_ind[i]] < latmin) {ilatmin = plaats_ind[i]; latmin = lat[plaats_ind[i]];}
		if (lng[plaats_ind[i]] > lngmax) {ilngmax = plaats_ind[i]; lngmax = lng[plaats_ind[i]];}
		if (lng[plaats_ind[i]] < lngmin) {ilngmin = plaats_ind[i]; lngmin = lng[plaats_ind[i]];}
	}
	if (persoon_plaatsen.length > 0) { var myLatlng = new google.maps.LatLng((latmin + latmax)/2,(lngmin + lngmax)/2); }
	else { var myLatlng = new google.maps.LatLng(0,0); }
	var zoom = 1;
	var marge = 0.05;
	var latlngsw = new google.maps.LatLng(latmin - marge, lngmin - marge);
	var latlngne = new google.maps.LatLng(latmax + marge, lngmax + marge);
	var latlngb = new google.maps.LatLngBounds(latlngsw,latlngne);
	var myOptions = { zoom: zoom, center: myLatlng, mapTypeId: google.maps.MapTypeId.TERRAIN };
	plaatsmap = new google.maps.Map(document.getElementById("map"), myOptions);
	plaatsmap.fitBounds(latlngb);

	for (var i = persoon_plaatsen.length - 1; i >= 0; i--)
	{
			latlng[i]    = new google.maps.LatLng(lat[plaats_ind[i]],lng[plaats_ind[i]]);
			var n = 30;
			var image     = new google.maps.MarkerImage(
				'http://maps.google.com/mapfiles/ms/micons/' + persoon_kleur[i] + '.png',
				new google.maps.Size(n, n), // The size
				new google.maps.Point(0, 0), // The origin
				new google.maps.Point(n/4, n), // The anchor
				new google.maps.Size(n/2, n) // The scalesize
			);
			var marker    = new google.maps.Marker({position: latlng[i], map: plaatsmap, title: persoon_plaatsen[i], icon:image});
			gmarkers[i]   = marker;
			(function(i, marker) {
				google.maps.event.addListener(gmarkers[i], 'click', function() {
					var infowindow = new google.maps.InfoWindow({content: persoon_plaatsen[i]});
					infowindow.open(plaatsmap, gmarkers[i]);
					});
				})(i, marker);
	}
}

function VindPlaatsnaam(plaats,indx)
{
	if (!kaartGeladen)
	{
		LaadKaartGegevens();
		kaartGeladen = true;
	}
	j = 0;
	found = false;
	while ((!found) && j < (plaatsen.length))
	{
		if (plaats == plaatsnaam[j])
		{
			found = true;
			plaats_ind[indx] = j;
			plaats_ind_inv[j] = indx;
		}
		j++;
	}
	return found;
}
// =========================== Einde code voor plaatskaarten ===========================

// =========================== Code voor vertalingen ===========================
function Txt_aantal_beurten(taal)
{
	if (taal == 'nederlands') return "aantal beurten";
	if (taal == 'engels') return "number of rounds";
	if (taal == 'frans') return "nombre des tours";
	if (taal == 'duits') return "Rundenzahl";
	if (taal == 'fries') return "oantal beurten";
	if (taal == 'noors') return "oantal svinger";
	if (taal == 'spaans') return "número de rondas";
	if (taal == 'italiaans') return "numero di giri";
	if (taal == 'portugees') return "número de rodadas";
}
function Txt_Alles_gevonden_in(taal)
{
	if (taal == 'nederlands') return "Alles gevonden in";
	if (taal == 'engels') return "Found everything in";
	if (taal == 'frans') return "Trouvé tout en";
	if (taal == 'duits') return "Alles gefunden in";
	if (taal == 'fries') return "Alles fûn yn";
	if (taal == 'noors') return "Alle referanser i";
	if (taal == 'spaans') return "Todo encontrado en";
	if (taal == 'italiaans') return "Tutto trovato";
	if (taal == 'portugees') return "Encontrado tudo no";
}
function Txt_ander_rapport(taal)
{
	if (taal == 'nederlands') return "Klik in de menubalk bovenaan de pagina om naar een ander rapport te gaan";
	if (taal == 'engels') return "Click in the menubar above to go to another report";
	if (taal == 'frans') return "Pressez en le table ci-dessus pour voir un autre rapport";
	if (taal == 'duits') return "Drücken Sie in die Tabelle hir oben für eine andere Reportage";
	if (taal == 'fries') return "Klik yn de menubalk boppeoan de side om nei in oar rapport te gean";
	if (taal == 'noors') return "I menylinjen øverst på siden Klikk for å gå til en annen rapport";
	if (taal == 'spaans') return "Haga clic en la barra de menú superior para ir a otro informe";
	if (taal == 'italiaans') return "Fare clic nella barra dei menu in alto per andare in un altro rapporto";
	if (taal == 'portugees') return "Clique na barra de menu acima para ir ao outro relatório";
}
function Txt_begonnen(taal)
{
	if (taal == 'nederlands') return "begonnen";
	if (taal == 'engels') return "started";
	if (taal == 'frans') return "commencée";
	if (taal == 'duits') return "angefangen";
	if (taal == 'fries') return "begonnen";
	if (taal == 'noors') return "startet";
	if (taal == 'spaans') return "comenzado";
	if (taal == 'italiaans') return "iniziato";
	if (taal == 'portugees') return "começou";
}
function Txt_begraven(taal)
{
	if (taal == 'nederlands') return "begraven";
	if (taal == 'engels') return "buried";
	if (taal == 'frans') return "inhumé";
	if (taal == 'duits') return "beerdigt";
	if (taal == 'fries') return "begrave";
	if (taal == 'noors') return "gravlagt";
	if (taal == 'spaans') return "enterrado";
	if (taal == 'italiaans') return "sepolto";
	if (taal == 'portugees') return "enterrado";
}
function Txt_beurten(taal)
{
	if (taal == 'nederlands') return "beurten";
	if (taal == 'engels') return "rounds";
	if (taal == 'frans') return "tours";
	if (taal == 'duits') return "Runden";
	if (taal == 'fries') return "beurten";
	if (taal == 'noors') return "svinger";
	if (taal == 'spaans') return "vueltas";
	if (taal == 'italiaans') return "giri";
	if (taal == 'portugees') return "voltas";
}
function Txt_doorgaantekst(taal)
{
	if (taal == 'nederlands') return "Druk op spatiebalk om door te gaan";
	if (taal == 'engels') return "Press Spacebar to continue";
	if (taal == 'frans') return "Appuyez sur la barre d'espace pour continuer";
	if (taal == 'duits') return "Drücken Sie die Leertaste, um fortzufahren";
	if (taal == 'fries') return "Drok op spatiebalk om troch te gean";
	if (taal == 'noors') return "TTrykk space for å fortsette";
	if (taal == 'spaans') return "Presione la barra espaciadora para continuar";
	if (taal == 'italiaans') return "Premere la barra spaziatrice per continuare";
	if (taal == 'portugees') return "Pressione barra de espaço para continuar";
}
function Txt_en(taal)
{
	if (taal == 'nederlands') return "en";
	if (taal == 'engels') return "and";
	if (taal == 'frans') return "et";
	if (taal == 'duits') return "und";
	if (taal == 'fries') return "en";
	if (taal == 'noors') return "og";
	if (taal == 'spaans') return "y";
	if (taal == 'italiaans') return "e";
	if (taal == 'portugees') return "e";
}
function Txt_Er_is_maar_1_foto(taal)
{
	if (taal == 'nederlands') return "Er is maar 1 foto";
	if (taal == 'engels') return "There is only 1 photo";
	if (taal == 'frans') return "Il y a 1 photo";
	if (taal == 'duits') return "Es gibt nur 1 Photo";
	if (taal == 'fries') return "Der is mar 1 foto";
	if (taal == 'noors') return "Det er bare ett bilde";
	if (taal == 'spaans') return "Hay sólo 1 foto";
	if (taal == 'italiaans') return "Vi è solo 1 foto";
	if (taal == 'portugees') return "Há apenas 1 foto";
}
function Txt_Er_zijn(taal)
{
	if (taal == 'nederlands') return "Er zijn";
	if (taal == 'engels') return "There are";
	if (taal == 'frans') return "Il y a";
	if (taal == 'duits') return "Es gibt";
	if (taal == 'fries') return "Der binne";
	if (taal == 'noors') return "Det er";
	if (taal == 'spaans') return "Hay";
	if (taal == 'italiaans') return "Ci sono";
	if (taal == 'portugees') return "Há";
}
function Txt_er_zijn_minstens(taal)
{
	if (taal == 'nederlands') return "er zijn minstens";
	if (taal == 'engels') return "you need at least";
	if (taal == 'frans') return "on a besoin d'au moins de";
	if (taal == 'duits') return "mann braucht minestens";
	if (taal == 'fries') return "der syn op syn minst";
	if (taal == 'noors') return "det er minst";
	if (taal == 'spaans') return "hay por lo menos";
	if (taal == 'italiaans') return "è necessario almeno";
	if (taal == 'portugees') return "você precisa de pelo menos";
}
function Txt_FotoMemory(taal)
{
	if (taal == 'nederlands') return "FotoMemory - vind de overeenkomstige fotoparen";
	if (taal == 'engels') return "PhotoMemory - find the corresponding pairs of photos";
	if (taal == 'frans') return "Mémoires des photos - trouvez les couples de photos correspondant";
	if (taal == 'duits') return "PhotoMemory - suche die ähnliche Photos";
	if (taal == 'fries') return "FotoMemory - fyn de overeenkomstige fotoparen  ";
	if (taal == 'noors') return "Photo Memory - finne av tilsvarende par av bildene";
	if (taal == 'spaans') return "Memoria de archivo - encontrar los pares cosa correspondencia de fotos";
	if (taal == 'italiaans') return "Photo Memoria - trovare le coppie corrispondenza cosa di foto";
	if (taal == 'portugees') return "Photo Memory - encontrar os pares coisa correspondência de fotos";
}
function Txt_fotos(taal)
{
	if (taal == 'nederlands') return "foto's";
	if (taal == 'engels') return "photos";
	if (taal == 'frans') return "photos";
	if (taal == 'duits') return "Photos";
	if (taal == 'fries') return "foto's";
	if (taal == 'noors') return "bilder";
	if (taal == 'spaans') return "fotos";
	if (taal == 'italiaans') return "fotos";
	if (taal == 'portugees') return "fotos";
}
function Txt_fotos_nodig_om_memory_te_spelen(taal)
{
	if (taal == 'nederlands') return "foto's nodig om memory te spelen";
	if (taal == 'engels') return "photos to play memory";
	if (taal == 'frans') return "photos pour jouer mémoires des photos";
	if (taal == 'duits') return "Photos für diesen Spiel";
	if (taal == 'fries') return "foto's nedich om memory te boartsje";
	if (taal == 'noors') return "trenger å spille minne bilder";
	if (taal == 'spaans') return "fotos jueguen memoria";
	if (taal == 'italiaans') return "fotos di giocare memoria";
	if (taal == 'portugees') return "fotos para jogar memória";
}
function Txt_geboren(taal)
{
	if (taal == 'nederlands') return "geboren";
	if (taal == 'engels') return "born";
	if (taal == 'frans') return "né";
	if (taal == 'duits') return "geboren";
	if (taal == 'fries') return "berne";
	if (taal == 'noors') return "født";
	if (taal == 'spaans') return "nació";
	if (taal == 'italiaans') return "nata";
	if (taal == 'portugees') return "nasceu";
}
function Txt_gedoopt(taal)
{
	if (taal == 'nederlands') return "gedoopt";
	if (taal == 'engels') return "baptized";
	if (taal == 'frans') return "baptisé";
	if (taal == 'duits') return "getauft";
	if (taal == 'fries') return "doopt";
	if (taal == 'noors') return "døpt";
	if (taal == 'spaans') return "bautizado";
	if (taal == 'italiaans') return "battezzato";
	if (taal == 'portugees') return "batizado";
}
function Txt_het_duurde(taal)
{
	if (taal == 'nederlands') return "het duurde";
	if (taal == 'engels') return "it took";
	if (taal == 'frans') return "durée";
	if (taal == 'duits') return "es dauerte";
	if (taal == 'fries') return "it duorre";
	if (taal == 'noors') return "det tok";
	if (taal == 'spaans') return "se tomó";
	if (taal == 'italiaans') return "è preso";
	if (taal == 'portugees') return "é tomou";
}
function Txt_in(taal)
{
	if (taal == 'nederlands') return "in";
	if (taal == 'engels') return "in";
	if (taal == 'frans') return "à";
	if (taal == 'duits') return "in";
	if (taal == 'fries') return "yn";
	if (taal == 'noors') return "inn";
	if (taal == 'spaans') return "en";
	if (taal == 'italiaans') return "in";
	if (taal == 'portugees') return "em";
}
function Txt_is(taal)
{
	if (taal == 'nederlands') return "is";
	if (taal == 'engels') return "is";
	if (taal == 'frans') return "est";
	if (taal == 'duits') return "ist";
	if (taal == 'fries') return "is";
	if (taal == 'noors') return "har";
	if (taal == 'spaans') return "Hay";
	if (taal == 'italiaans') return "è";
	if (taal == 'portugees') return "sim";
}
function Txt_klik_voor_foto_in_apart_venster(taal)
{
	if (taal == 'nederlands') return "klik voor foto in apart venster";
	if (taal == 'engels') return "click for photo in separate window";
	if (taal == 'frans') return "cliquez pour agrandir la photo";
	if (taal == 'duits') return "click vor Bild im Separate Fenster";
	if (taal == 'fries') return "klik foar foto yn apart finster  ";
	if (taal == 'noors') return "klikk for bilde i eget vindu";
	if (taal == 'spaans') return "haga clic para la foto en una ventana aparte";
	if (taal == 'italiaans') return "clicca per la foto in una finestra separata";
	if (taal == 'portugees') return "clique para foto em janela separada";
}
function Txt_minuten(taal)
{
	if (taal == 'nederlands') return "minuten";
	if (taal == 'engels') return "minutes";
	if (taal == 'frans') return "minutes";
	if (taal == 'duits') return "Minuten";
	if (taal == 'fries') return "minuten";
	if (taal == 'noors') return "minutter";
	if (taal == 'spaans') return "minutos";
	if (taal == 'italiaans') return "minuti";
	if (taal == 'portugees') return "minutos";
}
function Txt_minuut(taal)
{
	if (taal == 'nederlands') return "minuut";
	if (taal == 'engels') return "minute";
	if (taal == 'frans') return "minute";
	if (taal == 'duits') return "Minute";
	if (taal == 'fries') return "minút";
	if (taal == 'noors') return "minutt";
	if (taal == 'spaans') return "minuto";
	if (taal == 'italiaans') return "minuto";
	if (taal == 'portugees') return "minuto";
}
function Txt_nogmaals_spelen(taal)
{
	if (taal == 'nederlands') return "Klik hier om nog een keer te spelen";
	if (taal == 'engels') return "Click here to play again";
	if (taal == 'frans') return "Pressez ici pour jouer une autre fois";
	if (taal == 'duits') return "Hier drücken um nochmals zu spielen";
	if (taal == 'fries') return "Klik hjir om noch in kear te boartsje";
	if (taal == 'noors') return "Klikk her for å spille igjen";
	if (taal == 'spaans') return "Haga clic aquí para volver a jugar";
	if (taal == 'italiaans') return "Clicca qui per giocare di nuovo";
	if (taal == 'portugees') return "Clique aqui para jogar novamente";
}
function Txt_overleden(taal)
{
	if (taal == 'nederlands') return "overleden";
	if (taal == 'engels') return "deceased";
	if (taal == 'frans') return "décédé";
	if (taal == 'duits') return "gestorben";
	if (taal == 'fries') return "ferstoan";
	if (taal == 'noors') return "død";
	if (taal == 'spaans') return "fallecido";
	if (taal == 'italiaans') return "defunto";
	if (taal == 'portugees') return "falecido";
}
function Txt_pauzetekst(taal)
{
	if (taal == 'nederlands') return "Druk op spatiebalk om te pauzeren";
	if (taal == 'engels') return "Press Spacebar to pause";
	if (taal == 'frans') return "Appuyez sur la barre d'espace pour mettre en pause";
	if (taal == 'duits') return "Drücken Sie die Leertaste zu unterbrechen";
	if (taal == 'fries') return "Drok op spatiebalk om te pauzeren";
	if (taal == 'noors') return "Trykk space for å pause";
	if (taal == 'spaans') return "Presione la barra espaciadora para pausar";
	if (taal == 'italiaans') return "Premere la barra spaziatrice per mettere in pausa";
	if (taal == 'portugees') return "Pressione barra de espaço para pausar";
}
function Txt_personen(taal)
{
	if (taal == 'nederlands') return "personen";
	if (taal == 'engels') return "persons";
	if (taal == 'frans') return "personnes";
	if (taal == 'duits') return "Personen";
	if (taal == 'fries') return "persoanen";
	if (taal == 'noors') return "personer";
	if (taal == 'spaans') return "personas";
	if (taal == 'italiaans') return "persone";
	if (taal == 'portugees') return "pessoas";
}
function Txt_persoon(taal)
{
	if (taal == 'nederlands') return "persoon";
	if (taal == 'engels') return "person";
	if (taal == 'frans') return "personne";
	if (taal == 'duits') return "Person";
	if (taal == 'fries') return "persoan";
	if (taal == 'noors') return "person";
	if (taal == 'spaans') return "persona";
	if (taal == 'italiaans') return "persona";
	if (taal == 'portugees') return "pessoa";
}
function Txt_relatie(taal)
{
	if (taal == 'nederlands') return "relatie";
	if (taal == 'engels') return "relationship";
	if (taal == 'frans') return "relation";
	if (taal == 'duits') return "Beziehung";
	if (taal == 'fries') return "relaasje";
	if (taal == 'noors') return "relasjon";
	if (taal == 'spaans') return "relación";
	if (taal == 'italiaans') return "relazione";
	if (taal == 'portugees') return "relação";
}
function Txt_relaties(taal)
{
	if (taal == 'nederlands') return "relaties";
	if (taal == 'engels') return "relationships";
	if (taal == 'frans') return "relations";
	if (taal == 'duits') return "Beziehungen";
	if (taal == 'fries') return "relaasjes";
	if (taal == 'noors') return "relasjoner";
	if (taal == 'spaans') return "relaciones";
	if (taal == 'italiaans') return "relazioni";
	if (taal == 'portugees') return "relações";
}
function Txt_seconde(taal)
{
	if (taal == 'nederlands') return "seconde";
	if (taal == 'engels') return "seconds";
	if (taal == 'frans') return "secondes";
	if (taal == 'duits') return "Sekunden";
	if (taal == 'fries') return "sekondus";
	if (taal == 'noors') return "sekunder";
	if (taal == 'spaans') return "segundos";
	if (taal == 'italiaans') return "secondi";
	if (taal == 'portugees') return "segundos";
}
function Txt_standaard(taal)
{
	if (taal == 'nederlands') return "standaard";
	if (taal == 'engels') return "standard";
	if (taal == 'frans') return "normal";
	if (taal == 'duits') return "standard";
	if (taal == 'fries') return "standart";
	if (taal == 'noors') return "standard";
	if (taal == 'spaans') return "estándar";
	if (taal == 'italiaans') return "predefinizione";
	if (taal == 'portugees') return "padrão";
}
function Txt_uur(taal)
{
	if (taal == 'nederlands') return "uur";
	if (taal == 'engels') return "hour";
	if (taal == 'frans') return "heure";
	if (taal == 'duits') return "Stunde";
	if (taal == 'fries') return "oere";
	if (taal == 'noors') return "time";
	if (taal == 'spaans') return "hora";
	if (taal == 'italiaans') return "ora";
	if (taal == 'portugees') return "hora";
}
function Txt_Vergroten(taal)
{
	if (taal == 'nederlands') return "Vergroten";
	if (taal == 'engels') return "Enlarge";
	if (taal == 'frans') return "Agrandir";
	if (taal == 'duits') return "Vergrößern";
	if (taal == 'fries') return "Fergrutsjen";
	if (taal == 'noors') return "øke";
	if (taal == 'spaans') return "Aumentar";
	if (taal == 'italiaans') return "Aumentare";
	if (taal == 'portugees') return "Aumentar";
}
function Txt_verkleinen(taal)
{
	if (taal == 'nederlands') return "verkleinen";
	if (taal == 'engels') return "shrink";
	if (taal == 'frans') return "réduire";
	if (taal == 'duits') return "reduzieren";
	if (taal == 'fries') return "verkleinen  ";
	if (taal == 'noors') return "redusere";
	if (taal == 'spaans') return "reducir";
	if (taal == 'italiaans') return "ridurre";
	if (taal == 'portugees') return "reduzir";
}
function Txt_verstreken_tijd(taal)
{
	if (taal == 'nederlands') return "verstreken tijd";
	if (taal == 'engels') return "time elapsed";
	if (taal == 'frans') return "temps passé";
	if (taal == 'duits') return "verstrichene Zeit";
	if (taal == 'fries') return "ferrûn tiid";
	if (taal == 'noors') return "medgått tid";
	if (taal == 'spaans') return "tiempo transcurrido";
	if (taal == 'italiaans') return "tempo trascorso";
	if (taal == 'portugees') return "tempo decorrido";
}
function Txt_woonachtig(taal)
{
	if (taal == 'nederlands') return "woonachtig";
	if (taal == 'engels') return "living";
	if (taal == 'frans') return "domicile";
	if (taal == 'duits') return "wohnhaft";
	if (taal == 'fries') return "wenjend";
	if (taal == 'noors') return "resident";
	if (taal == 'spaans') return "resident";
	if (taal == 'italiaans') return "resident";
	if (taal == 'portugees') return "resident";
}
function Txt_zijn(taal)
{
	if (taal == 'nederlands') return "zijn";
	if (taal == 'engels') return "are";
	if (taal == 'frans') return "sont";
	if (taal == 'duits') return "sind";
	if (taal == 'fries') return "syn";
	if (taal == 'noors') return "finnes";
	if (taal == 'spaans') return "son";
	if (taal == 'italiaans') return "sono";
	if (taal == 'portugees') return "são";
}
// =========================== Einde code voor vertalingen ===========================

