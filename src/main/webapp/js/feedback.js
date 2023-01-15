function sendMail() {
    var params = {
        email: document.getElementById("email").value,
        feedback: document.getElementById("feedback").value,
    };

    const serviceID = "service_xurl44v";
    const templateID = "template_oeekyvh";

    emailjs
        .send(serviceID, templateID, params)
         sessionStorage.setItem("feedbackMsg", "Feedback sent successfully!")
        .then(res=>{
            document.getElementById("email").value = "";
            document.getElementById("feedback").value = "";
            console.log(res);
            alert("Your message sent successfully!!");

        })

        .catch(err=>console.log(err));

}
