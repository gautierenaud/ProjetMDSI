<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />
<xsl:template match="/">
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>#</th>
					<xsl:for-each select="ans/annee">
						<th><xsl:value-of select="@name" /></th>
					</xsl:for-each>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="ans/annee/Etudiant">
					<tr>
						<xsl:apply-templates select="." />
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</div>
</xsl:template>

<xsl:template match="Etudiant">
	<td><xsl:value-of select="Personne/Nom/text()" /><xsl:text> </xsl:text><xsl:value-of select="Personne/Prenom/text()" /></td>
	<xsl:for-each select="/ans/annee">
		<xsl:choose>
			<xsl:when test="contains(. , Etudiant)">
				<td>O</td>
			</xsl:when>
			<xsl:otherwise>
				<td>X</td>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:for-each>
</xsl:template>
</xsl:stylesheet>
