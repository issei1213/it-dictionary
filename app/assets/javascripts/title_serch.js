$(function(){
  $(".search-form__form-with__input").on("keyup",function(){
    let input = $(".search-form__form-with__input").val();
    console.log(input);
  });
});