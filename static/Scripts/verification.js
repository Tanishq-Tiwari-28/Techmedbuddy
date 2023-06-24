type="text/javascript">
    (function () {
        emailjs.init('28QrozmlnzXT9wsiF');
    })();

alert("Please Pay for the Course first and then Click on Check Verification, we will soon notify you with furthur details")

    // we need all three varible
const fun = (amount, CourseName, EmailId) => {
    const service_ID = "service_qu3z1fb"
    const template_ID = "template_y60ig0j"

    var params = {
        Course_Name: "Bioinformatics",
        from_email: "omgarg8700@gmail.com",
        amount: "5000"
    }

    emailjs
        .send(service_ID, template_ID, params)
        .then(() => {
            console.log("Message Sent Succesfully");
            document.getElementById("notification").style.display = "block"
            setTimeout(() => { window.location.href = "http://127.0.0.1:5500" }, 5000);
        })
        .catch((err) => { document.getElementById("notification").style.display = "block" })
}
