function hideSideMenu(controlname) {
    var sidemenu = document.getElementsByClassName(controlname);
    var sidemenu2 = document.getElementsByClassName(controlname + '2');
    for (var i = 0; i < sidemenu.length; i++) {
        sidemenu[i].style.width = "0px";
    }
    for (var i = 0; i < sidemenu2.length; i++) {
        sidemenu2[i].style.width = "0px";
    }
}

function showSideMenu(controlname) {
    var sidemenu = document.getElementById(controlname);
    var sidemenu2 = document.getElementById(controlname + '2');
    sidemenu.style.width = "290px";
    sidemenu.style.backgroundColor = "#191918";
    //sidemenu.style.paddingLeft = "25px";
    sidemenu2.style.width = "100%"; 
}