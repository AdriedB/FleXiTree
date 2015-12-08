<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:user="http://www.adriedenblanken.nl/"
		version="1.0">
<!--
// <author>Paul Kallenberg</author>
// <file>$Workfile: RelatieplaatsenLijst.xsl $</file><date>$Date: 15-01-15 19:56 $</date>
// <revision>$Revision: 4 $</revision><release>1.0</release>
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
<xsl:param name="Key2"/>
<xsl:param name="Printing"/>
<xsl:param name="parSortKey"/>
<xsl:param name="parSortOrder"/>
<xsl:param name="parToonNaam"/>
<xsl:param name="parToonVoettekst"/>
<xsl:param name="parToonVoornaam"/>
<xsl:param name="parRefOwner"/>
<xsl:param name="parRefOwnerEMail"/>
<xsl:param name="parToonKalender"/>
<xsl:param name="parStuurSorteersleutel"/>
<xsl:param name="parToonNieuws"/>
<xsl:param name="parTaal"/>

<!--
Het begin
-->

<xsl:template match="PERSONEN">

  <xsl:call-template name="ShowMenu"/>
   	<xsl:variable name="cntr">
   	  <xsl:value-of select="count(PERSOON/RELATIONS/RELA[BEGIN/@place=$LijstWoord])"/>
   	</xsl:variable>

  <div align="center">
   	<xsl:call-template name="Txt_overzichtshoofdregels">
   	  <xsl:with-param name="orde">
   	    <xsl:value-of select="$parSortOrder"/>
   	  </xsl:with-param>
   	  <xsl:with-param name="aantal">
   	    <xsl:value-of select="$cntr div 2"/>
   	  </xsl:with-param>
   	  <xsl:with-param name="overzichtstype_enkelvoud">
   	    <xsl:value-of select="$Txt_relatie"/>
   	  </xsl:with-param>
   	  <xsl:with-param name="overzichtstype_meervoud">
   	    <xsl:value-of select="$Txt_relaties"/>
   	  </xsl:with-param>
   	  <xsl:with-param name="overzichtstype_met">
        <xsl:text> </xsl:text><xsl:value-of select="$Txt_met"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_relatieplaats"/><xsl:text> </xsl:text><xsl:value-of select="$LijstWoord"/>
   	  </xsl:with-param>
   	  <xsl:with-param name="sleutel">
        <xsl:choose>
    <xsl:when test="$parSortKey=31">
      <xsl:value-of select="$Txt_Eerste"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_naam"/>
    </xsl:when>
    <xsl:when test="$parSortKey=32">
      <xsl:value-of select="$Txt_Tweede"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_naam"/>
    </xsl:when>
    <xsl:when test="$parSortKey=33">
      <xsl:value-of select="$Txt_Datum"/>
    </xsl:when>
    <xsl:when test="$parSortKey=35">
      <xsl:value-of select="$Txt_Relatie"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$Txt_Duur"/>
    </xsl:otherwise>
        </xsl:choose>
   	  </xsl:with-param>
   	</xsl:call-template>

    <xsl:call-template name="KolomWeergave"/>
  </div>

  <xsl:call-template name="ShowFooter"/>

</xsl:template>

<xsl:template name="RelatieWeergave1">
          <xsl:variable name="hoofdLink"><xsl:value-of select="../../@link"/></xsl:variable>
          <xsl:variable name="relatieLink"><xsl:value-of select="@link"/></xsl:variable>
          <xsl:variable name="hoofdSex"><xsl:value-of select="../../PERSONAL/@sex"/></xsl:variable>
          <xsl:variable name="relatieSex"><xsl:value-of select="//PERSONEN/PERSOON[@link = $relatieLink]/PERSONAL/@sex"/></xsl:variable>
<!--          <xsl:variable name="hoofdId"><xsl:value-of select="concat(../../PERSONAL/NAME/@surn,../../PERSONAL/NAME/@first,../../PERSONAL/NAME/@nick,../../@link)"/></xsl:variable>
          <xsl:variable name="relatieId"><xsl:value-of select="concat(//PERSONEN/PERSOON[@link = $relatieLink]/PERSONAL/NAME/@surn,//PERSONEN/PERSOON[@link = $relatieLink]/PERSONAL/NAME/@first,//PERSONEN/PERSOON[@link = $relatieLink]/PERSONAL/NAME/@nick,$relatieLink)"/></xsl:variable> -->
          <xsl:if test="string-length(BEGIN/@date) != 0 and //PERSONEN/PERSOON[@link = $relatieLink]">
          <xsl:if test="($hoofdSex != $relatieSex and ($hoofdSex = 'M' or ($hoofdSex='?' and $relatieLink='V'))) or ($hoofdSex = $relatieSex and $hoofdLink &lt; $relatieLink)">
            <tr>
                  <td align="left">
                    <xsl:for-each select="//PERSONEN/PERSOON[@link=$hoofdLink]/PERSONAL">
                      <xsl:call-template name="ShowLijstPersoon">
                        <xsl:with-param name="relatie"></xsl:with-param>
                        <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
                        <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
                        <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
                        <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
                        <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
                        <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
              			<xsl:with-param name="naamweergave"><xsl:value-of select="$parToonNaam"/></xsl:with-param>
                      </xsl:call-template>
                    </xsl:for-each>
                  </td>
                  <td align="left">
                    <xsl:for-each select="//PERSONEN/PERSOON[@link=$relatieLink]/PERSONAL">
                      <xsl:call-template name="ShowLijstPersoon">
                        <xsl:with-param name="relatie"></xsl:with-param>
                        <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
                        <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
                        <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
                        <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
                        <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
                        <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
              			<xsl:with-param name="naamweergave"><xsl:value-of select="$parToonNaam"/></xsl:with-param>
                      </xsl:call-template>
                    </xsl:for-each>
                  </td>
              <td>
<!--  Aldfaer <RELATYPE>_RELATYPE("Huwelijk;Geregistreerd partnerschap;Samenleven;Relatie ;Ontbrekende relatie;Onbekende relatie")</RELATYPE>-->
                <xsl:choose>
                    <xsl:when test="@type=1"><xsl:value-of select="$Txt_Huwelijk"/></xsl:when>
                    <xsl:when test="@type=2"><xsl:value-of select="$Txt_Notarieel"/></xsl:when>
                    <xsl:when test="@type=3"><xsl:value-of select="$Txt_Samenleven"/></xsl:when>
                    <xsl:when test="@type=4"><xsl:value-of select="$Txt_Relatie"/></xsl:when>
                    <xsl:when test="@type=5"><xsl:value-of select="$Txt_OntbrekendeRelatie"/></xsl:when>
                    <xsl:otherwise><xsl:value-of select="$Txt_OnbekendeRelatie"/></xsl:otherwise>
                </xsl:choose>
              </td>
              <td align="right">
                  <xsl:value-of select="BEGIN/@onz"/><xsl:value-of select="BEGIN/@date"/><xsl:value-of select="$nbsp"/>
              </td>
            </tr>
          </xsl:if>
          </xsl:if>
</xsl:template>

<xsl:template name="RelatieWeergave2">
          <xsl:variable name="hoofdLink"><xsl:value-of select="../../@link"/></xsl:variable>
          <xsl:variable name="relatieLink"><xsl:value-of select="@link"/></xsl:variable>
          <xsl:variable name="hoofdSex"><xsl:value-of select="../../PERSONAL/@sex"/></xsl:variable>
          <xsl:variable name="relatieSex"><xsl:value-of select="//PERSONEN/PERSOON[@link = $relatieLink]/PERSONAL/@sex"/></xsl:variable>
<!--          <xsl:variable name="hoofdId"><xsl:value-of select="concat(../../PERSONAL/NAME/@surn,../../PERSONAL/NAME/@first,../../PERSONAL/NAME/@nick,../../@link)"/></xsl:variable>
          <xsl:variable name="relatieId"><xsl:value-of select="concat(//PERSONEN/PERSOON[@link = $relatieLink]/PERSONAL/NAME/@surn,//PERSONEN/PERSOON[@link = $relatieLink]/PERSONAL/NAME/@first,//PERSONEN/PERSOON[@link = $relatieLink]/PERSONAL/NAME/@nick,$relatieLink)"/></xsl:variable> -->
          <xsl:if test="string-length(BEGIN/@date) != 0 and //PERSONEN/PERSOON[@link = $relatieLink]">
          <xsl:if test="($hoofdSex != $relatieSex and ($relatieSex = 'M' or ($relatieSex='?' and $hoofdLink='V'))) or ($hoofdSex = $relatieSex and $hoofdLink &gt; $relatieLink)">
            <tr>
                  <td align="left">
                    <xsl:for-each select="//PERSONEN/PERSOON[@link=$relatieLink]/PERSONAL">
                      <xsl:call-template name="ShowLijstPersoon">
                        <xsl:with-param name="relatie"></xsl:with-param>
                        <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
                        <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
                        <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
                        <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
                        <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
                        <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
              			<xsl:with-param name="naamweergave"><xsl:value-of select="$parToonNaam"/></xsl:with-param>
                      </xsl:call-template>
                    </xsl:for-each>
                  </td>
                  <td align="left">
                    <xsl:for-each select="//PERSONEN/PERSOON[@link=$hoofdLink]/PERSONAL">
                      <xsl:call-template name="ShowLijstPersoon">
                        <xsl:with-param name="relatie"></xsl:with-param>
                        <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
                        <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
                        <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
                        <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
                        <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
                        <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
              			<xsl:with-param name="naamweergave"><xsl:value-of select="$parToonNaam"/></xsl:with-param>
                      </xsl:call-template>
                    </xsl:for-each>
                  </td>
              <td>
<!--  Aldfaer <RELATYPE>_RELATYPE("Huwelijk;Geregistreerd partnerschap;Samenleven;Relatie ;Ontbrekende relatie;Onbekende relatie")</RELATYPE>-->
                <xsl:choose>
                    <xsl:when test="@type=1"><xsl:value-of select="$Txt_Huwelijk"/></xsl:when>
                    <xsl:when test="@type=2"><xsl:value-of select="$Txt_Notarieel"/></xsl:when>
                    <xsl:when test="@type=3"><xsl:value-of select="$Txt_Samenleven"/></xsl:when>
                    <xsl:when test="@type=4"><xsl:value-of select="$Txt_Relatie"/></xsl:when>
                    <xsl:when test="@type=5"><xsl:value-of select="$Txt_OntbrekendeRelatie"/></xsl:when>
                    <xsl:otherwise><xsl:value-of select="$Txt_OnbekendeRelatie"/></xsl:otherwise>
                </xsl:choose>
              </td>
              <td align="right">
                  <xsl:value-of select="BEGIN/@onz"/><xsl:value-of select="BEGIN/@date"/><xsl:value-of select="$nbsp"/>
              </td>
            </tr>
          </xsl:if>
          </xsl:if>
</xsl:template>

<xsl:template name="KolomWeergave">
    <table border="1" bordercolor="black" cellspacing="0" cellpadding="4" class="tbl-data">
      <tr>
       <xsl:call-template name="addColumn">
          <xsl:with-param name="name"><xsl:value-of select="$Txt_Eerste"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_naam"/></xsl:with-param>
          <xsl:with-param name="sort">31</xsl:with-param>
       </xsl:call-template>
       <xsl:call-template name="addColumn">
          <xsl:with-param name="name"><xsl:value-of select="$Txt_Tweede"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_naam"/></xsl:with-param>
          <xsl:with-param name="sort">32</xsl:with-param>
       </xsl:call-template>
       <xsl:call-template name="addColumn">
          <xsl:with-param name="name"><xsl:value-of select="$Txt_Relatie"/></xsl:with-param>
          <xsl:with-param name="sort">35</xsl:with-param>
          <xsl:with-param name="align">left</xsl:with-param>
       </xsl:call-template>
       <xsl:call-template name="addColumn">
          <xsl:with-param name="name"><xsl:value-of select="$Txt_Datum"/></xsl:with-param>
          <xsl:with-param name="sort">33</xsl:with-param>
          <xsl:with-param name="align">left</xsl:with-param>
       </xsl:call-template>
      </tr>
      <xsl:for-each select="PERSOON/RELATIONS/RELA[BEGIN/@place=$LijstWoord]">
      	<xsl:sort select="../../PERSONAL/NAME/@surn" order="ascending" data-type="text"/>
      	<xsl:sort select="../../PERSONAL/NAME/@pref" order="ascending" data-type="text"/>
      	<xsl:sort select="concat(../../PERSONAL/NAME/@nick,../../PERSONAL/NAME/@first)" order="ascending" data-type="text"/>
        <xsl:sort select="concat(substring(BEGIN/@date,string-length(BEGIN/@date)-3,4),substring(BEGIN/@date,4,2),substring(BEGIN/@date,1,2))" order="ascending" data-type="text"/>
        <xsl:choose>
          <xsl:when test="$parSortKey=32">
            <xsl:call-template name="RelatieWeergave2"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="RelatieWeergave1"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </table>
</xsl:template>

</xsl:stylesheet>
