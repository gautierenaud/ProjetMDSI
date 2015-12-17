<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />
<xsl:template match="/">
<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta name="author" content="Renaud" />
		<meta name="author" content="Thomas" />

		<title>Matieres enseignées</title>

		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
		<link href="bootstrap/css/starter-template.css" rel="stylesheet"/>
	</head>
	<body>
		<p>
			<xsl:for-each select="ans/Enseignant">
				<ul>
					<li>
						<xsl:value-of select="Personne/Nom"/><xsl:text> </xsl:text>
						<xsl:value-of select="Personne/Prenom"/>
					</li>
				</ul>
				<xsl:if test="count(Matiere)!=0">
				<xsl:for-each select="Matiere">
					<ul>
						<li>
							<xsl:value-of select="Nom"/>
						</li>
					</ul>
				</xsl:for-each>	
				</xsl:if>
			</xsl:for-each>
		</p>
	</body>
</html>
</xsl:template>
</xsl:stylesheet>
