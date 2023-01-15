function cancelBook() {
    var params = {
        ticketid  : "123",
        transactionid : "nhsjdsj123",
        title : "test title",
        email: "test@gmail.com",
    };

    const serviceID = "service_xurl44v";
    const templateID = "template_9tpw9g4";

    emailjs
        .send(serviceID, templateID, params)
         sessionStorage.setItem("CancelMsg", "Your Ticket canceled successfully!, please check your email!, Refund will be sent to your account within 3-5 working days")
        .then(res=>{
            console.log(res);
        })

        .catch(err=>console.log(err));

}