function validation() {
                var c = document.forms ["f1"]["cap1"];
                var captcha = c.value;
                var user = document.forms["f1"]["userid"];
                var pass = document.forms["f1"]["password"];
                var d = document.forms ["f1"]["cap2"].value;
                if (captcha === null || captcha === "")
                {
                    alert("Please Enter Captcha");
                    user.value = "";
                    pass.value = "";
                    return false;
                }
                if (d !== captcha)
                {
                    alert("Incorrect Captcha");
                    user.value = "";
                    pass.value = "";
                    c.value = "";
                    return false;
                }
            }