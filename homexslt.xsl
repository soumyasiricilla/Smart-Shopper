<?xml version="1.0" encoding="UTF-8" ?>
<!--
 Smart shopping project  

   Filename:         homexslt.xsl
   Supporting Files: home.xml,catalogcss.css, logoo.jpg.

-->

<xsl:stylesheet version='1.0' xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="4.0" />

<xsl:template match="/">
   <html>
   <head><title>Smart Shopping</title>
     <link href="catalogcss.css" rel="stylesheet" type="text/css"/>
   </head>
   <link href="items.css" rel="stylesheet" type="text/css" />
   <body>

      <p><img src="logoo.png" alt="Smart Shopping" /></p>
   <table class="menu">
   	  <td class="menu"><h4><a href="home.xml">HOME</a></h4></td>
   	  <td class="menu"><h4><a href="catalog.xml">SUMMARY</a></h4></td>
   	  
   </table>
   <xsl:apply-templates select="catalog/group" />
   </body>
   </html>
</xsl:template>


<xsl:template match="group">
   <h1><xsl:value-of select="@type" /></h1>
   <table class="prod" border="10" cellpadding="5" bordercolor="blue" bordercolorlight="lightblue">
   <tr>
      <th>Name</th>
      
   </tr>
    <xsl:apply-templates select="product">
      <xsl:sort select="pName" />
   </xsl:apply-templates>
   
   </table>
</xsl:template>

<xsl:template match="product">
   <xsl:value-of select="pName"/>
  
</xsl:template>

<xsl:template match="product">
   <xsl:apply-templates select="cost"/>
  
</xsl:template>

<xsl:template match="cost">
<tr>
   <td><xsl:value-of select="../pName" /></td>
   </tr>
</xsl:template>


  </xsl:stylesheet>