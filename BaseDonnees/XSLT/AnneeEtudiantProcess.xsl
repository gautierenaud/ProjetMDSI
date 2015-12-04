<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />
<xsl:template match="/">
	<html>
	<head>
		<title>Etudiant par Annee</title>
    </head>
		<body>
			<xsl:for-each select="ans/annee">
				<p>Année: <xsl:value-of select="@name" /></p>
				<ul>
					<xsl:for-each select="Etudiant">
						<li><xsl:apply-templates select="." /></li>
					</xsl:for-each>
				</ul>
			</xsl:for-each>
		</body>
	</html>
</xsl:template>
<xsl:template match="Etudiant">
	<xsl:value-of select="Personne/Nom" /><xsl:text> </xsl:text><xsl:value-of select="Personne/Prenom" />, <xsl:value-of select="Cursus" />
</xsl:template>
</xsl:stylesheet>
