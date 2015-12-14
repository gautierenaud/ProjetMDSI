<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />
<xsl:template match="/">

	<div class="accordion" id="accordion2">
		<xsl:for-each select="ans/Etudiant">
		<div class="accordion-group">
			<div class="accordion-heading">
				<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2">
					<xsl:attribute name="href">
						<xsl:text>#</xsl:text><xsl:value-of select="@id"/>
					</xsl:attribute>
					<xsl:value-of select="Nom/text()" /><xsl:text> </xsl:text><xsl:value-of select="Prenom/text()" />
					<span class="badge"><xsl:value-of select="count(Annee/Matiere)" /></span>
				</a>
			</div>
			<div class="accordion-body collapse">
				<xsl:attribute name="id">
					<xsl:value-of select="@id"/>
				</xsl:attribute>
				<div class="accordion-inner">
					<ul>
						<xsl:for-each select="Annee">
							<xsl:for-each select="Matiere">
								<li><xsl:value-of select="Nom"/><xsl:text>: </xsl:text><xsl:value-of select="Moyenne" /></li>
							</xsl:for-each>
							<li role="separator" class="divider"></li>
						</xsl:for-each>
					</ul>
				</div>
			</div>
		</div>
		</xsl:for-each>
	</div>
</xsl:template>
</xsl:stylesheet>
