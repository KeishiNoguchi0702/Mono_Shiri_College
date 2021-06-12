document.addEventListener('DOMContentLoaded', function(){
  const pwd = document.getElementById('password');
  const pwdCheck = document.getElementById('password_checkbox_1');
  
  pwdCheck.addEventListener('change', function() {
    if(pwdCheck.checked) {
      pwd.setAttribute('type', 'text');
    } else {
      pwd.setAttribute('type', 'password');
    }
  });
});