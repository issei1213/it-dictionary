$(function(){
  $(".line").hover(function() {
    $(this).stop().animate({'backgroundColor' : "#ffcd00"}, 500);
  },
  function() {
    $(this).stop().animate({'backgroundColor' : "#f8f6ef"}, 1000);
  });
})


// $(".line").hover(function() {
//   $(this).stop().css({backgroundColor: "#ffcd00"});
// },
// function() {
//   $(this).stop().css({backgroundColor: "#f8f6ef" });
// });