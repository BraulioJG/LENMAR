<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
    <head>
        <title>HTML Resultante</title>
    </head>
    <body>
        <h1>Inventario en lista</h1>
        <xsl:for-each select="inventario/producto">
            <ul>
                <li>Codigo de producto: <xsl:value-of select="./@codigo" /></li>
                <li>Peso: <xsl:value-of select="peso" /><xsl:value-of select="./peso/@unidad" /></li>
                <li>Nombre: <xsl:value-of select="nombre" /></li>
                <li>Edificio: <xsl:value-of select="./lugar/@edificio" /></li>
                <ul>
                    <li> Aula: <xsl:value-of select="./lugar/aula" /></li>
                </ul>
            </ul>
        </xsl:for-each>
        <br/>
        <hr/>
        <br/>
        <h1>Inventario en tabla</h1>
        <table border="2">
        <xsl:for-each select="inventario/producto">
            <tr>
                <th colspan="2" bgcolor="yellow">Elemento <xsl:value-of select="./@codigo" /></th>
            </tr>
            <tr>
                <td bgcolor="lightyellow">Nombre</td>
                <td><xsl:value-of select="nombre" /></td>
            </tr>
            <tr>
                <td bgcolor="lightyellow">Peso</td>
                <xsl:if test="peso&gt;=100">
                <td bgcolor="red"><xsl:value-of select="peso" /><xsl:value-of select="./peso/@unidad" /></td>
                </xsl:if>
            </tr>
        </xsl:for-each>
        </table>
        <br/>
    </body>
</html>
</xsl:template>
</xsl:stylesheet>