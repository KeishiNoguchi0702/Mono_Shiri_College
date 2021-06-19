function newArticlesHover() {
  
  if ( document.getElementById('new_article_title_str') ) {

    const newArticleTitle = document.getElementById('new_article_title_str');
    newArticleTitle.addEventListener('mouseover', function() {
      this.setAttribute("style", "color: magenta;");
    });

    newArticleTitle.addEventListener('mouseout', function() {
      this.setAttribute("style", "color: #FFF;");
    });

  };
};

window.addEventListener('load', newArticlesHover);