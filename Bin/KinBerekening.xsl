<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:user="http://www.adriedenblanken.nl/"
		version="1.0">
<!--
// <author>Paul Kallenberg</author>
// <file>$Workfile: KinBerekening.xsl $</file><date>$Date: 2-12-13 16:06 $</date>
// <revision>$Revision: 27 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this
// header stays intact. No responsibility is accepted
// for use of this software.</disclaimer>
-->
<xsl:output method="html"/>

<xsl:include href="Header.xsl"/>
<xsl:include href="Talen.xsl"/>

<xsl:param name="HuidigPersoon"/>
<xsl:param name="LijstWoord"/>
<xsl:param name="Browser"/>
<xsl:param name="Printing"/>
<xsl:param name="parToonVoornaam"/>
<xsl:param name="parToonVoettekst"/>
<xsl:param name="parRefOwner"/>
<xsl:param name="parRefOwnerEMail"/>
<xsl:param name="parToonKalender"/>
<xsl:param name="parStuurSorteersleutel"/>
<xsl:param name="parToonNieuws"/>
<xsl:param name="parTaal"/>
<xsl:param name="parFotoAantal"/>

<msxsl:script language="javascript" implements-prefix="user">
<![CDATA[
var block_link_nr=new Array();
var block_top=new Array();
var co_sang=new Array();
var co_sang_tot;
var kwartier_index=new Array();
var kwartier_nr=new Array();
var link_line_nr=new Array();
var link_nr=new Array();
var match_link=new Array();
var match_kwartier=new Array();
//maximaal # generaties
var max_nr_block=100;
var max_top_coord;
var nr_block=new Array();
var nr_in_line=new Array();
var nr_matches=0;
var nr_pers=0;
var nr_voorouders=new Array();
nr_voorouders[1]=0;
nr_voorouders[2]=0;
var person_link_nr=new Array();
var person_link_nr_father=new Array();
var person_link_nr_mother=new Array();

var blok_hoogte=75;
var inter_match_h=120;
var inter_block_h=30;
var offset_x=150;
var offset_y=300;
var width_box=300;

function read_pers_link(lnk)
{
	nr_pers++;
	person_link_nr[nr_pers] = 1*lnk;
	person_link_nr_father[nr_pers] = -1;
	person_link_nr_mother[nr_pers] = -1;
		
	return "";
}

function read_pers_father_link(lnk)
{
	person_link_nr_father[nr_pers] = 1*lnk;
		
	return "";
}

function read_pers_mother_link(lnk)
{
	person_link_nr_mother[nr_pers] = 1*lnk;
		
	return "";
}

function read_pers(k,lnk)
{
	nr_voorouders[k]=1;
	link_nr[k] = 1*lnk;
	kwartier_nr[k]= 1;
	kwartier_index[k]=1;
	nr_in_line[k]=0;
		
	return "";
}

function vul_voorouder_set(k,lnk,kw)
{
	var i;
	var k0;
	var k1;
	var n;
	var n0;
	var ind;
	var f_lnk;
	var m_lnk;
	var found;
	var voorouder_nr_kind;
	
	found=false;
	i=1;
	while ((!(found)) && (i<=nr_pers))
	{
		if (person_link_nr[i] == lnk)
		{
			ind = i;
			found=true;
		}
		i++;
	}
	if (found)
	{
		f_lnk=person_link_nr_father[ind];
		m_lnk=person_link_nr_mother[ind];
		if (f_lnk>0)
		{
			nr_voorouders[k]++;
			k0=nr_voorouders[k];
			link_nr[(k0-1)*2+k] = f_lnk;
			kwartier_nr[(k0-1)*2+k] = 2*kw;
			kwartier_index[(2*kw-1)*2+k]=k0;
			
			voorouder_nr_kind=kwartier_index[(kw-1)*2+k];
			k1=voorouder_nr_kind;
			nr_in_line[(k0-1)*2+k]=nr_in_line[(k1-1)*2+k]+1;
			n0=nr_in_line[(k0-1)*2+k];
			for (n=1; n<=n0-1;n++)
			{
				link_line_nr[(k0-1)*max_nr_block*2 + (n-1)*2 + k] = link_line_nr[(k1-1)*max_nr_block*2+(n-1)*2+k];
			}
			link_line_nr[(k0-1)*max_nr_block*2+(n0-1)*2+k] = link_nr[(k1-1)*2+k];
			
			vul_voorouder_set(k,f_lnk,2*kw);
		}
		if (m_lnk>0)
		{
			nr_voorouders[k]++;
			k0=nr_voorouders[k];
			link_nr[(k0-1)*2+k] = m_lnk;
			kwartier_nr[(k0-1)*2+k] = 2*kw+1;
			kwartier_index[(2*kw)*2+k]=k0;
			
			voorouder_nr_kind=kwartier_index[(kw-1)*2+k];
			k1=voorouder_nr_kind;
			nr_in_line[(k0-1)*2+k]=nr_in_line[(k1-1)*2+k]+1;
			n0=nr_in_line[(k0-1)*2+k];
			for (n=1; n<=n0-1;n++)
			{
				link_line_nr[(k0-1)*max_nr_block*2 + (n-1)*2 + k] = link_line_nr[(k1-1)*max_nr_block*2+(n-1)*2+k];
			}
			link_line_nr[(k0-1)*max_nr_block*2+(n0-1)*2+k] = link_nr[(k1-1)*2+k];
			
			vul_voorouder_set(k,m_lnk,2*kw+1);
		}
	}
	return "";
}

function bepaal_voorouders()
{
	var k;
	for (k=1;k<=2;k++)
	{
		vul_voorouder_set(k,link_nr[k],1);
	}
	return "";
}

function find_matches()
{
	var i;
	var j;
	var k1;
	var k2;
	var match_found;
	
	for (i=1;i<=nr_voorouders[1];i++)
		{
			if (link_nr[(i-1)*2+1] != 0)
			{
				for (j=1;j<=nr_voorouders[2];j++)
				{
					if (link_nr[(i-1)*2+1] == link_nr[(j-1)*2+2])
					{
						match_found=true;
						k1=1;
						while ((match_found) && (k1<=nr_in_line[(i-1)*2+1]))
						{
							k2=1;
							while ((match_found) && (k2<=nr_in_line[(j-1)*2+2]))
							{
								if (link_line_nr[(i-1)*max_nr_block*2+(k1-1)*2+1]==link_line_nr[(j-1)*max_nr_block*2+(k2-1)*2+2])
								{
									match_found=false;
								}
								k2++;
							}
							k1++;
						}
						if (match_found)
						{
							nr_matches++;
							match_link[nr_matches]=link_nr[(i-1)*2+1];
							match_kwartier[(nr_matches-1)*2+1]=kwartier_nr[(i-1)*2+1];
							match_kwartier[(nr_matches-1)*2+2]=kwartier_nr[(j-1)*2+2];
						}
					}
				}
			}
		}
	return "";
}

function calc_block_link_nrs()
{
	var found;
	var i;
	var k;
	var m;
	var m1;
	var ind=new Array();
	var kw=new Array();
	
	for (m=1;m<=nr_matches;m++)
	{
		for (k=1;k<=2;k++)
		{
			nr_block[(m-1)*2+k]=Math.floor(Math.log(match_kwartier[(m-1)*2+k]+0.5)/Math.log(2))+1;
			kw[k]=match_kwartier[(m-1)*2+k];
			for (i=1;i<=nr_block[(m-1)*2+k];i++)
			{
				found=false;
				
				m1=1;
				while ((m1<=nr_voorouders[k]) && (!(found)))
				{
					if (kwartier_nr[(m1-1)*2+k] == kw[k])
					{
						ind[k]=m1;
						found=true;
					}
					m1++;
				}
				block_link_nr[(m-1)*max_nr_block*2 + (i-1)*2 + k]=link_nr[(ind[k]-1)*2+k];
				kw[k]=Math.floor(kw[k]/2);
			}
		}
	}
	return "";
}

function calc_block_top()
{
	var i;
	var k;
	var m;
	var max_cum_nr_block=new Array();
	
	max_cum_nr_block[1]=0;
	for(m=2;m<=nr_matches+1;m++)
	{
		max_cum_nr_block[m] = max_cum_nr_block[m-1] + Math.max(nr_block[(m-2)*2+1],nr_block[(m-2)*2+2])
	}
	for (m=1;m<=nr_matches;m++)
	{
		for (k=1;k<=2;k++)
		{
			for (i=1;i<=nr_block[(m-1)*2+k];i++)
			{
				block_top[(m-1)*max_nr_block*2 + (i-1)*2 + k] = offset_y + (m-1)*inter_match_h + (max_cum_nr_block[m] + i - 1) * (blok_hoogte + inter_block_h) - (m-1)*inter_block_h;
			}
		}
	}
	max_top_coord=block_top[(nr_matches-1)*max_nr_block*2 + (nr_block[(nr_matches-1)*2+1]-1)*2 + 1]
	max_top_coord=Math.max(max_top_coord,block_top[(nr_matches-1)*max_nr_block*2 + (nr_block[(nr_matches-1)*2+2]-1)*2 + 2])
	return "";
	
}

function calc_co_sang()
{
	var m;
	
	co_sang_tot=0;
	for (m=1;m<=nr_matches;m++)
	{
		co_sang[m]=-2;
		for (k=1;k<=2;k++)
		{
			co_sang[m] = co_sang[m]+ nr_block[(m-1)*2+k];
		}
		co_sang[m]=Math.pow(2,(-co_sang[m]));
		co_sang_tot=co_sang_tot+co_sang[m];
	}
	return "";
}

function write_co_sang(m)
{
	if (co_sang[m]>=0)
	{
		return co_sang[m];
	}
	else
	{
		return "-"
	}
}

function write_co_sang_tot()
{
	if (co_sang_tot>=0)
	{
		return co_sang_tot;
	}
	else
	{
		return "--"
	}
}

function write_block_top(lnk,m,k)
{
	var ind;
	var i;
	
	ind=0;
	for (i=1;i<=nr_block[(m-1)*2+k];i++)
	{
		if (block_link_nr[(m-1)*max_nr_block*2 + (i-1)*2 + k] == lnk)
		{
			ind=i;
		}
	}
	if (ind>0)
	{
		return block_top[(m-1)*max_nr_block*2 + (ind-1)*2 + k];
	}
	else
	{
		return 0;
	}
}

function is_first_block(lnk,m,k)
{
	var ind;
	var i;
	
	ind=0;
	for (i=1;i<=nr_block[(m-1)*2+k];i++)
	{
		if (block_link_nr[(m-1)*max_nr_block*2 + (i-1)*2 + k] == lnk)
		{
			ind=i;
		}
	}
	if (ind==1)
	{
		return true;
	}
	else
	{
		return false;
	}
}

function write_nr_matches()
{
	return nr_matches;
}

function write_width_box()
{
	return width_box;
}

function write_blok_hoogte()
{
	return blok_hoogte;
}

function write_left_coord()
{
	return offset_x;
}

function write_max_top_coord()
{
		return max_top_coord;
}

function write_table(lnk)
{
	var found=false;
	var i;
	
	for (i=1;i<=nr_matches;i++)
	{
		if (is_first_block(lnk,i,2))
		{
			found=true;
		}
		if (write_block_top(lnk,i,1)!=0)
		{
			found=true;
		}
		if ((!(is_first_block(lnk,i,2))) && (write_block_top(lnk,i,2)!=0))
		{
			found=true;
		}
	}
	return found;
}

]]>
</msxsl:script>

<xsl:template match="PERSONEN">

  <xsl:call-template name="ShowMenu"/>

  <h4 align="center"><xsl:value-of select="$Txt_Verwantschap"/><xsl:text> </xsl:text>
    <xsl:for-each select="PERSOON[@link=$HuidigPersoon]">
    <xsl:for-each select="PERSONAL">
	<xsl:call-template name="ShowPersoon">
          <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
          <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
          <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
          <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
          <xsl:with-param name="src"><xsl:value-of select="$HuidigPersoon"/></xsl:with-param>
          <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
        </xsl:call-template>
    </xsl:for-each>
  </xsl:for-each>
  <xsl:text> </xsl:text><xsl:value-of select="$Txt_met"/><xsl:text> </xsl:text>
    <xsl:for-each select="PERSOON[@link=$LijstWoord]">
    <xsl:for-each select="PERSONAL">
	<xsl:call-template name="ShowPersoon">
          <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
          <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
          <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
          <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
          <xsl:with-param name="src"><xsl:value-of select="$LijstWoord"/></xsl:with-param>
          <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
        </xsl:call-template>
    </xsl:for-each>
  </xsl:for-each>
  </h4>

    <xsl:for-each select="PERSOON">
    	<xsl:value-of select="user:read_pers_link(string(@link))"/> 
    	<xsl:for-each select="FATHER">
    		<xsl:if test="count(@type)=0">
		    	<xsl:value-of select="user:read_pers_father_link(string(@link))"/> 
		    </xsl:if>
    	</xsl:for-each>
    	<xsl:for-each select="MOTHER">
    		<xsl:if test="count(@type)=0">
		    	<xsl:value-of select="user:read_pers_mother_link(string(@link))"/> 
		    </xsl:if>
    	</xsl:for-each>
	</xsl:for-each>
	
<!-- rekenwerk in JS -->	
   	<xsl:value-of select="user:read_pers(1,string($HuidigPersoon))"/> 
   	<xsl:value-of select="user:read_pers(2,string($LijstWoord))"/>
   	<xsl:value-of select="user:bepaal_voorouders()"/> 
	<xsl:value-of select="user:find_matches()"/> 
	<xsl:value-of select="user:calc_block_link_nrs()"/> 
	<xsl:value-of select="user:calc_block_top()"/> 
	<xsl:value-of select="user:calc_co_sang()"/> 

<!-- Schrijf uitvoer -->
	<xsl:variable name="NrMatches">
		<xsl:value-of select="user:write_nr_matches()"/> 
	</xsl:variable>
	<xsl:if test="$NrMatches = '0'">
	<h3 align="center">
	  <xsl:value-of select="$Txt_Verwantschaptitelgeen"/>
	</h3>
	</xsl:if>
	<xsl:if test="$NrMatches != '0'">
		<h3 align="center"><xsl:value-of select="$NrMatches"/>
			<xsl:if test="$NrMatches=1">
				<xsl:text> </xsl:text><xsl:value-of select="$Txt_verwantschapslijn"/>
			</xsl:if>
			<xsl:if test="$NrMatches!=1">
				<xsl:text> </xsl:text><xsl:value-of select="$Txt_verwantschapslijnen"/>
			</xsl:if>
			<xsl:text>; </xsl:text><xsl:value-of select="$Txt_verwantschap"/><xsl:text>: </xsl:text>
			<xsl:value-of select="user:write_co_sang_tot()*100"/>
			<xsl:text> %</xsl:text>
		</h3>
<!-- Blok per persoon met naam -->
	<xsl:for-each select="PERSOON">
		<xsl:variable name="PersonLink" select="@link"/>
		<xsl:variable name="MatchNr"><xsl:value-of select="$NrMatches"/></xsl:variable>
		<xsl:if test="user:write_table(string($PersonLink)) = 'true'">
		<xsl:call-template name="SchrijfTabel">
			<xsl:with-param name="PersonLink"><xsl:value-of select="$PersonLink"/></xsl:with-param>
			<xsl:with-param name="MatchNr"><xsl:value-of select="$MatchNr"/></xsl:with-param>
            <xsl:with-param name="NAMEFIRST"><xsl:value-of select="PERSONAL/NAME/@first"/></xsl:with-param>
            <xsl:with-param name="NAMENICK"><xsl:value-of select="PERSONAL/NAME/@nick"/></xsl:with-param>
            <xsl:with-param name="NAMEPREF"><xsl:value-of select="PERSONAL/NAME/@pref"/></xsl:with-param>
            <xsl:with-param name="SURN"><xsl:value-of select="PERSONAL/NAME/@surn"/></xsl:with-param>
            <xsl:with-param name="BDATE">
            	<xsl:if test="count(EVENTS/BIRTH/@date)!=0">
            		<xsl:text>* </xsl:text><xsl:value-of select="EVENTS/BIRTH/@onz"/><xsl:value-of select="EVENTS/BIRTH/@date"/>
            	</xsl:if>
            	<xsl:if test="count(EVENTS/BIRTH/@date)=0 and count(EVENTS/BAPT/@date)!=0">
            		<xsl:text>~ </xsl:text><xsl:value-of select="EVENTS/BAPT/@onz"/><xsl:value-of select="EVENTS/BAPT/@date"/>
            	</xsl:if>
            </xsl:with-param>
            <xsl:with-param name="DDATE">
            	<xsl:if test="count(EVENTS/DEATH/@date)!=0">
            		<xsl:value-of select="$dagger"/><xsl:text> </xsl:text><xsl:value-of select="EVENTS/DEATH/@onz"/><xsl:value-of select="EVENTS/DEATH/@date"/>
            	</xsl:if>
            	<xsl:if test="count(EVENTS/DEATH/@date)=0 and count(EVENTS/BURI/@date)!=0">
            		<xsl:text>[] </xsl:text><xsl:value-of select="EVENTS/BURI/@onz"/><xsl:value-of select="EVENTS/BURI/@date"/>
            	</xsl:if>
            </xsl:with-param>
            <xsl:with-param name="src"><xsl:value-of select="@link"/></xsl:with-param>
            <xsl:with-param name="priv"><xsl:value-of select="@priv"/></xsl:with-param>
		</xsl:call-template>
		</xsl:if>
    </xsl:for-each>
              
<!-- (Bijna) lege tabel rechts onder, om onder- en rechterzijkant goed zichtbaar te krijgen -->	
    <xsl:element name="table">
	    <xsl:attribute name="style">
        	position: absolute; border: 0px solid black; border-spacing: 0;
            width: 100%;
            height:<xsl:value-of select="user:write_blok_hoogte()+10"/>px; 
            top:<xsl:value-of select="user:write_max_top_coord()+user:write_blok_hoogte()+10"/>px;
            left: 10px;
        </xsl:attribute>
        <tr>
        <td>
         <!-- <xsl:call-template name="ShowFooter"/> -->
         <xsl:value-of select="$nbsp"/>
        </td>
        </tr>
    </xsl:element>
<!-- (Bijna) lege tabel boven -->	
    <xsl:element name="table">
	    <xsl:attribute name="style">
        	position: absolute; border: 0px solid black; border-spacing: 0;
            width: 10px;
            height:<xsl:value-of select="user:write_blok_hoogte()+10"/>px; 
            top:<xsl:value-of select="0"/>px;
            left: 10px;
        </xsl:attribute>
        <tr>
        <td>
          <xsl:value-of select="$nbsp"/>
        </td>
        </tr>
    </xsl:element>
    
    </xsl:if>

</xsl:template>

<xsl:template name="SchrijfTabel">
	<xsl:param name="PersonLink"/>
	<xsl:param name="MatchNr"/>
	<xsl:param name="NAMEFIRST"/>
	<xsl:param name="NAMENICK"/>
	<xsl:param name="NAMEPREF"/>
	<xsl:param name="SURN"/>
	<xsl:param name="BDATE"/>
	<xsl:param name="DDATE"/>
	<xsl:param name="src"/>
	<xsl:param name="priv"/>
	
	<xsl:if test="user:is_first_block(string($PersonLink),string($MatchNr),2) = 'true'">
    	<xsl:element name="table">
        	<xsl:attribute name="style">
            	position: absolute; border: 0px solid blue; border-spacing: 0; cell-padding: 0; cell-spacing: 0;
               	width: <xsl:value-of select="user:write_width_box()"/>px;
               	height:<xsl:value-of select="user:write_blok_hoogte()"/>px;
               	top:<xsl:value-of select="user:write_block_top(string($PersonLink),string($MatchNr),1)"/>px;
               	left: 0px;
            </xsl:attribute>
			<tr>
   				<td align="left" valign="top" class="tbl-tekst">
   					<xsl:text> </xsl:text><xsl:value-of select="$Txt_Lijn"/><xsl:text> </xsl:text><xsl:value-of select="$MatchNr"/>
   				</td>
   				<td align="left" valign="top" class="tbl-tekst">
   					<xsl:text> </xsl:text><xsl:value-of select="$Txt_Verwantschap"/><xsl:text> </xsl:text><xsl:value-of select="user:write_co_sang(string($MatchNr))*100"/><xsl:text> %</xsl:text>
   				</td>
			</tr>
        </xsl:element>
	</xsl:if>

	<xsl:if test="user:write_block_top(string($PersonLink),string($MatchNr),1) != '0'">
    	<xsl:element name="table">
    		<xsl:attribute name="class">
    			<xsl:if test="//PERSOON[@link=$PersonLink]/PERSONAL/@sex='M'">
    				grafisch-man
    			</xsl:if>
    			<xsl:if test="//PERSOON[@link=$PersonLink]/PERSONAL/@sex='V'">
    				grafisch-vrouw
    			</xsl:if>
    			<xsl:if test="//PERSOON[@link=$PersonLink]/PERSONAL/@sex='?'">
    				grafisch-onbekend
    			</xsl:if>
    		</xsl:attribute>
        	<xsl:attribute name="style">
            	position: absolute; border: 1px solid blue; border-spacing: 0;
               	width: <xsl:value-of select="user:write_width_box()"/>px;
               	height:<xsl:value-of select="user:write_blok_hoogte()"/>px;
               	top:<xsl:value-of select="user:write_block_top(string($PersonLink),string($MatchNr),1)"/>px;
				<xsl:if test="user:is_first_block(string($PersonLink),string($MatchNr),2) != 'true'">
	               	left: <xsl:value-of select="user:write_left_coord()"/>px;
               	</xsl:if>
				<xsl:if test="user:is_first_block(string($PersonLink),string($MatchNr),2) = 'true'">
	               	left: <xsl:value-of select="user:write_left_coord()+user:write_width_box()*0.5+50"/>px;
               	</xsl:if>
            </xsl:attribute>
			<tr>
			  <xsl:if test="$parFotoAantal = 2 or $parFotoAantal = 3">
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
				<td align="center" class="tbl-tekst">
    	           	<xsl:call-template name="KinShowPersoon">
        	        	<xsl:with-param name="NAMEFIRST"><xsl:value-of select="$NAMEFIRST"/></xsl:with-param>
            	        <xsl:with-param name="NAMENICK"><xsl:value-of select="$NAMENICK"/></xsl:with-param>
                	    <xsl:with-param name="NAMEPREF"><xsl:value-of select="$NAMEPREF"/></xsl:with-param>
                    	<xsl:with-param name="SURN"><xsl:value-of select="$SURN"/></xsl:with-param>
	                    <xsl:with-param name="BDATE"><xsl:value-of select="$BDATE"/></xsl:with-param>
    	                <xsl:with-param name="DDATE"><xsl:value-of select="$DDATE"/></xsl:with-param>
        	            <xsl:with-param name="src"><xsl:value-of select="$src"/></xsl:with-param>
        	            <xsl:with-param name="priv"><xsl:value-of select="$priv"/></xsl:with-param>
            	    </xsl:call-template>
				</td>
			</tr>
        </xsl:element>
    </xsl:if>

	<xsl:if test="user:is_first_block(string($PersonLink),string($MatchNr),2) != 'true'">
		<xsl:if test="user:write_block_top(string($PersonLink),string($MatchNr),2) != '0'">
        	<xsl:element name="table">
    		<xsl:attribute name="class">
    			<xsl:if test="//PERSOON[@link=$PersonLink]/PERSONAL/@sex='M'">
    				grafisch-man
    			</xsl:if>
    			<xsl:if test="//PERSOON[@link=$PersonLink]/PERSONAL/@sex='V'">
    				grafisch-vrouw
    			</xsl:if>
    			<xsl:if test="//PERSOON[@link=$PersonLink]/PERSONAL/@sex='?'">
    				grafisch-onbekend
    			</xsl:if>
    		</xsl:attribute>
                <xsl:attribute name="style">
                	position: absolute; border: 1px solid blue; border-spacing: 0;
                	width: <xsl:value-of select="user:write_width_box()"/>px;
                	height:<xsl:value-of select="user:write_blok_hoogte()"/>px;
                	top:<xsl:value-of select="user:write_block_top(string($PersonLink),string($MatchNr),2)"/>px;
                	left: <xsl:value-of select="user:write_left_coord() + user:write_width_box() + 100"/>px
                </xsl:attribute>
				<tr>
			      <xsl:if test="$parFotoAantal = 2 or $parFotoAantal = 3">
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
					<td align="center" class="tbl-tekst">
            	    	<xsl:call-template name="KinShowPersoon">
                	        <xsl:with-param name="NAMEFIRST"><xsl:value-of select="$NAMEFIRST"/></xsl:with-param>
                    	    <xsl:with-param name="NAMENICK"><xsl:value-of select="$NAMENICK"/></xsl:with-param>
                        	<xsl:with-param name="NAMEPREF"><xsl:value-of select="$NAMEPREF"/></xsl:with-param>
	                        <xsl:with-param name="SURN"><xsl:value-of select="$SURN"/></xsl:with-param>
    	                    <xsl:with-param name="BDATE"><xsl:value-of select="$BDATE"/></xsl:with-param>
        	                <xsl:with-param name="DDATE"><xsl:value-of select="$DDATE"/></xsl:with-param>
            	            <xsl:with-param name="src"><xsl:value-of select="$src"/></xsl:with-param>
            	            <xsl:with-param name="priv"><xsl:value-of select="$priv"/></xsl:with-param>
                	    </xsl:call-template>
					</td>
				</tr>
            </xsl:element>
        </xsl:if>
    </xsl:if>
    
    <xsl:if test="$MatchNr > 1">
    	<xsl:variable name="NextMatchNr">
       		<xsl:value-of select="$MatchNr - 1"/>
       	</xsl:variable>
		<xsl:call-template name="SchrijfTabel">
			<xsl:with-param name="PersonLink"><xsl:value-of select="$PersonLink"/></xsl:with-param>
			<xsl:with-param name="MatchNr"><xsl:value-of select="$NextMatchNr"/></xsl:with-param>
            <xsl:with-param name="NAMEFIRST"><xsl:value-of select="$NAMEFIRST"/></xsl:with-param>
            <xsl:with-param name="NAMENICK"><xsl:value-of select="$NAMENICK"/></xsl:with-param>
            <xsl:with-param name="NAMEPREF"><xsl:value-of select="$NAMEPREF"/></xsl:with-param>
            <xsl:with-param name="SURN"><xsl:value-of select="$SURN"/></xsl:with-param>
            <xsl:with-param name="BDATE"><xsl:value-of select="$BDATE"/></xsl:with-param>
            <xsl:with-param name="DDATE"><xsl:value-of select="$DDATE"/></xsl:with-param>
            <xsl:with-param name="src"><xsl:value-of select="$src"/></xsl:with-param>
            <xsl:with-param name="priv"><xsl:value-of select="$priv"/></xsl:with-param>
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
    <br/>
    <xsl:if test="string-length($BDATE) != 0">
    	<xsl:value-of select="$BDATE"/>
    </xsl:if>
    <br/>
    <xsl:if test="string-length($DDATE) != 0">
    	<xsl:value-of select="$DDATE"/>
    </xsl:if>
</xsl:template>

</xsl:stylesheet>
