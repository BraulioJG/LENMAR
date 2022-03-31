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
    <xsl:for-each select="catalog/cd"> <!--Sirve para seleccionar los elementos, es la ruta del documento xml en la que entramos-->
    <xsl:sort select="artist" /> <!--Ordena el contenido por nombre de artista-->
    <xsl:sort select="price" data-type="number" order="descending"/> <!--Ordena el contenido por precio-->
    <xsl:if test="(price &gt; 9) and (price &lt; 10)"> <!--Muestra un contenido si se cumple una condición. &gt; indica >, amp& indica & y &lt; indica <.-->
    <xsl:if test="artist='Bob Dylan'">
    <xsl:if test="title/@id=2"> <!--Filtramos por atributos de elementos con @atributo-->
    <tr>
      <td><xsl:value-of select="title"/></td> <!--Selecciona el valor de un elemento que indico con select-->
      <td><xsl:value-of select="artist"/></td>
      <td><xsl:value-of select="price"/></td>
    </tr>
    </xsl:if>
    </xsl:if>
    </xsl:if>
    </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>