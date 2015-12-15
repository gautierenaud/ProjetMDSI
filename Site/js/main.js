var actualActiveNavbar = "Enseignants";
function changeActiveNavbar(id){
    if (id != actualActiveNavbar){
        $("#"+actualActiveNavbar).removeClass("active");
        $("#"+id).addClass("active");
        actualActiveNavbar = id;
        loadSideBar(actualActiveNavbar);
    }
}

// function to toggle the menu when "Universite" is clicked
function toggleMenu(){
    $("#wrapper").toggleClass("toggled");
    $("#navIcon").toggleClass("glyphicon-menu-left").toggleClass("glyphicon-menu-hamburger");
}

// close the side bar if opened
function closeSideMenu(){
    if ($("#wrapper").attr("class") != "toggled")
        toggleMenu();
}

var sideBar = $(".sidebar-nav");
function loadSideBar(id){
    sideBar.empty();
    var tmpList;
    switch (id){
        case "Enseignants":
            tmpList = enseignantSideOptions;
            break;
        case "Etudiants":
            tmpList = etudiantSideOptions;
            break;
        case "Matieres":
            tmpList = matiereSideOptions;
            break;
        default:
            alert("Wrong ID: " + id);
            break;
    }

    // title of the Side Bar
    sideBar.append("<li class='sidebar-brand'><a>" + id + "</a></li>");
    // load the content of the list
    for (var i in tmpList){
        sideBar.append("<li><a href='#'>" + tmpList[i] + "</a></li>");
    }
}

function initContent(){
    loadSideBar(actualActiveNavbar);
}

function LineChart(id, listMoyenne, listAnnee) {
    if (listMoyenne.length == listAnnee.length) {
        var x = document.getElementById(id);
        var data = new google.visualization.DataTable();

        data.addColumn ('number', 'Annee');
        data.addColumn ('number', 'Moyenne');

        for (i = 0; i < listAnnee.length; i++) {
            var aLabel = listAnnee[i]; // mettre l'année ici
            var aValue = listMoyenne[i]; // mettre la valeur de la moyenne
            data.addRows([[aLabel, aValue]]);
        }
        var options = {legend: 'none', curveType: 'function', colors: ['red', '#004411']};
        var chart = new google.visualization.LineChart(x);
        chart.draw(data, options);
    }
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
        for (i = 0; i<50; i++) {
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