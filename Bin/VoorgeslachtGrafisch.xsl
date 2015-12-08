<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:user="http://www.adriedenblanken.nl/"
		version="1.0">
<!--
// <author>Paul Kallenberg</author>
// <file>$Workfile: VoorgeslachtGrafisch.xsl $</file><date>$Date: 2-12-13 16:06 $</date>
// <revision>$Revision: 10 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this
// header stays intact. No responsibility is accepted
// for use of this software.</disclaimer>
-->

<xsl:output method="html"/>

<xsl:include href="Header.xsl"/>
<xsl:include href="SvgHeader.xsl"/>
<xsl:include href="Talen.xsl"/>

<xsl:param name="HuidigPersoon"/>
<xsl:param name="Browser"/>
<xsl:param name="parIEGui"/>
<xsl:param name="Printing"/>
<xsl:param name="Key2"/>           <!-- (1) rechthoek uitgebreid    (2)  rechthoek compact  -->
<xsl:param name="parNrGeneraties"/> <!-- parNrGeneraties = aantal generaties; 0 voor geen beperking -->
<xsl:param name="parToonVoornaam"/>
<xsl:param name="parToonVoettekst"/>
<xsl:param name="parFotoAantal"/>
<xsl:param name="parRefOwner"/>
<xsl:param name="parRefOwnerEMail"/>
<xsl:param name="parToonKalender"/>
<xsl:param name="parStuurSorteersleutel"/>
<xsl:param name="parToonNieuws"/>
<xsl:param name="WeergaveCode">       <!-- compact (2), met foto's (1) of zonder (0) -->
  <xsl:if test="$Key2='2'">2</xsl:if>
  <xsl:if test="$Key2!=2">
  <xsl:choose>
    <xsl:when test="$parFotoAantal = '2' or $parFotoAantal = '3'">
      1
    </xsl:when>
    <xsl:otherwise>
      0
    </xsl:otherwise>
  </xsl:choose>
  </xsl:if>
</xsl:param>
<xsl:param name="parTaal"/>

<msxsl:script language="javascript" implements-prefix="user">
<![CDATA[
var nr_pers=0;
var nr_pers_strict=0;
var person_code=new Array();
var person_asce_nr=new Array();
var person_gen_nr=new Array();
var person_in_asc_set=new Array();
var person_in_asc_set_strict=new Array();
var person_sex=new Array();
var max_gen;
var nr_getekende_blokken = 0;
var gen_nr;
var gen_index;
var width_box;
var blok_hoogte;
var offset_y;
var offset_x = 150;
var width_line = 25;
var top=new Array();

function read_offset_y(n)
{
	if (1*n==2)
	{
		offset_y=150;
	}
	else
	{
		offset_y=150;
	}
	return "";
}

function read_blok_hoogte(n)
{
	if (1*n==0)
	{
		blok_hoogte=75;
	}
	else
	{
		if (1*n==1)
		{
			blok_hoogte=75;
		}
		else
		{
			blok_hoogte=20;
		}
	}
	return "";
}

function read_width_box(n)
{
	if (1*n==0)
	{
		width_box=200;
	}
	else
	{
		if (1*n==1)
		{
			width_box=300;
		}
		else
		{
			width_box=200;
		}
	}
	return "";
}

function code_ind(code)
{
	var i=1;
	while ((person_code[i] != 1*code) && (i<=nr_pers))
	{
		i++;
	}
	return i
}

function read_pers_asc_strict(code,gen_nr,asce_nr,sex)
{
// persoonscode hoeft niet uniek te zijn; asce_nr is dat wel; kwartierherhaling wordt nu getoond
//	if (code_ind(code)>nr_pers)
//	{
		nr_pers++;
		nr_pers_strict=nr_pers;
		person_code[nr_pers]=1*code;
		person_asce_nr[nr_pers]=1*asce_nr;
		person_gen_nr[nr_pers]=1*gen_nr;
		person_in_asc_set[nr_pers]=true;
		person_in_asc_set_strict[nr_pers]=true;
		person_sex[nr_pers]=sex;
//	}
	return ""
}

function bepaal_max_gen()
{
	var i;
	max_gen=0;
	for (i=1;i<=nr_pers;i++)
	{
		max_gen = Math.max(max_gen,person_gen_nr[i]);
	}
	return ""
}

function init_top()
{
	for (i=1;i<=max_gen;i++)
	{
		for (j=1;j<=Math.pow(2,i-1);j++)
		{
			top[(j-1)*max_gen+i]=0;
		}
	}
	return ""
}

function bereken_top_hoogtes()
{
	for (j=1;j<=Math.pow(2,max_gen-1);j++)
	{
		top[j*max_gen] = offset_x + (j-1)*(blok_hoogte + width_line/2)
	}
	for (i=max_gen-1;i>=1;i--)
	{
		for (j=1;j<=Math.pow(2,i-1);j++)
		{
			top[(j-1)*max_gen+i] = (top[(2*j-2)*max_gen+i+1] + top[(2*j-1)*max_gen+i+1])/2
		}
	}
	return ""
}

function begin_tabellen_maken()
{
	gen_nr=1;
	gen_index=1;
	return ""
}

function teken_volgend_blok()
{
	gen_index++;
	if (gen_index == Math.pow(2,gen_nr-1)+1)
	{
		gen_nr++;
		gen_index=1;
	}
	nr_getekende_blokken++;
	if (nr_getekende_blokken < Math.pow(2,max_gen) - 1)
		return true;
	else
		return false;
}

function write_width_box()
{
	return width_box
}

function write_blok_hoogte()
{
	return blok_hoogte
}

function write_top_coord()
{
	return top[(gen_index-1)*max_gen+gen_nr];
}

function write_left_coord()
{
	return (gen_nr-1)*(width_box + width_line) + offset_y;
}

function blok_link()
{
	var found=false;
	var link;
	for (i=1;i<=nr_pers;i++)
	{
		if (person_gen_nr[i]==gen_nr && person_asce_nr[i]==Math.pow(2,gen_nr-1)+gen_index-1)
		{
			found=true;
			link=i;
		}
	}
	if (found)
		return person_code[link];
	else
		return 0;
}

function father_link()
{
	var found=false;
	var link;
	for (i=1;i<=nr_pers;i++)
	{
		if (person_gen_nr[i]==(gen_nr+1) && person_asce_nr[i]==(2*(Math.pow(2,gen_nr-1)+gen_index-1)))
		{
			found=true;
			link=i;
		}
	}
	if (found)
		return person_code[link];
	else
		return 0;
}

function mother_link()
{
	var found=false;
	var link;
	for (i=1;i<=nr_pers;i++)
	{
		if (person_gen_nr[i]==(gen_nr+1) && person_asce_nr[i]==(2*(Math.pow(2,gen_nr-1)+gen_index-1))+1)
		{
			found=true;
			link=i;
		}
	}
	if (found)
		return person_code[link];
	else
		return 0;
}

function mvkleur(sex)
{
	if (gen_nr ==1)
	{
		if (sex=='M')
			return "grafisch-man"
		else
			if (sex == 'V')
				return "grafisch-vrouw"
				else
					return "grafisch-onbekend"
	}
	else
	{
		if (gen_index % 2)
			return "grafisch-man"
		else
			return "grafisch-vrouw"
	}
}

function write_max_top_coord()
{
		return (offset_x + top[Math.pow(2,max_gen-1)*max_gen] + blok_hoogte)
}

function write_max_left_coord()
{
		return (max_gen)*(width_box + width_line) + offset_y
}

]]>
</msxsl:script>

<xsl:template match="PERSONEN">

  <xsl:call-template name="ShowMenu"/>

 <xsl:if test="$Browser!='IE'">
   <xsl:value-of select="$Txt_geenbrowserondersteuning"/>
 </xsl:if>

 <xsl:if test="$Browser='IE'">
  <xsl:for-each select="PERSOON[@link=$HuidigPersoon]">
    <blockquote>
      <h2>
        <xsl:value-of select="$Txt_Voorgeslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text>
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
        <xsl:if test="$parNrGeneraties=0">
          <xsl:text> </xsl:text>(<xsl:value-of select="$Txt_alle"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_generaties"/>)
        </xsl:if>
        <xsl:if test="$parNrGeneraties>0">
          (<xsl:value-of select="$parNrGeneraties"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_generaties"/>)
        </xsl:if>
      </h2>
    </blockquote>
  </xsl:for-each>

  <xsl:value-of select="user:read_offset_y(string($WeergaveCode))"/>
  <xsl:value-of select="user:read_blok_hoogte(string($WeergaveCode))"/>
  <xsl:value-of select="user:read_width_box(string($WeergaveCode))"/>
  <xsl:for-each select="PERSOON[@link=$HuidigPersoon]">
   	<xsl:call-template name="VulAscSetStrict">
       	<xsl:with-param name="LinkVanDezePersoon"><xsl:value-of select="$HuidigPersoon"/></xsl:with-param>
       	<xsl:with-param name="GenNummer">1</xsl:with-param>
       	<xsl:with-param name="AsceNummer">1</xsl:with-param>
       	<xsl:with-param name="Sex"><xsl:value-of select="PERSONAL/@sex"/></xsl:with-param>
   	</xsl:call-template>
  </xsl:for-each>

  <xsl:value-of select="user:bepaal_max_gen()"/>
  <xsl:value-of select="user:begin_tabellen_maken()"/>
  <xsl:value-of select="user:init_top()"/>
  <xsl:value-of select="user:bereken_top_hoogtes()"/>
  
  <xsl:call-template name="MaakTabel">
	<xsl:with-param name="PersonLink"><xsl:value-of select="$HuidigPersoon"/></xsl:with-param>
  </xsl:call-template>
<!-- (Bijna) lege tabel rechts onder, om onder- en rechterzijkant goed zichtbaar te krijgen -->	
  <xsl:element name="table">
    <xsl:attribute name="style">
       	position: absolute; border: 0px solid black; border-spacing: 0;
           width: 10px;
           height:10px; 
           top:<xsl:value-of select="user:write_max_top_coord()"/>px;
           left: <xsl:value-of select="user:write_max_left_coord()"/>px
    </xsl:attribute>
    <tr>
      <td>
        <xsl:value-of select="$nbsp"/>
      </td>
    </tr>
  </xsl:element>
  
 </xsl:if> <!-- Browser=IE-test -->
	
</xsl:template>

<xsl:template name="VulAscSetStrict">
  <xsl:param name="LinkVanDezePersoon"/>
  <xsl:param name="GenNummer"/>
  <xsl:param name="AsceNummer"/>
  <xsl:param name="Sex"/>
	<xsl:variable name="NextGenNr">
        <xsl:value-of select="$GenNummer+1"/>
    </xsl:variable>
    <xsl:value-of select="user:read_pers_asc_strict(string($LinkVanDezePersoon),string($GenNummer),string($AsceNummer),string($Sex))"/>

	<xsl:if test="$GenNummer &lt; $parNrGeneraties or $parNrGeneraties = 0">
    <xsl:for-each select="//PERSONEN/PERSOON[@link=$LinkVanDezePersoon]">

        <xsl:for-each select="FATHER">
	     <xsl:if test="count(@type)=0">
          	<xsl:variable name="fathLink" select="@link"/>
            <xsl:call-template name="VulAscSetStrict">
              <xsl:with-param name="LinkVanDezePersoon">
              	<xsl:value-of select="@link"/>
              </xsl:with-param>
              <xsl:with-param name="GenNummer">
                <xsl:value-of select="$NextGenNr"/>
              </xsl:with-param>
              <xsl:with-param name="AsceNummer">
                <xsl:value-of select="2*$AsceNummer"/>
              </xsl:with-param>
              <xsl:with-param name="Sex">
              	<xsl:for-each select="//PERSONEN/PERSOON[@link=$fathLink]">
              		<xsl:value-of select="PERSONAL/@sex"/>
              	</xsl:for-each>
              </xsl:with-param>
            </xsl:call-template>
         </xsl:if>
        </xsl:for-each>
        <xsl:for-each select="MOTHER">
	     <xsl:if test="count(@type)=0">
	        <xsl:variable name="mothLink" select="@link"/>
            <xsl:call-template name="VulAscSetStrict">
              <xsl:with-param name="LinkVanDezePersoon">
              	<xsl:value-of select="@link"/>
              </xsl:with-param>
              <xsl:with-param name="GenNummer">
                <xsl:value-of select="$NextGenNr"/>
              </xsl:with-param>
              <xsl:with-param name="AsceNummer">
                <xsl:value-of select="2*$AsceNummer + 1"/>
              </xsl:with-param>
              <xsl:with-param name="Sex">
              	<xsl:for-each select="//PERSONEN/PERSOON[@link=$mothLink]">
              		<xsl:value-of select="PERSONAL/@sex"/>
              	</xsl:for-each>
              </xsl:with-param>
            </xsl:call-template>
         </xsl:if>
        </xsl:for-each>
  </xsl:for-each>
  </xsl:if>
  
</xsl:template>

<xsl:template name="MaakTabel">
  <xsl:param name="PersonLink"/>
    <xsl:element name="table">
      <xsl:attribute name="class">
    	<xsl:value-of select="user:mvkleur(string(//PERSOON[@link=$PersonLink]/PERSONAL/@sex))"/>
      </xsl:attribute>
      <xsl:attribute name="style">
       	position: absolute; border: 1px solid blue; border-spacing: 0;
		<xsl:if test="$WeergaveCode=2">
			table-layout:fixed;
		</xsl:if>
       	white-space: nowrap;
       	width: <xsl:value-of select="user:write_width_box()"/>px;
       	height:<xsl:value-of select="user:write_blok_hoogte()"/>px; 
       	top:<xsl:value-of select="user:write_top_coord()"/>px;
       	left: <xsl:value-of select="user:write_left_coord()"/>px
      </xsl:attribute>
	  <xsl:for-each select="//PERSOON[@link=$PersonLink]">
		<tr>
		  <xsl:if test="$WeergaveCode=1">
	      	<xsl:if test="//PERSOON[@link=$PersonLink]/PERSONAL/PHOTOS">
    	       	<xsl:for-each select="//PERSOON[@link=$PersonLink]/PERSONAL">
            		<xsl:for-each select="PHOTOS">
           				<td align="left" width="50">
           					<xsl:variable name="foto" select="PHOTO[position()=1]/@name"/>
                            <xsl:variable name="title">
                              <xsl:value-of select="PHOTO[position()=1]/@title"/>
                              <xsl:text> (</xsl:text>
                              <xsl:value-of select="$Txt_klik_voor_foto_in_apart_venster"/>
                              <xsl:text>)</xsl:text>
                            </xsl:variable>
               				<a href="javascript:OpenFoto('{$PersonLink}',0)" name="afbeelding"
               	     			onMouseOver = "window.status='Open foto'; return true;"
                   	 			onMouseOut  = "window.status='';"
                   				onMouseDown = "window.status='Open foto'; geenRechterMuis();">
                   				<img src="{$varFolderFotoAlbum}/{$foto}" title="{$title}" alt="{$foto}" name="afbeelding" height="70" border="0" bordercolor="black"/>
           					</a>
	           			</td>
    	       		</xsl:for-each>
            	</xsl:for-each>
			</xsl:if>
		  </xsl:if>
		  <td align="center" class="tbl-tekst" style="overflow:hidden">
           	<xsl:call-template name="KinShowPersoon">
              <xsl:with-param name="NAMEFIRST"><xsl:value-of select="PERSONAL/NAME/@first"/></xsl:with-param>
              <xsl:with-param name="NAMENICK"><xsl:value-of select="PERSONAL/NAME/@nick"/></xsl:with-param>
              <xsl:with-param name="NAMEPREF"><xsl:value-of select="PERSONAL/NAME/@pref"/></xsl:with-param>
              <xsl:with-param name="SURN"><xsl:value-of select="PERSONAL/NAME/@surn"/></xsl:with-param>
    	      <xsl:with-param name="BDATE">
    	        <xsl:if test="$WeergaveCode!=2">
	    	   	  <xsl:value-of select="concat(string(EVENTS/BIRTH/@onz),string(EVENTS/BIRTH/@date))"/>
	    	    </xsl:if>
    	      </xsl:with-param>
        	  <xsl:with-param name="DDATE">
    	       	<xsl:if test="$WeergaveCode!=2">
        	      <xsl:value-of select="concat(string(EVENTS/DEATH/@onz),string(EVENTS/DEATH/@date))"/>
	    	    </xsl:if>
        	  </xsl:with-param>
              <xsl:with-param name="src"><xsl:value-of select="@link"/></xsl:with-param>
              <xsl:with-param name="priv"><xsl:value-of select="@priv"/></xsl:with-param>
            </xsl:call-template>
		  </td>
    	  <xsl:if test="$WeergaveCode!=2">
			<td align="right">
			<xsl:variable name="TmpLinkF"><xsl:value-of select="user:father_link()"/></xsl:variable>
			<xsl:if test="$TmpLinkF != 0">
				<xsl:variable name="NaamVader">
					<xsl:call-template name="NaamPersoon">
					  <xsl:with-param name="src"><xsl:value-of select="$TmpLinkF"/></xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:element name="a">
					<xsl:attribute name="href">javascript:KiesXSL(29,<xsl:value-of select="$TmpLinkF"/>,'','$WeergaveCode');
					</xsl:attribute>
					<xsl:attribute name="onMouseOver">window.status='<xsl:value-of select="$Txt_Toon"/><xsl:value-of select="$nbsp"/><xsl:value-of select="$Txt_grafisch"/><xsl:value-of select="$nbsp"/><xsl:value-of select="$Txt_voorgeslacht"/><xsl:value-of select="$nbsp"/><xsl:value-of select="$Txt_vader"/><xsl:value-of select="$nbsp"/>(<xsl:value-of select="$NaamVader"/>)'; return true;
					</xsl:attribute>
					<xsl:attribute name="onMouseOut">window.status='';
					</xsl:attribute>
					<xsl:value-of select="substring($Txt_vader,1,1)"/>
				</xsl:element>
			</xsl:if>
			<xsl:if test="$TmpLinkF = 0"><xsl:value-of select="$nbsp"/></xsl:if>
			<br /><br /><br />
			<xsl:variable name="TmpLinkM"><xsl:value-of select="user:mother_link()"/></xsl:variable>
			<xsl:if test="$TmpLinkM != 0">
				<xsl:variable name="NaamMoeder">
					<xsl:call-template name="NaamPersoon">
					  <xsl:with-param name="src"><xsl:value-of select="$TmpLinkM"/></xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:element name="a">
					<xsl:attribute name="href">javascript:KiesXSL(29,<xsl:value-of select="$TmpLinkM"/>,'','$WeergaveCode');
					</xsl:attribute>
					<xsl:attribute name="onMouseOver">window.status='<xsl:value-of select="$Txt_Toon"/><xsl:value-of select="$nbsp"/><xsl:value-of select="$Txt_grafisch"/><xsl:value-of select="$nbsp"/><xsl:value-of select="$Txt_voorgeslacht"/><xsl:value-of select="$nbsp"/><xsl:value-of select="$Txt_moeder"/><xsl:value-of select="$nbsp"/>(<xsl:value-of select="$NaamMoeder"/>)'; return true;
					</xsl:attribute>
					<xsl:attribute name="onMouseOut">window.status='';
					</xsl:attribute>
					<xsl:value-of select="substring($Txt_moeder,1,1)"/>
				</xsl:element>
			</xsl:if>
			</td>
		  </xsl:if>
	    </tr>
	  </xsl:for-each>
    </xsl:element>
    <xsl:if test="user:teken_volgend_blok() = 'true'">
		<xsl:call-template name="MaakTabel">
			<xsl:with-param name="PersonLink"><xsl:value-of select="user:blok_link()"/></xsl:with-param>
		</xsl:call-template>
    </xsl:if>
</xsl:template>

<xsl:template name="KinShowPersoon">
	<xsl:param name="NAMEFIRST"></xsl:param>
	<xsl:param name="NAMENICK"></xsl:param>
	<xsl:param name="NAMEPREF"></xsl:param>
	<xsl:param name="SURN"></xsl:param>
	<xsl:param name="BDATE"/>
	<xsl:param name="DDATE"/>
	<xsl:param name="src"></xsl:param>
	<xsl:param name="priv"></xsl:param>

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
          <xsl:choose>
            <!-- pak de eerste naam van de voornamen -->
            <xsl:when test="string-length(substring-before($NAMEFIRST,' ')) != 0">
              <xsl:value-of select="substring-before($NAMEFIRST,' ')"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$NAMEFIRST"/>
            </xsl:otherwise>
          </xsl:choose>
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

    <xsl:if test="$priv = 1">
    	<xsl:value-of select="$hyperName"/>
    </xsl:if>
    <xsl:if test="string-length($priv) = 0">
      <a href="javascript:ToonPersoonsKaart('{$src}')"
    	onMouseOver = "window.status='{$Txt_Bekijk_Persoonskaart} {$hyperNameNoQuote}'; return true;"
    	onMouseOut  = "window.status='';"
    	>
    	<xsl:value-of select="$hyperName"/>
      </a>
    </xsl:if>
	<xsl:if test="$WeergaveCode!=2">
    	<br/>
    </xsl:if>
    <xsl:if test="string-length($BDATE) != 0">
    	<xsl:text>* </xsl:text><xsl:value-of select="$BDATE"/>
    </xsl:if>
    <br />
    <xsl:if test="string-length($DDATE) != 0">
    	<xsl:value-of select="$dagger"/><xsl:text> </xsl:text><xsl:value-of select="$DDATE"/>
    </xsl:if>
</xsl:template>

<xsl:template name="NaamPersoon">
	<xsl:param name="src"></xsl:param>
	
	<xsl:variable name="NAMENICK">
		<xsl:for-each select="//PERSOON[@link=$src]">
			<xsl:value-of select="PERSONAL/NAME/@nick"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="NAMEFIRST">
		<xsl:for-each select="//PERSOON[@link=$src]">
			<xsl:value-of select="PERSONAL/NAME/@first"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="NAMEPREF">
		<xsl:for-each select="//PERSOON[@link=$src]">
			<xsl:value-of select="PERSONAL/NAME/@pref"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="SURN">
		<xsl:for-each select="//PERSOON[@link=$src]">
			<xsl:value-of select="PERSONAL/NAME/@surn"/>
		</xsl:for-each>
	</xsl:variable>

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
          <xsl:choose>
            <!-- pak de eerste naam van de voornamen -->
            <xsl:when test="string-length(substring-before($NAMEFIRST,' ')) != 0">
              <xsl:value-of select="substring-before($NAMEFIRST,' ')"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$NAMEFIRST"/>
            </xsl:otherwise>
          </xsl:choose>
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

   	<xsl:value-of select="$hyperNameNoQuote"/>
</xsl:template>

</xsl:stylesheet>
