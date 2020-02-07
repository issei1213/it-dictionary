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
      console.log(insertTAG)
    });
    return insertTAG;
  }

  $(".search-title__form-with__input").on("keyup",function(){
    let input = $(".search-title__form-with__input").val();
    $.ajax({
      type: "GET",
      url: "/contents/search_title",
      data: { keyword: input},
      dataType: "json"
    })
    // 成功時
    .done(function(contents){
      $(".search-content__form-with")[0].reset();
      $(".content-box").remove();
      if(contents.length !== 0) {
        contents.forEach(function(content){
          buildHTML(content);
        });
      }
    // 失敗時
      else{
        contents.forEach(function(content){
          buildHTML_notag_content(content);
        });
      }
    })
    .fail(function(){
      console.log("NG");
    })

  });
});
