function cancelBook() {
    var params = {
        //add params here
        ticketid  : "123",
        transactionid : "nhsjdsj123",
        title : "test title",
        email: "test@gmail.com",
    };

    const serviceID = "service_xurl44v";
    const templateID = "template_9tpw9g4";

    emailjs
        // .send(serviceID, templateID, params)  //uncomment this line to send email

        //  sessionStorage.setItem("CancelMsg", "Your Ticket canceled successfully!, please check your email!, Refund will be sent to your account within 3-5 working days")
         window.alert("Your Ticket canceled successfully!, please check your email!, Refund will be sent to your account within 3-5 working days")
        .then(res=>{
            console.log(res);
        })

        .catch(err=>console.log(err));

}