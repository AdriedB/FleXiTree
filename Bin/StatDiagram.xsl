<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:user="http://www.adriedenblanken.nl/"
		version="1.0">
<!--
// <author>Paul Kallenberg</author>
// <file>$Workfile: StatDiagram.xsl $</file><date>$Date: 24-02-13 13:44 $</date>
// <revision>$Revision: 12 $</revision><release>1.0</release>
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
<xsl:param name="LijstWoord"/>
<xsl:param name="Key2"/>
<xsl:param name="parToonVoornaam"/>
<xsl:param name="parToonVoettekst"/>
<xsl:param name="parRefOwner"/>
<xsl:param name="parRefOwnerEMail"/>
<xsl:param name="parToonKalender"/>
<xsl:param name="parStuurSorteersleutel"/>
<xsl:param name="parToonNieuws"/>
<xsl:param name="parNrGeneraties"/>
<xsl:param name="parTaal"/>

<msxsl:script language="javascript" implements-prefix="user">
<![CDATA[
var legend=new Array();
var nr_class=13;
var nr_pers_arr=new Array();
var nr_y;
var x_width;
var y_as_int=new Array();
var y_hoogte = 300;
var y_nr_class;
var y_tot;
var y=new Array();

var nr_pers=0;
var nr_pers_strict=0;
var person_code=new Array();
var person_gen_nr=new Array();
var person_in_asc_set=new Array();
var person_in_asc_set_strict=new Array();
var person_in_desc_set=new Array();
var person_in_desc_set_strict=new Array();
var person_sex=new Array();

function code_ind(code)
{
	var i=1;
	while ((person_code[i] != 1*code) && (i<=nr_pers))
	{
		i++;
	}
	return i
}

function read_pers_asc_strict(code,gen_nr,sex)
{
	if (code_ind(code)>nr_pers)
	{
		nr_pers++;
		nr_pers_strict=nr_pers;
		person_code[nr_pers]=1*code;
		person_gen_nr[nr_pers]=1*gen_nr;
		person_in_asc_set[nr_pers]=true;
		person_in_asc_set_strict[nr_pers]=true;
		person_sex[nr_pers]=sex;
	}
	return ""
}

function read_pers_desc_strict(code,gen_nr,sex)
{
	if (code_ind(code)>nr_pers)
	{
		nr_pers++;
		nr_pers_strict=nr_pers;
		person_code[nr_pers]=1*code;
		person_gen_nr[nr_pers]=1*gen_nr;
		person_in_desc_set[nr_pers]=true;
		person_in_desc_set_strict[nr_pers]=true;
		person_sex[nr_pers]=sex;
	}
	return ""
}

function pers_in_asc_set_strict(code)
{
	return (code_ind(code)<=nr_pers);
}

function pers_in_desc_set_strict(code)
{
	return (code_ind(code)<=nr_pers);
}

function y_gen_man()
{
	var i;
	for (i=1;i<=nr_pers;i++)
	{
		y[i]=0;
	}
	for (i=1;i<=nr_pers;i++)
	{
		if (person_sex[i]=="M")
		{
			y[person_gen_nr[i]]++;
		}
	}
	y_nr_class=nr_pers;
	while ((y[y_nr_class]==0) && (y_nr_class>1))
	{
		y_nr_class--;
	}
	for (i=1;i<=y_nr_class;i++)
	{
		legend[i]=i;
	}
	return "";
}

function y_gen_vrouw()
{
	var i;
	for (i=1;i<=nr_pers;i++)
	{
		y[i]=0;
	}
	for (i=1;i<=nr_pers;i++)
	{
		if (person_sex[i]=="V")
		{
			y[person_gen_nr[i]]++;
		}
	}
	y_nr_class=nr_pers;
	while ((y[y_nr_class]==0) && (y_nr_class>1))
	{
		y_nr_class--;
	}
	for (i=1;i<=y_nr_class;i++)
	{
		legend[i]=i;
	}
	return "";
}

function y_gen_tot()
{
	var i;
	for (i=1;i<=nr_pers;i++)
	{
		y[i]=0;
	}
	for (i=1;i<=nr_pers;i++)
	{
		y[person_gen_nr[i]]++;
	}
	y_nr_class=nr_pers;
	while ((y[y_nr_class]==0) && (y_nr_class>1))
	{
		y_nr_class--;
	}
	for (i=1;i<=y_nr_class;i++)
	{
		legend[i]=i;
	}
	return "";
}

function init()
{
	var i;
	var j;
	var k;
	
	for (i=1;i<=3;i++)
	{
		for (j=1;j<=2;j++)
		{
			for (k=1;k<=nr_class;k++)
			{
				nr_pers_arr[(i-1)*2*nr_class + (j-1)*nr_class + k]=0;
			}
		}
	}
	return "";
}

function read_pers(age_inp,sex,death,stil)
{
	var i;
	var j;
	var k;
	var n;
	var age;
	
	if (age_inp.indexOf("?")==-1)
	{
	n=age_inp.indexOf("of");
	if (n==-1)
	{
		age=age_inp;
	}
	else
	{
		age=age_inp.substr(0,n);
	}
	
	if (sex=="M")
	{
		i=1;
	}
	else
	{
		if (sex=="V")
		{
			i=2;
		}
		else
			{
				i=3;
			}
	}
	
	if (death=="D")
	{
		j=1;
	}
	else
	{
		j=2;
	}
	
	if ((1*stil)==1)
	{
		k=1;
	}
	else
	{
		if (age=="onbekend")
		{
			k=nr_class;
		}
		else
		{
			if ((1*age)==0)
			{
				k=2;
			}
			else
			{
				if ((1*age)>90)
				{
					k=12;
				}
				else
				{
					k=Math.floor((1*age-1)/10)+3;
				}
			}
		}
	}
	nr_pers_arr[(i-1)*2*nr_class + (j-1)*nr_class + k]++;
	}
	return "";
}

function read_txt_levenloos(levenloos)
{
	txt_levenloos = levenloos;
	return "";
}

function y_death_man()
{
	var k;
	
	y_nr_class=nr_class-1;
	for (k=1;k<nr_class;k++)
	{
		y[k] = nr_pers_arr[k];
	}
	legend[1]=txt_levenloos
	legend[2]="<1"
	legend[3]="1-10"
	legend[4]="11-20"
	legend[5]="21-30"
	legend[6]="31-40"
	legend[7]="41-50"
	legend[8]="51-60"
	legend[9]="61-70"
	legend[10]="71-80"
	legend[11]="81-90"
	legend[12]=">90"
	return "";
}

function y_death_vrouw()
{
	var k;
	
	y_nr_class=nr_class-1;
	for (k=1;k<nr_class;k++)
	{
		y[k] = nr_pers_arr[2*nr_class + k];
	}
	legend[1]=txt_levenloos
	legend[2]="<1"
	legend[3]="1-10"
	legend[4]="11-20"
	legend[5]="21-30"
	legend[6]="31-40"
	legend[7]="41-50"
	legend[8]="51-60"
	legend[9]="61-70"
	legend[10]="71-80"
	legend[11]="81-90"
	legend[12]=">90"
	return "";
}

function y_death_tot()
{
	var k;
	
	y_nr_class=nr_class-1;
	for (k=1;k<nr_class;k++)
	{
		y[k] = nr_pers_arr[k] + nr_pers_arr[2*nr_class + k] + nr_pers_arr[2*2*nr_class + k];
	}
	legend[1]=txt_levenloos
	legend[2]="<1"
	legend[3]="1-10"
	legend[4]="11-20"
	legend[5]="21-30"
	legend[6]="31-40"
	legend[7]="41-50"
	legend[8]="51-60"
	legend[9]="61-70"
	legend[10]="71-80"
	legend[11]="81-90"
	legend[12]=">90"
	return "";
}

function y_living_man()
{
	var k;
	
	y_nr_class=nr_class-3;
	for (k=1;k<nr_class;k++)
	{
		y[k] = nr_pers_arr[1*nr_class + k];
	}
	y[1]=y[2]+y[3];
	for (k=2;k<=y_nr_class;k++)
	{
		y[k] = y[k+2];
	}
	legend[1]="0-10"
	legend[2]="11-20"
	legend[3]="21-30"
	legend[4]="31-40"
	legend[5]="41-50"
	legend[6]="51-60"
	legend[7]="61-70"
	legend[8]="71-80"
	legend[9]="81-90"
	legend[10]=">90"
	return "";
}

function y_living_vrouw()
{
	var k;
	
	y_nr_class=nr_class-3;
	for (k=1;k<nr_class;k++)
	{
		y[k] = nr_pers_arr[2*nr_class + 1*nr_class + k];
	}
	y[1]=y[2]+y[3];
	for (k=2;k<=y_nr_class;k++)
	{
		y[k] = y[k+2];
	}
	legend[1]="0-10"
	legend[2]="11-20"
	legend[3]="21-30"
	legend[4]="31-40"
	legend[5]="41-50"
	legend[6]="51-60"
	legend[7]="61-70"
	legend[8]="71-80"
	legend[9]="81-90"
	legend[10]=">90"
	return "";
}

function y_living_tot()
{
	var k;
	
	y_nr_class=nr_class-3;
	for (k=1;k<nr_class;k++)
	{
		y[k] = nr_pers_arr[1*nr_class + k] + nr_pers_arr[2*nr_class + 1*nr_class + k] + nr_pers_arr[2*2*nr_class + 1*nr_class + k];
	}
	y[1]=y[2]+y[3];
	for (k=2;k<=y_nr_class;k++)
	{
		y[k] = y[k+2];
	}
	legend[1]="0-10"
	legend[2]="11-20"
	legend[3]="21-30"
	legend[4]="31-40"
	legend[5]="41-50"
	legend[6]="51-60"
	legend[7]="61-70"
	legend[8]="71-80"
	legend[9]="81-90"
	legend[10]=">90"
	return "";
}

function calculations()
{
	var data_max;
	var i;
	var k;
	var nr_y_or = 5;
	var x_breedte = 600;
	var y_factor;
	
	y_tot=0;
	data_max=y[1]
	for (k=1;k<=y_nr_class;k++)
	{
		y_tot = y_tot + y[k];
		data_max=Math.max(data_max,y[k]);
	}
	
	if ((data_max>=1) && (data_max<=5))
	{
		y_max = Math.max(2,data_max)
		nr_y = y_max
	}
	else
	{
		if (data_max>=6)
		{
			y_max = (Math.floor((data_max-1)/(nr_y_or))+1) * nr_y_or;
			nr_y = nr_y_or;
		}
		else
		{
			nr_y = nr_y_or;
			y_max = 0;
		}
	}
	
	y_factor = y_hoogte;
	if (y_max > 0)
	{
		y_factor = Math.floor(y_factor / y_max);
	}
	for (i=1;i<=nr_y;i++)
	{
		y_as_int[i] = Math.floor(y_max * i / nr_y);
	}
	
	x_width = Math.floor(x_breedte / y_nr_class);
	
	return ""
}

function write_y_nr_class(i)
{
	return y_nr_class+i;
}

function write_y_tot()
{
	return y_tot;
}

function write_y_as_hoogte()
{
	return Math.floor(y_hoogte/nr_y);
}

function write_y_as_halve_hoogte()
{
	return Math.floor(y_hoogte/nr_y/2);
}

function write_y_as_int(i)
{
	return y_as_int[i];
}

function write_nr_y()
{
	return nr_y;
}

function write_x_width()
{
	return x_width;
}

function write_x_hoogte(k)
{
	if (y_max > 0)
	{
		return Math.floor(y[k]*y_hoogte/y_max);
	}
	else
	{
		return "0";
	}
}

function write_legend(i)
{
	return legend[i];
}

function write_y(i)
{
	return y[i];
}

]]>
</msxsl:script>

<xsl:template match="PERSONEN">

  <xsl:call-template name="ShowMenu"/>

<xsl:if test="$Browser!='IE'">
  <xsl:value-of select="$Txt_geenbrowserondersteuning"/>
</xsl:if>

<xsl:if test="$Browser='IE'">
  
  <xsl:if test="$LijstWoord='voorgeslacht'">
<!-- Bepaal de voorouders van de hoofdpersoon -->
	<xsl:for-each select="PERSOON[@link=$HuidigPersoon]">
    	<xsl:call-template name="VulAscSetStrict">
        	<xsl:with-param name="LinkVanDezePersoon"><xsl:value-of select="$HuidigPersoon"/></xsl:with-param>
        	<xsl:with-param name="GenNummer">1</xsl:with-param>
        	<xsl:with-param name="Sex"><xsl:value-of select="PERSONAL/@sex"/></xsl:with-param>
      	</xsl:call-template>
	</xsl:for-each>
  </xsl:if>
	
  <xsl:if test="$LijstWoord='nageslacht'">

<!-- Bepaal de directe afstammelingen van de hoofdpersoon -->
	<xsl:for-each select="PERSOON[@link=$HuidigPersoon]">
    	<xsl:call-template name="VulDescSetStrict">
        	<xsl:with-param name="LinkVanDezePersoon"><xsl:value-of select="$HuidigPersoon"/></xsl:with-param>
        	<xsl:with-param name="GenNummer">1</xsl:with-param>
        	<xsl:with-param name="Sex"><xsl:value-of select="PERSONAL/@sex"/></xsl:with-param>
      	</xsl:call-template>
	</xsl:for-each>
  </xsl:if>
	
	<xsl:variable name="naam">
		<xsl:for-each select="PERSOON[@link=$HuidigPersoon]">
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
		</xsl:for-each>
	</xsl:variable>
	
	<xsl:value-of select="user:init()"/> 
	<xsl:value-of select="user:read_txt_levenloos(string($Txt_levenloos))"/> 
	<xsl:for-each select="PERSOON">
		<xsl:if test="$LijstWoord='geheel'">
			<xsl:call-template name="ReadPers"/>
		</xsl:if>
		<xsl:if test="$LijstWoord='nageslacht'">
			<xsl:if test="user:pers_in_desc_set_strict(string(@link))">
				<xsl:call-template name="ReadPers"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="$LijstWoord='voorgeslacht'">
			<xsl:if test="user:pers_in_asc_set_strict(string(@link))">
				<xsl:call-template name="ReadPers"/>
			</xsl:if>
		</xsl:if>
	</xsl:for-each>
	
  <xsl:if test="$Key2='histogram'">
	<xsl:value-of select="user:y_death_man()"/>
	<xsl:value-of select="user:calculations()"/>
	<xsl:call-template name="MaakGrafiek">
		<xsl:with-param name="Titel1">
		  <xsl:value-of select="$Txt_Aantal"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_overledenmannen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_hun"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_bereikteleeftijd"/>
		</xsl:with-param>
		<xsl:with-param name="Titel2">
			<xsl:if test="$LijstWoord='geheel'">
				<xsl:value-of select="$Txt_Gehele"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_bestand"/><xsl:text> </xsl:text>(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_overleden"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_man"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_mannen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
			<xsl:if test="$LijstWoord='nageslacht'">
				<xsl:value-of select="$Txt_Nageslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_overleden"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_man"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_mannen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
			<xsl:if test="$LijstWoord='voorgeslacht'">
				<xsl:value-of select="$Txt_Voorgeslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_overleden"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_man"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_mannen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
		</xsl:with-param>
		<xsl:with-param name="Titel3">----><xsl:text> </xsl:text><xsl:value-of select="$Txt_Bereikteleeftijd"/></xsl:with-param>
		<xsl:with-param name="color">man</xsl:with-param>
		<xsl:with-param name="nr_class">12</xsl:with-param>
	</xsl:call-template>
	<br></br>
	<br></br>
	  	
	<xsl:value-of select="user:y_death_vrouw()"/>
	<xsl:value-of select="user:calculations()"/>
	<xsl:call-template name="MaakGrafiek">
		<xsl:with-param name="Titel1">
		  <xsl:value-of select="$Txt_Aantal"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_overledenvrouwen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_hun"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_bereikteleeftijd"/>
		</xsl:with-param>
		<xsl:with-param name="Titel2">
			<xsl:if test="$LijstWoord='geheel'">
				<xsl:value-of select="$Txt_Gehele"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_bestand"/><xsl:text> </xsl:text>(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_overleden"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_vrouw"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_vrouwen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
			<xsl:if test="$LijstWoord='nageslacht'">
				<xsl:value-of select="$Txt_Nageslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_overleden"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_vrouw"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_vrouwen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
			<xsl:if test="$LijstWoord='voorgeslacht'">
				<xsl:value-of select="$Txt_Voorgeslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_overleden"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_vrouw"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_vrouwen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
		</xsl:with-param>
		<xsl:with-param name="Titel3">----><xsl:text> </xsl:text><xsl:value-of select="$Txt_Bereikteleeftijd"/></xsl:with-param>
		<xsl:with-param name="color">vrouw</xsl:with-param>
		<xsl:with-param name="nr_class">12</xsl:with-param>
	</xsl:call-template>
	<br></br>
	<br></br>
	  	
	<xsl:value-of select="user:y_death_tot()"/>
	<xsl:value-of select="user:calculations()"/>
	<xsl:call-template name="MaakGrafiek">
		<xsl:with-param name="Titel1">
		  <xsl:value-of select="$Txt_Aantal"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_overledenpersonen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_hun"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_bereikteleeftijd"/>
		</xsl:with-param>
		<xsl:with-param name="Titel2">
			<xsl:if test="$LijstWoord='geheel'">
				<xsl:value-of select="$Txt_Gehele"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_bestand"/><xsl:text> </xsl:text>(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_overleden"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_persoon"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_personen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
			<xsl:if test="$LijstWoord='nageslacht'">
				<xsl:value-of select="$Txt_Nageslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_overleden"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_persoon"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_personen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
			<xsl:if test="$LijstWoord='voorgeslacht'">
				<xsl:value-of select="$Txt_Voorgeslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_overleden"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_persoon"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_personen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
		</xsl:with-param>
		<xsl:with-param name="Titel3">----><xsl:text> </xsl:text><xsl:value-of select="$Txt_Bereikteleeftijd"/></xsl:with-param>
		<xsl:with-param name="color">totaal</xsl:with-param>
		<xsl:with-param name="nr_class">12</xsl:with-param>
	</xsl:call-template>
	<br></br>
	<br></br>

	<xsl:value-of select="user:y_living_man()"/>
	<xsl:value-of select="user:calculations()"/>
	<xsl:call-template name="MaakGrafiek">
		<xsl:with-param name="Titel1">
		  <xsl:value-of select="$Txt_Aantal"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_levendemannen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_hun"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_huidigeleeftijd"/>
		</xsl:with-param>
		<xsl:with-param name="Titel2">
			<xsl:if test="$LijstWoord='geheel'">
				<xsl:value-of select="$Txt_Gehele"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_bestand"/><xsl:text> </xsl:text>(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_levende"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_man"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_mannen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
			<xsl:if test="$LijstWoord='nageslacht'">
				<xsl:value-of select="$Txt_Nageslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_levende"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_man"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_mannen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
			<xsl:if test="$LijstWoord='voorgeslacht'">
				<xsl:value-of select="$Txt_Voorgeslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_levende"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_man"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_mannen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
		</xsl:with-param>
		<xsl:with-param name="Titel3">----><xsl:text> </xsl:text><xsl:value-of select="$Txt_Huidigeleeftijd"/></xsl:with-param>
		<xsl:with-param name="color">man</xsl:with-param>
		<xsl:with-param name="nr_class">10</xsl:with-param>
	</xsl:call-template>
	<br></br>
	<br></br>
	  	
	<xsl:value-of select="user:y_living_vrouw()"/>
	<xsl:value-of select="user:calculations()"/>
	<xsl:call-template name="MaakGrafiek">
		<xsl:with-param name="Titel1">
		  <xsl:value-of select="$Txt_Aantal"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_levendevrouwen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_hun"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_huidigeleeftijd"/>
		</xsl:with-param>
		<xsl:with-param name="Titel2">
			<xsl:if test="$LijstWoord='geheel'">
				<xsl:value-of select="$Txt_Gehele"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_bestand"/><xsl:text> </xsl:text>(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_levende"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_vrouw"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_vrouwen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
			<xsl:if test="$LijstWoord='nageslacht'">
				<xsl:value-of select="$Txt_Nageslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_levende"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_vrouw"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_vrouwen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
			<xsl:if test="$LijstWoord='voorgeslacht'">
				<xsl:value-of select="$Txt_Voorgeslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_levende"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_vrouw"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_vrouwen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
		</xsl:with-param>
		<xsl:with-param name="Titel3">----><xsl:text> </xsl:text><xsl:value-of select="$Txt_Huidigeleeftijd"/></xsl:with-param>
		<xsl:with-param name="color">vrouw</xsl:with-param>
		<xsl:with-param name="nr_class">10</xsl:with-param>
	</xsl:call-template>
	<br></br>
	<br></br>
	  	
	<xsl:value-of select="user:y_living_tot()"/>
	<xsl:value-of select="user:calculations()"/>
	<xsl:call-template name="MaakGrafiek">
		<xsl:with-param name="Titel1">
		  <xsl:value-of select="$Txt_Aantal"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_levendepersonen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_hun"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_huidigeleeftijd"/>
		</xsl:with-param>
		<xsl:with-param name="Titel2">
			<xsl:if test="$LijstWoord='geheel'">
				<xsl:value-of select="$Txt_Gehele"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_bestand"/><xsl:text> </xsl:text>(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_levende"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_persoon"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_personen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
			<xsl:if test="$LijstWoord='nageslacht'">
				<xsl:value-of select="$Txt_Nageslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_levende"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_persoon"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_personen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
			<xsl:if test="$LijstWoord='voorgeslacht'">
				<xsl:value-of select="$Txt_Voorgeslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_levende"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_persoon"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_personen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
		</xsl:with-param>
		<xsl:with-param name="Titel3">----><xsl:text> </xsl:text><xsl:value-of select="$Txt_Huidigeleeftijd"/></xsl:with-param>
		<xsl:with-param name="color">totaal</xsl:with-param>
		<xsl:with-param name="nr_class">10</xsl:with-param>
	</xsl:call-template>
	<br></br>
	<br></br>
	
	<xsl:if test="$LijstWoord='nageslacht' or $LijstWoord='voorgeslacht'">
		<xsl:value-of select="user:y_gen_man()"/>
		<xsl:value-of select="user:calculations()"/>
		<xsl:call-template name="MaakGrafiek">
		<xsl:with-param name="Titel1">
		  <xsl:value-of select="$Txt_Aantal"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_mannen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_perby"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_generatie"/>
		</xsl:with-param>
			<xsl:with-param name="Titel2">
				<xsl:if test="$LijstWoord='nageslacht'">
				  <xsl:value-of select="$Txt_Nageslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				  (<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_man"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_mannen"/></xsl:if>)
				</xsl:if>
				<xsl:if test="$LijstWoord='voorgeslacht'">
				  <xsl:value-of select="$Txt_Voorgeslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				  (<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_man"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_mannen"/></xsl:if>)
				</xsl:if>
			</xsl:with-param>
			<xsl:with-param name="Titel3">----><xsl:text> </xsl:text><xsl:value-of select="$Txt_Generatie"/></xsl:with-param>
			<xsl:with-param name="color">man</xsl:with-param>
			<xsl:with-param name="nr_class"><xsl:value-of select="user:write_y_nr_class(0)"/></xsl:with-param>
		</xsl:call-template>
		<br></br>
		<br></br>
	
		<xsl:value-of select="user:y_gen_vrouw()"/>
		<xsl:value-of select="user:calculations()"/>
		<xsl:call-template name="MaakGrafiek">
		<xsl:with-param name="Titel1">
		  <xsl:value-of select="$Txt_Aantal"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_vrouwen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_perby"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_generatie"/>
		</xsl:with-param>
			<xsl:with-param name="Titel2">
				<xsl:if test="$LijstWoord='nageslacht'">
				  <xsl:value-of select="$Txt_Nageslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				  (<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_vrouw"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_vrouwen"/></xsl:if>)
				</xsl:if>
				<xsl:if test="$LijstWoord='voorgeslacht'">
				  <xsl:value-of select="$Txt_Voorgeslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				  (<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_vrouw"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_vrouwen"/></xsl:if>)
				</xsl:if>
			</xsl:with-param>
			<xsl:with-param name="Titel3">----><xsl:text> </xsl:text><xsl:value-of select="$Txt_Generatie"/></xsl:with-param>
			<xsl:with-param name="color">vrouw</xsl:with-param>
			<xsl:with-param name="nr_class"><xsl:value-of select="user:write_y_nr_class(0)"/></xsl:with-param>
		</xsl:call-template>
		<br></br>
		<br></br>
	
		<xsl:value-of select="user:y_gen_tot()"/>
		<xsl:value-of select="user:calculations()"/>
		<xsl:call-template name="MaakGrafiek">
		<xsl:with-param name="Titel1">
		  <xsl:value-of select="$Txt_Aantal"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_personen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_perby"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_generatie"/>
		</xsl:with-param>
			<xsl:with-param name="Titel2">
				<xsl:if test="$LijstWoord='nageslacht'">
				  <xsl:value-of select="$Txt_Nageslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				  (<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_persoon"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_personen"/></xsl:if>)
				</xsl:if>
				<xsl:if test="$LijstWoord='voorgeslacht'">
				  <xsl:value-of select="$Txt_Voorgeslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				  (<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_persoon"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_personen"/></xsl:if>)
				</xsl:if>
			</xsl:with-param>
			<xsl:with-param name="Titel3">----><xsl:text> </xsl:text><xsl:value-of select="$Txt_Generatie"/></xsl:with-param>
			<xsl:with-param name="color">totaal</xsl:with-param>
			<xsl:with-param name="nr_class"><xsl:value-of select="user:write_y_nr_class(0)"/></xsl:with-param>
		</xsl:call-template>
		<br></br>
		<br></br>
	</xsl:if>
  </xsl:if> <!-- Historgrammen -->
  
  <xsl:if test="$Key2='tabel'">	
	<xsl:value-of select="user:y_death_man()"/>
	<xsl:value-of select="user:calculations()"/>
	<xsl:call-template name="MaakTabel">
		<xsl:with-param name="Titel1">
		  <xsl:value-of select="$Txt_Aantal"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_overledenmannen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_hun"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_bereikteleeftijd"/>
		</xsl:with-param>
		<xsl:with-param name="Titel2">
			<xsl:if test="$LijstWoord='geheel'">
				<xsl:value-of select="$Txt_Gehele"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_bestand"/><xsl:text> </xsl:text>(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_overleden"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_man"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_mannen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
			<xsl:if test="$LijstWoord='nageslacht'">
				<xsl:value-of select="$Txt_Nageslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_overleden"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_man"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_mannen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
			<xsl:if test="$LijstWoord='voorgeslacht'">
				<xsl:value-of select="$Txt_Voorgeslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_overleden"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_man"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_mannen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
		</xsl:with-param>
		<xsl:with-param name="Titel3"><xsl:value-of select="$Txt_Bereikteleeftijd"/></xsl:with-param>
		<xsl:with-param name="nr_class">12</xsl:with-param>
	</xsl:call-template>
	<br></br>
	<br></br>
	  	
	  	
	<xsl:value-of select="user:y_death_vrouw()"/>
	<xsl:value-of select="user:calculations()"/>
	<xsl:call-template name="MaakTabel">
		<xsl:with-param name="Titel1">
		  <xsl:value-of select="$Txt_Aantal"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_overledenvrouwen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_hun"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_bereikteleeftijd"/>
		</xsl:with-param>
		<xsl:with-param name="Titel2">
			<xsl:if test="$LijstWoord='geheel'">
				<xsl:value-of select="$Txt_Gehele"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_bestand"/><xsl:text> </xsl:text>(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_overleden"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_vrouw"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_vrouwen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
			<xsl:if test="$LijstWoord='nageslacht'">
				<xsl:value-of select="$Txt_Nageslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_overleden"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_vrouw"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_vrouwen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
			<xsl:if test="$LijstWoord='voorgeslacht'">
				<xsl:value-of select="$Txt_Voorgeslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_overleden"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_vrouw"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_vrouwen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
		</xsl:with-param>
		<xsl:with-param name="Titel3"><xsl:value-of select="$Txt_Bereikteleeftijd"/></xsl:with-param>
		<xsl:with-param name="nr_class">12</xsl:with-param>
	</xsl:call-template>
	<br></br>
	<br></br>
	  	
	<xsl:value-of select="user:y_death_tot()"/>
	<xsl:value-of select="user:calculations()"/>
	<xsl:call-template name="MaakTabel">
		<xsl:with-param name="Titel1">
		  <xsl:value-of select="$Txt_Aantal"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_overledenpersonen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_hun"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_bereikteleeftijd"/>
		</xsl:with-param>
		<xsl:with-param name="Titel2">
			<xsl:if test="$LijstWoord='geheel'">
				<xsl:value-of select="$Txt_Gehele"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_bestand"/><xsl:text> </xsl:text>(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_overleden"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_persoon"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_personen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
			<xsl:if test="$LijstWoord='nageslacht'">
				<xsl:value-of select="$Txt_Nageslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_overleden"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_persoon"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_personen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
			<xsl:if test="$LijstWoord='voorgeslacht'">
				<xsl:value-of select="$Txt_Voorgeslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_overleden"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_persoon"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_personen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
		</xsl:with-param>
		<xsl:with-param name="Titel3"><xsl:value-of select="$Txt_Bereikteleeftijd"/></xsl:with-param>
		<xsl:with-param name="nr_class">12</xsl:with-param>
	</xsl:call-template>
	<br></br>
	<br></br>

	<xsl:value-of select="user:y_living_man()"/>
	<xsl:value-of select="user:calculations()"/>
	<xsl:call-template name="MaakTabel">
		<xsl:with-param name="Titel1">
		  <xsl:value-of select="$Txt_Aantal"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_levendemannen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_hun"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_huidigeleeftijd"/>
		</xsl:with-param>
		<xsl:with-param name="Titel2">
			<xsl:if test="$LijstWoord='geheel'">
				<xsl:value-of select="$Txt_Gehele"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_bestand"/><xsl:text> </xsl:text>(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_levende"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_man"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_mannen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
			<xsl:if test="$LijstWoord='nageslacht'">
				<xsl:value-of select="$Txt_Nageslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_levende"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_man"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_mannen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
			<xsl:if test="$LijstWoord='voorgeslacht'">
				<xsl:value-of select="$Txt_Voorgeslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_levende"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_man"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_mannen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
		</xsl:with-param>
		<xsl:with-param name="Titel3"><xsl:value-of select="$Txt_Huidigeleeftijd"/></xsl:with-param>
		<xsl:with-param name="nr_class">10</xsl:with-param>
	</xsl:call-template>
	<br></br>
	<br></br>
	  	
	<xsl:value-of select="user:y_living_vrouw()"/>
	<xsl:value-of select="user:calculations()"/>
	<xsl:call-template name="MaakTabel">
		<xsl:with-param name="Titel1">
		  <xsl:value-of select="$Txt_Aantal"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_levendevrouwen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_hun"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_huidigeleeftijd"/>
		</xsl:with-param>
		<xsl:with-param name="Titel2">
			<xsl:if test="$LijstWoord='geheel'">
				<xsl:value-of select="$Txt_Gehele"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_bestand"/><xsl:text> </xsl:text>(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_levende"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_vrouw"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_vrouwen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
			<xsl:if test="$LijstWoord='nageslacht'">
				<xsl:value-of select="$Txt_Nageslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_levende"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_vrouw"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_vrouwen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
			<xsl:if test="$LijstWoord='voorgeslacht'">
				<xsl:value-of select="$Txt_Voorgeslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_levende"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_vrouw"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_vrouwen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
		</xsl:with-param>
		<xsl:with-param name="Titel3"><xsl:value-of select="$Txt_Huidigeleeftijd"/></xsl:with-param>
		<xsl:with-param name="nr_class">10</xsl:with-param>
	</xsl:call-template>
	<br></br>
	<br></br>
	  	
	<xsl:value-of select="user:y_living_tot()"/>
	<xsl:value-of select="user:calculations()"/>
	<xsl:call-template name="MaakTabel">
		<xsl:with-param name="Titel1">
		  <xsl:value-of select="$Txt_Aantal"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_levendepersonen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_hun"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_huidigeleeftijd"/>
		</xsl:with-param>
		<xsl:with-param name="Titel2">
			<xsl:if test="$LijstWoord='geheel'">
				<xsl:value-of select="$Txt_Gehele"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_bestand"/><xsl:text> </xsl:text>(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_levende"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_persoon"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_personen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
			<xsl:if test="$LijstWoord='nageslacht'">
				<xsl:value-of select="$Txt_Nageslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_levende"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_persoon"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_personen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
			<xsl:if test="$LijstWoord='voorgeslacht'">
				<xsl:value-of select="$Txt_Voorgeslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				(<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_levende"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_persoon"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_personen"/></xsl:if><xsl:text> </xsl:text><xsl:value-of select="$Txt_metbekendeleeftijd"/>)
			</xsl:if>
		</xsl:with-param>
		<xsl:with-param name="Titel3"><xsl:value-of select="$Txt_Huidigeleeftijd"/></xsl:with-param>
		<xsl:with-param name="nr_class">10</xsl:with-param>
	</xsl:call-template>
	<br></br>
	<br></br>
	
	<xsl:if test="$LijstWoord='nageslacht' or $LijstWoord='voorgeslacht'">
		<xsl:value-of select="user:y_gen_man()"/>
		<xsl:value-of select="user:calculations()"/>
		<xsl:call-template name="MaakTabel">
		<xsl:with-param name="Titel1">
		  <xsl:value-of select="$Txt_Aantal"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_mannen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_perby"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_generatie"/>
		</xsl:with-param>
			<xsl:with-param name="Titel2">
				<xsl:if test="$LijstWoord='nageslacht'">
				  <xsl:value-of select="$Txt_Nageslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				  (<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_man"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_mannen"/></xsl:if>)
				</xsl:if>
				<xsl:if test="$LijstWoord='voorgeslacht'">
				  <xsl:value-of select="$Txt_Voorgeslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				  (<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_man"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_mannen"/></xsl:if>)
				</xsl:if>
			</xsl:with-param>
			<xsl:with-param name="Titel3"><xsl:value-of select="$Txt_Generatie"/></xsl:with-param>
			<xsl:with-param name="nr_class"><xsl:value-of select="user:write_y_nr_class(0)"/></xsl:with-param>
		</xsl:call-template>
		<br></br>
		<br></br>
	
		<xsl:value-of select="user:y_gen_vrouw()"/>
		<xsl:value-of select="user:calculations()"/>
		<xsl:call-template name="MaakTabel">
		<xsl:with-param name="Titel1">
		  <xsl:value-of select="$Txt_Aantal"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_vrouwen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_perby"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_generatie"/>
		</xsl:with-param>
			<xsl:with-param name="Titel2">
				<xsl:if test="$LijstWoord='nageslacht'">
				  <xsl:value-of select="$Txt_Nageslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				  (<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_vrouw"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_vrouwen"/></xsl:if>)
				</xsl:if>
				<xsl:if test="$LijstWoord='voorgeslacht'">
				  <xsl:value-of select="$Txt_Voorgeslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				  (<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_vrouw"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_vrouwen"/></xsl:if>)
				</xsl:if>
			</xsl:with-param>
			<xsl:with-param name="Titel3"><xsl:value-of select="$Txt_Generatie"/></xsl:with-param>
			<xsl:with-param name="nr_class"><xsl:value-of select="user:write_y_nr_class(0)"/></xsl:with-param>
		</xsl:call-template>
		<br></br>
		<br></br>
	
		<xsl:value-of select="user:y_gen_tot()"/>
		<xsl:value-of select="user:calculations()"/>
		<xsl:call-template name="MaakTabel">
		<xsl:with-param name="Titel1">
		  <xsl:value-of select="$Txt_Aantal"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_personen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_perby"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_generatie"/>
		</xsl:with-param>
			<xsl:with-param name="Titel2">
				<xsl:if test="$LijstWoord='nageslacht'">
				  <xsl:value-of select="$Txt_Nageslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				  (<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_persoon"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_personen"/></xsl:if>)
				</xsl:if>
				<xsl:if test="$LijstWoord='voorgeslacht'">
				  <xsl:value-of select="$Txt_Voorgeslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$naam"/>
				  (<xsl:value-of select="user:write_y_tot()"/><xsl:text> </xsl:text><xsl:if test="user:write_y_tot()=1"><xsl:value-of select="$Txt_persoon"/></xsl:if><xsl:if test="user:write_y_tot()!=1"><xsl:value-of select="$Txt_personen"/></xsl:if>)
				</xsl:if>
			</xsl:with-param>
			<xsl:with-param name="Titel3"><xsl:value-of select="$Txt_Generatie"/></xsl:with-param>
			<xsl:with-param name="nr_class"><xsl:value-of select="user:write_y_nr_class(0)"/></xsl:with-param>
		</xsl:call-template>
		<br></br>
		<br></br>
	</xsl:if>
  </xsl:if> <!-- tabel -->
	
</xsl:if> <!-- Browser=IE-test -->
	
</xsl:template>

<xsl:template name="VulAscSetStrict">
  <xsl:param name="LinkVanDezePersoon"/>
  <xsl:param name="GenNummer"/>
  <xsl:param name="Sex"/>
	<xsl:variable name="NextGenNr">
        <xsl:value-of select="$GenNummer+1"/>
    </xsl:variable>
<!-- Voer dit template alleen uit als het generatienummer hoogstens gelijk is aan het aantal te tonen generaties -->    
<!--    <xsl:if test="$LijstWoord = 0 or $LijstWoord>=$GenNummer"> -->
    <xsl:value-of select="user:read_pers_asc_strict(string($LinkVanDezePersoon),string($GenNummer),string($Sex))"/>

  <xsl:for-each select="//PERSONEN/PERSOON[@link=$LinkVanDezePersoon]">

<!-- ===== Toon ook All Events als persoon een relatie heeft (gehad) ==== -->
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
              <xsl:with-param name="Sex">
              	<xsl:for-each select="//PERSONEN/PERSOON[@link=$mothLink]">
              		<xsl:value-of select="PERSONAL/@sex"/>
              	</xsl:for-each>
              </xsl:with-param>
            </xsl:call-template>
         </xsl:if>
        </xsl:for-each>
  </xsl:for-each>
<!--  </xsl:if> -->
</xsl:template>

<xsl:template name="VulDescSetStrict">
  <xsl:param name="LinkVanDezePersoon"/>
  <xsl:param name="GenNummer"/>
  <xsl:param name="Sex"/>
	<xsl:variable name="NextGenNr">
        <xsl:value-of select="$GenNummer+1"/>
    </xsl:variable>
<!-- Voer dit template alleen uit als het generatienummer hoogstens gelijk is aan het aantal te tonen generaties -->    
<!--    <xsl:if test="$LijstWoord = 0 or $LijstWoord>=$GenNummer"> -->
    <xsl:value-of select="user:read_pers_desc_strict(string($LinkVanDezePersoon),string($GenNummer),string($Sex))"/>

  <xsl:for-each select="//PERSONEN/PERSOON[@link=$LinkVanDezePersoon]">

<!-- ===== Toon ook All Events als persoon een relatie heeft (gehad) ==== -->
      <xsl:for-each select="RELATIONS/RELA">
        <xsl:for-each select="CHILDREN/CHIL">
          <xsl:variable name="childLink" select="@link"/>
            <xsl:call-template name="VulDescSetStrict">
              <xsl:with-param name="LinkVanDezePersoon">
              	<xsl:value-of select="@link"/>
              </xsl:with-param>
              <xsl:with-param name="GenNummer">
                <xsl:value-of select="$NextGenNr"/>
              </xsl:with-param>
              <xsl:with-param name="Sex">
              	<xsl:for-each select="//PERSONEN/PERSOON[@link=$childLink]">
              		<xsl:value-of select="PERSONAL/@sex"/>
              	</xsl:for-each>
              </xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
      </xsl:for-each>
  </xsl:for-each>
<!--  </xsl:if> -->
</xsl:template>

<xsl:template name="ReadPers">
	<xsl:for-each select="PERSONAL">
		<xsl:variable name="overleden">
	  		<xsl:if test="../EVENTS/DEATH">D</xsl:if>
		</xsl:variable>
		<xsl:variable name="leeftijd">
			<xsl:if test="@age">
                <xsl:if test="$Browser = 'IE' and string-length(../EVENTS/DEATH/@date) = 0">
                  <xsl:for-each select="../EVENTS">
                    <xsl:variable name="leeftijd_tmp">
                    	<xsl:value-of select="user:leeftijd(.,string($parTaal),string($Txt_jaren),string($Txt_jaren))"/>
                    </xsl:variable>
                    <xsl:if test="string-length($leeftijd_tmp)>=6">
	                    <xsl:value-of select="substring(user:leeftijd(.,string($parTaal),string($Txt_jaren),string($Txt_jaren)),1,string-length(user:leeftijd(.,string($parTaal),string($Txt_jaren),string($Txt_jaren)))- 2 - string-length($Txt_jaren))"/>
	                </xsl:if>
                    <xsl:if test="6>string-length($leeftijd_tmp)">
	                    onbekend
	                </xsl:if>
                  </xsl:for-each> <!-- EVENTS -->
                </xsl:if>
                <xsl:if test="$Browser != 'IE' or string-length(../EVENTS/DEATH/@date) != 0">
                  <xsl:value-of select="@age"/>
                </xsl:if>
            </xsl:if>
			<xsl:if test="not(@age)">onbekend</xsl:if>
		</xsl:variable>
   		<xsl:value-of select="user:read_pers(string($leeftijd),string(@sex),string($overleden),string(../EVENTS/DEATH/@ovl))"/> 
	</xsl:for-each>
</xsl:template>

<xsl:template name="MaakGrafiek">
	<xsl:param name="Titel1"/>
	<xsl:param name="Titel2"/>
	<xsl:param name="Titel3"/>
	<xsl:param name="color"/>
	<xsl:param name="nr_class"/>
	
	<xsl:variable name="cl2"><xsl:value-of select="$nr_class+2"/></xsl:variable>
	<div align="center">
		<br></br>
		<table border="0" style="border-collapse:collapse">
			<tr>
		    	<td colspan="{$cl2}" align="center" style="font-size:15px">
		    		<xsl:value-of select="$Titel1"/>
			    </td>
			</tr>
			<tr>
			    <td colspan="{$cl2}" align="center" class="tbl-tekst">
					<i><xsl:value-of select="$Titel2"/></i>
			    </td>
			</tr>
			<tr>
				<td>
					<table border="0" style="border-collapse:collapse">
						<xsl:call-template name="write_y_as_int">
							<xsl:with-param name="i">4</xsl:with-param>
							<xsl:with-param name="j">5</xsl:with-param>
						</xsl:call-template>
						
						<xsl:element name="tr">
							<xsl:attribute name="style">
								height:<xsl:value-of select="user:write_y_as_halve_hoogte()"/>px; width:20px
							</xsl:attribute>
							<td>
								<xsl:value-of select="$nbsp"/>
							</td>
						</xsl:element>
						
					</table>
				</td>
				<td valign="bottom">
					<table border="0" style="border-collapse:collapse" class="tbl-tekst">
						<xsl:call-template name="write_y_as_bar">
							<xsl:with-param name="i">4</xsl:with-param>
						</xsl:call-template>
					</table>
				</td>
				<xsl:if test="$nr_class &gt; 0">
					<xsl:call-template name="write_blocks">
						<xsl:with-param name="i">1</xsl:with-param>
						<xsl:with-param name="color">
							<xsl:value-of select="$color"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</tr>
			<tr>
				<td valign="bottom">
					<table border="0" width="20">
						<tr>
							<td align="center">
							</td>
						</tr>
					</table>
				</td>
				<td valign="bottom">
					<table border="0" width="5">
						<tr>
							<td align="center">
							</td>
						</tr>
					</table>
				</td>
				<td colspan="{$nr_class}" align="center" style="border:1px solid black; border-left:0px; border-right:0px; border-bottom:0px;font-size:1px">
					<xsl:value-of select="$nbsp"/>
				</td>
			</tr>
			
			<tr>
				<td valign="bottom">
					<table border="0" width="20">
						<tr>
							<td align="center">
							</td>
						</tr>
					</table>
				</td>
				<td valign="bottom">
					<table border="0" width="5">
						<tr>
							<td align="center">
							</td>
						</tr>
					</table>
				</td>
				<xsl:if test="$nr_class &gt; 0">
					<xsl:call-template name="write_legend">
						<xsl:with-param name="i">1</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</tr>
			<tr>
				<td valign="bottom">
					<table border="0" width="20">
						<tr>
							<td align="center">
							</td>
						</tr>
					</table>
				</td>
				<td valign="bottom">
					<table border="0" width="5">
						<tr>
							<td align="center">
							</td>
						</tr>
					</table>
				</td>
				<td colspan="{$nr_class}" align="center" class="tbl-tekst">
					<xsl:value-of select="$Titel3"/>
				</td>
			</tr>

		</table>
	</div>
</xsl:template>

<xsl:template name="MaakTabel">
	<xsl:param name="Titel1"/>
	<xsl:param name="Titel2"/>
	<xsl:param name="Titel3"/>
	<xsl:param name="nr_class"/>
	
	<div align="center">
		<br></br>
		<table border="1" bordercolor="black" cellspacing="0" cellpadding="4" class="tbl-data">
			<tr>
		    	<td colspan="2" align="center" style="font-size:15px" class="tbl-head">
		    		<xsl:value-of select="$Titel1"/>
			    </td>
			</tr>
			<tr>
			    <td colspan="2" align="center" style="font-size:12px" class="tbl-head">
					<i><xsl:value-of select="$Titel2"/></i>
			    </td>
			</tr>
			<tr>
				<td align="center" class="tbl-head">
					<xsl:value-of select="$Titel3"/>
				</td>
				<td align="center" class="tbl-head">
					<xsl:value-of select="$Txt_AantalTabel"/>
				</td>
			</tr>
			<xsl:call-template name="write_table_value">
				<xsl:with-param name="i">1</xsl:with-param>
			</xsl:call-template>

		</table>
	</div>
</xsl:template>

<xsl:template name="write_y_as_int">
	<xsl:param name="i"/>
	<xsl:param name="j"/>
	
	<xsl:if test="user:write_nr_y() &gt; string($i)">
		<xsl:element name="tr">
			<xsl:attribute name="style">
				height:<xsl:value-of select="user:write_y_as_hoogte()"/>px; width:20px
			</xsl:attribute>
			<td class="tbl-tekst">
				<xsl:value-of select="user:write_y_as_int(string($j))"/>
			</td>
		</xsl:element>
	</xsl:if>
	<xsl:if test="string($i) &gt; 0">
		<xsl:variable name="Next_i">
			<xsl:value-of select="$i - 1"/>
		</xsl:variable>
		<xsl:variable name="Next_j">
			<xsl:value-of select="$j - 1"/>
		</xsl:variable>
		<xsl:call-template name="write_y_as_int">
			<xsl:with-param name="i"> <xsl:value-of select="$Next_i"/></xsl:with-param>
			<xsl:with-param name="j"> <xsl:value-of select="$Next_j"/></xsl:with-param>
		</xsl:call-template>
	</xsl:if>
	
</xsl:template>

<xsl:template name="write_y_as_bar">
	<xsl:param name="i"/>
	
	<xsl:if test="user:write_nr_y() &gt; string($i)">
		<xsl:element name="tr">
			<xsl:attribute name="style">
				height:<xsl:value-of select="user:write_y_as_hoogte()"/>px; width:20px
			</xsl:attribute>
			<xsl:element name="td">
				<xsl:attribute name="style">
					border:1px solid black; border-left:0px
				</xsl:attribute>
		        <xsl:value-of select="$nbsp"/>
			</xsl:element>
		</xsl:element>
	</xsl:if>
	<xsl:if test="string($i) &gt; 0">
		<xsl:variable name="Next_i">
			<xsl:value-of select="$i - 1"/>
		</xsl:variable>
		<xsl:call-template name="write_y_as_bar">
			<xsl:with-param name="i"> <xsl:value-of select="$Next_i"/></xsl:with-param>
		</xsl:call-template>
	</xsl:if>
	
</xsl:template>

<xsl:template name="write_blocks">
	<xsl:param name="i"/>
	<xsl:param name="color"/>
	
	<xsl:variable name="hoogte">
		<xsl:value-of select="user:write_x_hoogte(string($i))"/>
	</xsl:variable>

	<xsl:variable name="y_nr_class">
		<xsl:value-of select="user:write_y_nr_class(0)"/>
	</xsl:variable>
	
	<td valign="bottom">
		<xsl:element name="table">
			<xsl:attribute name="style">
				border:0px; height:<xsl:value-of select="$hoogte"/>px; width:<xsl:value-of select="user:write_x_width()"/>px;
				<xsl:if test="$hoogte!=0">
					<xsl:if test="$color='totaal'">
						background-color:blue;
					</xsl:if>
				</xsl:if>
			</xsl:attribute>
			<xsl:attribute name="class">
				<xsl:if test="$hoogte=0">
					tbl-tussenkolom
				</xsl:if>
				<xsl:if test="$hoogte!=0">
					<xsl:if test="$color='man'">
						grafisch-man
					</xsl:if>
					<xsl:if test="$color='vrouw'">
						grafisch-vrouw
					</xsl:if>
				</xsl:if>
			</xsl:attribute>
			<tr>
			<td>
			</td>
			</tr>
		</xsl:element>
	</td>
	<xsl:if test="string($i) &lt; string($y_nr_class)">
		<xsl:variable name="Next_i">
			<xsl:value-of select="$i + 1"/>
		</xsl:variable>
		<xsl:call-template name="write_blocks">
			<xsl:with-param name="i"> <xsl:value-of select="$Next_i"/></xsl:with-param>
			<xsl:with-param name="color"> <xsl:value-of select="$color"/></xsl:with-param>
		</xsl:call-template>
	</xsl:if>
</xsl:template>

<xsl:template name="write_legend">
	<xsl:param name="i"/>

	<xsl:variable name="y_nr_class">
		<xsl:value-of select="user:write_y_nr_class(0)"/>
	</xsl:variable>
	<td valign="bottom" align="center">
		<xsl:element name="table">
			<xsl:attribute name="style">
				border:0px;
				width="<xsl:value-of select="user:write_x_width()"/>px
			</xsl:attribute>
			<tr>
				<td align="center" class="tbl-tekst">
					<xsl:value-of select="user:write_legend(string($i))"/>
				</td>
			</tr>
		</xsl:element>
	</td>
	<xsl:if test="string($i) &lt; string($y_nr_class)">
		<xsl:variable name="Next_i">
			<xsl:value-of select="$i + 1"/>
		</xsl:variable>
		<xsl:call-template name="write_legend">
			<xsl:with-param name="i"> <xsl:value-of select="$Next_i"/></xsl:with-param>
		</xsl:call-template>
	</xsl:if>
</xsl:template>

<xsl:template name="write_table_value">
	<xsl:param name="i"/>
	
	<xsl:variable name="y_nr_class">
		<xsl:value-of select="user:write_y_nr_class(0)"/>
	</xsl:variable>
	
	<tr>
	<td align="center" class="tbl-tekst">
		<xsl:value-of select="user:write_legend(string($i))"/>
	</td>
	<td align="center" class="tbl-tekst">
		<xsl:value-of select="user:write_y(string($i))"/>
	</td>
	</tr>
	<xsl:if test="string($i) &lt; string($y_nr_class)">
		<xsl:variable name="Next_i">
			<xsl:value-of select="$i + 1"/>
		</xsl:variable>
		<xsl:call-template name="write_table_value">
			<xsl:with-param name="i"> <xsl:value-of select="$Next_i"/></xsl:with-param>
		</xsl:call-template>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>
