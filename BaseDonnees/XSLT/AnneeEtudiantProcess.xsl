<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />
<xsl:template match="/">

	<div class="ColumnChartContainer" id="ColumnChartContainer">
		<script>
			var listAnnee = [];
			var listNumEtud = [];
			<xsl:for-each select="ans/annee">
				listAnnee.push(<xsl:value-of select="@name" />);
				listNumEtud.push(<xsl:value-of select="count(Etudiant)" />);
			</xsl:for-each>

			ColumnChart("ColumnChartContainer", listAnnee, listNumEtud);
		</script>
	</div>
	
	<div class="accordion" id="accordion2">
		<xsl:for-each select="ans/annee">
		<div class="accordion-group">
			<div class="accordion-heading">
				<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2">
					<xsl:attribute name="href">
						#<xsl:value-of select="@name" />
					</xsl:attribute>
					Année <xsl:value-of select="@name" />
					<span class="badge"><xsl:value-of select="count(Etudiant)" /></span>
				</a>
			</div>
			<div class="accordion-body collapse">
				<xsl:attribute name="id">
					<xsl:value-of select="@name"/>
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
