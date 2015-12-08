<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:user="http://www.adriedenblanken.nl/"
                version="1.0">
<!--
// <author>Paul Kallenberg</author>
// <file>$Workfile: NageslachtGrafisch.xsl $</file><date>$Date: 2-12-13 16:06 $</date>
// <revision>$Revision: 21 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this
// header stays intact. No responsibility is accepted
// for use of this software.</disclaimer>
-->
<xsl:output method="html"/>

<xsl:include href="Header.xsl"/>
<xsl:include href="Talen.xsl"/>

<xsl:param name="HuidigPersoon"/>
<xsl:param name="Browser"/>
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
<xsl:param name="parTaal"/>

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

<!--  define the Javascript functions that you want to include within
        a msxsl:script element.
        - language indicates the scripting language
        - implements-prefix gives the namespace prefix that you
          declared for your function (i.e. foo) -->

<msxsl:script language="javascript" implements-prefix="user">
<![CDATA[

function A33_bep_blok_hoogtes()
{
	var i;
	var j;
	
	i=120;
	j=130;

	return i+j;
}

var box1;
var blok_hoogte;
var index_offset;
var infinity=20000;
var inter_box;

// max_nr_chil moet minimaal een meer zijn dan het maximale aantal kinderen per persoon
var max_nr_chil=40;
var max_nr_gen;
var max_gen;
var max_th;
var nr_gen;
var offset_x = 10;
//var offset_y = 200;
var offset_y;
var width_line = 25;
var width_box;
var x_max;
var x_max_p;
var x_mult;
var y_max;
var y_mult;

var nr_pers=0;
var nr_pers_strict=0;
var person_blok_hoogte=new Array();
var person_blok_teken_hoogte=new Array();
var person_chil_type=new Array();
var person_chil_prev_rel=new Array();
var person_code=new Array();
var person_fath_id=new Array();
var person_gen_nr=new Array();
var person_has_child=new Array();
var person_has_child_in_tree=new Array();
var person_has_offspr_gen=new Array();
var person_has_spouse=new Array();
var person_in_desc_set=new Array();
var person_in_desc_set_strict=new Array();
var person_in_stamboom=new Array();
var person_moth_id=new Array();
var person_nr_in_stamboom=new Array();
var person_nr_chil=new Array();
var person_nr_chil_in_tree=new Array();
var person_nr_rel=new Array();
var person_spouse_id=new Array();
var person_stamboom_ind=new Array();
var person_tak_hoogte=new Array();
var person_teken_hoogte=new Array();

var nr_fam=0;
var fam_chil_id=new Array();
var fam_div=new Array();
var fam_husb_id=new Array();
var fam_max_teken_hoogte=new Array();
var fam_min_teken_hoogte=new Array();
var fam_nr_chil=new Array();
var fam_parent_id=new Array();
var fam_read=new Array();
var fam_wife_id=new Array();

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

function read_max_nr_gen(n)
{
	if (n==0)
	{
		max_nr_gen=100;
		max_gen=max_nr_gen+1;
	}
	else
	{
		max_nr_gen=1*n;
		max_gen=max_nr_gen+1;
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
			width_box=375;
		}
		else
		{
			width_box=200;
		}
	}
	return "";
}

function read_pers_strict(code,gen_nr,tp)
{
	if ((code_ind(code)>nr_pers) && (1*gen_nr<=max_nr_gen))
	{
		nr_pers++;
		nr_pers_strict=nr_pers;
		person_code[nr_pers]=1*code;
		person_gen_nr[nr_pers]=1*gen_nr;
		person_in_desc_set[nr_pers]=true;
		person_in_desc_set_strict[nr_pers]=true;
		person_chil_type[nr_pers]=tp;
	}
	return "";
}

function read_pers_partner(code1,code2)
{
	if ((code_ind(code1)<=nr_pers_strict) && code_ind(code2)>nr_pers)
	{
		nr_pers++;
		person_code[nr_pers]=1*code2;
		person_in_desc_set[nr_pers]=true;
	}
	return "";
}

function initialize_pers()
{
	var i;
	var n;

	n = nr_pers;
	for (i=1;i<=n;i++)
	{
		person_chil_prev_rel[i]=false;
		person_has_child[i]=false;
		person_nr_chil[i]=0;
		person_nr_in_stamboom[i]=1;
		person_nr_rel[i]=0;
		person_in_stamboom[i]=false;
		person_gen_nr[i]=0;
		person_teken_hoogte[i]=0;
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
	return i;
}

function initialize_fam()
{
	var i;
	var j;

	for (i=1;i<=nr_pers;i++)
	{
		for (j=1;j<=nr_pers;j++)
		{
			fam_read[(i-1)*nr_pers+j]=false;
			fam_div[(i-1)*nr_pers+j]=false;
		}
	}

	return "";
}

function read_fam(c1,c2,sex)
{
	if (person_in_desc_set_strict[code_ind(c1)])
	{
		if ((fam_read[(code_ind(c1)-1)*nr_pers+code_ind(c2)]) || (fam_read[(code_ind(c2)-1)*nr_pers+code_ind(c1)]))
		{
		}
		else
		{
			nr_fam++;
			fam_nr_chil[nr_fam]=0;
			if (sex == "M")
			{
				fam_husb_id[nr_fam]=code_ind(c1);
				fam_wife_id[nr_fam]=code_ind(c2);
			}
			else
			{
				fam_wife_id[nr_fam]=code_ind(c1);
				fam_husb_id[nr_fam]=code_ind(c2);
			}
//			fam_read[(code_ind(c1)-1)*nr_pers+code_ind(c2)]=true;
//			fam_read[(code_ind(c2)-1)*nr_pers+code_ind(c1)]=true;
		}
	}

	return "";
}

function read_chil(c1,c2,c3)
{
	var c_tmp;

	if ((person_in_desc_set_strict[code_ind(c1)]) && (code_ind(c3)<=nr_pers))
	{
		if ((fam_read[(code_ind(c1)-1)*nr_pers+code_ind(c2)]) || (fam_read[(code_ind(c2)-1)*nr_pers+code_ind(c1)]))
		{
		}
		else
		{
		fam_nr_chil[nr_fam]++;
		c_tmp=code_ind(c3);
		fam_chil_id[(nr_fam-1)*max_nr_chil+fam_nr_chil[nr_fam]]=c_tmp;
		person_has_child[fam_husb_id[nr_fam]]=true;
		person_has_child[fam_wife_id[nr_fam]]=true;
		person_fath_id[c_tmp]=fam_husb_id[nr_fam];
		person_moth_id[c_tmp]=fam_wife_id[nr_fam];
		}
	}
	return "";
}

function read_div_fam(c1,c2)
{
	if (person_in_desc_set_strict[code_ind(c1)])
	{
		if ((fam_read[(code_ind(c1)-1)*nr_pers+code_ind(c2)]) || (fam_read[(code_ind(c2)-1)*nr_pers+code_ind(c1)]))
		{
		}
		else
		{
			fam_div[nr_fam]=true;
		}
	}
	return "";
}

function end_read_fam(c1,c2)
{
	if (person_in_desc_set_strict[code_ind(c1)])
	{
		if ((fam_read[(code_ind(c1)-1)*nr_pers+code_ind(c2)]) || (fam_read[(code_ind(c2)-1)*nr_pers+code_ind(c1)]))
		{
		}
		else
		{
			fam_read[(code_ind(c1)-1)*nr_pers+code_ind(c2)]=true;
			fam_read[(code_ind(c2)-1)*nr_pers+code_ind(c1)]=true;
		}
	}

	return "";
}

function initialize()
{
	var i;
	var j;

	for (i=1;i<=nr_pers;i++)
	{
		person_stamboom_ind[(i-1)*nr_pers+1]=i;
		for (j=2;j<=nr_pers;j++)
		{
			person_stamboom_ind[(i-1)*nr_pers+j]=0;
		}
		person_blok_teken_hoogte[i]=0;
		person_spouse_id[i]=0;
	}

	for (i=1;i<=nr_pers;i++)
	{
		for (j=1;j<=max_gen;j++)
		{
			person_has_offspr_gen[(i-1)*max_gen+j]=false;
		}
	}
	return "";
}

function persons_in_stamboom(c1)
{
	var root;
	var added;
	var i;
	var j;

	nr_gen = 1;
	root = code_ind(c1);
	person_in_stamboom[root] = true;
	person_gen_nr[root] = 1;

	added=true;
	while (added)
	{
		added=false;
		for (i=1;i<=nr_fam;i++)
		{
			if (person_in_stamboom[fam_husb_id[i]] || person_in_stamboom[fam_wife_id[i]])
			{
				for (j=1;j<=fam_nr_chil[i];j++)
				{
					if (!person_in_stamboom[fam_chil_id[(i-1)*max_nr_chil+j]])
					{
						person_in_stamboom[fam_chil_id[(i-1)*max_nr_chil+j]]=true;
						if (person_in_stamboom[fam_husb_id[i]])
						{
							person_gen_nr[fam_chil_id[(i-1)*max_nr_chil+j]]=person_gen_nr[fam_husb_id[i]]+1;
						}
						else
						{
							person_gen_nr[fam_chil_id[(i-1)*max_nr_chil+j]]=person_gen_nr[fam_wife_id[i]]+1;
						}
						added=true;
						if (nr_gen<person_gen_nr[fam_chil_id[(i-1)*max_nr_chil+j]])
						{
							nr_gen++;
						}
					}
				}
			}
		}
	}
	return "";
}

function det_fam_parent_id(c1)
{
	var i;
	var j;
	var m;
	var root;

    for (j=1;j<=nr_fam;j++)
    {
    	h_id=fam_husb_id[j];
    	w_id=fam_wife_id[j];
    	if (((person_in_stamboom[h_id]) && (!person_in_stamboom[w_id])) || (((person_in_stamboom[h_id])) && (person_in_stamboom[w_id]) && (person_gen_nr[h_id]<=person_gen_nr[w_id])))
    	{
    		fam_parent_id[j]=h_id;
    	}
    	if (((person_in_stamboom[w_id]) && (!person_in_stamboom[h_id])) || (((person_in_stamboom[w_id])) && (person_in_stamboom[h_id]) && (person_gen_nr[w_id]<person_gen_nr[h_id])))
    	{
    		fam_parent_id[j]=w_id;
    	}
    }

// bereken generatienummers opnieuw, op grond van unieke parent id
	for (i=1;i<=nr_pers;i++)
	{
		person_gen_nr[i]=0;
	}
	nr_gen = 1;
	root = code_ind(c1);
	person_gen_nr[root] = 1;

	for (m=1;m<=max_gen;m++)
	{
		for (i=1;i<=nr_fam;i++)
		{
			if (person_gen_nr[fam_parent_id[i]] == m)
			{
				for (j=1;j<=fam_nr_chil[i];j++)
				{
					person_gen_nr[fam_chil_id[(i-1)*max_nr_chil+j]]=m+1;
					if (m+1>nr_gen)
					{
						nr_gen=nr_gen+1;
					}
				}
			}
		}
	}
	return "";
}

function merge_fam()
//  Voeg families samen met zelfde ouder die ook in stamboom voorkomt
//  Als fam(i) gescheiden is, en fam(j) niet, voeg dan ook partner toe
{
	var i;
	var j;
	var k;
	var m;
	var mar_date_i;
	var mar_date_j;
	var husb_merge;
	var wife_merge;
	var tmp_arr = new Array();
	var ind = new Array();
	var ind_inv = new Array();

	for (i=1;i<=nr_pers;i++)
	{
		person_nr_chil[i]=0;
	}
	for (j=1;j<=nr_fam;j++)
	{
		person_nr_chil[fam_husb_id[j]]=person_nr_chil[fam_husb_id[j]]+fam_nr_chil[j];
		person_nr_chil[fam_wife_id[j]]=person_nr_chil[fam_wife_id[j]]+fam_nr_chil[j];
	}

	i = 1;
	while (i < nr_fam)
	{
		j = i + 1;
		while (j <= nr_fam)
		{
			husb_merge = ((fam_parent_id[i] == fam_parent_id[j]) && (fam_parent_id[i] == fam_husb_id[i]));
			wife_merge = ((fam_parent_id[i] == fam_parent_id[j]) && (fam_parent_id[i] == fam_wife_id[i]));

			if (husb_merge || wife_merge)
			{
// Voeg kinderen toe
				for (k = 1; k<=fam_nr_chil[j];k++)
				{
					fam_chil_id[(i-1)*max_nr_chil+ fam_nr_chil[i] + k] = fam_chil_id[(j-1)*max_nr_chil+k];
				}
// Voeg eventueel partner toe
//			mar_date_i = fam_mar_year[i] * 31 * 12 + fam_mar_month[i] * 31 + fam_mar_day[i]
//			mar_date_j = fam_mar_year[j] * 31 * 12 + fam_mar_month[j] * 31 + fam_mar_day[j]

			mar_date_i = 0;
			mar_date_j = 0;

			if (((fam_div[i]) || (mar_date_i < mar_date_j)) && (! fam_div[j]))
			{
				if (husb_merge)
				{
					fam_wife_id[i] = fam_wife_id[j];
				}
				if (wife_merge)
				{
					fam_husb_id[i] = fam_husb_id[j];
				}

				for (k = 1; k<=fam_nr_chil[i];k++)
				{
					person_chil_prev_rel[fam_chil_id[(i-1)*max_nr_chil+k]] = true;
				}
			}
			else
			{
				if ((! 0 < fam_div[i]) && fam_husb_id[i] && 0 < fam_wife_id[i])
				{
					for (k = 1 ;k<=fam_nr_chil[j];k++)
					{
						person_chil_prev_rel[fam_chil_id[(j-1)*max_nr_chil+k]] = true;
					}
				}
			}
			fam_nr_chil[i] = fam_nr_chil[i] + fam_nr_chil[j];
			if ((fam_div[i]) && (! fam_div[j]))
			{
				fam_div[i] = false;
			}

// Sorteer kinderen naar geboortedatum
//				for (k=1;k<=fam_nr_chil[i];k++)
//				{
//					tmp_arr[k] = person_birthyear[fam_chil_id[(i-1)*max_nr_chil+k]] * 13 * 32 * 24 * 60 + person_birthmonth[fam_chil_id[(i-1)*max_nr_chil+k]] * 32 * 24 * 60 + person_birthday[fam_chil_id[(i-1)*max_nr_chil+k]] * 24 * 60 + person_birthhour[fam_chil_id[(i-1)*max_nr_chil+k]] * 60 + person_birthmin[fam_chil_id[(i-1)*max_nr_chil+k]] * 1;
//					ind[k] = k;
//					ind_inv[k] = k;
//				}
//				quicksort(1,fam_nr_chil[i],tmp_arr,ind,ind_inv);
//				for (k=1;k<=fam_nr_chil[i];k++)
//				{
//					tmp_arr[k] = fam_chil_id[(i-1)*max_nr_chil+k];
//				}
//				for (k=1;k<=fam_nr_chil[i];k++)
//				{
//					fam_chil_id[(i-1)*max_nr_chil+k] = tmp_arr[ind[k]];
//				}

// Familie j is samengevoegd met en naar familie i; verwijder nu familie j, en schuif volgende terug
				for (k = j ;k<=nr_fam - 1; k++)
				{
					for (m=1;m<=max_nr_chil;m++)
					{
						fam_chil_id[(k-1)*max_nr_chil+m]=fam_chil_id[k*max_nr_chil+m];
 					}
					fam_div[k]=fam_div[k+1];
					fam_husb_id[k]=fam_husb_id[k+1];
					fam_nr_chil[k]=fam_nr_chil[k+1];
					fam_parent_id[k]=fam_parent_id[k+1];
					fam_wife_id[k]=fam_wife_id[k+1];
				}
			nr_fam = nr_fam - 1;
			j = j - 1;
			}
		j = j + 1;
        	}
	i = i + 1;
	}

// Check of persoon een spouse heeft
	for (i=1; i<=nr_pers;i++)
	{
		person_has_spouse[i]=false;
	}
	for (j=1;j<=nr_fam;j++)
	{
		if ((0<fam_wife_id[j]) && (!fam_div[j]))
		{
			person_has_spouse[fam_husb_id[j]]=true;
			person_spouse_id[fam_husb_id[j]]=fam_wife_id[j];
		}
		if ((fam_husb_id[j]>0) && (!fam_div[j]))
		{
			person_has_spouse[fam_wife_id[j]]=true;
			person_spouse_id[fam_wife_id[j]]=fam_husb_id[j];
		}
	}

	for (i=1;i<=nr_pers;i++)
	{
    	person_has_child_in_tree[i]=false;
        for (j=1;j<=nr_fam;j++)
        {
        	if ((fam_parent_id[j] == i) && (fam_nr_chil[j]>0))
        	{
        		person_has_child_in_tree[i]=true;
        	}
        }
    }

    for (i=1;i<=nr_pers;i++)
    {
    	person_nr_chil_in_tree[i]=0;
    }
    for (j=1;j<=nr_fam;j++)
    {
    	person_nr_chil_in_tree[fam_parent_id[j]]=person_nr_chil_in_tree[fam_parent_id[j]]+fam_nr_chil[j];
    }
	return "";
}

function bep_tak_hoogtes()
{
    var i;
    for (i=1;i<=nr_pers;i++)
    {
	   		person_tak_hoogte[i] = 1;
    }
	return "";
}

function det_stamboom(root)
{
	var i;
	var j;
	var added;
	var prs_gen_nr = new Array();
	var prs_in_stamboom = new Array();

    for (i=1;i<=nr_pers;i++)
    {
    	prs_in_stamboom[i] = false;
    }
    prs_in_stamboom[root] = true;
    prs_gen_nr[root] = 1;

    person_has_offspr_gen[(root-1)*max_gen+person_gen_nr[root]]=true;

    added=true;
// voeg successievelijk aan stamboom toe kinderen van personen die al in stamboom opgenomen zijn
    while (added)
    {
    	added=false;
    	for (i=1;i<=nr_fam;i++)
    	{
    		if (prs_in_stamboom[fam_parent_id[i]])
    		{
    			for (j=1;j<=fam_nr_chil[i];j++)
    			{
    				if (!prs_in_stamboom[fam_chil_id[(i-1)*max_nr_chil+j]])
    				{
                    	prs_in_stamboom[fam_chil_id[(i-1)*max_nr_chil+j]]=true;
                    	person_nr_in_stamboom[root] = person_nr_in_stamboom[root]+1;
                    	person_stamboom_ind[(root-1)*nr_pers+person_nr_in_stamboom[root]] = fam_chil_id[(i-1)*max_nr_chil+j];
                   		prs_gen_nr[fam_chil_id[(i-1)*max_nr_chil+j]] = prs_gen_nr[fam_parent_id[i]]+1;
                    	person_has_offspr_gen[(root-1)*max_gen+person_gen_nr[root]+prs_gen_nr[fam_chil_id[(i-1)*max_nr_chil+j]]-1] = true;
                    	added=true;
    				}
    			}
    		}
    	}
    }

	return "";
}

function bep_teken_hoogtes()
{
	var i;
	var j;
	var k;
	var m;
	var n;
	var p;
	var q;
	var c_id2;
	var c1;
	var cn;
	var shift;
	var min_tek;
	var person_teken_lb=new Array();
	var person_teken_ub=new Array();
	var fam_ub=new Array();
	var fam_has_offspring=new Array();

// person_teken_lb[(i-1)*max_gen+p] = laagste tekenwaarde in generatie p van persoon i
// person_teken_ub[(i-1)*max_gen+p] = hoogste tekenwaarde in generatie p van persoon i
// fam_ub(p) = hoogste tekenwaarde in generatie p van huidige familie;
//       ( -infinity als familie geen persoon in generatie p heeft; dit wordt weergegeven door fam_has_offspring(p) )

	for (i=1;i<=nr_pers;i++)
	{
		for (j=1;j<=max_gen;j++)
		{
	    	person_teken_lb[(i-1)*max_gen+j] = -infinity;
    	}
	}
    for (i=1;i<=nr_gen;i++)
    {
    	fam_ub[i]=-infinity;
    }

	for (i=1;i<=nr_pers;i++)
	{
    	person_teken_lb[(i-1)*max_gen+person_gen_nr[i]] = 1;
    	person_teken_ub[(i-1)*max_gen+person_gen_nr[i]] = person_teken_lb[(i-1)*max_gen+person_gen_nr[i]] + person_tak_hoogte[i];
    	det_stamboom(i);
	}

    for (m=nr_gen;1<=m;m--)
    {
    	for (i=1;i<=nr_pers;i++)
    	{
    		if (person_gen_nr[i] == m)
    		{
    			if (person_has_child_in_tree[i])
    			{
    				for (j=1;j<=nr_fam;j++)
    				{
    					if (0<fam_nr_chil[j])
    					{
    						if (i==fam_parent_id[j])
    						{
//  maak stamboom persoon i <--> kind 1
                            	person_teken_lb[(i-1)*max_gen+person_gen_nr[i]]=person_teken_lb[(fam_chil_id[(j-1)*max_nr_chil+1]-1)*max_gen+person_gen_nr[i]+1];
                            	person_teken_ub[(i-1)*max_gen+person_gen_nr[i]]=person_teken_lb[(i-1)*max_gen+person_gen_nr[i]]+person_tak_hoogte[i];
                            	fam_ub[person_gen_nr[i]]=person_teken_ub[(i-1)*max_gen+person_gen_nr[i]];
                            	fam_has_offspring[person_gen_nr[i]]=true;
                            	for (p=person_gen_nr[i]+1;p<=nr_gen;p++)
                            	{
	                            	person_teken_lb[(i-1)*max_gen+p]=person_teken_lb[(fam_chil_id[(j-1)*max_nr_chil+1]-1)*max_gen+p];
	                            	person_teken_ub[(i-1)*max_gen+p]=person_teken_ub[(fam_chil_id[(j-1)*max_nr_chil+1]-1)*max_gen+p];
                                    fam_has_offspring[p] = person_has_offspr_gen[(fam_chil_id[(j-1)*max_nr_chil+1]-1)*max_gen+p];
	                            	if (fam_has_offspring[p])
	                            	{
	                            		fam_ub[p] = person_teken_ub[(i-1)*max_gen+p];
	                            	}
	                            	else
	                            	{
	                            		fam_ub[p] = -infinity;
	                            	}
                            	}

                                for (k=2;k<=fam_nr_chil[j];k++)
                                {
// voeg kind k toe aan stamboom persoon i en kinderen 1 .. k-1
									c_id2 = fam_chil_id[(j-1)*max_nr_chil+k];
// bepaal hoe hoog persoon c_id2 = kind k + diens stamboom geplaatst kan worden (shift t.o.v. huidige positie)
									shift = -infinity;
									for (p=person_gen_nr[i]+1;p<=nr_gen;p++)
									{
										if (person_has_offspr_gen[(c_id2-1)*max_gen+p])
										{
											shift = Math.max(shift, fam_ub[p] - person_teken_lb[(c_id2-1)*max_gen+p]+0.25);
										}
									}
// voer verschuiving uit op persoon c_id2 + diens stamboom
									for (q=1;q<=person_nr_in_stamboom[c_id2];q++)
									{
										n = person_stamboom_ind[(c_id2-1)*nr_pers+q];
										for (p=person_gen_nr[n];p<=nr_gen;p++)
										{
											if (person_has_offspr_gen[(n-1)*max_gen+p])
											{
												person_teken_lb[(n-1)*max_gen+p]=person_teken_lb[(n-1)*max_gen+p] + shift;
												person_teken_ub[(n-1)*max_gen+p]=person_teken_ub[(n-1)*max_gen+p] + shift;
												fam_ub[p] = Math.max(fam_ub[p],person_teken_ub[(n-1)*max_gen+p]);
											}
										}
										person_teken_hoogte[n] = person_teken_hoogte[n] + shift;
									}
								}

// zet tekenhoogte persoon i = gemiddelde tekenhoogtes kind 1, kind fam(j).nr_chil
								c1 = fam_chil_id[(j-1)*max_nr_chil+1];
								cn = fam_chil_id[(j-1)*max_nr_chil+fam_nr_chil[j]];
                                person_teken_hoogte[i] = (person_teken_hoogte[c1] + person_teken_hoogte[cn] + person_tak_hoogte[cn])/2 - person_tak_hoogte[i]/2;

// bepaal voor persoon i .teken_lb(p) en .teken_ub(p) voor p = .gen_nr  ...  nr_gen
								person_teken_lb[(i-1)*max_gen+person_gen_nr[i]]=person_teken_hoogte[i];
								person_teken_ub[(i-1)*max_gen+person_gen_nr[i]]=person_teken_hoogte[i]+person_tak_hoogte[i];
								for (p=person_gen_nr[i];p<=nr_gen;p++)
								{
									for (k=1;k<=fam_nr_chil[j];k++)
									{
										if (person_has_offspr_gen[(fam_chil_id[(j-1)*max_nr_chil+k]-1)*max_gen+p])
										{
											if (person_teken_lb[(i-1)*max_gen+p] == -infinity)
											{
                                            	person_teken_lb[(i-1)*max_gen+p] = person_teken_lb[(fam_chil_id[(j-1)*max_nr_chil+k]-1)*max_gen+p];
											}
											else
											{
                                            	person_teken_lb[(i-1)*max_gen+p] = Math.min(person_teken_lb[(i-1)*max_gen+p],person_teken_lb[(fam_chil_id[(j-1)*max_nr_chil+k]-1)*max_gen+p]);
											}
										}
										if (person_has_offspr_gen[(fam_chil_id[(j-1)*max_nr_chil+k]-1)*max_gen+p])
										{
                                           	person_teken_ub[(i-1)*max_gen+p] = Math.max(person_teken_ub[(i-1)*max_gen+p],person_teken_ub[(fam_chil_id[(j-1)*max_nr_chil+k]-1)*max_gen+p]);
										}
									}
								}
    						}
    					}
    				}
    			}
    			else
    			{
    				person_teken_lb[(i-1)*max_gen+m] = 1;
    				person_teken_ub[(i-1)*max_gen+m] = person_teken_lb[(i-1)*max_gen+m] + person_tak_hoogte[i];
    				for (p=m+1;p<=nr_gen;p++)
    				{
	    				person_teken_ub[(i-1)*max_gen+p] = -infinity;
    				}
    				person_teken_hoogte[i] = 1;
    			}
    		}
    	}
    }

// hoog alle tekenwaardes op zodat deze allemaal minstens 1
    min_tek = infinity;
	for (i=1;i<=nr_pers;i++)
	{
		min_tek = Math.min(min_tek,person_teken_lb[(i-1)*max_gen+person_gen_nr[i]]);
	}
	for (i=1;i<=nr_pers;i++)
	{
		person_teken_hoogte[i] = person_teken_lb[(i-1)*max_gen+person_gen_nr[i]] - min_tek + 1;
	}

	return "";
}

function bep_blok_hoogtes()
{
	var i;
	var j;
	var k;
	var m;

	for (i=1;i<=nr_pers;i++)
	{
		person_blok_hoogte[i]=1;
	}

	for (i=nr_gen;1<=i;i--)
	{
		for (j=1;j<=nr_pers;j++)
		{
			if ((person_gen_nr[j] == i) && (person_in_stamboom[j]))
			{
 				for (k=1;k<=nr_fam;k++)
				{
					if (0<fam_nr_chil[k])
					{
						if ((fam_husb_id[k] == j) || (fam_wife_id[k] == j))
						{
							person_blok_hoogte[j]=0;
							for (m=1;m<=fam_nr_chil[k];m++)
							{
								person_blok_hoogte[j] = person_blok_hoogte[j] + person_blok_hoogte[fam_chil_id[(k-1)*max_nr_chil+m]];
							}
						}
					}
				}
			}
		}
	}
	return "";
}

function bep_blok_teken_hoogtes()
{
	var i;
	var j;
	var k;
	var m;
	var id;
	var nr_chil_gen_1;
	var calc;
	var blok_grens=new Array();

	for (i=1;i<=nr_pers;i++)
	{
		if (person_gen_nr[i] == 1)
		{
			person_blok_teken_hoogte[i] = 0
		}
	}
	for (i=2;i<=nr_gen;i++)
	{
		for (j=1;j<=nr_fam;j++)
		{
			if (0<fam_nr_chil[j])
			{
				calc = false
				if ((person_gen_nr[fam_husb_id[j]] == (i - 1)) && (person_in_stamboom[fam_husb_id[j]]))
				{
					id=fam_parent_id[j]
					calc=true
				}
				if ((person_gen_nr[fam_wife_id[j]] == (i - 1)) && (person_in_stamboom[fam_wife_id[j]]))
				{
					id=fam_parent_id[j]
					calc=true
				}
				if (calc)
				{
					person_blok_teken_hoogte[fam_chil_id[(j-1)*max_nr_chil+1]] = person_blok_teken_hoogte[id]
					for (k=2;k<=fam_nr_chil[j];k++)
					{
						person_blok_teken_hoogte[fam_chil_id[(j-1)*max_nr_chil+k]] = person_blok_teken_hoogte[fam_chil_id[(j-1)*max_nr_chil+k-1]] + person_blok_hoogte[fam_chil_id[(j-1)*max_nr_chil+k-1]]
					}
				}
			}
		}
	}

	for (j=1;j<=nr_fam;j++)
	{
		if (((person_gen_nr[fam_husb_id[j]] == 1) && (person_in_stamboom[fam_husb_id[j]])) || ((person_gen_nr[fam_wife_id[j]] == 1) && (person_in_stamboom[fam_wife_id[j]])))
		{
			nr_chil_gen_1 = fam_nr_chil[j]
			for (k=1;k<=fam_nr_chil[j];k++)
			{
				blok_grens[k] = person_blok_teken_hoogte[fam_chil_id[(j-1)*max_nr_chil+k]]
			}
		}
	}

	return ""
}

function bep_teken_parm()
{
	var i

	max_th=person_teken_hoogte[1]+person_tak_hoogte[1]
	for (i=1; i<=nr_pers;i++)
	{
		max_th=Math.max(max_th,person_teken_hoogte[i] + person_tak_hoogte[1])
	}

	inter_box = 2 * width_line
	box1 = width_box + inter_box

    x_max = (box1+(nr_gen-2)*(width_box+inter_box)+width_box+1)
   	y_max = (blok_hoogte + 0) * (max_th + 1)

	x_mult=1
	y_mult=1
   	index_offset = x_max+width_line*x_mult+10
	x_max_p = index_offset
	return ""
}

function in_desc(c1)
{
	if (person_in_desc_set_strict[code_ind(c1)])
	{
		return true;
	}
	else
	{
		return false;
	}
}

function write_width_box()
{
	return width_box
}

function write_blok_hoogte()
{
	return blok_hoogte
}

function write_width_line()
{
	return width_line
}

function write_top_coord(c1)
{
	i=code_ind(c1)
	if (i<=nr_pers)
	{
		return offset_y + blok_hoogte * person_teken_hoogte[i]
	}
	else
	{
		return 0;
	}
}

function write_left_coord(c1)
{
	i=code_ind(c1)
	if (i<=nr_pers)
	{
		return (offset_x + (width_box + 2*width_line) * (person_gen_nr[i]-1))
	}
	else
	{
		return 0;
	}
}

function write_streep_left_coord(c1)
{
	i=code_ind(c1)
	if (i<=nr_pers)
	{
		return (offset_x + (width_box + 2*width_line) * (person_gen_nr[i]-1)-width_line)
	}
	else
	{
		return 0;
	}
}

function write_streep_right_coord(c1)
{
	i=code_ind(c1)
	if (i<=nr_pers)
	{
		return (offset_x + (width_box + 2*width_line) * (person_gen_nr[i]-1))+width_box
	}
	else
	{
		return 0;
	}
}

function write_streep_coord(c1)
{
	i=code_ind(c1)
	if (i<=nr_pers)
	{
		return offset_y + blok_hoogte * (person_teken_hoogte[i]+0.5)-5
	}
	else
	{
		return 0;
	}
}

function write_box_left(c1)
{
	i=code_ind(c1)
	if ((person_in_desc_set_strict[i]) && (person_gen_nr[i]>1))
	{
		return true;
	}
	else
	{
		return false;
	}
}

function write_box_right(c1)
{
	i=code_ind(c1)
	if ((person_in_desc_set_strict[i]) && (person_has_child[i]))
	{
		return true;
	}
	else
	{
		return false;
	}
}

function bep_fam_teken_hoogtes()
{
	for (i=1;i<=nr_fam;i++)
	{
		fam_min_teken_hoogte[i]=infinity
		fam_max_teken_hoogte[i]=0
		for (k=1;k<=fam_nr_chil[i];k++)
		{
			fam_min_teken_hoogte[i]=Math.min(fam_min_teken_hoogte[i],person_teken_hoogte[fam_chil_id[(i-1)*max_nr_chil+k]])
			fam_max_teken_hoogte[i]=Math.max(fam_max_teken_hoogte[i],person_teken_hoogte[fam_chil_id[(i-1)*max_nr_chil+k]])
		}
	}
	return ""
}

function write_top_fam(c1)
{
	var i
	var j
	var index
	var found
	var top
	
	i=code_ind(c1)
	found=false
	for (j=1;j<=nr_fam;j++)
	{
		if (i==fam_parent_id[j])
		{
			found=true
			index=j
		}
	}
	if (found)
	{
		top=fam_min_teken_hoogte[index]
		return offset_y + blok_hoogte * (top+0.5)
	}
	else
	{
		return offset_y
	}
}

function write_height_fam(c1)
{
	var i
	var j
	var index
	var found
	var hgt
	
	i=code_ind(c1)
	found=false
	for (j=1;j<=nr_fam;j++)
	{
		if (i==fam_parent_id[j])
		{
			found=true
			index=j
		}
	}
	if (found)
	{
		hgt=fam_max_teken_hoogte[index]-fam_min_teken_hoogte[index]
		if (hgt>0)
		{
			return blok_hoogte * hgt + 1
		}
		else
		{
			return 0
		}
	}
	else
	{
		return 0
	}
}

function write_left_fam_coord(c1)
{
	i=code_ind(c1)
	if (i<=nr_pers)
	{
		return (offset_x + (width_box + 2*width_line) * person_gen_nr[i]-width_line)
	}
	else
	{
		return 0;
	}
}

function write_chil_type(c1)
{
	i=code_ind(c1)
	if (i<=nr_pers)
	{
		return (person_chil_type[i])
	}
	else
	{
		return 0;
	}
}

function write_max_top_coord()
{
		return (offset_y + blok_hoogte * max_th)
}

function write_max_left_coord()
{
		return (offset_x + (width_box + 2*width_line) * (nr_gen))
}

]]>
</msxsl:script>

<xsl:template match="PERSONEN">

  <xsl:call-template name="ShowMenu"/>

  <xsl:for-each select="PERSOON[@link=$HuidigPersoon]">

  <blockquote>
    <h2>
      <xsl:value-of select="$Txt_Nageslacht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text>
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

  <xsl:value-of select="user:read_offset_y(string($WeergaveCode))"/>
  <xsl:value-of select="user:read_max_nr_gen(string($parNrGeneraties))"/>
  <xsl:value-of select="user:read_blok_hoogte(string($WeergaveCode))"/>
  <xsl:value-of select="user:read_width_box(string($WeergaveCode))"/>

<!-- Bepaal de directe afstammelingen van de hoofdpersoon -->
    	<xsl:call-template name="VulDescSetStrict">
        	<xsl:with-param name="LinkVanDezePersoon"><xsl:value-of select="$HuidigPersoon"/></xsl:with-param>
        	<xsl:with-param name="GenNummer">1</xsl:with-param>
      	</xsl:call-template>
	</xsl:for-each>

<!-- Voeg partners toe -->
	<xsl:for-each select="PERSOON">
		<xsl:variable name="PersonLink" select="@link"/>
		<xsl:for-each select="RELATIONS/RELA">
			<xsl:variable name="PartnerLink" select="@link"/>
			<xsl:value-of select="user:read_pers_partner(string($PersonLink),string($PartnerLink))"/>
		</xsl:for-each>
	</xsl:for-each>
	
<!-- Initializatie -->
	<xsl:value-of select="user:initialize_pers()"/>
	<xsl:value-of select="user:initialize_fam()"/>
	
<!-- Lees familiegegevens -->	
	<xsl:for-each select="PERSOON">
		<xsl:variable name="PersonLink" select="@link"/>
		<xsl:variable name="PersonSex" select="PERSONAL/@sex"/>
		<xsl:for-each select="RELATIONS/RELA">
			<xsl:variable name="PartnerLink" select="@link"/>
			<xsl:value-of select="user:read_fam(string($PersonLink),string($PartnerLink),string($PersonSex))"/>
	        <xsl:for-each select="CHILDREN/CHIL">
    	    	<xsl:variable name="ChildLink" select="@link"/>
				<xsl:value-of select="user:read_chil(string($PersonLink),string($PartnerLink),string($ChildLink))"/>
    	    </xsl:for-each>
    	    <xsl:for-each select="END">
				<xsl:value-of select="user:read_div_fam(string($PersonLink),string($PartnerLink))"/>
    	    </xsl:for-each>
    	    <xsl:value-of select="user:end_read_fam(string($PersonLink),string($PartnerLink))"/>
		</xsl:for-each>
	</xsl:for-each>
	
<!-- Algemene initializatie -->
	<xsl:value-of select="user:initialize()"/>
<!-- Rekenwerk -->
	<xsl:value-of select="user:persons_in_stamboom(string($HuidigPersoon))"/>
	<xsl:value-of select="user:det_fam_parent_id(string($HuidigPersoon))"/>
	<xsl:value-of select="user:merge_fam()"/>
	<xsl:value-of select="user:bep_tak_hoogtes()"/>
	<xsl:value-of select="user:bep_teken_hoogtes()"/>
	<xsl:value-of select="user:bep_blok_hoogtes()"/>
	<xsl:value-of select="user:bep_blok_teken_hoogtes()"/>
	<xsl:value-of select="user:bep_teken_parm()"/>
	<xsl:value-of select="user:bep_fam_teken_hoogtes()"/>
	
<!-- Schrijf uitvoer -->
<!-- Blok per persoon met naam -->
	<xsl:for-each select="PERSOON">
		<xsl:variable name="PersonLink" select="@link"/>
			<xsl:if test="user:in_desc(string($PersonLink))='true'">
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
					<xsl:if test="$WeergaveCode=2">
						table-layout:fixed;
					</xsl:if>
                	white-space: nowrap;
                	width: <xsl:value-of select="user:write_width_box()"/>px;
                	height:<xsl:value-of select="user:write_blok_hoogte()"/>px; 
                	top:<xsl:value-of select="user:write_top_coord(string($PersonLink))"/>px;
                	left: <xsl:value-of select="user:write_left_coord(string($PersonLink))"/>px
                </xsl:attribute>
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
<!-- ===== Toevoeging relatie ===== -->
                    <xsl:if test="$WeergaveCode!=2">
	      				<xsl:for-each select="RELATIONS/RELA">
					        <xsl:variable name="relatieLink"><xsl:value-of select="@link"/></xsl:variable>
    		       			<xsl:for-each select="//PERSONEN/PERSOON[@link = $relatieLink]/PERSONAL">
        		   				<br />x
            		     		<xsl:call-template name="KinShowPersoon">
                		    		<xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
                    				<xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
                    				<xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
                    				<xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
		                    		<xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
		                    		<xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
    		              		</xsl:call-template>
        		        	</xsl:for-each>
            	    	</xsl:for-each>
            	    </xsl:if>
<!-- ===== Einde toevoeging relatie ===== -->
				</td>
<!-- ===== Toevoeging relatie ===== -->
				<xsl:if test="$WeergaveCode=1">
      				<xsl:for-each select="RELATIONS/RELA">
      				  <xsl:if test="position()=count(../RELA)">
				        <xsl:variable name="relatieLink"><xsl:value-of select="@link"/></xsl:variable>
    	       			<xsl:for-each select="//PERSONEN/PERSOON[@link = $relatieLink]/PERSONAL">
				      		<xsl:if test="PHOTOS">
        	    				<xsl:for-each select="PHOTOS">
		            				<td align="left" width="50">
               							<xsl:variable name="foto" select="PHOTO[position()=1]/@name"/>
                                        <xsl:variable name="title">
                                          <xsl:value-of select="PHOTO[position()=1]/@title"/>
                                          <xsl:text> (</xsl:text>
                                          <xsl:value-of select="$Txt_klik_voor_foto_in_apart_venster"/>
                                          <xsl:text>)</xsl:text>
                                        </xsl:variable>
                  						<a href="javascript:OpenFoto('{$relatieLink}',0)" name="afbeelding"
                	     					onMouseOver = "window.status='Open foto'; return true;"
                    	 					onMouseOut  = "window.status='';"
                     						onMouseDown = "window.status='Open foto'; geenRechterMuis();">
                   							<img src="{$varFolderFotoAlbum}/{$foto}" title="{$title}" alt="{$foto}" name="afbeelding" height="70" border="0" bordercolor="black"/>
               							</a>
			               			</td>
    			        		</xsl:for-each>
    			        	</xsl:if>
	        	    	</xsl:for-each>
	        	      </xsl:if>
	        	    </xsl:for-each>
				</xsl:if>
<!-- ===== Einde toevoeging relatie ===== -->
				</tr>
              </xsl:element>
              
<!-- Streepje links van blok als persoon niet tot eerste generatie behoort -->              
				<xsl:if test="user:write_box_left(string($PersonLink))='true'">
    	        	<xsl:element name="table">
                		<xsl:attribute name="style">
		                	position: absolute; border: 1px solid black; border-right: 0px; border-top: 0px; border-left: 0px; border-spacing: 0 ;
        		        	width: <xsl:value-of select="user:write_width_line()"/>px;
                			height:1px;
		                	top:<xsl:value-of select="user:write_streep_coord(string($PersonLink))"/>px;
        		        	left: <xsl:value-of select="user:write_streep_left_coord(string($PersonLink))"/>px
                		</xsl:attribute>
						<tr>
						<td align="center">
						</td>
						</tr>
        		    </xsl:element>
             	</xsl:if>
             	
<!-- Streepje rechts van blok als persoon kind(eren) heeft -->             	
				<xsl:if test="user:write_box_right(string($PersonLink))='true'">
    	        	<xsl:element name="table">
                		<xsl:attribute name="style">
		                	position: absolute; border: 1px solid black; border-right: 0px; border-top: 0px; border-left: 0px; border-spacing: 0 ;
        		        	width: <xsl:value-of select="user:write_width_line()"/>px;
                			height:1px; 
		                	top:<xsl:value-of select="user:write_streep_coord(string($PersonLink))"/>px;
        		        	left: <xsl:value-of select="user:write_streep_right_coord(string($PersonLink))"/>px
                		</xsl:attribute>
						<tr>
						<td align="center">
						</td>
						</tr>
        		    </xsl:element>
        		    
<!-- Verbindingsstreep verticaal van eerste naar laatste kind gezin -->        		    
        		    <xsl:if test="user:write_height_fam(string($PersonLink))!='0'">
    	        	<xsl:element name="table">
                		<xsl:attribute name="style">
		                	position: absolute; border: 1px solid black; border-right: 0px;  border-spacing: 0 ;
        		        	width: 0px;
                			height:<xsl:value-of select="user:write_height_fam(string($PersonLink))"/>px; 
		                	top:<xsl:value-of select="user:write_top_fam(string($PersonLink))"/>px;
        		        	left: <xsl:value-of select="user:write_left_fam_coord(string($PersonLink))"/>px
                		</xsl:attribute>
						<tr>
						<td align="center">
						</td>
						</tr>
        		    </xsl:element>
        		    </xsl:if>
             	</xsl:if>
			</xsl:if>
	</xsl:for-each>
	
<!-- (Bijna) lege tabel rechts onder, om onder- en rechterzijkant goed zichtbaar te krijgen -->	
    <xsl:element name="table">
	    <xsl:attribute name="style">
        	position: absolute; border: 0px solid black; border-spacing: 0;
            width: 10px;
            height:60px; 
            top:<xsl:value-of select="user:write_max_top_coord()"/>px;
            left: <xsl:value-of select="user:write_max_left_coord()"/>px
        </xsl:attribute>
        <tr>
        <td>
         <xsl:value-of select="$nbsp"/>
        </td>
        </tr>
    </xsl:element>
	
<!-- <xsl:call-template name="ShowFooter"/> -->
</xsl:template>

<xsl:template name="VulDescSetStrict">
  <xsl:param name="LinkVanDezePersoon"/>
  <xsl:param name="GenNummer"/>
  <xsl:param name="ChilType"/>
	<xsl:variable name="NextGenNr">
        <xsl:value-of select="$GenNummer+1"/>
    </xsl:variable>
<!-- Voer dit template alleen uit als het generatienummer hoogstens gelijk is aan het aantal te tonen generaties -->    
    <xsl:if test="$parNrGeneraties = 0 or $parNrGeneraties>=$GenNummer">
    <xsl:value-of select="user:read_pers_strict(string($LinkVanDezePersoon),string($GenNummer),string($ChilType))"/>

  <xsl:for-each select="//PERSONEN/PERSOON[@link=$LinkVanDezePersoon]">

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
              <xsl:with-param name="ChilType">
                <xsl:value-of select="@type"/>
              </xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
      </xsl:for-each>
  </xsl:for-each>
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
    <xsl:if test="user:in_desc(string($src))='true'">
      <xsl:call-template name="showTypeKind">
	    <xsl:with-param name="type"><xsl:value-of select="user:write_chil_type(string($src))"/></xsl:with-param>
	  </xsl:call-template>
	<xsl:if test="$WeergaveCode!=2">
    	<br/>
    </xsl:if>
    <xsl:if test="string-length($BDATE) != 0">
    	<xsl:text>* </xsl:text><xsl:value-of select="$BDATE"/>
    </xsl:if>
	<xsl:value-of select="$nbsp"/><xsl:value-of select="$nbsp"/><xsl:value-of select="$nbsp"/>
    <xsl:if test="string-length($DDATE) != 0">
    	<xsl:value-of select="$dagger"/><xsl:text> </xsl:text><xsl:value-of select="$DDATE"/>
    </xsl:if>
	<xsl:if test="$WeergaveCode!=2">
<!--    	<br/> -->
    </xsl:if>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>
