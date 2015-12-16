/**
 * Created by gautierenaud on 15/12/15.
 */

function LineChart(id, listMoyenne, listAnnee) {
    if (listMoyenne.length == listAnnee.length) {
        var x = document.getElementById(id);
        var data = new google.visualization.DataTable();

        data.addColumn ('number', 'Annee');
        data.addColumn ('number', 'Moyenne');

        for (var i = 0; i < listAnnee.length; i++) {
            var aLabel = listAnnee[i]; // mettre l'année ici
            var aValue = listMoyenne[i]; // mettre la valeur de la moyenne
            data.addRows([[aLabel, aValue]]);
        }
        var options = {legend: 'none', curveType: 'function', colors: ['red', '#004411']};
        var chart = new google.visualization.LineChart(x);
        chart.draw(data, options);
    }
}

function ColumnChart(id, listAnnee, listNumEtud){

    if (listAnnee.length == listNumEtud.length){
        var x = document.getElementById(id);
        var data = new google.visualization.DataTable();
        data.addColumn('number', 'Annee');
        data.addColumn('number', 'Nb Etudiants');
        for (var i = 0; i < listAnnee.length; i++){
            data.addRow([listAnnee[i], listNumEtud[i]]);
        }

        var chart = new google.visualization.ColumnChart(x);
        chart.draw(data);
    }
}