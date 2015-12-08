<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">
<!--
// <author>Adrie den Blanken</author>
// <file>$Workfile: Media.xsl $</file><date>$Date: 15-01-15 19:56 $</date>
// <revision>$Revision: 24 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this
// header stays intact. No responsibility is accepted
// for use of this software.</disclaimer>
-->
<xsl:output method="html" indent="yes"/>

<xsl:include href="Header.xsl"/>
<xsl:include href="Talen.xsl"/>

<xsl:param name="HuidigPersoon"/>
<xsl:param name="Browser"/>
<xsl:param name="Printing"/>
<xsl:param name="parToonVoornaam"/>
<xsl:param name="parToonVoettekst"/>
<xsl:param name="parToonNaam"/>
<xsl:param name="parSortKeyMedia"/>
<xsl:param name="parSortOrder"/>
<xsl:param name="parRefOwner"/>
<xsl:param name="parRefOwnerEMail"/>
<xsl:param name="parToonKalender"/>
<xsl:param name="parStuurSorteersleutel"/>
<xsl:param name="parToonNieuws"/>
<xsl:param name="parFotoAantal"/>
<xsl:param name="parTaal"/>

<xsl:template name="ShowFoto1">
  <xsl:param name="TITLE"/>
  <xsl:param name="NAME"/>
  <xsl:param name="LINK"/>
  <xsl:param name="NUMMER"/>
  <td valign="top">
      <a href="javascript:OpenFoto('{$LINK}','{$NUMMER}')" name="{$NAME}"
         onMouseOver = "window.status='Open foto'; return true;"
         onMouseOut  = "window.status='';"
         onMouseDown = "window.status='Open foto'; geenRechterMuis();">
         <xsl:choose>
           <xsl:when test="string-length($TITLE) != 0">
             <xsl:value-of select="$TITLE"/>
           </xsl:when>
           <xsl:otherwise>
             <xsl:value-of select="$Txt_Geen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_omschrijving"/>
           </xsl:otherwise>
         </xsl:choose>
      </a>
  </td>
  <td valign="top">
      <xsl:for-each select="//PERSONEN/PERSOON/PERSONAL/PHOTOS/PHOTO[@name=$NAME]">
        <xsl:sort  order="ascending" select="../../NAME/@nick"/>
         <xsl:if test="position() > 1">
           <br />
         </xsl:if>
         <xsl:call-template name="ShowLijstPersoon">
          <xsl:with-param name="relatie"></xsl:with-param>
          <xsl:with-param name="NAMEFIRST"><xsl:value-of select="../../NAME/@first"/></xsl:with-param>
          <xsl:with-param name="NAMENICK"><xsl:value-of select="../../NAME/@nick"/></xsl:with-param>
          <xsl:with-param name="NAMEPREF"><xsl:value-of select="../../NAME/@pref"/></xsl:with-param>
          <xsl:with-param name="SURN"><xsl:value-of select="../../NAME/@surn"/></xsl:with-param>
          <xsl:with-param name="src"><xsl:value-of select="../../../@link"/></xsl:with-param>
          <xsl:with-param name="priv"><xsl:value-of select="../../../@priv"/></xsl:with-param>
          <xsl:with-param name="naamweergave"><xsl:value-of select="$parToonNaam"/></xsl:with-param>
         </xsl:call-template>
      </xsl:for-each>
  </td>
</xsl:template>

<xsl:template name="ShowFoto3">
  <td valign="top">
         <xsl:call-template name="ShowLijstPersoon">
          <xsl:with-param name="relatie"></xsl:with-param>
          <xsl:with-param name="NAMEFIRST"><xsl:value-of select="../NAME/@first"/></xsl:with-param>
          <xsl:with-param name="NAMENICK"><xsl:value-of select="../NAME/@nick"/></xsl:with-param>
          <xsl:with-param name="NAMEPREF"><xsl:value-of select="../NAME/@pref"/></xsl:with-param>
          <xsl:with-param name="SURN"><xsl:value-of select="../NAME/@surn"/></xsl:with-param>
          <xsl:with-param name="src"><xsl:value-of select="../../@link"/></xsl:with-param>
          <xsl:with-param name="priv"><xsl:value-of select="../../@priv"/></xsl:with-param>
          <xsl:with-param name="naamweergave"><xsl:value-of select="$parToonNaam"/></xsl:with-param>
         </xsl:call-template>
  </td>
  <td valign="top">
    <xsl:for-each select="PHOTO">
     <xsl:sort select="concat(@title,@name)" order="ascending" />
     <xsl:variable name="NAME"><xsl:value-of select="@name"/></xsl:variable>
     <xsl:variable name="TITLE"><xsl:value-of select="@title"/></xsl:variable>
         <xsl:if test="position() > 1">
           <br />
         </xsl:if>
      <xsl:if test="string-length($NAME) != 0">
		<xsl:variable name="nummer">
          <xsl:for-each select="../PHOTO">
            <xsl:if test="@name=$NAME">
              <xsl:value-of select="position() - 1"/>
            </xsl:if>
          </xsl:for-each>
        </xsl:variable>
		<xsl:variable name="link" select="../../../@link"/>
        <a href="javascript:OpenFoto('{$link}','{$nummer}')" name="{$NAME}"
         onMouseOver = "window.status='Open foto'; return true;"
         onMouseOut  = "window.status='';"
         onMouseDown = "window.status='Open foto'; geenRechterMuis();">
         <xsl:choose>
           <xsl:when test="@title">
             <xsl:value-of select="@title"/>
           </xsl:when>
           <xsl:otherwise>
             <xsl:value-of select="$Txt_Geen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_omschrijving"/>
           </xsl:otherwise>
         </xsl:choose>
      </a>
      </xsl:if>
      <xsl:if test="string-length($NAME) = 0">
         <xsl:choose>
           <xsl:when test="@title">
             <xsl:value-of select="@title"/>
           </xsl:when>
           <xsl:otherwise>
             <xsl:value-of select="$nbsp"/>
           </xsl:otherwise>
         </xsl:choose>
      </xsl:if>
    </xsl:for-each>
  </td>
</xsl:template>

<!--
Het begin
-->

<xsl:template match="PERSONEN">

  <xsl:call-template name="ShowMenu"/>

  <div align="center">
    <xsl:if test="count(PERSOON/PERSONAL/PHOTOS/PHOTO)=0">
      <h4>
        <xsl:value-of select="$Txt_Geenfotos"/>
      </h4>
    </xsl:if>
    <xsl:if test="count(PERSOON/PERSONAL/PHOTOS/PHOTO)!=0 and $parFotoAantal = 1">
      <h4>
        <xsl:value-of select="$Txt_Geenfotosinstellingen"/>
      </h4>
    </xsl:if>
    <xsl:if test="count(PERSOON/PERSONAL/PHOTOS/PHOTO)!=0 and $parFotoAantal &gt; 1">
      <h2 align="center">
        <xsl:value-of select="$Txt_Overzicht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_alle"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_fotos"/><xsl:text> </xsl:text>(<xsl:value-of select="count(PERSOON/PERSONAL/PHOTOS/PHOTO)"/>)
      </h2>
      <xsl:choose>
        <xsl:when test="$parSortKeyMedia = 39">
          <xsl:call-template name="Txt_sorteervolgorde">
            <xsl:with-param name="orde"><xsl:value-of select="$parSortOrder"/></xsl:with-param>
          </xsl:call-template>
          <xsl:value-of select="$Txt_Omschrijving"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_foto"/><br />
          <xsl:if test="$varStuurSorteersleutel=1">
            <xsl:value-of select="$Txt_Verandersorteer"/><br />
          </xsl:if>
          <xsl:value-of select="$Txt_Fototonen"/>
          <br /><br />
          <table border="1" bordercolor="black" cellspacing="0" cellpadding="4" class="tbl-data">
            <tr align="left">
              <xsl:call-template name="addColumn">
                <xsl:with-param name="name"><xsl:value-of select="$Txt_Omschrijving"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_foto"/></xsl:with-param>
                <xsl:with-param name="sort">39</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="addColumn">
                <xsl:with-param name="name"><xsl:value-of select="$Txt_Behorendaan"/></xsl:with-param>
                <xsl:with-param name="sort">40</xsl:with-param>
              </xsl:call-template>
            </tr>
            <xsl:for-each select="PERSOON/PERSONAL/PHOTOS/PHOTO[not(@name=preceding::PHOTO/@name)]">
              <xsl:sort select="@title" order="ascending" />
              <xsl:variable name="name_tmp"><xsl:value-of select="@name"/></xsl:variable>
              <xsl:variable name="linkPersoon"><xsl:value-of select="../../../@link"/></xsl:variable>
              <xsl:variable name="nr">
                <xsl:for-each select="//PERSOON[@link=$linkPersoon]/PERSONAL/PHOTOS">
                  <xsl:for-each select="PHOTO">
                    <xsl:if test="@name=$name_tmp"> 
                      <xsl:value-of select="position() - 1"/>
                    </xsl:if>
                  </xsl:for-each>
                </xsl:for-each>
              </xsl:variable>
              <tr align="left">
                <xsl:call-template name="ShowFoto1">
                  <xsl:with-param name="TITLE"><xsl:value-of select="@title"/></xsl:with-param>
                  <xsl:with-param name="NAME"><xsl:value-of select="@name"/></xsl:with-param>
                  <xsl:with-param name="LINK"><xsl:value-of select="../../../@link"/></xsl:with-param>
                  <xsl:with-param name="NUMMER"><xsl:value-of select="$nr"/></xsl:with-param>
                </xsl:call-template>
              </tr>
            </xsl:for-each>
          </table>
        </xsl:when>

        <xsl:otherwise>
          <xsl:call-template name="Txt_sorteervolgorde">
            <xsl:with-param name="orde"><xsl:value-of select="$parSortOrder"/></xsl:with-param>
          </xsl:call-template>
          <xsl:value-of select="$Txt_Naam"/><br />
          <xsl:if test="$varStuurSorteersleutel=1">
            <xsl:value-of select="$Txt_Verandersorteer"/><br />
          </xsl:if>
          <xsl:value-of select="$Txt_Fototonen"/>
          <br /><br />
          <table border="1" bordercolor="black" cellspacing="0" cellpadding="4" class="tbl-data">
            <tr align="left">
              <xsl:call-template name="addColumn">
                <xsl:with-param name="name"><xsl:value-of select="$Txt_Naam"/></xsl:with-param>
                <xsl:with-param name="sort">40</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="addColumn">
                <xsl:with-param name="name"><xsl:value-of select="$Txt_Omschrijving"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_foto"/></xsl:with-param>
                <xsl:with-param name="sort">39</xsl:with-param>
              </xsl:call-template>
            </tr>
            <xsl:for-each select="PERSOON/PERSONAL/PHOTOS">
              <xsl:sort order="ascending" select="../NAME/@surn"/>
      	      <xsl:sort order="ascending" select="../NAME/@pref"/>
      	      <xsl:sort order="ascending" select="concat(../NAME/@nick,../NAME/@first)"/>
              <tr align="left">
                <xsl:call-template name="ShowFoto3"/>
              </tr>
            </xsl:for-each>
          </table>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </div>

  <xsl:call-template name="ShowFooter"/>

</xsl:template>

</xsl:stylesheet>
