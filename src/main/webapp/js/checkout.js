window.onload = () => {
    const date = document.getElementsByName("moviedate")[0].value + " " + document.getElementsByName("movietime")[0].value
    const time = document.querySelector('.time');
    const getdate = new Date(date)
    console.log(date)
    let datestring = getdate.toDateString().split(' ')
    time.innerHTML = datestring[0] + ', ' + datestring[1] + ' ' + datestring[2] + ', ' + datestring[3] + ", " + getdate.toLocaleTimeString()
}