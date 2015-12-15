<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />
<xsl:template match="/">
	<div>
		<xsl:for-each select="ans/Matiere">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2">
						<xsl:attribute name="href">
							<xsl:text>#</xsl:text><xsl:value-of select="translate(Name/text(),' ', '')"/>
						</xsl:attribute>
						<xsl:value-of select="Name/text()"/>
						<span class="badge"><xsl:value-of select="count(.//Etudiant)" /></span>
					</a>
				</div>
				<div class="accordion-body collapse">
					<xsl:attribute name="id">
						<xsl:value-of select="translate(Name/text(),' ', '')"/>
					</xsl:attribute>
					<div class="accordion-inner">
						<ul>
							<xsl:for-each select="Etudiants/Etudiant">
								<li><xsl:value-of select="Nom/text()" /><xsl:text> </xsl:text><xsl:value-of select="Prenom/text()" /></li>
							</xsl:for-each>
						</ul>
					</div>
				</div>
			</div>
		</xsl:for-each>
	</div>
</xsl:template>
</xsl:stylesheet>
