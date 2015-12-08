<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:svg="http://www.w3.org/2000/svg"
		xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:user="http://www.adriedenblanken.nl/"
		version="1.0">
<!--
// <author>Paul Kallenberg</author>
// <file>$Workfile: NageslachtCirkel.xsl $</file><date>$Date: 23-08-09 20:11 $</date>
// <revision>$Revision: 14 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this
// header stays intact. No responsibility is accepted
// for use of this software.</disclaimer>
-->
<xsl:output method="html"/>

<xsl:include href="Header.xsl"/>
<xsl:include href="Talen.xsl"/>

<xsl:param name="HuidigPersoon"/>
<xsl:param name="Browser"/>
<xsl:param name="parNrGeneraties"/>
<xsl:param name="Printing"/>
<xsl:param name="parToonVoornaam"/>
<xsl:param name="parToonVoettekst"/>
<xsl:param name="parRefOwner"/>
<xsl:param name="parRefOwnerEMail"/>
<xsl:param name="parToonKalender"/>
<xsl:param name="parStuurSorteersleutel"/>
<xsl:param name="parToonNieuws"/>
<xsl:param name="parTaal"/>

<msxsl:script language="javascript" implements-prefix="user">
<![CDATA[
var box1=75;
var blok_hoogte;
var index_offset;
var inter_box=10;
var fi0=Math.PI/12;
var height_box=10;

// max_nr_chil moet minimaal een meer zijn dan het maximale aantal kinderen per persoon
var max_nr_chil=40;
var max_nr_gen;
var max_gen;
var max_th;
var nr_gen;
var width_line;
var width_box=110;
var x_max=950;
var x_max_p;
var x_mult;
var y_max=x_max;
var y_mult;
var mx=x_max/2
var my=y_max/2

var nr_pers=0;
var nr_pers_strict=0;
var person_b_date=new Array();
var person_blok_hoogte=new Array();
var person_blok_kleur=new Array();
var person_blok_teken_hoogte=new Array();
var person_chil_prev_rel=new Array();
var person_chil_type=new Array();
var person_code=new Array();
var person_d_date=new Array();
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
var person_printname=new Array();
var person_spouse_id=new Array();
var person_stamboom_ind=new Array();

var nr_fam=0;
var fam_chil_id=new Array();
var fam_div=new Array();
var fam_husb_id=new Array();
var fam_nr_chil=new Array();
var fam_parent_id=new Array();
var fam_read=new Array();
var fam_wife_id=new Array();

var nr_kleuren=10;
var kleur=new Array();
kleur[0] = "#0276FD";
kleur[1] = "#00F5FF";
kleur[2] = "#2A8E82";
kleur[3] = "#FBEC5D";
kleur[4] = "#BCEE68";
kleur[5] = "#7EB6FF";
kleur[6] = "#84BE6A";
kleur[7] = "#FFFFAA";
kleur[8] = "#FF8C00";
kleur[9] = "#FF0000";

var segment_parm=new Array();

var textcurv_nr;
var max_font_grootte=12;
var min_font_grootte=1;
var font_breedte_factor = 1.6;
var font_hoogte_factor = 1.25;
var regel_1_factor = 1;
var textpath_parm=new Array();
var perc_used;

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
	return ""
}

function read_pers_partner(code1,code2)
{
	if ((code_ind(code1)<=nr_pers_strict) && code_ind(code2)>nr_pers)
	{
		nr_pers++;
		person_code[nr_pers]=1*code2;
		person_in_desc_set[nr_pers]=true;
	}
	return ""
}

function initialize_pers()
{
	var i
	var n

	n = nr_pers;
	for (i=1;i<=n;i++)
	{
		person_chil_prev_rel[i]=false
		person_has_child[i]=false
		person_nr_chil[i]=0
		person_nr_in_stamboom[i]=1
		person_nr_rel[i]=0
		person_in_stamboom[i]=false
		person_gen_nr[i]=0
	}

	return ""
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

function initialize_fam()
{
	var i
	var j

	for (i=1;i<=nr_pers;i++)
	{
		for (j=1;j<=nr_pers;j++)
		{
			fam_read[(i-1)*nr_pers+j]=false
			fam_div[(i-1)*nr_pers+j]=false
		}
	}

	return ""
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
			nr_fam++
			fam_nr_chil[nr_fam]=0
			if (sex == "M")
			{
				fam_husb_id[nr_fam]=code_ind(c1)
				fam_wife_id[nr_fam]=code_ind(c2)
			}
			else
			{
				fam_wife_id[nr_fam]=code_ind(c1)
				fam_husb_id[nr_fam]=code_ind(c2)
			}
//			fam_read[(code_ind(c1)-1)*nr_pers+code_ind(c2)]=true
//			fam_read[(code_ind(c2)-1)*nr_pers+code_ind(c1)]=true
		}
	}

	return ""
}

function read_chil(c1,c2,c3)
{
	var c_tmp
	
	if ((person_in_desc_set_strict[code_ind(c1)]) && (code_ind(c3)<=nr_pers))
	{
		if ((fam_read[(code_ind(c1)-1)*nr_pers+code_ind(c2)]) || (fam_read[(code_ind(c2)-1)*nr_pers+code_ind(c1)]))
		{
		}
		else
		{
		fam_nr_chil[nr_fam]++
		c_tmp=code_ind(c3)
		fam_chil_id[(nr_fam-1)*max_nr_chil+fam_nr_chil[nr_fam]]=c_tmp
		person_has_child[fam_husb_id[nr_fam]]=true
		person_has_child[fam_wife_id[nr_fam]]=true
		person_fath_id[c_tmp]=fam_husb_id[nr_fam]
		person_moth_id[c_tmp]=fam_wife_id[nr_fam]
		}
	}
	return ""
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
			fam_div[nr_fam]=true
		}
	}
	return ""
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
			fam_read[(code_ind(c1)-1)*nr_pers+code_ind(c2)]=true
			fam_read[(code_ind(c2)-1)*nr_pers+code_ind(c1)]=true
		}
	}

	return ""
}

function initialize()
{
	var i
	var j

	for (i=1;i<=nr_pers;i++)
	{
		person_stamboom_ind[(i-1)*nr_pers+1]=i
		for (j=2;j<=nr_pers;j++)
		{
			person_stamboom_ind[(i-1)*nr_pers+j]=0
		}
		person_blok_teken_hoogte[i]=0
		person_spouse_id[i]=0
	}

	for (i=1;i<=nr_pers;i++)
	{
		for (j=1;j<=max_gen;j++)
		{
			person_has_offspr_gen[(i-1)*max_gen+j]=false
		}
	}
	return ""
}

function persons_in_stamboom(c1)
{
	var root
	var added
	var i
	var j

	nr_gen = 1
	root = code_ind(c1)
	person_in_stamboom[root] = true;
	person_gen_nr[root] = 1

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
							person_gen_nr[fam_chil_id[(i-1)*max_nr_chil+j]]=person_gen_nr[fam_husb_id[i]]+1
						}
						else
						{
							person_gen_nr[fam_chil_id[(i-1)*max_nr_chil+j]]=person_gen_nr[fam_wife_id[i]]+1
						}
						added=true;
						if (nr_gen<person_gen_nr[fam_chil_id[(i-1)*max_nr_chil+j]])
						{
							nr_gen++
						}
					}
				}
			}
		}
	}
	return ""
}

function det_fam_parent_id(c1)
{
	var i
	var j
	var m
	var root

    for (j=1;j<=nr_fam;j++)
    {
    	h_id=fam_husb_id[j]
    	w_id=fam_wife_id[j]
    	if (((person_in_stamboom[h_id]) && (!person_in_stamboom[w_id])) || (((person_in_stamboom[h_id])) && (person_in_stamboom[w_id]) && (person_gen_nr[h_id]<=person_gen_nr[w_id])))
    	{
    		fam_parent_id[j]=h_id
    	}
    	if (((person_in_stamboom[w_id]) && (!person_in_stamboom[h_id])) || (((person_in_stamboom[w_id])) && (person_in_stamboom[h_id]) && (person_gen_nr[w_id]<person_gen_nr[h_id])))
    	{
    		fam_parent_id[j]=w_id
    	}
    }

// bereken generatienummers opnieuw, op grond van unieke parent id
	for (i=1;i<=nr_pers;i++)
	{
		person_gen_nr[i]=0
	}
	nr_gen = 1
	root = code_ind(c1)
	person_gen_nr[root] = 1

	for (m=1;m<=max_gen;m++)
	{
		for (i=1;i<=nr_fam;i++)
		{
			if (person_gen_nr[fam_parent_id[i]] == m)
			{
				for (j=1;j<=fam_nr_chil[i];j++)
				{
					person_gen_nr[fam_chil_id[(i-1)*max_nr_chil+j]]=m+1
					if (m+1>nr_gen)
					{
						nr_gen=nr_gen+1
					}
				}
			}
		}
	}
	return ""
}

function merge_fam()
//  Voeg families samen met zelfde ouder die ook in stamboom voorkomt
//  Als fam(i) gescheiden is, en fam(j) niet, voeg dan ook partner toe
{
	var i
	var j
	var k
	var m
	var mar_date_i
	var mar_date_j
	var husb_merge
	var wife_merge
	var tmp_arr = new Array()
	var ind = new Array()
	var ind_inv = new Array()

	for (i=1;i<=nr_pers;i++)
	{
		person_nr_chil[i]=0
	}
	for (j=1;j<=nr_fam;j++)
	{
		person_nr_chil[fam_husb_id[j]]=person_nr_chil[fam_husb_id[j]]+fam_nr_chil[j]
		person_nr_chil[fam_wife_id[j]]=person_nr_chil[fam_wife_id[j]]+fam_nr_chil[j]
	}

	i = 1
	while (i < nr_fam)
	{
		j = i + 1
		while (j <= nr_fam)
		{
			husb_merge = ((fam_parent_id[i] == fam_parent_id[j]) && (fam_parent_id[i] == fam_husb_id[i]))
			wife_merge = ((fam_parent_id[i] == fam_parent_id[j]) && (fam_parent_id[i] == fam_wife_id[i]))

			if (husb_merge || wife_merge)
			{
// Voeg kinderen toe 
				for (k = 1; k<=fam_nr_chil[j];k++)
				{
					fam_chil_id[(i-1)*max_nr_chil+ fam_nr_chil[i] + k] = fam_chil_id[(j-1)*max_nr_chil+k]
				}
// Voeg eventueel partner toe 
//			mar_date_i = fam_mar_year[i] * 31 * 12 + fam_mar_month[i] * 31 + fam_mar_day[i]
//			mar_date_j = fam_mar_year[j] * 31 * 12 + fam_mar_month[j] * 31 + fam_mar_day[j]

			mar_date_i = 0
			mar_date_j = 0

			if (((fam_div[i]) || (mar_date_i < mar_date_j)) && (! fam_div[j]))
			{
				if (husb_merge)
				{
					fam_wife_id[i] = fam_wife_id[j]
				}
				if (wife_merge)
				{
					fam_husb_id[i] = fam_husb_id[j]
				}

				for (k = 1; k<=fam_nr_chil[i];k++)
				{
					person_chil_prev_rel[fam_chil_id[(i-1)*max_nr_chil+k]] = true
				}
			}
			else
			{
				if ((! 0 < fam_div[i]) && fam_husb_id[i] && 0 < fam_wife_id[i])
				{
					for (k = 1 ;k<=fam_nr_chil[j];k++)
					{
						person_chil_prev_rel[fam_chil_id[(j-1)*max_nr_chil+k]] = true
					}
				}
			}
			fam_nr_chil[i] = fam_nr_chil[i] + fam_nr_chil[j]
			if ((fam_div[i]) && (! fam_div[j]))
			{
				fam_div[i] = false
			}

// Sorteer kinderen naar geboortedatum 
//				for (k=1;k<=fam_nr_chil[i];k++)
//				{
//					tmp_arr[k] = person_birthyear[fam_chil_id[(i-1)*max_nr_chil+k]] * 13 * 32 * 24 * 60 + person_birthmonth[fam_chil_id[(i-1)*max_nr_chil+k]] * 32 * 24 * 60 + person_birthday[fam_chil_id[(i-1)*max_nr_chil+k]] * 24 * 60 + person_birthhour[fam_chil_id[(i-1)*max_nr_chil+k]] * 60 + person_birthmin[fam_chil_id[(i-1)*max_nr_chil+k]] * 1
//					ind[k] = k
//					ind_inv[k] = k
//				}
//				quicksort(1,fam_nr_chil[i],tmp_arr,ind,ind_inv)
//				for (k=1;k<=fam_nr_chil[i];k++)
//				{
//					tmp_arr[k] = fam_chil_id[(i-1)*max_nr_chil+k]
//				}
//				for (k=1;k<=fam_nr_chil[i];k++)
//				{
//					fam_chil_id[(i-1)*max_nr_chil+k] = tmp_arr[ind[k]]
//				}

// Familie j is samengevoegd met en naar familie i; verwijder nu familie j, en schuif volgende terug 
				for (k = j ;k<=nr_fam - 1; k++)
				{
					for (m=1;m<=max_nr_chil;m++)
					{
						fam_chil_id[(k-1)*max_nr_chil+m]=fam_chil_id[k*max_nr_chil+m]
 					}
					fam_div[k]=fam_div[k+1]
					fam_husb_id[k]=fam_husb_id[k+1]
					fam_nr_chil[k]=fam_nr_chil[k+1]
					fam_parent_id[k]=fam_parent_id[k+1]
					fam_wife_id[k]=fam_wife_id[k+1]
				}
			nr_fam = nr_fam - 1
			j = j - 1
			}
		j = j + 1
        	}
	i = i + 1
	}

// Check of persoon een spouse heeft
	for (i=1; i<=nr_pers;i++)
	{
		person_has_spouse[i]=false
	}
	for (j=1;j<=nr_fam;j++)
	{
		if ((0<fam_wife_id[j]) && (!fam_div[j]))
		{
			person_has_spouse[fam_husb_id[j]]=true
			person_spouse_id[fam_husb_id[j]]=fam_wife_id[j]
		}
		if ((fam_husb_id[j]>0) && (!fam_div[j]))
		{
			person_has_spouse[fam_wife_id[j]]=true
			person_spouse_id[fam_wife_id[j]]=fam_husb_id[j]
		}
	}

	for (i=1;i<=nr_pers;i++)
	{
    	person_has_child_in_tree[i]=false
        for (j=1;j<=nr_fam;j++)
        {
        	if ((fam_parent_id[j] == i) && (fam_nr_chil[j]>0))
        	{
        		person_has_child_in_tree[i]=true
        	}
        }
    }

    for (i=1;i<=nr_pers;i++)
    {
    	person_nr_chil_in_tree[i]=0
    }
    for (j=1;j<=nr_fam;j++)
    {
    	person_nr_chil_in_tree[fam_parent_id[j]]=person_nr_chil_in_tree[fam_parent_id[j]]+fam_nr_chil[j]
    }
	return ""
}

function det_stamboom(root)
{
	var i
	var j
	var added
	var prs_gen_nr = new Array()
	var prs_in_stamboom = new Array()

    for (i=1;i<=nr_pers;i++)
    {
    	prs_in_stamboom[i] = false
    }
    prs_in_stamboom[root] = true
    prs_gen_nr[root] = 1

    person_has_offspr_gen[(root-1)*max_gen+person_gen_nr[root]]=true

    added=true
// voeg successievelijk aan stamboom toe kinderen van personen die al in stamboom opgenomen zijn
    while (added)
    {
    	added=false
    	for (i=1;i<=nr_fam;i++)
    	{
    		if (prs_in_stamboom[fam_parent_id[i]])
    		{
    			for (j=1;j<=fam_nr_chil[i];j++)
    			{
    				if (!prs_in_stamboom[fam_chil_id[(i-1)*max_nr_chil+j]])
    				{
                    	prs_in_stamboom[fam_chil_id[(i-1)*max_nr_chil+j]]=true
                    	person_nr_in_stamboom[root] = person_nr_in_stamboom[root]+1
                    	person_stamboom_ind[(root-1)*nr_pers+person_nr_in_stamboom[root]] = fam_chil_id[(i-1)*max_nr_chil+j]
                   		prs_gen_nr[fam_chil_id[(i-1)*max_nr_chil+j]] = prs_gen_nr[fam_parent_id[i]]+1
                    	person_has_offspr_gen[(root-1)*max_gen+person_gen_nr[root]+prs_gen_nr[fam_chil_id[(i-1)*max_nr_chil+j]]-1] = true
                    	added=true
    				}
    			}
    		}
    	}
    }

	return ""
}

function bep_blok_hoogtes()
{
	var i
	var j
	var k
	var m

	for (i=1;i<=nr_pers;i++)
	{
		person_blok_hoogte[i]=1
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
							person_blok_hoogte[j]=0
							for (m=1;m<=fam_nr_chil[k];m++)
							{
								person_blok_hoogte[j] = person_blok_hoogte[j] + person_blok_hoogte[fam_chil_id[(k-1)*max_nr_chil+m]]
							}
						}
					}
				}
			}
		}
	}
	return ""
}

function bep_blok_teken_hoogtes()
{
	var i
	var j
	var k
	var m
	var id
	var nr_chil_gen_1
	var calc
	var blok_grens=new Array()

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
	
	for (i=1;i<=nr_pers;i++)
	{
		if ((person_gen_nr[i] == 1) && (person_in_stamboom[i]))
		{
			person_blok_kleur[i] = 0
		}
	}
	for (j=1;j<=nr_fam;j++)
	{
		if (person_gen_nr[fam_parent_id[j]] == 1)
		{
			for (k=1;k<=fam_nr_chil[j];k++)
			{
				if (k<=nr_kleuren-1)
				{
					person_blok_kleur[fam_chil_id[(j-1)*max_nr_chil+k]] = k
				}
				else
				{
                	person_blok_kleur[fam_chil_id[(j-1)*max_nr_chil+k]]=person_blok_kleur[fam_chil_id[(j-1)*max_nr_chil+k-nr_kleuren+1]]
				}
			}
		}
	}
	for (m=2;m<=nr_gen;m++)
	{
		for (j=1;j<=nr_fam;j++)
		{
			if (person_gen_nr[fam_parent_id[j]] == m)
			{
				for (k=1;k<=fam_nr_chil[j];k++)
				{
					person_blok_kleur[fam_chil_id[(j-1)*max_nr_chil+k]] = person_blok_kleur[fam_parent_id[j]]
				}
			}
		}
	}

	return ""
}

function bep_cirkel_teken_parm()
{
	var i

	max_th=person_blok_teken_hoogte[1];
	for (i=2; i<=nr_pers;i++)
	{
		max_th=Math.max(max_th,person_blok_teken_hoogte[i]);
	}
	x_mult=Math.min(mx,my)/(box1+(Math.max(nr_gen,4)-2)*(width_box+inter_box)+width_box+1);
	y_mult=x_mult;

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

function read_printname(c1,printname)
{
	var i;
	
	i=code_ind(c1);
	person_printname[i]=printname;
	return"";
}

function read_bdate(c1,bdate)
{
	var i;
	
	i=code_ind(c1);
	person_b_date[i]=bdate;
	return"";
}

function read_ddate(c1,ddate)
{
	var i;
	
	i=code_ind(c1);
	person_d_date[i]=ddate;
	return"";
}

function circle_transform(x,y,res_arr)
{
	var r;

	r=x;
	res_arr[3] = fi0 + y/y_max * (2 * Math.PI - 2 * fi0);
	res_arr[1] = x_mult * r * Math.sin(res_arr[3]) + mx;
	res_arr[2] = -y_mult * r * Math.cos(res_arr[3]) + my;
	return;
}

function calc_block_coord(c1)
{
	var indx;
	var x1;
	var x2;
	var y1;
	var y2;
	var arc_type;
	var fi = new Array(5);
	var xp = new Array(5);
	var yp = new Array(5);
	var tmp = new Array(4);
	var str = new Array();

	var fg1h;
	var fg1hh;
	var fg1v;
	var fg_max;
	var fg_max1;
	var fg_maxn;
	var fgnh;
	var fgnv;
	var fgn_hh;
	var font_grootte;
	var font_hoogte;
		
	var arc_type;
	var fit;
	var i;
	var nr_names;
	var name_str;
	var nr_tekst;
	var lng_tot;
	var printing_type;
	var print_orient;
	var reverse;
	var sweep;
	var lng = new Array();
	var tekst = new Array();
	
	indx=code_ind(c1);
	x1=box1+(person_gen_nr[indx]-2)*(width_box+inter_box);
	x2=x1+width_box;
	y1=person_blok_teken_hoogte[indx]*y_max/(max_th+1);
//	y2=y1+Math.max(person_blok_hoogte[indx]*y_max/(max_th+1)-1,0.1);
	y2=y1+Math.max(person_blok_hoogte[indx]*y_max/(max_th+1)-0,0.1);

// De hoek-coordinaten van een box zijn, linksboven beginnend en met de klok meedraaiend, (x1, y1), (x2, y1), (x2, y2), (x1, y2)
    circle_transform(x1,y1,tmp);
	xp[1]=tmp[1];
	yp[1]=tmp[2];
	fi[1]=tmp[3];
    circle_transform(x2,y1,tmp);
	xp[2]=tmp[1];
	yp[2]=tmp[2];
	fi[2]=tmp[3];
    circle_transform(x1,y2,tmp);
	xp[3]=tmp[1];
	yp[3]=tmp[2];
	fi[3]=tmp[3];
    circle_transform(x2,y2,tmp);
	xp[4]=tmp[1];
	yp[4]=tmp[2];
	fi[4]=tmp[3];
	
// teken cirkelsegment
	if (fi[4] - fi[2] <= Math.PI)
	{
		arc_type=0;
	}
	else
	{
		arc_type=1;
	}
	segment_parm[1]=xp[1];
	segment_parm[2]=xp[2];
	segment_parm[3]=xp[3];
	segment_parm[4]=xp[4];
	segment_parm[5]=yp[1];
	segment_parm[6]=yp[2];
	segment_parm[7]=yp[3];
	segment_parm[8]=yp[4];
	segment_parm[9]=x_mult*x1;
	segment_parm[10]=x_mult*x2;
	segment_parm[11]=arc_type;
	segment_parm[12]=kleur[person_blok_kleur[indx]];
	segment_parm[13]=mx;
	segment_parm[14]=my;
	segment_parm[15]=(box1-inter_box)*x_mult;
	
// svg-code van de tekst in het blok

	str[1]=person_printname[indx];
//	str[2]=person_b_date[indx];
//	str[3]=person_d_date[indx];
	lng[1]=str[1].length
//	lng[2]=str[2].length
//	lng[3]=str[3].length
//	nr_names=3;
	nr_names=1;

	name_str="";
	lng_tot=0;
	for (i=1;i<=nr_names;i++)
	{
	    name_str=name_str + str[i];
    	lng_tot = lng_tot + lng[i];
    }


// Bepaal het printtype:
// 1. De tekst past horizontaal op 1 regel met maximaal font
// 2. De tekst past horizontaal op 3 regels met maximaal font
// 		(Regel 1: directe afstammeling; regel 2 : x; regel 3: laatste partner)
// 3. De tekst past verticaal op 1 regel met maximaal font
// 4. De tekst past verticaal op 3 regels met maximaal font
// De tekst past niet met maximaal font.
// Dan wordt de fontgrootte berekend voor elk van de mogelijke printvarianten (horizontaal / verticaal; verdelen over 1 / 3 regels) zodat de tekst in de box past
// De tekst wordt geprint met de maximaal mogelijke fontgrootte.
// In geval van afstammeling + partner:
// 5. De tekst wordt geprint op 3 regels horizontaal
// 6. De tekst wordt geprint op 3 regels verticaal
// 7. De tekst wordt geprint op 1 regel horizontaal
// 8. De tekst wordt geprint op 1 regel verticaal
// In geval van alleen afstammeling:
// 9. De tekst wordt geprint op 1 regel horizontaal
// 10. De tekst wordt geprint op 1 regel verticaal

    if ((lng_tot <= font_breedte_factor * width_box * x_mult / max_font_grootte) && (regel_1_factor / font_hoogte_factor * max_font_grootte <= (fi[3]-fi[1])*x1 * x_mult))
    {
    	printing_type = 1;
	}
	else
	{
		fit =true;
		for (i=1;i<=nr_names;i++)
		{
			if (lng[i] > font_breedte_factor * width_box * x_mult / max_font_grootte)
			{
				fit=false;
			}
		}
		if ((fit) && ((1+(nr_names-1)*2) / font_hoogte_factor * max_font_grootte <= (fi[3]-fi[1])*x1 * x_mult))
		{
			printing_type = 2;
		}
		else
		{
			if (lng_tot <= (fi[3]-fi[1])*(x1+x2)/2 * x_mult / max_font_grootte * font_breedte_factor*0.7)
			{
				printing_type = 3;
			}
			else
			{
				fit=true;
				for (i=1;i<=nr_names;i++)
				{
					if (lng[i] > (fi[3]-fi[1])*((nr_names-1)*x1+x2)/nr_names * x_mult / max_font_grootte * font_breedte_factor*0.7)
					{
						fit=false;
					}
				}
				if ((fit) && ((1+(nr_names-1)*2) / font_hoogte_factor * max_font_grootte <= width_box * x_mult))
				{
					printing_type = 4;
				}
				else
				{
					if (nr_names>1)
					{
// fg1h: fontgrootte bij afdrukken op 1 regel, horizontaal
// fgnh: fontgrootte van string 1 bij afdrukken op n regels horizontaal
// fg_max: maximaal mogelijke fontgrootte (vier mogelijkheden: 1 / n regels; horizontaal / verticaal)
						fg1h = font_breedte_factor * width_box * x_mult / lng_tot;
						fg1hh= (fi[3]-fi[1])*x1 * x_mult/regel_1_factor*font_hoogte_factor;
						fg1h=Math.min(fg1h,fg1hh);
						fg1v = 0.7*font_breedte_factor * (fi[3]-fi[1])*(x1+x2)/2 * x_mult / lng_tot;
                        fg_max1 = Math.max(fg1h,fg1v);

						fgnh = font_breedte_factor * width_box * x_mult / lng[1];
						for (i=2;i<=nr_names;i++)
						{
							fgnh = Math.min(fgnh,font_breedte_factor * width_box * x_mult / lng[i]);
						}
                        fgn_hh = (fi[3]-fi[1])*x1 * x_mult /(1+(nr_names-1)*2) * font_hoogte_factor;
                        fgnh = Math.min(fgnh,fgn_hh);

                        fgnv = 0.7*font_breedte_factor * (fi[3]-fi[1])*((nr_names-1)*x1+x2)/nr_names * x_mult / lng[1];
                        for (i=2;i<=nr_names;i++)
                        {
	                        fgnv = Math.min(fgnv,0.8*font_breedte_factor * (fi[3]-fi[1])*((nr_names-1)*x1+x2)/nr_names * x_mult / lng[i]);
	                    }
						fgnv = Math.min(fgnv,width_box * x_mult * font_hoogte_factor / (1+(nr_names-1)*2));

                        fg_maxn = Math.max(fgnh,fgnv);
                        fg_max = Math.max(fg_max1,fg_maxn);

                        if (fg_max == fg1h)
                        {
                        	printing_type = 7;
                        }
                        if (fg_max == fg1v)
                        {
                        	printing_type = 8;
                        }
                        if (fg_max == fgnh)
                        {
                        	printing_type = 5;
                        }
                        if (fg_max == fgnv)
                        {
                        	printing_type = 6;
                        }
					}
					else
					{
						if ((fi[3]-fi[1])*(x1+x2)/2 <= width_box)
						{
							printing_type = 9;
						}
						else
						{
							printing_type = 10;
						}
					}
				}
			}
		}
	}
// Einde bepaling printing-type

// Print volgens print-type en font-grootte
    if (printing_type <= 4)
    {
    	font_grootte = max_font_grootte;
    }
    else
    {
    	if (printing_type <= 8)
    	{
    		font_grootte = Math.round(Math.max(fg_max,min_font_grootte));
    	}
    	else
    	{
    		if (printing_type == 9)
    		{
				font_grootte = Math.max(Math.min(Math.min(font_breedte_factor * width_box * x_mult / lng[1],(fi[3]-fi[1])*x1 * x_mult/regel_1_factor*font_hoogte_factor),max_font_grootte),min_font_grootte);
    		}
    		else
    		{
				font_grootte = Math.max(Math.min(font_breedte_factor * (fi[3]-fi[1]) * (x1 + x2) / 2 * x_mult / lng[1],max_font_grootte),min_font_grootte);
    		}
    	}
    }

	font_hoogte = (font_grootte/font_hoogte_factor);

	if ((printing_type ==1) || (printing_type==3) || (printing_type==7) || (printing_type==8) || (printing_type==9) || (printing_type==10))
	{
		tekst[1] = name_str;
		nr_tekst = 1;
	}
	if ((printing_type ==2) || (printing_type==4) || (printing_type==5) || (printing_type==6))
	{
		for (i=1;i<=nr_names;i++)
		{
			tekst[i]=str[i];
		}
		nr_tekst=nr_names;
	}
    if ((printing_type == 1) || (printing_type == 2) || (printing_type == 5) || (printing_type == 7) || (printing_type == 9))
    {
    	print_orient = "h";
    }
    else
    {
    	print_orient = "v";
    }

	if (print_orient == "h")
	{
		textpath_parm[0]="x_dir";
		perc_used=100*lng_tot*font_grootte/font_breedte_factor/width_box/x_mult;
    	reverse = (y1 + y2 > y_max + height_box);
	    if (reverse)
    	{
    		for (i=1;i<=nr_tekst;i++)
    		{
    			circle_transform (x1, Math.max((i*y1 + (nr_tekst+1-i)*y2) / (nr_tekst+1) - font_hoogte *y_max/x1/x_mult/ 2/(Math.PI-fi0)/2, Math.min(y1, y2)), tmp);
				xp[2]=tmp[1];yp[2]=tmp[2];fi[2]=tmp[3];
    			circle_transform (x2, Math.max((i*y1 + (nr_tekst+1-i)*y2) / (nr_tekst+1) - font_hoogte *y_max/x1/x_mult/ 2/(Math.PI-fi0)/2, Math.min(y1, y2)), tmp);
				xp[1]=tmp[1];yp[1]=tmp[2];fi[1]=tmp[3];
				textpath_parm[5*(i-1)+1]=xp[1];
				textpath_parm[5*(i-1)+2]=xp[2];
				textpath_parm[5*(i-1)+3]=yp[1];
				textpath_parm[5*(i-1)+4]=yp[2];
				textpath_parm[5*(i-1)+5]=font_grootte;
//	            print_x_dir(xp[1],yp[1],xp[2],yp[2],font_grootte,tekst[i]);
	        }
    	}
	    else
    	{
    		for (i=1;i<=nr_tekst;i++)
    		{
	    	    circle_transform (x1, Math.min(((nr_tekst+1-i)*y1 + i*y2) / (nr_tekst+1) + font_hoogte *y_max/x1/x_mult/ 2/(Math.PI-fi0)/2, Math.max(y1, y2)), tmp)
				xp[1]=tmp[1];yp[1]=tmp[2];fi[1]=tmp[3]
	    	    circle_transform (x2, Math.min(((nr_tekst+1-i)*y1 + i*y2) / (nr_tekst+1) + font_hoogte *y_max/x1/x_mult/ 2/(Math.PI-fi0)/2, Math.max(y1, y2)), tmp)
				xp[2]=tmp[1];yp[2]=tmp[2];fi[2]=tmp[3]
				textpath_parm[5*(i-1)+1]=xp[1];
				textpath_parm[5*(i-1)+2]=xp[2];
				textpath_parm[5*(i-1)+3]=yp[1];
				textpath_parm[5*(i-1)+4]=yp[2];
				textpath_parm[5*(i-1)+5]=font_grootte;
// 		        print_x_dir(xp[1],yp[1],xp[2],yp[2],font_grootte,tekst[i])
			}
	    }
	}
	
	if (print_orient == "v")
	{
		textpath_parm[0]="y_dir";
		perc_used=0.75*100*lng_tot*font_grootte/(fi[3]-fi[1])/((x1+x2)/2)/x_mult/font_breedte_factor/0.7;
    	reverse = ((y1 +y2 > (y_max + height_box) * (Math.PI - 2 * fi0) / (2*Math.PI-2*fi0)) && (y1 + y2 < (y_max + height_box) * (3*Math.PI - 2 * fi0) / (2*Math.PI-2*fi0)))
        if (reverse)
        {
            sweep=0
        }
        else
        {
            sweep=1
        }
        
		nr_regels=nr_tekst;
        if (reverse)
           {
           		for (i=1;i<=nr_tekst;i++)
                {
					circle_transform(((nr_regels+1-i)*x1+i*x2)/(nr_regels+1)+font_hoogte/x_mult/2,y1,tmp)
					xp[2]=tmp[1];yp[2]=tmp[2];fi[2]=tmp[3]
					circle_transform(((nr_regels+1-i)*x1+i*x2)/(nr_regels+1)+font_hoogte/x_mult/2,y2,tmp)
					xp[1]=tmp[1];yp[1]=tmp[2];fi[1]=tmp[3]
					textpath_parm[8*(i-1)+1]=xp[1];
					textpath_parm[8*(i-1)+2]=xp[2];
					textpath_parm[8*(i-1)+3]=yp[1];
					textpath_parm[8*(i-1)+4]=yp[2];
					textpath_parm[8*(i-1)+5]=font_grootte;
					textpath_parm[8*(i-1)+6]=((nr_regels+1-i)*x1+i*x2)/(nr_regels+1)*x_mult+font_hoogte/2;
					textpath_parm[8*(i-1)+7]=arc_type;
					textpath_parm[8*(i-1)+8]=sweep;
//		        	print_y_dir(xp[1],yp[1],xp[2],yp[2],font_grootte,tekst[i],((nr_regels+1-i)*x1+i*x2)/(nr_regels+1)*x_mult+font_hoogte/2,arc_type,sweep)
		        }
           }
           else
           {
           		for (i=1;i<=nr_tekst;i++)
                {
					circle_transform((i*x1+(nr_regels+1-i)*x2)/(nr_regels+1)-font_hoogte/x_mult/2,y1,tmp)
					xp[1]=tmp[1];yp[1]=tmp[2];fi[1]=tmp[3]
					circle_transform((i*x1+(nr_regels+1-i)*x2)/(nr_regels+1)-font_hoogte/x_mult/2,y2,tmp)
					xp[2]=tmp[1];yp[2]=tmp[2];fi[2]=tmp[3]
					textpath_parm[8*(i-1)+1]=xp[1];
					textpath_parm[8*(i-1)+2]=xp[2];
					textpath_parm[8*(i-1)+3]=yp[1];
					textpath_parm[8*(i-1)+4]=yp[2];
					textpath_parm[8*(i-1)+5]=font_grootte;
					textpath_parm[8*(i-1)+6]=(i*x1+(nr_regels+1-i)*x2)/(nr_regels+1)*x_mult-font_hoogte/2;
					textpath_parm[8*(i-1)+7]=arc_type;
					textpath_parm[8*(i-1)+8]=sweep;
//		        	print_y_dir(xp[1],yp[1],xp[2],yp[2],font_grootte,tekst[i],(i*x1+(nr_regels+1-i)*x2)/(nr_regels+1)*x_mult-font_hoogte/2,arc_type,sweep)
		        }
		   }
    }
    
// einde svg-code van de tekst in het blok
	
	return "";
}

function write_segment_parm(i)
{
	return segment_parm[i];
}

function calc_textpath_parm_1(c1)
{
	var i;
	var font_grootte_1;
	var lng;
	
	i=code_ind(c1);
	
    lng = person_printname[i].length;
    if (lng > 0)
    {
   	    font_grootte_1 = Math.max(min_font_grootte,Math.min(max_font_grootte,font_breedte_factor*x_mult/lng*2*Math.sqrt(Math.max(0,(box1-inter_box)*(box1-inter_box)-max_font_grootte/font_hoogte_factor))))
    }
    else
    {
   		font_grootte_1 = max_font_grootte;
    }

    perc_used=0.75*100*lng*font_grootte_1/font_breedte_factor/width_box/x_mult;
	textpath_parm[0]="x_dir";
    textpath_parm[1]=mx - (box1-inter_box)*x_mult;
	textpath_parm[2]=mx + (box1-inter_box)*x_mult;
	textpath_parm[3]=my;
	textpath_parm[4]=my;
	textpath_parm[5]=font_grootte_1;
	
	return"";
}

function write_textpath_parm(i)
{
	return textpath_parm[i];
}

function write_begin_perc()
{
	var perc=Math.max(50-perc_used/2,5);
	return perc;
}

function init_textcurv_nr()
{
	textcurv_nr=0;
	return "";
}

function incr_textcurv_nr()
{
	textcurv_nr++;
	return "";
}

function write_textcurv_nr()
{
	return textcurv_nr;
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

]]>
</msxsl:script>

<xsl:template match="PERSONEN">

  <xsl:call-template name="ShowMenu"/>

  <xsl:for-each select="PERSOON[@link=$HuidigPersoon]">

  <blockquote>
    <h2>
      <xsl:value-of select="$Txt_Nageslachtcirkel"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text>
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
    
  <xsl:value-of select="user:read_max_nr_gen(string($parNrGeneraties))"/>

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
	<xsl:value-of select="user:bep_blok_hoogtes()"/>
	<xsl:value-of select="user:bep_blok_teken_hoogtes()"/>
	<xsl:value-of select="user:bep_cirkel_teken_parm()"/>
	
<!-- Start inline svg -->
    <svg:svg width="960" height="960">
    	<xsl:value-of select="user:init_textcurv_nr()"/>
		<xsl:for-each select="PERSOON">
			<xsl:variable name="PersonLink" select="@link"/>
			<xsl:if test="user:in_desc(string($PersonLink))='true'">
				<xsl:variable name="printname">
     			  <xsl:if test="$parToonVoornaam=1">
   					<xsl:choose>
	       				<xsl:when test="string-length(PERSONAL/NAME/@nick) = 0">
					        <xsl:choose>
          <!-- pak de eerste naam van de voornamen -->
					        	<xsl:when test="string-length(substring-before(PERSONAL/NAME/@first,' ')) != 0">
						            <xsl:value-of select="substring-before(PERSONAL/NAME/@first,' ')"/>
          						</xsl:when>
          						<xsl:otherwise>
            						<xsl:value-of select="PERSONAL/NAME/@first"/>
          						</xsl:otherwise>
        					</xsl:choose>
       					</xsl:when>
       					<xsl:otherwise>
       						<xsl:value-of select="PERSONAL/NAME/@nick"/>
        				</xsl:otherwise>
   	  				</xsl:choose>
   	  			  </xsl:if>
     			  <xsl:if test="$parToonVoornaam=2">
      				<xsl:choose>
        				<xsl:when test="string-length(PERSONAL/NAME/@first) = 0">
            			<!-- pak de roepnaam -->
              				<xsl:value-of select="PERSONAL/NAME/@nick"/>
        				</xsl:when>
        				<xsl:otherwise>
          					<xsl:choose>
            			<!-- pak de eerste naam van de voornamen -->
            					<xsl:when test="string-length(substring-before(PERSONAL/NAME/@first,' ')) != 0">
              						<xsl:value-of select="substring-before(PERSONAL/NAME/@first,' ')"/>
            					</xsl:when>
            					<xsl:otherwise>
              						<xsl:value-of select="PERSONAL/NAME/@first"/>
            					</xsl:otherwise>
          					</xsl:choose>
        				</xsl:otherwise>
      				</xsl:choose>
     			  </xsl:if>
   					<xsl:text> </xsl:text>
    				<xsl:if test="string-length(PERSONAL/NAME/@pref) != 0">
   	  					<xsl:value-of select="PERSONAL/NAME/@pref"/><xsl:text> </xsl:text>
   					</xsl:if>
    				<xsl:value-of select="PERSONAL/NAME/@surn"/>
    				<xsl:call-template name="showTypeKind">
	    				<xsl:with-param name="type"><xsl:value-of select="user:write_chil_type(string(@link))"/></xsl:with-param>
					</xsl:call-template>
   				</xsl:variable>
   				
				<xsl:variable name="bdate">
   					<xsl:if test="string-length(EVENTS/BIRTH/@date) != 0">
   						<xsl:text> * </xsl:text><xsl:value-of select="EVENTS/BIRTH/@onz"/><xsl:value-of select="EVENTS/BIRTH/@date"/>
    				</xsl:if>
   				</xsl:variable>
   				
				<xsl:variable name="ddate">
   					<xsl:if test="string-length(EVENTS/DEATH/@date) != 0">
   						<xsl:value-of select="$dagger"/><xsl:text> </xsl:text><xsl:value-of select="EVENTS/DEATH/@onz"/><xsl:value-of select="EVENTS/DEATH/@date"/>
    				</xsl:if>
   				</xsl:variable>
   				<xsl:value-of select="user:read_printname(string($PersonLink),string($printname))"/>
   				<xsl:value-of select="user:read_bdate(string($PersonLink),string($bdate))"/>
   				<xsl:value-of select="user:read_ddate(string($PersonLink),string($ddate))"/>
   				
<!-- Bereken de blok-coordinaten en de fontgrootte en -richting; hiervoor moet printname bekend zijn -->   				
				<xsl:value-of select="user:calc_block_coord(string($PersonLink))"/>

				<xsl:if test="$PersonLink = $HuidigPersoon">
					<xsl:element name="svg:circle">
						<xsl:attribute name="cx"><xsl:value-of select="user:write_segment_parm(13)"/></xsl:attribute>
						<xsl:attribute name="cy"><xsl:value-of select="user:write_segment_parm(14)"/></xsl:attribute>
						<xsl:attribute name="r"><xsl:value-of select="user:write_segment_parm(15)"/></xsl:attribute>
			    		<xsl:attribute name="fill"><xsl:value-of select="user:write_segment_parm(12)"/></xsl:attribute>
   						<xsl:attribute name="stroke">blue</xsl:attribute>
   						<xsl:attribute name="stroke-width">1</xsl:attribute>
					</xsl:element>
				</xsl:if>
				
<!-- Schrijf cirkelsegment per persoon -->								
				<xsl:if test="$PersonLink != $HuidigPersoon">
			    	<xsl:element name="svg:path">
   						<xsl:attribute name="d">
   							M<xsl:value-of select="user:write_segment_parm(2)"/>,<xsl:value-of select="user:write_segment_parm(6)"/>
   							A<xsl:value-of select="user:write_segment_parm(10)"/>,<xsl:value-of select="user:write_segment_parm(10)"/>
   							<xsl:text> 1 </xsl:text><xsl:value-of select="user:write_segment_parm(11)"/><xsl:text> 1 </xsl:text>
   							<xsl:value-of select="user:write_segment_parm(4)"/>,<xsl:value-of select="user:write_segment_parm(8)"/>
   							L<xsl:value-of select="user:write_segment_parm(3)"/>,<xsl:value-of select="user:write_segment_parm(7)"/>
   							A<xsl:value-of select="user:write_segment_parm(9)"/>,<xsl:value-of select="user:write_segment_parm(9)"/>
   							<xsl:text> 1 </xsl:text><xsl:value-of select="user:write_segment_parm(11)"/><xsl:text> 0 </xsl:text>
   							<xsl:value-of select="user:write_segment_parm(1)"/>,<xsl:value-of select="user:write_segment_parm(5)"/>
   							z
   						</xsl:attribute>
   						<xsl:attribute name="fill">
   							<xsl:value-of select="user:write_segment_parm(12)"/>
   						</xsl:attribute>
   						<xsl:attribute name="stroke">
   							blue
   						</xsl:attribute>
   						<xsl:attribute name="stroke-width">
   							1
   						</xsl:attribute>
   					</xsl:element>
   				</xsl:if>
   				
<!-- Maak tekstpaden en tekst -->
				<xsl:if test="$PersonLink = $HuidigPersoon">
   					<xsl:value-of select="user:calc_textpath_parm_1(string($PersonLink))"/>
   				</xsl:if>
   				<xsl:if test="user:write_textpath_parm(0) = 'x_dir'">
					<svg:defs>
						<xsl:value-of select="user:incr_textcurv_nr()"/>
						<xsl:element name="svg:path">
							<xsl:attribute name="id">textCurve<xsl:value-of select="user:write_textcurv_nr()"/></xsl:attribute>
							<xsl:attribute name="d">
								M<xsl:value-of select="user:write_textpath_parm(1)"/>,<xsl:value-of select="user:write_textpath_parm(3)"/>,
								L<xsl:value-of select="user:write_textpath_parm(2)"/>,<xsl:value-of select="user:write_textpath_parm(4)"/>
							</xsl:attribute>
						</xsl:element>
						<xsl:element name="svg:text">
							<xsl:attribute name="id">lnk<xsl:value-of select="user:write_textcurv_nr()"/></xsl:attribute>
							javascript:KiesXSL(7,<xsl:value-of select="@link"/>,'','');
						</xsl:element> 
					</svg:defs>
					
					<xsl:element name="svg:g">
						<xsl:attribute name="onclick">javascript:handleEvent(evt,'lnk<xsl:value-of select="user:write_textcurv_nr()"/>');</xsl:attribute>
						<xsl:element name="svg:a">
							<xsl:element name="svg:text">
								<xsl:attribute name="style">text-anchor:middle</xsl:attribute>
								<xsl:attribute name="fill">black</xsl:attribute>
								<xsl:attribute name="font-family">Verdana</xsl:attribute>
								<xsl:attribute name="font-size"><xsl:value-of select="user:write_textpath_parm(5)"/></xsl:attribute>
								<xsl:element name="svg:textPath">
									<xsl:attribute name="startOffset"><xsl:value-of select="user:write_begin_perc()"/>%</xsl:attribute>
									<xsl:attribute name="xlink:href">#textCurve<xsl:value-of select="user:write_textcurv_nr()"/></xsl:attribute>
  									<xsl:value-of select="$printname"/>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:element>
				</xsl:if>
		
   				<xsl:if test="user:write_textpath_parm(0) = 'y_dir'">
					<svg:defs>
						<xsl:value-of select="user:incr_textcurv_nr()"/>
						<xsl:element name="svg:path">
							<xsl:attribute name="id">textCurve<xsl:value-of select="user:write_textcurv_nr()"/></xsl:attribute>
							<xsl:attribute name="d">
								M<xsl:value-of select="user:write_textpath_parm(1)"/>,<xsl:value-of select="user:write_textpath_parm(3)"/>,
								A<xsl:value-of select="user:write_textpath_parm(6)"/>,<xsl:value-of select="user:write_textpath_parm(6)"/>,
								1,<xsl:value-of select="user:write_textpath_parm(7)"/>,<xsl:value-of select="user:write_textpath_parm(8)"/>,
								<xsl:value-of select="user:write_textpath_parm(2)"/>,<xsl:value-of select="user:write_textpath_parm(4)"/>
							</xsl:attribute>
						</xsl:element>
						<xsl:element name="svg:text">
							<xsl:attribute name="id">lnk<xsl:value-of select="user:write_textcurv_nr()"/></xsl:attribute>
							javascript:KiesXSL(7,<xsl:value-of select="@link"/>,'','');
						</xsl:element> 
					</svg:defs>
					
					<xsl:element name="svg:g">
						<xsl:attribute name="onclick">javascript:handleEvent(evt,'lnk<xsl:value-of select="user:write_textcurv_nr()"/>');</xsl:attribute>
						<xsl:element name="svg:a">
							<xsl:element name="svg:text">
								<xsl:attribute name="style">text-anchor:middle</xsl:attribute>
								<xsl:attribute name="fill">black</xsl:attribute>
								<xsl:attribute name="font-family">Verdana</xsl:attribute>
								<xsl:attribute name="font-size"><xsl:value-of select="user:write_textpath_parm(5)"/></xsl:attribute>
								<xsl:element name="svg:textPath">
									<xsl:attribute name="startOffset"><xsl:value-of select="user:write_begin_perc()"/>%</xsl:attribute>
									<xsl:attribute name="xlink:href">#textCurve<xsl:value-of select="user:write_textcurv_nr()"/></xsl:attribute>
	  								<xsl:value-of select="$printname"/>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:element>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
   	</svg:svg>

<br/>
<xsl:call-template name="ShowFooter"/>

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
              <xsl:with-param name="ChilType">
                <xsl:value-of select="@type"/>
              </xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
      </xsl:for-each>
  </xsl:for-each>
  </xsl:if>
</xsl:template>

</xsl:stylesheet>
