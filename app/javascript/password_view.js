document.addEventListener('DOMContentLoaded', function(){
  
  //⓪現在のパスワード入力欄のプレビュー機能
  if ( document.getElementById('current_password') ){
    //パスワードオブジェクトの取得
    const pwd2 = document.getElementById('current_password');
    const pwdCheck2 = document.getElementById('current_password_checkbox');

    //パスワード（確認用）の表示
    pwdCheck2.addEventListener('change', function() {
      if(pwdCheck2.checked) {
        pwd2.setAttribute('type', 'text');
      } else {
        pwd2.setAttribute('type', 'password');
      }
    });
  }

  //①パスワード入力欄のプレビュー機能
  if ( document.getElementById('password') ) {
    //パスワードオブジェクトの取得
    const pwd1 = document.getElementById('password');
    const pwdCheck1 = document.getElementById('password_checkbox_1');

    //パスワードの表示
    pwdCheck1.addEventListener('change', function() {
      if(pwdCheck1.checked) {
        pwd1.setAttribute('type', 'text');
      } else {
        pwd1.setAttribute('type', 'password');
      }
    });
  }

  //②確認用パスワード入力欄のプレビュー機能
  if ( document.getElementById('password-confirmation') ){
    //パスワードオブジェクトの取得
    const pwd2 = document.getElementById('password-confirmation');
    const pwdCheck2 = document.getElementById('password_checkbox_2');

    //パスワード（確認用）の表示
    pwdCheck2.addEventListener('change', function() {
      if(pwdCheck2.checked) {
        pwd2.setAttribute('type', 'text');
      } else {
        pwd2.setAttribute('type', 'password');
      }
    });
  }

});
