
window.onload = function(){
document.getElementById("email").onchange = function (){
    validateMail(document.getElementById("email").value);
};

document.getElementById("password").onchange = function (){
    validatePass(document.getElementById("password").value);
};
  
function validateMail(email){
    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if(!email.match(mailformat)){
        document.getElementById("email_check_msg").style.display = "block";
    }
    else{
        document.getElementById("email_check_msg").style.display = "none";
    }
}

function validatePass(pass){
    var passw = /^[A-Za-z]\w{7,14}$/;
    if(!pass.match(passw)){
        alert("PASSWORD IS NOT CORRECT");
    }
}

};


