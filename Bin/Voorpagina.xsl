<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">
<!--
// <author>Adrie den Blanken</author>
// <file>$Workfile: Voorpagina.xsl $</file><date>$Date: 15-01-15 8:20 $</date>
// <revision>$Revision: 18 $</revision><release>1.0</release>
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
<xsl:param name="parToonDuits"/>
<xsl:param name="parToonEngels"/>
<xsl:param name="parToonFrans"/>
<xsl:param name="parToonFries"/>
<xsl:param name="parToonNoors"/>
<xsl:param name="parToonSpaans"/>
<xsl:param name="parToonItaliaans"/>
<xsl:param name="parToonPortugees"/>

<!--
Het begin
-->

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
</xsl:for-each>

<div align="center">
  <xsl:if test="$parToonDuits = 1 or $parToonEngels = 1 or $parToonFrans = 1 or $parToonFries = 1 or $parToonNoors = 1 or $parToonSpaans = 1 or $parToonItaliaans = 1 or $parToonPortugees = 1">
	<table cellpadding="10" border="0">
		<tr>
			<td>
            	<a href="javascript:WijzigTaal('nederlands',{$HuidigPersoon})" name="vlag"
                	onMouseOver = "window.status='Nederlands'; return true;"
                    onMouseOut  = "window.status='';"
                    onMouseDown = "window.status='Nederlands'">
                    <img src="Bin/nederland.gif" alt="" name="vlag" height="30" border="1" bordercolor="black"/>
                  </a>
			</td>
			<xsl:if test="$parToonEngels = 1">
				<td>
    	        	<a href="javascript:WijzigTaal('engels',{$HuidigPersoon})" name="vlag"
        	        	onMouseOver = "window.status='English'; return true;"
            	        onMouseOut  = "window.status='';"
                	    onMouseDown = "window.status='English'">
                    	<img src="Bin/grootbrittanie.gif" alt="" name="vlag" height="30" border="1" bordercolor="black"/>
	                  </a>
				</td>
			</xsl:if>
			<xsl:if test="$parToonFrans = 1">
				<td>
    	        	<a href="javascript:WijzigTaal('frans',{$HuidigPersoon})" name="vlag"
        	        	onMouseOver = "window.status='Francais'; return true;"
            	        onMouseOut  = "window.status='';"
                	    onMouseDown = "window.status='Francais'">
                    	<img src="Bin/frankrijk.gif" alt="" name="vlag" height="30" border="1" bordercolor="black"/>
	                  </a>
				</td>
			</xsl:if>
			<xsl:if test="$parToonDuits = 1">
				<td>
    	        	<a href="javascript:WijzigTaal('duits',{$HuidigPersoon})" name="vlag"
        	        	onMouseOver = "window.status='Deutsch'; return true;"
            	        onMouseOut  = "window.status='';"
                	    onMouseDown = "window.status='Deutsch'">
                    	<img src="Bin/duitsland.gif" alt="" name="vlag" height="30" border="1" bordercolor="black"/>
	                  </a>
				</td>
			</xsl:if>
			<xsl:if test="$parToonFries = 1">
				<td>
    	        	<a href="javascript:WijzigTaal('fries',{$HuidigPersoon})" name="vlag"
        	        	onMouseOver = "window.status='Frysian'; return true;"
            	        onMouseOut  = "window.status='';"
                	    onMouseDown = "window.status='Frysian'">
                    	<img src="Bin/friesland.gif" alt="" name="vlag" height="30" border="1" bordercolor="black"/>
	                  </a>
				</td>
			</xsl:if>
			<xsl:if test="$parToonNoors = 1">
				<td>
    	        	<a href="javascript:WijzigTaal('noors',{$HuidigPersoon})" name="vlag"
        	        	onMouseOver = "window.status='Norsk'; return true;"
            	        onMouseOut  = "window.status='';"
                	    onMouseDown = "window.status='Norsk'">
                    	<img src="Bin/noorwegen.gif" alt="" name="vlag" height="30" border="1" bordercolor="black"/>
	                  </a>
				</td>
			</xsl:if>
			<xsl:if test="$parToonSpaans = 1">
				<td>
    	        	<a href="javascript:WijzigTaal('spaans',{$HuidigPersoon})" name="vlag"
        	        	onMouseOver = "window.status='Espa�ol'; return true;"
            	        onMouseOut  = "window.status='';"
                	    onMouseDown = "window.status='Espa�ol'">
                    	<img src="Bin/spanje.gif" alt="" name="vlag" height="30" border="1" bordercolor="black"/>
	                  </a>
				</td>
			</xsl:if>
			<xsl:if test="$parToonItaliaans = 1">
				<td>
    	        	<a href="javascript:WijzigTaal('italiaans',{$HuidigPersoon})" name="vlag"
        	        	onMouseOver = "window.status='Italiano'; return true;"
            	        onMouseOut  = "window.status='';"
                	    onMouseDown = "window.status='Italiano'">
                    	<img src="Bin/italie.gif" alt="" name="vlag" height="30" border="1" bordercolor="black"/>
	                  </a>
				</td>
			</xsl:if>
			<xsl:if test="$parToonPortugees = 1">
				<td>
    	        	<a href="javascript:WijzigTaal('portugees',{$HuidigPersoon})" name="vlag"
        	        	onMouseOver = "window.status='Portugu�s'; return true;"
            	        onMouseOut  = "window.status='';"
                	    onMouseDown = "window.status='Portugu�s'">
                    	<img src="Bin/portugal.gif" alt="" name="vlag" height="30" border="1" bordercolor="black"/>
	                  </a>
				</td>
			</xsl:if>
		</tr>
	</table>
  </xsl:if>
</div>
<div align="center">
  <xsl:if test="$parTaal = 'nederlands'">
	<h3>
	  <xsl:choose>
	    <xsl:when test="$refAchternaam">
	      Welkom bij de stamboom van de familie
	      <xsl:if test="$refPrefix">
	        <xsl:value-of select="$refPrefix"/><xsl:text> </xsl:text>
	      </xsl:if>
	      <xsl:value-of select="$refAchternaam"/>
	    </xsl:when>
	    <xsl:otherwise>
	      Welkom bij dit stamboombestand
	    </xsl:otherwise>
	  </xsl:choose>
	</h3>
	Dit bestand bevat de gegevens van <xsl:value-of select="count(//PERSONEN/PERSOON[@link!=0])"/> personen.
	<br/><br/>
	Bovenaan elke pagina staan twee regels: een met overzichten van een persoon en een met algemene overzichten.<br/><br />
	Door op een van de blokken te klikken verschijnt het betreffende rapport,<br />
	 of verschijnt een vervolgpagina waar rapporten van deze categorie gekozen kunnen worden.<br />
  Door te klikken op de knop Instellingen kunt u de rapporten naar eigen smaak aanpassen.
	<br/><br/>
	De overzichten van een persoon hebben steeds betrekking op de laatst geselecteerde persoon.<br/>
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
	Voor meer toelichting, klik op Help in de knoppenbalk hierboven.<br /><br />
	Om de stamboom in te gaan, klik op een van de andere blokken.
  <br/>
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
  <xsl:if test="string-length($refOwnerEMail)!=0 and string-length($refOwner)!=0">
  	<br /><br />Heeft u aanvullende informatie of andere opmerkingen om de stamboom	te verbeteren, <br />stuur deze informatie dan naar:
  	<a href="mailto:{$refOwnerEMail}?subject={$subject}"><xsl:value-of select="$refOwner"/></a>.
  </xsl:if>
  <br/><br/><br />
  <i>Stamboombestand gegenereerd met <xsl:value-of select="//FLEXITREE/@version"/> op <xsl:value-of select="//FLEXITREE/@date"/></i>
  </xsl:if>

  <xsl:if test="$parTaal = 'engels'">
	<h3>
	  <xsl:choose>
	    <xsl:when test="$refAchternaam">
	      Welcome to the
	      <xsl:if test="$refPrefix">
	        <xsl:value-of select="$refPrefix"/><xsl:text> </xsl:text>
	      </xsl:if>
	      <xsl:value-of select="$refAchternaam"/><xsl:text>'</xsl:text>
	      <xsl:if test="substring($refAchternaam,string-length($refAchternaam),1) != 's'"><xsl:text>s</xsl:text></xsl:if>
	      <xsl:text> </xsl:text>family tree
	    </xsl:when>
	    <xsl:otherwise>
	      Welcome to this family tree
	    </xsl:otherwise>
	  </xsl:choose>
	</h3>
	This database contains the data of <xsl:value-of select="count(//PERSONEN/PERSOON[@link!=0])"/> persons.
	<br/><br/>
	At the top of each page you will find two lines:<br /> one consisting of reports about a person and one consisting of global reports.<br/><br />
	By clicking one of the blocks either the corresponding report will be displayed,<br />
	 or you will see a listing on a following page where reports belonging to this category may be chosen from.<br />
    By clicking the button Preferences you may adapt the reports to your own liking.
	<br/><br/>
	Reports about a person are always related to last selected person.<br/>
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
	<br /><br />
	For supplementary explanation click Help in the menu bar above.<br /><br />
	To enter the dynamic family tree click one of the other blocks.
  <br/>
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
  <xsl:if test="string-length($refOwnerEMail)!=0 and string-length($refOwner)!=0">
  	<br /><br />In case you might have additional information or other remarks to improve the
    <xsl:if test="string-length($refPrefix)>0"><xsl:value-of select="$refPrefix"/><xsl:value-of select="$nbsp"/></xsl:if><xsl:value-of select="$refAchternaam"/><xsl:text>'</xsl:text>
    <xsl:if test="substring($refAchternaam,string-length($refAchternaam),1) != 's'"><xsl:text>s</xsl:text></xsl:if>
    family tree,<br /> please send this information to
  	<a href="mailto:{$refOwnerEMail}?subject={$subject}"><xsl:value-of select="$refOwner"/></a>.
  </xsl:if>
  <br/><br/><br />
  <i>Database generated by means of <xsl:value-of select="//FLEXITREE/@version"/> on <xsl:value-of select="//FLEXITREE/@date"/></i>
  </xsl:if>
  
  <xsl:if test="$parTaal = 'frans'">
	<h3>
	  <xsl:choose>
	    <xsl:when test="$refAchternaam">
	      Bienvenue � l'arbre g�n�alogique de la famille
	      <xsl:if test="$refPrefix">
	        <xsl:value-of select="$refPrefix"/><xsl:text> </xsl:text>
	      </xsl:if>
	      <xsl:value-of select="$refAchternaam"/>
	    </xsl:when>
	    <xsl:otherwise>
	      Bienvenue a cet arbre g�n�alogique
	    </xsl:otherwise>
	  </xsl:choose>
	</h3>
	Cet arbre g�n�alogique contient les donn�es de <xsl:value-of select="count(//PERSONEN/PERSOON[@link!=0])"/> personnes.
	<br/><br/>
	En t�te de chaque page se trouvent deux lignes: l'une pr�sentant les r�sum�s d'une personne et l'autre, un r�sume de l'ensemble.<br/><br />
	En cliquant sur une case, le rapport correspondant sera affich� ou une page appara�tra,<br /> sur laquelle un r�sum� au choix peut �tre s�lectionn�.<br />
    En cliquant la case Pr�f�rences il vous est possible d'adapter la repr�sentation � votre guise.
	<br/><br/>
	Les r�sum�s d'une personne sont relatifs � la derni�re personne s�lectionn�e.<br/>
	 En ce moment il s'agit de
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
	Pour plus d'explications cliquez la case 'Aide'. <br />
	Pour d�marer l'arbre g�n�alogique dynamique, cliquez une des autres cases.
  <br/>
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
  <xsl:if test="string-length($refOwnerEMail)!=0 and string-length($refOwner)!=0">
  	<br /><br />Avez-vous de l'information compl�mentaire ou des remarques afin d'am�liorer <br />l'arbre g�n�alogique de la famille
    <xsl:if test="string-length($refPrefix)>0"><xsl:value-of select="$refPrefix"/><xsl:value-of select="$nbsp"/></xsl:if><xsl:value-of select="$refAchternaam"/>
    <br />envoyez les s.v.p. par couriel �:
  	<a href="mailto:{$refOwnerEMail}?subject={$subject}"><xsl:value-of select="$refOwner"/></a>
  </xsl:if>
  <br/><br/><br />
  <i>Arbre g�n�alogique g�n�r� avec <xsl:value-of select="//FLEXITREE/@version"/> � <xsl:value-of select="//FLEXITREE/@date"/></i>
  </xsl:if>
  
  <xsl:if test="$parTaal = 'duits'">
	<h3>
	  <xsl:choose>
	    <xsl:when test="$refAchternaam">
	      Willkommen in der Genealogie der Familie
	      <xsl:if test="$refPrefix">
	        <xsl:value-of select="$refPrefix"/><xsl:text> </xsl:text>
	      </xsl:if>
	      <xsl:value-of select="$refAchternaam"/>
	    </xsl:when>
	    <xsl:otherwise>
	      Willkommen zu diesem Stammbaum
	    </xsl:otherwise>
	  </xsl:choose>
	</h3>
	Dieser Stammbaum enth�lt die Daten von <xsl:value-of select="count(//PERSONEN/PERSOON[@link!=0])"/> Personen.
	<br/><br/>
	Oben auf jeder Seite stehen zwei Schreiblinien: eine mit Daten von einer Person und eine mit allgemeinen �bersichten.<br/><br />
	Wenn Sie auf einen Block dr�cken, wird das damit korrespondierende �bersicht heraufkommen,<br />
	 oder man bekommt eine weitere Seite von der man �bersichten dieser Kategorie ausw�hlen kann.<br />
    Durch klicken auf das Block Einstellungen haben Sie die M�glichkeit die �bersichten den eigenen Vorstellungen anzupassen.
	<br/><br/>
	Die Daten einer Person stehen immer in Beziehung zur letzten gew�hlten Person.<br/>
	In diesem Moment ist das
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
	Um weitere Erl�uterungen zu bekommen, klicken Sie auf Hilfe im Men� oben.<br /><br />
	Um in den dynamischen Stammbaum einzugehen, klicken Sie auf einen der anderen Bl�cke.
  <br/>
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
  <xsl:if test="string-length($refOwnerEMail)!=0 and string-length($refOwner)!=0">
    <br /><br />
    Wenn Sie Zusatzinformationen oder weitere Bemerkungen zur Verbesserung des Stammbaums haben,<br />
    senden Sie bitte diese Informationen an:
    <a href="mailto:{$refOwnerEMail}?subject={$subject}"><xsl:value-of select="$refOwner"/></a>.
  </xsl:if>
  <br/><br/><br />
  <i>Stammbaumdaten generiert mit der <xsl:value-of select="//FLEXITREE/@version"/> auf <xsl:value-of select="//FLEXITREE/@date"/></i>
  </xsl:if>

  <xsl:if test="$parTaal = 'fries'">
	<h3>
	  <xsl:choose>
	    <xsl:when test="$refAchternaam">
	      Wolkom by de stambeam fan de famylje
	      <xsl:if test="$refPrefix">
	        <xsl:value-of select="$refPrefix"/><xsl:text> </xsl:text>
	      </xsl:if>
	      <xsl:value-of select="$refAchternaam"/>
	    </xsl:when>
	    <xsl:otherwise>
	      Welkom bij dit stamboombestand
	    </xsl:otherwise>
	  </xsl:choose>
	</h3>
	Dit best�n bevettet de gegevens fan <xsl:value-of select="count(//PERSONEN/PERSOON[@link!=0])"/> persoanen.
	<br/><br/>
	Boppe-oan elke side stean twa rigels: ien mei oersichten fan in persoan en ien mei algemiene oersichten.<br/><br />
	Troch op ien fan de blokken te klikken ferskint it oangeande ferslach,<br />
	 of ferskint in ferfolchside wer ferslachen fan dizze kategory kin wurde kozen.<br />
  Troch te klikken op de knop Ynstellingen kiine jo de ferslachen nei eigen smaak oanpasse.
	<br/><br/>
	De oersichten fan in persoan hawwe hieltyd betrekking op de l�st selektearde persoan.<br/>
	Op dit momint is dat 
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
	Foar meer taljochting, klik op Help yn de knoppebalke hjirboppe.<br /><br />
	Om de stambeam yn te gean, klik op ien van de oare blokken.
  <br/>
<xsl:variable name="subject">
  <xsl:text>FleXiTree</xsl:text>
  <xsl:choose>
	  <xsl:when test="$refAchternaam">
	    <xsl:text>: Stamboom famile </xsl:text>
	    <xsl:if test="$refPrefix">
	      <xsl:value-of select="$refPrefix"/><xsl:text> </xsl:text>
	    </xsl:if>
	    <xsl:value-of select="$refAchternaam"/>
	  </xsl:when>
	  <xsl:otherwise>
	  </xsl:otherwise>
  </xsl:choose>
</xsl:variable>
  <xsl:if test="string-length($refOwnerEMail)!=0 and string-length($refOwner)!=0">
  	<br /><br />Had jo oanfullende ynformaasje of oare opmerkingen om de stambeam te ferbetterjen, <br />stjoer dizze ynformaasje dan nei:
  	<a href="mailto:{$refOwnerEMail}?subject={$subject}"><xsl:value-of select="$refOwner"/></a>.
  </xsl:if>
  <br/><br/><br />
  <i>Stambeambest�n oanmakke mei <xsl:value-of select="//FLEXITREE/@version"/> op <xsl:value-of select="//FLEXITREE/@date"/></i>
  </xsl:if>

  <xsl:if test="$parTaal = 'noors'">
	<h3>
	  <xsl:choose>
	    <xsl:when test="$refAchternaam">
	      Velkommen p� familie 
	      <xsl:if test="$refPrefix">
	        <xsl:value-of select="$refPrefix"/><xsl:text> </xsl:text>
	      </xsl:if>
	      <xsl:value-of select="$refAchternaam"/>
	    </xsl:when>
	    <xsl:otherwise>
	      Velkommen til dette slektstreet
	    </xsl:otherwise>
	  </xsl:choose>
	</h3>
	Dene filen inneholder informasjonen av <xsl:value-of select="count(//PERSONEN/PERSOON[@link!=0])"/> personer.
	<br/><br/>
	�verst p� hver side finnes to linjer: en med oversikten til en person, og en med generelle oversikter.<br/><br />
	Ved � klikke p� en av rutene �pnes det gjeldende rapport,<br />
	 eller det kommer opp en ny side hvor en kan velge rapporter som h�rer inn under denne kategorien.<br />
  Gjennom � klikke p� knappen Instillinger kan man forme rapportene etter eget behov.
	<br/><br/>
	En persons oversikt relateres bestandig p� den sist valgte person.<br/>
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
	Klikk for n�rmere forklaring p� Hjelp i knapperaden ovenfor.<br /><br />
	Klikk p� en av de andre knapper for � g� inn i slektstreet.
  <br/>
<xsl:variable name="subject">
  <xsl:text>FleXiTree</xsl:text>
  <xsl:choose>
	  <xsl:when test="$refAchternaam">
	    <xsl:text>: Stamboom famile </xsl:text>
	    <xsl:if test="$refPrefix">
	      <xsl:value-of select="$refPrefix"/><xsl:text> </xsl:text>
	    </xsl:if>
	    <xsl:value-of select="$refAchternaam"/>
	  </xsl:when>
	  <xsl:otherwise>
	  </xsl:otherwise>
  </xsl:choose>
</xsl:variable>
  <xsl:if test="string-length($refOwnerEMail)!=0 and string-length($refOwner)!=0">
  	<br /><br />Hvis man har tilleggsinformasjon eller ander bemerkninger for � forbedre slektstreet,<br />  sendes de til:
  	<a href="mailto:{$refOwnerEMail}?subject={$subject}"><xsl:value-of select="$refOwner"/></a>.
  </xsl:if>
  <br/><br/><br />
  <i>Slektstre filen laget med <xsl:value-of select="//FLEXITREE/@version"/> on <xsl:value-of select="//FLEXITREE/@date"/></i>
  </xsl:if>

  <xsl:if test="$parTaal = 'spaans'">
	<h3>
	  <xsl:choose>
	    <xsl:when test="$refAchternaam">
	      Bienvenido a la genealog�a de la familia 
	      <xsl:if test="$refPrefix">
	        <xsl:value-of select="$refPrefix"/><xsl:text> </xsl:text>
	      </xsl:if>
	      <xsl:value-of select="$refAchternaam"/>
	    </xsl:when>
	    <xsl:otherwise>
	      Bienvenido a la genealog�a
	    </xsl:otherwise>
	  </xsl:choose>
	</h3>
	Este archivo contiene los datos de <xsl:value-of select="count(//PERSONEN/PERSOON[@link!=0])"/> personas.
	<br/><br/>
	En la parte superior de cada p�gina hay dos reglas:<br /> una con declaraciones de una persona y una visi�n general.<br/><br />
	Al hacer clic en uno de los bloques van a aparecer en el informe,<br />
	 o una p�gina desplegable que informa de esta categor�a puede ser elegido.<br />
  Al hacer clic, se pueden personalizar los res�menes para degustar en el bot�n Configuraci�n.
	<br/><br/>
	Las declaraciones de una persona siempre se refieren a la �ltima persona seleccionada.<br/>
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
	Para una explicaci�n m�s detallada, haga clic en Ayuda en la barra de herramientas arriba.<br /><br />
	Para entrar en el �rbol de familia, haga clic en uno de los otros bloques.
  <br/>
<xsl:variable name="subject">
  <xsl:text>FleXiTree</xsl:text>
  <xsl:choose>
	  <xsl:when test="$refAchternaam">
	    <xsl:text>: Stamboom famile </xsl:text>
	    <xsl:if test="$refPrefix">
	      <xsl:value-of select="$refPrefix"/><xsl:text> </xsl:text>
	    </xsl:if>
	    <xsl:value-of select="$refAchternaam"/>
	  </xsl:when>
	  <xsl:otherwise>
	  </xsl:otherwise>
  </xsl:choose>
</xsl:variable>
  <xsl:if test="string-length($refOwnerEMail)!=0 and string-length($refOwner)!=0">
  	<br /><br />Tiene usted informaci�n adicional u otros comentarios para mejorar el pedigr�,<br />nviar esta informaci�n a:
  	<a href="mailto:{$refOwnerEMail}?subject={$subject}"><xsl:value-of select="$refOwner"/></a>.
  </xsl:if>
  <br/><br/><br />
  <i>Archivo antepasado generado con <xsl:value-of select="//FLEXITREE/@version"/> el <xsl:value-of select="//FLEXITREE/@date"/></i>
  </xsl:if>

  <xsl:if test="$parTaal = 'italiaans'">
	<h3>
	  <xsl:choose>
	    <xsl:when test="$refAchternaam">
	      Benvenuti alla genealogia della famiglia 
	      <xsl:if test="$refPrefix">
	        <xsl:value-of select="$refPrefix"/><xsl:text> </xsl:text>
	      </xsl:if>
	      <xsl:value-of select="$refAchternaam"/>
	    </xsl:when>
	    <xsl:otherwise>
	      Benvenuti alla genealogia
	    </xsl:otherwise>
	  </xsl:choose>
	</h3>
	Questo file contiene i dati di <xsl:value-of select="count(//PERSONEN/PERSOON[@link!=0])"/> persone.
	<br/><br/>
	Nella parte superiore di ogni pagina ci sono due regole:<br /> una con le dichiarazioni di una persona e di una panoramica generale.<br/><br />
	Cliccando su uno dei blocchi apparir� sul rapporto,<br />
	 o un drop-pagina che riporta di questa categoria pu� essere scelto.<br />
  Facendo clic, � possibile personalizzare i report per gustare il pulsante Impostazioni.
	<br/><br/>
	Le dichiarazioni di una persona si riferiscono sempre all'ultima persona selezionata.<br/>
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
	Per ulteriori spiegazioni, fare clic su Guida nella barra degli strumenti di cui sopra.<br /><br />
	Per andare in albero genealogico, cliccare su uno degli altri blocchi.
  <br/>
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
  <xsl:if test="string-length($refOwnerEMail)!=0 and string-length($refOwner)!=0">
  	<br /><br />Avete ulteriori informazioni o altre osservazioni per migliorare il pedigree,<br /> invia queste informazioni per:
  	<a href="mailto:{$refOwnerEMail}?subject={$subject}"><xsl:value-of select="$refOwner"/></a>.
  </xsl:if>
  <br/><br/><br />
  <i>Albero genealogico generato con <xsl:value-of select="//FLEXITREE/@version"/> il <xsl:value-of select="//FLEXITREE/@date"/></i>
  </xsl:if>

  <xsl:if test="$parTaal = 'portugees'">
	<h3>
	  <xsl:choose>
	    <xsl:when test="$refAchternaam">
	      Bem-vindo � genealogia da fam�lia 
	      <xsl:if test="$refPrefix">
	        <xsl:value-of select="$refPrefix"/><xsl:text> </xsl:text>
	      </xsl:if>
	      <xsl:value-of select="$refAchternaam"/>
	    </xsl:when>
	    <xsl:otherwise>
	      Bem-vindo � genealogia
	    </xsl:otherwise>
	  </xsl:choose>
	</h3>
	Este arquivo cont�m os dados de <xsl:value-of select="count(//PERSONEN/PERSOON[@link!=0])"/> pessoas.
	<br/><br/>
	No topo de cada p�gina h� duas regras:<br /> uma com declara��es de uma pessoa e uma vis�o geral.<br/><br />
	Ao clicar sobre um dos blocos ser� exibido no relat�rio,<br />
	 ou uma p�gina gota que relata desta categoria podem ser escolhidos.<br />
  Ao clicar, voc� pode personalizar os resumoes para provar o bot�o Configura��es.
	<br/><br/>
	As declara��es de uma pessoa sempre se relacionam com a �ltima pessoa selecionada.<br/>
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
	Para mais esclarecimentos, clique em Ajuda na barra de ferramentas acima.<br /><br />
	Para ir para a �rvore de fam�lia, clique em um dos outros blocos.
  <br/>
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
  <xsl:if test="string-length($refOwnerEMail)!=0 and string-length($refOwner)!=0">
  	<br /><br />Voc� tem informa��es adicionais ou outros coment�rios para melhorar o pedigree,<br /> enviar esta informa��o para:
  	<a href="mailto:{$refOwnerEMail}?subject={$subject}"><xsl:value-of select="$refOwner"/></a>.
  </xsl:if>
  <br/><br/><br />
  <i>Arquivo �rvore Geneal�gica con <xsl:value-of select="//FLEXITREE/@version"/> em <xsl:value-of select="//FLEXITREE/@date"/></i>
  </xsl:if>

</div>

</xsl:template>

</xsl:stylesheet>
