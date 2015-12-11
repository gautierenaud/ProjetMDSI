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
			<div class="container">
				<xsl:for-each select="ans/Enseignant">
					<div class="dropdown col-lg-2" id="open">
		                <!-- Dropdown Button -->
		                <button id="dLabel" role="button" href="#" data-toggle="dropdown" data-target="#" class="btn btn-primary">
		                    <xsl:value-of select="Personne/Nom/text()"/><xsl:text> </xsl:text>
		                    <span class="badge"><xsl:value-of select="count(Matiere)" /></span>
		                </button>
		                
		                <xsl:if test="count(Matiere) > 0">
				            <!-- Dropdown Menu -->
				            <ul class="dropdown-menu" role="menu"
				                aria-labelledby="dLabel">
				                <xsl:for-each select="Matiere">
				                	<li><a href="#"><xsl:value-of select="Nom/text()" /></a></li>
				                </xsl:for-each>
				            </ul>
		                </xsl:if>
		            </div>
				</xsl:for-each>
			</div><!-- container -->

		    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		    <script src="bootstrap/js/bootstrap.min.js"></script>
		</body>
	</html>
</xsl:template>
</xsl:stylesheet>
