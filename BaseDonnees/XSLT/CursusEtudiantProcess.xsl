<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />
<xsl:template match="/">
	<div>
		<xsl:for-each select="ans/cursus">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2">
						<xsl:attribute name="href">
							<xsl:text>#</xsl:text><xsl:value-of select="@name"/>
						</xsl:attribute>
						<xsl:value-of select="@name" />
						<span class="badge"><xsl:value-of select="count(Etudiant)" /></span>
					</a>
				</div>
				<div class="accordion-body collapse">
					<xsl:attribute name="id">
						<xsl:value-of select="@name"/>
					</xsl:attribute>
					<div class="accordion-inner">
						<xsl:if test="count(Etudiant)!=0">
						<ul>
							<xsl:for-each select="Etudiant">
								<xsl:apply-templates select="." />
							</xsl:for-each>
						</ul>
						</xsl:if>
					</div>
				</div>
			</div>
		</xsl:for-each>
	</div>
</xsl:template>

<xsl:template match="Etudiant">
	<li><xsl:value-of select="Nom/text()" /><xsl:text> </xsl:text><xsl:value-of select="Prenom/text()" /></li>
</xsl:template>
</xsl:stylesheet>
