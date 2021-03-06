<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />
<xsl:template match="/">
	<div>
		<xsl:for-each select="ans/groupe">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2">
						<xsl:attribute name="href">
							#<xsl:value-of select="translate(@name, ' ', '')" />
						</xsl:attribute>
						<xsl:value-of select="@name" />
						<span class="badge"><xsl:value-of select="count(Etudiant)" /></span>
					</a>
				</div>
				<div class="accordion-body collapse">
					<xsl:attribute name="id">
						<xsl:value-of select="translate(@name, ' ', '')" />
					</xsl:attribute>
					<div class="accordion-inner">
						<ul>
							<xsl:for-each select="Etudiant">
								<li><xsl:value-of select="Personne/Nom/text()" /><xsl:text> </xsl:text><xsl:value-of select="Personne/Prenom/text()" /></li>
							</xsl:for-each>
						</ul>
					</div>
				</div>
			</div>
		</xsl:for-each>
	</div>
</xsl:template>
</xsl:stylesheet>
