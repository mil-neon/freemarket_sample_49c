$(function(){
  function buildHTML(){
    var html =
`<div class="l-main">
  <div class="content-user">
    <div class="content-user__tab">
      <input checked="<%= true %>" id="tab-info" name="tab_btn1" type="radio"></input>
      <label class="tab_btn1" for="tab-info">お知らせ</label>
      <input id="tab-todo" name="tab_btn1" type="radio"></input>
      <label class="tab_btn1" for="tab-todo">やることリスト</label>
      <div class="tab_pages" id="info-contents">
        <div class="none-content" style="background-image: url(<%= image_path 'mercari_icon.grly.png' %>)">
          <p>現在、お知らせはありません</p>
        </div>
      </div>
      <div class="tab_pages" id="todo-contents">
        <div class="none-content" style="background-image: url(<%= image_path 'mercari_icon.grly.png' %>)">
          <p>現在、やることはありません</p>
        </div>
      </div>
    </div>
  </div>
</div>`

    return html;
  }
  $('#mypage_notice').on("click", function(){
    var url = location.href;
    $.ajax({
      url: url,
      type: "GET"
    })
    .done(function(){
      $('.l-main, .l-chapter, .signup4-main, .logout-content').remove();
      var html = buildHTML();
      $('.l-container').append(html)
    })
  });
});

$(function(){
  function buildHTML(){
    var html =
`<div class="l-main">
  <div class="content-user">
    <div class="content-user__tab">
      <input checked="<%= true %>" id="tab-info" name="tab_btn1" type="radio"></input>
      <label class="tab_btn1" for="tab-info">お知らせ</label>
      <input id="tab-todo" name="tab_btn1" type="radio"></input>
      <label class="tab_btn1" for="tab-todo" id="js-button">やることリスト</label>
      <div class="tab_pages" id="info-contents">
        <div class="none-content" style="background-image: url(<%= image_path 'mercari_icon.grly.png' %>)">
          <p>現在、お知らせはありません</p>
        </div>
      </div>
      <div class="tab_pages" id="todo-contents">
        <div class="none-content" style="background-image: url(<%= image_path 'mercari_icon.grly.png' %>)">
          <p>現在、やることはありません</p>
        </div>
      </div>
    </div>
  </div>
</div>`

    return html;
  }
  $('#mypage_todo').on("click", function(){
    var url = location.href;
    $.ajax({
      url: url,
      type: "GET"
    })
    .done(function(){
      $('.l-main, .l-chapter, .signup4-main, .logout-content').remove();
      var html = buildHTML();
      $('.l-container').append(html)
      $('#js-button').click();
    })
  });
});
