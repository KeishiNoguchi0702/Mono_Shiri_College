function postArticleHover() {

  if ( document.getElementById('post_article_btn') ) {

    const postArticleBottun = document.getElementById('post_article_btn');
    
    postArticleBottun.addEventListener('mouseover', function() {
      this.setAttribute("style", "background-color: orange;");
    });

    postArticleBottun.addEventListener('mouseout', function() {
    this.setAttribute("style", "background-color: lightskyblue;");
    });

  };

};

window.addEventListener('load', postArticleHover);