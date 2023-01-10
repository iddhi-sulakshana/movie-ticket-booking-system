const seatnamelabel = document.querySelector('.seat-name');
const pricelabel = document.querySelector('.price')
const seatnameinput = document.getElementById('seat-name')
const priceinput = document.getElementById('price')
const seatPrice = 200.00
// get available dates from the server and put it on the
// dates variable it feeds to get dates and only enable
// available dates in the datepicker
const availableDates = ["2023-01-20","2023-01-21","2023-01-22"]
getDates(availableDates)

const moviedate = document.querySelector('.moviedate');
const movietime = document.querySelector('.movietime');

moviedate.onchange = movietime.onchange = () => {
    if(moviedate.value == '' || movietime.value == '')
        return
    initializeSeats(2)
}

const seats = document.querySelectorAll('.seat')
const types = [ 'booked', 'free', 'selected']
var seatNumbers = []
var price = 0.00.toFixed(2)

initializeSeats(1)
function initializeSeats(num){
    seatNumbers = []
    price = 0.00.toFixed(2)
    seatnamelabel.innerHTML = seatnameinput.value = seatNumbers
    pricelabel.innerHTML = priceinput.value = price
    for(let i = 0; i < seats.length; i++) {
        seats[i].classList.remove(types[0])
        seats[i].classList.remove(types[1])
        seats[i].classList.remove(types[2])
    }
    // assign seat types usually gets from the database
    var seatTypes = []
    for(let i = 0; i < seats.length; i++) {
        seatTypes.push(Math.floor(Math.random() * num))
    }
    // assign types to the seats
    for(let i = 0; i < seats.length; i++) {
        seats[i].classList.add(types[seatTypes[i]])
    }
    // add event listner to free and selected seats
    seats.forEach((e) => {
        if(e.classList.contains('booked'))
            return
        e.removeEventListener('click', clickSeat);
        e.addEventListener('click', clickSeat)
    })
}

function clickSeat(e){
    if(e.currentTarget.classList.contains('free')){
        // select free seat and add it to the checkout
        e.currentTarget.classList.remove('free')
        e.currentTarget.classList.add('selected')
        seatNumbers.push(getSeatNumber(e.currentTarget))
    }
    else if(e.currentTarget.classList.contains('selected')){
        // remove selected seat from the checkout
        e.currentTarget.classList.remove('selected')
        e.currentTarget.classList.add('free')
        seatNumbers.splice(seatNumbers.indexOf(getSeatNumber(e.currentTarget)), 1)
    }
    seatNumbers.sort()
    price = (seatNumbers.length * seatPrice).toFixed(2)
    seatnamelabel.innerHTML = seatNumbers.join(', ') 
    seatnameinput.value = seatNumbers
    pricelabel.innerHTML = priceinput.value = price    
}
function getSeatNumber(seat){
    return seat.closest('.seat-line').children[0].innerHTML + seat.querySelector('span').innerHTML
}
function getDates(dates){
    $(document).ready( function () {
        $('.moviedate').datepicker({
            minDate: 1,
            beforeShowDay: function(date){
                var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
                return [ dates.indexOf(string) != -1 ]
            }
        })
    })
}

// validate form
document.getElementById('checkout-form').onsubmit = () => {
    if(document.querySelector('input[name="moviename"').value == ''){
        alert('Internal Error')
        window.location.replace('./')
        return false
    }
    if(moviedate.value == '' || movietime.value == ''){
        alert('Please select movie time')
        return false
    }
    if(seatnameinput.value == '' || priceinput.value == ''){
        alert('Please Select a seat')
        return false
    }
}