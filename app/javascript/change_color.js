document.addEventListener('DOMContentLoaded', function() {

  if ( document.getElementById('retirement_done') ) {
    setTimeout(function() {
      window.location.href = 'http://localhost:3000/';
    }, 6 * 1000);
  }

});