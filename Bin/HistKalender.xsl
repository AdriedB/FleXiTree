<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
<!--
// <author>Paul Kallenberg</author>
// <file>$Workfile: HistKalender.xsl $</file><date>$Date: 21-10-13 11:14 $</date>
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
<xsl:param name="Printing"/>
<xsl:param name="parToonVoornaam"/>
<xsl:param name="parToonVoettekst"/>
<xsl:param name="parRefOwner"/>
<xsl:param name="parRefOwnerEMail"/>
<xsl:param name="parToonKalender"/>
<xsl:param name="parStuurSorteersleutel"/>
<xsl:param name="parToonNieuws"/>
<xsl:param name="parTaal"/>

<xsl:template match="PERSONEN">

  <xsl:call-template name="ShowMenu"/>

  <xsl:variable name="Hist_evts">
    <xsl:for-each select="//PERSONEN/PERSOON/EVENTS/BIRTH">
      <xsl:if test="string-length(@date)=10 and string-length(@onz)=0">
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
      <xsl:if test="string-length(../BIRTH/@date)!=10 and string-length(@date)=10 and string-length(@onz)=0">
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
               <xsl:value-of select="@onz"/><xsl:value-of select="@date"/>
             </date>
         </evt>
       </xsl:for-each>
    <xsl:for-each select="//PERSONEN/PERSOON/RELATIONS/RELA">
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
                 <xsl:value-of select="BEGIN/@onz"/><xsl:value-of select="BEGIN/@date"/>
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
                 <xsl:for-each select="//PERSONEN/PERSOON[@link=$partnerlink]">
                   <xsl:value-of select="@priv"/>
                 </xsl:for-each>
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
       </xsl:for-each>
    </xsl:variable>

  <xsl:call-template name="List_evts">
      <xsl:with-param name="Evts" select="$Hist_evts"/>
    </xsl:call-template>
  
</xsl:template>

<xsl:template name="List_evts">
  <xsl:param name="Evts"/>
  <h2 align="center"><xsl:value-of select="$Txt_Historischekalender"/></h2>
  <table border="1" bordercolor="black" cellspacing="0" cellpadding="4" align="center" class="tbl-data">
    <th class="tbl-head" align="right"><xsl:value-of select="$Txt_Datum"/></th>
    <th class="tbl-head" align="center"><xsl:value-of select="$Txt_Gebeurtenis"/></th>
    <th class="tbl-head" align="left"><xsl:value-of select="$Txt_Naam"/></th>
      <xsl:for-each select="$Evts/evt">
        <xsl:sort select="concat(substring(date,string-length(date)-3,4),substring(date,4,2),substring(date,1,2))"/>
        <xsl:if test="string-length(date)=10">
          <tr>
              <td align="right">
                <xsl:value-of select="date"/>
              </td>
              <td align="center">
              <xsl:value-of select="h_type"/>
           </td>
             <td align="left">
            <xsl:call-template name="ShowPersoon">
                <xsl:with-param name="NAMEFIRST"><xsl:value-of select="PERSONAL/NAME/@first"/></xsl:with-param>
                  <xsl:with-param name="NAMENICK"><xsl:value-of select="PERSONAL/NAME/@nick"/></xsl:with-param>
                  <xsl:with-param name="NAMEPREF"><xsl:value-of select="PERSONAL/NAME/@pref"/></xsl:with-param>
                  <xsl:with-param name="SURN"><xsl:value-of select="PERSONAL/NAME/@surn"/></xsl:with-param>
                  <xsl:with-param name="src"><xsl:value-of select="src"/></xsl:with-param>
                  <xsl:with-param name="priv"><xsl:value-of select="priv"/></xsl:with-param>
            </xsl:call-template>
                  <xsl:if test="d_date">
                         <font color="blue">
                      (<xsl:value-of select="$dagger"/> <xsl:value-of select="d_date"/>)
                    </font>
                  </xsl:if>
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
                    <xsl:if test="partner/d_date">
                           <font color="blue">
                        (<xsl:value-of select="$dagger"/> <xsl:value-of select="partner/d_date"/>)
                      </font>
                    </xsl:if>
                </xsl:if>
              </td>
           </tr>
        </xsl:if>
      </xsl:for-each>
    </table>
  
</xsl:template>

</xsl:stylesheet>
