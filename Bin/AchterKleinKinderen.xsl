<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:user="http://www.adriedenblanken.nl/"
		version="1.0">
<!--
// <author>Adrie den Blanken</author>
// <file>$Workfile: AchterKleinKinderen.xsl $</file><date>$Date: 21-10-13 11:14 $</date>
// <revision>$Revision: 27 $</revision><release>1.0</release>
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
<xsl:param name="parToonVoornaam"/>
<xsl:param name="parToonVoettekst"/>
<xsl:param name="parSortKey"/>
<xsl:param name="parSortOrder"/>
<xsl:param name="parNrKol"/>
<xsl:param name="parToonNaam"/>
<xsl:param name="parRefOwner"/>
<xsl:param name="parRefOwnerEMail"/>
<xsl:param name="parToonKalender"/>
<xsl:param name="parStuurSorteersleutel"/>
<xsl:param name="parToonNieuws"/>
<xsl:param name="parTaal"/>

<xsl:template name="klkind">
  <xsl:param name="kkind"></xsl:param>
  
   	<xsl:variable name="cntr">
   	  <xsl:value-of select="count($kkind/PERSOON)"/>
   	</xsl:variable>
    <xsl:variable name="varNrKol">
      <xsl:choose>
        <xsl:when test="$parNrKol = '1'">1</xsl:when>
        <xsl:otherwise>
          <xsl:choose>
            <xsl:when test="$cntr &gt; $MinPerKolom">2</xsl:when>
            <xsl:otherwise>1</xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
   	<xsl:variable name="perkolom">
   	  <xsl:value-of select="floor($cntr div $varNrKol)"/>
   	</xsl:variable>
   	<xsl:variable name="rest">
   	  <xsl:value-of select="$cntr mod $varNrKol"/>
   	</xsl:variable>
       	 
    <xsl:choose>
      <xsl:when test="count($kkind/PERSOON) = 0">
        <xsl:for-each select="//PERSOON[@link=$HuidigPersoon]/PERSONAL/NAME">
          <h2 align="center">
            <xsl:value-of select="$Txt_Achterkleinkinderentitelgeen"/>
              <xsl:value-of select="@first"/>
              <xsl:if test="string-length(@nick) > 0"><xsl:text> </xsl:text>(<xsl:value-of select="@nick"/>)</xsl:if>
              <xsl:if test="string-length(@pref) > 0"><xsl:text> </xsl:text><xsl:value-of select="@pref"/></xsl:if>
              <xsl:text> </xsl:text><xsl:value-of select="@surn"/>
          </h2>
        </xsl:for-each> <!-- PERSONAL/NAME -->
        <br/>
      </xsl:when>
      <xsl:otherwise>  
        <xsl:for-each select="//PERSOON[@link=$HuidigPersoon]/PERSONAL/NAME">
          <h2 align="center">
            <xsl:value-of select="$Txt_Overzicht"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_vande"/><xsl:text> </xsl:text><xsl:value-of select="$cntr"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_achterkleinkinderen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text>
            <xsl:value-of select="@first"/>
            <xsl:if test="string-length(@nick) > 0"><xsl:text> </xsl:text>(<xsl:value-of select="@nick"/>)</xsl:if>
            <xsl:if test="string-length(@pref) > 0"><xsl:text> </xsl:text><xsl:value-of select="@pref"/></xsl:if>
            <xsl:text> </xsl:text><xsl:value-of select="@surn"/>
          </h2>
        </xsl:for-each> <!-- PERSONAL/NAME -->
  
      <div align="center">
        <xsl:call-template name="Txt_sorteervolgorde">
          <xsl:with-param name="orde"><xsl:value-of select="$parSortOrder"/></xsl:with-param>
        </xsl:call-template>
        <xsl:choose>
          <xsl:when test="$parSortKey=1">
            <xsl:value-of select="$Txt_Naam"/>
          </xsl:when>
          <xsl:when test="$parSortKey=2">
            <xsl:value-of select="$Txt_Geboortedoopdatum"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$Txt_Leeftijd"/>
          </xsl:otherwise>
          </xsl:choose>
          <br />
          <xsl:if test="$varStuurSorteersleutel=1">
           <xsl:value-of select="$Txt_Verandersorteer"/><br />
          </xsl:if>
          <br />
          <table border="0" bordercolor="black" cellspacing="0" cellpadding="0" class="tbl-data">
	    <tr>
		<xsl:call-template name="KolomWeergave">
		  <xsl:with-param name="kolom">1</xsl:with-param>
	          <xsl:with-param name="cntr"><xsl:value-of select="$cntr"/></xsl:with-param>
                  <xsl:with-param name="nrkol"><xsl:value-of select="$varNrKol"/></xsl:with-param>
	          <xsl:with-param name="perkolom"><xsl:value-of select="$perkolom"/></xsl:with-param>
	          <xsl:with-param name="rest"><xsl:value-of select="$rest"/></xsl:with-param>
	          <xsl:with-param name="kkind" select="$kkind"/>
		</xsl:call-template>
	    </tr>
	 </table>
      </div>
      </xsl:otherwise>
    </xsl:choose>

</xsl:template>

<xsl:template name="KleinkinderenWeergave">
    <xsl:param name="kolom"/>
   	<xsl:param name="cntr"/>
   	<xsl:param name="nrkol"/>
   	<xsl:param name="perkolom"/>
   	<xsl:param name="rest"/>
   	
    <xsl:variable name="lb">
      <xsl:if test="$kolom - 1 &lt; $rest+1">
        <xsl:value-of select="($kolom - 1)*($perkolom + 1)+ 1 div ($cntr+1)"/>
      </xsl:if>
      <xsl:if test="$kolom - 1 &gt; $rest">
        <xsl:value-of select="$rest*($perkolom + 1)+(($kolom) - ($rest + 1))*$perkolom + 1 div ($cntr+1)"/>
      </xsl:if>
    </xsl:variable>
    <xsl:variable name="ub">
      <xsl:if test="$kolom &lt; $rest + 1">
        <xsl:value-of select="$kolom*($perkolom + 1)+1"/>
      </xsl:if>
      <xsl:if test="$kolom &gt; $rest">
        <xsl:value-of select="$rest*($perkolom + 1)+(($kolom)-($rest))*$perkolom+1"/>
      </xsl:if>
    </xsl:variable>
    <xsl:if test="$lb &lt; position() and position() &lt; $ub">
            <tr>
              <td align="center"><xsl:value-of select="position()"/></td>
              <td>
                <xsl:for-each select="PERSONAL">
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
                <xsl:for-each select="EVENTS/DEATH">
                  <xsl:text>&#8224;</xsl:text>
                </xsl:for-each>
              </td>
              <td align="right">
            	<xsl:choose>
              	  <xsl:when test="EVENTS/BIRTH/@date">
                	<xsl:value-of select="EVENTS/BIRTH/@onz"/><xsl:value-of select="EVENTS/BIRTH/@date"/><xsl:text>&#160;</xsl:text>
              	  </xsl:when>
              	  <xsl:otherwise>
                	<xsl:value-of select="EVENTS/BAPT/@onz"/><xsl:value-of select="EVENTS/BAPT/@date"/><xsl:text>&#160;</xsl:text>
              	  </xsl:otherwise>
            	</xsl:choose>
              </td>
          <td align="right">
            <xsl:if test="string-length(PERSONAL/@age) > 0">
              <xsl:value-of select="PERSONAL/@onz"/>
              <xsl:if test="$Browser = 'IE'">
                <xsl:choose>
                  <xsl:when test="PERSONAL/@of or contains(EVENTS/BIRTH/@date,'?') or string-length(user:leeftijd(EVENTS,string($parTaal),string($Txt_jaar),string($Txt_jaren)))=0 or EVENTS/DEATH or string(user:leeftijd(EVENTS,string($parTaal),string($Txt_jaar),string($Txt_jaren)))='?'">
              		<xsl:choose>
                	  <xsl:when test="PERSONAL/@of=1">
                  		<xsl:value-of select="PERSONAL/@age - 1"/>
                  		<xsl:value-of select="$nbsp"/><xsl:value-of select="$Txt_of"/><xsl:value-of select="$nbsp"/>
                  		<xsl:value-of select="PERSONAL/@age"/>
                	  </xsl:when>
                	  <xsl:otherwise>
                  		<xsl:value-of select="PERSONAL/@age"/>
                	  </xsl:otherwise>
              		</xsl:choose>
              		<xsl:text> </xsl:text>
              		<xsl:choose>
              		  <xsl:when test="PERSONAL/@age = 0 or PERSONAL/@age = 1">
              			<xsl:value-of select="$Txt_jaar"/>
              		  </xsl:when>
              		  <xsl:otherwise>
              			<xsl:value-of select="$Txt_jaren"/>
              		  </xsl:otherwise>
              		</xsl:choose>
              		<xsl:text> </xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:for-each select="EVENTS">
                      <xsl:value-of select="user:leeftijd(.,string($parTaal),string($Txt_jaar),string($Txt_jaren))"/>
                    </xsl:for-each> <!-- EVENTS -->
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
              <xsl:if test="$Browser != 'IE'">
              		<xsl:choose>
                	  <xsl:when test="PERSONAL/@of=1">
                  		<xsl:value-of select="PERSONAL/@age - 1"/>
                  		<xsl:value-of select="$nbsp"/><xsl:value-of select="$Txt_of"/><xsl:value-of select="$nbsp"/>
                  		<xsl:value-of select="PERSONAL/@age"/>
                	  </xsl:when>
                	  <xsl:otherwise>
                  		<xsl:value-of select="PERSONAL/@age"/>
                	  </xsl:otherwise>
              		</xsl:choose>
              		<xsl:text> </xsl:text>
              		<xsl:choose>
              		  <xsl:when test="PERSONAL/@age = 0 or PERSONAL/@age = 1">
              			<xsl:value-of select="$Txt_jaar"/>
              		  </xsl:when>
              		  <xsl:otherwise>
              			<xsl:value-of select="$Txt_jaren"/>
              		  </xsl:otherwise>
              		</xsl:choose>
              		<xsl:text> </xsl:text>
              </xsl:if>
            </xsl:if>
            <xsl:if test="string-length(PERSONAL/@age)=0">
              <xsl:value-of select="$nbsp"/>
            </xsl:if>
          </td>
            </tr>
     </xsl:if>
</xsl:template>
<!--
Het begin
-->

<xsl:template match="PERSONEN">

<xsl:call-template name="ShowMenu"/>

<xsl:for-each select="PERSOON[@link=$HuidigPersoon]">

<xsl:variable name="Klkinderen">
  <xsl:for-each select="RELATIONS/RELA/CHILDREN/CHIL">
    <xsl:variable name="kind" select="@link"/>
    <xsl:for-each select="//PERSONEN/PERSOON[@link=$kind]">
      <xsl:for-each select="RELATIONS/RELA/CHILDREN/CHIL">
        <xsl:variable name="kleinkind" select="@link"/>
        <xsl:for-each select="//PERSONEN/PERSOON[@link=$kleinkind]">
          <xsl:for-each select="RELATIONS/RELA/CHILDREN/CHIL">
            <xsl:variable name="achterkleinkind" select="@link"/>
            <xsl:copy-of select="//PERSONEN/PERSOON[@link=$achterkleinkind]"/>
          </xsl:for-each>
        </xsl:for-each>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:for-each>
</xsl:variable>

<xsl:call-template name="klkind">
  <xsl:with-param name="kkind" select="$Klkinderen"/>
</xsl:call-template>

<xsl:call-template name="ShowFooter"/>

</xsl:for-each>

</xsl:template>

<xsl:template name="KolomWeergave">
	<xsl:param name="kolom"/>
   	<xsl:param name="cntr"/>
   	<xsl:param name="nrkol"/>
   	<xsl:param name="perkolom"/>
   	<xsl:param name="rest"/>
   	<xsl:param name="kkind"/>
   	
    <xsl:if test="$cntr &gt; ($kolom - 1)">
      <xsl:element name="td">
        <xsl:attribute name="valign">top</xsl:attribute>
        <xsl:attribute name="width">
          <xsl:if test="$cntr &gt; $nrkol - 1">
          <xsl:value-of select="(100 - $tussenkol*($nrkol - 1)) div $nrkol "/>%
          </xsl:if>
        </xsl:attribute>
        <table border="1" bordercolor="black" cellspacing="0" cellpadding="4" class="tbl-data" width="100%">
           <tr>
             <th class="tbl-head" align="center">Index</th>
             <xsl:call-template name="addColumn">
                <xsl:with-param name="name"><xsl:value-of select="$Txt_Naam"/></xsl:with-param>
                <xsl:with-param name="sort">1</xsl:with-param>
             </xsl:call-template>
             <xsl:call-template name="addColumn">
                <xsl:with-param name="name"><xsl:value-of select="$Txt_Gedooptgeboren"/></xsl:with-param>
                <xsl:with-param name="sort">2</xsl:with-param>
                <xsl:with-param name="align">right</xsl:with-param>
             </xsl:call-template>
             <xsl:call-template name="addColumn">
                <xsl:with-param name="name"><xsl:value-of select="$Txt_Leeftijd"/></xsl:with-param>
                <xsl:with-param name="sort">3</xsl:with-param>
                <xsl:with-param name="align">right</xsl:with-param>
             </xsl:call-template>
            </tr>
            <xsl:for-each select="$kkind/PERSOON">
      	      <xsl:sort select="PERSONAL/NAME/@surn" order="ascending" data-type="text"/>
   	      <xsl:sort select="PERSONAL/NAME/@pref" order="ascending" data-type="text"/>
      	      <xsl:sort select="concat(PERSONAL/NAME/@nick,PERSONAL/NAME/@first)" order="ascending" data-type="text"/>
	      <xsl:sort select="concat(substring(EVENTS/BIRTH/@date,string-length(EVENTS/BIRTH/@date)-3,4),substring(EVENTS/BIRTH/@date,4,2),substring(EVENTS/BIRTH/@date,1,2),substring(EVENTS/BAPT/@date,string-length(EVENTS/BAPT/@date)-3,4),substring(EVENTS/BAPT/@date,4,2),substring(EVENTS/BAPT/@date,1,2))" order="ascending" data-type="text"/>
      	      <xsl:call-template name="KleinkinderenWeergave">
          	  <xsl:with-param name="cntr"><xsl:value-of select="$cntr"/></xsl:with-param>
          	  <xsl:with-param name="nrkol"><xsl:value-of select="$nrkol"/></xsl:with-param>
          	  <xsl:with-param name="perkolom"><xsl:value-of select="$perkolom"/></xsl:with-param>
          	  <xsl:with-param name="rest"><xsl:value-of select="$rest"/></xsl:with-param>
          	  <xsl:with-param name="kolom"><xsl:value-of select="$kolom"/></xsl:with-param>
    	    </xsl:call-template>
      	  </xsl:for-each>
      	  <xsl:if test="$kolom &gt; $rest and $rest &gt; 0">
        	<tr>
          	  <td><xsl:value-of select="$nbsp"/></td>
          	  <td><xsl:value-of select="$nbsp"/></td>
          	  <td><xsl:value-of select="$nbsp"/></td>
        	</tr>
    	  </xsl:if>
  	</table>
      </xsl:element>
    </xsl:if>
    <xsl:if test="$kolom &lt; $nrkol">
      <td width="$tussenkol" class="tbl-tussenkolom"><xsl:value-of select="$nbsp"/></td>
	  <xsl:call-template name="KolomWeergave">
	      <xsl:with-param name="kolom"><xsl:value-of select="$kolom + 1"/></xsl:with-param>
          <xsl:with-param name="cntr"><xsl:value-of select="$cntr"/></xsl:with-param>
          <xsl:with-param name="nrkol"><xsl:value-of select="$nrkol"/></xsl:with-param>
          <xsl:with-param name="perkolom"><xsl:value-of select="$perkolom"/></xsl:with-param>
          <xsl:with-param name="rest"><xsl:value-of select="$rest"/></xsl:with-param>
          <xsl:with-param name="kkind" select="$kkind"/>
	  </xsl:call-template>
    </xsl:if>
</xsl:template>

</xsl:stylesheet>
