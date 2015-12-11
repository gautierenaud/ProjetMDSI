<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />
<xsl:template match="/">
	<html>
	<head>
		<title>Etudiant par Cursus</title>
		
		<script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script type="text/javascript">
            google.load('visualization', '1', {packages: ['corechart']});
        </script>
        <script type="text/javascript">
            function LineChart(flag) {
                var x = document.getElementById("line_chart_div");
                if (flag) {
                    var data = new google.visualization.DataTable();
                    data.addColumn ('string', 'Day');
                    data.addColumn ('number', 'Value');
                    for (i = 0; i&lt;<xsl:value-of select="count(//cursus)" />; i++) {
                        var aLabel = "D" + i; 
                        var aValue = Math.floor(Math.random() * 50);
                        data.addRows([[aLabel, aValue]]);
                    }
                    var options =   {legend:'none', curveType:'funcrtion', colors:['red','#004411']};
                    var chart = new google.visualization.LineChart(x);
                    chart.draw(data, options);
                }
                else
                    x.innerHTML = "";
            }
            
            function CandlestickChart(flag) {
                var x = document.getElementById("candlestick_chart_div");
                if (flag) {
                    var data = new google.visualization.DataTable();
                    data.addColumn ('string', 'Label');
                    data.addColumn ('number', 'Min');
                    data.addColumn ('number', 'Open');
                    data.addColumn ('number', 'Close');
                    data.addColumn ('number', 'Max');
                    for (i = 0; i&lt;50; i++) {
                        var aLabel = "D" + i; 
                        var aMin = Math.floor(Math.random() * 10);
                        var aMax = Math.floor(Math.random() * 20);
                        data.addRows([[aLabel, aMin, aMin, aMax, aMax]]);
                    }
                    var options =   {legend:'none'};
                    var chart = new google.visualization.CandlestickChart(x);
                    chart.draw(data, options);
                }
                else
                    x.innerHTML = "";
            }
        </script>
        
    </head>
		<body>
			<xsl:for-each select="ans/cursus">
				<p>Cursus: <xsl:value-of select="@name" /></p>
				<ul>
					<xsl:for-each select="Etudiant">
						<li><xsl:apply-templates select="." /></li>
					</xsl:for-each>
				</ul>
			</xsl:for-each>
		<p>
            Exemple "Line Chart":
            <input type="button" value="Load Chart" onclick="javascript:LineChart(true)" />
            <input type="button" value="Hide Chart" onclick="javascript:LineChart(false)" />
        </p>
        <div id="line_chart_div"></div>
		</body>
	</html>
</xsl:template>
<xsl:template match="Etudiant">
	<xsl:value-of select="Personne/Nom" /><xsl:text> </xsl:text><xsl:value-of select="Personne/Prenom" />
</xsl:template>
</xsl:stylesheet>
