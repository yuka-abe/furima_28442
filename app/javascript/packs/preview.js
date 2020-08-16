if (window.location.pathname === '/items/new'){
  document.addEventListener('DOMContentLoaded', function(){
   const ImageList = document.getElementById('purchase-btn')
   
   document.getElementById('purchase-btn').addEventListener('change',function(e){
    console.log(e);
   });
  });
}