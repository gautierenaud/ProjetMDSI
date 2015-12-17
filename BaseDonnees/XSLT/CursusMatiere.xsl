<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />
<xsl:template match="/">
	<div>
		<xsl:for-each select="ans/Cursus">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2">
						<xsl:attribute name="href">
							<xsl:text>#</xsl:text><xsl:value-of select="Nom/@CursusName"/>
						</xsl:attribute>
						<xsl:value-of select="Nom/@CursusName" />
						<span class="badge"><xsl:value-of select="count(UF)" /></span>
					</a>
				</div>
				<div class="accordion-body collapse">
					<xsl:attribute name="id">
						<xsl:value-of select="Nom/@CursusName"/>
					</xsl:attribute>
					<div class="accordion-inner">
						<ul>
							<xsl:for-each select="UF">
								<li>
	<div class="accordion-group">
		<div class="accordion-heading">
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2">
				<xsl:attribute name="href">
					<xsl:text>#</xsl:text><xsl:value-of select="Code/@ID"/>
				</xsl:attribute>
				UF code :<xsl:value-of select="Code/@ID" />
				<span class="badge"><xsl:value-of select="count(Matiere)" /></span>
			</a>
		</div>
		<div class="accordion-body collapse">
			<xsl:attribute name="id">
				<xsl:value-of select="Code/@ID"/>
			</xsl:attribute>
			<div class="accordion-inner">
				<ul>
					<xsl:for-each select="Matiere">
						<li><xsl:value-of select="Nom/text()" />, Crédits: <xsl:value-of select="Credit/text()" /></li>
					</xsl:for-each>
				</ul>
			</div>
		</div>
	</div>
</li>
							</xsl:for-each>
						</ul>
					</div>
				</div>
			</div>
		</xsl:for-each>
	</div>
</xsl:template>

<xsl:template match="UF">

</xsl:template>
</xsl:stylesheet>
