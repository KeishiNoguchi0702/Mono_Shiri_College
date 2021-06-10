document.addEventListener('DOMContentLoaded', function() {
  const ImageList = document.getElementById('image_list');
  document.getElementById('user-image').addEventListener('change', function(e){
    const file = e.target.files[0];
  });
});