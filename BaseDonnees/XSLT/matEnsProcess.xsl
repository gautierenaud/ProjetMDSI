<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />
<xsl:template match="/">

	<div>
		<xsl:for-each select="ans/Enseignant">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2">
						<xsl:attribute name="href">
							#<xsl:value-of select="translate(Personne/Nom/text(), ' ', '')" /> <xsl:value-of select="translate(Personne/Prenom/text(), ' ', '')"/>
						</xsl:attribute>
						<xsl:value-of select="Personne/Nom/text() "/><xsl:text> </xsl:text>
						<xsl:value-of select="Personne/Prenom/text() "/>
						<span class="badge"><xsl:value-of select="count(Matiere)" /></span>
					</a>
				</div>
				<div class="accordion-body collapse">
					<xsl:attribute name="id">
						<xsl:value-of select="translate(Personne/Nom/text(), ' ', '')" />
						<xsl:value-of select="translate(Personne/Prenom/text(), ' ', '')" />
					</xsl:attribute>
					<div class="accordion-inner">
						<xsl:if test="count(Matiere)!=0">
						<ul>
							<xsl:for-each select="Matiere">
								<li><xsl:value-of select="Nom/text()" /></li>
							</xsl:for-each>
						</ul>
						</xsl:if>
					</div>
				</div>
			</div>
		</xsl:for-each>
	</div>
		

</xsl:template>
</xsl:stylesheet>

