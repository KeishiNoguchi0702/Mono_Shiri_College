function targetButtonHover() {

  const arr = ['article_user_edit_link',
               'article_user_delete_link',
               'article_user_top_link',
               'article_user_articles_link',
               'post_article_btn',
               'register-red-btn',
               'user_sign_in_btn',
               'user_viewer_signout_btn',
               'user_viewer_edit_btn',
               'user_viewer_retirement_btn',
               'user_viewer_top_btn'];

  for (const elem of arr) {
    if ( document.getElementById(elem) ) {

      const targetBottun = document.getElementById(elem);
      
      targetBottun.addEventListener('mouseover', function() {
        this.setAttribute("style", "background-color: orange;");
      });
  
      targetBottun.addEventListener('mouseout', function() {
      this.setAttribute("style", "background-color: lightskyblue;");
      });
  
    };
  };

};

window.addEventListener('load', targetButtonHover);