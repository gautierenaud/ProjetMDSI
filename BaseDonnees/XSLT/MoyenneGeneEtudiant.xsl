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
				</a>
			</div>
			<div class="accordion-body collapse">
				<xsl:attribute name="id">
					<xsl:value-of select="@id"/>
				</xsl:attribute>
				<div class="accordion-inner">
					<script>
						var listAnnee = [];
						var listMoyenne = [];
						<xsl:for-each select="Annee">
							listAnnee.push(<xsl:value-of select="@valeur" />);
							listMoyenne.push(<xsl:value-of select="MoyenneGenerale/text()" />);
						</xsl:for-each>
						
						LineChart("<xsl:value-of select="@id"/>", listMoyenne, listAnnee);
					</script>
				</div>
			</div>
		</div>
		</xsl:for-each>
	</div>
</xsl:template>
</xsl:stylesheet>
