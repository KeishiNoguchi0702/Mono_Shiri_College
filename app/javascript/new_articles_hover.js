function newArticlesHover() {
  
  for (let num = 0; num <= 20; num++) {
    if ( document.getElementById(`new_article_title_str${num}`) ) {

      const newArticleTitle = document.getElementById(`new_article_title_str${num}`);
      
      newArticleTitle.addEventListener('mouseover', function() {
        this.setAttribute("style", "color: rgba(255, 0, 255, 0.9);");
      });
  
      newArticleTitle.addEventListener('mouseout', function() {
      this.setAttribute("style", "color:lightskyblue;");
      });

    };
  };

};

window.addEventListener('load', newArticlesHover);