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

var time1array = ["2023-01-14","2023-01-15","2023-01-16"]
var time2array = ["2023-01-17","2023-01-18","2023-01-19"]
var time3array = ["2023-01-20","2023-01-21","2023-02-22"]
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
    $('.showdates').multiDatesPicker({
        minDate: 1,
        beforeShowDay: function(date){
            var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
            return [ arrayofdates.indexOf(string) == -1 ]
        }
    })
})

const inputs = document.querySelectorAll('.form-outline input')
const edit = document.getElementById('editAcc')
const save = document.getElementById('saveAcc')
edit.addEventListener('click', () => {
    inputs.forEach(removeDisable)
    removeDisable(save)
    addDisable(edit)
})
save.addEventListener('click', () => {
    inputs.forEach(addDisable)
    addDisable(save)
    removeDisable(edit)
})
function removeDisable(input){
    input.removeAttribute('disabled')
}
function addDisable(input){
    input.setAttribute('disabled', '');
}