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
        <xsl:for-each select="inventario/producto">
        <table border="3pt">
            <tr>
                <th colspan="2" bgcolor="yellow">Elemento <xsl:value-of select="./@codigo" /></th>
            </tr>
            <tr>
                <tl>Peso: <xsl:value-of select="peso" /><xsl:value-of select="./peso/@unidad" /></tl>
            </tr>
            <tr>
                <tl>Nombre: <xsl:value-of select="nombre" /></tl>
            </tr>
            <tr>
                <tl>Lugar: <xsl:value-of select="lugar" /></tl>
                | <tl>Aula: <xsl:value-of select="./lugar/aula" /></tl>
            </tr>
        </table>
        <br/>
        </xsl:for-each>
    </body>
</html>
</xsl:template>
</xsl:stylesheet>
