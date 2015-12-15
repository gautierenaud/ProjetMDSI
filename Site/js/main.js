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

