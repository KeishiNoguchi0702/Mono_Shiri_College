function navHover() {
  
  if ( document.getElementById('site_gnav_list') ) {

    //TOPページボタン
    const navTopBtn = document.getElementById('top_btn');
    navTopBtn.addEventListener('mouseover', function() {
      this.setAttribute("style", "text-decoration: underline;");
    });

    navTopBtn.addEventListener('mouseout', function() {
      this.setAttribute("style", "text-decoration: none;");
    });

    //NEWSボタン
    const navNewsBtn = document.getElementById('news_btn');
    navNewsBtn.addEventListener('mouseover', function() {
      this.setAttribute("style", "text-decoration: underline;");
    });

    navNewsBtn.addEventListener('mouseout', function() {
      this.setAttribute("style", "text-decoration: none;");
    });

    //ARTICLESボタン
    const navArtclesBtn = document.getElementById('articles_btn');
    navArtclesBtn.addEventListener('mouseover', function() {
      this.setAttribute("style", "text-decoration: underline;");
    });

    navArtclesBtn.addEventListener('mouseout', function() {
      this.setAttribute("style", "text-decoration: none;");
    });

    //USERSボタン
    const navUsersBtn = document.getElementById('users_btn');
    navUsersBtn.addEventListener('mouseover', function() {
      this.setAttribute("style", "text-decoration: underline;");
    });

    navUsersBtn.addEventListener('mouseout', function() {
      this.setAttribute("style", "text-decoration: none;");
    });
  };
};

window.addEventListener('load', navHover);