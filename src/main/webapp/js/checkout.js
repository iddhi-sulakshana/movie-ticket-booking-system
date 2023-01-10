const date = "2023/10/01 06:00"
const time = document.querySelector('.time');
const getdate = new Date(date)
let datestring = getdate.toDateString().split(' ')
time.innerHTML = datestring[0] + ', ' + datestring[1] + ' ' + datestring[2] + ', ' + datestring[3] + ", " + getdate.toLocaleTimeString()