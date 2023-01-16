async function cancelBook(e) {
    const parentform = e.parentElement
    const childrens = parentform.children
    var params = {
        //add params here
        ticketid  : childrens[1].value,
        transactionid : childrens[2].value,
        title : childrens[3].value,
        email: childrens[4].value,
    };
    const serviceID = "service_xurl44v";
    const templateID = "template_9tpw9g4";
    console.log("asd")
    await emailjs.send(serviceID, templateID, params)  //uncomment this line to send email
    sessionStorage.setItem("CancelMsg", "Your ticket was cancelled and the refund request was sent successfully, refund will be sent to your account within 3-5 working days.")
    window.alert("Your ticket was cancelled and the refund request was sent successfully, refund will be sent to your account within 3-5 working days.")
    parentform.submit()
}