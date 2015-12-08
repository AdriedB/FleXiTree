<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">
<!--
// <author>Paul Kallenberg</author>
// <file>$Workfile: FotoGalerij.xsl $</file><date>$Date: 15-01-15 20:37 $</date>
// <revision>$Revision: 11 $</revision><release>1.0</release>
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
<xsl:param name="Key2"/>
<xsl:param name="parFotoAantal"/>
<xsl:param name="parTaal"/>

<!--
Het begin
-->

   	<xsl:variable name="cntr">
   	  <xsl:value-of select="count(//PERSONEN/PERSOON/PERSONAL/PHOTOS/PHOTO[position()=1])"/>
   	</xsl:variable>
   	<xsl:variable name="NrFotosPerPagina">16</xsl:variable> <!-- moet een 4-voud zijn -->
   	<xsl:variable name="NrPaginas"><xsl:value-of select="ceiling($cntr div $NrFotosPerPagina)"/></xsl:variable>
    <xsl:variable name="NrPaginaRij">10</xsl:variable>

<xsl:template match="PERSONEN">

  <xsl:call-template name="ShowMenu"/>
    
    <div align="center">
    <xsl:choose>
      <xsl:when test="count(//PERSONEN/PERSOON/PERSONAL/PHOTOS/PHOTO)!=0 and $parFotoAantal &gt; 1">
  		<xsl:call-template name="FotoTabel">
  			<xsl:with-param name="pagina"><xsl:value-of select="$Key2"/></xsl:with-param>
  		</xsl:call-template>
      </xsl:when>
      <xsl:when test="count(//PERSONEN/PERSOON/PERSONAL/PHOTOS/PHOTO)!=0 and $parFotoAantal = 1">
        <h4>
          <xsl:value-of select="$Txt_Geenfotosinstellingen"/>
        </h4>
      </xsl:when>
      <xsl:otherwise>
        <h4>
          <xsl:value-of select="$Txt_Geenfotos"/>
        </h4>
      </xsl:otherwise>
    </xsl:choose>
    </div>

</xsl:template>

<xsl:template name="FotoTabel">
  <xsl:param name="pagina"/>
	
  <xsl:variable name="eerste"><xsl:value-of select="($pagina - 1)* $NrFotosPerPagina + 1"/></xsl:variable>
  <xsl:variable name="laatste"><xsl:value-of select="$eerste + $NrFotosPerPagina - 1"/></xsl:variable>
  <br />
  <h2 align="center"><xsl:value-of select="$Txt_Fotogalerij"/></h2>

  <div align="center">
    <table border="0" bordercolor="black" cellspacing="0" cellpadding="0" class="tbl-data">
    <tr>
    <xsl:if test="$cntr + $eerste - 1 >0">
    <td valign="top">
    <table border="1" bordercolor="olive" cellspacing="0" cellpadding="4" class="tbl-data">
      <xsl:for-each select="PERSOON[PERSONAL/PHOTOS/PHOTO[position()=1]]">
        <xsl:sort select="PERSONAL/NAME/@surn"/>
        <xsl:sort select="concat(PERSONAL/NAME/@nick,PERSONAL/NAME/@first)"/>
        <xsl:sort select="concat(substring(EVENTS/BIRTH/@date,string-length(EVENTS/BIRTH/@date)-3,4),substring(EVENTS/BIRTH/@date,4,2),substring(EVENTS/BIRTH/@date,1,2))"/>
        <xsl:if test="(position() mod 4) = 1 and position() &gt; ($eerste - 1) and position() &lt; ($laatste + 1)">
        	<xsl:call-template name="FotoWeergave"/>
        </xsl:if>
      </xsl:for-each>
    </table>
    </td>
    </xsl:if>
    
    <xsl:if test="$cntr + $eerste - 1 >1">
    <td valign="top">
    <table border="1" bordercolor="olive" cellspacing="0" cellpadding="4" class="tbl-data">
      <xsl:for-each select="PERSOON[PERSONAL/PHOTOS/PHOTO[position()=1]]">
        <xsl:sort select="PERSONAL/NAME/@surn"/>
        <xsl:sort select="concat(PERSONAL/NAME/@nick,PERSONAL/NAME/@first)"/>
        <xsl:sort select="concat(substring(EVENTS/BIRTH/@date,string-length(EVENTS/BIRTH/@date)-3,4),substring(EVENTS/BIRTH/@date,4,2),substring(EVENTS/BIRTH/@date,1,2))"/>
        <xsl:if test="(position() mod 4) = 2 and position() &gt; ($eerste - 1) and position() &lt; ($laatste + 1)">
        	<xsl:call-template name="FotoWeergave"/>
        </xsl:if>
      </xsl:for-each>
    </table>
    </td>
    </xsl:if>
    
    <xsl:if test="$cntr + $eerste - 1 >2">
    <td valign="top">
    <table border="1" bordercolor="olive" cellspacing="0" cellpadding="4" class="tbl-data">
      <xsl:for-each select="PERSOON[PERSONAL/PHOTOS/PHOTO[position()=1]]">
        <xsl:sort select="PERSONAL/NAME/@surn"/>
        <xsl:sort select="concat(PERSONAL/NAME/@nick,PERSONAL/NAME/@first)"/>
        <xsl:sort select="concat(substring(EVENTS/BIRTH/@date,string-length(EVENTS/BIRTH/@date)-3,4),substring(EVENTS/BIRTH/@date,4,2),substring(EVENTS/BIRTH/@date,1,2))"/>
        <xsl:if test="(position() mod 4) = 3 and position() &gt; ($eerste - 1) and position() &lt; ($laatste + 1)">
        	<xsl:call-template name="FotoWeergave"/>
        </xsl:if>
      </xsl:for-each>
    </table>
    </td>
    </xsl:if>
    
    <xsl:if test="$cntr + $eerste - 1 >3">
    <td valign="top">
    <table border="1" bordercolor="olive" cellspacing="0" cellpadding="4" class="tbl-data">
      <xsl:for-each select="PERSOON[PERSONAL/PHOTOS/PHOTO[position()=1]]">
        <xsl:sort select="PERSONAL/NAME/@surn"/>
        <xsl:sort select="concat(PERSONAL/NAME/@nick,PERSONAL/NAME/@first)"/>
        <xsl:sort select="concat(substring(EVENTS/BIRTH/@date,string-length(EVENTS/BIRTH/@date)-3,4),substring(EVENTS/BIRTH/@date,4,2),substring(EVENTS/BIRTH/@date,1,2))"/>
        <xsl:if test="(position() mod 4) = 0 and position() &gt; ($eerste - 1) and position() &lt; ($laatste + 1)">
        	<xsl:call-template name="FotoWeergave"/>
        </xsl:if>
      </xsl:for-each>
    </table>
    </td>
    </xsl:if>
    
    </tr>
    </table>
  </div>
  
  <xsl:variable name="EerstePagina">
  	<xsl:if test="$NrPaginas &lt; $NrPaginaRij + 1">1</xsl:if>
  	<xsl:if test="$NrPaginas &gt; $NrPaginaRij">
  		<xsl:if test="$pagina &gt; $NrPaginas - ($NrPaginaRij div 2)">
  			<xsl:value-of select="$NrPaginas - ($NrPaginaRij - 1)"/>
  		</xsl:if>
  		<xsl:if test="$pagina &lt; $NrPaginas - (($NrPaginaRij div 2) - 1)">
  			<xsl:if test="$pagina - ($NrPaginaRij div 2) &gt; 0"><xsl:value-of select="$pagina - ($NrPaginaRij div 2)"/></xsl:if>
  			<xsl:if test="$pagina - ($NrPaginaRij div 2) &lt; 1">1</xsl:if>
  		</xsl:if>
  	</xsl:if>
  </xsl:variable>
  <xsl:variable name="LaatstePagina">
  	<xsl:if test="$EerstePagina + ($NrPaginaRij - 1) &gt; $NrPaginas">
  		<xsl:value-of select="$NrPaginas"/>
  	</xsl:if>
  	<xsl:if test="$EerstePagina + ($NrPaginaRij - 2) &lt; $NrPaginas">
  		<xsl:value-of select="$EerstePagina + ($NrPaginaRij - 1)"/>
  	</xsl:if>
  </xsl:variable>
  
  <div align="center">
    <table border="0" bordercolor="black" cellspacing="10" cellpadding="0" class="tbl-tussenkolom">
      <tr>
        <td>
          <xsl:if test="$EerstePagina &gt; 1">
        	<xsl:element name="a">
				<xsl:attribute name="href">javascript:KiesXSL(81,<xsl:value-of select="$HuidigPersoon"/>,'',1);
				</xsl:attribute>
				<xsl:value-of select="$Txt_eerste"/>
			</xsl:element>
		  </xsl:if>
		  <xsl:value-of select="$nbsp"/>
        </td>
        <td>
          <xsl:if test="$pagina &gt; 1">
        	<xsl:element name="a">
				<xsl:attribute name="href">javascript:KiesXSL(81,<xsl:value-of select="$HuidigPersoon"/>,'',<xsl:value-of select="$pagina - 1"/>);
				</xsl:attribute>
				<xsl:value-of select="$Txt_vorige"/>
			</xsl:element>
		  </xsl:if>
		  <xsl:value-of select="$nbsp"/>
        </td>
        <xsl:call-template name="RijElement">
        	<xsl:with-param name="volgnr"><xsl:value-of select="$EerstePagina"/></xsl:with-param>
        	<xsl:with-param name="pagina"><xsl:value-of select="$pagina"/></xsl:with-param>
        	<xsl:with-param name="elementnr">1</xsl:with-param>
        </xsl:call-template>
        <td>
          <xsl:if test="$laatste &lt; $cntr ">
        	<xsl:element name="a">
				<xsl:attribute name="href">javascript:KiesXSL(81,<xsl:value-of select="$HuidigPersoon"/>,'',<xsl:value-of select="$pagina + 1"/>);
				</xsl:attribute>
				<xsl:value-of select="$Txt_volgende"/>
			</xsl:element>
		  </xsl:if>
		  <xsl:value-of select="$nbsp"/>
        </td>
        <td>
          <xsl:if test="$LaatstePagina &lt; $NrPaginas">
        	<xsl:element name="a">
				<xsl:attribute name="href">javascript:KiesXSL(81,<xsl:value-of select="$HuidigPersoon"/>,'',<xsl:value-of select="$NrPaginas"/>);
				</xsl:attribute>
				<xsl:value-of select="$Txt_laatste"/> (<xsl:value-of select="$NrPaginas"/>)
			</xsl:element>
		  </xsl:if>
		  <xsl:value-of select="$nbsp"/>
        </td>
      </tr>
    </table>
  </div>
  <xsl:call-template name="ShowFooter"/>

</xsl:template>

<xsl:template name="FotoWeergave">
  <tr align="left">
    <td align="center">
      <xsl:variable name="linkPersoon"><xsl:value-of select="@link"/></xsl:variable>
      <xsl:for-each select="PERSONAL">
        <xsl:for-each select="PHOTOS">
          <xsl:variable name="foto" select="PHOTO[position()=1]/@name"/>
          <xsl:variable name="title">
            <xsl:value-of select="PHOTO[position()=1]/@title"/>
            <xsl:text> (</xsl:text>
            <xsl:value-of select="$Txt_klik_voor_foto_in_apart_venster"/>
            <xsl:text>)</xsl:text>
          </xsl:variable>
          <a href="javascript:OpenFoto('{$linkPersoon}',0)" name="afbeelding"
             onMouseOver = "window.status='Open foto'; return true;"
             onMouseOut  = "window.status='';"
             onMouseDown = "window.status='Open foto'; geenRechterMuis();">
             <img src="{$varFolderFotoAlbum}/{$foto}" title="{$title}" alt="{$foto}" name="afbeelding" height="80" border="1" bordercolor="black"/>
          </a>
        </xsl:for-each>
        <br />
        <xsl:call-template name="dummy"/>
        <xsl:call-template name="ShowPersoon">
          <xsl:with-param name="relatie"></xsl:with-param>
          <xsl:with-param name="NAMEFIRST"><xsl:value-of select="NAME/@first"/></xsl:with-param>
          <xsl:with-param name="NAMENICK"><xsl:value-of select="NAME/@nick"/></xsl:with-param>
          <xsl:with-param name="NAMEPREF"><xsl:value-of select="NAME/@pref"/></xsl:with-param>
		  <xsl:with-param name="SURN"><xsl:value-of select="NAME/@surn"/></xsl:with-param>
          <xsl:with-param name="src"><xsl:value-of select="../@link"/></xsl:with-param>
          <xsl:with-param name="priv"><xsl:value-of select="../@priv"/></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
      <br />
      <xsl:value-of select="EVENTS/BIRTH/@onz"/><xsl:value-of select="EVENTS/BIRTH/@date"/><xsl:text>&#160;</xsl:text>
      <xsl:for-each select="EVENTS/DEATH">
        <xsl:text>&#8224;</xsl:text><xsl:value-of select="@onz"/><xsl:value-of select="@date"/><xsl:text>&#160;</xsl:text>
      </xsl:for-each>
    </td>
  </tr>
</xsl:template>

<xsl:template name="RijElement">
  <xsl:param name="volgnr"/>
  <xsl:param name="pagina"/>
  <xsl:param name="elementnr"/>
      <xsl:if test="$volgnr &lt; $NrPaginas + 1">
        <td>
            <xsl:if test="$volgnr != $pagina">
        	  <xsl:element name="a">
				<xsl:attribute name="href">javascript:KiesXSL(81,<xsl:value-of select="$HuidigPersoon"/>,'',<xsl:value-of select="$volgnr"/>);
				</xsl:attribute>
				<xsl:value-of select="$volgnr"/>
			  </xsl:element>
			</xsl:if>
            <xsl:if test="$volgnr = $pagina">
				<xsl:value-of select="$volgnr"/>
			</xsl:if>
		  <xsl:value-of select="$nbsp"/>
        </td>
	  </xsl:if>
        <xsl:if test="$elementnr &lt; $NrPaginaRij">
          <xsl:call-template name="RijElement">
            <xsl:with-param name="volgnr"><xsl:value-of select="$volgnr + 1"/></xsl:with-param>
            <xsl:with-param name="pagina"><xsl:value-of select="$pagina"/></xsl:with-param>
            <xsl:with-param name="elementnr"><xsl:value-of select="$elementnr + 1"/></xsl:with-param>
          </xsl:call-template>
        </xsl:if>
</xsl:template>

<xsl:template name="dummy"/>

</xsl:stylesheet>
