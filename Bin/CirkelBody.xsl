<?xml version = "1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">
<!--
// <author>Adrie den Blanken</author>
// <file>$Workfile: CirkelBody.xsl $</file><date>$Date: 23-08-09 20:11 $</date>
// <revision>$Revision: 12 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this
// header stays intact. No responsibility is accepted
// for use of this software.</disclaimer>
-->
<xsl:output method="html"/>

<xsl:template name="CirkelBody">
  <xsl:param name="generaties"/>

  <xsl:call-template name="ShowMenu"/>

  <xsl:for-each select="PERSOON[@link=$HuidigPersoon]">

    <div align="center">
      <xsl:if test="$Printing = 1">
        <div align="center">
          <a href="javascript:KiesXSL(39+{$generaties},{$HuidigPersoon},'','');"
             onMouseOver = "window.status='{$Txt_terug}'; return true;"
             onMouseOut  = "window.status='';"><h3><xsl:value-of select="$Txt_Vooroudercirkel"/> (<xsl:value-of select="$generaties"/><xsl:text> </xsl:text><xsl:if test="$generaties = 1"><xsl:value-of select="$Txt_generatie"/></xsl:if><xsl:if test="$generaties > 1"><xsl:value-of select="$Txt_generaties"/></xsl:if>) <xsl:value-of select="$Txt_van"/></h3></a>
        </div>
      </xsl:if>
      <xsl:if test="$Printing = 0">
        <h3><xsl:value-of select="$Txt_Vooroudercirkel"/> (<xsl:value-of select="$generaties"/><xsl:text> </xsl:text><xsl:if test="$generaties = 1"><xsl:value-of select="$Txt_generatie"/></xsl:if><xsl:if test="$generaties > 1"><xsl:value-of select="$Txt_generaties"/></xsl:if>) <xsl:value-of select="$Txt_van"/></h3>
      </xsl:if>

      <h2>
        <xsl:for-each select="PERSONAL">
          <xsl:for-each select="NAME">
            <xsl:if test="string-length(@first) != 0">
              <xsl:value-of select="@first"/>
            </xsl:if>
            <xsl:if test="string-length(@first) = 0">
              <xsl:value-of select="@nick"/>
            </xsl:if>
            <xsl:if test="string-length(@pref) != 0">
              <xsl:text> </xsl:text><xsl:value-of select="@pref"/>
            </xsl:if>
            <xsl:text> </xsl:text><xsl:value-of select="@surn"/>
          </xsl:for-each>
        </xsl:for-each>
      </h2>

      <xsl:choose>
        <xsl:when test="$generaties = 1">
          <embed id="SVGEmbedIDAVJTVB" src="Svg/Cirkel1G.svg.gz" width="500" height="320" pluginspage="http://www.adobe.com/svg/viewer/install/" type="image/svg+xml"></embed>
        </xsl:when>
        <xsl:otherwise>
          <xsl:choose>
            <xsl:when test="$generaties = 2">
              <embed id="SVGEmbedIDAVJTVB" src="Svg/Cirkel2G.svg.gz" width="500" height="320" pluginspage="http://www.adobe.com/svg/viewer/install/" type="image/svg+xml"></embed>
            </xsl:when>
            <xsl:otherwise>
              <xsl:choose>
                <xsl:when test="$generaties = 3">
                  <embed id="SVGEmbedIDAVJTVB" src="Svg/Cirkel3G.svg.gz" width="600" height="600" pluginspage="http://www.adobe.com/svg/viewer/install/" type="image/svg+xml"></embed>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:choose>
                    <xsl:when test="$generaties = 4">
                      <embed id="SVGEmbedIDAVJTVB" src="Svg/Cirkel4G.svg.gz" width="600" height="600" pluginspage="http://www.adobe.com/svg/viewer/install/" type="image/svg+xml"></embed>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:choose>
                        <xsl:when test="$generaties = 5">
                          <embed id="SVGEmbedIDAVJTVB" src="Svg/Cirkel5G.svg.gz" width="800" height="800" pluginspage="http://www.adobe.com/svg/viewer/install/" type="image/svg+xml"></embed>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:choose>
                            <xsl:when test="$generaties = 6">
                              <embed id="SVGEmbedIDAVJTVB" src="Svg/Cirkel6G.svg.gz" width="900" height="900" pluginspage="http://www.adobe.com/svg/viewer/install/" type="image/svg+xml"></embed>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:choose>
                                <xsl:when test="$generaties = 7">
                                  <embed id="SVGEmbedIDAVJTVB" src="Svg/Cirkel7G.svg.gz" width="1000" height="1000" pluginspage="http://www.adobe.com/svg/viewer/install/" type="image/svg+xml"></embed>
                                </xsl:when>
                                <xsl:otherwise>
                                </xsl:otherwise>
                              </xsl:choose>
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </div>

    <xsl:call-template name="SvgNavigatie">
        <xsl:with-param name="IsPrinting"><xsl:value-of select="$Printing"/></xsl:with-param>
        <xsl:with-param name="IsSvg">1</xsl:with-param>
        <xsl:with-param name="WelkeSvg"><xsl:value-of select="$generaties+39"/></xsl:with-param>
        <xsl:with-param name="MaxNrGen"><xsl:value-of select="$parNrGenKwartier"/></xsl:with-param>
    </xsl:call-template>

  </xsl:for-each>

</xsl:template>

</xsl:stylesheet>
