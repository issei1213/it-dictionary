$(function(){
  function buildHTML(content){
    var html = `<div class="content-box">
                  <a href="/contents/${content.id}">
                    <ul class="line">
                      <li class="content-box__tag">
                        ${build_tag(content.tag)}
                      </li>
                      <li class="content-box__title">
                      ${content.title}
                      </li>
                      <li class="content-box__content">
                        ${content.content}
                      </li>
                      <li class="content-box__name">
                        ${content.name}
                      </li>
                    </ul>
                  </a>
                </div>`;
    $(".content-buttom").append(html);
  }


  function build_tag(tag){
    var insertTAG = '';
    $.each(tag,function(index,val){
        if (tag.length !== index+1){
          var tags = `${val}, `;
          insertTAG += tags;
        }
        else{
          var tags = ` ${val}`;
          insertTAG += tags;
        }
    });
    return insertTAG;
  }

  $(".search-content__form-with__input").on("keyup",function(){
    let input = $(".search-content__form-with__input").val();
    $.ajax({
      type: "GET",
      url: "/contents/search_content",
      data: { keyword: input},
      dataType: "json"
    })
    // 成功時
    .done(function(contents){
      $(".search-title__form-with")[0].reset();
      $(".content-box").remove();
      if(contents.length !== 0) {
        contents.forEach(function(content){
          buildHTML(content);
        });
      }
      $(document).ready(function(){
        $(".content-box").fadeIn(1000);
        $(".line").hover(function() {
          $(this).stop().css({backgroundColor: "#ffcd00"});
        },
        function() {
          $(this).stop().css({backgroundColor: "#f8f6ef" });
        });
      });
    })
    // 失敗時
    .fail(function(){
      console.log("NG");
    })
  });

});


