
function getSelectState(selectId, optionValue){
    var sel = document.getElementById(selectId);
    for (var i = 0; i <sel.length ; i++) {
        if (sel.options[i].value==optionValue) {
            sel.selectedIndex = i;
            break;
        }
    }
}