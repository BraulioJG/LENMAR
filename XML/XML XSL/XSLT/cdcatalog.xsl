<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/"> <!--El elemento template sirve para definir plantillas. El atributo match asocia un elemento con la plantilla o, en este caso con la barra, todo el documento-->
<html> 
<body>
  <h2>My CD Collection</h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th style="text-align:left">Title</th>
      <th style="text-align:left">Artist</th>
      <th style="text-align:left">Price</th>
    </tr>
    <xsl:for-each select="catalog/cd"><!--Sirve para seleccionar los elementos, es la ruta del documento xml en la que entramos-->
    <xsl:sort select="artist" /><!--Ordena el contenido por nombre de artista-->
    <xsl:sort select="price" data-type="number" order="descending"/><!--Ordena el contenido por precio descendente-->
    <!--<xsl:if test="(price &gt; 9) and (price &lt; 10)"> Muestra un contenido si se cumple una condición. &gt; indica >, amp& indica & y &lt; indica <.-->
    <!--<xsl:if test="artist='Bob Dylan'">-->
    <!--<xsl:if test="title/@id=2"> Filtramos por atributos de elementos con @atributo-->
    <!--</xsl:if>-->
    <!--</xsl:if>-->
    <!--</xsl:if>-->
    <tr>
      <td><xsl:value-of select="title"/></td>
      <xsl:choose> <!--Seleccionamos lo que se muestra en el td cuando se cumple una condición-->
        <xsl:when test="price &gt; 10">
          <td bgcolor="#ff00ff">
          <xsl:value-of select="artist"/></td>
        </xsl:when>
        <xsl:when test="price &gt; 9">
          <td bgcolor="#cccccc">
          <xsl:value-of select="artist"/></td>
        </xsl:when>
        <xsl:otherwise>
          <td><xsl:value-of select="artist"/></td>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="price &gt; 8 and price &lt; 10"> <!--Seleccionamos lo que se muestra en el td cuando se cumple una condición, pero no es tan sencillo como choose-->
        <td bgcolor="#ff00ff">
          <xsl:value-of select="price" />
        </td>
      </xsl:if>
      <xsl:if test="price &gt; 0 and price &lt; 8">
        <td bgcolor="#ff0000">
          <xsl:value-of select="price" />
        </td>
      </xsl:if>
      <xsl:if test="price &gt;= 10">
        <td bgcolor="black" style="color:white">
          <xsl:value-of select="price" />
        </td>
      </xsl:if>
    </tr>
    </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>