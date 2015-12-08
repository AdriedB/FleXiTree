<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:user="http://www.adriedenblanken.nl/"
                version="1.0">
<!--
// <author>Paul Kallenberg</author>
// <file>$Workfile: VandaagIn.xsl $</file><date>$Date: 2-12-13 16:06 $</date>
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
    var geb_today = 0;
    
    function maand_naam(i,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12)
    {
        var month=new Array(m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12);

        return month[i-1];
    }
    
    function check_geb()
    {
      geb_today = 1;
      return "";
    }
    
    function evnt_today()
    {
      return (geb_today==1);
    }
    
    function thisday()
    {
  var time=new Date();
  return time.getDate();
    }

    function thismonth()
    {
  var time=new Date();
  return time.getMonth()+1;
    }
    
    function jaar_geleden(jaar)
    {
  var time=new Date();
  return time.getFullYear()-jaar;
    }

]]>
</msxsl:script>

<xsl:template match="PERSONEN">

  <xsl:call-template name="ShowMenu"/>

  <xsl:variable name="deze_maand"><xsl:value-of select="user:thismonth()"/></xsl:variable>
  <xsl:variable name="deze_dag"><xsl:value-of select="user:thisday()"/></xsl:variable>
  <xsl:variable name="Hist_evts">
    <xsl:for-each select="//PERSONEN/PERSOON/EVENTS/BIRTH">
      <xsl:if test="string-length(@date)=10 and string-length(@onz)=0 and 1*substring(@date,4,2)=$deze_maand and 1*substring(@date,1,2)=$deze_dag">
          <evt>
               <xsl:copy-of select="../../PERSONAL"/>
               <src>
                 <xsl:value-of select="../../@link"/>
               </src>
               <priv>
                 <xsl:value-of select="../../@priv"/>
               </priv>
               <h_type>
                <xsl:value-of select="$Txt_Geboorte"/>
               </h_type>
               <date>
                 <xsl:value-of select="@date"/>
               </date>
               <xsl:if test="../DEATH">
                 <d_date>
                   <xsl:value-of select="../DEATH/@date"/>
                 </d_date>
               </xsl:if>
           </evt>
         </xsl:if>
       </xsl:for-each>
    <xsl:for-each select="//PERSONEN/PERSOON/EVENTS/BAPT">
      <xsl:if test="string-length(../BIRTH/@date)!=10 and string-length(@date)=10 and string-length(@onz)=0 and 1*substring(@date,4,2)=$deze_maand and 1*substring(@date,1,2)=$deze_dag">
          <evt>
               <xsl:copy-of select="../../PERSONAL"/>
               <src>
                 <xsl:value-of select="../../@link"/>
               </src>
               <priv>
                 <xsl:value-of select="../../@priv"/>
               </priv>
               <h_type>
                <xsl:value-of select="$Txt_Doop"/>
               </h_type>
               <date>
                 <xsl:value-of select="@date"/>
               </date>
               <xsl:if test="../DEATH">
                 <d_date>
                   <xsl:value-of select="../DEATH/@date"/>
                 </d_date>
               </xsl:if>
           </evt>
         </xsl:if>
       </xsl:for-each>
    <xsl:for-each select="//PERSONEN/PERSOON/EVENTS/DEATH">
      <xsl:if test="string-length(@date)=10 and string-length(@onz)=0 and 1*substring(@date,4,2)=$deze_maand and 1*substring(@date,1,2)=$deze_dag">
        <evt>
             <xsl:copy-of select="../../PERSONAL"/>
             <src>
               <xsl:value-of select="../../@link"/>
             </src>
               <priv>
                 <xsl:value-of select="../../@priv"/>
               </priv>
             <h_type>
               <xsl:value-of select="$Txt_Overlijden"/>
             </h_type>
             <date>
               <xsl:value-of select="@date"/>
             </date>
         </evt>
         </xsl:if>
       </xsl:for-each>
    <xsl:for-each select="//PERSONEN/PERSOON/RELATIONS/RELA">
      <xsl:if test="string-length(BEGIN/@date)=10 and string-length(BEGIN/@onz)=0 and 1*substring(BEGIN/@date,4,2)=$deze_maand and 1*substring(BEGIN/@date,1,2)=$deze_dag">
      <xsl:variable name="partnerlink" select="@link"/>
      <xsl:if test="../../@link &lt; $partnerlink">
          <evt>
            <tp>1</tp>
               <xsl:copy-of select="../../PERSONAL"/>
               <src>
                 <xsl:value-of select="../../@link"/>
               </src>
               <priv>
                 <xsl:value-of select="../../@priv"/>
               </priv>
               <h_type>
                 <xsl:choose>
                    <xsl:when test="@type=1"><xsl:value-of select="$Txt_Huwelijk"/></xsl:when>
                    <xsl:when test="@type=2"><xsl:value-of select="$Txt_Notarieel"/></xsl:when>
                    <xsl:when test="@type=3"><xsl:value-of select="$Txt_Samenleven"/></xsl:when>
                    <xsl:when test="@type=4"><xsl:value-of select="$Txt_Relatie"/></xsl:when>
                    <xsl:when test="@type=5"><xsl:value-of select="$Txt_OntbrekendeRelatie"/></xsl:when>
                    <xsl:otherwise><xsl:value-of select="$Txt_OnbekendeRelatie"/></xsl:otherwise>
                 </xsl:choose>
               </h_type>
               <date>
                 <xsl:value-of select="BEGIN/@date"/>
               </date>
               <xsl:if test="../../EVENTS/DEATH">
                 <d_date>
                   <xsl:value-of select="../../EVENTS/DEATH/@onz"/><xsl:value-of select="../../EVENTS/DEATH/@date"/>
                 </d_date>
               </xsl:if>
               <partner>
                 <xsl:copy-of select="//PERSONEN/PERSOON[@link=$partnerlink]/PERSONAL"/>
                <src>
                   <xsl:value-of select="$partnerlink"/>
                 </src>
               <priv>
                 <xsl:value-of select="@priv"/>
               </priv>
               <xsl:if test="//PERSONEN/PERSOON[@link=$partnerlink]/EVENTS/DEATH">
                 <d_date>
                   <xsl:value-of select="//PERSONEN/PERSOON[@link=$partnerlink]/EVENTS/DEATH/@onz"/>
                   <xsl:value-of select="//PERSONEN/PERSOON[@link=$partnerlink]/EVENTS/DEATH/@date"/>
                 </d_date>
               </xsl:if>
               </partner>
           </evt>
         </xsl:if>
         </xsl:if>
       </xsl:for-each>
    </xsl:variable>

  <xsl:call-template name="CheckDagGebeurtenis">
      <xsl:with-param name="Evts" select="$Hist_evts"/>
    <xsl:with-param name="maand"><xsl:value-of select="user:thismonth()"/></xsl:with-param>
    <xsl:with-param name="dag"><xsl:value-of select="user:thisday()"/></xsl:with-param>
  </xsl:call-template>
      
  <xsl:if test="not(user:evnt_today())">
    <h2 align="center">
      <xsl:value-of select="$Txt_Vandaagintitelgeen"/>
    </h2>
  </xsl:if>
  <xsl:if test="user:evnt_today()">
    <h2 align="center"><xsl:value-of select="$Txt_Gebeurtenissen"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_van"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_vandaag"/></h2>
    <table border="1" bordercolor="black" cellspacing="0" cellpadding="4" align="center" class="tbl-data">
      <tr>
       <th class="tbl-head" align="left">
       <xsl:choose>
         <xsl:when test="$parTaal = 'engels'">
           <xsl:value-of select="$Txt_Vandaag"/><xsl:text>, </xsl:text>
           <xsl:value-of select="user:maand_naam(user:thismonth(),string($Txt_januari),string($Txt_februari),string($Txt_maart),string($Txt_april),string($Txt_mei),string($Txt_juni),string($Txt_juli),string($Txt_augustus),string($Txt_september),string($Txt_oktober),string($Txt_november),string($Txt_december))"/><xsl:text> </xsl:text><xsl:value-of select="user:thisday()"/><xsl:text>, </xsl:text><xsl:value-of select="$Txt_in"/>: <br/>
         </xsl:when>
         <xsl:otherwise>
           <xsl:value-of select="$Txt_Vandaag"/><xsl:text>, </xsl:text><xsl:value-of select="user:thisday()"/><xsl:value-of select="$nbsp"/>
           <xsl:value-of select="user:maand_naam(user:thismonth(),string($Txt_januari),string($Txt_februari),string($Txt_maart),string($Txt_april),string($Txt_mei),string($Txt_juni),string($Txt_juli),string($Txt_augustus),string($Txt_september),string($Txt_oktober),string($Txt_november),string($Txt_december))"/><xsl:text>, </xsl:text><xsl:value-of select="$Txt_in"/>: <br/>
         </xsl:otherwise>
       </xsl:choose>
       </th>
       <th class="tbl-head" align="left">
       # <xsl:value-of select="$Txt_jaren"/><xsl:text> </xsl:text><xsl:value-of select="$Txt_geleden"/>
       </th>
       <th class="tbl-head" align="left">
       <xsl:value-of select="$Txt_Gebeurtenis"/>
       </th>
       <th class="tbl-head" align="left">
       <xsl:value-of select="$Txt_Naam"/>
       </th>
       </tr>
        <xsl:call-template name="DagGebeurtenis">
          <xsl:with-param name="Evts" select="$Hist_evts"/>
            <xsl:with-param name="maand"><xsl:value-of select="user:thismonth()"/></xsl:with-param>
            <xsl:with-param name="dag"><xsl:value-of select="user:thisday()"/></xsl:with-param>
        </xsl:call-template>
      </table>
    </xsl:if>
  <xsl:call-template name="ShowFooter"/>

</xsl:template>

<xsl:template name="CheckDagGebeurtenis">
  <xsl:param name="Evts"/>
  <xsl:param name="maand"></xsl:param>
  <xsl:param name="dag"></xsl:param>
  <xsl:for-each select="$Evts/evt">
      <xsl:sort select="concat(substring(date,4,2),substring(date,1,2),substring(date,7,4))"/>
      <xsl:if test="string-length(date)=10 and 1*substring(date,4,2)=$maand and 1*substring(date,1,2)=$dag">
          <xsl:value-of select="user:check_geb()"/>
        </xsl:if>
    </xsl:for-each>
</xsl:template>

<xsl:template name="DagGebeurtenis">
  <xsl:param name="Evts"/>
  <xsl:param name="maand"></xsl:param>
  <xsl:param name="dag"></xsl:param>
  <xsl:for-each select="$Evts/evt">
      <xsl:sort select="concat(substring(date,4,2),substring(date,1,2),substring(date,7,4))"/>
      <xsl:if test="string-length(date)=10 and 1*substring(date,4,2)=$maand and 1*substring(date,1,2)=$dag">
          <tr>
            <td align="center">
               <xsl:value-of select="substring(date,7,4)"/>
            </td>
            <td align="center">
               <xsl:value-of select="user:jaar_geleden(substring(date,7,4))"/>
            </td>
            <td align="center">
              <xsl:value-of select="h_type"/>
            </td>
            <td>
                <xsl:call-template name="ShowPersoon">
              <xsl:with-param name="NAMEFIRST"><xsl:value-of select="PERSONAL/NAME/@first"/></xsl:with-param>
                <xsl:with-param name="NAMENICK"><xsl:value-of select="PERSONAL/NAME/@nick"/></xsl:with-param>
                <xsl:with-param name="NAMEPREF"><xsl:value-of select="PERSONAL/NAME/@pref"/></xsl:with-param>
                <xsl:with-param name="SURN"><xsl:value-of select="PERSONAL/NAME/@surn"/></xsl:with-param>
                <xsl:with-param name="src"><xsl:value-of select="src"/></xsl:with-param>
                <xsl:with-param name="priv"><xsl:value-of select="priv"/></xsl:with-param>
                </xsl:call-template>
          <xsl:if test="string-length(tp)!=0">
            <xsl:text> </xsl:text><xsl:value-of select="$Txt_en"/><xsl:text> </xsl:text>
            <xsl:call-template name="ShowPersoon">
                <xsl:with-param name="NAMEFIRST"><xsl:value-of select="partner/PERSONAL/NAME/@first"/></xsl:with-param>
                  <xsl:with-param name="NAMENICK"><xsl:value-of select="partner/PERSONAL/NAME/@nick"/></xsl:with-param>
                  <xsl:with-param name="NAMEPREF"><xsl:value-of select="partner/PERSONAL/NAME/@pref"/></xsl:with-param>
                  <xsl:with-param name="SURN"><xsl:value-of select="partner/PERSONAL/NAME/@surn"/></xsl:with-param>
                  <xsl:with-param name="src"><xsl:value-of select="partner/src"/></xsl:with-param>
                  <xsl:with-param name="priv"><xsl:value-of select="partner/priv"/></xsl:with-param>
            </xsl:call-template>
              </xsl:if>
        </td>
	  <xsl:if test="$parFotoAantal = 2 or $parFotoAantal = 3">
        <xsl:variable name="foto" select="PERSONAL/PHOTOS/PHOTO[position()=1]/@name"/>
        <xsl:variable name="title">
          <xsl:value-of select="PERSONAL/PHOTOS/PHOTO[position()=1]/@title"/>
          <xsl:text> (</xsl:text>
          <xsl:value-of select="$Txt_klik_voor_foto_in_apart_venster"/>
          <xsl:text>)</xsl:text>
        </xsl:variable>
        <xsl:variable name="linkPersoon"><xsl:value-of select="src"/></xsl:variable>
        <xsl:if test="string-length($foto)>0">
          <td align="center">
            <a href="javascript:OpenFoto('{$linkPersoon}',0)" name="afbeelding"
            	onMouseOver = "window.status='Open foto'; return true;"
            	onMouseOut  = "window.status='';"
            	onMouseDown = "window.status='Open foto'; geenRechterMuis();">
            	<img src="{$varFolderFotoAlbum}/{$foto}" title="{$title}" alt="{$foto}" name="afbeelding" height="80" border="1" bordercolor="black"/>
            </a>
          </td>
        </xsl:if>
        <xsl:if test="string-length(tp)!=0">
          <xsl:variable name="foto2" select="partner/PERSONAL/PHOTOS/PHOTO[position()=1]/@name"/>
          <xsl:variable name="title2">
            <xsl:value-of select="partner/PERSONAL/PHOTOS/PHOTO[position()=1]/@title"/>
            <xsl:text> (</xsl:text>
            <xsl:value-of select="$Txt_klik_voor_foto_in_apart_venster"/>
            <xsl:text>)</xsl:text>
          </xsl:variable>
          <xsl:variable name="linkPersoon2"><xsl:value-of select="partner/src"/></xsl:variable>
          <xsl:if test="string-length($foto2)>0">
            <td align="center">
              <a href="javascript:OpenFoto('{$linkPersoon2}',0)" name="afbeelding"
            		onMouseOver = "window.status='Open foto'; return true;"
            		onMouseOut  = "window.status='';"
            		onMouseDown = "window.status='Open foto'; geenRechterMuis();">
            		<img src="{$varFolderFotoAlbum}/{$foto2}" title="{$title2}" alt="{$foto2}" name="afbeelding" height="80" border="1" bordercolor="black"/>
                 </a>
             </td>
        </xsl:if>
      </xsl:if>
     </xsl:if>
    </tr>
   </xsl:if>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
