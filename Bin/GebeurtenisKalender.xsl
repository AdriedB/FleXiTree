<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:user="http://www.adriedenblanken.nl/"
                version="1.0">
<!--
// <author>Paul Kallenberg</author>
// <file>$Workfile: GebeurtenisKalender.xsl $</file><date>$Date: 30-08-09 8:55 $</date>
// <revision>$Revision: 16 $</revision><release>1.0</release>
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
<xsl:param name="parTaal"/>

<msxsl:script language="javascript" implements-prefix="user">
<![CDATA[
    
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

]]>
</msxsl:script>

<!--
Het begin
-->

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

        <h2 align="center"><xsl:value-of select="$Txt_Gebeurtenissenkalender"/></h2>
  <table align="center">
    <xsl:element name="a">
          <xsl:attribute name="name"><xsl:value-of select="$Txt_januari"/></xsl:attribute>
    </xsl:element>
      <xsl:call-template name="KalenderMaand">
        <xsl:with-param name="maand">01</xsl:with-param>
        <xsl:with-param name="maandnaam"><xsl:value-of select="$Txt_Januari"/></xsl:with-param>
        <xsl:with-param name="Evts" select="$Hist_evts"/>
      </xsl:call-template>
      
      <xsl:element name="a">
          <xsl:attribute name="name"><xsl:value-of select="$Txt_februari"/></xsl:attribute>
    </xsl:element>
      <xsl:call-template name="KalenderMaand">
        <xsl:with-param name="maand">02</xsl:with-param>
        <xsl:with-param name="maandnaam"><xsl:value-of select="$Txt_Februari"/></xsl:with-param>
        <xsl:with-param name="Evts" select="$Hist_evts"/>
      </xsl:call-template>
      
    <xsl:element name="a">
      <xsl:attribute name="name"><xsl:value-of select="$Txt_maart"/></xsl:attribute>
    </xsl:element>
      <xsl:call-template name="KalenderMaand">
        <xsl:with-param name="maand">03</xsl:with-param>
        <xsl:with-param name="maandnaam"><xsl:value-of select="$Txt_Maart"/></xsl:with-param>
        <xsl:with-param name="Evts" select="$Hist_evts"/>
      </xsl:call-template>
      
    <xsl:element name="a">
      <xsl:attribute name="name"><xsl:value-of select="$Txt_april"/></xsl:attribute>
    </xsl:element>
      <xsl:call-template name="KalenderMaand">
        <xsl:with-param name="maand">04</xsl:with-param>
        <xsl:with-param name="maandnaam"><xsl:value-of select="$Txt_April"/></xsl:with-param>
        <xsl:with-param name="Evts" select="$Hist_evts"/>
      </xsl:call-template>
      
    <xsl:element name="a">
      <xsl:attribute name="name"><xsl:value-of select="$Txt_mei"/></xsl:attribute>
    </xsl:element>
      <xsl:call-template name="KalenderMaand">
        <xsl:with-param name="maand">05</xsl:with-param>
        <xsl:with-param name="maandnaam"><xsl:value-of select="$Txt_Mei"/></xsl:with-param>
        <xsl:with-param name="Evts" select="$Hist_evts"/>
      </xsl:call-template>
      
    <xsl:element name="a">
      <xsl:attribute name="name"><xsl:value-of select="$Txt_juni"/></xsl:attribute>
    </xsl:element>
      <xsl:call-template name="KalenderMaand">
        <xsl:with-param name="maand">06</xsl:with-param>
        <xsl:with-param name="maandnaam"><xsl:value-of select="$Txt_Juni"/></xsl:with-param>
        <xsl:with-param name="Evts" select="$Hist_evts"/>
      </xsl:call-template>
      
    <xsl:element name="a">
      <xsl:attribute name="name"><xsl:value-of select="$Txt_juli"/></xsl:attribute>
    </xsl:element>
      <xsl:call-template name="KalenderMaand">
        <xsl:with-param name="maand">07</xsl:with-param>
        <xsl:with-param name="maandnaam"><xsl:value-of select="$Txt_Juli"/></xsl:with-param>
        <xsl:with-param name="Evts" select="$Hist_evts"/>
      </xsl:call-template>
      
    <xsl:element name="a">
      <xsl:attribute name="name"><xsl:value-of select="$Txt_augustus"/></xsl:attribute>
    </xsl:element>
      <xsl:call-template name="KalenderMaand">
        <xsl:with-param name="maand">08</xsl:with-param>
        <xsl:with-param name="maandnaam"><xsl:value-of select="$Txt_Augustus"/></xsl:with-param>
        <xsl:with-param name="Evts" select="$Hist_evts"/>
      </xsl:call-template>
      
    <xsl:element name="a">
      <xsl:attribute name="name"><xsl:value-of select="$Txt_september"/></xsl:attribute>
    </xsl:element>
      <xsl:call-template name="KalenderMaand">
        <xsl:with-param name="maand">09</xsl:with-param>
        <xsl:with-param name="maandnaam"><xsl:value-of select="$Txt_September"/></xsl:with-param>
        <xsl:with-param name="Evts" select="$Hist_evts"/>
      </xsl:call-template>
      
    <xsl:element name="a">
      <xsl:attribute name="name"><xsl:value-of select="$Txt_oktober"/></xsl:attribute>
    </xsl:element>
      <xsl:call-template name="KalenderMaand">
        <xsl:with-param name="maand">10</xsl:with-param>
        <xsl:with-param name="maandnaam"><xsl:value-of select="$Txt_Oktober"/></xsl:with-param>
        <xsl:with-param name="Evts" select="$Hist_evts"/>
      </xsl:call-template>
      
    <xsl:element name="a">
      <xsl:attribute name="name"><xsl:value-of select="$Txt_november"/></xsl:attribute>
    </xsl:element>
      <xsl:call-template name="KalenderMaand">
        <xsl:with-param name="maand">11</xsl:with-param>
        <xsl:with-param name="maandnaam"><xsl:value-of select="$Txt_November"/></xsl:with-param>
        <xsl:with-param name="Evts" select="$Hist_evts"/>
      </xsl:call-template>

      <xsl:element name="a">
      <xsl:attribute name="name"><xsl:value-of select="$Txt_december"/></xsl:attribute>
    </xsl:element>
      <xsl:call-template name="KalenderMaand">
        <xsl:with-param name="maand">12</xsl:with-param>
        <xsl:with-param name="maandnaam"><xsl:value-of select="$Txt_December"/></xsl:with-param>
        <xsl:with-param name="Evts" select="$Hist_evts"/>
      </xsl:call-template>
  </table>
  <xsl:call-template name="ShowFooter"/>

</xsl:template>

<xsl:template name="KalenderMaand">
  <xsl:param name="maand"></xsl:param>
  <xsl:param name="maandnaam"></xsl:param>
  <xsl:param name="Evts"/>
  
  <xsl:if test="count($Evts/evt)!=0">
  <tr><td class="tbl-kalender-maand"><br /><xsl:value-of select="$maandnaam"/></td></tr>
  <tr>
  <td>
  <table width="100%" border="1" bordercolor="black" cellspacing="0" cellpadding="4" class="tbl-data">
    <tr>
    <th class="tbl-head" align="center" width="5%"><xsl:value-of select="$Txt_Dag"/></th>
    <th class="tbl-head" align="center" width="5%"><xsl:value-of select="$Txt_Jaar"/></th>
    <th class="tbl-head" align="center" width="15%"><xsl:value-of select="$Txt_Gebeurtenis"/></th>
    <th class="tbl-head" align="left" width="75%"><xsl:value-of select="$Txt_Naam"/></th>
    </tr>

  <xsl:for-each select="$Evts/evt">
      <xsl:sort select="concat(substring(date,4,2),substring(date,1,2),substring(date,7,4))"/>
      <xsl:if test="string-length(date)=10 and substring(date,4,2)=$maand">
        <tr>
            <td align="center">
          <xsl:if test="substring(date,1,2)=user:thisday() and substring(date,4,2)=user:thismonth()">
                <xsl:element name="b">
                  <xsl:if test="substring(date,1,1)=0">
                	<xsl:value-of select="substring(date,2,1)"/><xsl:value-of select="$nbsp"/>
              	  </xsl:if>
                  <xsl:if test="substring(date,1,1)!=0">
                	<xsl:value-of select="substring(date,1,2)"/><xsl:value-of select="$nbsp"/>
                  </xsl:if>
            </xsl:element>
          </xsl:if>
    
          <xsl:if test="substring(date,1,2)!=user:thisday() or substring(date,4,2)!=user:thismonth()">
                <xsl:if test="substring(date,1,1)=0">
              <xsl:value-of select="substring(date,2,1)"/><xsl:value-of select="$nbsp"/>
                </xsl:if>
                <xsl:if test="substring(date,1,1)!=0">
                  <xsl:value-of select="substring(date,1,2)"/><xsl:value-of select="$nbsp"/>
                </xsl:if>
          </xsl:if>
            </td>
        
            <td align="center">
          <xsl:if test="substring(date,1,2)=user:thisday() and substring(date,4,2)=user:thismonth()">
                <xsl:element name="b">
                  <xsl:value-of select="substring(date,7,4)"/>
            </xsl:element>
          </xsl:if>
    
          <xsl:if test="substring(date,1,2)!=user:thisday() or substring(date,4,2)!=user:thismonth()">
                <xsl:value-of select="substring(date,7,4)"/>
          </xsl:if>
            </td>
        
            <td align="center">
          <xsl:if test="substring(date,1,2)=user:thisday() and substring(date,4,2)=user:thismonth()">
                <xsl:element name="b">
                  <xsl:value-of select="$nbsp"/><xsl:value-of select="$nbsp"/>
                  <xsl:value-of select="h_type"/>
                  <xsl:value-of select="$nbsp"/><xsl:value-of select="$nbsp"/>
            </xsl:element>
          </xsl:if>
          <xsl:if test="substring(date,1,2)!=user:thisday() or substring(date,4,2)!=user:thismonth()">
                <xsl:value-of select="$nbsp"/><xsl:value-of select="$nbsp"/>
                <xsl:value-of select="h_type"/>
                <xsl:value-of select="$nbsp"/><xsl:value-of select="$nbsp"/>
          </xsl:if>
            </td>
        
            <td>
          <xsl:if test="substring(date,1,2)=user:thisday() and substring(date,4,2)=user:thismonth()">
                <xsl:element name="b">
                    <xsl:call-template name="ShowPersoon">
                <xsl:with-param name="NAMEFIRST"><xsl:value-of select="PERSONAL/NAME/@first"/></xsl:with-param>
                   <xsl:with-param name="NAMENICK"><xsl:value-of select="PERSONAL/NAME/@nick"/></xsl:with-param>
                   <xsl:with-param name="NAMEPREF"><xsl:value-of select="PERSONAL/NAME/@pref"/></xsl:with-param>
                   <xsl:with-param name="SURN"><xsl:value-of select="PERSONAL/NAME/@surn"/></xsl:with-param>
                    <xsl:with-param name="src"><xsl:value-of select="src"/></xsl:with-param>
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
                          </xsl:call-template>
                     <xsl:if test="partner/d_date">
                            <font color="blue">
                         (<xsl:value-of select="$dagger"/> <xsl:value-of select="partner/d_date"/>)
                      </font>
                    </xsl:if>
                    </xsl:if>
            </xsl:element>
          </xsl:if>
    
          <xsl:if test="substring(date,1,2)!=user:thisday() or substring(date,4,2)!=user:thismonth()">
                  <xsl:call-template name="ShowPersoon">
              <xsl:with-param name="NAMEFIRST"><xsl:value-of select="PERSONAL/NAME/@first"/></xsl:with-param>
                 <xsl:with-param name="NAMENICK"><xsl:value-of select="PERSONAL/NAME/@nick"/></xsl:with-param>
                 <xsl:with-param name="NAMEPREF"><xsl:value-of select="PERSONAL/NAME/@pref"/></xsl:with-param>
                 <xsl:with-param name="SURN"><xsl:value-of select="PERSONAL/NAME/@surn"/></xsl:with-param>
                  <xsl:with-param name="src"><xsl:value-of select="src"/></xsl:with-param>
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
                        </xsl:call-template>
                   <xsl:if test="partner/d_date">
                          <font color="blue">
                       (<xsl:value-of select="$dagger"/> <xsl:value-of select="partner/d_date"/>)
                    </font>
                  </xsl:if>
                  </xsl:if>
          </xsl:if>
        </td>
      </tr>
    </xsl:if>
    </xsl:for-each>
  </table>
  </td>
  </tr>
  </xsl:if>
</xsl:template>

</xsl:stylesheet>
