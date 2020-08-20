if (window.location.pathname === '/items/new'){
  document.addEventListener('DOMContentLoaded', function(){
   const ImageList = document.getElementById('item-image')
   
   document.getElementById('item-image').addEventListener('change',function(e){
    const file = e.target.files[0];
   });
  });
}

