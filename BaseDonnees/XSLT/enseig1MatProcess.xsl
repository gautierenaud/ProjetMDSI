<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8" indent="yes" />
		<xsl:template match="/" name="main">
		<xsl:variable name="pred" select=""/>
			<html>
			<head>
				<title>Enseignants par matiere</title>
			</head>
			<body>
				<div> 	
					<xsl:for-each select="ans/matiere">
						<xsl:sort select="@name"/>
						<p>Matiere:<xsl:if test=" not(@name = $pred)">
								<xsl:value-of select="@name"/>
									<ul>
										<xsl:for-each select="Personne">
											<li>
												<xsl:value-of select="Nom" />
												<xsl:text> </xsl:text> 
												<xsl:value-of select="Prenom"/>
											</li>
										</xsl:for-each>
									</ul>
								</xsl:if>
							<ul>
								<xsl:for-each select="Personne">
									<li>
										<xsl:value-of select="Nom" />
										<xsl:text> </xsl:text> 
										<xsl:value-of select="Prenom"/>
									</li>
								</xsl:for-each>
							</ul>
						</p>
					<xsl:variable name="pred" select="@name"/>
					</xsl:for-each>
				</div>
			</body>
			</html>
		</xsl:template>
	<xsl:template match="Etudiant">
		<xsl:value-of select="Personne/Nom" /><xsl:text> </xsl:text><xsl:value-of select="Personne/Prenom" />
	</xsl:template>
</xsl:stylesheet>