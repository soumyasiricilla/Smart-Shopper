<?xml version="1.0" encoding="UTF-8" ?>
<!--
  Smart shopping project  

   Filename:         catalogxslt.xsl
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

   <table align="center" class="Summary" border="2" cellpadding="2">
   <tr>
      <th colspan="2">Summary Information</th>
   </tr>
   <tr>
      <th class="Summary">Costco</th>
      <td class="Summary"><xsl:value-of select="format-number(sum(//@cc), '##,###.00')"/>
      </td>
   </tr>
   <tr>
      <th class="Summary">Walmart</th>
      <td class="Summary"><xsl:value-of select="format-number(sum(//@wc), '##,###.00')"/></td>
   </tr>
   <tr>
      <th class="Summary"><a>Samsclub</a></th>
      <td class="Summary"><xsl:value-of select="format-number(sum(//@sc), '##,###.00')"/></td>
   </tr>
   <tr>
      <th class="Summary">Low</th>
      <td class="Summary"><xsl:value-of select="format-number(sum(//@lc), '##,###.00')"/></td>
   </tr>
    <tr>
      <th class="Summary">High</th>
      <td class="Summary"><xsl:value-of select="format-number(sum(//@hc), '##,###.00')"/></td>
   </tr>
   </table>
   
   <p><img src="logoo.png" alt="Samrt shopper" /></p>
   <table class="menu">
   	  <td class="menu"><h4><a href="home.xml">HOME</a></h4></td>
   	  <td class="menu"><h4><a href="groceries.xml">GROCERIES</a></h4></td>
   	  <td class="menu"><h4><a href="furniture.xml">FURNITURE</a></h4></td>
   	  <td class="menu"><h4><a href="electronics.xml">ELECTRONICS</a></h4></td>
   	  <td class="menu"><h4><a href="sportsfitness.xml">SPORTS and FITNESS</a></h4></td>
   	  <td class="menu"><h4><a href="pharmacy.xml">PHARMACY</a></h4></td>
   	  
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
      <th>Costco</th>
      <th>Walmart</th>
      <th>Samsclub</th>
      <th>Low</th>
      <th>High</th>
   </tr>
    <xsl:apply-templates select="product">
      <xsl:sort select="pName" />
   </xsl:apply-templates>
   <tr>
      <th colspan="1" class="num">Total</th>
      <td class="num"><xsl:value-of select="format-number(sum(product/cost/@cc), '##,###.00')"/></td>
      <td class="num"><xsl:value-of select="format-number(sum(product/cost/@wc), '##,###.00')"/></td>
      <td class="num"><xsl:value-of select="format-number(sum(product/cost/@sc), '##,###.00')"/></td>
      <td class="num"><xsl:value-of select="format-number(sum(product/cost/@lc), '##,###.00')"/></td>
      <td class="num"><xsl:value-of select="format-number(sum(product/cost/@hc), '##,###.00')"/></td>
   </tr>
   </table>
</xsl:template>

<xsl:template match="product">
   <xsl:apply-templates select="cost"/>
  
</xsl:template>

<xsl:template match="cost">
<tr>
   <td><xsl:value-of select="../pName" /></td>
   <td><xsl:value-of select="@cc" /></td>
   <td><xsl:value-of select="@wc" /></td>
   <td class="num"><xsl:value-of select="@sc" /></td>
   <td><xsl:value-of select="@lc" /></td>
   <td><xsl:value-of select="@hc" /></td>
 
</tr>
</xsl:template>

</xsl:stylesheet>