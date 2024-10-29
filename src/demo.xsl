<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
   
   <xsl:strip-space elements="w pc"/>
   
   <xsl:template match="/" mode="#default">
      
      <header>
         <link rel="stylesheet" type="text/css" href="format.css"/>
      </header> 
      
      <html>
         <body>
            <xsl:apply-templates select="@*|node()"/>
         </body>
      </html>
      
   </xsl:template>
   
   <xsl:template match="p">
      <p><xsl:apply-templates /></p>        
   </xsl:template>
   
   <!-- <xsl:template match="lb">
        <br><xsl:apply-templates select="@*|node()"/></br>
        </xsl:template> -->
   
   <xsl:template match="s">
      <stc>
         <xsl:apply-templates select="@*|node()"/>
      </stc>
   </xsl:template>   
   
   <xsl:template match="@pos" mode="#default">
      <xsl:attribute name="title" select="."/>
   </xsl:template>
   
   <xsl:template match="div[@type='section']/head" mode="#default">
      <h3><xsl:apply-templates select="@*|node()"/></h3>
   </xsl:template>
   
   <xsl:template match="div[@type='subsection']/head" mode="#default">
      <h4><xsl:apply-templates select="@*|node()"/></h4>
   </xsl:template>

   <xsl:template match="@*|node()">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" />
      </xsl:copy>
   </xsl:template>
   
   <xsl:template match="teiHeader|front|sic|back "/>
   
   <!-- <xsl:template match="sic"/> -->
   
   <xsl:template match="pc[@type='hyphenation']"/>
   
</xsl:stylesheet>