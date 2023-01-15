const menu = document.getElementById('menu');
const displaywrapper = document.querySelector('.display-wrapper')
const display = document.querySelector('.display')
const menuitems = document.querySelectorAll('.menu-item');
const displays = document.querySelectorAll('.display>div');
window.onresize = window.onload = () => {
    if(window.innerWidth >= 992)
        addLeftMenu();
    else
        addBottomMenu()
}


function addLeftMenu(){
    display.style.width = window.innerWidth - menu.clientWidth + 'px'
    if(menu.classList.contains('menu-left'))
        return
    menu.classList.remove('menu-bottom')
    menu.classList.add('menu-left')
    menu.children[0].classList.remove('container-fluid')
    menu.style.height = window.innerHeight - nav.clientHeight + 'px';
    displaywrapper.style.height = menu.clientHeight + 'px'
}
function addBottomMenu(){
    if(menu.classList.contains('menu-bottom'))
        return
    menu.classList.remove('menu-left')
    menu.classList.add('menu-bottom')
    menu.children[0].classList.add('container-fluid')
    menu.style.height = '10vh'
    displaywrapper.style.height = window.innerHeight - nav.clientHeight - menu.clientHeight + 'px'
    display.style.width = '100%'
}

function removeActive(item){
    item.classList.remove('active')
}
function hideItem(item){
    item.classList.add('d-none')
}
for(let i = 0; i < menuitems.length; i++){
    menuitems[i].onclick = () => {
        if(menuitems[i].classList.contains('active'))
            return
        menuitems.forEach(removeActive)
        displays.forEach(hideItem)
        menuitems[i].classList.add('active')
        displays[i].classList.remove('d-none')
    }
}

var arrayofdates = []
document.getElementById('time1').onclick = (e) => {
    arrayofdates = time1array
}
document.getElementById('time2').onclick = (e) => {
    arrayofdates = time2array
}
document.getElementById('time3').onclick = (e) => {
    arrayofdates = time3array
}
$(document).ready( function () {
    $('#showdates').multiDatesPicker({
        minDate: 1,
        beforeShowDay: function(date){
            var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
            return [ arrayofdates.indexOf(string) == -1 ]
        }
    })
})
document.getElementsByName("timeslot").forEach((e) => {
    e.addEventListener('click', clickTime);
})
function clickTime(e){
    document.getElementById("showdates").removeAttribute("hidden");
    document.getElementsByName("timeslot").forEach((e) => {
        e.removeEventListener('click', clickTime)
    })
}
const inputs = document.querySelectorAll('.form-outline input')
const edit = document.getElementById('editAcc')
const save = document.getElementById('saveAcc')
edit.addEventListener('click', () => {
    inputs.forEach(removeDisable)
    removeDisable(save)
    addDisable(edit)
})
function removeDisable(input){
    input.removeAttribute('disabled')
}
function addDisable(input){
    input.setAttribute('disabled', '');
}
const searchbtn = document.getElementById('searchmovie');
const searchname = document.getElementById('searchname');
const searchgenres = document.getElementById('searchgenres');
const searchoverview = document.getElementById('searchoverview');
const posterlink = document.getElementById('poster');
const bannerlink = document.getElementById('banner');
const searchsection = document.getElementById('searchsection');
const moviename = document.getElementById('moviename');
function clearvalues() {
    searchsection.style.display = "none";
    searchname.value = searchgenres.value = searchoverview.value = "N/A"
    posterlink.removeAttribute('href');
    bannerlink.removeAttribute('href');
}
searchbtn.onclick = () => {
    if(searchbtn.classList.contains('loading')){
        return false;
    }
    if(moviename.value.trim() == '') {
        return false;
    }
    searchbtn.classList.add('loading');
    document.body.style.cursor = "progress";
    clearvalues()
    $.post("./getMovieDetailsServlet", {moviename: moviename.value}, function(data) {
        if(data == '-1') {
            alert("No matching movie found");
            searchbtn.classList.remove('loading')
            return;
        }
        const obj = JSON.parse(data);
        searchname.value = obj.title;
        searchgenres.value = obj.genres.join(", ");
        searchoverview.value = obj.description;
        posterlink.setAttribute('href', "https://image.tmdb.org/t/p/original" + obj.poster);
        bannerlink.setAttribute('href', "https://image.tmdb.org/t/p/original" + obj.banner);
        searchbtn.classList.remove('loading')
        searchsection.style.display = "block";
        document.body.style.cursor = "default";
    });
}
clearvalues()