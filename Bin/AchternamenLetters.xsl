<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
<!--
// <author>Paul Kallenberg</author>
// <file>$Workfile: AchternamenLetters.xsl $</file><date>$Date: 9-08-11 15:57 $</date>
// <revision>$Revision: 2 $</revision><release>1.0</release>
// <disclaimer>This software may be used as long as this header stays intact.
// No responsibility is accepted for use of this software.</disclaimer>
-->
<xsl:output method="html"/>

<xsl:key name="items-index" match="//PERSONEN/PERSOON" use="substring(PERSONAL/NAME/@surn,1,1)"/>
  
<xsl:template name="achternamenletters">

  <xsl:for-each select="PERSOON[generate-id() = generate-id(key('items-index',substring(PERSONAL/NAME/@surn,1,1))[1])]">
    <xsl:sort select="PERSONAL/NAME/@surn" order="ascending" data-type="text"/>
    <xsl:sort select="PERSONAL/NAME/@first" order="ascending" data-type="text"/>
        <xsl:variable name="surnNoQuote">
          <xsl:call-template name="replace-substring">
            <xsl:with-param name="original"><xsl:value-of select="substring(PERSONAL/NAME/@surn,1,1)"/></xsl:with-param>
            <xsl:with-param name="substring"><xsl:value-of select="$squote"/></xsl:with-param>
            <xsl:with-param name="replacement">\<xsl:value-of select="$squote"/></xsl:with-param>
          </xsl:call-template>
        </xsl:variable>
        <xsl:element name="a">
           <xsl:attribute name="href">javascript:KiesXSL(30,<xsl:value-of select="$HuidigPersoon"/>,'<xsl:value-of select="$surnNoQuote"/>','')</xsl:attribute>
           <xsl:value-of select="substring(PERSONAL/NAME/@surn,1,1)"/>
        </xsl:element>
        <xsl:text> </xsl:text>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
