<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:user="http://www.adriedenblanken.nl/"
		version="1.0">
<!--
// <author>Paul Kallenberg</author>
// <file>$Workfile: Talen.xsl $</file><date>$Date: 15-01-15 8:20 $</date>
// <revision>$Revision: 11 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this header stays intact.
// No responsibility is accepted for use of this software.</disclaimer>
-->

<xsl:variable name="Txt_aan_wetenschap">
<xsl:if test="$parTaal = 'nederlands'">aan de wetenschap ter beschikking gesteld</xsl:if>
<xsl:if test="$parTaal = 'engels'">given to the medical science</xsl:if>
<xsl:if test="$parTaal = 'frans'">don à la science</xsl:if>
<xsl:if test="$parTaal = 'duits'">zum Wissenschaft bereitgestellt</xsl:if>
<xsl:if test="$parTaal = 'fries'">ter beskikking stelt oan de wittenskip</xsl:if>
<xsl:if test="$parTaal = 'noors'">stilt til rådighet for vitenskapen</xsl:if>
<xsl:if test="$parTaal = 'spaans'">a disposición de la ciencia</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">a disposizione della scienza</xsl:if>
<xsl:if test="$parTaal = 'portugees'">à disposição da ciência</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_AangifteGeboorte">
<xsl:if test="$parTaal = 'nederlands'">Aangifte geboorte</xsl:if>
<xsl:if test="$parTaal = 'engels'">Registration of birth</xsl:if>
<xsl:if test="$parTaal = 'frans'">Déclaration de naissance</xsl:if>
<xsl:if test="$parTaal = 'duits'">Geburtsanmeldung</xsl:if>
<xsl:if test="$parTaal = 'fries'">Oanjefte berte</xsl:if>
<xsl:if test="$parTaal = 'noors'">Registrering av fødsel</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Inscripción de los nacimientos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Registrazione delle nascite</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Registro de nascimento</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_AangifteOverlijden">
<xsl:if test="$parTaal = 'nederlands'">Overlijdensaangifte</xsl:if>
<xsl:if test="$parTaal = 'engels'">Death registration</xsl:if>
<xsl:if test="$parTaal = 'frans'">Déclaration décès</xsl:if>
<xsl:if test="$parTaal = 'duits'">Versterbensanzeige</xsl:if>
<xsl:if test="$parTaal = 'fries'">Oanjefte ferstjerre</xsl:if>
<xsl:if test="$parTaal = 'noors'">Registrering av død</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Registro de muertes</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Registrazione morte</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Registro de morte</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Aantal">
<xsl:if test="$parTaal = 'nederlands'">Aantal</xsl:if>
<xsl:if test="$parTaal = 'engels'">Number of</xsl:if>
<xsl:if test="$parTaal = 'frans'">Nombre de</xsl:if>
<xsl:if test="$parTaal = 'duits'">Zahl der</xsl:if>
<xsl:if test="$parTaal = 'fries'">Oantal</xsl:if>
<xsl:if test="$parTaal = 'noors'">Antall</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Número de</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Numero di</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Número de</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_aantal">
<xsl:if test="$parTaal = 'nederlands'">aantal</xsl:if>
<xsl:if test="$parTaal = 'engels'">number of</xsl:if>
<xsl:if test="$parTaal = 'frans'">nombre de</xsl:if>
<xsl:if test="$parTaal = 'duits'">Zahl der</xsl:if>
<xsl:if test="$parTaal = 'fries'">oantal</xsl:if>
<xsl:if test="$parTaal = 'noors'">antall</xsl:if>
<xsl:if test="$parTaal = 'spaans'">número de</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">numero di</xsl:if>
<xsl:if test="$parTaal = 'portugees'">número de</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_AantalTabel">
<xsl:if test="$parTaal = 'nederlands'">Aantal</xsl:if>
<xsl:if test="$parTaal = 'engels'">Number</xsl:if>
<xsl:if test="$parTaal = 'frans'">Nombre</xsl:if>
<xsl:if test="$parTaal = 'duits'">Anzahl</xsl:if>
<xsl:if test="$parTaal = 'fries'">Oantal</xsl:if>
<xsl:if test="$parTaal = 'noors'">Antall</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Número</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Numero</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Número</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Achterkleinkinderen">
<xsl:if test="$parTaal = 'nederlands'">Achterkleinkinderen</xsl:if>
<xsl:if test="$parTaal = 'engels'">Great grandchildren</xsl:if>
<xsl:if test="$parTaal = 'frans'">Arrière-petit-enfants</xsl:if>
<xsl:if test="$parTaal = 'duits'">Urenkelkinder</xsl:if>
<xsl:if test="$parTaal = 'fries'">Achterbernsbern</xsl:if>
<xsl:if test="$parTaal = 'noors'">Oldebarn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Bisnietos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Pronipoti</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Bisnetos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_achterkleinkinderen">
<xsl:if test="$parTaal = 'nederlands'">achterkleinkinderen</xsl:if>
<xsl:if test="$parTaal = 'engels'">great grandchildren</xsl:if>
<xsl:if test="$parTaal = 'frans'">arrière-petit-enfants</xsl:if>
<xsl:if test="$parTaal = 'duits'">Urenkelkinder</xsl:if>
<xsl:if test="$parTaal = 'fries'">achterbernsbern</xsl:if>
<xsl:if test="$parTaal = 'noors'">oldebarn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">bisnietos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">pronipoti</xsl:if>
<xsl:if test="$parTaal = 'portugees'">bisnetos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Achterkleinkinderentitelgeen">
<xsl:if test="$parTaal = 'nederlands'">Er zijn geen achterkleinkinderen bekend van </xsl:if>
<xsl:if test="$parTaal = 'engels'">There are no known great grandchildren of </xsl:if>
<xsl:if test="$parTaal = 'frans'">Il n'y a pas des arrière-petit-enfants connus de </xsl:if>
<xsl:if test="$parTaal = 'duits'">Es gibt keine bekannte Urenkelkinder von </xsl:if>
<xsl:if test="$parTaal = 'fries'">Der binne gjin achterbernsbern bekend fan</xsl:if>
<xsl:if test="$parTaal = 'noors'">Det er ingen kjente oldebarn av</xsl:if>
<xsl:if test="$parTaal = 'spaans'">No hay nietos grandes conocidos o</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Non ci sono nipoti grandi conosciuti o</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Não há netos grandes conhecidos ou</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Achternaam">
<xsl:if test="$parTaal = 'nederlands'">Achternaam</xsl:if>
<xsl:if test="$parTaal = 'engels'">Surname</xsl:if>
<xsl:if test="$parTaal = 'frans'">Nom de famille</xsl:if>
<xsl:if test="$parTaal = 'duits'">Familienname</xsl:if>
<xsl:if test="$parTaal = 'fries'">Skaainamme</xsl:if>
<xsl:if test="$parTaal = 'noors'">Etternavn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Apellido</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Cognome</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Apelido</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_achternaam">
<xsl:if test="$parTaal = 'nederlands'">achternaam</xsl:if>
<xsl:if test="$parTaal = 'engels'">surname</xsl:if>
<xsl:if test="$parTaal = 'frans'">nom de famille</xsl:if>
<xsl:if test="$parTaal = 'duits'">Familienname</xsl:if>
<xsl:if test="$parTaal = 'fries'">skaainamme</xsl:if>
<xsl:if test="$parTaal = 'noors'">etternavn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">apellido</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">cognome</xsl:if>
<xsl:if test="$parTaal = 'portugees'">apelido</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_achternamen">
<xsl:if test="$parTaal = 'nederlands'">achternamen</xsl:if>
<xsl:if test="$parTaal = 'engels'">surnames</xsl:if>
<xsl:if test="$parTaal = 'frans'">noms de famille</xsl:if>
<xsl:if test="$parTaal = 'duits'">Familiennamen</xsl:if>
<xsl:if test="$parTaal = 'fries'">skaainammen</xsl:if>
<xsl:if test="$parTaal = 'noors'">etternavn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">apellidos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">cognomi</xsl:if>
<xsl:if test="$parTaal = 'portugees'">apelidos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Adoptie">
<xsl:if test="$parTaal = 'nederlands'">Adoptie</xsl:if>
<xsl:if test="$parTaal = 'engels'">Adoption</xsl:if>
<xsl:if test="$parTaal = 'frans'">Adoption</xsl:if>
<xsl:if test="$parTaal = 'duits'">Adoption</xsl:if>
<xsl:if test="$parTaal = 'fries'">Oannommen</xsl:if>
<xsl:if test="$parTaal = 'noors'">Adopsjon</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Adoptado</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Adottato</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Adotado</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Adres">
<xsl:if test="$parTaal = 'nederlands'">Adres</xsl:if>
<xsl:if test="$parTaal = 'engels'">Address</xsl:if>
<xsl:if test="$parTaal = 'frans'">Adresse</xsl:if>
<xsl:if test="$parTaal = 'duits'">Adresse</xsl:if>
<xsl:if test="$parTaal = 'fries'">Adres</xsl:if>
<xsl:if test="$parTaal = 'noors'">Adresse</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Dirección</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Indirizzo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Endereço</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Adressen">
<xsl:if test="$parTaal = 'nederlands'">Adressen</xsl:if>
<xsl:if test="$parTaal = 'engels'">Addresses</xsl:if>
<xsl:if test="$parTaal = 'frans'">Adresses</xsl:if>
<xsl:if test="$parTaal = 'duits'">Adressen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Adressen</xsl:if>
<xsl:if test="$parTaal = 'noors'">Adressene</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Direcciones</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Indirizzi</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Endereços</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Algemeen">
<xsl:if test="$parTaal = 'nederlands'">Algemeen</xsl:if>
<xsl:if test="$parTaal = 'engels'">General</xsl:if>
<xsl:if test="$parTaal = 'frans'">Général</xsl:if>
<xsl:if test="$parTaal = 'duits'">Algemein</xsl:if>
<xsl:if test="$parTaal = 'fries'">Algemiene</xsl:if>
<xsl:if test="$parTaal = 'noors'">Generelt</xsl:if>
<xsl:if test="$parTaal = 'spaans'">General</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Generali</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Geral</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_akteopvraagbaar">
<xsl:if test="$parTaal = 'nederlands'">akte(n) is(zijn) verkrijgbaar, lees hier</xsl:if>
<xsl:if test="$parTaal = 'engels'">document(s) may be obtained, read this</xsl:if>
<xsl:if test="$parTaal = 'frans'">l'acte peut, (les actes peuvent) s'obtenir, lisez ici</xsl:if>
<xsl:if test="$parTaal = 'duits'">Akte(n) ist(sind) erhältlich, bitte lesen Sie hier</xsl:if>
<xsl:if test="$parTaal = 'fries'">akte(n) is(zijn) verkrijgbaar, lees hier</xsl:if>
<xsl:if test="$parTaal = 'noors'">akte(n) is(zijn) verkrijgbaar, lees hier</xsl:if>
<xsl:if test="$parTaal = 'spaans'">akte(n) is(zijn) verkrijgbaar, lees hier</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">akte(n) is(zijn) verkrijgbaar, lees hier</xsl:if>
<xsl:if test="$parTaal = 'portugees'">akte(n) is(zijn) verkrijgbaar, lees hier</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Alle">
<xsl:if test="$parTaal = 'nederlands'">Alle</xsl:if>
<xsl:if test="$parTaal = 'engels'">All</xsl:if>
<xsl:if test="$parTaal = 'frans'">Toutes</xsl:if>
<xsl:if test="$parTaal = 'duits'">Alle</xsl:if>
<xsl:if test="$parTaal = 'fries'">Alle</xsl:if>
<xsl:if test="$parTaal = 'noors'">All</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Todos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Tutti</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Tuda</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_alle">
<xsl:if test="$parTaal = 'nederlands'">alle</xsl:if>
<xsl:if test="$parTaal = 'engels'">all</xsl:if>
<xsl:if test="$parTaal = 'frans'">toutes</xsl:if>
<xsl:if test="$parTaal = 'duits'">alle</xsl:if>
<xsl:if test="$parTaal = 'fries'">alle</xsl:if>
<xsl:if test="$parTaal = 'noors'">all</xsl:if>
<xsl:if test="$parTaal = 'spaans'">todos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">tutti</xsl:if>
<xsl:if test="$parTaal = 'portugees'">tuda</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_alle_m">
<xsl:if test="$parTaal = 'nederlands'">alle</xsl:if>
<xsl:if test="$parTaal = 'engels'">all</xsl:if>
<xsl:if test="$parTaal = 'frans'">tous les</xsl:if>
<xsl:if test="$parTaal = 'duits'">alle</xsl:if>
<xsl:if test="$parTaal = 'fries'">alle</xsl:if>
<xsl:if test="$parTaal = 'noors'">all</xsl:if>
<xsl:if test="$parTaal = 'spaans'">todos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">tutti</xsl:if>
<xsl:if test="$parTaal = 'portugees'">tuda</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_alle_v">
<xsl:if test="$parTaal = 'nederlands'">alle</xsl:if>
<xsl:if test="$parTaal = 'engels'">all</xsl:if>
<xsl:if test="$parTaal = 'frans'">toutes les</xsl:if>
<xsl:if test="$parTaal = 'duits'">alle</xsl:if>
<xsl:if test="$parTaal = 'fries'">alle</xsl:if>
<xsl:if test="$parTaal = 'noors'">all</xsl:if>
<xsl:if test="$parTaal = 'spaans'">todos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">tutti</xsl:if>
<xsl:if test="$parTaal = 'portugees'">tuda</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Andere">
<xsl:if test="$parTaal = 'nederlands'">Andere</xsl:if>
<xsl:if test="$parTaal = 'engels'">Further</xsl:if>
<xsl:if test="$parTaal = 'frans'">Autres</xsl:if>
<xsl:if test="$parTaal = 'duits'">Weitere</xsl:if>
<xsl:if test="$parTaal = 'fries'">Mear</xsl:if>
<xsl:if test="$parTaal = 'noors'">Flere</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Más</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Più</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Mais</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Beeindigd">
<xsl:if test="$parTaal = 'nederlands'">Scheiding</xsl:if>
<xsl:if test="$parTaal = 'engels'">Divorce</xsl:if>
<xsl:if test="$parTaal = 'frans'">Divorce</xsl:if>
<xsl:if test="$parTaal = 'duits'">Scheidung</xsl:if>
<xsl:if test="$parTaal = 'fries'">Skieding</xsl:if>
<xsl:if test="$parTaal = 'noors'">Skilsmisse</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Divorcio</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Divorzio</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Divórcio</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Begrafenis">
<xsl:if test="$parTaal = 'nederlands'">Begrafenis</xsl:if>
<xsl:if test="$parTaal = 'engels'">Funeral</xsl:if>
<xsl:if test="$parTaal = 'frans'">Inhumation</xsl:if>
<xsl:if test="$parTaal = 'duits'">Beerdigung</xsl:if>
<xsl:if test="$parTaal = 'fries'">Begraffenis</xsl:if>
<xsl:if test="$parTaal = 'noors'">Begravelse</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Entierro</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Funerale</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Funeral</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Begrafenisdatum">
<xsl:if test="$parTaal = 'nederlands'">Begrafenisdatum</xsl:if>
<xsl:if test="$parTaal = 'engels'">Date of funeral</xsl:if>
<xsl:if test="$parTaal = 'frans'">Date d'inhumation</xsl:if>
<xsl:if test="$parTaal = 'duits'">Beerdigungsdatum</xsl:if>
<xsl:if test="$parTaal = 'fries'">Begraffenisdatum</xsl:if>
<xsl:if test="$parTaal = 'noors'">Vegravelse</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Fecha del entierro</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Data di sepoltura</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Data do enterro</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Begrafenisplaats">
<xsl:if test="$parTaal = 'nederlands'">Begrafenisplaats</xsl:if>
<xsl:if test="$parTaal = 'engels'">Place of funeral</xsl:if>
<xsl:if test="$parTaal = 'frans'">Lieu d'inhumation</xsl:if>
<xsl:if test="$parTaal = 'duits'">Beerdigungsort</xsl:if>
<xsl:if test="$parTaal = 'fries'">Begraffenisplak</xsl:if>
<xsl:if test="$parTaal = 'noors'">Begravelsessted</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Lugar de funeral</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Luogo del funerale</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Lugar da funeral</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_begrafenisplaats">
<xsl:if test="$parTaal = 'nederlands'">begrafenisplaats</xsl:if>
<xsl:if test="$parTaal = 'engels'">place of funeral</xsl:if>
<xsl:if test="$parTaal = 'frans'">lieu d'inhumation</xsl:if>
<xsl:if test="$parTaal = 'duits'">Beerdigungsort</xsl:if>
<xsl:if test="$parTaal = 'fries'">begraffenisplak</xsl:if>
<xsl:if test="$parTaal = 'noors'">begravelsessted</xsl:if>
<xsl:if test="$parTaal = 'spaans'">lugar de funeral</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">luogo del funerale</xsl:if>
<xsl:if test="$parTaal = 'portugees'">lugar da funeral</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Begrafenisplaatsen">
<xsl:if test="$parTaal = 'nederlands'">Begrafenisplaatsen</xsl:if>
<xsl:if test="$parTaal = 'engels'">Places of funeral</xsl:if>
<xsl:if test="$parTaal = 'frans'">Lieux d'inhumation</xsl:if>
<xsl:if test="$parTaal = 'duits'">Beerdigungsorte</xsl:if>
<xsl:if test="$parTaal = 'fries'">Begraffenisplakken</xsl:if>
<xsl:if test="$parTaal = 'noors'">Begravelsessted</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Lugares de funeral</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Luogo del funerale</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Lugares da funeral</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_begrafenisplaatsen">
<xsl:if test="$parTaal = 'nederlands'">begrafenisplaatsen</xsl:if>
<xsl:if test="$parTaal = 'engels'">places of funeral</xsl:if>
<xsl:if test="$parTaal = 'frans'">lieux d'inhumation</xsl:if>
<xsl:if test="$parTaal = 'duits'">Beerdigungsorte</xsl:if>
<xsl:if test="$parTaal = 'fries'">begraffenisplakken</xsl:if>
<xsl:if test="$parTaal = 'noors'">begravelsessted</xsl:if>
<xsl:if test="$parTaal = 'spaans'">lugares de funeral</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">luoghi del funerale</xsl:if>
<xsl:if test="$parTaal = 'portugees'">lLugares da funeral</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_begravenm">
<xsl:if test="$parTaal = 'nederlands'">begraven</xsl:if>
<xsl:if test="$parTaal = 'engels'">buried</xsl:if>
<xsl:if test="$parTaal = 'frans'">inhumé</xsl:if>
<xsl:if test="$parTaal = 'duits'">beerdigt</xsl:if>
<xsl:if test="$parTaal = 'fries'">begrave</xsl:if>
<xsl:if test="$parTaal = 'noors'">gravlagt</xsl:if>
<xsl:if test="$parTaal = 'spaans'">enterrado</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">sepolto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">enterrado</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_begravenv">
<xsl:if test="$parTaal = 'nederlands'">begraven</xsl:if>
<xsl:if test="$parTaal = 'engels'">buried</xsl:if>
<xsl:if test="$parTaal = 'frans'">inhumée</xsl:if>
<xsl:if test="$parTaal = 'duits'">beerdigt</xsl:if>
<xsl:if test="$parTaal = 'fries'">begrave</xsl:if>
<xsl:if test="$parTaal = 'noors'">gravlagt</xsl:if>
<xsl:if test="$parTaal = 'spaans'">enterrado</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">sepolto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">enterrado</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Behorendaan">
<xsl:if test="$parTaal = 'nederlands'">Behorend aan</xsl:if>
<xsl:if test="$parTaal = 'engels'">Belonging to</xsl:if>
<xsl:if test="$parTaal = 'frans'">Fait partie de</xsl:if>
<xsl:if test="$parTaal = 'duits'">Gehörend zu</xsl:if>
<xsl:if test="$parTaal = 'fries'">Behorend oan  </xsl:if>
<xsl:if test="$parTaal = 'noors'">Tilhørighet til</xsl:if>
<xsl:if test="$parTaal = 'spaans'">La pertenencia a</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Appartenente</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Pertencer a</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_beide">
<xsl:if test="$parTaal = 'nederlands'">beide</xsl:if>
<xsl:if test="$parTaal = 'engels'">both</xsl:if>
<xsl:if test="$parTaal = 'frans'">les deux</xsl:if>
<xsl:if test="$parTaal = 'duits'">beide</xsl:if>
<xsl:if test="$parTaal = 'fries'">beide</xsl:if>
<xsl:if test="$parTaal = 'noors'">begge</xsl:if>
<xsl:if test="$parTaal = 'spaans'">ambos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">entrambi</xsl:if>
<xsl:if test="$parTaal = 'portugees'">tanto</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Bekijk_kwartieren">
<xsl:if test="$parTaal = 'nederlands'">Bekijk de kwartieren van </xsl:if>
<xsl:if test="$parTaal = 'engels'">View the ancestry of </xsl:if>
<xsl:if test="$parTaal = 'frans'">Regardez la ascendance de </xsl:if>
<xsl:if test="$parTaal = 'duits'">Sehe das Nachkommen von </xsl:if>
<xsl:if test="$parTaal = 'fries'">Besjoch de kwartieren fan  </xsl:if>
<xsl:if test="$parTaal = 'noors'">Vis slekt</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Ver la ascendencia de</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Guarda l'ascendenza di</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Ver a ascendência de</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Bekijk_Persoonskaart">
<xsl:if test="$parTaal = 'nederlands'">Bekijk de persoonskaart van</xsl:if>
<xsl:if test="$parTaal = 'engels'">View the personal sheet of </xsl:if>
<xsl:if test="$parTaal = 'frans'">Regardez la fiche individuelle de </xsl:if>
<xsl:if test="$parTaal = 'duits'">Sehe die Personenkarte von </xsl:if>
<xsl:if test="$parTaal = 'fries'">Besjoch de persoanskaart fan  </xsl:if>
<xsl:if test="$parTaal = 'noors'">Vis personkortet</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Ver la tarjeta persona de</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Guarda scheda persona di</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Ver a cartão de pessoa de</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Bekijk_Verwantschap">
<xsl:if test="$parTaal = 'nederlands'">Bekijk de verwantschap met </xsl:if>
<xsl:if test="$parTaal = 'engels'">View the consanguinity with </xsl:if>
<xsl:if test="$parTaal = 'frans'">Regardez le parenté avec </xsl:if>
<xsl:if test="$parTaal = 'duits'">Sehe die Verwandtschaft mit </xsl:if>
<xsl:if test="$parTaal = 'fries'">Besjoch de besibbe fan  </xsl:if>
<xsl:if test="$parTaal = 'noors'">Vis slekt</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Ver la relación de</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Guarda relazione di</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Ver a relação de</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_beperking">
<xsl:if test="$parTaal = 'nederlands'">beperking</xsl:if>
<xsl:if test="$parTaal = 'engels'">restriction</xsl:if>
<xsl:if test="$parTaal = 'frans'">limitation</xsl:if>
<xsl:if test="$parTaal = 'duits'">Beschränkung</xsl:if>
<xsl:if test="$parTaal = 'fries'">Beheining</xsl:if>
<xsl:if test="$parTaal = 'noors'">Begrensning</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Limitación</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Limitazione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Limitação</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Bereikteleeftijd">
<xsl:if test="$parTaal = 'nederlands'">Bereikte leeftijd</xsl:if>
<xsl:if test="$parTaal = 'engels'">Age reached</xsl:if>
<xsl:if test="$parTaal = 'frans'">Âge parvenu</xsl:if>
<xsl:if test="$parTaal = 'duits'">Erreichtes Alter</xsl:if>
<xsl:if test="$parTaal = 'fries'">Berikte âldens</xsl:if>
<xsl:if test="$parTaal = 'noors'">Oppnåd alder</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Edad alcanzado</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Atà raggiunto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Idade atingido</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_bereikteleeftijd">
<xsl:if test="$parTaal = 'nederlands'">bereikte leeftijd</xsl:if>
<xsl:if test="$parTaal = 'engels'">reached age</xsl:if>
<xsl:if test="$parTaal = 'frans'">âge parvenu</xsl:if>
<xsl:if test="$parTaal = 'duits'">erreichtes Alter</xsl:if>
<xsl:if test="$parTaal = 'fries'">berikte âldens</xsl:if>
<xsl:if test="$parTaal = 'noors'">oppnåd alder</xsl:if>
<xsl:if test="$parTaal = 'spaans'">edad alcanzado</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">atà raggiunto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">idade atingido</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Beroepen">
<xsl:if test="$parTaal = 'nederlands'">Beroepen</xsl:if>
<xsl:if test="$parTaal = 'engels'">Occupations</xsl:if>
<xsl:if test="$parTaal = 'frans'">Professions</xsl:if>
<xsl:if test="$parTaal = 'duits'">Berufen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Beroppe</xsl:if>
<xsl:if test="$parTaal = 'noors'">Yrken</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Ocupacióne</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Occupaziones</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Ocupaçãos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Beroep">
<xsl:if test="$parTaal = 'nederlands'">Beroep</xsl:if>
<xsl:if test="$parTaal = 'engels'">Occupation</xsl:if>
<xsl:if test="$parTaal = 'frans'">Profession</xsl:if>
<xsl:if test="$parTaal = 'duits'">Beruf</xsl:if>
<xsl:if test="$parTaal = 'fries'">Berop</xsl:if>
<xsl:if test="$parTaal = 'noors'">Yrke</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Ocupación</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Occupazione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Ocupação</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_bestand">
<xsl:if test="$parTaal = 'nederlands'">bestand</xsl:if>
<xsl:if test="$parTaal = 'engels'">database</xsl:if>
<xsl:if test="$parTaal = 'frans'">banque des données</xsl:if>
<xsl:if test="$parTaal = 'duits'">Datenbestand</xsl:if>
<xsl:if test="$parTaal = 'fries'">database</xsl:if>
<xsl:if test="$parTaal = 'noors'">database</xsl:if>
<xsl:if test="$parTaal = 'spaans'">base de datos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">database</xsl:if>
<xsl:if test="$parTaal = 'portugees'">banco de dados</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_betovergrootouders">
<xsl:if test="$parTaal = 'nederlands'">betovergrootouders</xsl:if>
<xsl:if test="$parTaal = 'engels'">great-great-grandparents</xsl:if>
<xsl:if test="$parTaal = 'frans'"></xsl:if>
<xsl:if test="$parTaal = 'duits'"></xsl:if>
<xsl:if test="$parTaal = 'fries'"></xsl:if>
<xsl:if test="$parTaal = 'noors'"></xsl:if>
<xsl:if test="$parTaal = 'spaans'"></xsl:if>
<xsl:if test="$parTaal = 'italiaans'"></xsl:if>
<xsl:if test="$parTaal = 'portugees'"></xsl:if>
</xsl:variable>
<xsl:variable name="Txt_bij">
<xsl:if test="$parTaal = 'nederlands'">bij </xsl:if>
<xsl:if test="$parTaal = 'engels'">at </xsl:if>
<xsl:if test="$parTaal = 'frans'">à </xsl:if>
<xsl:if test="$parTaal = 'duits'">bei </xsl:if>
<xsl:if test="$parTaal = 'fries'">by </xsl:if>
<xsl:if test="$parTaal = 'noors'">til </xsl:if>
<xsl:if test="$parTaal = 'spaans'">en </xsl:if>
<xsl:if test="$parTaal = 'italiaans'">al </xsl:if>
<xsl:if test="$parTaal = 'portugees'">no </xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Bij_burgelijk_huwelijk">
<xsl:if test="$parTaal = 'nederlands'">Bij het burgerlijk huwelijk</xsl:if>
<xsl:if test="$parTaal = 'engels'">At the civil wedding</xsl:if>
<xsl:if test="$parTaal = 'frans'">Au mariage civil</xsl:if>
<xsl:if test="$parTaal = 'duits'">Bei den Heirat</xsl:if>
<xsl:if test="$parTaal = 'fries'">By it boargerlik houlik</xsl:if>
<xsl:if test="$parTaal = 'noors'">Til sivilt ekteskap</xsl:if>
<xsl:if test="$parTaal = 'spaans'">En la matrimonio civil</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Al matrimonio civile</xsl:if>
<xsl:if test="$parTaal = 'portugees'">No casamento civil,</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Bij_kerkelijk_huwelijk">
<xsl:if test="$parTaal = 'nederlands'">Bij het kerkelijk huwelijk</xsl:if>
<xsl:if test="$parTaal = 'engels'">At the religious marriage</xsl:if>
<xsl:if test="$parTaal = 'frans'">Au mariage religieux</xsl:if>
<xsl:if test="$parTaal = 'duits'">Bei die kirchliche Trauung</xsl:if>
<xsl:if test="$parTaal = 'fries'">By it tsjerklik houlik</xsl:if>
<xsl:if test="$parTaal = 'noors'">Til kirkebryllup</xsl:if>
<xsl:if test="$parTaal = 'spaans'">En la boda religiosa</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Al matrimonio religioso</xsl:if>
<xsl:if test="$parTaal = 'portugees'">No casamento religioso</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Bij_de_crematie">
<xsl:if test="$parTaal = 'nederlands'">Bij de crematie </xsl:if>
<xsl:if test="$parTaal = 'engels'">At the cremation </xsl:if>
<xsl:if test="$parTaal = 'frans'">À l'incinération </xsl:if>
<xsl:if test="$parTaal = 'duits'">Bei die Kremation </xsl:if>
<xsl:if test="$parTaal = 'fries'">By de kremaasje</xsl:if>
<xsl:if test="$parTaal = 'noors'">Til kremasjon</xsl:if>
<xsl:if test="$parTaal = 'spaans'">En la cremación</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Alla cremazione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">No cremação</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Bij_de_begrafenis">
<xsl:if test="$parTaal = 'nederlands'">Bij de begrafenis </xsl:if>
<xsl:if test="$parTaal = 'engels'">At the funeral </xsl:if>
<xsl:if test="$parTaal = 'frans'">À l'inhumation </xsl:if>
<xsl:if test="$parTaal = 'duits'">Bei die Beerdigung </xsl:if>
<xsl:if test="$parTaal = 'fries'">By de begraffenis </xsl:if>
<xsl:if test="$parTaal = 'noors'">Til begravelsen </xsl:if>
<xsl:if test="$parTaal = 'spaans'">En el funeral</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Al funerale </xsl:if>
<xsl:if test="$parTaal = 'portugees'">No funeral</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Bij_de_doop">
<xsl:if test="$parTaal = 'nederlands'">Bij de doop </xsl:if>
<xsl:if test="$parTaal = 'engels'">At the baptism </xsl:if>
<xsl:if test="$parTaal = 'frans'">Àu baptême </xsl:if>
<xsl:if test="$parTaal = 'duits'">Bei den Tauf </xsl:if>
<xsl:if test="$parTaal = 'fries'">By de doop </xsl:if>
<xsl:if test="$parTaal = 'noors'">Ved dåp</xsl:if>
<xsl:if test="$parTaal = 'spaans'">En el bautismo </xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Alla battesimo </xsl:if>
<xsl:if test="$parTaal = 'portugees'">No batismo </xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Bij_de_geboorteaangifte">
<xsl:if test="$parTaal = 'nederlands'">Bij de geboorteaangifte </xsl:if>
<xsl:if test="$parTaal = 'engels'">At the birth registration </xsl:if>
<xsl:if test="$parTaal = 'frans'">À la déclaration de naissance </xsl:if>
<xsl:if test="$parTaal = 'duits'">Bei die Anmeldung des Geburts </xsl:if>
<xsl:if test="$parTaal = 'fries'">By de geboorteaangifte </xsl:if>
<xsl:if test="$parTaal = 'noors'">Ved fødselsregistrering</xsl:if>
<xsl:if test="$parTaal = 'spaans'">En el registro de nacimientos </xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Alla registrazione delle nascite </xsl:if>
<xsl:if test="$parTaal = 'portugees'">No registro de nascimento </xsl:if>
</xsl:variable>
<xsl:variable name="Txt_bij_de_geboorte_van">
<xsl:if test="$parTaal = 'nederlands'">bij de geboorte van </xsl:if>
<xsl:if test="$parTaal = 'engels'">about the birth of </xsl:if>
<xsl:if test="$parTaal = 'frans'">pour la naissance de </xsl:if>
<xsl:if test="$parTaal = 'duits'">bei dem Geburt von </xsl:if>
<xsl:if test="$parTaal = 'fries'">by de berte fan</xsl:if>
<xsl:if test="$parTaal = 'noors'">til fødsel av</xsl:if>
<xsl:if test="$parTaal = 'spaans'">en el nacimiento de</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">alla nascita di</xsl:if>
<xsl:if test="$parTaal = 'portugees'">no nascimento de</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Bij_de_ondertrouw">
<xsl:if test="$parTaal = 'nederlands'">Bij de ondertrouw</xsl:if>
<xsl:if test="$parTaal = 'engels'">At the publication of banns</xsl:if>
<xsl:if test="$parTaal = 'frans'">À la publication des bans</xsl:if>
<xsl:if test="$parTaal = 'duits'">Bei Ihr Absicht zum heiraten</xsl:if>
<xsl:if test="$parTaal = 'fries'">By ûndertrou</xsl:if>
<xsl:if test="$parTaal = 'noors'">Til Lysning</xsl:if>
<xsl:if test="$parTaal = 'spaans'">En los esponsales</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Al fidanzamento</xsl:if>
<xsl:if test="$parTaal = 'portugees'">No noivado</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Bij_de_overlijdensaangifte">
<xsl:if test="$parTaal = 'nederlands'">Bij de overlijdensaangifte </xsl:if>
<xsl:if test="$parTaal = 'engels'">At the death registration </xsl:if>
<xsl:if test="$parTaal = 'frans'">À la déclaration de décès </xsl:if>
<xsl:if test="$parTaal = 'duits'">Bei die Anmeldung des Versterbens </xsl:if>
<xsl:if test="$parTaal = 'fries'">By de ferstoarnaangifte </xsl:if>
<xsl:if test="$parTaal = 'noors'">Ved avdødsregistrering</xsl:if>
<xsl:if test="$parTaal = 'spaans'">En el registro de defunciones </xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Alla registrazione della morte </xsl:if>
<xsl:if test="$parTaal = 'portugees'">No registro de óbitos </xsl:if>
</xsl:variable>
<xsl:variable name="Txt_bij_de_relatie_van">
<xsl:if test="$parTaal = 'nederlands'">bij de relatie van </xsl:if>
<xsl:if test="$parTaal = 'engels'">about the relationship of </xsl:if>
<xsl:if test="$parTaal = 'frans'">pour la relation de </xsl:if>
<xsl:if test="$parTaal = 'duits'">bei die Beziehung von </xsl:if>
<xsl:if test="$parTaal = 'fries'">By de relaasje fan </xsl:if>
<xsl:if test="$parTaal = 'noors'">Bil relasjon av</xsl:if>
<xsl:if test="$parTaal = 'spaans'">en el relación de</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">alla relazione di</xsl:if>
<xsl:if test="$parTaal = 'portugees'">no relação de</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_bij_het_huwelijk_van">
<xsl:if test="$parTaal = 'nederlands'">bij het huwelijk van </xsl:if>
<xsl:if test="$parTaal = 'engels'">about the marriage of </xsl:if>
<xsl:if test="$parTaal = 'frans'">pour le mariage de </xsl:if>
<xsl:if test="$parTaal = 'duits'">beim Heirat von </xsl:if>
<xsl:if test="$parTaal = 'fries'">by it houlik fan </xsl:if>
<xsl:if test="$parTaal = 'noors'">på ekteskap </xsl:if>
<xsl:if test="$parTaal = 'spaans'">en la boda de </xsl:if>
<xsl:if test="$parTaal = 'italiaans'">al matrimonio di </xsl:if>
<xsl:if test="$parTaal = 'portugees'">no casamento de </xsl:if>
</xsl:variable>
<xsl:variable name="Txt_bij_het_overlijden_van">
<xsl:if test="$parTaal = 'nederlands'">bij het overlijden van </xsl:if>
<xsl:if test="$parTaal = 'engels'">about the death of </xsl:if>
<xsl:if test="$parTaal = 'frans'">pour le décès de </xsl:if>
<xsl:if test="$parTaal = 'duits'">beim Versterben von </xsl:if>
<xsl:if test="$parTaal = 'fries'">by it ferstoarn fan </xsl:if>
<xsl:if test="$parTaal = 'noors'">på død </xsl:if>
<xsl:if test="$parTaal = 'spaans'">en la muerte de </xsl:if>
<xsl:if test="$parTaal = 'italiaans'">al morte di </xsl:if>
<xsl:if test="$parTaal = 'portugees'">no morte de </xsl:if>
</xsl:variable>
<xsl:variable name="Txt_bij_het_partnerschap_van">
<xsl:if test="$parTaal = 'nederlands'">bij het geregistreerd partnerschap van </xsl:if>
<xsl:if test="$parTaal = 'engels'">about the registered partnership of </xsl:if>
<xsl:if test="$parTaal = 'frans'">pour l'enregistrement d'un pacs de </xsl:if>
<xsl:if test="$parTaal = 'duits'">bei das registrierte Partnerschaft von </xsl:if>
<xsl:if test="$parTaal = 'fries'">by it registrearre partnerskip fan </xsl:if>
<xsl:if test="$parTaal = 'noors'">på registrert partnerskap </xsl:if>
<xsl:if test="$parTaal = 'spaans'">en la unión registrada de </xsl:if>
<xsl:if test="$parTaal = 'italiaans'">al unione registrata di </xsl:if>
<xsl:if test="$parTaal = 'portugees'">no parceria registada de </xsl:if>
</xsl:variable>
<xsl:variable name="Txt_bij_het_samenleven_van">
<xsl:if test="$parTaal = 'nederlands'">bij het samenleven van </xsl:if>
<xsl:if test="$parTaal = 'engels'">about the living together of </xsl:if>
<xsl:if test="$parTaal = 'frans'">pour la cohabitation de </xsl:if>
<xsl:if test="$parTaal = 'duits'">bei das Zusammenleben von </xsl:if>
<xsl:if test="$parTaal = 'fries'">by it samenleven fan </xsl:if>
<xsl:if test="$parTaal = 'noors'">ved sameksistensen av </xsl:if>
<xsl:if test="$parTaal = 'spaans'">en la convivencia de </xsl:if>
<xsl:if test="$parTaal = 'italiaans'">alla convivenza di </xsl:if>
<xsl:if test="$parTaal = 'portugees'">na convivência entre </xsl:if>
</xsl:variable>
<xsl:variable name="Txt_bij_notitie">
<xsl:if test="$parTaal = 'nederlands'">bij </xsl:if>
<xsl:if test="$parTaal = 'engels'">about </xsl:if>
<xsl:if test="$parTaal = 'frans'">pour </xsl:if>
<xsl:if test="$parTaal = 'duits'">bei </xsl:if>
<xsl:if test="$parTaal = 'fries'">om </xsl:if>
<xsl:if test="$parTaal = 'noors'">til </xsl:if>
<xsl:if test="$parTaal = 'spaans'">en </xsl:if>
<xsl:if test="$parTaal = 'italiaans'">a </xsl:if>
<xsl:if test="$parTaal = 'portugees'">em </xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Bron">
<xsl:if test="$parTaal = 'nederlands'">Bron</xsl:if>
<xsl:if test="$parTaal = 'engels'">Source</xsl:if>
<xsl:if test="$parTaal = 'frans'">Source</xsl:if>
<xsl:if test="$parTaal = 'duits'">Quelle</xsl:if>
<xsl:if test="$parTaal = 'fries'">Boarne</xsl:if>
<xsl:if test="$parTaal = 'noors'">Kilde</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Fuente</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Fonte</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Fonte</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_bron">
<xsl:if test="$parTaal = 'nederlands'">bron</xsl:if>
<xsl:if test="$parTaal = 'engels'">source</xsl:if>
<xsl:if test="$parTaal = 'frans'">source</xsl:if>
<xsl:if test="$parTaal = 'duits'">Quelle</xsl:if>
<xsl:if test="$parTaal = 'fries'">boarne</xsl:if>
<xsl:if test="$parTaal = 'noors'">kilde</xsl:if>
<xsl:if test="$parTaal = 'spaans'">fuente</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">fonte</xsl:if>
<xsl:if test="$parTaal = 'portugees'">fonte</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Bronnen">
<xsl:if test="$parTaal = 'nederlands'">Bronnen</xsl:if>
<xsl:if test="$parTaal = 'engels'">Sources</xsl:if>
<xsl:if test="$parTaal = 'frans'">Sources</xsl:if>
<xsl:if test="$parTaal = 'duits'">Quellen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Boarnen</xsl:if>
<xsl:if test="$parTaal = 'noors'">Kilder</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Fuentes</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Fonti</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Fontes</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Cirkel">
<xsl:if test="$parTaal = 'nederlands'">Cirkel</xsl:if>
<xsl:if test="$parTaal = 'engels'">Circle</xsl:if>
<xsl:if test="$parTaal = 'frans'">Cercle</xsl:if>
<xsl:if test="$parTaal = 'duits'">Kreis</xsl:if>
<xsl:if test="$parTaal = 'fries'">Rûnte</xsl:if>
<xsl:if test="$parTaal = 'noors'">Sirkel</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Círculo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Cerchio</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Círculo</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Crematie">
<xsl:if test="$parTaal = 'nederlands'">Crematie</xsl:if>
<xsl:if test="$parTaal = 'engels'">Cremation</xsl:if>
<xsl:if test="$parTaal = 'frans'">Incinération</xsl:if>
<xsl:if test="$parTaal = 'duits'">Einäscherung</xsl:if>
<xsl:if test="$parTaal = 'fries'">Kremaasje</xsl:if>
<xsl:if test="$parTaal = 'noors'">Kremering</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Cremación</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Cremazione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Cremação</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Dag">
<xsl:if test="$parTaal = 'nederlands'">Dag</xsl:if>
<xsl:if test="$parTaal = 'engels'">Day</xsl:if>
<xsl:if test="$parTaal = 'frans'">Jour</xsl:if>
<xsl:if test="$parTaal = 'duits'">Tag</xsl:if>
<xsl:if test="$parTaal = 'fries'">Dei</xsl:if>
<xsl:if test="$parTaal = 'noors'">Dag</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Día</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Giorno</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Dia</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_dan">
<xsl:if test="$parTaal = 'nederlands'">dan</xsl:if>
<xsl:if test="$parTaal = 'engels'">than</xsl:if>
<xsl:if test="$parTaal = 'frans'">que</xsl:if>
<xsl:if test="$parTaal = 'duits'">als</xsl:if>
<xsl:if test="$parTaal = 'fries'">dan</xsl:if>
<xsl:if test="$parTaal = 'noors'">enn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">de</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">di</xsl:if>
<xsl:if test="$parTaal = 'portugees'">de</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_dedatum">
<xsl:if test="$parTaal = 'nederlands'"></xsl:if>
<xsl:if test="$parTaal = 'engels'"></xsl:if>
<xsl:if test="$parTaal = 'frans'">de</xsl:if>
<xsl:if test="$parTaal = 'duits'"></xsl:if>
<xsl:if test="$parTaal = 'fries'"></xsl:if>
<xsl:if test="$parTaal = 'noors'"></xsl:if>
<xsl:if test="$parTaal = 'spaans'"></xsl:if>
<xsl:if test="$parTaal = 'italiaans'"></xsl:if>
<xsl:if test="$parTaal = 'portugees'"></xsl:if>
</xsl:variable>
<xsl:variable name="Txt_de_m">
<xsl:if test="$parTaal = 'nederlands'">de</xsl:if>
<xsl:if test="$parTaal = 'engels'">the</xsl:if>
<xsl:if test="$parTaal = 'frans'">le</xsl:if>
<xsl:if test="$parTaal = 'duits'">die</xsl:if>
<xsl:if test="$parTaal = 'fries'">de</xsl:if>
<xsl:if test="$parTaal = 'noors'">den</xsl:if>
<xsl:if test="$parTaal = 'spaans'">la</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">il</xsl:if>
<xsl:if test="$parTaal = 'portugees'">o</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_de_v">
<xsl:if test="$parTaal = 'nederlands'">de</xsl:if>
<xsl:if test="$parTaal = 'engels'">the</xsl:if>
<xsl:if test="$parTaal = 'frans'">la</xsl:if>
<xsl:if test="$parTaal = 'duits'">die</xsl:if>
<xsl:if test="$parTaal = 'fries'">de</xsl:if>
<xsl:if test="$parTaal = 'noors'">den</xsl:if>
<xsl:if test="$parTaal = 'spaans'">la</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">il</xsl:if>
<xsl:if test="$parTaal = 'portugees'">o</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Datum">
<xsl:if test="$parTaal = 'nederlands'">Datum</xsl:if>
<xsl:if test="$parTaal = 'engels'">Date</xsl:if>
<xsl:if test="$parTaal = 'frans'">Date</xsl:if>
<xsl:if test="$parTaal = 'duits'">Datum</xsl:if>
<xsl:if test="$parTaal = 'fries'">Datum</xsl:if>
<xsl:if test="$parTaal = 'noors'">Dato</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Fecha</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Data</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Data</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Diavoorstelling">
<xsl:if test="$parTaal = 'nederlands'">Diavoorstelling</xsl:if>
<xsl:if test="$parTaal = 'engels'">Slideshow</xsl:if>
<xsl:if test="$parTaal = 'frans'">Diaporama</xsl:if>
<xsl:if test="$parTaal = 'duits'">Dia-Show</xsl:if>
<xsl:if test="$parTaal = 'fries'">Diafoarstelling</xsl:if>
<xsl:if test="$parTaal = 'noors'">Slideshow</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Presentación de diapositivas</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Presentazione di diapositive</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Apresentação de diapositivos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_diavoorstelling">
<xsl:if test="$parTaal = 'nederlands'">diavoorstelling</xsl:if>
<xsl:if test="$parTaal = 'engels'">slideshow</xsl:if>
<xsl:if test="$parTaal = 'frans'">diaporama</xsl:if>
<xsl:if test="$parTaal = 'duits'">Dia-Show</xsl:if>
<xsl:if test="$parTaal = 'fries'">diafoarstelling</xsl:if>
<xsl:if test="$parTaal = 'noors'">slideshow</xsl:if>
<xsl:if test="$parTaal = 'spaans'">presentación de diapositivas</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">presentazione di diapositive</xsl:if>
<xsl:if test="$parTaal = 'portugees'">apresentação de diapositivos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Dochter">
<xsl:if test="$parTaal = 'nederlands'">Dochter</xsl:if>
<xsl:if test="$parTaal = 'engels'">Daughter</xsl:if>
<xsl:if test="$parTaal = 'frans'">Fille</xsl:if>
<xsl:if test="$parTaal = 'duits'">Tochter</xsl:if>
<xsl:if test="$parTaal = 'fries'">Dochter</xsl:if>
<xsl:if test="$parTaal = 'noors'">Datter</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Hija</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Figia</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Filha</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_dochter">
<xsl:if test="$parTaal = 'nederlands'">dochter</xsl:if>
<xsl:if test="$parTaal = 'engels'">daughter</xsl:if>
<xsl:if test="$parTaal = 'frans'">fille</xsl:if>
<xsl:if test="$parTaal = 'duits'">Tochter</xsl:if>
<xsl:if test="$parTaal = 'fries'">dochter</xsl:if>
<xsl:if test="$parTaal = 'noors'">datter</xsl:if>
<xsl:if test="$parTaal = 'spaans'">hija</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">figia</xsl:if>
<xsl:if test="$parTaal = 'portugees'">filha</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Doop">
<xsl:if test="$parTaal = 'nederlands'">Doop</xsl:if>
<xsl:if test="$parTaal = 'engels'">Baptism</xsl:if>
<xsl:if test="$parTaal = 'frans'">Baptême</xsl:if>
<xsl:if test="$parTaal = 'duits'">Tauf</xsl:if>
<xsl:if test="$parTaal = 'fries'">Doop</xsl:if>
<xsl:if test="$parTaal = 'noors'">Dåp</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Bautismo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Battesimo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Batismo</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Doopplaats">
<xsl:if test="$parTaal = 'nederlands'">Doopplaats</xsl:if>
<xsl:if test="$parTaal = 'engels'">Place of baptism</xsl:if>
<xsl:if test="$parTaal = 'frans'">Lieu du baptême</xsl:if>
<xsl:if test="$parTaal = 'duits'">Taufsort</xsl:if>
<xsl:if test="$parTaal = 'fries'">Doopplak</xsl:if>
<xsl:if test="$parTaal = 'noors'">Dåpsted</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Lugar do batismo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Luogo del battesimo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Luogo di nascita</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_doopplaats">
<xsl:if test="$parTaal = 'nederlands'">doopplaats</xsl:if>
<xsl:if test="$parTaal = 'engels'">place of baptism</xsl:if>
<xsl:if test="$parTaal = 'frans'">lieu du baptême</xsl:if>
<xsl:if test="$parTaal = 'duits'">Taufsort</xsl:if>
<xsl:if test="$parTaal = 'fries'">doopplak</xsl:if>
<xsl:if test="$parTaal = 'noors'">dåpsted</xsl:if>
<xsl:if test="$parTaal = 'spaans'">lugar do batismo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">luogo del battesimo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">luogo di nascita</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Doopplaatsen">
<xsl:if test="$parTaal = 'nederlands'">Doopplaatsen</xsl:if>
<xsl:if test="$parTaal = 'engels'">Places of baptism</xsl:if>
<xsl:if test="$parTaal = 'frans'">Lieux de baptême</xsl:if>
<xsl:if test="$parTaal = 'duits'">Taufsorte</xsl:if>
<xsl:if test="$parTaal = 'fries'">Doopplakken</xsl:if>
<xsl:if test="$parTaal = 'noors'">Dåpssted</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Lugar do batismo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Luogo del battesimo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Luogo di nascita</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_doopplaatsen">
<xsl:if test="$parTaal = 'nederlands'">doopplaatsen</xsl:if>
<xsl:if test="$parTaal = 'engels'">places of baptism</xsl:if>
<xsl:if test="$parTaal = 'frans'">lieux de baptême</xsl:if>
<xsl:if test="$parTaal = 'duits'">Taufsorte</xsl:if>
<xsl:if test="$parTaal = 'fries'">doopplakken</xsl:if>
<xsl:if test="$parTaal = 'noors'">dåpssted</xsl:if>
<xsl:if test="$parTaal = 'spaans'">lugar do batismo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">luogo del battesimo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">luogo di nascita</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_dragend">
<xsl:if test="$parTaal = 'nederlands'">met</xsl:if>
<xsl:if test="$parTaal = 'engels'">with</xsl:if>
<xsl:if test="$parTaal = 'frans'">portant le</xsl:if>
<xsl:if test="$parTaal = 'duits'">mit</xsl:if>
<xsl:if test="$parTaal = 'fries'">mei</xsl:if>
<xsl:if test="$parTaal = 'noors'">med</xsl:if>
<xsl:if test="$parTaal = 'spaans'">con </xsl:if>
<xsl:if test="$parTaal = 'italiaans'">con</xsl:if>
<xsl:if test="$parTaal = 'portugees'">com </xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Duur">
<xsl:if test="$parTaal = 'nederlands'">Duur</xsl:if>
<xsl:if test="$parTaal = 'engels'">Duration</xsl:if>
<xsl:if test="$parTaal = 'frans'">Durée</xsl:if>
<xsl:if test="$parTaal = 'duits'">Dauer</xsl:if>
<xsl:if test="$parTaal = 'fries'">Doer</xsl:if>
<xsl:if test="$parTaal = 'noors'">Varighet</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Duración</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Durata</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Duração</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_duur">
<xsl:if test="$parTaal = 'nederlands'">duur</xsl:if>
<xsl:if test="$parTaal = 'engels'">duration</xsl:if>
<xsl:if test="$parTaal = 'frans'">durée</xsl:if>
<xsl:if test="$parTaal = 'duits'">Dauer</xsl:if>
<xsl:if test="$parTaal = 'fries'">doer</xsl:if>
<xsl:if test="$parTaal = 'noors'">varighet</xsl:if>
<xsl:if test="$parTaal = 'spaans'">duración</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">durata</xsl:if>
<xsl:if test="$parTaal = 'portugees'">duração</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_een">
<xsl:if test="$parTaal = 'nederlands'">één</xsl:if>
<xsl:if test="$parTaal = 'engels'">one</xsl:if>
<xsl:if test="$parTaal = 'frans'">un(e)</xsl:if>
<xsl:if test="$parTaal = 'duits'">ein</xsl:if>
<xsl:if test="$parTaal = 'fries'"></xsl:if>
<xsl:if test="$parTaal = 'noors'"></xsl:if>
<xsl:if test="$parTaal = 'spaans'"></xsl:if>
<xsl:if test="$parTaal = 'italiaans'"></xsl:if>
<xsl:if test="$parTaal = 'portugees'"></xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Eenkolomslijsten">
<xsl:if test="$parTaal = 'nederlands'">Eenkolomslijsten</xsl:if>
<xsl:if test="$parTaal = 'engels'">One-column lists</xsl:if>
<xsl:if test="$parTaal = 'frans'">Une-colonne listes</xsl:if>
<xsl:if test="$parTaal = 'duits'">Eine-Kolumne Listen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Eenkolomslijsten</xsl:if>
<xsl:if test="$parTaal = 'noors'">Ett-kolonnelister</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Listas de una columna</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Elenchi One-colonna</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Listas de uma coluna</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Eerste">
<xsl:if test="$parTaal = 'nederlands'">Eerste</xsl:if>
<xsl:if test="$parTaal = 'engels'">First</xsl:if>
<xsl:if test="$parTaal = 'frans'">Premier</xsl:if>
<xsl:if test="$parTaal = 'duits'">Erste</xsl:if>
<xsl:if test="$parTaal = 'fries'">Earste</xsl:if>
<xsl:if test="$parTaal = 'noors'">Første</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Primera</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Primo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Primeira</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_eerste">
<xsl:if test="$parTaal = 'nederlands'">eerste</xsl:if>
<xsl:if test="$parTaal = 'engels'">first</xsl:if>
<xsl:if test="$parTaal = 'frans'">premier</xsl:if>
<xsl:if test="$parTaal = 'duits'">erste</xsl:if>
<xsl:if test="$parTaal = 'fries'">earste</xsl:if>
<xsl:if test="$parTaal = 'noors'">første</xsl:if>
<xsl:if test="$parTaal = 'spaans'">primera</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">primo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">primeira</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_eersteletter">
<xsl:if test="$parTaal = 'nederlands'">eerste letter</xsl:if>
<xsl:if test="$parTaal = 'engels'">first letter </xsl:if>
<xsl:if test="$parTaal = 'frans'">premiere lettre</xsl:if>
<xsl:if test="$parTaal = 'duits'">erster Letter</xsl:if>
<xsl:if test="$parTaal = 'fries'">earste letter</xsl:if>
<xsl:if test="$parTaal = 'noors'">første tegn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">primer carácter</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">primo carattere</xsl:if>
<xsl:if test="$parTaal = 'portugees'">primeiro caractere</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_en">
<xsl:if test="$parTaal = 'nederlands'">en</xsl:if>
<xsl:if test="$parTaal = 'engels'">and</xsl:if>
<xsl:if test="$parTaal = 'frans'">et</xsl:if>
<xsl:if test="$parTaal = 'duits'">und</xsl:if>
<xsl:if test="$parTaal = 'fries'">en</xsl:if>
<xsl:if test="$parTaal = 'noors'">og</xsl:if>
<xsl:if test="$parTaal = 'spaans'">y</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">e</xsl:if>
<xsl:if test="$parTaal = 'portugees'">e</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Familie">
<xsl:if test="$parTaal = 'nederlands'">Familie</xsl:if>
<xsl:if test="$parTaal = 'engels'">Family</xsl:if>
<xsl:if test="$parTaal = 'frans'">Famille</xsl:if>
<xsl:if test="$parTaal = 'duits'">Familie</xsl:if>
<xsl:if test="$parTaal = 'fries'">Famylje </xsl:if>
<xsl:if test="$parTaal = 'noors'">Familie</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Familia</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Famiglia</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Família</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_familie">
<xsl:if test="$parTaal = 'nederlands'">familie</xsl:if>
<xsl:if test="$parTaal = 'engels'">family</xsl:if>
<xsl:if test="$parTaal = 'frans'">famille</xsl:if>
<xsl:if test="$parTaal = 'duits'">Familie</xsl:if>
<xsl:if test="$parTaal = 'fries'">famylje </xsl:if>
<xsl:if test="$parTaal = 'noors'">familie</xsl:if>
<xsl:if test="$parTaal = 'spaans'">familia</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">famiglia</xsl:if>
<xsl:if test="$parTaal = 'portugees'">família</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_foto">
<xsl:if test="$parTaal = 'nederlands'">foto</xsl:if>
<xsl:if test="$parTaal = 'engels'">photo</xsl:if>
<xsl:if test="$parTaal = 'frans'">photo</xsl:if>
<xsl:if test="$parTaal = 'duits'">Photo</xsl:if>
<xsl:if test="$parTaal = 'fries'">foto</xsl:if>
<xsl:if test="$parTaal = 'noors'">bilde</xsl:if>
<xsl:if test="$parTaal = 'spaans'">foto</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">foto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">foto</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Fotogalerij">
<xsl:if test="$parTaal = 'nederlands'">Fotogalerij</xsl:if>
<xsl:if test="$parTaal = 'engels'">Gallery of photos</xsl:if>
<xsl:if test="$parTaal = 'frans'">Galerie des photos</xsl:if>
<xsl:if test="$parTaal = 'duits'">Photogalerie</xsl:if>
<xsl:if test="$parTaal = 'fries'">Fotogalery</xsl:if>
<xsl:if test="$parTaal = 'noors'">Bildegaleri</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Galería de fotos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Galleria di foto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Galeria de fotos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_FotoMemory">
<xsl:if test="$parTaal = 'nederlands'">FotoMemory</xsl:if>
<xsl:if test="$parTaal = 'engels'">PhotoMemory</xsl:if>
<xsl:if test="$parTaal = 'frans'">PhotoMemory</xsl:if>
<xsl:if test="$parTaal = 'duits'">PhotoMemory</xsl:if>
<xsl:if test="$parTaal = 'fries'">FotoMemory</xsl:if>
<xsl:if test="$parTaal = 'noors'">BildeMemory</xsl:if>
<xsl:if test="$parTaal = 'spaans'">FotoMemoria</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">FotoMemoria</xsl:if>
<xsl:if test="$parTaal = 'portugees'">FotoMemória</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Fotos">
<xsl:if test="$parTaal = 'nederlands'">Foto's</xsl:if>
<xsl:if test="$parTaal = 'engels'">Photos</xsl:if>
<xsl:if test="$parTaal = 'frans'">Photos</xsl:if>
<xsl:if test="$parTaal = 'duits'">Photos</xsl:if>
<xsl:if test="$parTaal = 'fries'">Foto's</xsl:if>
<xsl:if test="$parTaal = 'noors'">Bilder</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Fotos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Fotos</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Fotos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_fotos">
<xsl:if test="$parTaal = 'nederlands'">foto's</xsl:if>
<xsl:if test="$parTaal = 'engels'">photos</xsl:if>
<xsl:if test="$parTaal = 'frans'">photos</xsl:if>
<xsl:if test="$parTaal = 'duits'">Photos</xsl:if>
<xsl:if test="$parTaal = 'fries'">foto's</xsl:if>
<xsl:if test="$parTaal = 'noors'">bilder</xsl:if>
<xsl:if test="$parTaal = 'spaans'">fotos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">fotos</xsl:if>
<xsl:if test="$parTaal = 'portugees'">fotos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Fototonen">
<xsl:if test="$parTaal = 'nederlands'">Door op een vakje in de kolom '<xsl:value-of select="$Txt_Omschrijving"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_foto"/>' te klikken wordt de foto getoond<br /><br /></xsl:if>
<xsl:if test="$parTaal = 'engels'">By clicking a cell in the column '<xsl:value-of select="$Txt_Omschrijving"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_foto"/>', the photo is displayed<br /><br /></xsl:if>
<xsl:if test="$parTaal = 'frans'">Par presser une cellule dans la colonne '<xsl:value-of select="$Txt_Omschrijving"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_foto"/>', le photo est montré<br /><br /></xsl:if>
<xsl:if test="$parTaal = 'duits'">Durch drücken auf einer Zelle in die Kolumne '<xsl:value-of select="$Txt_Omschrijving"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_foto"/>', wird das Photo gezeigt<br /><br /></xsl:if>
<xsl:if test="$parTaal = 'fries'">Troch op in fekje yn de kolom  '<xsl:value-of select="$Txt_Omschrijving"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_foto"/>' te klikke wurdt de foto toand  </xsl:if>
<xsl:if test="$parTaal = 'noors'">Ved å klikke på en boks i kolonnen '<xsl:value-of select="$Txt_Omschrijving"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_foto"/>' bildet vises</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Al hacer clic en una casilla de la columna '<xsl:value-of select="$Txt_Omschrijving"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_foto"/>' se muestra la foto</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Cliccando su una casella nella colonna '<xsl:value-of select="$Txt_Omschrijving"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_foto"/>' è visualizzata la foto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Ao clicar em uma caixa na coluna  '<xsl:value-of select="$Txt_Omschrijving"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_foto"/>' da foto é exibida</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Feiten">
<xsl:if test="$parTaal = 'nederlands'">Feiten</xsl:if>
<xsl:if test="$parTaal = 'engels'">Facts</xsl:if>
<xsl:if test="$parTaal = 'frans'">Faits</xsl:if>
<xsl:if test="$parTaal = 'duits'">Fakten</xsl:if>
<xsl:if test="$parTaal = 'fries'">Feiten</xsl:if>
<xsl:if test="$parTaal = 'noors'">Fakta</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Hechos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Fatti</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Fatos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Functie">
<xsl:if test="$parTaal = 'nederlands'">Functie</xsl:if>
<xsl:if test="$parTaal = 'engels'">Function</xsl:if>
<xsl:if test="$parTaal = 'frans'">Fonction</xsl:if>
<xsl:if test="$parTaal = 'duits'">Funktion</xsl:if>
<xsl:if test="$parTaal = 'fries'">Funksje</xsl:if>
<xsl:if test="$parTaal = 'noors'">Funksjon</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Función</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Funzione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Função</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Functies">
<xsl:if test="$parTaal = 'nederlands'">Functies</xsl:if>
<xsl:if test="$parTaal = 'engels'">Functions</xsl:if>
<xsl:if test="$parTaal = 'frans'">Fonctions</xsl:if>
<xsl:if test="$parTaal = 'duits'">Stellen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Funksjen</xsl:if>
<xsl:if test="$parTaal = 'noors'">Funksjonen</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Funcióne</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Funzionen</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Funçãos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Gebeurtenis">
<xsl:if test="$parTaal = 'nederlands'">Gebeurtenis</xsl:if>
<xsl:if test="$parTaal = 'engels'">Event</xsl:if>
<xsl:if test="$parTaal = 'frans'">Événement</xsl:if>
<xsl:if test="$parTaal = 'duits'">Veranstaltung</xsl:if>
<xsl:if test="$parTaal = 'fries'">Foarfal</xsl:if>
<xsl:if test="$parTaal = 'noors'">Hendelsen</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Evento</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Evento</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Evento</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Gebeurtenissen">
<xsl:if test="$parTaal = 'nederlands'">Gebeurtenissen</xsl:if>
<xsl:if test="$parTaal = 'engels'">Events</xsl:if>
<xsl:if test="$parTaal = 'frans'">Événements</xsl:if>
<xsl:if test="$parTaal = 'duits'">Veranstaltungen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Foarfallen</xsl:if>
<xsl:if test="$parTaal = 'noors'">Hendelser</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Eventos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Eventi</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Eventos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_gebeurtenissen">
<xsl:if test="$parTaal = 'nederlands'">gebeurtenissen</xsl:if>
<xsl:if test="$parTaal = 'engels'">events</xsl:if>
<xsl:if test="$parTaal = 'frans'">événements</xsl:if>
<xsl:if test="$parTaal = 'duits'">Veranstaltungen</xsl:if>
<xsl:if test="$parTaal = 'fries'">foarfallen</xsl:if>
<xsl:if test="$parTaal = 'noors'">hendelser</xsl:if>
<xsl:if test="$parTaal = 'spaans'">eventos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">eventi</xsl:if>
<xsl:if test="$parTaal = 'portugees'">eventos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Gebeurtenissenkalender">
<xsl:if test="$parTaal = 'nederlands'">Gebeurtenissenkalender</xsl:if>
<xsl:if test="$parTaal = 'engels'">Calender of events</xsl:if>
<xsl:if test="$parTaal = 'frans'">Calendrier des événements</xsl:if>
<xsl:if test="$parTaal = 'duits'">Veranstaltungenkalender</xsl:if>
<xsl:if test="$parTaal = 'fries'">Foarfallenkalinder</xsl:if>
<xsl:if test="$parTaal = 'noors'">Hendelsens kalender</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Calendario de eventos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Calendario degli eventi</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Calendário de eventos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Geboorte">
<xsl:if test="$parTaal = 'nederlands'">Geboorte</xsl:if>
<xsl:if test="$parTaal = 'engels'">Birth</xsl:if>
<xsl:if test="$parTaal = 'frans'">Naissance</xsl:if>
<xsl:if test="$parTaal = 'duits'">Geburt</xsl:if>
<xsl:if test="$parTaal = 'fries'">Berte</xsl:if>
<xsl:if test="$parTaal = 'noors'">Fødsel</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Nacimiento</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Nascita</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Nascimento</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Geboorteaangifte">
<xsl:if test="$parTaal = 'nederlands'">Van de geboorte is aangifte gedaan </xsl:if>
<xsl:if test="$parTaal = 'engels'">The birth was registered </xsl:if>
<xsl:if test="$parTaal = 'frans'">La naissance a été déclarée </xsl:if>
<xsl:if test="$parTaal = 'duits'">Der Geburt wurde angemeldet </xsl:if>
<xsl:if test="$parTaal = 'fries'">Fan de berte is oanjefte dien </xsl:if>
<xsl:if test="$parTaal = 'noors'">Fødselen ble registrert</xsl:if>
<xsl:if test="$parTaal = 'spaans'">El nacimiento se registró</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">La nascita è stata registrata</xsl:if>
<xsl:if test="$parTaal = 'portugees'">nascimento foi registrado</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Geboortedatum">
<xsl:if test="$parTaal = 'nederlands'">Geboortedatum</xsl:if>
<xsl:if test="$parTaal = 'engels'">Birth date</xsl:if>
<xsl:if test="$parTaal = 'frans'">Date de naissancee</xsl:if>
<xsl:if test="$parTaal = 'duits'">Geburtsdatum</xsl:if>
<xsl:if test="$parTaal = 'fries'">Bertedatum</xsl:if>
<xsl:if test="$parTaal = 'noors'">Fødseldato</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Fech de nacimiento</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Data di nascita</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Dara nascimento</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Geboortedoopdatum">
<xsl:if test="$parTaal = 'nederlands'">Geboorte/doopdatum</xsl:if>
<xsl:if test="$parTaal = 'engels'">Birth/baptism date</xsl:if>
<xsl:if test="$parTaal = 'frans'">Date de naissance/baptême</xsl:if>
<xsl:if test="$parTaal = 'duits'">Geburts/taufdatum</xsl:if>
<xsl:if test="$parTaal = 'fries'">Berte/doopdatum</xsl:if>
<xsl:if test="$parTaal = 'noors'">Fødsel/dåpsdato</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Fech de nacimiento / bautismo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Data di nascita / battesimo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Dara nascimento / batismo</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Geboortejaar">
<xsl:if test="$parTaal = 'nederlands'">Geboortejaar</xsl:if>
<xsl:if test="$parTaal = 'engels'">Year of birth</xsl:if>
<xsl:if test="$parTaal = 'frans'">Année de naissance</xsl:if>
<xsl:if test="$parTaal = 'duits'">Geburtsjahr</xsl:if>
<xsl:if test="$parTaal = 'fries'">Bertejier</xsl:if>
<xsl:if test="$parTaal = 'noors'">Fødselsår</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Año de nacimiento</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Anno di nascita</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Ano de nascimento</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_geboortejaar">
<xsl:if test="$parTaal = 'nederlands'">geboortejaar</xsl:if>
<xsl:if test="$parTaal = 'engels'">year of birth</xsl:if>
<xsl:if test="$parTaal = 'frans'">année de naissance</xsl:if>
<xsl:if test="$parTaal = 'duits'">Geburtsjahr</xsl:if>
<xsl:if test="$parTaal = 'fries'">bertejier</xsl:if>
<xsl:if test="$parTaal = 'noors'">fødselsår</xsl:if>
<xsl:if test="$parTaal = 'spaans'">año de nacimiento</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">anno di nascita</xsl:if>
<xsl:if test="$parTaal = 'portugees'">ano de nascimento</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Geboorteplaats">
<xsl:if test="$parTaal = 'nederlands'">Geboorteplaats</xsl:if>
<xsl:if test="$parTaal = 'engels'">Place of birth</xsl:if>
<xsl:if test="$parTaal = 'frans'">Lieu de naissance</xsl:if>
<xsl:if test="$parTaal = 'duits'">Geburtsort</xsl:if>
<xsl:if test="$parTaal = 'fries'">Berteplak</xsl:if>
<xsl:if test="$parTaal = 'noors'">Fødested</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Lugar de nascimento</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Luogo di nascita</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Lugar de nacimiento</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_geboorteplaats">
<xsl:if test="$parTaal = 'nederlands'">geboorteplaats</xsl:if>
<xsl:if test="$parTaal = 'engels'">place of birth</xsl:if>
<xsl:if test="$parTaal = 'frans'">lieu de naissance</xsl:if>
<xsl:if test="$parTaal = 'duits'">Geburtsort</xsl:if>
<xsl:if test="$parTaal = 'fries'">berteplak</xsl:if>
<xsl:if test="$parTaal = 'noors'">fødselssted</xsl:if>
<xsl:if test="$parTaal = 'spaans'">lugar de nascimento</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">luogo di nascita</xsl:if>
<xsl:if test="$parTaal = 'portugees'">lugar de nacimiento</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Geboorteplaatsen">
<xsl:if test="$parTaal = 'nederlands'">Geboorteplaatsen</xsl:if>
<xsl:if test="$parTaal = 'engels'">Places of birth</xsl:if>
<xsl:if test="$parTaal = 'frans'">Lieux de naissance</xsl:if>
<xsl:if test="$parTaal = 'duits'">Geburtsorte</xsl:if>
<xsl:if test="$parTaal = 'fries'">Berteplakken</xsl:if>
<xsl:if test="$parTaal = 'noors'">Fødselssted</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Lugar de nascimento</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Luoghi di nascita</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Lugar de nacimiento</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_geboorteplaatsen">
<xsl:if test="$parTaal = 'nederlands'">geboorteplaatsen</xsl:if>
<xsl:if test="$parTaal = 'engels'">places of birth</xsl:if>
<xsl:if test="$parTaal = 'frans'">lieux de naissance</xsl:if>
<xsl:if test="$parTaal = 'duits'">Geburtsorte</xsl:if>
<xsl:if test="$parTaal = 'fries'">berteplakken</xsl:if>
<xsl:if test="$parTaal = 'noors'">fødselssted</xsl:if>
<xsl:if test="$parTaal = 'spaans'">lugar de nascimento</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">luoghi di nascita</xsl:if>
<xsl:if test="$parTaal = 'portugees'">lugar de nacimiento</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Geboren">
<xsl:if test="$parTaal = 'nederlands'">Geboren</xsl:if>
<xsl:if test="$parTaal = 'engels'">Born</xsl:if>
<xsl:if test="$parTaal = 'frans'">Né</xsl:if>
<xsl:if test="$parTaal = 'duits'">Geboren</xsl:if>
<xsl:if test="$parTaal = 'fries'">Berne</xsl:if>
<xsl:if test="$parTaal = 'noors'">Født</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Nació</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Nato</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Nasceu</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Geborenmv">
<xsl:if test="$parTaal = 'nederlands'">Geboren</xsl:if>
<xsl:if test="$parTaal = 'engels'">Born</xsl:if>
<xsl:if test="$parTaal = 'frans'">Né(e)</xsl:if>
<xsl:if test="$parTaal = 'duits'">Geboren</xsl:if>
<xsl:if test="$parTaal = 'fries'">Berne</xsl:if>
<xsl:if test="$parTaal = 'noors'">Født</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Nació</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Nato</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Nasceu</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_geborenm">
<xsl:if test="$parTaal = 'nederlands'">geboren</xsl:if>
<xsl:if test="$parTaal = 'engels'">born</xsl:if>
<xsl:if test="$parTaal = 'frans'">né</xsl:if>
<xsl:if test="$parTaal = 'duits'">geboren</xsl:if>
<xsl:if test="$parTaal = 'fries'">berne</xsl:if>
<xsl:if test="$parTaal = 'noors'">født</xsl:if>
<xsl:if test="$parTaal = 'spaans'">nació</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">nato</xsl:if>
<xsl:if test="$parTaal = 'portugees'">nasceu</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_geborenv">
<xsl:if test="$parTaal = 'nederlands'">geboren</xsl:if>
<xsl:if test="$parTaal = 'engels'">born</xsl:if>
<xsl:if test="$parTaal = 'frans'">née</xsl:if>
<xsl:if test="$parTaal = 'duits'">geboren</xsl:if>
<xsl:if test="$parTaal = 'fries'">berne</xsl:if>
<xsl:if test="$parTaal = 'noors'">født</xsl:if>
<xsl:if test="$parTaal = 'spaans'">nació</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">nato</xsl:if>
<xsl:if test="$parTaal = 'portugees'">nasceu</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_gecremeerdm">
<xsl:if test="$parTaal = 'nederlands'">gecremeerd</xsl:if>
<xsl:if test="$parTaal = 'engels'">cremated</xsl:if>
<xsl:if test="$parTaal = 'frans'">incinéré</xsl:if>
<xsl:if test="$parTaal = 'duits'">kremiert</xsl:if>
<xsl:if test="$parTaal = 'fries'">gekremeard</xsl:if>
<xsl:if test="$parTaal = 'noors'">kremert</xsl:if>
<xsl:if test="$parTaal = 'spaans'">cremado</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">cremato</xsl:if>
<xsl:if test="$parTaal = 'portugees'">cremado</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_gecremeerdv">
<xsl:if test="$parTaal = 'nederlands'">gecremeerd</xsl:if>
<xsl:if test="$parTaal = 'engels'">cremated</xsl:if>
<xsl:if test="$parTaal = 'frans'">incinérée</xsl:if>
<xsl:if test="$parTaal = 'duits'">kremiert</xsl:if>
<xsl:if test="$parTaal = 'fries'">gekremeard</xsl:if>
<xsl:if test="$parTaal = 'noors'">kremert</xsl:if>
<xsl:if test="$parTaal = 'spaans'">cremado</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">cremato</xsl:if>
<xsl:if test="$parTaal = 'portugees'">cremado</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_gedooptm">
<xsl:if test="$parTaal = 'nederlands'">gedoopt</xsl:if>
<xsl:if test="$parTaal = 'engels'">baptized</xsl:if>
<xsl:if test="$parTaal = 'frans'">baptisé</xsl:if>
<xsl:if test="$parTaal = 'duits'">getauft</xsl:if>
<xsl:if test="$parTaal = 'fries'">doopt</xsl:if>
<xsl:if test="$parTaal = 'noors'">døpt</xsl:if>
<xsl:if test="$parTaal = 'spaans'">bautizada</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">battezzata</xsl:if>
<xsl:if test="$parTaal = 'portugees'">batizada</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_gedooptv">
<xsl:if test="$parTaal = 'nederlands'">gedoopt</xsl:if>
<xsl:if test="$parTaal = 'engels'">baptized</xsl:if>
<xsl:if test="$parTaal = 'frans'">baptisée</xsl:if>
<xsl:if test="$parTaal = 'duits'">getauft</xsl:if>
<xsl:if test="$parTaal = 'fries'">doopt</xsl:if>
<xsl:if test="$parTaal = 'noors'">døpt</xsl:if>
<xsl:if test="$parTaal = 'spaans'">bautizada</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">battezzata</xsl:if>
<xsl:if test="$parTaal = 'portugees'">batizada</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Gedooptgeboren">
<xsl:if test="$parTaal = 'nederlands'">Gedoopt/geboren</xsl:if>
<xsl:if test="$parTaal = 'engels'">Baptized/born</xsl:if>
<xsl:if test="$parTaal = 'frans'">Baptisé(e)/né(e)</xsl:if>
<xsl:if test="$parTaal = 'duits'">Getauft/geboren</xsl:if>
<xsl:if test="$parTaal = 'fries'">Doopt/berne</xsl:if>
<xsl:if test="$parTaal = 'noors'">Døpt/født</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Bautizada/nació</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Battezzata/nato</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Batizada/nasceu</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Geen">
<xsl:if test="$parTaal = 'nederlands'">Geen</xsl:if>
<xsl:if test="$parTaal = 'engels'">No</xsl:if>
<xsl:if test="$parTaal = 'frans'">Pas de</xsl:if>
<xsl:if test="$parTaal = 'duits'">Keine</xsl:if>
<xsl:if test="$parTaal = 'fries'">Gjin</xsl:if>
<xsl:if test="$parTaal = 'noors'">Ingen</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Ninguno</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Nessuno</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Ninguém</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_geen">
<xsl:if test="$parTaal = 'nederlands'">geen</xsl:if>
<xsl:if test="$parTaal = 'engels'">no</xsl:if>
<xsl:if test="$parTaal = 'frans'">pas de</xsl:if>
<xsl:if test="$parTaal = 'duits'">keine</xsl:if>
<xsl:if test="$parTaal = 'fries'">gjin</xsl:if>
<xsl:if test="$parTaal = 'noors'">ingen</xsl:if>
<xsl:if test="$parTaal = 'spaans'">ninguno</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">nessuno</xsl:if>
<xsl:if test="$parTaal = 'portugees'">ninguém</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_geenbrowserondersteuning">
<xsl:if test="$parTaal = 'nederlands'">Uw browser ondersteunt dit niet</xsl:if>
<xsl:if test="$parTaal = 'engels'">Your browser doesn't support this</xsl:if>
<xsl:if test="$parTaal = 'frans'">Votre navigateur ne soutien pas cette présentation.</xsl:if>
<xsl:if test="$parTaal = 'duits'">Ihre Navigator unterstützt dieser Liste nicht</xsl:if>
<xsl:if test="$parTaal = 'fries'">Jo browser ondersteunt dit net</xsl:if>
<xsl:if test="$parTaal = 'noors'">Nettleseren din støtter ikke denne</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Su navegador no soporta esta</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Il tuo browser non supporta questa</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Seu navegador não suporta este</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Geenfotos">
<xsl:if test="$parTaal = 'nederlands'">Er zijn geen foto's gevonden</xsl:if>
<xsl:if test="$parTaal = 'engels'">No photos found</xsl:if>
<xsl:if test="$parTaal = 'frans'">Il n'y a pas des photos</xsl:if>
<xsl:if test="$parTaal = 'duits'">Keine Photos gefunden</xsl:if>
<xsl:if test="$parTaal = 'fries'">Der binne gjin foto's foun.</xsl:if>
<xsl:if test="$parTaal = 'noors'">Det er ikke funnet bilder</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Sin fotos encontradas</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Nessuna foto trovata</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Nenhuma fotos encontradas</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Geenfotosinstellingen">
<xsl:if test="$parTaal = 'nederlands'">Volgens de instellingen worden er geen foto's getoond</xsl:if>
<xsl:if test="$parTaal = 'engels'">According to the preferences no photos are shown</xsl:if>
<xsl:if test="$parTaal = 'frans'">D'après les préferences les photos ne sont pas montré</xsl:if>
<xsl:if test="$parTaal = 'duits'">Zufolge die Einstellungen werden keine Photos gezeigt</xsl:if>
<xsl:if test="$parTaal = 'fries'">Neffens de ynstellingen wurde er gjin foto's toand</xsl:if>
<xsl:if test="$parTaal = 'noors'">(ifølge innstillingen blir det ikke vist bilder)</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Siguiendo a las preferencias no hay fotos se muestran</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">In seguito alle preferenze nessuna foto sono mostrati</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Seguindo com as preferências, não há fotos são mostradas</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Geenonderscheidletters">
<xsl:if test="$parTaal = 'nederlands'">Let op: Er wordt geen onderscheid gemaakt tussen hoofd- en kleine letters</xsl:if>
<xsl:if test="$parTaal = 'engels'">Attention: No difference is made between upper- and lowercase</xsl:if>
<xsl:if test="$parTaal = 'frans'">Attention: Il n'est pas tenu compte de majuscule ou minuscule</xsl:if>
<xsl:if test="$parTaal = 'duits'">Achtung: es wird kein Unterschied gemacht zwischen Grossbuchstaben und Kleinbuchstaben</xsl:if>
<xsl:if test="$parTaal = 'fries'">Tink derom: Der wurdt gjin ûnderskied makke tusken haad- en lytse letters</xsl:if>
<xsl:if test="$parTaal = 'noors'">Merk: Det skilles ikke mellom store og små bokstaver</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Atención: no hay diferencia caso</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Attenzione: nessuna differenza caso</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Atenção: não há diferença caso</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Geenpersonenselectie">
<xsl:if test="$parTaal = 'nederlands'">Er zijn geen personen in deze selectie</xsl:if>
<xsl:if test="$parTaal = 'engels'">There are no persons in this selection</xsl:if>
<xsl:if test="$parTaal = 'frans'">Il n'y a pas de personnes pour cette sélection</xsl:if>
<xsl:if test="$parTaal = 'duits'">Es gibt keien Personen in diese Selektion</xsl:if>
<xsl:if test="$parTaal = 'fries'">Der binne gjin persoanen yn dizze seleksje</xsl:if>
<xsl:if test="$parTaal = 'noors'">Det finnes ingen personer i dette utvalg</xsl:if>
<xsl:if test="$parTaal = 'spaans'">No hay personas en esta selección</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Non ci sono persone in questa selezione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Não há pessoas nessa seleção</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_geen_relatie_verwantschap">
<xsl:if test="$parTaal = 'nederlands'">Er zijn geen <xsl:value-of select="$Txt_verwantschappen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_tussen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_personen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_met"/><xsl:text> een </xsl:text><xsl:value-of select="$Txt_relatie"/></xsl:if>
<xsl:if test="$parTaal = 'engels'">There are no <xsl:value-of select="$Txt_verwantschappen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_tussen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_personen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_met"/><xsl:text> a </xsl:text><xsl:value-of select="$Txt_relatie"/></xsl:if>
<xsl:if test="$parTaal = 'frans'">Il n'y a pas des <xsl:value-of select="$Txt_verwantschappen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_tussen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_personen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_met"/><xsl:text> une </xsl:text><xsl:value-of select="$Txt_relatie"/></xsl:if>
<xsl:if test="$parTaal = 'duits'">Es gibt keine <xsl:value-of select="$Txt_verwantschappen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_tussen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_personen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_met"/><xsl:text> einer </xsl:text><xsl:value-of select="$Txt_relatie"/></xsl:if>
<xsl:if test="$parTaal = 'fries'">Der binne gjin <xsl:value-of select="$Txt_verwantschappen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_tussen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_personen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_met"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_relatie"/></xsl:if>
<xsl:if test="$parTaal = 'noors'">Det er ingen <xsl:value-of select="$Txt_verwantschappen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_tussen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_personen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_met"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_relatie"/></xsl:if>
<xsl:if test="$parTaal = 'spaans'">No existen <xsl:value-of select="$Txt_verwantschappen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_tussen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_personen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_met"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_relatie"/></xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Non ci sono <xsl:value-of select="$Txt_verwantschappen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_tussen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_personen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_met"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_relatie"/></xsl:if>
<xsl:if test="$parTaal = 'portugees'">Já não há <xsl:value-of select="$Txt_verwantschappen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_tussen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_personen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_met"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_relatie"/></xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Gehele">
<xsl:if test="$parTaal = 'nederlands'">Gehele</xsl:if>
<xsl:if test="$parTaal = 'engels'">Total</xsl:if>
<xsl:if test="$parTaal = 'frans'">Totale</xsl:if>
<xsl:if test="$parTaal = 'duits'">Gesamte</xsl:if>
<xsl:if test="$parTaal = 'fries'">Hiele</xsl:if>
<xsl:if test="$parTaal = 'noors'">Total</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Todo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Tutto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Todo</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_geleden">
<xsl:if test="$parTaal = 'nederlands'">geleden</xsl:if>
<xsl:if test="$parTaal = 'engels'">ago</xsl:if>
<xsl:if test="$parTaal = 'frans'">passé</xsl:if>
<xsl:if test="$parTaal = 'duits'">her</xsl:if>
<xsl:if test="$parTaal = 'fries'">lyn</xsl:if>
<xsl:if test="$parTaal = 'noors'">siden</xsl:if>
<xsl:if test="$parTaal = 'spaans'">hace</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">fa</xsl:if>
<xsl:if test="$parTaal = 'portugees'">atrás</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Genealogie">
<xsl:if test="$parTaal = 'nederlands'">Genealogie</xsl:if>
<xsl:if test="$parTaal = 'engels'">Patrilineal descendants</xsl:if>
<xsl:if test="$parTaal = 'frans'">Généalogie</xsl:if>
<xsl:if test="$parTaal = 'duits'">Genealogie</xsl:if>
<xsl:if test="$parTaal = 'fries'">Sibbekunde</xsl:if>
<xsl:if test="$parTaal = 'noors'">Etterkommere mannlig linje</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Genealogía</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Genealogia</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Genealogia</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Generatie">
<xsl:if test="$parTaal = 'nederlands'">Generatie</xsl:if>
<xsl:if test="$parTaal = 'engels'">Generation</xsl:if>
<xsl:if test="$parTaal = 'frans'">Génération</xsl:if>
<xsl:if test="$parTaal = 'duits'">Generation</xsl:if>
<xsl:if test="$parTaal = 'fries'">Generaasje</xsl:if>
<xsl:if test="$parTaal = 'noors'">Generasjon</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Generación</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Generazione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Geração</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_generatie">
<xsl:if test="$parTaal = 'nederlands'">generatie</xsl:if>
<xsl:if test="$parTaal = 'engels'">generation</xsl:if>
<xsl:if test="$parTaal = 'frans'">génération</xsl:if>
<xsl:if test="$parTaal = 'duits'">Generation</xsl:if>
<xsl:if test="$parTaal = 'fries'">generaasje</xsl:if>
<xsl:if test="$parTaal = 'noors'">generasjon</xsl:if>
<xsl:if test="$parTaal = 'spaans'">generación</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">generazione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">geração</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_generatieoverzichten">
<xsl:if test="$parTaal = 'nederlands'">generatieoverzichten</xsl:if>
<xsl:if test="$parTaal = 'engels'">generation reports</xsl:if>
<xsl:if test="$parTaal = 'frans'">présentations des générations</xsl:if>
<xsl:if test="$parTaal = 'duits'">Generationsreportage</xsl:if>
<xsl:if test="$parTaal = 'fries'">Generaasjeoersichten</xsl:if>
<xsl:if test="$parTaal = 'noors'">Generasjonens oversikt</xsl:if>
<xsl:if test="$parTaal = 'spaans'">resúmenes generación</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">rapporti generazione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">resumos de geração</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_generaties">
<xsl:if test="$parTaal = 'nederlands'">generaties</xsl:if>
<xsl:if test="$parTaal = 'engels'">generations</xsl:if>
<xsl:if test="$parTaal = 'frans'">générations</xsl:if>
<xsl:if test="$parTaal = 'duits'">Generationen</xsl:if>
<xsl:if test="$parTaal = 'fries'">generaasjes</xsl:if>
<xsl:if test="$parTaal = 'noors'">generasjoner</xsl:if>
<xsl:if test="$parTaal = 'spaans'">generaciones</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">generazioni</xsl:if>
<xsl:if test="$parTaal = 'portugees'">gerações</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Geslacht">
<xsl:if test="$parTaal = 'nederlands'">Geslacht</xsl:if>
<xsl:if test="$parTaal = 'engels'">Sex</xsl:if>
<xsl:if test="$parTaal = 'frans'">Sexe</xsl:if>
<xsl:if test="$parTaal = 'duits'">Geschlecht</xsl:if>
<xsl:if test="$parTaal = 'fries'">Slachte</xsl:if>
<xsl:if test="$parTaal = 'noors'">Kjønn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Sexo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Sesso</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Sexo</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_geslacht">
<xsl:if test="$parTaal = 'nederlands'">geslacht</xsl:if>
<xsl:if test="$parTaal = 'engels'">sex</xsl:if>
<xsl:if test="$parTaal = 'frans'">sexe</xsl:if>
<xsl:if test="$parTaal = 'duits'">Geslecht</xsl:if>
<xsl:if test="$parTaal = 'fries'">slachte</xsl:if>
<xsl:if test="$parTaal = 'noors'">kjønn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">sexo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">sesso</xsl:if>
<xsl:if test="$parTaal = 'portugees'">sexo</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Getuige_aanwezig">
<xsl:if test="$parTaal = 'nederlands'">was de volgende getuige aanwezig</xsl:if>
<xsl:if test="$parTaal = 'engels'">the following witness was present</xsl:if>
<xsl:if test="$parTaal = 'frans'">la personne suivante était présente comme témoin</xsl:if>
<xsl:if test="$parTaal = 'duits'">gab es der folgjende Zeuge</xsl:if>
<xsl:if test="$parTaal = 'fries'">wie de folgjende tsjûge oanwêzich </xsl:if>
<xsl:if test="$parTaal = 'noors'">neste vitne var til stede</xsl:if>
<xsl:if test="$parTaal = 'spaans'">el siguiente testigo estaba presente</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">la seguente testimonianza era presente</xsl:if>
<xsl:if test="$parTaal = 'portugees'">o seguinte testemunho estava presente</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Getuigen_aanwezig">
<xsl:if test="$parTaal = 'nederlands'">waren de volgende getuigen aanwezig</xsl:if>
<xsl:if test="$parTaal = 'engels'">the following witnesses were present</xsl:if>
<xsl:if test="$parTaal = 'frans'">les personnes suivantes était présent comme témoin</xsl:if>
<xsl:if test="$parTaal = 'duits'">gab es die folgjende Zeugen</xsl:if>
<xsl:if test="$parTaal = 'fries'">wiene de folgjende tsjûgen oanwêzich </xsl:if>
<xsl:if test="$parTaal = 'noors'">var følgende vitner til stede</xsl:if>
<xsl:if test="$parTaal = 'spaans'">la seguente testimonianza era presente</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">i seguenti testimoni erano presenti</xsl:if>
<xsl:if test="$parTaal = 'portugees'">as seguintes testemunhas estavam presentes</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Getuige">
<xsl:if test="$parTaal = 'nederlands'">Getuige</xsl:if>
<xsl:if test="$parTaal = 'engels'">Witness</xsl:if>
<xsl:if test="$parTaal = 'frans'">Témoin</xsl:if>
<xsl:if test="$parTaal = 'duits'">Zeug</xsl:if>
<xsl:if test="$parTaal = 'fries'">Tsûge</xsl:if>
<xsl:if test="$parTaal = 'noors'">Vitne</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Testigo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Testimone</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Testemunha</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Getuigen">
<xsl:if test="$parTaal = 'nederlands'">Getuigen</xsl:if>
<xsl:if test="$parTaal = 'engels'">Witnesses</xsl:if>
<xsl:if test="$parTaal = 'frans'">Témoins</xsl:if>
<xsl:if test="$parTaal = 'duits'">Zeugen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Tsûgen</xsl:if>
<xsl:if test="$parTaal = 'noors'">Vitner</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Testigos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Testimoni</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Testemunhas</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Gewettigd">
<xsl:if test="$parTaal = 'nederlands'">Gewettigd</xsl:if>
<xsl:if test="$parTaal = 'engels'">Legitimated</xsl:if>
<xsl:if test="$parTaal = 'frans'">Légal</xsl:if>
<xsl:if test="$parTaal = 'duits'">Gesetzlich</xsl:if>
<xsl:if test="$parTaal = 'fries'">Nefens de wet</xsl:if>
<xsl:if test="$parTaal = 'noors'">Lovlig</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Legitimo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Legale</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Legal</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_ging_partnerschap_aan_m">
<xsl:if test="$parTaal = 'nederlands'">ging een geregistreerd partnerschap aan</xsl:if>
<xsl:if test="$parTaal = 'engels'">registered a partnership</xsl:if>
<xsl:if test="$parTaal = 'frans'">a enregistré un pacs</xsl:if>
<xsl:if test="$parTaal = 'duits'">registrierte Partnerschaft</xsl:if>
<xsl:if test="$parTaal = 'fries'">gie in registrearre partnerskip oan mei</xsl:if>
<xsl:if test="$parTaal = 'noors'">innledet et registrert partnerskap med</xsl:if>
<xsl:if test="$parTaal = 'spaans'">comenzó una unión registrada</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">iniziato una unione registrata</xsl:if>
<xsl:if test="$parTaal = 'portugees'">começou uma união registada</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_ging_partnerschap_aan_v">
<xsl:if test="$parTaal = 'nederlands'">ging een geregistreerd partnerschap aan</xsl:if>
<xsl:if test="$parTaal = 'engels'">registered a partnership</xsl:if>
<xsl:if test="$parTaal = 'frans'">a enregistrée un pacs</xsl:if>
<xsl:if test="$parTaal = 'duits'">registrierte Partnerschaft</xsl:if>
<xsl:if test="$parTaal = 'fries'">gie in registrearre partnerskip oan mei</xsl:if>
<xsl:if test="$parTaal = 'noors'">innledet et registrert partnerskap med</xsl:if>
<xsl:if test="$parTaal = 'spaans'">comenzó una unión registrada</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">iniziato una unione registrata</xsl:if>
<xsl:if test="$parTaal = 'portugees'">começou uma união registada</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_ging_samenleven">
<xsl:if test="$parTaal = 'nederlands'">ging samenleven</xsl:if>
<xsl:if test="$parTaal = 'engels'">started living together</xsl:if>
<xsl:if test="$parTaal = 'frans'">commencait à cohabiter</xsl:if>
<xsl:if test="$parTaal = 'duits'">fing an zusammen zu leben</xsl:if>
<xsl:if test="$parTaal = 'fries'">Gong gearlibje</xsl:if>
<xsl:if test="$parTaal = 'noors'">startet samboerskap</xsl:if>
<xsl:if test="$parTaal = 'spaans'">comenzado a vivir juntos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">iniziato a vivere insieme</xsl:if>
<xsl:if test="$parTaal = 'portugees'">começou a viver juntos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Grafisch">
<xsl:if test="$parTaal = 'nederlands'">Grafisch</xsl:if>
<xsl:if test="$parTaal = 'engels'">Graphical</xsl:if>
<xsl:if test="$parTaal = 'frans'">Graphique</xsl:if>
<xsl:if test="$parTaal = 'duits'">Graphisch</xsl:if>
<xsl:if test="$parTaal = 'fries'">Grafisk</xsl:if>
<xsl:if test="$parTaal = 'noors'">Grafisk</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Gráfico</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Grafico</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Gráfico</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_grafisch">
<xsl:if test="$parTaal = 'nederlands'">grafisch</xsl:if>
<xsl:if test="$parTaal = 'engels'">graphical</xsl:if>
<xsl:if test="$parTaal = 'frans'">graphique</xsl:if>
<xsl:if test="$parTaal = 'duits'">graphisch</xsl:if>
<xsl:if test="$parTaal = 'fries'">grafisk</xsl:if>
<xsl:if test="$parTaal = 'noors'">grafisk</xsl:if>
<xsl:if test="$parTaal = 'spaans'">gráfico</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">grafico</xsl:if>
<xsl:if test="$parTaal = 'portugees'">gráfico</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_grootvader">
<xsl:if test="$parTaal = 'nederlands'">grootvader</xsl:if>
<xsl:if test="$parTaal = 'engels'">grandfather</xsl:if>
<xsl:if test="$parTaal = 'frans'">grand-père</xsl:if>
<xsl:if test="$parTaal = 'duits'">Großvater</xsl:if>
<xsl:if test="$parTaal = 'fries'">pake</xsl:if>
<xsl:if test="$parTaal = 'noors'">bestefar</xsl:if>
<xsl:if test="$parTaal = 'spaans'">abuelo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">nonno</xsl:if>
<xsl:if test="$parTaal = 'portugees'">avô</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_grootmoeder">
<xsl:if test="$parTaal = 'nederlands'">grootmoeder</xsl:if>
<xsl:if test="$parTaal = 'engels'">grandmother</xsl:if>
<xsl:if test="$parTaal = 'frans'">grand-mère</xsl:if>
<xsl:if test="$parTaal = 'duits'">Großmutter</xsl:if>
<xsl:if test="$parTaal = 'fries'">beppe</xsl:if>
<xsl:if test="$parTaal = 'noors'">bestemor</xsl:if>
<xsl:if test="$parTaal = 'spaans'">abuela</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">nonna</xsl:if>
<xsl:if test="$parTaal = 'portugees'">avó</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_grootouders">
<xsl:if test="$parTaal = 'nederlands'">grootouders</xsl:if>
<xsl:if test="$parTaal = 'engels'">grandparents</xsl:if>
<xsl:if test="$parTaal = 'frans'"></xsl:if>
<xsl:if test="$parTaal = 'duits'"></xsl:if>
<xsl:if test="$parTaal = 'fries'"></xsl:if>
<xsl:if test="$parTaal = 'noors'"></xsl:if>
<xsl:if test="$parTaal = 'spaans'"></xsl:if>
<xsl:if test="$parTaal = 'italiaans'"></xsl:if>
<xsl:if test="$parTaal = 'portugees'"></xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Haar">
<xsl:if test="$parTaal = 'nederlands'">Haar</xsl:if>
<xsl:if test="$parTaal = 'engels'">Her</xsl:if>
<xsl:if test="$parTaal = 'frans'">Sa</xsl:if>
<xsl:if test="$parTaal = 'duits'">Ihr</xsl:if>
<xsl:if test="$parTaal = 'fries'">Har</xsl:if>
<xsl:if test="$parTaal = 'noors'">Henne</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Su</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Suo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Dela</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_haar">
<xsl:if test="$parTaal = 'nederlands'">haar</xsl:if>
<xsl:if test="$parTaal = 'engels'">her</xsl:if>
<xsl:if test="$parTaal = 'frans'">sa</xsl:if>
<xsl:if test="$parTaal = 'duits'">ihr</xsl:if>
<xsl:if test="$parTaal = 'fries'">har</xsl:if>
<xsl:if test="$parTaal = 'noors'">henne</xsl:if>
<xsl:if test="$parTaal = 'spaans'">su</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">suo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">dela</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Hem">
<xsl:if test="$parTaal = 'nederlands'">Hem</xsl:if>
<xsl:if test="$parTaal = 'engels'">Him</xsl:if>
<xsl:if test="$parTaal = 'frans'">Lui</xsl:if>
<xsl:if test="$parTaal = 'duits'">Ihn</xsl:if>
<xsl:if test="$parTaal = 'fries'">Him</xsl:if>
<xsl:if test="$parTaal = 'noors'">Ham</xsl:if>
<xsl:if test="$parTaal = 'spaans'">El</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Lui</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Ele</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_hem">
<xsl:if test="$parTaal = 'nederlands'">hem</xsl:if>
<xsl:if test="$parTaal = 'engels'">him</xsl:if>
<xsl:if test="$parTaal = 'frans'">lui</xsl:if>
<xsl:if test="$parTaal = 'duits'">ihn</xsl:if>
<xsl:if test="$parTaal = 'fries'">him</xsl:if>
<xsl:if test="$parTaal = 'noors'">ham</xsl:if>
<xsl:if test="$parTaal = 'spaans'">el</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">lui</xsl:if>
<xsl:if test="$parTaal = 'portugees'">ele</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_HemHaar">
<xsl:if test="$parTaal = 'nederlands'">Hem/Haar</xsl:if>
<xsl:if test="$parTaal = 'engels'">Him/Her</xsl:if>
<xsl:if test="$parTaal = 'frans'">Lui/Elle</xsl:if>
<xsl:if test="$parTaal = 'duits'">Ihn/Ihr</xsl:if>
<xsl:if test="$parTaal = 'fries'">Him/har</xsl:if>
<xsl:if test="$parTaal = 'noors'">Ham/henne</xsl:if>
<xsl:if test="$parTaal = 'spaans'">El/su</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Lui/suo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Ele/dela</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_hemhaar">
<xsl:if test="$parTaal = 'nederlands'">hem/haar</xsl:if>
<xsl:if test="$parTaal = 'engels'">him/her</xsl:if>
<xsl:if test="$parTaal = 'frans'">lui/elle</xsl:if>
<xsl:if test="$parTaal = 'duits'">ihn/ihr</xsl:if>
<xsl:if test="$parTaal = 'fries'">him/har</xsl:if>
<xsl:if test="$parTaal = 'noors'">ham/henne</xsl:if>
<xsl:if test="$parTaal = 'spaans'">el/su</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">lui/suo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">ele/dela</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Heerlijkheid">
<xsl:if test="$parTaal = 'nederlands'">Heerlijkheid</xsl:if>
<xsl:if test="$parTaal = 'engels'">Manor</xsl:if>
<xsl:if test="$parTaal = 'frans'">Seigneurie</xsl:if>
<xsl:if test="$parTaal = 'duits'">Lehenherrschaft</xsl:if>
<xsl:if test="$parTaal = 'fries'">Hearlikens</xsl:if>
<xsl:if test="$parTaal = 'noors'">Eiendom</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Mansión</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Palazzo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Mansão</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Heerlijkheden">
<xsl:if test="$parTaal = 'nederlands'">Heerlijkheden</xsl:if>
<xsl:if test="$parTaal = 'engels'">Manors</xsl:if>
<xsl:if test="$parTaal = 'frans'">Seigneuries</xsl:if>
<xsl:if test="$parTaal = 'duits'">Besitzen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Hearlikens</xsl:if>
<xsl:if test="$parTaal = 'noors'">Eiendomen</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Mansióne</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Palazzos</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Mansãos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Help">
<xsl:if test="$parTaal = 'nederlands'">Help</xsl:if>
<xsl:if test="$parTaal = 'engels'">Help</xsl:if>
<xsl:if test="$parTaal = 'frans'">Aide</xsl:if>
<xsl:if test="$parTaal = 'duits'">Hilfe</xsl:if>
<xsl:if test="$parTaal = 'fries'">Help</xsl:if>
<xsl:if test="$parTaal = 'noors'">Hjelp</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Ayuda</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Aiuto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Ajuda</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Hij">
<xsl:if test="$parTaal = 'nederlands'">Hij</xsl:if>
<xsl:if test="$parTaal = 'engels'">He</xsl:if>
<xsl:if test="$parTaal = 'frans'">Il</xsl:if>
<xsl:if test="$parTaal = 'duits'">Er</xsl:if>
<xsl:if test="$parTaal = 'fries'">Hy</xsl:if>
<xsl:if test="$parTaal = 'noors'">Han</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Él</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Lui</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Ele</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_hij">
<xsl:if test="$parTaal = 'nederlands'">hij</xsl:if>
<xsl:if test="$parTaal = 'engels'">he</xsl:if>
<xsl:if test="$parTaal = 'frans'">il</xsl:if>
<xsl:if test="$parTaal = 'duits'">er</xsl:if>
<xsl:if test="$parTaal = 'fries'">hy</xsl:if>
<xsl:if test="$parTaal = 'noors'">han</xsl:if>
<xsl:if test="$parTaal = 'spaans'">el</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">lui</xsl:if>
<xsl:if test="$parTaal = 'portugees'">ele</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_HijZij">
<xsl:if test="$parTaal = 'nederlands'">Hij/Zij</xsl:if>
<xsl:if test="$parTaal = 'engels'">He/She</xsl:if>
<xsl:if test="$parTaal = 'frans'">Il/Elle</xsl:if>
<xsl:if test="$parTaal = 'duits'">Er/Sie</xsl:if>
<xsl:if test="$parTaal = 'fries'">Hy/Sy</xsl:if>
<xsl:if test="$parTaal = 'noors'">Han/Hun</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Él / Ellos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Lui / Lei</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Ele / Eles</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_hijzij">
<xsl:if test="$parTaal = 'nederlands'">hij/zij</xsl:if>
<xsl:if test="$parTaal = 'engels'">he/she</xsl:if>
<xsl:if test="$parTaal = 'frans'">il/elle</xsl:if>
<xsl:if test="$parTaal = 'duits'">er/sie</xsl:if>
<xsl:if test="$parTaal = 'fries'">hy/sy</xsl:if>
<xsl:if test="$parTaal = 'noors'">han/hun</xsl:if>
<xsl:if test="$parTaal = 'spaans'">el / ellos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">lui / lei</xsl:if>
<xsl:if test="$parTaal = 'portugees'">ele / eles</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Histogram">
<xsl:if test="$parTaal = 'nederlands'">Histogram</xsl:if>
<xsl:if test="$parTaal = 'engels'">Histogram</xsl:if>
<xsl:if test="$parTaal = 'frans'">Histogramme</xsl:if>
<xsl:if test="$parTaal = 'duits'">Histogram</xsl:if>
<xsl:if test="$parTaal = 'fries'">Histogram</xsl:if>
<xsl:if test="$parTaal = 'noors'">Histogram</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Histograma</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Istogramm</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Histograma</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_histogram">
<xsl:if test="$parTaal = 'nederlands'">histogram</xsl:if>
<xsl:if test="$parTaal = 'engels'">histogram</xsl:if>
<xsl:if test="$parTaal = 'frans'">histogramme</xsl:if>
<xsl:if test="$parTaal = 'duits'">Histogram</xsl:if>
<xsl:if test="$parTaal = 'fries'">histogram</xsl:if>
<xsl:if test="$parTaal = 'noors'">histogram</xsl:if>
<xsl:if test="$parTaal = 'spaans'">histograma</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">istogramm</xsl:if>
<xsl:if test="$parTaal = 'portugees'">histograma</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Histogrammen">
<xsl:if test="$parTaal = 'nederlands'">Histogrammen</xsl:if>
<xsl:if test="$parTaal = 'engels'">Histograms</xsl:if>
<xsl:if test="$parTaal = 'frans'">Histogrammes</xsl:if>
<xsl:if test="$parTaal = 'duits'">Histogrammen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Histogrammen</xsl:if>
<xsl:if test="$parTaal = 'noors'">Histogrammen</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Histogramas</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Istogrammi</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Histogramas</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_histogrammen">
<xsl:if test="$parTaal = 'nederlands'">histogrammen</xsl:if>
<xsl:if test="$parTaal = 'engels'">histograms</xsl:if>
<xsl:if test="$parTaal = 'frans'">histogrammes</xsl:if>
<xsl:if test="$parTaal = 'duits'">Histogrammen</xsl:if>
<xsl:if test="$parTaal = 'fries'">histogrammen</xsl:if>
<xsl:if test="$parTaal = 'noors'">histogrammen</xsl:if>
<xsl:if test="$parTaal = 'spaans'">histogramas</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">istogrammi</xsl:if>
<xsl:if test="$parTaal = 'portugees'">histogramas</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Historischekalender">
<xsl:if test="$parTaal = 'nederlands'">Historische kalender</xsl:if>
<xsl:if test="$parTaal = 'engels'">Historical calender</xsl:if>
<xsl:if test="$parTaal = 'frans'">Calendrier historique</xsl:if>
<xsl:if test="$parTaal = 'duits'">Historische Kalender</xsl:if>
<xsl:if test="$parTaal = 'fries'">Histoaryske kalinder</xsl:if>
<xsl:if test="$parTaal = 'noors'">Historiske kalender</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Calendario histórico</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Calendario storico</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Calendário histórico</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_hoogstens">
<xsl:if test="$parTaal = 'nederlands'">hoogstens</xsl:if>
<xsl:if test="$parTaal = 'engels'">at most</xsl:if>
<xsl:if test="$parTaal = 'frans'">maximal</xsl:if>
<xsl:if test="$parTaal = 'duits'">höchstens</xsl:if>
<xsl:if test="$parTaal = 'fries'">hoogstens</xsl:if>
<xsl:if test="$parTaal = 'noors'">på det meste</xsl:if>
<xsl:if test="$parTaal = 'spaans'">a lo sumo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">al massimo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">no máximo</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_huidigeleeftijd">
<xsl:if test="$parTaal = 'nederlands'">huidige leeftijd</xsl:if>
<xsl:if test="$parTaal = 'engels'">current age</xsl:if>
<xsl:if test="$parTaal = 'frans'">âge présent</xsl:if>
<xsl:if test="$parTaal = 'duits'">heutiges Alter</xsl:if>
<xsl:if test="$parTaal = 'fries'">âldans op dit momint</xsl:if>
<xsl:if test="$parTaal = 'noors'">alderen akkurat nå</xsl:if>
<xsl:if test="$parTaal = 'spaans'">la edad en este momento</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">l'età in questo momento</xsl:if>
<xsl:if test="$parTaal = 'portugees'">a idade neste momento</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Huidigeleeftijd">
<xsl:if test="$parTaal = 'nederlands'">Huidige leeftijd</xsl:if>
<xsl:if test="$parTaal = 'engels'">Current age</xsl:if>
<xsl:if test="$parTaal = 'frans'">Âge présent</xsl:if>
<xsl:if test="$parTaal = 'duits'">Heutiges Alter</xsl:if>
<xsl:if test="$parTaal = 'fries'">Aldans op dit momint</xsl:if>
<xsl:if test="$parTaal = 'noors'">Alderen akkurat nå</xsl:if>
<xsl:if test="$parTaal = 'spaans'">La edad en este momento</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">L'età in questo momento</xsl:if>
<xsl:if test="$parTaal = 'portugees'">A idade neste momento</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_hun">
<xsl:if test="$parTaal = 'nederlands'">hun</xsl:if>
<xsl:if test="$parTaal = 'engels'">their</xsl:if>
<xsl:if test="$parTaal = 'frans'">leurs</xsl:if>
<xsl:if test="$parTaal = 'duits'">Ihre</xsl:if>
<xsl:if test="$parTaal = 'fries'">har</xsl:if>
<xsl:if test="$parTaal = 'noors'">hennes</xsl:if>
<xsl:if test="$parTaal = 'spaans'">sus</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">loro</xsl:if>
<xsl:if test="$parTaal = 'portugees'">seus</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Huwelijk">
<xsl:if test="$parTaal = 'nederlands'">Huwelijk</xsl:if>
<xsl:if test="$parTaal = 'engels'">Marriage</xsl:if>
<xsl:if test="$parTaal = 'frans'">Mariage</xsl:if>
<xsl:if test="$parTaal = 'duits'">Heirat</xsl:if>
<xsl:if test="$parTaal = 'fries'">Houlik</xsl:if>
<xsl:if test="$parTaal = 'noors'">Ekteskap</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Matrimonio</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Matrimonio</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Matrimônio</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_huwelijken">
<xsl:if test="$parTaal = 'nederlands'">huwelijken</xsl:if>
<xsl:if test="$parTaal = 'engels'">marriages</xsl:if>
<xsl:if test="$parTaal = 'frans'">mariages</xsl:if>
<xsl:if test="$parTaal = 'duits'">Heirate</xsl:if>
<xsl:if test="$parTaal = 'fries'">houliken</xsl:if>
<xsl:if test="$parTaal = 'noors'">ekteskap</xsl:if>
<xsl:if test="$parTaal = 'spaans'">matrimônios</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">matrimoni</xsl:if>
<xsl:if test="$parTaal = 'portugees'">matrimônios</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_in">
<xsl:if test="$parTaal = 'nederlands'">in</xsl:if>
<xsl:if test="$parTaal = 'engels'">in</xsl:if>
<xsl:if test="$parTaal = 'frans'">à</xsl:if>
<xsl:if test="$parTaal = 'duits'">in</xsl:if>
<xsl:if test="$parTaal = 'fries'">yn</xsl:if>
<xsl:if test="$parTaal = 'noors'">inn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">en</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">in</xsl:if>
<xsl:if test="$parTaal = 'portugees'">em</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_inmaandjaar">
<xsl:if test="$parTaal = 'nederlands'">in</xsl:if>
<xsl:if test="$parTaal = 'engels'">in</xsl:if>
<xsl:if test="$parTaal = 'frans'">à</xsl:if>
<xsl:if test="$parTaal = 'duits'">in</xsl:if>
<xsl:if test="$parTaal = 'fries'">yn</xsl:if>
<xsl:if test="$parTaal = 'noors'">inn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">en</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">in</xsl:if>
<xsl:if test="$parTaal = 'portugees'">em</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_inplaats">
<xsl:if test="$parTaal = 'nederlands'">in</xsl:if>
<xsl:if test="$parTaal = 'engels'">in</xsl:if>
<xsl:if test="$parTaal = 'frans'">à</xsl:if>
<xsl:if test="$parTaal = 'duits'">in</xsl:if>
<xsl:if test="$parTaal = 'fries'">yn</xsl:if>
<xsl:if test="$parTaal = 'noors'">inn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">en</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">in</xsl:if>
<xsl:if test="$parTaal = 'portugees'">em</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_instellingniettewijzigen">
<xsl:if test="$parTaal = 'nederlands'">Er is geen <xsl:value-of select="$Txt_instelling"/> die door U veranderd kunnen worden.<br />Klik op een van de vakjes in bovenstaande knoppenbalk om verder te gaan.</xsl:if>
<xsl:if test="$parTaal = 'engels'">You may not change any <xsl:value-of select="$Txt_instelling"/>.<br />Click any block in the upper menu bar to continue.</xsl:if>
<xsl:if test="$parTaal = 'frans'">Vous ne pouvez pas modificer aucune <xsl:value-of select="$Txt_instelling"/>.<br />Cliquez un bloc en menu ci-dessus pour continuer.</xsl:if>
<xsl:if test="$parTaal = 'duits'">Sie können keine <xsl:value-of select="$Txt_instelling"/> Ändern.<br />Bitte klicken Sie auf eines Fach in das Menü hier oben zum verfolgen.</xsl:if>
<xsl:if test="$parTaal = 'fries'">Der is gjien ynstelling dy troch Jo feroaret kin wurde. <br />Klik op ien fan de fekjes yn boppesteande knoppenbalk om fierder te gean.</xsl:if>
<xsl:if test="$parTaal = 'noors'">Det er ingen innstilling som kan endres ved U. <br /> Klikk på en av boksene ovenfor verktøylinjen for å fortsette.</xsl:if>
<xsl:if test="$parTaal = 'spaans'">No hay ninguna opción que puede ser cambiado por U. <br /> Haga clic en uno de los cuadros anteriores barra de herramientas para proceder.</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Non vi è alcuna impostazione che può essere modificata da U. <br /> Clicca su una delle caselle sopra della barra degli strumenti per continuare.</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Não há uma configuração que pode ser mudado por U. <br /> Clique em uma das caixas acima da barra de ferramentas para continuar.</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_instelling">
<xsl:if test="$parTaal = 'nederlands'">instelling</xsl:if>
<xsl:if test="$parTaal = 'engels'">preference</xsl:if>
<xsl:if test="$parTaal = 'frans'">préférence</xsl:if>
<xsl:if test="$parTaal = 'duits'">Einstellung</xsl:if>
<xsl:if test="$parTaal = 'fries'">ynstelling</xsl:if>
<xsl:if test="$parTaal = 'noors'">innstilling</xsl:if>
<xsl:if test="$parTaal = 'spaans'">opción</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">impostazione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">configuração</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Instellingen">
<xsl:if test="$parTaal = 'nederlands'">Instellingen</xsl:if>
<xsl:if test="$parTaal = 'engels'">Preferences</xsl:if>
<xsl:if test="$parTaal = 'frans'">Préférences</xsl:if>
<xsl:if test="$parTaal = 'duits'">Einstellungen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Ynstelling</xsl:if>
<xsl:if test="$parTaal = 'noors'">Innstilling</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Opción</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Impostazione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Configuração</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_instellingen">
<xsl:if test="$parTaal = 'nederlands'">instellingen</xsl:if>
<xsl:if test="$parTaal = 'engels'">preferences</xsl:if>
<xsl:if test="$parTaal = 'frans'">préférences</xsl:if>
<xsl:if test="$parTaal = 'duits'">Einstellungen</xsl:if>
<xsl:if test="$parTaal = 'fries'">ynstelling</xsl:if>
<xsl:if test="$parTaal = 'noors'">innstilling</xsl:if>
<xsl:if test="$parTaal = 'spaans'">opción</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">impostazione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">configuração</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_is">
<xsl:if test="$parTaal = 'nederlands'">is</xsl:if>
<xsl:if test="$parTaal = 'engels'">is</xsl:if>
<xsl:if test="$parTaal = 'frans'">est</xsl:if>
<xsl:if test="$parTaal = 'duits'">ist</xsl:if>
<xsl:if test="$parTaal = 'fries'">is</xsl:if>
<xsl:if test="$parTaal = 'noors'">er</xsl:if>
<xsl:if test="$parTaal = 'spaans'">es</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">é</xsl:if>
<xsl:if test="$parTaal = 'portugees'">é</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_isoverledenm">
<xsl:if test="$parTaal = 'nederlands'">is overleden</xsl:if>
<xsl:if test="$parTaal = 'engels'">died</xsl:if>
<xsl:if test="$parTaal = 'frans'">est décédé</xsl:if>
<xsl:if test="$parTaal = 'duits'">ist gestorben</xsl:if>
<xsl:if test="$parTaal = 'fries'">is ferstoarn</xsl:if>
<xsl:if test="$parTaal = 'noors'">er død</xsl:if>
<xsl:if test="$parTaal = 'spaans'">ha fallecido</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">è deceduta</xsl:if>
<xsl:if test="$parTaal = 'portugees'">é falecido</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_isoverledenv">
<xsl:if test="$parTaal = 'nederlands'">is overleden</xsl:if>
<xsl:if test="$parTaal = 'engels'">died</xsl:if>
<xsl:if test="$parTaal = 'frans'">est décédée</xsl:if>
<xsl:if test="$parTaal = 'duits'">ist gestorben</xsl:if>
<xsl:if test="$parTaal = 'fries'">is ferstoarn</xsl:if>
<xsl:if test="$parTaal = 'noors'">er død</xsl:if>
<xsl:if test="$parTaal = 'spaans'">ha fallecido</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">è deceduta</xsl:if>
<xsl:if test="$parTaal = 'portugees'">é falecido</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_isvt">
<xsl:if test="$parTaal = 'nederlands'">is</xsl:if>
<xsl:if test="$parTaal = 'engels'">was</xsl:if>
<xsl:if test="$parTaal = 'frans'">est</xsl:if>
<xsl:if test="$parTaal = 'duits'">ist</xsl:if>
<xsl:if test="$parTaal = 'fries'">is</xsl:if>
<xsl:if test="$parTaal = 'noors'">was</xsl:if>
<xsl:if test="$parTaal = 'spaans'">es</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">è</xsl:if>
<xsl:if test="$parTaal = 'portugees'">é</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_isvvt">
<xsl:if test="$parTaal = 'nederlands'">is</xsl:if>
<xsl:if test="$parTaal = 'engels'">was</xsl:if>
<xsl:if test="$parTaal = 'frans'">est</xsl:if>
<xsl:if test="$parTaal = 'duits'">ist</xsl:if>
<xsl:if test="$parTaal = 'fries'">is</xsl:if>
<xsl:if test="$parTaal = 'noors'">was</xsl:if>
<xsl:if test="$parTaal = 'spaans'">es</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">è</xsl:if>
<xsl:if test="$parTaal = 'portugees'">é</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Jaar">
<xsl:if test="$parTaal = 'nederlands'">Jaar</xsl:if>
<xsl:if test="$parTaal = 'engels'">Year</xsl:if>
<xsl:if test="$parTaal = 'frans'">An</xsl:if>
<xsl:if test="$parTaal = 'duits'">Jahr</xsl:if>
<xsl:if test="$parTaal = 'fries'">Jier</xsl:if>
<xsl:if test="$parTaal = 'noors'">År</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Año</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Anno</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Ano</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_jaar">
<xsl:if test="$parTaal = 'nederlands'">jaar</xsl:if>
<xsl:if test="$parTaal = 'engels'">year</xsl:if>
<xsl:if test="$parTaal = 'frans'">an</xsl:if>
<xsl:if test="$parTaal = 'duits'">Jahr</xsl:if>
<xsl:if test="$parTaal = 'fries'">jier</xsl:if>
<xsl:if test="$parTaal = 'noors'">år</xsl:if>
<xsl:if test="$parTaal = 'spaans'">año</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">anno</xsl:if>
<xsl:if test="$parTaal = 'portugees'">ano</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Jaren">
<xsl:if test="$parTaal = 'nederlands'">Jaar</xsl:if>
<xsl:if test="$parTaal = 'engels'">Years</xsl:if>
<xsl:if test="$parTaal = 'frans'">Ans</xsl:if>
<xsl:if test="$parTaal = 'duits'">Jahren</xsl:if>
<xsl:if test="$parTaal = 'fries'">Jiere</xsl:if>
<xsl:if test="$parTaal = 'noors'">Åre</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Años</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Anni</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Anos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_jaren">
<xsl:if test="$parTaal = 'nederlands'">jaar</xsl:if>
<xsl:if test="$parTaal = 'engels'">years</xsl:if>
<xsl:if test="$parTaal = 'frans'">ans</xsl:if>
<xsl:if test="$parTaal = 'duits'">Jahren</xsl:if>
<xsl:if test="$parTaal = 'fries'">jiere</xsl:if>
<xsl:if test="$parTaal = 'noors'">are</xsl:if>
<xsl:if test="$parTaal = 'spaans'">años</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">anni</xsl:if>
<xsl:if test="$parTaal = 'portugees'">anos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Kaart">
<xsl:if test="$parTaal = 'nederlands'">Kaart</xsl:if>
<xsl:if test="$parTaal = 'engels'">Map</xsl:if>
<xsl:if test="$parTaal = 'frans'">Carte</xsl:if>
<xsl:if test="$parTaal = 'duits'">Karte</xsl:if>
<xsl:if test="$parTaal = 'fries'">Kaart</xsl:if>
<xsl:if test="$parTaal = 'noors'">Kart</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Mapa</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Mappa</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Mapa</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Kalender">
<xsl:if test="$parTaal = 'nederlands'">Kalender</xsl:if>
<xsl:if test="$parTaal = 'engels'">Calendar</xsl:if>
<xsl:if test="$parTaal = 'frans'">Calendrier</xsl:if>
<xsl:if test="$parTaal = 'duits'">Kalender</xsl:if>
<xsl:if test="$parTaal = 'fries'">Kalinder</xsl:if>
<xsl:if test="$parTaal = 'noors'">Kalender</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Calendario</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Calendario</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Calendário</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_kalender">
<xsl:if test="$parTaal = 'nederlands'">kalender</xsl:if>
<xsl:if test="$parTaal = 'engels'">calendar</xsl:if>
<xsl:if test="$parTaal = 'frans'">calendrier</xsl:if>
<xsl:if test="$parTaal = 'duits'">Kalender</xsl:if>
<xsl:if test="$parTaal = 'fries'">kalinder</xsl:if>
<xsl:if test="$parTaal = 'noors'">kalender</xsl:if>
<xsl:if test="$parTaal = 'spaans'">calendario</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">calendario</xsl:if>
<xsl:if test="$parTaal = 'portugees'">calendário</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Kalenders">
<xsl:if test="$parTaal = 'nederlands'">Kalenders</xsl:if>
<xsl:if test="$parTaal = 'engels'">Calendars</xsl:if>
<xsl:if test="$parTaal = 'frans'">Calendriers</xsl:if>
<xsl:if test="$parTaal = 'duits'">Kalender</xsl:if>
<xsl:if test="$parTaal = 'fries'">Kalinders</xsl:if>
<xsl:if test="$parTaal = 'noors'">Kalendrer</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Calendarios</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Calendari</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Calendários</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_KerkelijkHuwelijk">
<xsl:if test="$parTaal = 'nederlands'">Kerkelijk huwelijk</xsl:if>
<xsl:if test="$parTaal = 'engels'">Religious marriage</xsl:if>
<xsl:if test="$parTaal = 'frans'">Mariage religieux</xsl:if>
<xsl:if test="$parTaal = 'duits'">Kirchliche Heirat</xsl:if>
<xsl:if test="$parTaal = 'fries'">Tsjerklik houlik</xsl:if>
<xsl:if test="$parTaal = 'noors'">Kirkelig vielse</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Matrimonio religioso</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Matrimonio religioso</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Casamento religioso</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Kerkelijk_huwelijk_vond_plaats">
<xsl:if test="$parTaal = 'nederlands'">Het kerkelijk huwelijk vond plaats</xsl:if>
<xsl:if test="$parTaal = 'engels'">The religious marriage was celebrated</xsl:if>
<xsl:if test="$parTaal = 'frans'">Le mariage religieux a été célébré</xsl:if>
<xsl:if test="$parTaal = 'duits'">Die kirchliche Trauung fand statt</xsl:if>
<xsl:if test="$parTaal = 'fries'">It tsjerklik houlik wie dêr</xsl:if>
<xsl:if test="$parTaal = 'noors'">kirkebryllupet fant sted</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Una ceremonia religiosa se celebró</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Una cerimonia religiosa è stata celebrata</xsl:if>
<xsl:if test="$parTaal = 'portugees'">A cerimônia religiosa foi celebrada</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Kies">
<xsl:if test="$parTaal = 'nederlands'">Kies</xsl:if>
<xsl:if test="$parTaal = 'engels'">Select</xsl:if>
<xsl:if test="$parTaal = 'frans'">Choisissez</xsl:if>
<xsl:if test="$parTaal = 'duits'">Wähle</xsl:if>
<xsl:if test="$parTaal = 'fries'">Kies</xsl:if>
<xsl:if test="$parTaal = 'noors'">Velg</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Seleccione</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Selezionare</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Selecione</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Kind">
<xsl:if test="$parTaal = 'nederlands'">Kind</xsl:if>
<xsl:if test="$parTaal = 'engels'">Child</xsl:if>
<xsl:if test="$parTaal = 'frans'">Enfant</xsl:if>
<xsl:if test="$parTaal = 'duits'">Kind</xsl:if>
<xsl:if test="$parTaal = 'fries'">Bern</xsl:if>
<xsl:if test="$parTaal = 'noors'">Barn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Infantil</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Bambino</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Infantil</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_kind">
<xsl:if test="$parTaal = 'nederlands'">kind</xsl:if>
<xsl:if test="$parTaal = 'engels'">child</xsl:if>
<xsl:if test="$parTaal = 'frans'">enfant</xsl:if>
<xsl:if test="$parTaal = 'duits'">Kind</xsl:if>
<xsl:if test="$parTaal = 'fries'">bern</xsl:if>
<xsl:if test="$parTaal = 'noors'">barn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">infantil</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">bambino</xsl:if>
<xsl:if test="$parTaal = 'portugees'">infantil</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Kinderen">
<xsl:if test="$parTaal = 'nederlands'">Kinderen</xsl:if>
<xsl:if test="$parTaal = 'engels'">Children</xsl:if>
<xsl:if test="$parTaal = 'frans'">Enfants</xsl:if>
<xsl:if test="$parTaal = 'duits'">Kinder</xsl:if>
<xsl:if test="$parTaal = 'fries'">Bern</xsl:if>
<xsl:if test="$parTaal = 'noors'">Barn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Niños</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Bambini</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Filhos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_kinderen">
<xsl:if test="$parTaal = 'nederlands'">kinderen</xsl:if>
<xsl:if test="$parTaal = 'engels'">children</xsl:if>
<xsl:if test="$parTaal = 'frans'">enfants</xsl:if>
<xsl:if test="$parTaal = 'duits'">Kinder</xsl:if>
<xsl:if test="$parTaal = 'fries'">bern</xsl:if>
<xsl:if test="$parTaal = 'noors'">barn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">niños</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">bambini</xsl:if>
<xsl:if test="$parTaal = 'portugees'">filhos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Kinderloos">
<xsl:if test="$parTaal = 'nederlands'">Kinderloos</xsl:if>
<xsl:if test="$parTaal = 'engels'">Childless</xsl:if>
<xsl:if test="$parTaal = 'frans'">Sans enfants</xsl:if>
<xsl:if test="$parTaal = 'duits'">Kinderlos</xsl:if>
<xsl:if test="$parTaal = 'fries'">Gjin bern</xsl:if>
<xsl:if test="$parTaal = 'noors'">Barnløs</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Sin hijos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Senza figli</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Sem filhos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Kinderloos_afk">
<xsl:if test="$parTaal = 'nederlands'">NC</xsl:if>
<xsl:if test="$parTaal = 'engels'">NC</xsl:if>
<xsl:if test="$parTaal = 'frans'">SE</xsl:if>
<xsl:if test="$parTaal = 'duits'">NC</xsl:if>
<xsl:if test="$parTaal = 'fries'">GB</xsl:if>
<xsl:if test="$parTaal = 'noors'">BL</xsl:if>
<xsl:if test="$parTaal = 'spaans'">SH</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">SF</xsl:if>
<xsl:if test="$parTaal = 'portugees'">SF</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Kleinkinderen">
<xsl:if test="$parTaal = 'nederlands'">Kleinkinderen</xsl:if>
<xsl:if test="$parTaal = 'engels'">Grandchildren</xsl:if>
<xsl:if test="$parTaal = 'frans'">Petit-enfants</xsl:if>
<xsl:if test="$parTaal = 'duits'">Enkelkinder</xsl:if>
<xsl:if test="$parTaal = 'fries'">Bernsbern</xsl:if>
<xsl:if test="$parTaal = 'noors'">Grandnevø</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Nietos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Nipoti</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Netos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_kleinkinderen">
<xsl:if test="$parTaal = 'nederlands'">kleinkinderen</xsl:if>
<xsl:if test="$parTaal = 'engels'">grandchildren</xsl:if>
<xsl:if test="$parTaal = 'frans'">petit-enfants</xsl:if>
<xsl:if test="$parTaal = 'duits'">Enkelkinder</xsl:if>
<xsl:if test="$parTaal = 'fries'">bernsbern</xsl:if>
<xsl:if test="$parTaal = 'noors'">grandnevø</xsl:if>
<xsl:if test="$parTaal = 'spaans'">nietos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">nipoti</xsl:if>
<xsl:if test="$parTaal = 'portugees'">netos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Kleinkinderentitelgeen">
<xsl:if test="$parTaal = 'nederlands'">Er zijn geen kleinkinderen bekend van </xsl:if>
<xsl:if test="$parTaal = 'engels'">There are no known grandchildren of </xsl:if>
<xsl:if test="$parTaal = 'frans'">Il n'y a pas des petit-enfants connus de </xsl:if>
<xsl:if test="$parTaal = 'duits'">Es gibt keine bekannte Enkelkinder von </xsl:if>
<xsl:if test="$parTaal = 'fries'">Der binne gjin bernsbern bekend fan </xsl:if>
<xsl:if test="$parTaal = 'noors'">Det er ingen kjente barnebarn av </xsl:if>
<xsl:if test="$parTaal = 'spaans'">Hay no son conocidos o nietos </xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Non sono note o nipoti </xsl:if>
<xsl:if test="$parTaal = 'portugees'">Não há são conhecidos ou netos </xsl:if>
</xsl:variable>
<xsl:variable name="Txt_klik_voor_foto_in_apart_venster">
<xsl:if test="$parTaal = 'nederlands'">klik voor foto in apart venster</xsl:if>
<xsl:if test="$parTaal = 'engels'">click for photo in separate window</xsl:if>
<xsl:if test="$parTaal = 'frans'">cliquez pour agrandir la photo</xsl:if>
<xsl:if test="$parTaal = 'duits'">click vor Bild im Separate Fenster</xsl:if>
<xsl:if test="$parTaal = 'fries'">klik foar foto yn apart finster</xsl:if>
<xsl:if test="$parTaal = 'noors'">Klikk for bilde i eget vindu</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Haga clic para la foto en una ventana aparte</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Clicca per la foto in una finestra separata</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Clique para foto em janela separada</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Kompakt">
<xsl:if test="$parTaal = 'nederlands'">Kompakt</xsl:if>
<xsl:if test="$parTaal = 'engels'">Compact</xsl:if>
<xsl:if test="$parTaal = 'frans'">Compact</xsl:if>
<xsl:if test="$parTaal = 'duits'">Kompakt</xsl:if>
<xsl:if test="$parTaal = 'fries'">Kompakt</xsl:if>
<xsl:if test="$parTaal = 'noors'">Kompakt</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Compacto</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Compatto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Compacto</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_kompakt">
<xsl:if test="$parTaal = 'nederlands'">kompakt</xsl:if>
<xsl:if test="$parTaal = 'engels'">compact</xsl:if>
<xsl:if test="$parTaal = 'frans'">compact</xsl:if>
<xsl:if test="$parTaal = 'duits'">kompakt</xsl:if>
<xsl:if test="$parTaal = 'fries'">kompakt</xsl:if>
<xsl:if test="$parTaal = 'noors'">kompakt</xsl:if>
<xsl:if test="$parTaal = 'spaans'">compacto</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">compatto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">compacto</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_kreeg_relatie">
<xsl:if test="$parTaal = 'nederlands'">kreeg een relatie</xsl:if>
<xsl:if test="$parTaal = 'engels'">started a relationship</xsl:if>
<xsl:if test="$parTaal = 'frans'">commencait une relation</xsl:if>
<xsl:if test="$parTaal = 'duits'">fing eine Beziehung an</xsl:if>
<xsl:if test="$parTaal = 'fries'">kreeg in relaasje</xsl:if>
<xsl:if test="$parTaal = 'noors'">angikk en relasjon</xsl:if>
<xsl:if test="$parTaal = 'spaans'">comenzado una relación</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">iniziato un relazione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">começou uma relação</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_kwartierdrager">
<xsl:if test="$parTaal = 'nederlands'">kwartierdrager</xsl:if>
<xsl:if test="$parTaal = 'engels'">proband</xsl:if>
<xsl:if test="$parTaal = 'frans'"></xsl:if>
<xsl:if test="$parTaal = 'duits'"></xsl:if>
<xsl:if test="$parTaal = 'fries'"></xsl:if>
<xsl:if test="$parTaal = 'noors'"></xsl:if>
<xsl:if test="$parTaal = 'spaans'"></xsl:if>
<xsl:if test="$parTaal = 'italiaans'"></xsl:if>
<xsl:if test="$parTaal = 'portugees'"></xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Kwartieren">
<xsl:if test="$parTaal = 'nederlands'">Voorgeslacht</xsl:if>
<xsl:if test="$parTaal = 'engels'">Ancestry</xsl:if>
<xsl:if test="$parTaal = 'frans'">Ancêtres   </xsl:if>
<xsl:if test="$parTaal = 'duits'">Ahnen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Foarteam</xsl:if>
<xsl:if test="$parTaal = 'noors'">Aner</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Antepasados</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Ascendenza</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Antepassados</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_kwartieren">
<xsl:if test="$parTaal = 'nederlands'">kwartieren</xsl:if>
<xsl:if test="$parTaal = 'engels'">ancestry</xsl:if>
<xsl:if test="$parTaal = 'frans'">ascendance</xsl:if>
<xsl:if test="$parTaal = 'duits'">Vorfahren</xsl:if>
<xsl:if test="$parTaal = 'fries'">ketier</xsl:if>
<xsl:if test="$parTaal = 'noors'">forfedre</xsl:if>
<xsl:if test="$parTaal = 'spaans'">antepasados</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">ascendenza</xsl:if>
<xsl:if test="$parTaal = 'portugees'">antepassados</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Kwartierstaat">
<xsl:if test="$parTaal = 'nederlands'">Kwartierstaat</xsl:if>
<xsl:if test="$parTaal = 'engels'">Ancestors</xsl:if>
<xsl:if test="$parTaal = 'frans'">Ancêtres</xsl:if>
<xsl:if test="$parTaal = 'duits'">Ahnen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Foarteam</xsl:if>
<xsl:if test="$parTaal = 'noors'">Aner</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Antepasados</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Ascendenza</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Antepassados</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_kwartierstaat">
<xsl:if test="$parTaal = 'nederlands'">kwartierstaat</xsl:if>
<xsl:if test="$parTaal = 'engels'">ancestors</xsl:if>
<xsl:if test="$parTaal = 'frans'">ancêtres</xsl:if>
<xsl:if test="$parTaal = 'duits'">Ahnen</xsl:if>
<xsl:if test="$parTaal = 'fries'">foarteam</xsl:if>
<xsl:if test="$parTaal = 'noors'">aner</xsl:if>
<xsl:if test="$parTaal = 'spaans'">antepasados</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">ascendenza</xsl:if>
<xsl:if test="$parTaal = 'portugees'">antepassados</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_kwartierstaattekst">
<xsl:if test="$parTaal = 'nederlands'">kwartierstaat in tekstvorm</xsl:if>
<xsl:if test="$parTaal = 'engels'">textual ascendant overview</xsl:if>
<xsl:if test="$parTaal = 'frans'">état ancestral sous forme de texte</xsl:if>
<xsl:if test="$parTaal = 'duits'">Ahnentafel in geschrieben Gestalt</xsl:if>
<xsl:if test="$parTaal = 'fries'">kertieren yn tekstfoarm</xsl:if>
<xsl:if test="$parTaal = 'noors'">anerapport som tekst</xsl:if>
<xsl:if test="$parTaal = 'spaans'">testuale sommario ascendente</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">testuale sommario ascendente</xsl:if>
<xsl:if test="$parTaal = 'portugees'">resumo ascendente textual</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_laatste">
<xsl:if test="$parTaal = 'nederlands'">laatste</xsl:if>
<xsl:if test="$parTaal = 'engels'">last</xsl:if>
<xsl:if test="$parTaal = 'frans'">dernier</xsl:if>
<xsl:if test="$parTaal = 'duits'">Letzte</xsl:if>
<xsl:if test="$parTaal = 'fries'">lêste</xsl:if>
<xsl:if test="$parTaal = 'noors'">siste</xsl:if>
<xsl:if test="$parTaal = 'spaans'">último</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">ultima</xsl:if>
<xsl:if test="$parTaal = 'portugees'">última</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Laatstgewijzigdtitel">
<xsl:if test="$parTaal = 'nederlands'">Overzicht van de personen van wie gegevens zijn gewijzigd sinds </xsl:if>
<xsl:if test="$parTaal = 'engels'">Report of persons whereby the data has changed since </xsl:if>
<xsl:if test="$parTaal = 'frans'">Résumé des personnes dont les données ont été modifiées depuis </xsl:if>
<xsl:if test="$parTaal = 'duits'">Liste der Personen von wem die Daten sich geändert haben seit </xsl:if>
<xsl:if test="$parTaal = 'fries'">Oersicht fan de persoanen fan wa gegevens feroare binne sûnt </xsl:if>
<xsl:if test="$parTaal = 'noors'">Oversikt over personene hvor informasjon har blitt endret siden </xsl:if>
<xsl:if test="$parTaal = 'spaans'">Resumen de las personas cuyos datos se han cambiado desde </xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Sommario delle persone i cui dati sono stati modificati da </xsl:if>
<xsl:if test="$parTaal = 'portugees'">Resumo das pessoas cujos dados foram alterados desde </xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Laatstgewijzigdtitel2">
<xsl:if test="$parTaal = 'nederlands'">Overzicht van de personen van wie onlangs nog gegevens zijn gewijzigd</xsl:if>
<xsl:if test="$parTaal = 'engels'">Report of persons with recent data changes</xsl:if>
<xsl:if test="$parTaal = 'frans'">Résumé des personnes dont les données ont été modifiées récemment</xsl:if>
<xsl:if test="$parTaal = 'duits'">Liste der Personen deren Daten sich neulich geändert haben</xsl:if>
<xsl:if test="$parTaal = 'fries'">Oersicht fan de persoanen fan wa lêsten noch gegevens feroare binne</xsl:if>
<xsl:if test="$parTaal = 'noors'">Oversikt over personene hvor informasjon nyligens har blitt endret </xsl:if>
<xsl:if test="$parTaal = 'spaans'">Resumen de las personas cuyos datos se ha cambiado recientemente</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Sommario delle persone i cui dati sono stati modificati di recente</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Resumo indivíduos cujos dados foram alterados recentemente</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Leeftijd">
<xsl:if test="$parTaal = 'nederlands'">Leeftijd</xsl:if>
<xsl:if test="$parTaal = 'engels'">Age</xsl:if>
<xsl:if test="$parTaal = 'frans'">Âge</xsl:if>
<xsl:if test="$parTaal = 'duits'">Alter</xsl:if>
<xsl:if test="$parTaal = 'fries'">Âldens</xsl:if>
<xsl:if test="$parTaal = 'noors'">Alder</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Edad</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Età</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Idade</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_leeftijd">
<xsl:if test="$parTaal = 'nederlands'">leeftijd</xsl:if>
<xsl:if test="$parTaal = 'engels'">age</xsl:if>
<xsl:if test="$parTaal = 'frans'">âge</xsl:if>
<xsl:if test="$parTaal = 'duits'">Alter</xsl:if>
<xsl:if test="$parTaal = 'fries'">âldens</xsl:if>
<xsl:if test="$parTaal = 'noors'">alder</xsl:if>
<xsl:if test="$parTaal = 'spaans'">edad</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">età</xsl:if>
<xsl:if test="$parTaal = 'portugees'">idade</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Leeftijdsoverzicht">
<xsl:if test="$parTaal = 'nederlands'">Leeftijdsoverzicht</xsl:if>
<xsl:if test="$parTaal = 'engels'">Age based overview</xsl:if>
<xsl:if test="$parTaal = 'frans'">Présentation d'âge</xsl:if>
<xsl:if test="$parTaal = 'duits'">Alter basiert List</xsl:if>
<xsl:if test="$parTaal = 'fries'">Âldensoersicht</xsl:if>
<xsl:if test="$parTaal = 'noors'">Aldersoversikt</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Resúmene edad</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Sommaro età</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Resumo idade</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Leeftijdsoverzichten">
<xsl:if test="$parTaal = 'nederlands'">Leeftijdsoverzichten</xsl:if>
<xsl:if test="$parTaal = 'engels'">Age based overviews</xsl:if>
<xsl:if test="$parTaal = 'frans'">Présentations d' âge</xsl:if>
<xsl:if test="$parTaal = 'duits'">Alter basierte Liste</xsl:if>
<xsl:if test="$parTaal = 'fries'">Âldensoersichten</xsl:if>
<xsl:if test="$parTaal = 'noors'">Aldersoversikt</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Resúmenes edad</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Sommari età</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Resumos idade</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_leeftijdsoverzichten">
<xsl:if test="$parTaal = 'nederlands'">leeftijdsoverzichten</xsl:if>
<xsl:if test="$parTaal = 'engels'">age based overviews</xsl:if>
<xsl:if test="$parTaal = 'frans'">présentations d' âge</xsl:if>
<xsl:if test="$parTaal = 'duits'">Alter basierte Liste</xsl:if>
<xsl:if test="$parTaal = 'fries'">aldensoersichten</xsl:if>
<xsl:if test="$parTaal = 'noors'">aldersoversikt</xsl:if>
<xsl:if test="$parTaal = 'spaans'">resúmenes edad</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">sommari età</xsl:if>
<xsl:if test="$parTaal = 'portugees'">resumos idade</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Legenda">
<xsl:if test="$parTaal = 'nederlands'">Legenda</xsl:if>
<xsl:if test="$parTaal = 'engels'">Legend</xsl:if>
<xsl:if test="$parTaal = 'frans'">Légende</xsl:if>
<xsl:if test="$parTaal = 'duits'">Bemerkung</xsl:if>
<xsl:if test="$parTaal = 'fries'">Legenda</xsl:if>
<xsl:if test="$parTaal = 'noors'">Avkortingen</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Leyenda</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Leggenda</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Lenda</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_levende">
<xsl:if test="$parTaal = 'nederlands'">levende</xsl:if>
<xsl:if test="$parTaal = 'engels'">living</xsl:if>
<xsl:if test="$parTaal = 'frans'">vivant(s)</xsl:if>
<xsl:if test="$parTaal = 'duits'">lebende</xsl:if>
<xsl:if test="$parTaal = 'fries'">libbende</xsl:if>
<xsl:if test="$parTaal = 'noors'">levende</xsl:if>
<xsl:if test="$parTaal = 'spaans'">vida</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">vivente</xsl:if>
<xsl:if test="$parTaal = 'portugees'">vida</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_levenden_m">
<xsl:if test="$parTaal = 'nederlands'">levende</xsl:if>
<xsl:if test="$parTaal = 'engels'">living</xsl:if>
<xsl:if test="$parTaal = 'frans'">vivant(s)</xsl:if>
<xsl:if test="$parTaal = 'duits'">lebende</xsl:if>
<xsl:if test="$parTaal = 'fries'">libbende</xsl:if>
<xsl:if test="$parTaal = 'noors'">levende</xsl:if>
<xsl:if test="$parTaal = 'spaans'">vida</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">vivente</xsl:if>
<xsl:if test="$parTaal = 'portugees'">vida</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_levenden_v">
<xsl:if test="$parTaal = 'nederlands'">levende</xsl:if>
<xsl:if test="$parTaal = 'engels'">living</xsl:if>
<xsl:if test="$parTaal = 'frans'">vivante(s)</xsl:if>
<xsl:if test="$parTaal = 'duits'">lebende</xsl:if>
<xsl:if test="$parTaal = 'fries'">libbende</xsl:if>
<xsl:if test="$parTaal = 'noors'">levende</xsl:if>
<xsl:if test="$parTaal = 'spaans'">vida</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">vivente</xsl:if>
<xsl:if test="$parTaal = 'portugees'">vida</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_levendeman">
<xsl:if test="$parTaal = 'nederlands'">levende man</xsl:if>
<xsl:if test="$parTaal = 'engels'">living man</xsl:if>
<xsl:if test="$parTaal = 'frans'">homme vivant</xsl:if>
<xsl:if test="$parTaal = 'duits'">lebende Mann</xsl:if>
<xsl:if test="$parTaal = 'fries'">libbende man</xsl:if>
<xsl:if test="$parTaal = 'noors'">levende menn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">hombre viven</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">uomino viventi</xsl:if>
<xsl:if test="$parTaal = 'portugees'">homen vivem</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_levendemannen">
<xsl:if test="$parTaal = 'nederlands'">levende mannen</xsl:if>
<xsl:if test="$parTaal = 'engels'">living men</xsl:if>
<xsl:if test="$parTaal = 'frans'">hommes vivants</xsl:if>
<xsl:if test="$parTaal = 'duits'">lebende Männer</xsl:if>
<xsl:if test="$parTaal = 'fries'">libbende manlju</xsl:if>
<xsl:if test="$parTaal = 'noors'">levende menn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">hombres viven</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">uomini viventi</xsl:if>
<xsl:if test="$parTaal = 'portugees'">homens vivem</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_levendepersonen">
<xsl:if test="$parTaal = 'nederlands'">levende personen</xsl:if>
<xsl:if test="$parTaal = 'engels'">living persons</xsl:if>
<xsl:if test="$parTaal = 'frans'">personnes vivantes</xsl:if>
<xsl:if test="$parTaal = 'duits'">lebende Personen</xsl:if>
<xsl:if test="$parTaal = 'fries'">libbende persoanen</xsl:if>
<xsl:if test="$parTaal = 'noors'">levende personer</xsl:if>
<xsl:if test="$parTaal = 'spaans'">personas viven</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">persone viventi</xsl:if>
<xsl:if test="$parTaal = 'portugees'">pessoas vivem</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_levendepersoon">
<xsl:if test="$parTaal = 'nederlands'">levende persoon</xsl:if>
<xsl:if test="$parTaal = 'engels'">living person</xsl:if>
<xsl:if test="$parTaal = 'frans'">personne vivante</xsl:if>
<xsl:if test="$parTaal = 'duits'">lebende Person</xsl:if>
<xsl:if test="$parTaal = 'fries'">libbende persoan</xsl:if>
<xsl:if test="$parTaal = 'noors'">levende person</xsl:if>
<xsl:if test="$parTaal = 'spaans'">personos viven</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">persona viventi</xsl:if>
<xsl:if test="$parTaal = 'portugees'">pessoa vivem</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_levendevrouw">
<xsl:if test="$parTaal = 'nederlands'">levende vrouw</xsl:if>
<xsl:if test="$parTaal = 'engels'">living woman</xsl:if>
<xsl:if test="$parTaal = 'frans'">femme vivante</xsl:if>
<xsl:if test="$parTaal = 'duits'">lebende Frau</xsl:if>
<xsl:if test="$parTaal = 'fries'">libbende frou</xsl:if>
<xsl:if test="$parTaal = 'noors'">levende kvinne</xsl:if>
<xsl:if test="$parTaal = 'spaans'">mujere viven</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">donna vivanti</xsl:if>
<xsl:if test="$parTaal = 'portugees'">mulhere vivem</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_levendevrouwen">
<xsl:if test="$parTaal = 'nederlands'">levende vrouwen</xsl:if>
<xsl:if test="$parTaal = 'engels'">living women</xsl:if>
<xsl:if test="$parTaal = 'frans'">femmes vivantes</xsl:if>
<xsl:if test="$parTaal = 'duits'">lebende Frauen</xsl:if>
<xsl:if test="$parTaal = 'fries'">libbende froulju</xsl:if>
<xsl:if test="$parTaal = 'noors'">levende kvinner</xsl:if>
<xsl:if test="$parTaal = 'spaans'">mujeres viven</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">donne vivanti</xsl:if>
<xsl:if test="$parTaal = 'portugees'">mulheres vivem</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_levenloos">
<xsl:if test="$parTaal = 'nederlands'">levenloos</xsl:if>
<xsl:if test="$parTaal = 'engels'">stillborn</xsl:if>
<xsl:if test="$parTaal = 'frans'">mort-né</xsl:if>
<xsl:if test="$parTaal = 'duits'">totgeboren</xsl:if>
<xsl:if test="$parTaal = 'fries'">dea berne</xsl:if>
<xsl:if test="$parTaal = 'noors'">dødfødt </xsl:if>
<xsl:if test="$parTaal = 'spaans'">nacido muerto</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">nato morto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">nascido morto</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_levenloosgeboren">
<xsl:if test="$parTaal = 'nederlands'">levenloos geboren</xsl:if>
<xsl:if test="$parTaal = 'engels'">stillborn</xsl:if>
<xsl:if test="$parTaal = 'frans'">mort-né</xsl:if>
<xsl:if test="$parTaal = 'duits'">totgeboren</xsl:if>
<xsl:if test="$parTaal = 'fries'">dea berne</xsl:if>
<xsl:if test="$parTaal = 'noors'">dødfødt </xsl:if>
<xsl:if test="$parTaal = 'spaans'">nacido muerto</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">nato morto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">nascido morto</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Lijkbezorging">
<xsl:if test="$parTaal = 'nederlands'">Lijkbezorging</xsl:if>
<xsl:if test="$parTaal = 'engels'">Undertaking</xsl:if>
<xsl:if test="$parTaal = 'frans'">Type d'obsèques</xsl:if>
<xsl:if test="$parTaal = 'duits'">Leichenbestattung</xsl:if>
<xsl:if test="$parTaal = 'fries'">Lykbesoarje</xsl:if>
<xsl:if test="$parTaal = 'noors'">gravleggingstjenester</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Servicios funerarios</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Servizi funebri</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Serviços funerários</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Lijn">
<xsl:if test="$parTaal = 'nederlands'">Lijn</xsl:if>
<xsl:if test="$parTaal = 'engels'">Line</xsl:if>
<xsl:if test="$parTaal = 'frans'">Ligne</xsl:if>
<xsl:if test="$parTaal = 'duits'">Linie</xsl:if>
<xsl:if test="$parTaal = 'fries'">Streek</xsl:if>
<xsl:if test="$parTaal = 'noors'">Linje</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Línea</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Linea</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Linha</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_lijn">
<xsl:if test="$parTaal = 'nederlands'">lijn</xsl:if>
<xsl:if test="$parTaal = 'engels'">line</xsl:if>
<xsl:if test="$parTaal = 'frans'">ligne</xsl:if>
<xsl:if test="$parTaal = 'duits'">Linie</xsl:if>
<xsl:if test="$parTaal = 'fries'">streek</xsl:if>
<xsl:if test="$parTaal = 'noors'">linje</xsl:if>
<xsl:if test="$parTaal = 'spaans'">línea</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">linea</xsl:if>
<xsl:if test="$parTaal = 'portugees'">linha</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_lijnen">
<xsl:if test="$parTaal = 'nederlands'">lijnen</xsl:if>
<xsl:if test="$parTaal = 'engels'">lines</xsl:if>
<xsl:if test="$parTaal = 'frans'">lignes</xsl:if>
<xsl:if test="$parTaal = 'duits'">Linien</xsl:if>
<xsl:if test="$parTaal = 'fries'">streken</xsl:if>
<xsl:if test="$parTaal = 'noors'">linjer</xsl:if>
<xsl:if test="$parTaal = 'spaans'">líneas</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">linee</xsl:if>
<xsl:if test="$parTaal = 'portugees'">linhas</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_lijsten">
<xsl:if test="$parTaal = 'nederlands'">lijsten</xsl:if>
<xsl:if test="$parTaal = 'engels'">lists</xsl:if>
<xsl:if test="$parTaal = 'frans'">listes</xsl:if>
<xsl:if test="$parTaal = 'duits'">Listen</xsl:if>
<xsl:if test="$parTaal = 'fries'">listen  </xsl:if>
<xsl:if test="$parTaal = 'noors'">lister</xsl:if>
<xsl:if test="$parTaal = 'spaans'">listas</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">elenchi</xsl:if>
<xsl:if test="$parTaal = 'portugees'">listas</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Man">
<xsl:if test="$parTaal = 'nederlands'">Man</xsl:if>
<xsl:if test="$parTaal = 'engels'">Man</xsl:if>
<xsl:if test="$parTaal = 'frans'">Homme</xsl:if>
<xsl:if test="$parTaal = 'duits'">Mann</xsl:if>
<xsl:if test="$parTaal = 'fries'">Man</xsl:if>
<xsl:if test="$parTaal = 'noors'">Mann</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Hombre</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Uomo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Homen</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_man_legend">
<xsl:if test="$parTaal = 'nederlands'">(m)an</xsl:if>
<xsl:if test="$parTaal = 'engels'">(m)an</xsl:if>
<xsl:if test="$parTaal = 'frans'">(h)omme</xsl:if>
<xsl:if test="$parTaal = 'duits'">(m)ann</xsl:if>
<xsl:if test="$parTaal = 'fries'">(m)an</xsl:if>
<xsl:if test="$parTaal = 'noors'">(m)ann</xsl:if>
<xsl:if test="$parTaal = 'spaans'">(m)</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">(m)</xsl:if>
<xsl:if test="$parTaal = 'portugees'">(m)</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_man">
<xsl:if test="$parTaal = 'nederlands'">man</xsl:if>
<xsl:if test="$parTaal = 'engels'">man</xsl:if>
<xsl:if test="$parTaal = 'frans'">homme</xsl:if>
<xsl:if test="$parTaal = 'duits'">Mann</xsl:if>
<xsl:if test="$parTaal = 'fries'">man</xsl:if>
<xsl:if test="$parTaal = 'noors'">mann</xsl:if>
<xsl:if test="$parTaal = 'spaans'">hombre</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">uomo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">homen</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_mannelijkelijn">
<xsl:if test="$parTaal = 'nederlands'">mannelijke lijn </xsl:if>
<xsl:if test="$parTaal = 'engels'">male line</xsl:if>
<xsl:if test="$parTaal = 'frans'">lignée patrilinéaire</xsl:if>
<xsl:if test="$parTaal = 'duits'">männliche Linie</xsl:if>
<xsl:if test="$parTaal = 'fries'">manlike streek</xsl:if>
<xsl:if test="$parTaal = 'noors'">Mannlig rekke</xsl:if>
<xsl:if test="$parTaal = 'spaans'">línea masculina</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">linea maschile</xsl:if>
<xsl:if test="$parTaal = 'portugees'">linha masculina</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_mannen">
<xsl:if test="$parTaal = 'nederlands'">mannen</xsl:if>
<xsl:if test="$parTaal = 'engels'">men</xsl:if>
<xsl:if test="$parTaal = 'frans'">hommes</xsl:if>
<xsl:if test="$parTaal = 'duits'">Männer</xsl:if>
<xsl:if test="$parTaal = 'fries'">manlju</xsl:if>
<xsl:if test="$parTaal = 'noors'">menn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">hombres</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">uomo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">homens</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Maximaal">
<xsl:if test="$parTaal = 'nederlands'">Maximaal</xsl:if>
<xsl:if test="$parTaal = 'engels'">Maximum</xsl:if>
<xsl:if test="$parTaal = 'frans'">Maximum</xsl:if>
<xsl:if test="$parTaal = 'duits'">Maximal</xsl:if>
<xsl:if test="$parTaal = 'fries'">Op syn heechst  </xsl:if>
<xsl:if test="$parTaal = 'noors'">Maksimal</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Máximo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Massimo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Máximo</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_maximaal">
<xsl:if test="$parTaal = 'nederlands'">maximaal</xsl:if>
<xsl:if test="$parTaal = 'engels'">maximum</xsl:if>
<xsl:if test="$parTaal = 'frans'">au maximum</xsl:if>
<xsl:if test="$parTaal = 'duits'">maximal</xsl:if>
<xsl:if test="$parTaal = 'fries'">op syn heechst  </xsl:if>
<xsl:if test="$parTaal = 'noors'">maksimal</xsl:if>
<xsl:if test="$parTaal = 'spaans'">máximo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">massimo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">máximo</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_meer">
<xsl:if test="$parTaal = 'nederlands'">meer</xsl:if>
<xsl:if test="$parTaal = 'engels'">more</xsl:if>
<xsl:if test="$parTaal = 'frans'">plus des</xsl:if>
<xsl:if test="$parTaal = 'duits'">mehrere</xsl:if>
<xsl:if test="$parTaal = 'fries'">mear</xsl:if>
<xsl:if test="$parTaal = 'noors'">mer</xsl:if>
<xsl:if test="$parTaal = 'spaans'">más</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">più</xsl:if>
<xsl:if test="$parTaal = 'portugees'">mais</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_meerdan">
<xsl:if test="$parTaal = 'nederlands'">meer dan</xsl:if>
<xsl:if test="$parTaal = 'engels'">more than</xsl:if>
<xsl:if test="$parTaal = 'frans'">plus d'</xsl:if>
<xsl:if test="$parTaal = 'duits'">mehr als</xsl:if>
<xsl:if test="$parTaal = 'fries'">mear as</xsl:if>
<xsl:if test="$parTaal = 'noors'">mer enn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">más de</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">più</xsl:if>
<xsl:if test="$parTaal = 'portugees'">mais do que</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_meerdaneen">
<xsl:if test="$parTaal = 'nederlands'">meer dan een</xsl:if>
<xsl:if test="$parTaal = 'engels'">more than one</xsl:if>
<xsl:if test="$parTaal = 'frans'">plus d'un(e)</xsl:if>
<xsl:if test="$parTaal = 'duits'">mehr als eine</xsl:if>
<xsl:if test="$parTaal = 'fries'">mear as in</xsl:if>
<xsl:if test="$parTaal = 'noors'">mer enn ett</xsl:if>
<xsl:if test="$parTaal = 'spaans'">más de una</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">più</xsl:if>
<xsl:if test="$parTaal = 'portugees'">mais do que um</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Meerkolomslijsten">
<xsl:if test="$parTaal = 'nederlands'">Meerkolomslijsten</xsl:if>
<xsl:if test="$parTaal = 'engels'">Multi-column lists</xsl:if>
<xsl:if test="$parTaal = 'frans'">Plusieurs-colonnes listes</xsl:if>
<xsl:if test="$parTaal = 'duits'">Mehrere-Kolumne Listen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Meerkolomslijsten</xsl:if>
<xsl:if test="$parTaal = 'noors'">Flere kolonnelister</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Más listas de las columnas</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Più liste colonna</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Mais listas de coluna</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Met">
<xsl:if test="$parTaal = 'nederlands'">Met</xsl:if>
<xsl:if test="$parTaal = 'engels'">With</xsl:if>
<xsl:if test="$parTaal = 'frans'">Avec</xsl:if>
<xsl:if test="$parTaal = 'duits'">Mit</xsl:if>
<xsl:if test="$parTaal = 'fries'">Mei</xsl:if>
<xsl:if test="$parTaal = 'noors'">Med</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Con</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Con</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Com</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_met">
<xsl:if test="$parTaal = 'nederlands'">met</xsl:if>
<xsl:if test="$parTaal = 'engels'">with</xsl:if>
<xsl:if test="$parTaal = 'frans'">avec</xsl:if>
<xsl:if test="$parTaal = 'duits'">mit</xsl:if>
<xsl:if test="$parTaal = 'fries'">mei</xsl:if>
<xsl:if test="$parTaal = 'noors'">med</xsl:if>
<xsl:if test="$parTaal = 'spaans'">con</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">con</xsl:if>
<xsl:if test="$parTaal = 'portugees'">com</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_metbekendeleeftijd">
<xsl:if test="$parTaal = 'nederlands'">met bekende leeftijd</xsl:if>
<xsl:if test="$parTaal = 'engels'">with a known age</xsl:if>
<xsl:if test="$parTaal = 'frans'">à l'âge connu</xsl:if>
<xsl:if test="$parTaal = 'duits'">mit bekanntes Alter</xsl:if>
<xsl:if test="$parTaal = 'fries'">mei bekende leeftyd</xsl:if>
<xsl:if test="$parTaal = 'noors'">med kjent alder</xsl:if>
<xsl:if test="$parTaal = 'spaans'">con edad conocida</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">con l'età nota</xsl:if>
<xsl:if test="$parTaal = 'portugees'">com idade conhecida</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Met1gegeven">
<xsl:if test="$parTaal = 'nederlands'">Met één van deze gegevens</xsl:if>
<xsl:if test="$parTaal = 'engels'">With one piece of data</xsl:if>
<xsl:if test="$parTaal = 'frans'">Contenant une de ces données</xsl:if>
<xsl:if test="$parTaal = 'duits'">Mit einer diesen Daten</xsl:if>
<xsl:if test="$parTaal = 'fries'">Mei ien fan dizze gegevens</xsl:if>
<xsl:if test="$parTaal = 'noors'">Med en av dise opplysningene</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Con uno de estos datos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Con uno di questi dati</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Com um destes dados</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Metallegegevens">
<xsl:if test="$parTaal = 'nederlands'">Met alle gegevens</xsl:if>
<xsl:if test="$parTaal = 'engels'">With all data</xsl:if>
<xsl:if test="$parTaal = 'frans'">Contenant toutes ces données</xsl:if>
<xsl:if test="$parTaal = 'duits'">Mit allen diesen Daten</xsl:if>
<xsl:if test="$parTaal = 'fries'">Mei alle gegevens</xsl:if>
<xsl:if test="$parTaal = 'noors'">Med alle opplysninger</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Con todos los datos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Con tutti i dati</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Com todos os dados</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_meteersteletter">
<xsl:if test="$parTaal = 'nederlands'">met eerste letter</xsl:if>
<xsl:if test="$parTaal = 'engels'">with first letter </xsl:if>
<xsl:if test="$parTaal = 'frans'">commençant par la</xsl:if>
<xsl:if test="$parTaal = 'duits'">mit erster Letter</xsl:if>
<xsl:if test="$parTaal = 'fries'">mei earste letter</xsl:if>
<xsl:if test="$parTaal = 'noors'">med første bokstaver</xsl:if>
<xsl:if test="$parTaal = 'spaans'">con primer carácter</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">con primo carattere</xsl:if>
<xsl:if test="$parTaal = 'portugees'">com primeiro caractere</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_minstens">
<xsl:if test="$parTaal = 'nederlands'">minstens</xsl:if>
<xsl:if test="$parTaal = 'engels'">at least</xsl:if>
<xsl:if test="$parTaal = 'frans'">au moins</xsl:if>
<xsl:if test="$parTaal = 'duits'">zu mindestens</xsl:if>
<xsl:if test="$parTaal = 'fries'">op syn minst</xsl:if>
<xsl:if test="$parTaal = 'noors'">minst</xsl:if>
<xsl:if test="$parTaal = 'spaans'">lo menos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">almeno</xsl:if>
<xsl:if test="$parTaal = 'portugees'">menos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Moeder">
<xsl:if test="$parTaal = 'nederlands'">Moeder</xsl:if>
<xsl:if test="$parTaal = 'engels'">Mother</xsl:if>
<xsl:if test="$parTaal = 'frans'">Mère</xsl:if>
<xsl:if test="$parTaal = 'duits'">Mutter</xsl:if>
<xsl:if test="$parTaal = 'fries'">Mem</xsl:if>
<xsl:if test="$parTaal = 'noors'">Mor</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Madre</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Madre</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Mãe</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_moeder">
<xsl:if test="$parTaal = 'nederlands'">moeder</xsl:if>
<xsl:if test="$parTaal = 'engels'">mother</xsl:if>
<xsl:if test="$parTaal = 'frans'">mère</xsl:if>
<xsl:if test="$parTaal = 'duits'">Mutter</xsl:if>
<xsl:if test="$parTaal = 'fries'">mem</xsl:if>
<xsl:if test="$parTaal = 'noors'">mor</xsl:if>
<xsl:if test="$parTaal = 'spaans'">madre</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">madre</xsl:if>
<xsl:if test="$parTaal = 'portugees'">mãe</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_moeders">
<xsl:if test="$parTaal = 'nederlands'">moeders</xsl:if>
<xsl:if test="$parTaal = 'engels'">mothers</xsl:if>
<xsl:if test="$parTaal = 'frans'">mères</xsl:if>
<xsl:if test="$parTaal = 'duits'">Muttern</xsl:if>
<xsl:if test="$parTaal = 'fries'">mem har</xsl:if>
<xsl:if test="$parTaal = 'noors'">moren</xsl:if>
<xsl:if test="$parTaal = 'spaans'">madres</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">madres</xsl:if>
<xsl:if test="$parTaal = 'portugees'">mães</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_na">
<xsl:if test="$parTaal = 'nederlands'">na</xsl:if>
<xsl:if test="$parTaal = 'engels'">after</xsl:if>
<xsl:if test="$parTaal = 'frans'">après</xsl:if>
<xsl:if test="$parTaal = 'duits'">nach</xsl:if>
<xsl:if test="$parTaal = 'fries'">nei</xsl:if>
<xsl:if test="$parTaal = 'noors'">etter</xsl:if>
<xsl:if test="$parTaal = 'spaans'">después</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">dopo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">depois</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Naam">
<xsl:if test="$parTaal = 'nederlands'">Naam</xsl:if>
<xsl:if test="$parTaal = 'engels'">Name</xsl:if>
<xsl:if test="$parTaal = 'frans'">Nom</xsl:if>
<xsl:if test="$parTaal = 'duits'">Name</xsl:if>
<xsl:if test="$parTaal = 'fries'">Namme</xsl:if>
<xsl:if test="$parTaal = 'noors'">Navn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Apellido</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Nome</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Nome</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_naam">
<xsl:if test="$parTaal = 'nederlands'">naam</xsl:if>
<xsl:if test="$parTaal = 'engels'">name</xsl:if>
<xsl:if test="$parTaal = 'frans'">nom</xsl:if>
<xsl:if test="$parTaal = 'duits'">Name</xsl:if>
<xsl:if test="$parTaal = 'fries'">namme</xsl:if>
<xsl:if test="$parTaal = 'noors'">navn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">apellido</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">nome</xsl:if>
<xsl:if test="$parTaal = 'portugees'">nome</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_nadat_ondertrouw">
<xsl:if test="$parTaal = 'nederlands'">nadat zij in ondertrouw waren gegaan</xsl:if>
<xsl:if test="$parTaal = 'engels'">after their intention to marry had been registered</xsl:if>
<xsl:if test="$parTaal = 'frans'">après la publication des bans signé</xsl:if>
<xsl:if test="$parTaal = 'duits'">nachdem Sie Ihr Absicht zum heiraten bekannt gegeben haben</xsl:if>
<xsl:if test="$parTaal = 'fries'">neidat se yn ûndertrou gean binne</xsl:if>
<xsl:if test="$parTaal = 'noors'">(etter at de har tatt ut lysing)</xsl:if>
<xsl:if test="$parTaal = 'spaans'">después de que fue el matrimonio</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">después de que fue el matrimonio</xsl:if>
<xsl:if test="$parTaal = 'portugees'">depois que foram casamento</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Nageslacht">
<xsl:if test="$parTaal = 'nederlands'">Nageslacht</xsl:if>
<xsl:if test="$parTaal = 'engels'">Descendancy</xsl:if>
<xsl:if test="$parTaal = 'frans'">Descendance</xsl:if>
<xsl:if test="$parTaal = 'duits'">Nachkommen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Neiteam</xsl:if>
<xsl:if test="$parTaal = 'noors'">Avkom</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Descendientes</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Discendenti</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Descendentes</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_nageslacht">
<xsl:if test="$parTaal = 'nederlands'">parenteel</xsl:if>
<xsl:if test="$parTaal = 'engels'">descendants</xsl:if>
<xsl:if test="$parTaal = 'frans'">descendants</xsl:if>
<xsl:if test="$parTaal = 'duits'">Nachkommen</xsl:if>
<xsl:if test="$parTaal = 'fries'">neiteam</xsl:if>
<xsl:if test="$parTaal = 'noors'">avkom</xsl:if>
<xsl:if test="$parTaal = 'spaans'">descendientes</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">discendenti</xsl:if>
<xsl:if test="$parTaal = 'portugees'">descendentes</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Nageslachtcirkel">
<xsl:if test="$parTaal = 'nederlands'">Nageslachtcirkel</xsl:if>
<xsl:if test="$parTaal = 'engels'">Descendants circle</xsl:if>
<xsl:if test="$parTaal = 'frans'">Cercle descandants</xsl:if>
<xsl:if test="$parTaal = 'duits'">Nachkommenkreis</xsl:if>
<xsl:if test="$parTaal = 'fries'">Neiteam-cirkel</xsl:if>
<xsl:if test="$parTaal = 'noors'">Etterslekts-sirkel</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Círculo de descendientes</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Discendenti cerchio</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Círculo de descendentes</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Nageslachtgrafischwaarschuwing1">
<xsl:if test="$parTaal = 'nederlands'">Ook het maken van een grafisch overzicht duurt langer indien voor veel generaties wordt gekozen.</xsl:if>
<xsl:if test="$parTaal = 'engels'">Also the generation of a graphical report will take longer if the number of generations is large.</xsl:if>
<xsl:if test="$parTaal = 'frans'">Aussi la production d'une présentation graphique peut être plus long si on opte pour plus des générations.</xsl:if>
<xsl:if test="$parTaal = 'duits'">Auch die Produktion einer graphischen Reportage wird länger dauern wenn viele Generationen sind selektiert.</xsl:if>
<xsl:if test="$parTaal = 'fries'">Ek it meitsjen fan in grafisch oersjoch duorret langer as foar in soad generaasjes wurdt keazen.</xsl:if>
<xsl:if test="$parTaal = 'noors'">Også lage en grafisk oversikt varer lenger hvis valgt for mange generasjoner.</xsl:if>
<xsl:if test="$parTaal = 'spaans'">También haciendo un resumen gráfico dura más tiempo si es elegido por muchas generaciones.</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Anche facendo una panoramica grafica dura più a lungo se scelto per molte generazioni.</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Também fazendo um panorama gráfico dura mais tempo se for escolhido por muitas gerações.</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Nageslachtgrafischwaarschuwing2">
<xsl:if test="$parTaal = 'nederlands'">Let op: Het maken van een grafisch overzicht kan lang duren indien voor veel generaties wordt gekozen.</xsl:if>
<xsl:if test="$parTaal = 'engels'">Notice that making a graphical report will take longer if the number of generations is large.</xsl:if>
<xsl:if test="$parTaal = 'frans'">Attention: la production d'une présentation graphique peut être plus long si on opte pour plus des générations.</xsl:if>
<xsl:if test="$parTaal = 'duits'">Achtung: die Produktion einer graphischen Reportage wird länger dauern wenn viele Generationen sind selektiert.</xsl:if>
<xsl:if test="$parTaal = 'fries'"></xsl:if>
<xsl:if test="$parTaal = 'noors'"></xsl:if>
<xsl:if test="$parTaal = 'spaans'"></xsl:if>
<xsl:if test="$parTaal = 'italiaans'"></xsl:if>
<xsl:if test="$parTaal = 'portugees'"></xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Nageslachtrapporten">
<xsl:if test="$parTaal = 'nederlands'">Nageslachtrapporten</xsl:if>
<xsl:if test="$parTaal = 'engels'">Descendants reports</xsl:if>
<xsl:if test="$parTaal = 'frans'">Présentations rédigées des descendants</xsl:if>
<xsl:if test="$parTaal = 'duits'">Nachkommenreportagen</xsl:if>
<xsl:if test="$parTaal = 'fries'"></xsl:if>
<xsl:if test="$parTaal = 'noors'"></xsl:if>
<xsl:if test="$parTaal = 'spaans'"></xsl:if>
<xsl:if test="$parTaal = 'italiaans'"></xsl:if>
<xsl:if test="$parTaal = 'portugees'"></xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Nageslachtrapportenintekstvorm">
<xsl:if test="$parTaal = 'nederlands'">Nageslachtrapporten in tekstvorm</xsl:if>
<xsl:if test="$parTaal = 'engels'">Descendants reports in the form of text</xsl:if>
<xsl:if test="$parTaal = 'frans'">Présentations rédigées des descendants</xsl:if>
<xsl:if test="$parTaal = 'duits'">Nachkommenreportagen in geschrieben Gestalt</xsl:if>
<xsl:if test="$parTaal = 'fries'">neiteamferslach yn </xsl:if>
<xsl:if test="$parTaal = 'noors'">Etterkommerrapport i tekstform</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Descendientes informes en forma de texto</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Discendenti rapporti in forma di testo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Descendentes relata em forma de texto</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Nageslachtrapportentitel">
<xsl:if test="$parTaal = 'nederlands'">Kies hier het gewenste overzicht van </xsl:if>
<xsl:if test="$parTaal = 'engels'">Select the desired report for </xsl:if>
<xsl:if test="$parTaal = 'frans'">Choisissez une présentation pour </xsl:if>
<xsl:if test="$parTaal = 'duits'">Bitte selektieren Sie die erwünschte reportage von </xsl:if>
<xsl:if test="$parTaal = 'fries'">Kies hjir it winske oersjoch fan </xsl:if>
<xsl:if test="$parTaal = 'noors'">Velg ønsket rapport for </xsl:if>
<xsl:if test="$parTaal = 'spaans'">Seleccione el resumen deseado para</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Selezionare il sommario desiderato per</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Selecione o resumo desejado para</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Nageslachttekstwaarschuwing">
<xsl:if test="$parTaal = 'nederlands'">Let op: Het genereren van een overzicht van veel generaties kan lang duren. Dit kan wel oplopen tot 15 minuten of meer indien voor 10 of meer generaties een overzicht gemaakt moet worden.</xsl:if>
<xsl:if test="$parTaal = 'engels'">Note that generating a report with many generations may take a long time. In case a report requires 10 or more generations this may exceed 15 minutes to finish.</xsl:if>
<xsl:if test="$parTaal = 'frans'">Attention: Veuillez patienter pour une présentation contenant plusieurs générations. Pour une présentation de 10 générations ou plus, cela peut durer jusqu’à 15 minutes et au-delà.</xsl:if>
<xsl:if test="$parTaal = 'duits'">Achtung: Die Produktion einer Liste vieler Generationen kann lang dauern. Das kann steigen bis 15 Minuten oder mehr wenn eine Liste von 10 oder mehr Generationen gemacht werden soll.</xsl:if>
<xsl:if test="$parTaal = 'fries'">Tink derom: It genereren fan in oersjoch fan soad generaasjes kin lang duorren. Dit kin wol oplopen oant 15 minuten of mear as foar 10 of mear generaasjes in oersjoch makke moat wurde.  </xsl:if>
<xsl:if test="$parTaal = 'noors'">Merk: Generere en liste over ofte kan vare i generasjoner. Dette kan ta opptil 15 minutter eller mer hvis 10 eller flere generasjoner bør være en uttalelse.</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Nota: La generación de una lista de frecuencia podría durar por generaciones. Esto puede tomar hasta 15 minutos o más si 10 o más generaciones deben ser una declaración.</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Nota: Creazione di un elenco di frequente potrebbe durare per generazioni. Questo può richiedere fino a 15 minuti o più se 10 o più generazioni dovrebbe essere una dichiarazione.</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Nota: Gerando uma lista de freqüência poderia durar por gerações. Isso pode levar até 15 minutos ou mais, se 10 ou mais gerações deve ser uma declaração feita.</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Nageslachtvrouwlijn">
<xsl:if test="$parTaal = 'nederlands'">Nageslacht</xsl:if>
<xsl:if test="$parTaal = 'engels'">Matrilineal descendants</xsl:if>
<xsl:if test="$parTaal = 'frans'">Descendants</xsl:if>
<xsl:if test="$parTaal = 'duits'">Nachkommen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Froulike neiteam</xsl:if>
<xsl:if test="$parTaal = 'noors'">Kvinnelig avkom</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Descendientes femenina</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Discendenti femminile</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Descendentes feminina</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Nietbekend">
<xsl:if test="$parTaal = 'nederlands'">Niet bekend</xsl:if>
<xsl:if test="$parTaal = 'engels'">Unknown</xsl:if>
<xsl:if test="$parTaal = 'frans'">Inconnu</xsl:if>
<xsl:if test="$parTaal = 'duits'">Nicht gekannt</xsl:if>
<xsl:if test="$parTaal = 'fries'">Net bekend</xsl:if>
<xsl:if test="$parTaal = 'noors'">Ukjent</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Desconocido</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Sconosciuto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Desconhecido</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Nieuws">
<xsl:if test="$parTaal = 'nederlands'">Nieuws</xsl:if>
<xsl:if test="$parTaal = 'engels'">News</xsl:if>
<xsl:if test="$parTaal = 'frans'">Journal</xsl:if>
<xsl:if test="$parTaal = 'duits'">Nachrichten</xsl:if>
<xsl:if test="$parTaal = 'fries'">Nijs</xsl:if>
<xsl:if test="$parTaal = 'noors'">Nyhet</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Novedad</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Novità</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Novidade</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Notarieel">
<xsl:if test="$parTaal = 'nederlands'">Notarieel</xsl:if>
<xsl:if test="$parTaal = 'engels'">Notarial</xsl:if>
<xsl:if test="$parTaal = 'frans'">Notarié</xsl:if>
<xsl:if test="$parTaal = 'duits'">Notariell</xsl:if>
<xsl:if test="$parTaal = 'fries'">Notarieel</xsl:if>
<xsl:if test="$parTaal = 'noors'">Notariell</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Notarial</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Notarile</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Notarial</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Notitie">
<xsl:if test="$parTaal = 'nederlands'">Notitie</xsl:if>
<xsl:if test="$parTaal = 'engels'">Note</xsl:if>
<xsl:if test="$parTaal = 'frans'">Remarque</xsl:if>
<xsl:if test="$parTaal = 'duits'">Bemerkung</xsl:if>
<xsl:if test="$parTaal = 'fries'">Notysje</xsl:if>
<xsl:if test="$parTaal = 'noors'">Notis</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Nota</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Nota</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Nota</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Notities">
<xsl:if test="$parTaal = 'nederlands'">Notities</xsl:if>
<xsl:if test="$parTaal = 'engels'">Notes</xsl:if>
<xsl:if test="$parTaal = 'frans'">Remarques</xsl:if>
<xsl:if test="$parTaal = 'duits'">Bemerkungen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Notysjes</xsl:if>
<xsl:if test="$parTaal = 'noors'">Notis </xsl:if>
<xsl:if test="$parTaal = 'spaans'">Notas</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Note</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Notas</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_nu">
<xsl:if test="$parTaal = 'nederlands'">nu</xsl:if>
<xsl:if test="$parTaal = 'engels'">now</xsl:if>
<xsl:if test="$parTaal = 'frans'">maintenant</xsl:if>
<xsl:if test="$parTaal = 'duits'">jetzt</xsl:if>
<xsl:if test="$parTaal = 'fries'">no</xsl:if>
<xsl:if test="$parTaal = 'noors'">nå</xsl:if>
<xsl:if test="$parTaal = 'spaans'">ahora</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">ora</xsl:if>
<xsl:if test="$parTaal = 'portugees'">agora</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_of">
<xsl:if test="$parTaal = 'nederlands'">of</xsl:if>
<xsl:if test="$parTaal = 'engels'">or</xsl:if>
<xsl:if test="$parTaal = 'frans'">ou</xsl:if>
<xsl:if test="$parTaal = 'duits'">oder</xsl:if>
<xsl:if test="$parTaal = 'fries'">of</xsl:if>
<xsl:if test="$parTaal = 'noors'">eller</xsl:if>
<xsl:if test="$parTaal = 'spaans'">o</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">o</xsl:if>
<xsl:if test="$parTaal = 'portugees'">ou</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_om">
<xsl:if test="$parTaal = 'nederlands'">om</xsl:if>
<xsl:if test="$parTaal = 'engels'">at</xsl:if>
<xsl:if test="$parTaal = 'frans'">à</xsl:if>
<xsl:if test="$parTaal = 'duits'">um</xsl:if>
<xsl:if test="$parTaal = 'fries'">om</xsl:if>
<xsl:if test="$parTaal = 'noors'">til</xsl:if>
<xsl:if test="$parTaal = 'spaans'">en</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">a</xsl:if>
<xsl:if test="$parTaal = 'portugees'">em</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Omschrijving">
<xsl:if test="$parTaal = 'nederlands'">Omschrijving</xsl:if>
<xsl:if test="$parTaal = 'engels'">Description</xsl:if>
<xsl:if test="$parTaal = 'frans'">Description</xsl:if>
<xsl:if test="$parTaal = 'duits'">Beschreibung</xsl:if>
<xsl:if test="$parTaal = 'fries'">Omskriuwing</xsl:if>
<xsl:if test="$parTaal = 'noors'">Definisjon</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Definición</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Definizione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Definição</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_omschrijving">
<xsl:if test="$parTaal = 'nederlands'">omschrijving</xsl:if>
<xsl:if test="$parTaal = 'engels'">description</xsl:if>
<xsl:if test="$parTaal = 'frans'">description</xsl:if>
<xsl:if test="$parTaal = 'duits'">Beschreibung</xsl:if>
<xsl:if test="$parTaal = 'fries'">omskriuwing</xsl:if>
<xsl:if test="$parTaal = 'noors'">definisjon</xsl:if>
<xsl:if test="$parTaal = 'spaans'">definición</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">definizione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">definição</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_omstreeks">
<xsl:if test="$parTaal = 'nederlands'">omstreeks</xsl:if>
<xsl:if test="$parTaal = 'engels'">about</xsl:if>
<xsl:if test="$parTaal = 'frans'">environ</xsl:if>
<xsl:if test="$parTaal = 'duits'">etwa</xsl:if>
<xsl:if test="$parTaal = 'fries'">oangeande</xsl:if>
<xsl:if test="$parTaal = 'noors'">omtrent</xsl:if>
<xsl:if test="$parTaal = 'spaans'">acerca de</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">su</xsl:if>
<xsl:if test="$parTaal = 'portugees'">sobre</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_OnbekendeRelatie">
<xsl:if test="$parTaal = 'nederlands'">Onbekende relatie</xsl:if>
<xsl:if test="$parTaal = 'engels'">Unknown relationship</xsl:if>
<xsl:if test="$parTaal = 'frans'">Type de relation inconnue</xsl:if>
<xsl:if test="$parTaal = 'duits'">Unbekannte Beziehung</xsl:if>
<xsl:if test="$parTaal = 'fries'">Ûnbekende relaasje</xsl:if>
<xsl:if test="$parTaal = 'noors'">Ukjent relasjon</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Relación desconocido</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Relazione sconosciuto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Relação desconhecido</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Onbekend">
<xsl:if test="$parTaal = 'nederlands'">Onbekend</xsl:if>
<xsl:if test="$parTaal = 'engels'">Unknown</xsl:if>
<xsl:if test="$parTaal = 'frans'">Inconnu</xsl:if>
<xsl:if test="$parTaal = 'duits'">Unbekannt</xsl:if>
<xsl:if test="$parTaal = 'fries'">Net bekend</xsl:if>
<xsl:if test="$parTaal = 'noors'">Ukjent</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Desconocido</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Sconosciuto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Desconhecido</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_onbekend_legend">
<xsl:if test="$parTaal = 'nederlands'">(o)nbekend</xsl:if>
<xsl:if test="$parTaal = 'engels'">(u)nknown</xsl:if>
<xsl:if test="$parTaal = 'frans'">(i)nconnu</xsl:if>
<xsl:if test="$parTaal = 'duits'">(u)nbekannt</xsl:if>
<xsl:if test="$parTaal = 'fries'">(n)et bekend</xsl:if>
<xsl:if test="$parTaal = 'noors'">(u)kjent</xsl:if>
<xsl:if test="$parTaal = 'spaans'">(d)esconocido</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">*(s)conosciuto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">(d)esconhecido</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_onbekend">
<xsl:if test="$parTaal = 'nederlands'">onbekend</xsl:if>
<xsl:if test="$parTaal = 'engels'">unknown</xsl:if>
<xsl:if test="$parTaal = 'frans'">inconnu</xsl:if>
<xsl:if test="$parTaal = 'duits'">unbekannt</xsl:if>
<xsl:if test="$parTaal = 'fries'">net bekend</xsl:if>
<xsl:if test="$parTaal = 'noors'">ukjent</xsl:if>
<xsl:if test="$parTaal = 'spaans'">desconocido</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">sconosciuto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">desconhecido</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_onbekend_geslacht">
<xsl:if test="$parTaal = 'nederlands'">onbekend geslacht</xsl:if>
<xsl:if test="$parTaal = 'engels'">unknown sex</xsl:if>
<xsl:if test="$parTaal = 'frans'">sexe inconnu</xsl:if>
<xsl:if test="$parTaal = 'duits'">unbekanntes Geslecht</xsl:if>
<xsl:if test="$parTaal = 'fries'">net bekend slachte</xsl:if>
<xsl:if test="$parTaal = 'noors'">ukjent kjønn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">sexo desconocido</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">sesso sconosciuto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">sexo desconhecido</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Onderscheiding">
<xsl:if test="$parTaal = 'nederlands'">Onderscheiding</xsl:if>
<xsl:if test="$parTaal = 'engels'">Honor</xsl:if>
<xsl:if test="$parTaal = 'frans'">Décoration</xsl:if>
<xsl:if test="$parTaal = 'duits'">Orde</xsl:if>
<xsl:if test="$parTaal = 'fries'">Ûnderskieding</xsl:if>
<xsl:if test="$parTaal = 'noors'">Utmerkelse</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Decoración</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Decorazione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Decoração</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Onderscheidingen">
<xsl:if test="$parTaal = 'nederlands'">Onderscheidingen</xsl:if>
<xsl:if test="$parTaal = 'engels'">Honors</xsl:if>
<xsl:if test="$parTaal = 'frans'">Décorations</xsl:if>
<xsl:if test="$parTaal = 'duits'">Orden</xsl:if>
<xsl:if test="$parTaal = 'fries'">Ûnderskiedingen</xsl:if>
<xsl:if test="$parTaal = 'noors'">Utmerkelsen</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Decoraciónen</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Decorazioni</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Decoraçãos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Ondertrouw">
<xsl:if test="$parTaal = 'nederlands'">Ondertrouw</xsl:if>
<xsl:if test="$parTaal = 'engels'">Marriage license</xsl:if>
<xsl:if test="$parTaal = 'frans'">Publication des bans</xsl:if>
<xsl:if test="$parTaal = 'duits'">Aufgebot</xsl:if>
<xsl:if test="$parTaal = 'fries'">Ûndertrou</xsl:if>
<xsl:if test="$parTaal = 'noors'">Trolovelse</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Aviso de matrimonio</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Avviso di matrimonio</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Aviso de matrimônio</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_ongeveer">
<xsl:if test="$parTaal = 'nederlands'">omstreeks</xsl:if>
<xsl:if test="$parTaal = 'engels'">about</xsl:if>
<xsl:if test="$parTaal = 'frans'">environ</xsl:if>
<xsl:if test="$parTaal = 'duits'">etwa</xsl:if>
<xsl:if test="$parTaal = 'fries'">oangeande</xsl:if>
<xsl:if test="$parTaal = 'noors'">omtrent</xsl:if>
<xsl:if test="$parTaal = 'spaans'">acerca de</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">su</xsl:if>
<xsl:if test="$parTaal = 'portugees'">sobre</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_OntbrekendeRelatie">
<xsl:if test="$parTaal = 'nederlands'">Ontbrekende relatie</xsl:if>
<xsl:if test="$parTaal = 'engels'">Missing relationship</xsl:if>
<xsl:if test="$parTaal = 'frans'">Manquant relation</xsl:if>
<xsl:if test="$parTaal = 'duits'">Fehlende Beziehung</xsl:if>
<xsl:if test="$parTaal = 'fries'">Ûntbrekkende relaasje</xsl:if>
<xsl:if test="$parTaal = 'noors'">Manglende realsjon</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Relación que falta</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Relazione mancante</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Relacionamento faltante</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_ook">
<xsl:if test="$parTaal = 'nederlands'">ook</xsl:if>
<xsl:if test="$parTaal = 'engels'">also</xsl:if>
<xsl:if test="$parTaal = 'frans'">ainsi</xsl:if>
<xsl:if test="$parTaal = 'duits'">auch</xsl:if>
<xsl:if test="$parTaal = 'fries'">ek</xsl:if>
<xsl:if test="$parTaal = 'noors'">også</xsl:if>
<xsl:if test="$parTaal = 'spaans'">tambien</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">anche</xsl:if>
<xsl:if test="$parTaal = 'portugees'">também</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_oorzaak">
<xsl:if test="$parTaal = 'nederlands'">oorzaak</xsl:if>
<xsl:if test="$parTaal = 'engels'">cause</xsl:if>
<xsl:if test="$parTaal = 'frans'">cause</xsl:if>
<xsl:if test="$parTaal = 'duits'">Ursache</xsl:if>
<xsl:if test="$parTaal = 'fries'">Oarsaak</xsl:if>
<xsl:if test="$parTaal = 'noors'">Arsaken</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Causa</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Causa</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Causa</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_op">
<xsl:if test="$parTaal = 'nederlands'">op</xsl:if>
<xsl:if test="$parTaal = 'engels'">on</xsl:if>
<xsl:if test="$parTaal = 'frans'">à</xsl:if>
<xsl:if test="$parTaal = 'duits'">auf</xsl:if>
<xsl:if test="$parTaal = 'fries'">op</xsl:if>
<xsl:if test="$parTaal = 'noors'">på</xsl:if>
<xsl:if test="$parTaal = 'spaans'">en</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">su</xsl:if>
<xsl:if test="$parTaal = 'portugees'">em</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_opdatum">
<xsl:if test="$parTaal = 'nederlands'">op</xsl:if>
<xsl:if test="$parTaal = 'engels'">on</xsl:if>
<xsl:if test="$parTaal = 'frans'">le</xsl:if>
<xsl:if test="$parTaal = 'duits'">auf</xsl:if>
<xsl:if test="$parTaal = 'fries'">op</xsl:if>
<xsl:if test="$parTaal = 'noors'">på</xsl:if>
<xsl:if test="$parTaal = 'spaans'">en</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">su</xsl:if>
<xsl:if test="$parTaal = 'portugees'">em</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_opdezelfdedag">
<xsl:if test="$parTaal = 'nederlands'">op dezelfde dag</xsl:if>
<xsl:if test="$parTaal = 'engels'">on the same day</xsl:if>
<xsl:if test="$parTaal = 'frans'">au même jour</xsl:if>
<xsl:if test="$parTaal = 'duits'">am gleicher Tag</xsl:if>
<xsl:if test="$parTaal = 'fries'">op de deselde dei</xsl:if>
<xsl:if test="$parTaal = 'noors'">pa den samme dagen</xsl:if>
<xsl:if test="$parTaal = 'spaans'">en el mismo día</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">lo stesso giorno</xsl:if>
<xsl:if test="$parTaal = 'portugees'">no mesmo dia</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_opdeleeftijdvanna">
<xsl:if test="$parTaal = 'nederlands'"> jaar oud</xsl:if>
<xsl:if test="$parTaal = 'engels'"></xsl:if>
<xsl:if test="$parTaal = 'frans'"> ans</xsl:if>
<xsl:if test="$parTaal = 'duits'"> Jahr alt</xsl:if>
<xsl:if test="$parTaal = 'fries'"></xsl:if>
<xsl:if test="$parTaal = 'noors'"></xsl:if>
<xsl:if test="$parTaal = 'spaans'"></xsl:if>
<xsl:if test="$parTaal = 'italiaans'"></xsl:if>
<xsl:if test="$parTaal = 'portugees'"></xsl:if>
</xsl:variable>
<xsl:variable name="Txt_opdeleeftijdvanvoor">
<xsl:if test="$parTaal = 'nederlands'"></xsl:if>
<xsl:if test="$parTaal = 'engels'">aged </xsl:if>
<xsl:if test="$parTaal = 'frans'">à l'âge de </xsl:if>
<xsl:if test="$parTaal = 'duits'"></xsl:if>
<xsl:if test="$parTaal = 'fries'"></xsl:if>
<xsl:if test="$parTaal = 'noors'"></xsl:if>
<xsl:if test="$parTaal = 'spaans'"></xsl:if>
<xsl:if test="$parTaal = 'italiaans'"></xsl:if>
<xsl:if test="$parTaal = 'portugees'"></xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Opleiding">
<xsl:if test="$parTaal = 'nederlands'">Opleiding</xsl:if>
<xsl:if test="$parTaal = 'engels'">Education</xsl:if>
<xsl:if test="$parTaal = 'frans'">Formation</xsl:if>
<xsl:if test="$parTaal = 'duits'">Ausbildung</xsl:if>
<xsl:if test="$parTaal = 'fries'">Oplieding</xsl:if>
<xsl:if test="$parTaal = 'noors'">Utdannelse</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Educación</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Educazione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Educação</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Opleidingen">
<xsl:if test="$parTaal = 'nederlands'">Opleidingen</xsl:if>
<xsl:if test="$parTaal = 'engels'">Educations</xsl:if>
<xsl:if test="$parTaal = 'frans'">Formations</xsl:if>
<xsl:if test="$parTaal = 'duits'">Ausbildungen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Opliedinge</xsl:if>
<xsl:if test="$parTaal = 'noors'">Utdannelser</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Educaciónes</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Educazioni</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Educaçãos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Opvolgorde">
<xsl:if test="$parTaal = 'nederlands'">Op volgorde</xsl:if>
<xsl:if test="$parTaal = 'engels'">In order</xsl:if>
<xsl:if test="$parTaal = 'frans'">Séquentielle</xsl:if>
<xsl:if test="$parTaal = 'duits'">Auf Rangfolge</xsl:if>
<xsl:if test="$parTaal = 'fries'">Op folchoarder  </xsl:if>
<xsl:if test="$parTaal = 'noors'">For</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Clasificado</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Classifica</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Classificado</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Ouder">
<xsl:if test="$parTaal = 'nederlands'">Ouder</xsl:if>
<xsl:if test="$parTaal = 'engels'">Parent</xsl:if>
<xsl:if test="$parTaal = 'frans'">Parent</xsl:if>
<xsl:if test="$parTaal = 'duits'">Elter</xsl:if>
<xsl:if test="$parTaal = 'fries'">Aldelju</xsl:if>
<xsl:if test="$parTaal = 'noors'">Foreldre</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Padre</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Genotore</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Parente</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_ouders">
<xsl:if test="$parTaal = 'nederlands'">ouders</xsl:if>
<xsl:if test="$parTaal = 'engels'">parents</xsl:if>
<xsl:if test="$parTaal = 'frans'"></xsl:if>
<xsl:if test="$parTaal = 'duits'"></xsl:if>
<xsl:if test="$parTaal = 'fries'"></xsl:if>
<xsl:if test="$parTaal = 'noors'"></xsl:if>
<xsl:if test="$parTaal = 'spaans'"></xsl:if>
<xsl:if test="$parTaal = 'italiaans'"></xsl:if>
<xsl:if test="$parTaal = 'portugees'"></xsl:if>
</xsl:variable>
<xsl:variable name="Txt_oudouders">
<xsl:if test="$parTaal = 'nederlands'">oudouders</xsl:if>
<xsl:if test="$parTaal = 'engels'"></xsl:if>
<xsl:if test="$parTaal = 'frans'"></xsl:if>
<xsl:if test="$parTaal = 'duits'"></xsl:if>
<xsl:if test="$parTaal = 'fries'"></xsl:if>
<xsl:if test="$parTaal = 'noors'"></xsl:if>
<xsl:if test="$parTaal = 'spaans'"></xsl:if>
<xsl:if test="$parTaal = 'italiaans'"></xsl:if>
<xsl:if test="$parTaal = 'portugees'"></xsl:if>
</xsl:variable>
<xsl:variable name="Txt_overgrootmoeder">
<xsl:if test="$parTaal = 'nederlands'">overgrootmoeder</xsl:if>
<xsl:if test="$parTaal = 'engels'">great-grandmother</xsl:if>
<xsl:if test="$parTaal = 'frans'">arrière-grand-mère</xsl:if>
<xsl:if test="$parTaal = 'duits'">Urgroßmutter</xsl:if>
<xsl:if test="$parTaal = 'fries'">oerbeppe</xsl:if>
<xsl:if test="$parTaal = 'noors'">oldemor</xsl:if>
<xsl:if test="$parTaal = 'spaans'">bisabuela</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">bisnonna</xsl:if>
<xsl:if test="$parTaal = 'portugees'">bisavó</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_overgrootouders">
<xsl:if test="$parTaal = 'nederlands'">overgrootouders</xsl:if>
<xsl:if test="$parTaal = 'engels'">great-grandparents</xsl:if>
<xsl:if test="$parTaal = 'frans'"></xsl:if>
<xsl:if test="$parTaal = 'duits'"></xsl:if>
<xsl:if test="$parTaal = 'fries'"></xsl:if>
<xsl:if test="$parTaal = 'noors'"></xsl:if>
<xsl:if test="$parTaal = 'spaans'"></xsl:if>
<xsl:if test="$parTaal = 'italiaans'"></xsl:if>
<xsl:if test="$parTaal = 'portugees'"></xsl:if>
</xsl:variable>
<xsl:variable name="Txt_overgrootvader">
<xsl:if test="$parTaal = 'nederlands'">overgrootvader</xsl:if>
<xsl:if test="$parTaal = 'engels'">great-grandfather</xsl:if>
<xsl:if test="$parTaal = 'frans'">arrière-grand-père</xsl:if>
<xsl:if test="$parTaal = 'duits'">Urgroßvater</xsl:if>
<xsl:if test="$parTaal = 'fries'">oerpake </xsl:if>
<xsl:if test="$parTaal = 'noors'">oldefar</xsl:if>
<xsl:if test="$parTaal = 'spaans'">bisabuelo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">bisnonno</xsl:if>
<xsl:if test="$parTaal = 'portugees'">bisavô</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Overleden">
<xsl:if test="$parTaal = 'nederlands'">Overleden</xsl:if>
<xsl:if test="$parTaal = 'engels'">Deceased</xsl:if>
<xsl:if test="$parTaal = 'frans'">Décédé</xsl:if>
<xsl:if test="$parTaal = 'duits'">Gestorbene</xsl:if>
<xsl:if test="$parTaal = 'fries'">Ferstoan</xsl:if>
<xsl:if test="$parTaal = 'noors'">Død</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Fallecido</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Defunto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Falecido</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_overleden">
<xsl:if test="$parTaal = 'nederlands'">overleden</xsl:if>
<xsl:if test="$parTaal = 'engels'">deceased</xsl:if>
<xsl:if test="$parTaal = 'frans'">décédé</xsl:if>
<xsl:if test="$parTaal = 'duits'">gestorbene</xsl:if>
<xsl:if test="$parTaal = 'fries'">ferstoan</xsl:if>
<xsl:if test="$parTaal = 'noors'">død</xsl:if>
<xsl:if test="$parTaal = 'spaans'">fallecido</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">defunto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">falecido</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Overledenmv">
<xsl:if test="$parTaal = 'nederlands'">Overleden</xsl:if>
<xsl:if test="$parTaal = 'engels'">Deceased</xsl:if>
<xsl:if test="$parTaal = 'frans'">Décédé</xsl:if>
<xsl:if test="$parTaal = 'duits'">Gestorbene</xsl:if>
<xsl:if test="$parTaal = 'fries'">Ferstoan</xsl:if>
<xsl:if test="$parTaal = 'noors'">Død</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Fallecido</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Defunto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Falecido</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_overledenen_m">
<xsl:if test="$parTaal = 'nederlands'">overleden</xsl:if>
<xsl:if test="$parTaal = 'engels'">deceased</xsl:if>
<xsl:if test="$parTaal = 'frans'">décédé</xsl:if>
<xsl:if test="$parTaal = 'duits'">gestorbene</xsl:if>
<xsl:if test="$parTaal = 'fries'">ferstoan</xsl:if>
<xsl:if test="$parTaal = 'noors'">død</xsl:if>
<xsl:if test="$parTaal = 'spaans'">fallecido</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">defunto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">falecido</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_overledenen_v">
<xsl:if test="$parTaal = 'nederlands'">overleden</xsl:if>
<xsl:if test="$parTaal = 'engels'">deceased</xsl:if>
<xsl:if test="$parTaal = 'frans'">décédée</xsl:if>
<xsl:if test="$parTaal = 'duits'">gestorbene</xsl:if>
<xsl:if test="$parTaal = 'fries'">ferstoan</xsl:if>
<xsl:if test="$parTaal = 'noors'">død</xsl:if>
<xsl:if test="$parTaal = 'spaans'">fallecido</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">defunto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">falecido</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_overledenman">
<xsl:if test="$parTaal = 'nederlands'">overleden man</xsl:if>
<xsl:if test="$parTaal = 'engels'">deceased man</xsl:if>
<xsl:if test="$parTaal = 'frans'">homme décédé</xsl:if>
<xsl:if test="$parTaal = 'duits'">gestorbene Männ</xsl:if>
<xsl:if test="$parTaal = 'fries'">ferstoan manlju</xsl:if>
<xsl:if test="$parTaal = 'noors'">død mann</xsl:if>
<xsl:if test="$parTaal = 'spaans'">fallecido</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">defunto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">falecido</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_overledenmannen">
<xsl:if test="$parTaal = 'nederlands'">overleden mannen</xsl:if>
<xsl:if test="$parTaal = 'engels'">deceased men</xsl:if>
<xsl:if test="$parTaal = 'frans'">hommes décédés</xsl:if>
<xsl:if test="$parTaal = 'duits'">gestorbene Männer</xsl:if>
<xsl:if test="$parTaal = 'fries'">ferstoan manlju</xsl:if>
<xsl:if test="$parTaal = 'noors'">død manner</xsl:if>
<xsl:if test="$parTaal = 'spaans'">fallecido</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">defunto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">falicido</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_overledenpersoon">
<xsl:if test="$parTaal = 'nederlands'">overleden persoon</xsl:if>
<xsl:if test="$parTaal = 'engels'">deceased person</xsl:if>
<xsl:if test="$parTaal = 'frans'">personne décédé</xsl:if>
<xsl:if test="$parTaal = 'duits'">gestorbene Person</xsl:if>
<xsl:if test="$parTaal = 'fries'">ferstoan persoan</xsl:if>
<xsl:if test="$parTaal = 'noors'">død person</xsl:if>
<xsl:if test="$parTaal = 'spaans'">fallecida</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">defunte</xsl:if>
<xsl:if test="$parTaal = 'portugees'">falicida</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_overledenpersonen">
<xsl:if test="$parTaal = 'nederlands'">overleden personen</xsl:if>
<xsl:if test="$parTaal = 'engels'">deceased persons</xsl:if>
<xsl:if test="$parTaal = 'frans'">personnes décédées</xsl:if>
<xsl:if test="$parTaal = 'duits'">gestorbene Personen</xsl:if>
<xsl:if test="$parTaal = 'fries'">ferstoan persoanen</xsl:if>
<xsl:if test="$parTaal = 'noors'">død personer</xsl:if>
<xsl:if test="$parTaal = 'spaans'">fallecidas</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">defunti</xsl:if>
<xsl:if test="$parTaal = 'portugees'">falicidas</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_overledenvrouw">
<xsl:if test="$parTaal = 'nederlands'">overleden vrouw</xsl:if>
<xsl:if test="$parTaal = 'engels'">deceased woman</xsl:if>
<xsl:if test="$parTaal = 'frans'">femme décédée</xsl:if>
<xsl:if test="$parTaal = 'duits'">gestorbene Frau</xsl:if>
<xsl:if test="$parTaal = 'fries'">ferstoan frou</xsl:if>
<xsl:if test="$parTaal = 'noors'">død kvinn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">fallecida</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">defunta</xsl:if>
<xsl:if test="$parTaal = 'portugees'">falecida</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_overledenvrouwen">
<xsl:if test="$parTaal = 'nederlands'">overleden vrouwen</xsl:if>
<xsl:if test="$parTaal = 'engels'">deceased women</xsl:if>
<xsl:if test="$parTaal = 'frans'">femmes décédées</xsl:if>
<xsl:if test="$parTaal = 'duits'">gestorbene Frauen</xsl:if>
<xsl:if test="$parTaal = 'fries'">ferstoan froulju</xsl:if>
<xsl:if test="$parTaal = 'noors'">død kvinner</xsl:if>
<xsl:if test="$parTaal = 'spaans'">fallecida</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">defunta</xsl:if>
<xsl:if test="$parTaal = 'portugees'">falecida</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Overlijden">
<xsl:if test="$parTaal = 'nederlands'">Overlijden</xsl:if>
<xsl:if test="$parTaal = 'engels'">Death</xsl:if>
<xsl:if test="$parTaal = 'frans'">Décès</xsl:if>
<xsl:if test="$parTaal = 'duits'">Versterben</xsl:if>
<xsl:if test="$parTaal = 'fries'">Ferstoarn</xsl:if>
<xsl:if test="$parTaal = 'noors'">Død</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Muerte</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Morte</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Morte</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_overlijden">
<xsl:if test="$parTaal = 'nederlands'">overlijden</xsl:if>
<xsl:if test="$parTaal = 'engels'">death</xsl:if>
<xsl:if test="$parTaal = 'frans'">décès</xsl:if>
<xsl:if test="$parTaal = 'duits'">Versterben</xsl:if>
<xsl:if test="$parTaal = 'fries'">ferstoarn</xsl:if>
<xsl:if test="$parTaal = 'noors'">død</xsl:if>
<xsl:if test="$parTaal = 'spaans'">muerte</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">morte</xsl:if>
<xsl:if test="$parTaal = 'portugees'">morte</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Overlijdenaangifte">
<xsl:if test="$parTaal = 'nederlands'">Van het overlijden is aangifte gedaan </xsl:if>
<xsl:if test="$parTaal = 'engels'">The death was registered </xsl:if>
<xsl:if test="$parTaal = 'frans'">Le décès a été déclaré </xsl:if>
<xsl:if test="$parTaal = 'duits'">Das Versterben wurde angezeigt </xsl:if>
<xsl:if test="$parTaal = 'fries'">Fan it ferstjerren is oanjefte dien </xsl:if>
<xsl:if test="$parTaal = 'noors'">Melte ble registrert </xsl:if>
<xsl:if test="$parTaal = 'spaans'">La muerte se registró</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">La morte è stata registrata</xsl:if>
<xsl:if test="$parTaal = 'portugees'">A morte foi registrada</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Overlijdensdatum">
<xsl:if test="$parTaal = 'nederlands'">Overlijdensdatum</xsl:if>
<xsl:if test="$parTaal = 'engels'">Date of death</xsl:if>
<xsl:if test="$parTaal = 'frans'">Date de décès</xsl:if>
<xsl:if test="$parTaal = 'duits'">Versterbensdatum</xsl:if>
<xsl:if test="$parTaal = 'fries'">Ferstoarndatum</xsl:if>
<xsl:if test="$parTaal = 'noors'">Avdød</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Fecha del muerte</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Data di morte</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Data do morte</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Overlijdensplaats">
<xsl:if test="$parTaal = 'nederlands'">Overlijdensplaats</xsl:if>
<xsl:if test="$parTaal = 'engels'">Place of death</xsl:if>
<xsl:if test="$parTaal = 'frans'">Lieu de décès</xsl:if>
<xsl:if test="$parTaal = 'duits'">Versterbensort</xsl:if>
<xsl:if test="$parTaal = 'fries'">Ferstjerreplak</xsl:if>
<xsl:if test="$parTaal = 'noors'">Dødssted</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Lugar de la muerte</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Luogo di morte</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Lugar da morte</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_overlijdensplaats">
<xsl:if test="$parTaal = 'nederlands'">overlijdensplaats</xsl:if>
<xsl:if test="$parTaal = 'engels'">place of death</xsl:if>
<xsl:if test="$parTaal = 'frans'">lieu de décès</xsl:if>
<xsl:if test="$parTaal = 'duits'">Versterbensort</xsl:if>
<xsl:if test="$parTaal = 'fries'">ferstjerreplak</xsl:if>
<xsl:if test="$parTaal = 'noors'">dødssted</xsl:if>
<xsl:if test="$parTaal = 'spaans'">lugar de la muerte</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">luogo di morte</xsl:if>
<xsl:if test="$parTaal = 'portugees'">lugar da morte</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Overlijdensplaatsen">
<xsl:if test="$parTaal = 'nederlands'">Overlijdensplaatsen</xsl:if>
<xsl:if test="$parTaal = 'engels'">Places of death</xsl:if>
<xsl:if test="$parTaal = 'frans'">Lieux de décès</xsl:if>
<xsl:if test="$parTaal = 'duits'">Versterbensorte</xsl:if>
<xsl:if test="$parTaal = 'fries'">ferstjerreplakken</xsl:if>
<xsl:if test="$parTaal = 'noors'">Dødssted</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Lugares de la muerte</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Luoghi di morte</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Lugares da morte</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_overlijdensplaatsen">
<xsl:if test="$parTaal = 'nederlands'">overlijdensplaatsen</xsl:if>
<xsl:if test="$parTaal = 'engels'">places of death</xsl:if>
<xsl:if test="$parTaal = 'frans'">lieux de décès</xsl:if>
<xsl:if test="$parTaal = 'duits'">Versterbensorte</xsl:if>
<xsl:if test="$parTaal = 'fries'">ferstjerreplakken</xsl:if>
<xsl:if test="$parTaal = 'noors'">dødssted</xsl:if>
<xsl:if test="$parTaal = 'spaans'">lugares de la muerte</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">luoghi di morte</xsl:if>
<xsl:if test="$parTaal = 'portugees'">lugares da morte</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Overzicht">
<xsl:if test="$parTaal = 'nederlands'">Overzicht</xsl:if>
<xsl:if test="$parTaal = 'engels'">Reports</xsl:if>
<xsl:if test="$parTaal = 'frans'">Résumé</xsl:if>
<xsl:if test="$parTaal = 'duits'">Übersicht</xsl:if>
<xsl:if test="$parTaal = 'fries'">Oersicht</xsl:if>
<xsl:if test="$parTaal = 'noors'">Oversikt</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Resumen</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Sommario</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Resumo</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_overzicht">
<xsl:if test="$parTaal = 'nederlands'">overzicht</xsl:if>
<xsl:if test="$parTaal = 'engels'">report</xsl:if>
<xsl:if test="$parTaal = 'frans'">résumé</xsl:if>
<xsl:if test="$parTaal = 'duits'">Übersicht</xsl:if>
<xsl:if test="$parTaal = 'fries'">oersicht</xsl:if>
<xsl:if test="$parTaal = 'noors'">oversikt</xsl:if>
<xsl:if test="$parTaal = 'spaans'">resumen</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">sommario</xsl:if>
<xsl:if test="$parTaal = 'portugees'">resumo</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Overzichten">
<xsl:if test="$parTaal = 'nederlands'">Overzichten</xsl:if>
<xsl:if test="$parTaal = 'engels'">Reports</xsl:if>
<xsl:if test="$parTaal = 'frans'">Résumés</xsl:if>
<xsl:if test="$parTaal = 'duits'">Übersichten</xsl:if>
<xsl:if test="$parTaal = 'fries'">Oersichten</xsl:if>
<xsl:if test="$parTaal = 'noors'">Oversikter</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Resúmenes</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Sommari</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Resumoes</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_overzichten">
<xsl:if test="$parTaal = 'nederlands'">overzichten</xsl:if>
<xsl:if test="$parTaal = 'engels'">reports</xsl:if>
<xsl:if test="$parTaal = 'frans'">résumés</xsl:if>
<xsl:if test="$parTaal = 'duits'">Übersichte</xsl:if>
<xsl:if test="$parTaal = 'fries'">oersichten</xsl:if>
<xsl:if test="$parTaal = 'noors'">oversikter</xsl:if>
<xsl:if test="$parTaal = 'spaans'">resúmenes</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">sommari</xsl:if>
<xsl:if test="$parTaal = 'portugees'">resumoes</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_OverzichtGebeurtenissen">
<xsl:if test="$parTaal = 'nederlands'">Overzicht op datum van alle gebeurtenissen in deze stamboom</xsl:if>
<xsl:if test="$parTaal = 'engels'">Report by date of all events in this family tree</xsl:if>
<xsl:if test="$parTaal = 'frans'">Résumé par date de toutes les événements en cet arbre généalogique</xsl:if>
<xsl:if test="$parTaal = 'duits'">Liste auf Datum aller Veranstaltungen in dieser Stammbaum</xsl:if>
<xsl:if test="$parTaal = 'fries'">Oersicht op datum fan alle foarfallen yn dizze stamboam</xsl:if>
<xsl:if test="$parTaal = 'noors'">Oversikt på dato over alle hendelser i dette slektstre</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Resumen en la fecha de todos los eventos en este genealogía</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Sommario sulla data di tutti gli eventi in questo genealogico</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Resumo sobre a data de todos os eventos neste genealógica</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_OverzichtGebeurtenissenVandaag">
<xsl:if test="$parTaal = 'nederlands'">Overzicht van alle gebeurtenissen van vandaag in deze stamboom</xsl:if>
<xsl:if test="$parTaal = 'engels'">Report of all today's events in this family tree</xsl:if>
<xsl:if test="$parTaal = 'frans'">Résumé des toutes les événements d'aujourd'hui en cet arbre généalogique</xsl:if>
<xsl:if test="$parTaal = 'duits'">Liste aller heutige Veranstaltungen in dieser Stammbaum</xsl:if>
<xsl:if test="$parTaal = 'fries'">Oersicht fan alle foarfallen fan hjoed yn dizze stamboam</xsl:if>
<xsl:if test="$parTaal = 'noors'">Oversikt over dagens hendelser i dette slektstre</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Resumen de todos los acontecimientos de hoy en este genealogía</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Sommario di tutti gli eventi di oggi in questo genealogico</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Resumo de todos os eventos de hoje neste genealógica</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Parenteel">
<xsl:if test="$parTaal = 'nederlands'">Parenteel</xsl:if>
<xsl:if test="$parTaal = 'engels'">Descendancy</xsl:if>
<xsl:if test="$parTaal = 'frans'">Descendance</xsl:if>
<xsl:if test="$parTaal = 'duits'">Nachkommen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Neiteam</xsl:if>
<xsl:if test="$parTaal = 'noors'">Avkom</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Descendientes</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Discendenti</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Descendentes</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_parenteel">
<xsl:if test="$parTaal = 'nederlands'">parenteel</xsl:if>
<xsl:if test="$parTaal = 'engels'">descendants</xsl:if>
<xsl:if test="$parTaal = 'frans'">descendants</xsl:if>
<xsl:if test="$parTaal = 'duits'">Nachkommen</xsl:if>
<xsl:if test="$parTaal = 'fries'">neiteam</xsl:if>
<xsl:if test="$parTaal = 'noors'">avkom</xsl:if>
<xsl:if test="$parTaal = 'spaans'">descendientes</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">discendenti</xsl:if>
<xsl:if test="$parTaal = 'portugees'">descendentes</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_per">
<xsl:if test="$parTaal = 'nederlands'">per</xsl:if>
<xsl:if test="$parTaal = 'engels'">per</xsl:if>
<xsl:if test="$parTaal = 'frans'">par</xsl:if>
<xsl:if test="$parTaal = 'duits'">pro</xsl:if>
<xsl:if test="$parTaal = 'fries'">per</xsl:if>
<xsl:if test="$parTaal = 'noors'">per</xsl:if>
<xsl:if test="$parTaal = 'spaans'">por</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">per</xsl:if>
<xsl:if test="$parTaal = 'portugees'">por</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_perby">
<xsl:if test="$parTaal = 'nederlands'">per</xsl:if>
<xsl:if test="$parTaal = 'engels'">by</xsl:if>
<xsl:if test="$parTaal = 'frans'">par</xsl:if>
<xsl:if test="$parTaal = 'duits'">pro</xsl:if>
<xsl:if test="$parTaal = 'fries'">per</xsl:if>
<xsl:if test="$parTaal = 'noors'">per</xsl:if>
<xsl:if test="$parTaal = 'spaans'">por</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">per</xsl:if>
<xsl:if test="$parTaal = 'portugees'">por</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Periode">
<xsl:if test="$parTaal = 'nederlands'">Periode</xsl:if>
<xsl:if test="$parTaal = 'engels'">Period</xsl:if>
<xsl:if test="$parTaal = 'frans'">Période</xsl:if>
<xsl:if test="$parTaal = 'duits'">Periode</xsl:if>
<xsl:if test="$parTaal = 'fries'">Perioade</xsl:if>
<xsl:if test="$parTaal = 'noors'">Periode</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Período</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Periodo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Período</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Personen">
<xsl:if test="$parTaal = 'nederlands'">Personen</xsl:if>
<xsl:if test="$parTaal = 'engels'">Persons</xsl:if>
<xsl:if test="$parTaal = 'frans'">Personnes</xsl:if>
<xsl:if test="$parTaal = 'duits'">Personen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Persoanen</xsl:if>
<xsl:if test="$parTaal = 'noors'">Personer</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Personas</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Persone</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Pessoas</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_personen">
<xsl:if test="$parTaal = 'nederlands'">personen</xsl:if>
<xsl:if test="$parTaal = 'engels'">persons</xsl:if>
<xsl:if test="$parTaal = 'frans'">personnes</xsl:if>
<xsl:if test="$parTaal = 'duits'">Personen</xsl:if>
<xsl:if test="$parTaal = 'fries'">persoanen</xsl:if>
<xsl:if test="$parTaal = 'noors'">personer</xsl:if>
<xsl:if test="$parTaal = 'spaans'">personas</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">persone</xsl:if>
<xsl:if test="$parTaal = 'portugees'">pessoas</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_persoon">
<xsl:if test="$parTaal = 'nederlands'">persoon</xsl:if>
<xsl:if test="$parTaal = 'engels'">person</xsl:if>
<xsl:if test="$parTaal = 'frans'">personne</xsl:if>
<xsl:if test="$parTaal = 'duits'">Person</xsl:if>
<xsl:if test="$parTaal = 'fries'">persoan</xsl:if>
<xsl:if test="$parTaal = 'noors'">person</xsl:if>
<xsl:if test="$parTaal = 'spaans'">persona</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">persona</xsl:if>
<xsl:if test="$parTaal = 'portugees'">pessoa</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Persoonskaart">
<xsl:if test="$parTaal = 'nederlands'">Persoonskaart</xsl:if>
<xsl:if test="$parTaal = 'engels'">Personal sheet</xsl:if>
<xsl:if test="$parTaal = 'frans'">Fiche personne</xsl:if>
<xsl:if test="$parTaal = 'duits'">Personenkarte</xsl:if>
<xsl:if test="$parTaal = 'fries'">Persoanskaart</xsl:if>
<xsl:if test="$parTaal = 'noors'">Personkortet</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Tarjeta persona</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Scheda persona</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Cartão pessoa</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_persoonskaart">
<xsl:if test="$parTaal = 'nederlands'">persoonskaart</xsl:if>
<xsl:if test="$parTaal = 'engels'">personal sheet</xsl:if>
<xsl:if test="$parTaal = 'frans'">fiche individuelle</xsl:if>
<xsl:if test="$parTaal = 'duits'">Personenkarte</xsl:if>
<xsl:if test="$parTaal = 'fries'">persoanskaart</xsl:if>
<xsl:if test="$parTaal = 'noors'">personkortet</xsl:if>
<xsl:if test="$parTaal = 'spaans'">tarjeta persona</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">scheda persona</xsl:if>
<xsl:if test="$parTaal = 'portugees'">cartão de pessoa</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Plaatskaarten">
<xsl:if test="$parTaal = 'nederlands'">Plaatskaarten</xsl:if>
<xsl:if test="$parTaal = 'engels'">Maps</xsl:if>
<xsl:if test="$parTaal = 'frans'">Cartes</xsl:if>
<xsl:if test="$parTaal = 'duits'">Karten</xsl:if>
<xsl:if test="$parTaal = 'fries'">Plakkaarten</xsl:if>
<xsl:if test="$parTaal = 'noors'">Stedskart</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Mapas</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Mappe</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Mapas</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_PlaatskaartenTitel">
<xsl:if test="$parTaal = 'nederlands'">Klik op een ballon in de kaart of op het pijltje in de kolom Kaart voor meer informatie</xsl:if>
<xsl:if test="$parTaal = 'engels'">Click on a marker in the map or on the arrow in the column Map for more information</xsl:if>
<xsl:if test="$parTaal = 'frans'">Cliquez un marqueur sur la carte ou le fléchette en la colonne Carte pour obtenir information supplétoire</xsl:if>
<xsl:if test="$parTaal = 'duits'">Drücken Sie eine Markierung auf die Karte oder das Bolzen in die Kolumne Karte zum Zusatzinformation</xsl:if>
<xsl:if test="$parTaal = 'fries'">Klik op in ballon yn de kaart of op it pijltje yn de kolom Kaart foar mear ynformaasje</xsl:if>
<xsl:if test="$parTaal = 'noors'">Klikk på en ballong i kartet eller på pilen i kart kolonnen for detaljer</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Haga clic en un globo en el mapa o en la flecha en el mapa de columnas para los detalles</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Clicca su una mongolfiera in mappa o sulla freccia nella mappa colonna per i dettagli</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Clique em um balão no mapa ou na seta no mapa de coluna para obter detalhes</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Pleeg">
<xsl:if test="$parTaal = 'nederlands'">Pleeg</xsl:if>
<xsl:if test="$parTaal = 'engels'">Foster</xsl:if>
<xsl:if test="$parTaal = 'frans'">Recueilli</xsl:if>
<xsl:if test="$parTaal = 'duits'">Aufgenommenes</xsl:if>
<xsl:if test="$parTaal = 'fries'">Pleech</xsl:if>
<xsl:if test="$parTaal = 'noors'">Pleie</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Adoptivo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Adottivo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Adotivo</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Predikaat">
<xsl:if test="$parTaal = 'nederlands'">Predikaat</xsl:if>
<xsl:if test="$parTaal = 'engels'">Predicate</xsl:if>
<xsl:if test="$parTaal = 'frans'">Prédicat</xsl:if>
<xsl:if test="$parTaal = 'duits'">Prädikat</xsl:if>
<xsl:if test="$parTaal = 'fries'">Predikaat</xsl:if>
<xsl:if test="$parTaal = 'noors'">Ærestittel</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Predicado</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Predicato</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Predicado</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Predikaten">
<xsl:if test="$parTaal = 'nederlands'">Predikaten</xsl:if>
<xsl:if test="$parTaal = 'engels'">Predicates</xsl:if>
<xsl:if test="$parTaal = 'frans'">Prédicats</xsl:if>
<xsl:if test="$parTaal = 'duits'">Predikaten</xsl:if>
<xsl:if test="$parTaal = 'fries'">Predikaten</xsl:if>
<xsl:if test="$parTaal = 'noors'">Ærestitteler</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Predicados</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Predicati</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Predicados</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Printversie">
<xsl:if test="$parTaal = 'nederlands'">Printversie</xsl:if>
<xsl:if test="$parTaal = 'engels'">Printing version</xsl:if>
<xsl:if test="$parTaal = 'frans'">Version pour imprimer</xsl:if>
<xsl:if test="$parTaal = 'duits'">Abdruck Version</xsl:if>
<xsl:if test="$parTaal = 'fries'">Printversie</xsl:if>
<xsl:if test="$parTaal = 'noors'">Print versjon</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Versión para imprimir</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Versione stampabile</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Versão para impressão</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Rechthoek">
<xsl:if test="$parTaal = 'nederlands'">Rechthoek</xsl:if>
<xsl:if test="$parTaal = 'engels'">Rectangle</xsl:if>
<xsl:if test="$parTaal = 'frans'">Rectangle</xsl:if>
<xsl:if test="$parTaal = 'duits'">Rechteck</xsl:if>
<xsl:if test="$parTaal = 'fries'">Rechthoek</xsl:if>
<xsl:if test="$parTaal = 'noors'">Rektangel</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Rectángulo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Rettangolo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Retângulo</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Relatie">
<xsl:if test="$parTaal = 'nederlands'">Relatie</xsl:if>
<xsl:if test="$parTaal = 'engels'">Relationship</xsl:if>
<xsl:if test="$parTaal = 'frans'">Relation</xsl:if>
<xsl:if test="$parTaal = 'duits'">Beziehung</xsl:if>
<xsl:if test="$parTaal = 'fries'">Relaasje</xsl:if>
<xsl:if test="$parTaal = 'noors'">Relasjon</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Relación</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Relazione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Relação</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_relatie">
<xsl:if test="$parTaal = 'nederlands'">relatie</xsl:if>
<xsl:if test="$parTaal = 'engels'">relationship</xsl:if>
<xsl:if test="$parTaal = 'frans'">relation</xsl:if>
<xsl:if test="$parTaal = 'duits'">Verhältniss</xsl:if>
<xsl:if test="$parTaal = 'fries'">relaasje</xsl:if>
<xsl:if test="$parTaal = 'noors'">relasjon</xsl:if>
<xsl:if test="$parTaal = 'spaans'">relación</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">relazione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">relação</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Relatiedatum">
<xsl:if test="$parTaal = 'nederlands'">Relatiedatum</xsl:if>
<xsl:if test="$parTaal = 'engels'">Relation date</xsl:if>
<xsl:if test="$parTaal = 'frans'">Date de relation</xsl:if>
<xsl:if test="$parTaal = 'duits'">Beziehungsdatum</xsl:if>
<xsl:if test="$parTaal = 'fries'">Relaasjedatum</xsl:if>
<xsl:if test="$parTaal = 'noors'">Relasjonsdato</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Fecha de la relación</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Data di relazione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Data de relação</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Relatieplaats">
<xsl:if test="$parTaal = 'nederlands'">Relatieplaats</xsl:if>
<xsl:if test="$parTaal = 'engels'">Place of relation</xsl:if>
<xsl:if test="$parTaal = 'frans'">Lieu de relations</xsl:if>
<xsl:if test="$parTaal = 'duits'">Beziehungsort</xsl:if>
<xsl:if test="$parTaal = 'fries'">Relaasjeplak</xsl:if>
<xsl:if test="$parTaal = 'noors'">Relasjonssted</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Lugare de relación</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Luogho di relazione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Lugare de relação</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_relatieplaats">
<xsl:if test="$parTaal = 'nederlands'">relatieplaats</xsl:if>
<xsl:if test="$parTaal = 'engels'">place of relation</xsl:if>
<xsl:if test="$parTaal = 'frans'">lieu de relations</xsl:if>
<xsl:if test="$parTaal = 'duits'">Beziehungsort</xsl:if>
<xsl:if test="$parTaal = 'fries'">relaasjeplak</xsl:if>
<xsl:if test="$parTaal = 'noors'">relasjonssted</xsl:if>
<xsl:if test="$parTaal = 'spaans'">lugare de relación</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">luogho di relazione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">lugare de relação</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Relatieplaatsen">
<xsl:if test="$parTaal = 'nederlands'">Relatieplaatsen</xsl:if>
<xsl:if test="$parTaal = 'engels'">Places of relation</xsl:if>
<xsl:if test="$parTaal = 'frans'">Lieux de relations</xsl:if>
<xsl:if test="$parTaal = 'duits'">Beziehungsorte</xsl:if>
<xsl:if test="$parTaal = 'fries'">Relaasjeplakken</xsl:if>
<xsl:if test="$parTaal = 'noors'">Relasjonssted</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Lugares de relación</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Luoghi di relazione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Lugares de relação</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_relatieplaatsen">
<xsl:if test="$parTaal = 'nederlands'">relatieplaatsen</xsl:if>
<xsl:if test="$parTaal = 'engels'">places of relation</xsl:if>
<xsl:if test="$parTaal = 'frans'">lieux de relations</xsl:if>
<xsl:if test="$parTaal = 'duits'">Beziehungsorte</xsl:if>
<xsl:if test="$parTaal = 'fries'">relaasjeplakken</xsl:if>
<xsl:if test="$parTaal = 'noors'">relasjonssted</xsl:if>
<xsl:if test="$parTaal = 'spaans'">lugares de relación</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">luoghi di relazione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">lugares de relação</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_relaties">
<xsl:if test="$parTaal = 'nederlands'">relaties</xsl:if>
<xsl:if test="$parTaal = 'engels'">relationships</xsl:if>
<xsl:if test="$parTaal = 'frans'">relations</xsl:if>
<xsl:if test="$parTaal = 'duits'">Verhältnisse</xsl:if>
<xsl:if test="$parTaal = 'fries'">relaasjes</xsl:if>
<xsl:if test="$parTaal = 'noors'">relasjoner</xsl:if>
<xsl:if test="$parTaal = 'spaans'">relaciones</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">relazioni</xsl:if>
<xsl:if test="$parTaal = 'portugees'">relações</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Religie">
<xsl:if test="$parTaal = 'nederlands'">Religie</xsl:if>
<xsl:if test="$parTaal = 'engels'">Religion</xsl:if>
<xsl:if test="$parTaal = 'frans'">Confession</xsl:if>
<xsl:if test="$parTaal = 'duits'">Religion</xsl:if>
<xsl:if test="$parTaal = 'fries'">Religy</xsl:if>
<xsl:if test="$parTaal = 'noors'">Religion</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Religión</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Religione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Religião</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Religies">
<xsl:if test="$parTaal = 'nederlands'">Religies</xsl:if>
<xsl:if test="$parTaal = 'engels'">Religions</xsl:if>
<xsl:if test="$parTaal = 'frans'">Réligions</xsl:if>
<xsl:if test="$parTaal = 'duits'">Religionen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Religies</xsl:if>
<xsl:if test="$parTaal = 'noors'">Religioner</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Religióne</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Religioni</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Religiãos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Roepnaam">
<xsl:if test="$parTaal = 'nederlands'">Roepnaam</xsl:if>
<xsl:if test="$parTaal = 'engels'">Nickname</xsl:if>
<xsl:if test="$parTaal = 'frans'">Petit nom</xsl:if>
<xsl:if test="$parTaal = 'duits'">Rufname</xsl:if>
<xsl:if test="$parTaal = 'fries'">Ropnamme</xsl:if>
<xsl:if test="$parTaal = 'noors'">Kallenavn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Apodo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Soprannome</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Apelido</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_roepnaam">
<xsl:if test="$parTaal = 'nederlands'">roepnaam</xsl:if>
<xsl:if test="$parTaal = 'engels'">nickname</xsl:if>
<xsl:if test="$parTaal = 'frans'">surnom</xsl:if>
<xsl:if test="$parTaal = 'duits'">Rufname</xsl:if>
<xsl:if test="$parTaal = 'fries'">ropnamme</xsl:if>
<xsl:if test="$parTaal = 'noors'">kallenavn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">apodo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">soprannome</xsl:if>
<xsl:if test="$parTaal = 'portugees'">apelido</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_roepnamen">
<xsl:if test="$parTaal = 'nederlands'">roepnamen</xsl:if>
<xsl:if test="$parTaal = 'engels'">nicknames</xsl:if>
<xsl:if test="$parTaal = 'frans'">petit noms</xsl:if>
<xsl:if test="$parTaal = 'duits'">Rufnamen</xsl:if>
<xsl:if test="$parTaal = 'fries'">ropnammen</xsl:if>
<xsl:if test="$parTaal = 'noors'">kallenavn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">apodos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">soprannomi</xsl:if>
<xsl:if test="$parTaal = 'portugees'">apelidos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Samenleven">
<xsl:if test="$parTaal = 'nederlands'">Samenleven</xsl:if>
<xsl:if test="$parTaal = 'engels'">Living together</xsl:if>
<xsl:if test="$parTaal = 'frans'">Cohabitation</xsl:if>
<xsl:if test="$parTaal = 'duits'">Zusammenleben</xsl:if>
<xsl:if test="$parTaal = 'fries'">gearlibje</xsl:if>
<xsl:if test="$parTaal = 'noors'">Samboerskap</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Vivir juntos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Convivere</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Conviver</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_samenlevingscontract_getekend">
<xsl:if test="$parTaal = 'nederlands'">Een samenlevingscontract werd getekend</xsl:if>
<xsl:if test="$parTaal = 'engels'">A living together contract was signed</xsl:if>
<xsl:if test="$parTaal = 'frans'">Un contract de cohabitation légale etais signé</xsl:if>
<xsl:if test="$parTaal = 'duits'">Ein Kontrakt zum Zusammenleben wurde signiert</xsl:if>
<xsl:if test="$parTaal = 'fries'">In samenlevingscontract waard tekene  </xsl:if>
<xsl:if test="$parTaal = 'noors'">En samboeravtale ble undertegnet</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Se firmó un acuerdo de cohabitación</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">È stato firmato un contratto di convivenza</xsl:if>
<xsl:if test="$parTaal = 'portugees'">A coabitação acordo foi assinado</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_secondes">
<xsl:if test="$parTaal = 'nederlands'">secondes</xsl:if>
<xsl:if test="$parTaal = 'engels'">seconds</xsl:if>
<xsl:if test="$parTaal = 'frans'">secondes</xsl:if>
<xsl:if test="$parTaal = 'duits'">Sekunden</xsl:if>
<xsl:if test="$parTaal = 'fries'">sekondus</xsl:if>
<xsl:if test="$parTaal = 'noors'">sekunder</xsl:if>
<xsl:if test="$parTaal = 'spaans'">segundos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">secondi</xsl:if>
<xsl:if test="$parTaal = 'portugees'">segundos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Sierstamboom">
<xsl:if test="$parTaal = 'nederlands'">Sierstamboom</xsl:if>
<xsl:if test="$parTaal = 'engels'">Decorated genealogy</xsl:if>
<xsl:if test="$parTaal = 'frans'">Arbre généalogique décoré</xsl:if>
<xsl:if test="$parTaal = 'duits'">dekorierte Stammbaum</xsl:if>
<xsl:if test="$parTaal = 'fries'">Sierstambeam</xsl:if>
<xsl:if test="$parTaal = 'noors'">Prydslektstre</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Genealogía decorado</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Genealogia decorato</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Genealogia decorado</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_sierstamboom">
<xsl:if test="$parTaal = 'nederlands'">sierstamboom</xsl:if>
<xsl:if test="$parTaal = 'engels'">decorated genealogy</xsl:if>
<xsl:if test="$parTaal = 'frans'">arbre généalogique décoré</xsl:if>
<xsl:if test="$parTaal = 'duits'">dekorierte Stammbaum</xsl:if>
<xsl:if test="$parTaal = 'fries'">sierstambeam</xsl:if>
<xsl:if test="$parTaal = 'noors'">prydslektstre</xsl:if>
<xsl:if test="$parTaal = 'spaans'">genealogía decorado</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">genealogia decorato</xsl:if>
<xsl:if test="$parTaal = 'portugees'">genealogia decorado</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_hogeresolutie">
<xsl:if test="$parTaal = 'nederlands'">of ga naar de hoge-resolutie <xsl:value-of select="$Txt_sierstamboom"/> met </xsl:if>
<xsl:if test="$parTaal = 'engels'">or go to the high-resolution <xsl:value-of select="$Txt_sierstamboom"/> with </xsl:if>
<xsl:if test="$parTaal = 'frans'">ou allez vers l'<xsl:value-of select="$Txt_sierstamboom"/> d'haute resolution contenant </xsl:if>
<xsl:if test="$parTaal = 'duits'">oder gehe zum <xsl:value-of select="$Txt_sierstamboom"/> mit hohen Auflösungsgrad mit </xsl:if>
<xsl:if test="$parTaal = 'fries'">of gean nei de hoge-resolutie sierstambeam mei </xsl:if>
<xsl:if test="$parTaal = 'noors'">eller gå til den høyoppløselige prydslektstre med </xsl:if>
<xsl:if test="$parTaal = 'spaans'">o ir al genealogía decorado de alta resolución con </xsl:if>
<xsl:if test="$parTaal = 'italiaans'">o andare al genealogia decorato ad alta risoluzione con </xsl:if>
<xsl:if test="$parTaal = 'portugees'">ou ir para a genealogia decorado de alta resolução com </xsl:if>
</xsl:variable>
<xsl:variable name="Txt_stamboom">
<xsl:if test="$parTaal = 'nederlands'">stamboom</xsl:if>
<xsl:if test="$parTaal = 'engels'">genealogy</xsl:if>
<xsl:if test="$parTaal = 'frans'">arbre généalogique</xsl:if>
<xsl:if test="$parTaal = 'duits'">Stammbaum</xsl:if>
<xsl:if test="$parTaal = 'fries'">stambeam</xsl:if>
<xsl:if test="$parTaal = 'noors'">prydslektstre</xsl:if>
<xsl:if test="$parTaal = 'spaans'">genealogía</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">genealogia</xsl:if>
<xsl:if test="$parTaal = 'portugees'">genealogia</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Stamreeks">
<xsl:if test="$parTaal = 'nederlands'">Stamreeks</xsl:if>
<xsl:if test="$parTaal = 'engels'">Patrilineal ancestors</xsl:if>
<xsl:if test="$parTaal = 'frans'">Ancetres patrilineaires</xsl:if>
<xsl:if test="$parTaal = 'duits'">Stammlinie</xsl:if>
<xsl:if test="$parTaal = 'fries'">Stamrist</xsl:if>
<xsl:if test="$parTaal = 'noors'">Avstammingsrekke</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Àrbol genealógico</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Albero genealogico</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Árvore genealógica</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_stamvader">
<xsl:if test="$parTaal = 'nederlands'">stamvader</xsl:if>
<xsl:if test="$parTaal = 'engels'">earliest ancestor</xsl:if>
<xsl:if test="$parTaal = 'frans'">aïeul</xsl:if>
<xsl:if test="$parTaal = 'duits'">Stammvater</xsl:if>
<xsl:if test="$parTaal = 'fries'">stamheit</xsl:if>
<xsl:if test="$parTaal = 'noors'">stamfaren</xsl:if>
<xsl:if test="$parTaal = 'spaans'">antepasado más antiguo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">primo antenato</xsl:if>
<xsl:if test="$parTaal = 'portugees'">mais antigo ancestral</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Statistiek">
<xsl:if test="$parTaal = 'nederlands'">Statistieken</xsl:if>
<xsl:if test="$parTaal = 'engels'">Statistics</xsl:if>
<xsl:if test="$parTaal = 'frans'">Statistiques</xsl:if>
<xsl:if test="$parTaal = 'duits'">Statistiken</xsl:if>
<xsl:if test="$parTaal = 'fries'">Statistyken</xsl:if>
<xsl:if test="$parTaal = 'noors'">Statistikk</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Estadística</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Statistica</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Estatística</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Statistiektitel">
<xsl:if test="$parTaal = 'nederlands'"><xsl:value-of select="$Txt_Overzichten"/> van algemene (statistische) gegevens</xsl:if>
<xsl:if test="$parTaal = 'engels'"><xsl:value-of select="$Txt_Overzichten"/> of general (statistical) data</xsl:if>
<xsl:if test="$parTaal = 'frans'"><xsl:value-of select="$Txt_Overzichten"/> de données (statistiques) générales</xsl:if>
<xsl:if test="$parTaal = 'duits'"><xsl:value-of select="$Txt_Overzichten"/> algemeiner (statistischer) Daten</xsl:if>
<xsl:if test="$parTaal = 'fries'"><xsl:value-of select="$Txt_Overzichten"/> fan algemiene (statistyske) gegevens</xsl:if>
<xsl:if test="$parTaal = 'noors'"><xsl:value-of select="$Txt_Overzichten"/> generelt (statistisk) data</xsl:if>
<xsl:if test="$parTaal = 'spaans'"><xsl:value-of select="$Txt_Overzichten"/> de datos general (estadística)</xsl:if>
<xsl:if test="$parTaal = 'italiaans'"><xsl:value-of select="$Txt_Overzichten"/> dei dati generali (statistici)</xsl:if>
<xsl:if test="$parTaal = 'portugees'"><xsl:value-of select="$Txt_Overzichten"/> de dados geral (estatística)</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Stief">
<xsl:if test="$parTaal = 'nederlands'">Stief</xsl:if>
<xsl:if test="$parTaal = 'engels'">Step</xsl:if>
<xsl:if test="$parTaal = 'frans'">Autre lit </xsl:if>
<xsl:if test="$parTaal = 'duits'">Stief</xsl:if>
<xsl:if test="$parTaal = 'fries'">Sty</xsl:if>
<xsl:if test="$parTaal = 'noors'">Ste</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Hijastro</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Figliastro</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Enteado</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_te">
<xsl:if test="$parTaal = 'nederlands'">in</xsl:if>
<xsl:if test="$parTaal = 'engels'">in</xsl:if>
<xsl:if test="$parTaal = 'frans'">à</xsl:if>
<xsl:if test="$parTaal = 'duits'">in</xsl:if>
<xsl:if test="$parTaal = 'fries'">yn</xsl:if>
<xsl:if test="$parTaal = 'noors'">inn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">en</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">in</xsl:if>
<xsl:if test="$parTaal = 'portugees'">em</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_tabel">
<xsl:if test="$parTaal = 'nederlands'">tabel</xsl:if>
<xsl:if test="$parTaal = 'engels'">table</xsl:if>
<xsl:if test="$parTaal = 'frans'">table</xsl:if>
<xsl:if test="$parTaal = 'duits'">Tafel</xsl:if>
<xsl:if test="$parTaal = 'fries'">tabell</xsl:if>
<xsl:if test="$parTaal = 'noors'">tabel</xsl:if>
<xsl:if test="$parTaal = 'spaans'">tabla</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">tabello</xsl:if>
<xsl:if test="$parTaal = 'portugees'">tabela</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Tabellen">
<xsl:if test="$parTaal = 'nederlands'">Tabellen</xsl:if>
<xsl:if test="$parTaal = 'engels'">Tables</xsl:if>
<xsl:if test="$parTaal = 'frans'">Tables</xsl:if>
<xsl:if test="$parTaal = 'duits'">Tafeln</xsl:if>
<xsl:if test="$parTaal = 'fries'">Tabellen</xsl:if>
<xsl:if test="$parTaal = 'noors'">Tabeller</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Tablas</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Tabelle</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Tabelas</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_tabellen">
<xsl:if test="$parTaal = 'nederlands'">tabellen</xsl:if>
<xsl:if test="$parTaal = 'engels'">tables</xsl:if>
<xsl:if test="$parTaal = 'frans'">tables</xsl:if>
<xsl:if test="$parTaal = 'duits'">Tafeln</xsl:if>
<xsl:if test="$parTaal = 'fries'">tabellen</xsl:if>
<xsl:if test="$parTaal = 'noors'">tabeller</xsl:if>
<xsl:if test="$parTaal = 'spaans'">tablas</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">tabelle</xsl:if>
<xsl:if test="$parTaal = 'portugees'">tabelas</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_tekstvorm">
<xsl:if test="$parTaal = 'nederlands'">tekstvorm</xsl:if>
<xsl:if test="$parTaal = 'engels'">the form of text</xsl:if>
<xsl:if test="$parTaal = 'frans'"></xsl:if>
<xsl:if test="$parTaal = 'duits'">geschrieben Gestalt</xsl:if>
<xsl:if test="$parTaal = 'fries'">tekstvorm</xsl:if>
<xsl:if test="$parTaal = 'noors'">tekst</xsl:if>
<xsl:if test="$parTaal = 'spaans'">texto</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">testo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">texto</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_tekstoverzichten">
<xsl:if test="$parTaal = 'nederlands'">tekstoverzichten</xsl:if>
<xsl:if test="$parTaal = 'engels'">text reports</xsl:if>
<xsl:if test="$parTaal = 'frans'">résumé rédigé</xsl:if>
<xsl:if test="$parTaal = 'duits'">geschriebene Listen</xsl:if>
<xsl:if test="$parTaal = 'fries'">tekstoverzichten</xsl:if>
<xsl:if test="$parTaal = 'noors'">tekst oversikter</xsl:if>
<xsl:if test="$parTaal = 'spaans'">descripciones de texto</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">panoramiche di testo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">súmulas texto</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_terug">
<xsl:if test="$parTaal = 'nederlands'">terug</xsl:if>
<xsl:if test="$parTaal = 'engels'">back</xsl:if>
<xsl:if test="$parTaal = 'frans'">dernier</xsl:if>
<xsl:if test="$parTaal = 'duits'">zurück</xsl:if>
<xsl:if test="$parTaal = 'fries'">werom  </xsl:if>
<xsl:if test="$parTaal = 'noors'">tilbake</xsl:if>
<xsl:if test="$parTaal = 'spaans'">espalda</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">indietro</xsl:if>
<xsl:if test="$parTaal = 'portugees'">de volta</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Tijdsduur">
<xsl:if test="$parTaal = 'nederlands'">Tijdsduur</xsl:if>
<xsl:if test="$parTaal = 'engels'">Time</xsl:if>
<xsl:if test="$parTaal = 'frans'">Durée de l'interval</xsl:if>
<xsl:if test="$parTaal = 'duits'">Zeit</xsl:if>
<xsl:if test="$parTaal = 'fries'">Tiidsduer</xsl:if>
<xsl:if test="$parTaal = 'noors'">Varighet</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Duración</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Durata</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Duração</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Titel">
<xsl:if test="$parTaal = 'nederlands'">Titel</xsl:if>
<xsl:if test="$parTaal = 'engels'">Title</xsl:if>
<xsl:if test="$parTaal = 'frans'">Titre</xsl:if>
<xsl:if test="$parTaal = 'duits'">Titel</xsl:if>
<xsl:if test="$parTaal = 'fries'">Titel</xsl:if>
<xsl:if test="$parTaal = 'noors'">Tittel</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Título </xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Titolo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Título </xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Titels">
<xsl:if test="$parTaal = 'nederlands'">Titels</xsl:if>
<xsl:if test="$parTaal = 'engels'">Titles</xsl:if>
<xsl:if test="$parTaal = 'frans'">Titres</xsl:if>
<xsl:if test="$parTaal = 'duits'">Titeln</xsl:if>
<xsl:if test="$parTaal = 'fries'">Titels</xsl:if>
<xsl:if test="$parTaal = 'noors'">Titteler</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Títulos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Titoli</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Títulos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Toon">
<xsl:if test="$parTaal = 'nederlands'">Toon</xsl:if>
<xsl:if test="$parTaal = 'engels'">Show</xsl:if>
<xsl:if test="$parTaal = 'frans'">Montrez</xsl:if>
<xsl:if test="$parTaal = 'duits'">Zeige</xsl:if>
<xsl:if test="$parTaal = 'fries'">Toan</xsl:if>
<xsl:if test="$parTaal = 'noors'">Vis</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Mostrar</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Mostra</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Mostra</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Tot">
<xsl:if test="$parTaal = 'nederlands'">Tot</xsl:if>
<xsl:if test="$parTaal = 'engels'">Until</xsl:if>
<xsl:if test="$parTaal = 'frans'">Jusqu'à</xsl:if>
<xsl:if test="$parTaal = 'duits'">Bis</xsl:if>
<xsl:if test="$parTaal = 'fries'">Oant</xsl:if>
<xsl:if test="$parTaal = 'noors'">Inntil</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Hasta</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Fino a</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Até</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_tot">
<xsl:if test="$parTaal = 'nederlands'">tot</xsl:if>
<xsl:if test="$parTaal = 'engels'">until</xsl:if>
<xsl:if test="$parTaal = 'frans'">jusqu'à</xsl:if>
<xsl:if test="$parTaal = 'duits'">bis</xsl:if>
<xsl:if test="$parTaal = 'fries'">oant</xsl:if>
<xsl:if test="$parTaal = 'noors'">inntil</xsl:if>
<xsl:if test="$parTaal = 'spaans'">hasta</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">fino a</xsl:if>
<xsl:if test="$parTaal = 'portugees'">até</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Totaal">
<xsl:if test="$parTaal = 'nederlands'">Totaal</xsl:if>
<xsl:if test="$parTaal = 'engels'">Total</xsl:if>
<xsl:if test="$parTaal = 'frans'">Totale</xsl:if>
<xsl:if test="$parTaal = 'duits'">Gesamte</xsl:if>
<xsl:if test="$parTaal = 'fries'">Hiele</xsl:if>
<xsl:if test="$parTaal = 'noors'">Total</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Todo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Tutto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Todo</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_trouwde">
<xsl:if test="$parTaal = 'nederlands'">trouwde</xsl:if>
<xsl:if test="$parTaal = 'engels'">married</xsl:if>
<xsl:if test="$parTaal = 'frans'">a épousé</xsl:if>
<xsl:if test="$parTaal = 'duits'">heiratete</xsl:if>
<xsl:if test="$parTaal = 'fries'">troude</xsl:if>
<xsl:if test="$parTaal = 'noors'">giftet seg med</xsl:if>
<xsl:if test="$parTaal = 'spaans'">se casó</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">sposò</xsl:if>
<xsl:if test="$parTaal = 'portugees'">se casou</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_trouwdemet">
<xsl:if test="$parTaal = 'nederlands'">met</xsl:if>
<xsl:if test="$parTaal = 'engels'"></xsl:if>
<xsl:if test="$parTaal = 'frans'"></xsl:if>
<xsl:if test="$parTaal = 'duits'">mit</xsl:if>
<xsl:if test="$parTaal = 'fries'"></xsl:if>
<xsl:if test="$parTaal = 'noors'"></xsl:if>
<xsl:if test="$parTaal = 'spaans'"></xsl:if>
<xsl:if test="$parTaal = 'italiaans'"></xsl:if>
<xsl:if test="$parTaal = 'portugees'"></xsl:if>
</xsl:variable>
<xsl:variable name="Txt_tussen">
<xsl:if test="$parTaal = 'nederlands'">tussen</xsl:if>
<xsl:if test="$parTaal = 'engels'">between</xsl:if>
<xsl:if test="$parTaal = 'frans'">entre</xsl:if>
<xsl:if test="$parTaal = 'duits'">zwischen</xsl:if>
<xsl:if test="$parTaal = 'fries'">tusken</xsl:if>
<xsl:if test="$parTaal = 'noors'">mellom</xsl:if>
<xsl:if test="$parTaal = 'spaans'">entre</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">tra</xsl:if>
<xsl:if test="$parTaal = 'portugees'">entre</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Tussenvoegsel">
<xsl:if test="$parTaal = 'nederlands'">Tussenvoegsel</xsl:if>
<xsl:if test="$parTaal = 'engels'">Prefix</xsl:if>
<xsl:if test="$parTaal = 'frans'">Intercalaire</xsl:if>
<xsl:if test="$parTaal = 'duits'">Zwischenteil</xsl:if>
<xsl:if test="$parTaal = 'fries'">Ynfoeging</xsl:if>
<xsl:if test="$parTaal = 'noors'">Prefiks</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Inserción</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Inserimento</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Inserção</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_tussenvoegsel">
<xsl:if test="$parTaal = 'nederlands'">tussenvoegsel</xsl:if>
<xsl:if test="$parTaal = 'engels'">prefix</xsl:if>
<xsl:if test="$parTaal = 'frans'">préposition</xsl:if>
<xsl:if test="$parTaal = 'duits'">Zwischenteil</xsl:if>
<xsl:if test="$parTaal = 'fries'">ynfoeging</xsl:if>
<xsl:if test="$parTaal = 'noors'">prefiks</xsl:if>
<xsl:if test="$parTaal = 'spaans'">inserción</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">inserimento</xsl:if>
<xsl:if test="$parTaal = 'portugees'">inserção</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Tweede">
<xsl:if test="$parTaal = 'nederlands'">Tweede</xsl:if>
<xsl:if test="$parTaal = 'engels'">Second</xsl:if>
<xsl:if test="$parTaal = 'frans'">Deuxième</xsl:if>
<xsl:if test="$parTaal = 'duits'">Zweites</xsl:if>
<xsl:if test="$parTaal = 'fries'">Twadde</xsl:if>
<xsl:if test="$parTaal = 'noors'">Andre</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Segundo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Secundo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Segundo</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_tweede">
<xsl:if test="$parTaal = 'nederlands'">tweede</xsl:if>
<xsl:if test="$parTaal = 'engels'">second</xsl:if>
<xsl:if test="$parTaal = 'frans'">l'autre</xsl:if>
<xsl:if test="$parTaal = 'duits'">zweites</xsl:if>
<xsl:if test="$parTaal = 'fries'">twadde</xsl:if>
<xsl:if test="$parTaal = 'noors'">andre</xsl:if>
<xsl:if test="$parTaal = 'spaans'">segundo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">secundo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">segundo</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Uitgebreid">
<xsl:if test="$parTaal = 'nederlands'">Uitgebreid</xsl:if>
<xsl:if test="$parTaal = 'engels'">Extended</xsl:if>
<xsl:if test="$parTaal = 'frans'">Extensive</xsl:if>
<xsl:if test="$parTaal = 'duits'">Umfassende</xsl:if>
<xsl:if test="$parTaal = 'fries'">Wiidweidich</xsl:if>
<xsl:if test="$parTaal = 'noors'">Utstrakt</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Exstenso</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Esteso</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Exstenso</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_uitgebreid">
<xsl:if test="$parTaal = 'nederlands'">uitgebreid</xsl:if>
<xsl:if test="$parTaal = 'engels'">extended</xsl:if>
<xsl:if test="$parTaal = 'frans'">extensive</xsl:if>
<xsl:if test="$parTaal = 'duits'">umfassende</xsl:if>
<xsl:if test="$parTaal = 'fries'">wiidweidich</xsl:if>
<xsl:if test="$parTaal = 'noors'">utstrakt</xsl:if>
<xsl:if test="$parTaal = 'spaans'">exstenso</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">esteso</xsl:if>
<xsl:if test="$parTaal = 'portugees'">exstenso</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Uitvoergelijkzoekteksten">
<xsl:if test="$parTaal = 'nederlands'">Uitvoer gelijk aan zoekteksten</xsl:if>
<xsl:if test="$parTaal = 'engels'">Result matches search text</xsl:if>
<xsl:if test="$parTaal = 'frans'">Résultat exacte aux textes de recherche</xsl:if>
<xsl:if test="$parTaal = 'duits'">Ergebnis gleich an Suchtext</xsl:if>
<xsl:if test="$parTaal = 'fries'">Ûtfier gelyk oan sykjeteksten</xsl:if>
<xsl:if test="$parTaal = 'noors'">Resultatet innholder søketekster</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Resultado coincide con el texto de búsqueda</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Risultato corrisponde testo a ricerca</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Resultado corresponde texto de pesquisa</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Uitvoerbevatzoekteksten">
<xsl:if test="$parTaal = 'nederlands'">Uitvoer bevat zoekteksten</xsl:if>
<xsl:if test="$parTaal = 'engels'">Result contains search text</xsl:if>
<xsl:if test="$parTaal = 'frans'">Résultat contenant les textes de rechercher</xsl:if>
<xsl:if test="$parTaal = 'duits'">Ergebnis enthält Suchtext</xsl:if>
<xsl:if test="$parTaal = 'fries'">Ûtfier bevettet sykjeteksten</xsl:if>
<xsl:if test="$parTaal = 'noors'">Resultatet innholder søketekster</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Resultado contiene texto de búsqueda</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Risultato contiene testo a ricerca</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Resultado contém texto de pesquisa</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Vader">
<xsl:if test="$parTaal = 'nederlands'">Vader</xsl:if>
<xsl:if test="$parTaal = 'engels'">Father</xsl:if>
<xsl:if test="$parTaal = 'frans'">Père</xsl:if>
<xsl:if test="$parTaal = 'duits'">Vater</xsl:if>
<xsl:if test="$parTaal = 'fries'">Heit</xsl:if>
<xsl:if test="$parTaal = 'noors'">Far</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Padre</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Padre</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Pai</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_vaders">
<xsl:if test="$parTaal = 'nederlands'">vaders</xsl:if>
<xsl:if test="$parTaal = 'engels'">fathers</xsl:if>
<xsl:if test="$parTaal = 'frans'">pères</xsl:if>
<xsl:if test="$parTaal = 'duits'">Vatern</xsl:if>
<xsl:if test="$parTaal = 'fries'">Heite</xsl:if>
<xsl:if test="$parTaal = 'noors'">Farer</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Padres</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Padri</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Pais</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_vader">
<xsl:if test="$parTaal = 'nederlands'">vader</xsl:if>
<xsl:if test="$parTaal = 'engels'">father</xsl:if>
<xsl:if test="$parTaal = 'frans'">père</xsl:if>
<xsl:if test="$parTaal = 'duits'">Vater</xsl:if>
<xsl:if test="$parTaal = 'fries'">heit</xsl:if>
<xsl:if test="$parTaal = 'noors'">far</xsl:if>
<xsl:if test="$parTaal = 'spaans'">padre</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">padre</xsl:if>
<xsl:if test="$parTaal = 'portugees'">pai</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Van">
<xsl:if test="$parTaal = 'nederlands'">Van</xsl:if>
<xsl:if test="$parTaal = 'engels'">Of</xsl:if>
<xsl:if test="$parTaal = 'frans'">De</xsl:if>
<xsl:if test="$parTaal = 'duits'">Von</xsl:if>
<xsl:if test="$parTaal = 'fries'">Fan</xsl:if>
<xsl:if test="$parTaal = 'noors'">Av</xsl:if>
<xsl:if test="$parTaal = 'spaans'">De</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Da</xsl:if>
<xsl:if test="$parTaal = 'portugees'">De</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_van">
<xsl:if test="$parTaal = 'nederlands'">van</xsl:if>
<xsl:if test="$parTaal = 'engels'">of</xsl:if>
<xsl:if test="$parTaal = 'frans'">de</xsl:if>
<xsl:if test="$parTaal = 'duits'">von</xsl:if>
<xsl:if test="$parTaal = 'fries'">fan</xsl:if>
<xsl:if test="$parTaal = 'noors'">av</xsl:if>
<xsl:if test="$parTaal = 'spaans'">de</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">da</xsl:if>
<xsl:if test="$parTaal = 'portugees'">de</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Vanaf">
<xsl:if test="$parTaal = 'nederlands'">Vanaf</xsl:if>
<xsl:if test="$parTaal = 'engels'">From</xsl:if>
<xsl:if test="$parTaal = 'frans'">De</xsl:if>
<xsl:if test="$parTaal = 'duits'">Von</xsl:if>
<xsl:if test="$parTaal = 'fries'">Fan</xsl:if>
<xsl:if test="$parTaal = 'noors'">Til</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Desde</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Da</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Desde</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_vanaf">
<xsl:if test="$parTaal = 'nederlands'">vanaf</xsl:if>
<xsl:if test="$parTaal = 'engels'">from</xsl:if>
<xsl:if test="$parTaal = 'frans'">de</xsl:if>
<xsl:if test="$parTaal = 'duits'">von</xsl:if>
<xsl:if test="$parTaal = 'fries'">fan</xsl:if>
<xsl:if test="$parTaal = 'noors'">til</xsl:if>
<xsl:if test="$parTaal = 'spaans'">desde</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">da</xsl:if>
<xsl:if test="$parTaal = 'portugees'">desde</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Vandaag">
<xsl:if test="$parTaal = 'nederlands'">Vandaag</xsl:if>
<xsl:if test="$parTaal = 'engels'">Today</xsl:if>
<xsl:if test="$parTaal = 'frans'">Aujourd'hui</xsl:if>
<xsl:if test="$parTaal = 'duits'">Heute</xsl:if>
<xsl:if test="$parTaal = 'fries'">Hjoed</xsl:if>
<xsl:if test="$parTaal = 'noors'">Idag</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Hoy</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Oggi</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Hoje</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_vandaag">
<xsl:if test="$parTaal = 'nederlands'">vandaag</xsl:if>
<xsl:if test="$parTaal = 'engels'">today</xsl:if>
<xsl:if test="$parTaal = 'frans'">aujourd'hui</xsl:if>
<xsl:if test="$parTaal = 'duits'">Heute</xsl:if>
<xsl:if test="$parTaal = 'fries'">hjoed</xsl:if>
<xsl:if test="$parTaal = 'noors'">idag</xsl:if>
<xsl:if test="$parTaal = 'spaans'">hoy</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">oggi</xsl:if>
<xsl:if test="$parTaal = 'portugees'">hoje</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Vandaagintitelgeen">
<xsl:if test="$parTaal = 'nederlands'">Er zijn vandaag geen gebeurtenissen in deze stamboom</xsl:if>
<xsl:if test="$parTaal = 'engels'">Today there are no events in the family tree</xsl:if>
<xsl:if test="$parTaal = 'frans'">Il n'y a pas des événements d'aujourd'hui en cet arbre généalogique</xsl:if>
<xsl:if test="$parTaal = 'duits'">Es giebt keine heutige Veranstaltungen in diesen Stammbaum</xsl:if>
<xsl:if test="$parTaal = 'fries'">Der binne hjoe gjin foarfallen yn dizze stamboam</xsl:if>
<xsl:if test="$parTaal = 'noors'">Det er idag ikke noen hendelser i dette tre</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Hoy no hay ningún evento en el árbol genealógico</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Oggi non ci sono eventi in albero genealogico</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Hoje não há eventos na árvore genealógica</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_vande">
<xsl:if test="$parTaal = 'nederlands'">van de</xsl:if>
<xsl:if test="$parTaal = 'engels'">of the</xsl:if>
<xsl:if test="$parTaal = 'frans'">des</xsl:if>
<xsl:if test="$parTaal = 'duits'">der</xsl:if>
<xsl:if test="$parTaal = 'fries'">fan de</xsl:if>
<xsl:if test="$parTaal = 'noors'">fra den</xsl:if>
<xsl:if test="$parTaal = 'spaans'">de los</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">della</xsl:if>
<xsl:if test="$parTaal = 'portugees'">do</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_vande_m">
<xsl:if test="$parTaal = 'nederlands'">van de</xsl:if>
<xsl:if test="$parTaal = 'engels'">of the</xsl:if>
<xsl:if test="$parTaal = 'frans'">du</xsl:if>
<xsl:if test="$parTaal = 'duits'">des</xsl:if>
<xsl:if test="$parTaal = 'fries'">fan de</xsl:if>
<xsl:if test="$parTaal = 'noors'">fra den</xsl:if>
<xsl:if test="$parTaal = 'spaans'">de los</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">della</xsl:if>
<xsl:if test="$parTaal = 'portugees'">do</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_vande_v">
<xsl:if test="$parTaal = 'nederlands'">van de</xsl:if>
<xsl:if test="$parTaal = 'engels'">of the</xsl:if>
<xsl:if test="$parTaal = 'frans'">de la</xsl:if>
<xsl:if test="$parTaal = 'duits'">des</xsl:if>
<xsl:if test="$parTaal = 'fries'">fan de</xsl:if>
<xsl:if test="$parTaal = 'noors'">fra den</xsl:if>
<xsl:if test="$parTaal = 'spaans'">de los</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">della</xsl:if>
<xsl:if test="$parTaal = 'portugees'">do</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_van_de_tweede">
<xsl:if test="$parTaal = 'nederlands'">van de tweede</xsl:if>
<xsl:if test="$parTaal = 'engels'">of the second</xsl:if>
<xsl:if test="$parTaal = 'frans'">de l'autre</xsl:if>
<xsl:if test="$parTaal = 'duits'">der zweite</xsl:if>
<xsl:if test="$parTaal = 'fries'">fan de twadde</xsl:if>
<xsl:if test="$parTaal = 'noors'">fra den andre</xsl:if>
<xsl:if test="$parTaal = 'spaans'">de la segunda</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">della seconda</xsl:if>
<xsl:if test="$parTaal = 'portugees'">do segundo</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Vantijd">
<xsl:if test="$parTaal = 'nederlands'">Vanaf</xsl:if>
<xsl:if test="$parTaal = 'engels'">From</xsl:if>
<xsl:if test="$parTaal = 'frans'">De</xsl:if>
<xsl:if test="$parTaal = 'duits'">Von</xsl:if>
<xsl:if test="$parTaal = 'fries'">Fan</xsl:if>
<xsl:if test="$parTaal = 'noors'">Til</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Desde</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Da</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Desde</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_vantweedeouder">
<xsl:if test="$parTaal = 'nederlands'"></xsl:if>
<xsl:if test="$parTaal = 'engels'"></xsl:if>
<xsl:if test="$parTaal = 'frans'">de</xsl:if>
<xsl:if test="$parTaal = 'duits'"></xsl:if>
<xsl:if test="$parTaal = 'fries'"></xsl:if>
<xsl:if test="$parTaal = 'noors'"></xsl:if>
<xsl:if test="$parTaal = 'spaans'"></xsl:if>
<xsl:if test="$parTaal = 'italiaans'"></xsl:if>
<xsl:if test="$parTaal = 'portugees'"></xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Verander">
<xsl:if test="$parTaal = 'nederlands'">Verander</xsl:if>
<xsl:if test="$parTaal = 'engels'">Change</xsl:if>
<xsl:if test="$parTaal = 'frans'">Changez</xsl:if>
<xsl:if test="$parTaal = 'duits'">Änder</xsl:if>
<xsl:if test="$parTaal = 'fries'">Feroarje</xsl:if>
<xsl:if test="$parTaal = 'noors'">Endre</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Modificación</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Modifica</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Modificação</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Verandersorteer">
<xsl:if test="$parTaal = 'nederlands'">De sorteervolgorde of de sorteersleutel zijn te veranderen door op een kolomtitel te klikken</xsl:if>
<xsl:if test="$parTaal = 'engels'">The sort order or the sort key may be changed by clicking a column title</xsl:if>
<xsl:if test="$parTaal = 'frans'">Cliquez l'entête d'une colonne pour changer l'ordre de triage ou la clé de tri</xsl:if>
<xsl:if test="$parTaal = 'duits'">Die Rangordnung oder die Schlüssel der Sortierung kann man ändern durch drücken auf eine Kolumnekopf</xsl:if>
<xsl:if test="$parTaal = 'fries'">De skiftfolchoader of de skiftkaai binne te feroarje troch op in kolomtitel te klikken</xsl:if>
<xsl:if test="$parTaal = 'noors'">Sorteringens rekkefølge kan endres ved å klikke på en kollomme</xsl:if>
<xsl:if test="$parTaal = 'spaans'">El orden de clasificación o la clave de clasificación puede ser cambiado haciendo clic en un título de columna</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">L'ordinamento o la chiave di ordinamento può essere modificato facendo clic su un titolo di colonna</xsl:if>
<xsl:if test="$parTaal = 'portugees'">A ordem de classificação ou a chave de classificação pode ser alterada clicando em um título da coluna</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Verkort_parenteel">
<xsl:if test="$parTaal = 'nederlands'">Verkort parenteel</xsl:if>
<xsl:if test="$parTaal = 'engels'">Compact descendants</xsl:if>
<xsl:if test="$parTaal = 'frans'">Descendants abrégés</xsl:if>
<xsl:if test="$parTaal = 'duits'">Abgekürzt Nachkommen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Ferkoart parenteel</xsl:if>
<xsl:if test="$parTaal = 'noors'">Forkorte etterkommere</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Descendientes compactos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Discendenti compatti</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Descendentes compact</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Vermelding">
<xsl:if test="$parTaal = 'nederlands'">Vermelding</xsl:if>
<xsl:if test="$parTaal = 'engels'">Mention</xsl:if>
<xsl:if test="$parTaal = 'frans'">Mention</xsl:if>
<xsl:if test="$parTaal = 'duits'">Angabe</xsl:if>
<xsl:if test="$parTaal = 'fries'">Fermelding</xsl:if>
<xsl:if test="$parTaal = 'noors'">Opplysning</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Mención</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Menzione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Menção</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Vermeldingen">
<xsl:if test="$parTaal = 'nederlands'">Vermeldingen</xsl:if>
<xsl:if test="$parTaal = 'engels'">Mentionings</xsl:if>
<xsl:if test="$parTaal = 'frans'">Mentions</xsl:if>
<xsl:if test="$parTaal = 'duits'">Angaben</xsl:if>
<xsl:if test="$parTaal = 'fries'">Fermeldingen</xsl:if>
<xsl:if test="$parTaal = 'noors'">Opplysninger</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Menciónes</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Menzioni</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Mençãos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Vermist">
<xsl:if test="$parTaal = 'nederlands'">Vermist</xsl:if>
<xsl:if test="$parTaal = 'engels'">Lost</xsl:if>
<xsl:if test="$parTaal = 'frans'">Disparu</xsl:if>
<xsl:if test="$parTaal = 'duits'">Vermist</xsl:if>
<xsl:if test="$parTaal = 'fries'">Wei</xsl:if>
<xsl:if test="$parTaal = 'noors'">Savnet</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Desapareció</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Disperso</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Desaparecido</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_vermistm">
<xsl:if test="$parTaal = 'nederlands'">vermist</xsl:if>
<xsl:if test="$parTaal = 'engels'">lost</xsl:if>
<xsl:if test="$parTaal = 'frans'">disparu</xsl:if>
<xsl:if test="$parTaal = 'duits'">vermist</xsl:if>
<xsl:if test="$parTaal = 'fries'">wei</xsl:if>
<xsl:if test="$parTaal = 'noors'">savnet</xsl:if>
<xsl:if test="$parTaal = 'spaans'">desapareció</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">disperso</xsl:if>
<xsl:if test="$parTaal = 'portugees'">desaparecido</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_vermistv">
<xsl:if test="$parTaal = 'nederlands'">vermist</xsl:if>
<xsl:if test="$parTaal = 'engels'">lost</xsl:if>
<xsl:if test="$parTaal = 'frans'">disparue</xsl:if>
<xsl:if test="$parTaal = 'duits'">vermist</xsl:if>
<xsl:if test="$parTaal = 'fries'">wei</xsl:if>
<xsl:if test="$parTaal = 'noors'">savnet</xsl:if>
<xsl:if test="$parTaal = 'spaans'">desapareció</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">disperso</xsl:if>
<xsl:if test="$parTaal = 'portugees'">desaparecido</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Verwantschap">
<xsl:if test="$parTaal = 'nederlands'">Verwantschap</xsl:if>
<xsl:if test="$parTaal = 'engels'">Relationship</xsl:if>
<xsl:if test="$parTaal = 'frans'">Parenté</xsl:if>
<xsl:if test="$parTaal = 'duits'">Verwandtschaft</xsl:if>
<xsl:if test="$parTaal = 'fries'">Besibbe</xsl:if>
<xsl:if test="$parTaal = 'noors'">Slekt</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Relación</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Relazione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Relação</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Verwantschappen">
<xsl:if test="$parTaal = 'nederlands'">Verwantschappen</xsl:if>
<xsl:if test="$parTaal = 'engels'">Relationships</xsl:if>
<xsl:if test="$parTaal = 'frans'">Parentés</xsl:if>
<xsl:if test="$parTaal = 'duits'">Verwandtschaften</xsl:if>
<xsl:if test="$parTaal = 'fries'">Besibben</xsl:if>
<xsl:if test="$parTaal = 'noors'">Slekt</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Relaciones</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Relazioni</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Relaçãoes</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_verwantschap">
<xsl:if test="$parTaal = 'nederlands'">verwantschap</xsl:if>
<xsl:if test="$parTaal = 'engels'">relationship</xsl:if>
<xsl:if test="$parTaal = 'frans'">parenté</xsl:if>
<xsl:if test="$parTaal = 'duits'">Verwandtschaft</xsl:if>
<xsl:if test="$parTaal = 'fries'">besibbe</xsl:if>
<xsl:if test="$parTaal = 'noors'">slekt</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Relación</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">relazione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">relação</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_verwantschappen">
<xsl:if test="$parTaal = 'nederlands'">verwantschappen</xsl:if>
<xsl:if test="$parTaal = 'engels'">relationships</xsl:if>
<xsl:if test="$parTaal = 'frans'">parentés</xsl:if>
<xsl:if test="$parTaal = 'duits'">Verwandtschaften</xsl:if>
<xsl:if test="$parTaal = 'fries'">besibben</xsl:if>
<xsl:if test="$parTaal = 'noors'">slekt</xsl:if>
<xsl:if test="$parTaal = 'spaans'">relaciones</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">relazioni</xsl:if>
<xsl:if test="$parTaal = 'portugees'">relaçãoes</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_verwantschapslijn">
<xsl:if test="$parTaal = 'nederlands'">verwantschapslijn</xsl:if>
<xsl:if test="$parTaal = 'engels'">relationship line</xsl:if>
<xsl:if test="$parTaal = 'frans'">ligne de parenté</xsl:if>
<xsl:if test="$parTaal = 'duits'">Verwandtschaftslinie</xsl:if>
<xsl:if test="$parTaal = 'fries'">Besibbensstreek</xsl:if>
<xsl:if test="$parTaal = 'noors'">Slektskapslinje</xsl:if>
<xsl:if test="$parTaal = 'spaans'">línea de relación</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">linea di relazione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">linha de relação</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_verwantschapslijnen">
<xsl:if test="$parTaal = 'nederlands'">verwantschapslijnen</xsl:if>
<xsl:if test="$parTaal = 'engels'">relationship lines</xsl:if>
<xsl:if test="$parTaal = 'frans'">lignes de parenté</xsl:if>
<xsl:if test="$parTaal = 'duits'">Verwandtschaftslinien</xsl:if>
<xsl:if test="$parTaal = 'fries'">besibbensstreken</xsl:if>
<xsl:if test="$parTaal = 'noors'">slektskaps linjer</xsl:if>
<xsl:if test="$parTaal = 'spaans'">líneas de relación</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">linee di relazione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">linhas de relação</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Verwantschaptitelgeen">
<xsl:if test="$parTaal = 'nederlands'">Geen <xsl:value-of select="$Txt_verwantschap"/> gevonden</xsl:if>
<xsl:if test="$parTaal = 'engels'">No <xsl:value-of select="$Txt_verwantschap"/> found</xsl:if>
<xsl:if test="$parTaal = 'frans'">Pas trouvé de <xsl:value-of select="$Txt_verwantschap"/></xsl:if>
<xsl:if test="$parTaal = 'duits'">Keine <xsl:value-of select="$Txt_verwantschap"/> gefunden</xsl:if>
<xsl:if test="$parTaal = 'fries'">Gjin besibbens fûn</xsl:if>
<xsl:if test="$parTaal = 'noors'">Ingen slekt funnet</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Sin encontró relación</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Nessuna relazione trovata</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Nenhuma relação encontrada</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_via">
<xsl:if test="$parTaal = 'nederlands'">via</xsl:if>
<xsl:if test="$parTaal = 'engels'">via</xsl:if>
<xsl:if test="$parTaal = 'frans'">par</xsl:if>
<xsl:if test="$parTaal = 'duits'">via</xsl:if>
<xsl:if test="$parTaal = 'fries'">fia</xsl:if>
<xsl:if test="$parTaal = 'noors'">via</xsl:if>
<xsl:if test="$parTaal = 'spaans'">vía</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">via</xsl:if>
<xsl:if test="$parTaal = 'portugees'">vía</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_via2">
<xsl:if test="$parTaal = 'nederlands'">via</xsl:if>
<xsl:if test="$parTaal = 'engels'">by</xsl:if>
<xsl:if test="$parTaal = 'frans'">par</xsl:if>
<xsl:if test="$parTaal = 'duits'">via</xsl:if>
<xsl:if test="$parTaal = 'fries'">fia</xsl:if>
<xsl:if test="$parTaal = 'noors'">via</xsl:if>
<xsl:if test="$parTaal = 'spaans'">vía</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">via</xsl:if>
<xsl:if test="$parTaal = 'portugees'">vía</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Volgt">
<xsl:if test="$parTaal = 'nederlands'">Volgt</xsl:if>
<xsl:if test="$parTaal = 'engels'">Follow</xsl:if>
<xsl:if test="$parTaal = 'frans'">Suit</xsl:if>
<xsl:if test="$parTaal = 'duits'">Folge</xsl:if>
<xsl:if test="$parTaal = 'fries'">Folget</xsl:if>
<xsl:if test="$parTaal = 'noors'">Følg</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Seguir</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Seguire</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Seguir</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Voettekst">
<xsl:if test="$parTaal = 'nederlands'">Voettekst</xsl:if>
<xsl:if test="$parTaal = 'engels'">Footer</xsl:if>
<xsl:if test="$parTaal = 'frans'">Note de bas de page</xsl:if>
<xsl:if test="$parTaal = 'duits'">Fusszeile</xsl:if>
<xsl:if test="$parTaal = 'fries'">Fuottekst</xsl:if>
<xsl:if test="$parTaal = 'noors'">Fotnote</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Pie de página</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Piè di pagina</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Rodapé</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Volgende">
<xsl:if test="$parTaal = 'nederlands'">Volgende</xsl:if>
<xsl:if test="$parTaal = 'engels'">Next</xsl:if>
<xsl:if test="$parTaal = 'frans'">Suivant</xsl:if>
<xsl:if test="$parTaal = 'duits'">Nächste</xsl:if>
<xsl:if test="$parTaal = 'fries'">Folgjende</xsl:if>
<xsl:if test="$parTaal = 'noors'">Neste</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Siguiente</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Prossimo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Seguinte</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_volgende">
<xsl:if test="$parTaal = 'nederlands'">volgende</xsl:if>
<xsl:if test="$parTaal = 'engels'">next</xsl:if>
<xsl:if test="$parTaal = 'frans'">suivante</xsl:if>
<xsl:if test="$parTaal = 'duits'">Nächste</xsl:if>
<xsl:if test="$parTaal = 'fries'"></xsl:if>
<xsl:if test="$parTaal = 'noors'"></xsl:if>
<xsl:if test="$parTaal = 'spaans'"></xsl:if>
<xsl:if test="$parTaal = 'italiaans'"></xsl:if>
<xsl:if test="$parTaal = 'portugees'"></xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Volgende_foto">
<xsl:if test="$parTaal = 'nederlands'">Volgende foto</xsl:if>
<xsl:if test="$parTaal = 'engels'">Next photo</xsl:if>
<xsl:if test="$parTaal = 'frans'">Photo Suivante</xsl:if>
<xsl:if test="$parTaal = 'duits'">Nächste Photo</xsl:if>
<xsl:if test="$parTaal = 'fries'">Folgjende foto</xsl:if>
<xsl:if test="$parTaal = 'noors'">Neste bilde</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Siguiente foto</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Foto seguente</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Foto seguinte</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Volgorde">
<xsl:if test="$parTaal = 'nederlands'">Volgorde</xsl:if>
<xsl:if test="$parTaal = 'engels'">Order</xsl:if>
<xsl:if test="$parTaal = 'frans'">Séquencement</xsl:if>
<xsl:if test="$parTaal = 'duits'">Rangfolge</xsl:if>
<xsl:if test="$parTaal = 'fries'">Folchoader</xsl:if>
<xsl:if test="$parTaal = 'noors'">Rekkefølge</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Secuencia</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Sequenza</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Sequência</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Volledigevoornamen">
<xsl:if test="$parTaal = 'nederlands'">Volledige voornamen</xsl:if>
<xsl:if test="$parTaal = 'engels'">All christian names</xsl:if>
<xsl:if test="$parTaal = 'frans'">Tous les prénoms</xsl:if>
<xsl:if test="$parTaal = 'duits'">Völlige Vornamen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Folsleine foarnammen</xsl:if>
<xsl:if test="$parTaal = 'noors'">Fullt navn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Nombres completos</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Nomi completi</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Nomes completos</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_voor">
<xsl:if test="$parTaal = 'nederlands'">voor</xsl:if>
<xsl:if test="$parTaal = 'engels'">before</xsl:if>
<xsl:if test="$parTaal = 'frans'">avant</xsl:if>
<xsl:if test="$parTaal = 'duits'">für</xsl:if>
<xsl:if test="$parTaal = 'fries'">foar</xsl:if>
<xsl:if test="$parTaal = 'noors'">før</xsl:if>
<xsl:if test="$parTaal = 'spaans'">antes</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Prima e Dopo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">antes</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_voordebepaling">
<xsl:if test="$parTaal = 'nederlands'">voor de bepaling</xsl:if>
<xsl:if test="$parTaal = 'engels'">to determine</xsl:if>
<xsl:if test="$parTaal = 'frans'">pour déterminer</xsl:if>
<xsl:if test="$parTaal = 'duits'">zum Bestimmung</xsl:if>
<xsl:if test="$parTaal = 'fries'">foar de bepaling</xsl:if>
<xsl:if test="$parTaal = 'noors'">til kvalifisering</xsl:if>
<xsl:if test="$parTaal = 'spaans'">a la calificación</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">di qualificazione</xsl:if>
<xsl:if test="$parTaal = 'portugees'">a qualificação</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Voorgeslacht">
<xsl:if test="$parTaal = 'nederlands'">Voorgeslacht</xsl:if>
<xsl:if test="$parTaal = 'engels'">Ancestors</xsl:if>
<xsl:if test="$parTaal = 'frans'">Ancêtres</xsl:if>
<xsl:if test="$parTaal = 'duits'">Ahnen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Foarteam</xsl:if>
<xsl:if test="$parTaal = 'noors'">Aner</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Antepasados</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Ascendenza</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Antepassados</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_voorgeslacht">
<xsl:if test="$parTaal = 'nederlands'">voorgeslacht</xsl:if>
<xsl:if test="$parTaal = 'engels'">ancestors</xsl:if>
<xsl:if test="$parTaal = 'frans'">ancêtres</xsl:if>
<xsl:if test="$parTaal = 'duits'">Ahnen</xsl:if>
<xsl:if test="$parTaal = 'fries'">foarteam</xsl:if>
<xsl:if test="$parTaal = 'noors'">aner</xsl:if>
<xsl:if test="$parTaal = 'spaans'">antepasados</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">ascendenza</xsl:if>
<xsl:if test="$parTaal = 'portugees'">antepassados</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Voornaam">
<xsl:if test="$parTaal = 'nederlands'">Voornaam</xsl:if>
<xsl:if test="$parTaal = 'engels'">First name</xsl:if>
<xsl:if test="$parTaal = 'frans'">Prénom</xsl:if>
<xsl:if test="$parTaal = 'duits'">Vorname</xsl:if>
<xsl:if test="$parTaal = 'fries'">Foarnamme</xsl:if>
<xsl:if test="$parTaal = 'noors'">Fornavn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Primer nombre</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Nome</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Primeiro nome</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Voornamen">
<xsl:if test="$parTaal = 'nederlands'">Voornamen</xsl:if>
<xsl:if test="$parTaal = 'engels'">First names</xsl:if>
<xsl:if test="$parTaal = 'frans'">Prénoms</xsl:if>
<xsl:if test="$parTaal = 'duits'">Vornamen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Foarnammen</xsl:if>
<xsl:if test="$parTaal = 'noors'">Fornavner</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Primeros nombres</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Nomi</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Primeiros nomes</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_voornamen">
<xsl:if test="$parTaal = 'nederlands'">voornamen</xsl:if>
<xsl:if test="$parTaal = 'engels'">first names</xsl:if>
<xsl:if test="$parTaal = 'frans'">prénoms</xsl:if>
<xsl:if test="$parTaal = 'duits'">Vornamen</xsl:if>
<xsl:if test="$parTaal = 'fries'">foarnammen</xsl:if>
<xsl:if test="$parTaal = 'noors'">fornavner</xsl:if>
<xsl:if test="$parTaal = 'spaans'">primeros nombres</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">nomi</xsl:if>
<xsl:if test="$parTaal = 'portugees'">primeiros nomes</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_voornemen_geregistreerd_partner">
<xsl:if test="$parTaal = 'nederlands'">Zij hebben van hun voornemen om een geregistreerd partnerschap aan te gaan aangifte gedaan</xsl:if>
<xsl:if test="$parTaal = 'engels'">They registered their intention for a partnership</xsl:if>
<xsl:if test="$parTaal = 'frans'">Ils ont déclarés leur intention pour un pacs</xsl:if>
<xsl:if test="$parTaal = 'duits'">Sie haben Ihre Vereinbarung zum Zusammenleben registriert</xsl:if>
<xsl:if test="$parTaal = 'fries'">Sy hawwe fan har voornemen om in registrearre partnerschap oan te gean oanjefte dien</xsl:if>
<xsl:if test="$parTaal = 'noors'">De har sin intensjon om å inngå registrert partnerskap vil bli rapportert</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Tienen su intención de entrar en una asociación registrada será reportado</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Hanno la loro intenzione di concludere un partenariato registrato saranno riportati</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Eles têm a sua intenção de entrar em uma parceria registada serão relatados</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Vooroudercirkel">
<xsl:if test="$parTaal = 'nederlands'">Vooroudercirkel</xsl:if>
<xsl:if test="$parTaal = 'engels'">Ancestors circle</xsl:if>
<xsl:if test="$parTaal = 'frans'">Cercle d'ancêtres</xsl:if>
<xsl:if test="$parTaal = 'duits'">Urelternkreis</xsl:if>
<xsl:if test="$parTaal = 'fries'">Foarâlder rûnte</xsl:if>
<xsl:if test="$parTaal = 'noors'">Ane sirkel</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Círculo Ancestro</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Cerchio ascendenza</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Círculo ancestral</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_vooroudercirkel">
<xsl:if test="$parTaal = 'nederlands'">vooroudercirkel</xsl:if>
<xsl:if test="$parTaal = 'engels'">ancestors circle</xsl:if>
<xsl:if test="$parTaal = 'frans'">circle d'ancêtres</xsl:if>
<xsl:if test="$parTaal = 'duits'">Urelternkreis</xsl:if>
<xsl:if test="$parTaal = 'fries'">foarâlder rûnte</xsl:if>
<xsl:if test="$parTaal = 'noors'">ane sirkel</xsl:if>
<xsl:if test="$parTaal = 'spaans'">círculo Ancestro</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">cerchio ascendenza</xsl:if>
<xsl:if test="$parTaal = 'portugees'">círculo ancestral</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_vooroudercirkels">
<xsl:if test="$parTaal = 'nederlands'">vooroudercirkels</xsl:if>
<xsl:if test="$parTaal = 'engels'">ancestors circles</xsl:if>
<xsl:if test="$parTaal = 'frans'">circles d'ancêtres</xsl:if>
<xsl:if test="$parTaal = 'duits'">Urelternkreisen</xsl:if>
<xsl:if test="$parTaal = 'fries'">foarâlder rûnten</xsl:if>
<xsl:if test="$parTaal = 'noors'">ane sirkeler</xsl:if>
<xsl:if test="$parTaal = 'spaans'">círculos Ancestros</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">cerchii ascendenza</xsl:if>
<xsl:if test="$parTaal = 'portugees'">círculos ancestrals</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Vorige">
<xsl:if test="$parTaal = 'nederlands'">Vorige</xsl:if>
<xsl:if test="$parTaal = 'engels'">Previous</xsl:if>
<xsl:if test="$parTaal = 'frans'">Précédant</xsl:if>
<xsl:if test="$parTaal = 'duits'">Zurück</xsl:if>
<xsl:if test="$parTaal = 'fries'">Foariche</xsl:if>
<xsl:if test="$parTaal = 'noors'">Forrige</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Anterior</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Precedente</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Anterior</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_vorige">
<xsl:if test="$parTaal = 'nederlands'">vorige</xsl:if>
<xsl:if test="$parTaal = 'engels'">previous</xsl:if>
<xsl:if test="$parTaal = 'frans'">précédente</xsl:if>
<xsl:if test="$parTaal = 'duits'">zurück</xsl:if>
<xsl:if test="$parTaal = 'fries'">foariche</xsl:if>
<xsl:if test="$parTaal = 'noors'">forrige</xsl:if>
<xsl:if test="$parTaal = 'spaans'">anterior</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">precedente</xsl:if>
<xsl:if test="$parTaal = 'portugees'">anterior</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Vorige_foto">
<xsl:if test="$parTaal = 'nederlands'">Vorige foto</xsl:if>
<xsl:if test="$parTaal = 'engels'">Previous photo</xsl:if>
<xsl:if test="$parTaal = 'frans'">Photo précédente</xsl:if>
<xsl:if test="$parTaal = 'duits'">Vorphoto</xsl:if>
<xsl:if test="$parTaal = 'fries'">Foariche foto</xsl:if>
<xsl:if test="$parTaal = 'noors'">Forrige bilde</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Foto anterior</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Foto precedente</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Foto anterior</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Vrouw">
<xsl:if test="$parTaal = 'nederlands'">Vrouw</xsl:if>
<xsl:if test="$parTaal = 'engels'">Woman</xsl:if>
<xsl:if test="$parTaal = 'frans'">Femme</xsl:if>
<xsl:if test="$parTaal = 'duits'">Frau</xsl:if>
<xsl:if test="$parTaal = 'fries'">Frau</xsl:if>
<xsl:if test="$parTaal = 'noors'">Kvinne</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Mujer</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Donna</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Mulher</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_vrouw_legend">
<xsl:if test="$parTaal = 'nederlands'">(v)rouw</xsl:if>
<xsl:if test="$parTaal = 'engels'">(w)oman</xsl:if>
<xsl:if test="$parTaal = 'frans'">(f)emme</xsl:if>
<xsl:if test="$parTaal = 'duits'">(F)rau</xsl:if>
<xsl:if test="$parTaal = 'fries'">(f)rau</xsl:if>
<xsl:if test="$parTaal = 'noors'">(k)vinne</xsl:if>
<xsl:if test="$parTaal = 'spaans'">(m)</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">(d)</xsl:if>
<xsl:if test="$parTaal = 'portugees'">(m)</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_vrouw">
<xsl:if test="$parTaal = 'nederlands'">vrouw</xsl:if>
<xsl:if test="$parTaal = 'engels'">woman</xsl:if>
<xsl:if test="$parTaal = 'frans'">femme</xsl:if>
<xsl:if test="$parTaal = 'duits'">Frau</xsl:if>
<xsl:if test="$parTaal = 'fries'">frau</xsl:if>
<xsl:if test="$parTaal = 'noors'">kvinne</xsl:if>
<xsl:if test="$parTaal = 'spaans'">mujer</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">donna</xsl:if>
<xsl:if test="$parTaal = 'portugees'">mulher</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_vrouwelijkelijn">
<xsl:if test="$parTaal = 'nederlands'">vrouwelijke lijn</xsl:if>
<xsl:if test="$parTaal = 'engels'">female line</xsl:if>
<xsl:if test="$parTaal = 'frans'">ligne matrilinéaire</xsl:if>
<xsl:if test="$parTaal = 'duits'">weiblicher Linie</xsl:if>
<xsl:if test="$parTaal = 'fries'">froulike streek</xsl:if>
<xsl:if test="$parTaal = 'noors'">kvinnelig linje</xsl:if>
<xsl:if test="$parTaal = 'spaans'">línea femenina</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">linea femminile</xsl:if>
<xsl:if test="$parTaal = 'portugees'">linha feminina</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_vrouwen">
<xsl:if test="$parTaal = 'nederlands'">vrouwen</xsl:if>
<xsl:if test="$parTaal = 'engels'">women</xsl:if>
<xsl:if test="$parTaal = 'frans'">femmes</xsl:if>
<xsl:if test="$parTaal = 'duits'">Frauen</xsl:if>
<xsl:if test="$parTaal = 'fries'">froulju</xsl:if>
<xsl:if test="$parTaal = 'noors'">kvinner</xsl:if>
<xsl:if test="$parTaal = 'spaans'">mujeres</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">donne</xsl:if>
<xsl:if test="$parTaal = 'portugees'">mulheres</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Waaier">
<xsl:if test="$parTaal = 'nederlands'">Waaier</xsl:if>
<xsl:if test="$parTaal = 'engels'">Fan</xsl:if>
<xsl:if test="$parTaal = 'frans'">Évantail</xsl:if>
<xsl:if test="$parTaal = 'duits'">Fächer</xsl:if>
<xsl:if test="$parTaal = 'fries'">Waaier</xsl:if>
<xsl:if test="$parTaal = 'noors'">Vifte</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Abanico</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Ventáglio</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Leque</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_waaier">
<xsl:if test="$parTaal = 'nederlands'">waaier</xsl:if>
<xsl:if test="$parTaal = 'engels'">fan</xsl:if>
<xsl:if test="$parTaal = 'frans'">évantail</xsl:if>
<xsl:if test="$parTaal = 'duits'">Fächer</xsl:if>
<xsl:if test="$parTaal = 'fries'">waaier</xsl:if>
<xsl:if test="$parTaal = 'noors'">vifte</xsl:if>
<xsl:if test="$parTaal = 'spaans'">abanico</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">ventáglio</xsl:if>
<xsl:if test="$parTaal = 'portugees'">leque</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Weergave">
<xsl:if test="$parTaal = 'nederlands'">Weergave</xsl:if>
<xsl:if test="$parTaal = 'engels'">Display</xsl:if>
<xsl:if test="$parTaal = 'frans'">Ordre d'affichage</xsl:if>
<xsl:if test="$parTaal = 'duits'">Anzeige</xsl:if>
<xsl:if test="$parTaal = 'fries'">Werjaan</xsl:if>
<xsl:if test="$parTaal = 'noors'">Vis</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Vista</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Vista</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Vista</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Weergeven">
<xsl:if test="$parTaal = 'nederlands'">Weergeven</xsl:if>
<xsl:if test="$parTaal = 'engels'">Display</xsl:if>
<xsl:if test="$parTaal = 'frans'">Afficher</xsl:if>
<xsl:if test="$parTaal = 'duits'">Anzeigen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Werjaan</xsl:if>
<xsl:if test="$parTaal = 'noors'">Vis</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Vista</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Vista</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Vista</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Welkom">
<xsl:if test="$parTaal = 'nederlands'">Welkom</xsl:if>
<xsl:if test="$parTaal = 'engels'">Welcome</xsl:if>
<xsl:if test="$parTaal = 'frans'">Bienvenue</xsl:if>
<xsl:if test="$parTaal = 'duits'">Wilkommen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Wolkom</xsl:if>
<xsl:if test="$parTaal = 'noors'">Velkommen</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Bienvenida</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Benvenuti</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Bem-vindo</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Wetenschap">
<xsl:if test="$parTaal = 'nederlands'">Ter beschikking gesteld aan de wetenschap</xsl:if>
<xsl:if test="$parTaal = 'engels'">Disposed at medical science</xsl:if>
<xsl:if test="$parTaal = 'frans'">Don à la science</xsl:if>
<xsl:if test="$parTaal = 'duits'">Bereitgestellt zur medischen Wissenschaft</xsl:if>
<xsl:if test="$parTaal = 'fries'">Ter beskikking stelt oan de wittenskip</xsl:if>
<xsl:if test="$parTaal = 'noors'">Stilt til rådighet for vitenskapen</xsl:if>
<xsl:if test="$parTaal = 'spaans'">A disposición de la ciencia</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">A disposizione della scienza</xsl:if>
<xsl:if test="$parTaal = 'portugees'">A disposição da ciência</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Wijzigingsdatum">
<xsl:if test="$parTaal = 'nederlands'">Wijzigingsdatum</xsl:if>
<xsl:if test="$parTaal = 'engels'">Date of change</xsl:if>
<xsl:if test="$parTaal = 'frans'">Date de changé</xsl:if>
<xsl:if test="$parTaal = 'duits'">Änderungsdatum</xsl:if>
<xsl:if test="$parTaal = 'fries'">Wizigingsdatum</xsl:if>
<xsl:if test="$parTaal = 'noors'">Endringsdato</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Fecha de la modificación</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Data di modifica</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Data de modificação</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Willekeurig">
<xsl:if test="$parTaal = 'nederlands'">Willekeurig</xsl:if>
<xsl:if test="$parTaal = 'engels'">Random</xsl:if>
<xsl:if test="$parTaal = 'frans'">Au hasard</xsl:if>
<xsl:if test="$parTaal = 'duits'">Willkürlich</xsl:if>
<xsl:if test="$parTaal = 'fries'">Willekeurich</xsl:if>
<xsl:if test="$parTaal = 'noors'">Villekårlig</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Aleatoria</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Qualsiasi</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Aleatória</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Woonplaats">
<xsl:if test="$parTaal = 'nederlands'">Woonplaats</xsl:if>
<xsl:if test="$parTaal = 'engels'">Residence</xsl:if>
<xsl:if test="$parTaal = 'frans'">Domiciles</xsl:if>
<xsl:if test="$parTaal = 'duits'">Wohnorten</xsl:if>
<xsl:if test="$parTaal = 'fries'">Wenplak</xsl:if>
<xsl:if test="$parTaal = 'noors'">Bosted</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Residencia</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Residenza</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Residência</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_woonplaats">
<xsl:if test="$parTaal = 'nederlands'">woonplaats</xsl:if>
<xsl:if test="$parTaal = 'engels'">residence</xsl:if>
<xsl:if test="$parTaal = 'frans'">lieu de domicile</xsl:if>
<xsl:if test="$parTaal = 'duits'">Wohnorten</xsl:if>
<xsl:if test="$parTaal = 'fries'">wenplak</xsl:if>
<xsl:if test="$parTaal = 'noors'">bosted</xsl:if>
<xsl:if test="$parTaal = 'spaans'">residencia</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">residenza</xsl:if>
<xsl:if test="$parTaal = 'portugees'">residência</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Woonplaatsen">
<xsl:if test="$parTaal = 'nederlands'">Woonplaatsen</xsl:if>
<xsl:if test="$parTaal = 'engels'">Residences</xsl:if>
<xsl:if test="$parTaal = 'frans'">Lieux de domicile</xsl:if>
<xsl:if test="$parTaal = 'duits'">Wohnorte</xsl:if>
<xsl:if test="$parTaal = 'fries'">Wenplakken</xsl:if>
<xsl:if test="$parTaal = 'noors'">Bosteder</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Residencias</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Residenze</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Residências</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_woonplaatsen">
<xsl:if test="$parTaal = 'nederlands'">woonplaatsen</xsl:if>
<xsl:if test="$parTaal = 'engels'">residences</xsl:if>
<xsl:if test="$parTaal = 'frans'">lieux de domicile</xsl:if>
<xsl:if test="$parTaal = 'duits'">Wohnorte</xsl:if>
<xsl:if test="$parTaal = 'fries'">wenplakken</xsl:if>
<xsl:if test="$parTaal = 'noors'">bosteder</xsl:if>
<xsl:if test="$parTaal = 'spaans'">residencias</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">residenze</xsl:if>
<xsl:if test="$parTaal = 'portugees'">residências</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Zandloper">
<xsl:if test="$parTaal = 'nederlands'">Zandloper</xsl:if>
<xsl:if test="$parTaal = 'engels'">Hourglass</xsl:if>
<xsl:if test="$parTaal = 'frans'">Sablier</xsl:if>
<xsl:if test="$parTaal = 'duits'">Sanduhr</xsl:if>
<xsl:if test="$parTaal = 'fries'">Sânglês</xsl:if>
<xsl:if test="$parTaal = 'noors'">Timeglass</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Reloj de arena</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Clessidra</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Ampulheta</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_zandloper">
<xsl:if test="$parTaal = 'nederlands'">zandloper</xsl:if>
<xsl:if test="$parTaal = 'engels'">hourglass</xsl:if>
<xsl:if test="$parTaal = 'frans'">sablier</xsl:if>
<xsl:if test="$parTaal = 'duits'">Sanduhr</xsl:if>
<xsl:if test="$parTaal = 'fries'">sânglês</xsl:if>
<xsl:if test="$parTaal = 'noors'">timeglass</xsl:if>
<xsl:if test="$parTaal = 'spaans'">reloj de arena</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">clessidra</xsl:if>
<xsl:if test="$parTaal = 'portugees'">ampulheta</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Zij">
<xsl:if test="$parTaal = 'nederlands'">Zij</xsl:if>
<xsl:if test="$parTaal = 'engels'">She</xsl:if>
<xsl:if test="$parTaal = 'frans'">Elle</xsl:if>
<xsl:if test="$parTaal = 'duits'">Sie</xsl:if>
<xsl:if test="$parTaal = 'fries'">Sy</xsl:if>
<xsl:if test="$parTaal = 'noors'">Hun</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Ella</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Lei</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Ela</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_zij">
<xsl:if test="$parTaal = 'nederlands'">zij</xsl:if>
<xsl:if test="$parTaal = 'engels'">she</xsl:if>
<xsl:if test="$parTaal = 'frans'">elle</xsl:if>
<xsl:if test="$parTaal = 'duits'">sie</xsl:if>
<xsl:if test="$parTaal = 'fries'">sy</xsl:if>
<xsl:if test="$parTaal = 'noors'">hun</xsl:if>
<xsl:if test="$parTaal = 'spaans'">ella</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">lei</xsl:if>
<xsl:if test="$parTaal = 'portugees'">ela</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Zijn">
<xsl:if test="$parTaal = 'nederlands'">Zijn</xsl:if>
<xsl:if test="$parTaal = 'engels'">His</xsl:if>
<xsl:if test="$parTaal = 'frans'">Son</xsl:if>
<xsl:if test="$parTaal = 'duits'">Sein</xsl:if>
<xsl:if test="$parTaal = 'fries'">Syn></xsl:if>
<xsl:if test="$parTaal = 'noors'">Hans</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Su</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Suo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Sua</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_zijn">
<xsl:if test="$parTaal = 'nederlands'">zijn</xsl:if>
<xsl:if test="$parTaal = 'engels'">his</xsl:if>
<xsl:if test="$parTaal = 'frans'">son</xsl:if>
<xsl:if test="$parTaal = 'duits'">sein</xsl:if>
<xsl:if test="$parTaal = 'fries'">syn></xsl:if>
<xsl:if test="$parTaal = 'noors'">hans</xsl:if>
<xsl:if test="$parTaal = 'spaans'">su</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">suo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">sua</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_ZijnHaar">
<xsl:if test="$parTaal = 'nederlands'">Zijn/Haar</xsl:if>
<xsl:if test="$parTaal = 'engels'">His/Her</xsl:if>
<xsl:if test="$parTaal = 'frans'">Son/Sa</xsl:if>
<xsl:if test="$parTaal = 'duits'">Sein/Ihre</xsl:if>
<xsl:if test="$parTaal = 'fries'">Syn/har></xsl:if>
<xsl:if test="$parTaal = 'noors'">Hans/henne</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Su/el</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Suo/lui</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Sua/dela</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_zijnhaar">
<xsl:if test="$parTaal = 'nederlands'">zijn/haar</xsl:if>
<xsl:if test="$parTaal = 'engels'">his/her</xsl:if>
<xsl:if test="$parTaal = 'frans'">son/sa</xsl:if>
<xsl:if test="$parTaal = 'duits'">sein/ihre</xsl:if>
<xsl:if test="$parTaal = 'fries'">syn/har></xsl:if>
<xsl:if test="$parTaal = 'noors'">hans/henne</xsl:if>
<xsl:if test="$parTaal = 'spaans'">su/el</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">suo/lui</xsl:if>
<xsl:if test="$parTaal = 'portugees'">sua/dela</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Zoek">
<xsl:if test="$parTaal = 'nederlands'">Zoek</xsl:if>
<xsl:if test="$parTaal = 'engels'">Find</xsl:if>
<xsl:if test="$parTaal = 'frans'">Recherchez</xsl:if>
<xsl:if test="$parTaal = 'duits'">Absuchen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Sykje</xsl:if>
<xsl:if test="$parTaal = 'noors'">Søk</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Buscar</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Cerca</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Buscar</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Zoeken">
<xsl:if test="$parTaal = 'nederlands'">Zoeken</xsl:if>
<xsl:if test="$parTaal = 'engels'">Find</xsl:if>
<xsl:if test="$parTaal = 'frans'">Recherchez</xsl:if>
<xsl:if test="$parTaal = 'duits'">Absuchen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Sykje</xsl:if>
<xsl:if test="$parTaal = 'noors'">Søk</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Buscar</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Cerca</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Buscar</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_ZoekPersoon">
<xsl:if test="$parTaal = 'nederlands'">Zoek een persoon</xsl:if>
<xsl:if test="$parTaal = 'engels'">Find a person</xsl:if>
<xsl:if test="$parTaal = 'frans'">Recherchez une personne</xsl:if>
<xsl:if test="$parTaal = 'duits'">Ein Person absuchen</xsl:if>
<xsl:if test="$parTaal = 'fries'">Sykje in persoan</xsl:if>
<xsl:if test="$parTaal = 'noors'">Finn en person</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Buscar una persona</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Cerca una persona</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Buscar uma pessoa</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_zoekteksten">
<xsl:if test="$parTaal = 'nederlands'">zoekteksten</xsl:if>
<xsl:if test="$parTaal = 'engels'">search strings</xsl:if>
<xsl:if test="$parTaal = 'frans'">textes de recherche</xsl:if>
<xsl:if test="$parTaal = 'duits'">Suchtexten</xsl:if>
<xsl:if test="$parTaal = 'fries'">sykjeteksten</xsl:if>
<xsl:if test="$parTaal = 'noors'">søketeksten</xsl:if>
<xsl:if test="$parTaal = 'spaans'">cadenas de búsqueda</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">stringhe di ricerca</xsl:if>
<xsl:if test="$parTaal = 'portugees'">cadeias de pesquisa</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_zonder">
<xsl:if test="$parTaal = 'nederlands'">zonder</xsl:if>
<xsl:if test="$parTaal = 'engels'">without</xsl:if>
<xsl:if test="$parTaal = 'frans'">sans</xsl:if>
<xsl:if test="$parTaal = 'duits'">ohne</xsl:if>
<xsl:if test="$parTaal = 'fries'">sûnder</xsl:if>
<xsl:if test="$parTaal = 'noors'">uten</xsl:if>
<xsl:if test="$parTaal = 'spaans'">sin</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">senza</xsl:if>
<xsl:if test="$parTaal = 'portugees'">sem</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_zonder_moeder">
<xsl:if test="$parTaal = 'nederlands'">zonder moeder</xsl:if>
<xsl:if test="$parTaal = 'engels'">without mother</xsl:if>
<xsl:if test="$parTaal = 'frans'">orphelin de mère</xsl:if>
<xsl:if test="$parTaal = 'duits'">ohne Mutter</xsl:if>
<xsl:if test="$parTaal = 'fries'">sûnder mem</xsl:if>
<xsl:if test="$parTaal = 'noors'">uten mor</xsl:if>
<xsl:if test="$parTaal = 'spaans'">sin madre</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">senza madre</xsl:if>
<xsl:if test="$parTaal = 'portugees'">sem mãe</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_zonder_vader">
<xsl:if test="$parTaal = 'nederlands'">zonder vader</xsl:if>
<xsl:if test="$parTaal = 'engels'">without father</xsl:if>
<xsl:if test="$parTaal = 'frans'">orphelin de père</xsl:if>
<xsl:if test="$parTaal = 'duits'">ohne Vater</xsl:if>
<xsl:if test="$parTaal = 'fries'">sûnder heit</xsl:if>
<xsl:if test="$parTaal = 'noors'">uten far</xsl:if>
<xsl:if test="$parTaal = 'spaans'">sin padre</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">senza padre</xsl:if>
<xsl:if test="$parTaal = 'portugees'">sem pai</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Zoon">
<xsl:if test="$parTaal = 'nederlands'">Zoon</xsl:if>
<xsl:if test="$parTaal = 'engels'">Son</xsl:if>
<xsl:if test="$parTaal = 'frans'">Fils</xsl:if>
<xsl:if test="$parTaal = 'duits'">Sohn</xsl:if>
<xsl:if test="$parTaal = 'fries'">Soan</xsl:if>
<xsl:if test="$parTaal = 'noors'">Sønn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Hijo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Figlio</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Filho</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_zoon">
<xsl:if test="$parTaal = 'nederlands'">zoon</xsl:if>
<xsl:if test="$parTaal = 'engels'">son</xsl:if>
<xsl:if test="$parTaal = 'frans'">fils</xsl:if>
<xsl:if test="$parTaal = 'duits'">Sohn</xsl:if>
<xsl:if test="$parTaal = 'fries'">soan</xsl:if>
<xsl:if test="$parTaal = 'noors'">sønn</xsl:if>
<xsl:if test="$parTaal = 'spaans'">hijo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">figlio</xsl:if>
<xsl:if test="$parTaal = 'portugees'">filho</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Januari">
<xsl:if test="$parTaal = 'nederlands'">Januari</xsl:if>
<xsl:if test="$parTaal = 'engels'">January</xsl:if>
<xsl:if test="$parTaal = 'frans'">Janvier</xsl:if>
<xsl:if test="$parTaal = 'duits'">Januar</xsl:if>
<xsl:if test="$parTaal = 'fries'">Jannewaris</xsl:if>
<xsl:if test="$parTaal = 'noors'">Januar</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Enero</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Gennaio</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Janeiro</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Februari">
<xsl:if test="$parTaal = 'nederlands'">Februari</xsl:if>
<xsl:if test="$parTaal = 'engels'">February</xsl:if>
<xsl:if test="$parTaal = 'frans'">Février</xsl:if>
<xsl:if test="$parTaal = 'duits'">Februar</xsl:if>
<xsl:if test="$parTaal = 'fries'">Februari</xsl:if>
<xsl:if test="$parTaal = 'noors'">Februar</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Febrero</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Fevereiro</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Fevereiro</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Maart">
<xsl:if test="$parTaal = 'nederlands'">Maart</xsl:if>
<xsl:if test="$parTaal = 'engels'">March</xsl:if>
<xsl:if test="$parTaal = 'frans'">Mars</xsl:if>
<xsl:if test="$parTaal = 'duits'">März</xsl:if>
<xsl:if test="$parTaal = 'fries'">Maart</xsl:if>
<xsl:if test="$parTaal = 'noors'">Mars</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Marzo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Marzo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Março</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_April">
<xsl:if test="$parTaal = 'nederlands'">April</xsl:if>
<xsl:if test="$parTaal = 'engels'">April</xsl:if>
<xsl:if test="$parTaal = 'frans'">Avril</xsl:if>
<xsl:if test="$parTaal = 'duits'">April</xsl:if>
<xsl:if test="$parTaal = 'fries'">April</xsl:if>
<xsl:if test="$parTaal = 'noors'">April</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Abril</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Aprile</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Abril</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Mei">
<xsl:if test="$parTaal = 'nederlands'">Mei</xsl:if>
<xsl:if test="$parTaal = 'engels'">May</xsl:if>
<xsl:if test="$parTaal = 'frans'">Mai</xsl:if>
<xsl:if test="$parTaal = 'duits'">Mai</xsl:if>
<xsl:if test="$parTaal = 'fries'">Mei</xsl:if>
<xsl:if test="$parTaal = 'noors'">Mai</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Mayo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Maggio</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Maio</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Juni">
<xsl:if test="$parTaal = 'nederlands'">Juni</xsl:if>
<xsl:if test="$parTaal = 'engels'">June</xsl:if>
<xsl:if test="$parTaal = 'frans'">Juin</xsl:if>
<xsl:if test="$parTaal = 'duits'">Juni</xsl:if>
<xsl:if test="$parTaal = 'fries'">Juni</xsl:if>
<xsl:if test="$parTaal = 'noors'">Juni</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Junio</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Giungo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Junho</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Juli">
<xsl:if test="$parTaal = 'nederlands'">Juli</xsl:if>
<xsl:if test="$parTaal = 'engels'">July</xsl:if>
<xsl:if test="$parTaal = 'frans'">Juillet</xsl:if>
<xsl:if test="$parTaal = 'duits'">Juli</xsl:if>
<xsl:if test="$parTaal = 'fries'">Juli</xsl:if>
<xsl:if test="$parTaal = 'noors'">Juli</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Julio</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Luglio</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Julho</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Augustus">
<xsl:if test="$parTaal = 'nederlands'">Augustus</xsl:if>
<xsl:if test="$parTaal = 'engels'">August</xsl:if>
<xsl:if test="$parTaal = 'frans'">Août</xsl:if>
<xsl:if test="$parTaal = 'duits'">August</xsl:if>
<xsl:if test="$parTaal = 'fries'">Augustus</xsl:if>
<xsl:if test="$parTaal = 'noors'">August</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Augusto</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Agosto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Agosto</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_September">
<xsl:if test="$parTaal = 'nederlands'">September</xsl:if>
<xsl:if test="$parTaal = 'engels'">September</xsl:if>
<xsl:if test="$parTaal = 'frans'">Septembre</xsl:if>
<xsl:if test="$parTaal = 'duits'">September</xsl:if>
<xsl:if test="$parTaal = 'fries'">Septimber</xsl:if>
<xsl:if test="$parTaal = 'noors'">September</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Septiembre</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Settembre</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Setembro</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_Oktober">
<xsl:if test="$parTaal = 'nederlands'">Oktober</xsl:if>
<xsl:if test="$parTaal = 'engels'">October</xsl:if>
<xsl:if test="$parTaal = 'frans'">Octobre</xsl:if>
<xsl:if test="$parTaal = 'duits'">Oktober</xsl:if>
<xsl:if test="$parTaal = 'fries'">Oktober</xsl:if>
<xsl:if test="$parTaal = 'noors'">Oktober</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Octubre</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Ottobre</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Outubro</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_November">
<xsl:if test="$parTaal = 'nederlands'">November</xsl:if>
<xsl:if test="$parTaal = 'engels'">November</xsl:if>
<xsl:if test="$parTaal = 'frans'">Novembre</xsl:if>
<xsl:if test="$parTaal = 'duits'">November</xsl:if>
<xsl:if test="$parTaal = 'fries'">Novimber</xsl:if>
<xsl:if test="$parTaal = 'noors'">November</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Noviembre</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Novembre</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Novembro</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_December">
<xsl:if test="$parTaal = 'nederlands'">December</xsl:if>
<xsl:if test="$parTaal = 'engels'">December</xsl:if>
<xsl:if test="$parTaal = 'frans'">Decembre</xsl:if>
<xsl:if test="$parTaal = 'duits'">Dezember</xsl:if>
<xsl:if test="$parTaal = 'fries'">Desimber</xsl:if>
<xsl:if test="$parTaal = 'noors'">Desember</xsl:if>
<xsl:if test="$parTaal = 'spaans'">Diciembre</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Dicembre</xsl:if>
<xsl:if test="$parTaal = 'portugees'">Dezembro</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_januari">
<xsl:if test="$parTaal = 'nederlands'">januari</xsl:if>
<xsl:if test="$parTaal = 'engels'">January</xsl:if>
<xsl:if test="$parTaal = 'frans'">janvier</xsl:if>
<xsl:if test="$parTaal = 'duits'">Januar</xsl:if>
<xsl:if test="$parTaal = 'fries'">jannewaris</xsl:if>
<xsl:if test="$parTaal = 'noors'">januar</xsl:if>
<xsl:if test="$parTaal = 'spaans'">enero</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">gennaio</xsl:if>
<xsl:if test="$parTaal = 'portugees'">janeiro</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_februari">
<xsl:if test="$parTaal = 'nederlands'">februari</xsl:if>
<xsl:if test="$parTaal = 'engels'">February</xsl:if>
<xsl:if test="$parTaal = 'frans'">février</xsl:if>
<xsl:if test="$parTaal = 'duits'">Februar</xsl:if>
<xsl:if test="$parTaal = 'fries'">februari</xsl:if>
<xsl:if test="$parTaal = 'noors'">februar</xsl:if>
<xsl:if test="$parTaal = 'spaans'">febrero</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">fevereiro</xsl:if>
<xsl:if test="$parTaal = 'portugees'">fevereiro</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_maart">
<xsl:if test="$parTaal = 'nederlands'">maart</xsl:if>
<xsl:if test="$parTaal = 'engels'">March</xsl:if>
<xsl:if test="$parTaal = 'frans'">mars</xsl:if>
<xsl:if test="$parTaal = 'duits'">März</xsl:if>
<xsl:if test="$parTaal = 'fries'">maart</xsl:if>
<xsl:if test="$parTaal = 'noors'">mars</xsl:if>
<xsl:if test="$parTaal = 'spaans'">marzo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">marzo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">março</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_april">
<xsl:if test="$parTaal = 'nederlands'">april</xsl:if>
<xsl:if test="$parTaal = 'engels'">April</xsl:if>
<xsl:if test="$parTaal = 'frans'">avril</xsl:if>
<xsl:if test="$parTaal = 'duits'">April</xsl:if>
<xsl:if test="$parTaal = 'fries'">april</xsl:if>
<xsl:if test="$parTaal = 'noors'">april</xsl:if>
<xsl:if test="$parTaal = 'spaans'">abril</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">aprile</xsl:if>
<xsl:if test="$parTaal = 'portugees'">abril</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_mei">
<xsl:if test="$parTaal = 'nederlands'">mei</xsl:if>
<xsl:if test="$parTaal = 'engels'">May</xsl:if>
<xsl:if test="$parTaal = 'frans'">mai</xsl:if>
<xsl:if test="$parTaal = 'duits'">Mai</xsl:if>
<xsl:if test="$parTaal = 'fries'">mei</xsl:if>
<xsl:if test="$parTaal = 'noors'">mai</xsl:if>
<xsl:if test="$parTaal = 'spaans'">mayo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">maggio</xsl:if>
<xsl:if test="$parTaal = 'portugees'">maio</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_juni">
<xsl:if test="$parTaal = 'nederlands'">juni</xsl:if>
<xsl:if test="$parTaal = 'engels'">June</xsl:if>
<xsl:if test="$parTaal = 'frans'">juin</xsl:if>
<xsl:if test="$parTaal = 'duits'">Juni</xsl:if>
<xsl:if test="$parTaal = 'fries'">juni</xsl:if>
<xsl:if test="$parTaal = 'noors'">juni</xsl:if>
<xsl:if test="$parTaal = 'spaans'">junio</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">giungo</xsl:if>
<xsl:if test="$parTaal = 'portugees'">junho</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_juli">
<xsl:if test="$parTaal = 'nederlands'">juli</xsl:if>
<xsl:if test="$parTaal = 'engels'">July</xsl:if>
<xsl:if test="$parTaal = 'frans'">juillet</xsl:if>
<xsl:if test="$parTaal = 'duits'">Juli</xsl:if>
<xsl:if test="$parTaal = 'fries'">juli</xsl:if>
<xsl:if test="$parTaal = 'noors'">juli</xsl:if>
<xsl:if test="$parTaal = 'spaans'">julio</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">luglio</xsl:if>
<xsl:if test="$parTaal = 'portugees'">julho</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_augustus">
<xsl:if test="$parTaal = 'nederlands'">augustus</xsl:if>
<xsl:if test="$parTaal = 'engels'">August</xsl:if>
<xsl:if test="$parTaal = 'frans'">août</xsl:if>
<xsl:if test="$parTaal = 'duits'">August</xsl:if>
<xsl:if test="$parTaal = 'fries'">augustus</xsl:if>
<xsl:if test="$parTaal = 'noors'">august</xsl:if>
<xsl:if test="$parTaal = 'spaans'">augusto</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">agosto</xsl:if>
<xsl:if test="$parTaal = 'portugees'">agosto</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_september">
<xsl:if test="$parTaal = 'nederlands'">september</xsl:if>
<xsl:if test="$parTaal = 'engels'">September</xsl:if>
<xsl:if test="$parTaal = 'frans'">septembre</xsl:if>
<xsl:if test="$parTaal = 'duits'">September</xsl:if>
<xsl:if test="$parTaal = 'fries'">septimber</xsl:if>
<xsl:if test="$parTaal = 'noors'">september</xsl:if>
<xsl:if test="$parTaal = 'spaans'">septiembre</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">settembre</xsl:if>
<xsl:if test="$parTaal = 'portugees'">setembro</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_oktober">
<xsl:if test="$parTaal = 'nederlands'">oktober</xsl:if>
<xsl:if test="$parTaal = 'engels'">October</xsl:if>
<xsl:if test="$parTaal = 'frans'">octobre</xsl:if>
<xsl:if test="$parTaal = 'duits'">Oktober</xsl:if>
<xsl:if test="$parTaal = 'fries'">oktober</xsl:if>
<xsl:if test="$parTaal = 'noors'">oktober</xsl:if>
<xsl:if test="$parTaal = 'spaans'">octubre</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">ottobre</xsl:if>
<xsl:if test="$parTaal = 'portugees'">outubro</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_november">
<xsl:if test="$parTaal = 'nederlands'">november</xsl:if>
<xsl:if test="$parTaal = 'engels'">November</xsl:if>
<xsl:if test="$parTaal = 'frans'">novembre</xsl:if>
<xsl:if test="$parTaal = 'duits'">November</xsl:if>
<xsl:if test="$parTaal = 'fries'">novimber</xsl:if>
<xsl:if test="$parTaal = 'noors'">november</xsl:if>
<xsl:if test="$parTaal = 'spaans'">noviembre</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">novembre</xsl:if>
<xsl:if test="$parTaal = 'portugees'">novembro</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_december">
<xsl:if test="$parTaal = 'nederlands'">december</xsl:if>
<xsl:if test="$parTaal = 'engels'">December</xsl:if>
<xsl:if test="$parTaal = 'frans'">decembre</xsl:if>
<xsl:if test="$parTaal = 'duits'">Dezember</xsl:if>
<xsl:if test="$parTaal = 'fries'">desimber</xsl:if>
<xsl:if test="$parTaal = 'noors'">desember</xsl:if>
<xsl:if test="$parTaal = 'spaans'">diciembre</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">dicembre</xsl:if>
<xsl:if test="$parTaal = 'portugees'">dezembro</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_zondag">
<xsl:if test="$parTaal = 'nederlands'">zondag</xsl:if>
<xsl:if test="$parTaal = 'engels'">Sunday</xsl:if>
<xsl:if test="$parTaal = 'frans'">dimanche</xsl:if>
<xsl:if test="$parTaal = 'duits'">Sontag</xsl:if>
<xsl:if test="$parTaal = 'fries'">snein</xsl:if>
<xsl:if test="$parTaal = 'noors'">søndag</xsl:if>
<xsl:if test="$parTaal = 'spaans'">domingo</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">domenica</xsl:if>
<xsl:if test="$parTaal = 'portugees'">domingo</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_maandag">
<xsl:if test="$parTaal = 'nederlands'">maandag</xsl:if>
<xsl:if test="$parTaal = 'engels'">Monday</xsl:if>
<xsl:if test="$parTaal = 'frans'">lundi</xsl:if>
<xsl:if test="$parTaal = 'duits'">Montag</xsl:if>
<xsl:if test="$parTaal = 'fries'">moandei</xsl:if>
<xsl:if test="$parTaal = 'noors'">mandag</xsl:if>
<xsl:if test="$parTaal = 'spaans'">lunes</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">lunedi</xsl:if>
<xsl:if test="$parTaal = 'portugees'">segunda-feira</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_dinsdag">
<xsl:if test="$parTaal = 'nederlands'">dinsdag</xsl:if>
<xsl:if test="$parTaal = 'engels'">Tuesday</xsl:if>
<xsl:if test="$parTaal = 'frans'">mardi</xsl:if>
<xsl:if test="$parTaal = 'duits'">Dinnstag</xsl:if>
<xsl:if test="$parTaal = 'fries'">tiisdei</xsl:if>
<xsl:if test="$parTaal = 'noors'">tirsdag</xsl:if>
<xsl:if test="$parTaal = 'spaans'">martes</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">Martedì</xsl:if>
<xsl:if test="$parTaal = 'portugees'">terça-feira</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_woensdag">
<xsl:if test="$parTaal = 'nederlands'">woensdag</xsl:if>
<xsl:if test="$parTaal = 'engels'">Wednesday</xsl:if>
<xsl:if test="$parTaal = 'frans'">mercredi</xsl:if>
<xsl:if test="$parTaal = 'duits'">Mittwoch</xsl:if>
<xsl:if test="$parTaal = 'fries'">woansdei</xsl:if>
<xsl:if test="$parTaal = 'noors'">onsdag</xsl:if>
<xsl:if test="$parTaal = 'spaans'">miércoles</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">mercoledì</xsl:if>
<xsl:if test="$parTaal = 'portugees'">quarta-feira</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_donderdag">
<xsl:if test="$parTaal = 'nederlands'">donderdag</xsl:if>
<xsl:if test="$parTaal = 'engels'">Thursday</xsl:if>
<xsl:if test="$parTaal = 'frans'">jeudi</xsl:if>
<xsl:if test="$parTaal = 'duits'">Donnerstag</xsl:if>
<xsl:if test="$parTaal = 'fries'">tongersdei</xsl:if>
<xsl:if test="$parTaal = 'noors'">torsdag</xsl:if>
<xsl:if test="$parTaal = 'spaans'">jueves</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">giovedì</xsl:if>
<xsl:if test="$parTaal = 'portugees'">quinta-feira</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_vrijdag">
<xsl:if test="$parTaal = 'nederlands'">vrijdag</xsl:if>
<xsl:if test="$parTaal = 'engels'">Friday</xsl:if>
<xsl:if test="$parTaal = 'frans'">vendredi</xsl:if>
<xsl:if test="$parTaal = 'duits'">Freitag</xsl:if>
<xsl:if test="$parTaal = 'fries'">freed</xsl:if>
<xsl:if test="$parTaal = 'noors'">fredag</xsl:if>
<xsl:if test="$parTaal = 'spaans'">viernes</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">venerdi</xsl:if>
<xsl:if test="$parTaal = 'portugees'">sexta-feira</xsl:if>
</xsl:variable>
<xsl:variable name="Txt_zaterdag">
<xsl:if test="$parTaal = 'nederlands'">zaterdag</xsl:if>
<xsl:if test="$parTaal = 'engels'">Saterday</xsl:if>
<xsl:if test="$parTaal = 'frans'">samedi</xsl:if>
<xsl:if test="$parTaal = 'duits'">Samstag</xsl:if>
<xsl:if test="$parTaal = 'fries'">sneon</xsl:if>
<xsl:if test="$parTaal = 'noors'">lørdag</xsl:if>
<xsl:if test="$parTaal = 'spaans'">sábado</xsl:if>
<xsl:if test="$parTaal = 'italiaans'">sabato</xsl:if>
<xsl:if test="$parTaal = 'portugees'">sábado</xsl:if>
</xsl:variable>

<xsl:template name="Txt_wd">
  <xsl:param name="wd"></xsl:param>
  <xsl:choose>
    <xsl:when test="$wd = 'zo'">
      <xsl:if test="$parTaal = 'nederlands'">zo</xsl:if>
      <xsl:if test="$parTaal = 'engels'">su</xsl:if>
      <xsl:if test="$parTaal = 'frans'">dim</xsl:if>
      <xsl:if test="$parTaal = 'duits'">so</xsl:if>
      <xsl:if test="$parTaal = 'fries'">sn</xsl:if>
      <xsl:if test="$parTaal = 'noors'">sø</xsl:if>
      <xsl:if test="$parTaal = 'spaans'">do</xsl:if>
      <xsl:if test="$parTaal = 'italiaans'">do</xsl:if>
      <xsl:if test="$parTaal = 'portugees'">do</xsl:if>
    </xsl:when>
    <xsl:when test="$wd = 'ma'">
      <xsl:if test="$parTaal = 'nederlands'">ma</xsl:if>
      <xsl:if test="$parTaal = 'engels'">mo</xsl:if>
      <xsl:if test="$parTaal = 'frans'">lun</xsl:if>
      <xsl:if test="$parTaal = 'duits'">mo</xsl:if>
      <xsl:if test="$parTaal = 'fries'">mo</xsl:if>
      <xsl:if test="$parTaal = 'noors'">ma</xsl:if>
      <xsl:if test="$parTaal = 'spaans'">lu</xsl:if>
      <xsl:if test="$parTaal = 'italiaans'">lu</xsl:if>
      <xsl:if test="$parTaal = 'portugees'">se</xsl:if>
    </xsl:when>
    <xsl:when test="$wd = 'di'">
      <xsl:if test="$parTaal = 'nederlands'">di</xsl:if>
      <xsl:if test="$parTaal = 'engels'">tu</xsl:if>
      <xsl:if test="$parTaal = 'frans'">mar</xsl:if>
      <xsl:if test="$parTaal = 'duits'">di</xsl:if>
      <xsl:if test="$parTaal = 'fries'">ti</xsl:if>
      <xsl:if test="$parTaal = 'noors'">ti</xsl:if>
      <xsl:if test="$parTaal = 'spaans'">ma</xsl:if>
      <xsl:if test="$parTaal = 'italiaans'">ma</xsl:if>
      <xsl:if test="$parTaal = 'portugees'">te</xsl:if>
    </xsl:when>
    <xsl:when test="$wd = 'wo'">
      <xsl:if test="$parTaal = 'nederlands'">wo</xsl:if>
      <xsl:if test="$parTaal = 'engels'">we</xsl:if>
      <xsl:if test="$parTaal = 'frans'">mer</xsl:if>
      <xsl:if test="$parTaal = 'duits'">mi</xsl:if>
      <xsl:if test="$parTaal = 'fries'">wo</xsl:if>
      <xsl:if test="$parTaal = 'noors'">on</xsl:if>
      <xsl:if test="$parTaal = 'spaans'">mi</xsl:if>
      <xsl:if test="$parTaal = 'italiaans'">me</xsl:if>
      <xsl:if test="$parTaal = 'portugees'">qu</xsl:if>
    </xsl:when>
    <xsl:when test="$wd = 'do'">
      <xsl:if test="$parTaal = 'nederlands'">do</xsl:if>
      <xsl:if test="$parTaal = 'engels'">th</xsl:if>
      <xsl:if test="$parTaal = 'frans'">jeu</xsl:if>
      <xsl:if test="$parTaal = 'duits'">do</xsl:if>
      <xsl:if test="$parTaal = 'fries'">to</xsl:if>
      <xsl:if test="$parTaal = 'noors'">to</xsl:if>
      <xsl:if test="$parTaal = 'spaans'">ju</xsl:if>
      <xsl:if test="$parTaal = 'italiaans'">gi</xsl:if>
      <xsl:if test="$parTaal = 'portugees'">qu</xsl:if>
    </xsl:when>
    <xsl:when test="$wd = 'vr'">
      <xsl:if test="$parTaal = 'nederlands'">vr</xsl:if>
      <xsl:if test="$parTaal = 'engels'">fr</xsl:if>
      <xsl:if test="$parTaal = 'frans'">ven</xsl:if>
      <xsl:if test="$parTaal = 'duits'">fr</xsl:if>
      <xsl:if test="$parTaal = 'fries'">fr</xsl:if>
      <xsl:if test="$parTaal = 'noors'">fr</xsl:if>
      <xsl:if test="$parTaal = 'spaans'">vi</xsl:if>
      <xsl:if test="$parTaal = 'italiaans'">ve</xsl:if>
      <xsl:if test="$parTaal = 'portugees'">se</xsl:if>
    </xsl:when>
    <xsl:when test="$wd = 'za'">
      <xsl:if test="$parTaal = 'nederlands'">za</xsl:if>
      <xsl:if test="$parTaal = 'engels'">sa</xsl:if>
      <xsl:if test="$parTaal = 'frans'">sam</xsl:if>
      <xsl:if test="$parTaal = 'duits'">sa</xsl:if>
      <xsl:if test="$parTaal = 'fries'">sn</xsl:if>
      <xsl:if test="$parTaal = 'noors'">lø</xsl:if>
      <xsl:if test="$parTaal = 'spaans'">sá</xsl:if>
      <xsl:if test="$parTaal = 'italiaans'">sa</xsl:if>
      <xsl:if test="$parTaal = 'portugees'">sá</xsl:if>
    </xsl:when>
    <xsl:otherwise>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
 
<xsl:template name="Txt_instellingtitel">
    <xsl:if test="$parTaal = 'nederlands'">Vink de gewenste instellingen aan en <b>klik daarna op OK</b>.<br />Hierdoor worden de instellingen opgeslagen en wordt de vorige pagina getoond met de nieuwe instellingen.<br /></xsl:if>
    <xsl:if test="$parTaal = 'engels'">Tick the desired preferences and <b>then click OK</b>.<br />This will save the preferences; next the previous page will be displayed with the new preferences.<br /></xsl:if>
    <xsl:if test="$parTaal = 'frans'">Différentes options d'affichage peuvent être paramétrées. <br />Pour obtenir votre affichage désiré cochez la ou les cases correspondantes.<br /><b>Cliquez ensuite sur OK</b> pour confirmer et sauvegarder.<br /><br /></xsl:if>
    <xsl:if test="$parTaal = 'duits'">Kreuzen Sie die gewünschte Einstellungen an und <b>drücken Sie OK</b>.<br />Hierdurch werden die Einstellungen gespeichert und wird die vorherige Seite mit den neuen Einstellungen dargestellt.<br /></xsl:if>
</xsl:template>

<xsl:template name="Txt_sorteervolgorde">
   <xsl:param name="orde"></xsl:param>
   <xsl:variable name="Txt_orde">
      <xsl:if test="$parTaal = 'nederlands'">
        <xsl:if test="$orde = 'oplopend'">oplopend</xsl:if>
        <xsl:if test="$orde = 'aflopend'">aflopend</xsl:if>
      </xsl:if>
      <xsl:if test="$parTaal = 'engels'">
        <xsl:if test="$orde = 'oplopend'">ascending</xsl:if>
        <xsl:if test="$orde = 'aflopend'">descending</xsl:if>
      </xsl:if>
      <xsl:if test="$parTaal = 'frans'">
        <xsl:if test="$orde = 'oplopend'">dans l'ordre croissant</xsl:if>
        <xsl:if test="$orde = 'aflopend'">dans l'ordre décroissant</xsl:if>
      </xsl:if>
      <xsl:if test="$parTaal = 'duits'">
        <xsl:if test="$orde = 'oplopend'">steigend</xsl:if>
        <xsl:if test="$orde = 'aflopend'">sinkend</xsl:if>
      </xsl:if>
      <xsl:if test="$parTaal = 'fries'">
        <xsl:if test="$orde = 'oplopend'">oprinned</xsl:if>
        <xsl:if test="$orde = 'aflopend'">ôfrinned</xsl:if>
      </xsl:if>
      <xsl:if test="$parTaal = 'noors'">
        <xsl:if test="$orde = 'oplopend'">stigende</xsl:if>
        <xsl:if test="$orde = 'aflopend'">nedgående</xsl:if>
      </xsl:if>
      <xsl:if test="$parTaal = 'spaans'">
        <xsl:if test="$orde = 'oplopend'">ascendiente</xsl:if>
        <xsl:if test="$orde = 'aflopend'">descendiendo</xsl:if>
      </xsl:if>
      <xsl:if test="$parTaal = 'italiaans'">
        <xsl:if test="$orde = 'oplopend'">ascendente</xsl:if>
        <xsl:if test="$orde = 'aflopend'">discendente</xsl:if>
      </xsl:if>
      <xsl:if test="$parTaal = 'portugees'">
        <xsl:if test="$orde = 'oplopend'">ascendiente</xsl:if>
        <xsl:if test="$orde = 'aflopend'">descendente</xsl:if>
      </xsl:if>
   </xsl:variable>
      <xsl:if test="$parTaal = 'nederlands'">De lijst is <xsl:value-of select="$Txt_orde"/> gesorteerd op </xsl:if>
      <xsl:if test="$parTaal = 'engels'">The list is sorted in <xsl:value-of select="$Txt_orde"/> order by </xsl:if>
      <xsl:if test="$parTaal = 'frans'">La liste est arrangée <xsl:value-of select="$Txt_orde"/> du </xsl:if>
      <xsl:if test="$parTaal = 'duits'">Die Liste ist <xsl:value-of select="$Txt_orde"/> geordnet auf </xsl:if>
      <xsl:if test="$parTaal = 'fries'">De list is <xsl:value-of select="$Txt_orde"/> skifte op </xsl:if>
      <xsl:if test="$parTaal = 'noors'">Listen er sortert i <xsl:value-of select="$Txt_orde"/> </xsl:if>
      <xsl:if test="$parTaal = 'spaans'">La lista debe ser <xsl:value-of select="$Txt_orde"/> </xsl:if>
      <xsl:if test="$parTaal = 'italiaans'">L'elenco è ordinato in ordine <xsl:value-of select="$Txt_orde"/> </xsl:if>
      <xsl:if test="$parTaal = 'portugees'">A lista é ordenada em ordem <xsl:value-of select="$Txt_orde"/> </xsl:if>
</xsl:template>
 
<xsl:template name="Txt_overzichtshoofdregels">
   <xsl:param name="orde"></xsl:param>
   <xsl:param name="aantal"></xsl:param>
   <xsl:param name="overzichtstype_enkelvoud"></xsl:param>
   <xsl:param name="overzichtstype_meervoud"></xsl:param>
   <xsl:param name="overzichtstype_met"></xsl:param>
   <xsl:param name="sleutel"></xsl:param>
   <h2 align="center">
     <xsl:choose>
       <xsl:when test="$aantal = 0">
         <xsl:if test="$parTaal = 'nederlands'">Er zijn geen <xsl:value-of select="$overzichtstype_meervoud"/></xsl:if>
         <xsl:if test="$parTaal = 'engels'">There are no <xsl:value-of select="$overzichtstype_meervoud"/></xsl:if>
         <xsl:if test="$parTaal = 'frans'">Il n'y pas des <xsl:value-of select="$overzichtstype_meervoud"/></xsl:if>
         <xsl:if test="$parTaal = 'duits'">Es gibt keine <xsl:value-of select="$overzichtstype_meervoud"/></xsl:if>
         <xsl:if test="$parTaal = 'fries'">Der binne gjin <xsl:value-of select="$overzichtstype_meervoud"/></xsl:if>
         <xsl:if test="$parTaal = 'noors'">Det er ikke <xsl:value-of select="$overzichtstype_meervoud"/></xsl:if>
         <xsl:if test="$parTaal = 'spaans'">Sin <xsl:value-of select="$overzichtstype_meervoud"/></xsl:if>
         <xsl:if test="$parTaal = 'italiaans'">Nessuna <xsl:value-of select="$overzichtstype_meervoud"/></xsl:if>
         <xsl:if test="$parTaal = 'portugees'">Nenhuma <xsl:value-of select="$overzichtstype_meervoud"/></xsl:if>
       </xsl:when>
       <xsl:when test="$aantal = 1">
         <xsl:if test="$parTaal = 'nederlands'">Er is 1 <xsl:value-of select="$overzichtstype_enkelvoud"/> </xsl:if>
         <xsl:if test="$parTaal = 'engels'">There is 1 <xsl:value-of select="$overzichtstype_enkelvoud"/> </xsl:if>
         <xsl:if test="$parTaal = 'frans'">Il y a 1 <xsl:value-of select="$overzichtstype_enkelvoud"/></xsl:if>
         <xsl:if test="$parTaal = 'duits'">Es giebt eine <xsl:value-of select="$overzichtstype_enkelvoud"/></xsl:if>
         <xsl:if test="$parTaal = 'fries'">Er is 1 <xsl:value-of select="$overzichtstype_enkelvoud"/></xsl:if>
         <xsl:if test="$parTaal = 'noors'">Det har 1 <xsl:value-of select="$overzichtstype_enkelvoud"/></xsl:if>
         <xsl:if test="$parTaal = 'spaans'">Hay 1 <xsl:value-of select="$overzichtstype_enkelvoud"/></xsl:if>
         <xsl:if test="$parTaal = 'italiaans'">Vi è 1 <xsl:value-of select="$overzichtstype_enkelvoud"/></xsl:if>
         <xsl:if test="$parTaal = 'portugees'">Há sim 1 <xsl:value-of select="$overzichtstype_enkelvoud"/></xsl:if>
       </xsl:when>
       <xsl:otherwise>
         <xsl:value-of select="$Txt_Overzicht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_vande"/><xsl:text> </xsl:text><xsl:value-of select="$aantal"/><xsl:text> </xsl:text><xsl:value-of select="$overzichtstype_meervoud"/><xsl:text> </xsl:text>
       </xsl:otherwise>
   </xsl:choose>
   <xsl:value-of select="$overzichtstype_met"/>
  </h2>
  <xsl:if test="$aantal &gt; 1">
    <xsl:call-template name="Txt_sorteervolgorde">
      <xsl:with-param name="orde"><xsl:value-of select="$orde"/></xsl:with-param>
    </xsl:call-template>
    <xsl:value-of select="$sleutel"/>
    <br />
    <xsl:if test="$varStuurSorteersleutel=1">
       <xsl:value-of select="$Txt_Verandersorteer"/><br />
    </xsl:if>
  </xsl:if>
  <br />
</xsl:template>
 
<xsl:template name="Txt_Persoonskaartvoettekst">
  <xsl:param name="first"></xsl:param>
  <xsl:param name="nick"></xsl:param>
  <xsl:param name="pref"></xsl:param>
  <xsl:param name="surn"></xsl:param>
  <xsl:param name="link"></xsl:param>
  <xsl:param name="chg"></xsl:param>
  <xsl:param name="subject"></xsl:param>
  
  <xsl:if test="$parTaal = 'nederlands'">
    Deze kaart van
      <strong>
       <xsl:if test="string-length($first)>0"><xsl:value-of select="$first"/></xsl:if>
       <xsl:if test="string-length($first)=0"><xsl:value-of select="$nick"/></xsl:if>
       <xsl:if test="string-length($pref)>0"><xsl:text> </xsl:text><xsl:value-of select="$pref"/></xsl:if>
       <xsl:text> </xsl:text><xsl:value-of select="$surn"/>
     </strong>
     met interne code <strong><xsl:value-of select="$link"/></strong> is voor het laatst bijgewerkt op <normal class="nowrap"><xsl:value-of select="$chg"/></normal>.
     Heeft u aanvullende informatie of andere opmerkingen om de stamboom van de familie 
     <b>"<xsl:if test="string-length($refPrefix)>0"><xsl:value-of select="$refPrefix"/><xsl:value-of select="$nbsp"/></xsl:if><xsl:value-of select="$refAchternaam"/>"</b>
     te verbeteren, stuur deze informatie naar 
     <a href="mailto:{$refOwnerEMail}?subject={$subject}"><xsl:value-of select="$refOwner"/></a>.
     Graag de nieuwe en/of aangepaste informatie tezamen met bovenstaande naam en interne code aanleveren.
  </xsl:if>
  
  <xsl:if test="$parTaal = 'engels'">
    On <normal class="nowrap"><xsl:value-of select="$chg"/></normal> the latest update of this sheet of
      <strong>
        <xsl:if test="string-length($first)>0"><xsl:value-of select="$first"/></xsl:if>
        <xsl:if test="string-length($first)=0"><xsl:value-of select="$nick"/></xsl:if>
        <xsl:if test="string-length($pref)>0"><xsl:text> </xsl:text><xsl:value-of select="$pref"/></xsl:if>
        <xsl:text> </xsl:text><xsl:value-of select="$surn"/>
    </strong>
    <xsl:text>, with internal code </xsl:text><strong><xsl:value-of select="$link"/></strong>, took place.
    In case you might have additional information or other remarks to improve the
    <b>
      "<xsl:if test="string-length($refPrefix)>0"><xsl:value-of select="$refPrefix"/><xsl:value-of select="$nbsp"/></xsl:if><xsl:value-of select="$refAchternaam"/><xsl:text>'</xsl:text>
      <xsl:if test="substring($refAchternaam,string-length($refAchternaam),1) != 's'"><xsl:text>s</xsl:text></xsl:if>"
    </b>
    family tree, please send this information to
    <a href="mailto:{$refOwnerEMail}?subject={$subject}"><xsl:value-of select="$refOwner"/></a>.
    Please send the new and / or adjusted information together with the above mentioned name and internal code.
  </xsl:if>
  
  <xsl:if test="$parTaal = 'frans'">
    Cette fiche de
      <strong>
        <xsl:if test="string-length($first)>0"><xsl:value-of select="$first"/></xsl:if>
        <xsl:if test="string-length($first)=0"><xsl:value-of select="$nick"/></xsl:if>
        <xsl:if test="string-length($pref)>0"><xsl:text> </xsl:text><xsl:value-of select="$pref"/></xsl:if>
        <xsl:text> </xsl:text><xsl:value-of select="$surn"/>
      </strong>
      portant le code interne <strong><xsl:value-of select="$link"/></strong> a été mis à jour pour la dernière fois le <normal class="nowrap"><xsl:value-of select="$chg"/></normal>.
      Si vous avez de l'information complémentaire ou des remarques afin d’améliorer ou compléter l'arbre généalogique de la famille
      <b>"<xsl:if test="string-length($refPrefix)>0"><xsl:value-of select="$refPrefix"/><xsl:value-of select="$nbsp"/></xsl:if><xsl:value-of select="$refAchternaam"/>"</b>,
      , veuillez les envoyer s.v.p. par courriel à 
      <a href="mailto:{$refOwnerEMail}?subject={$subject}"><xsl:value-of select="$refOwner"/></a> 
      en mentionnant le nom ci-dessus et le code interne.
  </xsl:if>
  
  <xsl:if test="$parTaal = 'duits'">
    Diese Karte von
     <strong>
       <xsl:if test="string-length($first)>0"><xsl:value-of select="$first"/></xsl:if>
       <xsl:if test="string-length($first)=0"><xsl:value-of select="$nick"/></xsl:if>
       <xsl:if test="string-length($pref)>0"><xsl:text> </xsl:text><xsl:value-of select="$pref"/></xsl:if>
       <xsl:text> </xsl:text><xsl:value-of select="$surn"/>
     </strong>
     mit internen Code <strong><xsl:value-of select="$link"/></strong> wurde am <normal class="nowrap"><xsl:value-of select="$chg"/></normal> aktualisiert.
     Wenn Sie Zusatzinformationen oder weitere Bemerkungen zur Verbesserung des Stammbaums der Familien 
     <b>"<xsl:if test="string-length($refPrefix)>0"><xsl:value-of select="$refPrefix"/><xsl:value-of select="$nbsp"/></xsl:if><xsl:value-of select="$refAchternaam"/>"</b> haben,
     senden Sie bitte diese Informationen zu 
     <a href="mailto:{$refOwnerEMail}?subject={$subject}"><xsl:value-of select="$refOwner"/></a>.
     Bitte senden Sie die neue und / oder korrigierte Informationen zusammen mit den oben genannten Namen und dem internen Code.
  </xsl:if>
  
  <xsl:if test="$parTaal = 'fries'">
    Dizze kaart fan
      <strong>
       <xsl:if test="string-length($first)>0"><xsl:value-of select="$first"/></xsl:if>
       <xsl:if test="string-length($first)=0"><xsl:value-of select="$nick"/></xsl:if>
       <xsl:if test="string-length($pref)>0"><xsl:text> </xsl:text><xsl:value-of select="$pref"/></xsl:if>
       <xsl:text> </xsl:text><xsl:value-of select="$surn"/>
     </strong>
     mei ynterne koade <strong><xsl:value-of select="$link"/></strong> is foar it lêst bywurkt op <normal class="nowrap"><xsl:value-of select="$chg"/></normal>.
     Ha jo oanfullende ynformaasje of oare opmerkingen om de stambeam fan de famylje 
     <b>"<xsl:if test="string-length($refPrefix)>0"><xsl:value-of select="$refPrefix"/><xsl:value-of select="$nbsp"/></xsl:if><xsl:value-of select="$refAchternaam"/>"</b>
     te ferbetterje, stjoer dizze ynformaasje nei 
     <a href="mailto:{$refOwnerEMail}?subject={$subject}"><xsl:value-of select="$refOwner"/></a>.
     Graach de nije en/of oanpaste ynformaasje tegaerre mei boppesteande namme en ynterne koade oanleverje.
  </xsl:if>
  
  <xsl:if test="$parTaal = 'noors'">
    Dette kort av
      <strong>
       <xsl:if test="string-length($first)>0"><xsl:value-of select="$first"/></xsl:if>
       <xsl:if test="string-length($first)=0"><xsl:value-of select="$nick"/></xsl:if>
       <xsl:if test="string-length($pref)>0"><xsl:text> </xsl:text><xsl:value-of select="$pref"/></xsl:if>
       <xsl:text> </xsl:text><xsl:value-of select="$surn"/>
     </strong>
     med intern kode <strong><xsl:value-of select="$link"/></strong> er siste gangen oppdatert <normal class="nowrap"><xsl:value-of select="$chg"/></normal>.
     Hvis man har tilleggsinformasjon eller ander bemerkninger for å forbedre slektstreet, sendes de til 
     <a href="mailto:{$refOwnerEMail}?subject={$subject}"><xsl:value-of select="$refOwner"/></a>.
     Send helst ny og/eller opdatert informasjon sammen med navnet ovenfor samt intern koden.
  </xsl:if>
  
  <xsl:if test="$parTaal = 'spaans'">
    Este mapa de
      <strong>
       <xsl:if test="string-length($first)>0"><xsl:value-of select="$first"/></xsl:if>
       <xsl:if test="string-length($first)=0"><xsl:value-of select="$nick"/></xsl:if>
       <xsl:if test="string-length($pref)>0"><xsl:text> </xsl:text><xsl:value-of select="$pref"/></xsl:if>
       <xsl:text> </xsl:text><xsl:value-of select="$surn"/>
     </strong>
     con código interno <strong><xsl:value-of select="$link"/></strong> fue actualizada el <normal class="nowrap"><xsl:value-of select="$chg"/></normal>.
     Tiene usted información adicional u otros comentarios para mejorar el árbol genealógico, 
     enviar esta información a 
     <a href="mailto:{$refOwnerEMail}?subject={$subject}"><xsl:value-of select="$refOwner"/></a>.
     Por favor, envíe la información nueva y / o actualizada junto con el nombre arriba y código interno.
  </xsl:if>
  
  <xsl:if test="$parTaal = 'italiaans'">
    Questa mappa di
      <strong>
       <xsl:if test="string-length($first)>0"><xsl:value-of select="$first"/></xsl:if>
       <xsl:if test="string-length($first)=0"><xsl:value-of select="$nick"/></xsl:if>
       <xsl:if test="string-length($pref)>0"><xsl:text> </xsl:text><xsl:value-of select="$pref"/></xsl:if>
       <xsl:text> </xsl:text><xsl:value-of select="$surn"/>
     </strong>
     con codice interno <strong><xsl:value-of select="$link"/></strong> è stato aggiornato il <normal class="nowrap"><xsl:value-of select="$chg"/></normal>.
     Avete ulteriori informazioni o altre osservazioni per migliorare l'albero genealogico 
     <b>"<xsl:if test="string-length($refPrefix)>0"><xsl:value-of select="$refPrefix"/><xsl:value-of select="$nbsp"/></xsl:if><xsl:value-of select="$refAchternaam"/>"</b>
     trasmette queste informazioni al 
     <a href="mailto:{$refOwnerEMail}?subject={$subject}"><xsl:value-of select="$refOwner"/></a>.
     Si prega di inviare le informazioni nuove e / o aggiornate con il nome sopra e codice interno.
  </xsl:if>
  
  <xsl:if test="$parTaal = 'portugees'">
    O mapa de
      <strong>
       <xsl:if test="string-length($first)>0"><xsl:value-of select="$first"/></xsl:if>
       <xsl:if test="string-length($first)=0"><xsl:value-of select="$nick"/></xsl:if>
       <xsl:if test="string-length($pref)>0"><xsl:text> </xsl:text><xsl:value-of select="$pref"/></xsl:if>
       <xsl:text> </xsl:text><xsl:value-of select="$surn"/>
     </strong>
     com código interno <strong><xsl:value-of select="$link"/></strong> foi atualizado em <normal class="nowrap"><xsl:value-of select="$chg"/></normal>.
     Você tem alguma informação adicional ou outros comentários para melhorar a árvore genealógica
     <b>"<xsl:if test="string-length($refPrefix)>0"><xsl:value-of select="$refPrefix"/><xsl:value-of select="$nbsp"/></xsl:if><xsl:value-of select="$refAchternaam"/>"</b>
     enviar essas informações para 
     <a href="mailto:{$refOwnerEMail}?subject={$subject}"><xsl:value-of select="$refOwner"/></a>.
     Por favor envie a informação nova e / ou atualizado, juntamente com o nome acima e código interno.
  </xsl:if>
  
</xsl:template>

<xsl:template name="Txt_Wijziginstellingwaarschuwing">
  <xsl:if test="$parTaal = 'nederlands'">
    Let op: Het genereren van veel generaties kan lang duren.<br />
    Ook het maken van een grafisch overzicht duurt langer<br /> indien voor veel generaties wordt gekozen.
  </xsl:if>
  <xsl:if test="$parTaal = 'engels'">
    Note that report generation with many generations will take a long time.<br />
    Also the generation of a graphical report will take longer<br /> if the number of generations is large.
  </xsl:if>
  <xsl:if test="$parTaal = 'frans'">
    Attention: La production de beaucoup des générations peut être long.<br />
    Aussi la production d'une présentation graphique peut être plus longue<br /> si on opte pour plus de générations.
  </xsl:if>
  <xsl:if test="$parTaal = 'duits'">
    Achtung: Die Produktion vieler Generationen kann lang dauern.<br />
    Auch die Produktion einer graphischen Reportage wird länger dauern<br /> wenn viele Generationen selektiert sind.
  </xsl:if>
  <xsl:if test="$parTaal = 'fries'">
    Tink derom: It genereren fan soad generaasjes kin lang duorren.<br />
    Ek it meitsjen fan in grafisch oersjoch duorret langer<br /> as foar in soad generaasjes wurdt keazen.  
  </xsl:if>
  <xsl:if test="$parTaal = 'noors'">
    Merk: Generering mye kunne vare i generasjoner.<br />
    Også lage en grafisk oversikt varer lenger <br /> hvis valgt for mange generasjoner.
  </xsl:if>
  <xsl:if test="$parTaal = 'spaans'">
    Nota: La generación Cuánto podría durar por generaciones.<br />
    También haciendo un resumen gráfico dura más <br /> si es elegido por muchas generaciones.
  </xsl:if>
  <xsl:if test="$parTaal = 'italiaans'">
    Nota: Generazione molto potrebbe durare per generazioni.<br />
    Anche facendo una panoramica grafica dura più <br /> se scelto per molte generazioni.
  </xsl:if>
  <xsl:if test="$parTaal = 'portugees'">
    Nota: Gerando muito poderia durar por gerações.<br />
    Também fazendo um panorama gráfico dura mais tempo <br /> se escolhido por muitas gerações.
  </xsl:if>
</xsl:template>
 
</xsl:stylesheet>
