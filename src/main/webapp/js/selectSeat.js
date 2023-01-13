const seatnamelabel = document.querySelector('.seat-name');
const movieIDinput = document.querySelector('input[name="movieId"');
const pricelabel = document.querySelector('.price')
const seatnameinput = document.getElementById('seat-name')
const priceinput = document.getElementById('price')
const seatPrice = 200.00

const moviedate = document.querySelector('.moviedate');
const movietime = document.querySelector('.movietime');
moviedate.onchange = () => {
    if(moviedate.value == '')
        return
    initializeSeats(2)
}

const seats = document.querySelectorAll('.seat-wrapper .seat')
const types = [ 'booked', 'free', 'selected']
var seatNumbers = []
var price = 0.00.toFixed(2)
initializeSeats()
async function initializeSeats(){
    moviedate.setAttribute("disabled", '')
    document.body.style.cursor = 'progress'
    // clear values
    seatNumbers = []
    price = 0.00.toFixed(2)
    seatnamelabel.innerHTML = seatnameinput.value = seatNumbers
    pricelabel.innerHTML = priceinput.value = price
    // remove all the types from the seats
    seats.forEach((e) => {
        e.classList.remove('booked')
        e.classList.remove('free')
        e.classList.remove('selected')
        e.classList.add('booked')
    })
    gsap.from(".seat", {opacity: 0, scale:0, duration: 1.75, stagger: {
            amount: 0.5,
            grid: "auto",
            from: "center"
        }, ease: "elastic.out(0.8, 0.2)"})
    if(moviedate.value == ""){
        document.body.style.cursor = 'default'
        moviedate.removeAttribute("disabled")
        return
    }
    let bookedSeats = []
    // assign seat types usually gets from the database
    await $.post("./getBookedSeatsServlet", {movieId: movieIDinput.value, showDate: moviedate.value, showTime: movietime.value},
        function(data) {
            if(data == ""){
                alert("Server Error Try again");
                location.reload()
                return;
            }
            bookedSeats = JSON.parse(data);
        }
    )
    // assign types to the seats
    seats.forEach((e) => {
        if(!bookedSeats.includes(getSeatNumber(e))){
            e.classList.remove('booked')
            e.classList.add('free')
        }
    })
    // add event listner to free and selected seats
    seats.forEach((e) => {
        if(e.classList.contains('booked'))
            return
        e.removeEventListener('click', clickSeat);
        e.addEventListener('click', clickSeat)
    })
    document.body.style.cursor = 'default'
    moviedate.removeAttribute("disabled")
    gsap.from(".seat", {opacity: 0, scale:0, duration: 0.5, stagger: {
            amount: 0.5,
            grid: "auto",
            from: "center"
        }})
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
getDates(availableDates)
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
    if(movieIDinput.value == ''){
        alert('Internal Error')
        window.location.replace('./')
        return false
    }
    if(moviedate.value == ''){
        alert('Please Select a Date')
        return false
    }
    if(seatnameinput.value == '' || priceinput.value == ''){
        alert('Please Select a seat')
        return false
    }
}