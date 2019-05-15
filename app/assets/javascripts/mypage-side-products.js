$(function(){
  function buildHTML(){
    var html =
`<div class="l-main">
  <div class="content-buy-items">
    <div class="content-buy-items__tab">
      <input checked="<%= true %>" id="tab-transaction" name="tab_btn2" type="radio"></input>
      <label class="tab_btn2" for="tab-transaction">取引中</label>
      <input id="tab-past-transaction" name="tab_btn2" type="radio"></input>
      <label class="tab_btn2" for="tab-past-transaction" id="past-tab">過去の取引</label>
      <div class="tab_pages" id="transaction-contents">
        <ul class="mypage-item-list" id="item-now">
        </ul>
      </div>
      <div class="tab_pages" id="past-transaction-contents">
        <ul class="mypage-item-list" id="item-close">
        </ul>
      </div>
    </div>
  </div>
</div>`

    return html;
  }
  function buildHTML2(product){
    insertimage = `<img src="${product.image}">`;
    inserturl = '/products/' + String(product.id)
    var html2 =
`<li>
  <a href=${inserturl}, class="mypage-item-link">
    <figure>
      ${insertimage}
    </figure>
    <div class="mypage-item-body">
      <div class="mypage-item-text">
        ${product.name}
      </div>
    <i class="fa fa-angle-right icon"></i>
    </div>`
    return html2;
  }
  $('#mypage_buy_now').on("click", function(){
    var url = location.href;
    $.ajax({
      url: url,
      type: "GET",
      dataType: "json"
    })
    .done(function(data){
      $('.l-main, .l-chapter, .signup4-main, .logout-content').remove();
      var html = buildHTML();
      $('.l-container').append(html);
      var none_content_now = `<div class= "none-content"><p>取引中の商品がありません</p></div>`
      var none_content_close = `<div class= "none-content"><p>過去に取引した商品がありません</p></div>`
      if (data.buy_now.length !== 0 && data.buy_close.length !== 0){
        data.buy_now.forEach(function(product_buy_now){
          var html2 = buildHTML2(product_buy_now);
          $('#item-now').append(html2);
        })
        data.buy_close.forEach(function(product_buy_close){
          var html2 = buildHTML2(product_buy_close);
          $('#item-close').append(html2);
        })}
      else if (data.buy_now.length == 0 && data.buy_close.length !== 0){
        $('#item-now').remove();
        $('#transaction-contents').append(none_content_now);
        data.buy_close.forEach(function(product_buy_close){
          var html2 = buildHTML2(product_buy_close);
          $('#item-close').append(html2);
        })}
      else if (data.buy_now.length !== 0 && data.buy_close.length == 0){
        data.buy_now.forEach(function(product_buy_now){
          var html2 = buildHTML2(product_buy_now);
          $('#item-now').append(html2);
          })
        $('#item-close').remove();
        $('#past-transaction-contents').append(none_content_close);
        }
      else {
        $('#item-now').remove();
        $('#transaction-contents').append(none_content_now);
        $('#item-close').remove();
        $('#past-transaction-contents').append(none_content_close);
      }
    })
  });
  $('#mypage_buy_close').on("click", function(){
    var url = location.href;
    $.ajax({
      url: url,
      type: "GET",
      dataType: "json"
    })
    .done(function(data){
      $('.l-main, .l-chapter, .signup4-main, .logout-content').remove();
      var html = buildHTML();
      $('.l-container').append(html);
      $('#past-tab').click();
      var none_content_now = `<div class= "none-content"><p>取引中の商品がありません</p></div>`
      var none_content_close = `<div class= "none-content"><p>過去に取引した商品がありません</p></div>`
      if (data.buy_now.length !== 0 && data.buy_close.length !== 0){
        data.buy_now.forEach(function(product_buy_now){
          var html2 = buildHTML2(product_buy_now);
          $('#item-now').append(html2);
        })
        data.buy_close.forEach(function(product_buy_close){
          var html2 = buildHTML2(product_buy_close);
          $('#item-close').append(html2);
        })}
      else if (data.buy_now.length == 0 && data.buy_close.length !== 0){
        $('#item-now').remove();
        $('#transaction-contents').append(none_content_now);
        data.buy_close.forEach(function(product_buy_close){
          var html2 = buildHTML2(product_buy_close);
          $('#item-close').append(html2);
        })}
      else if (data.buy_now.length !== 0 && data.buy_close.length == 0){
        data.buy_now.forEach(function(product_buy_now){
          var html2 = buildHTML2(product_buy_now);
          $('#item-now').append(html2);
        })
        $('#item-close').remove();
        $('#past-transaction-contents').append(none_content_close);
        }
      else {
        $('#item-now').remove();
        $('#transaction-contents').append(none_content_now);
        $('#item-close').remove();
        $('#past-transaction-contents').append(none_content_close);
      }
    })
  });
});

$(function(){
  function buildHTML(){
    var html =
`<div class="l-main">
  <div class="content-buy-items">
    <div class="content-buy-items__tab">
      <input checked="<%= true %>" id="tab-transaction" name="tab_btn2" type="radio"></input>
      <label class="tab_btn2" for="tab-transaction">取引中</label>
      <input id="tab-past-transaction" name="tab_btn2" type="radio"></input>
      <label class="tab_btn2" for="tab-past-transaction" id="past-tab">売却済</label>
      <div class="tab_pages" id="transaction-contents">
        <ul class="mypage-item-list" id="item-now">
        </ul>
      </div>
      <div class="tab_pages" id="past-transaction-contents">
        <ul class="mypage-item-list" id="item-close">
        </ul>
      </div>
    </div>
  </div>
</div>`

    return html;
  }
  function buildHTML2(product){
    insertimage = `<img src="${product.image}">`;
    inserturl = '/products/' + String(product.id)
    var html2 =
`<li>
  <a href=${inserturl}, class="mypage-item-link">
    <figure>
      ${insertimage}
    </figure>
    <div class="mypage-item-body">
      <div class="mypage-item-text">
        ${product.name}
      </div>
    <i class="fa fa-angle-right icon"></i>
    </div>`
    return html2;
  }
  $('#mypage_sell_now').on("click", function(){
    var url = location.href;
    $.ajax({
      url: url,
      type: "GET",
      dataType: "json"
    })
    .done(function(data){
      $('.l-main, .l-chapter, .signup4-main, .logout-content').remove();
      var html = buildHTML();
      $('.l-container').append(html);
      var none_content_now = `<div class= "none-content"><p>取引中の商品がありません</p></div>`
      var none_content_close = `<div class= "none-content"><p>過去に取引した商品がありません</p></div>`
      if (data.sell_now.length !== 0 && data.sell_close.length !== 0){
        data.sell_now.forEach(function(product_sell_now){
          var html2 = buildHTML2(product_sell_now);
          $('#item-now').append(html2);
        })
        data.sell_close.forEach(function(product_sell_close){
          var html2 = buildHTML2(product_sell_close);
          $('#item-close').append(html2);
        })}
      else if (data.sell_now.length == 0 && data.sell_close.length !== 0){
        $('#item-now').remove();
        $('#transaction-contents').append(none_content_now);
        data.sell_close.forEach(function(product_sell_close){
          var html2 = buildHTML2(product_sell_close);
          $('#item-close').append(html2);
        })}
      else if (data.sell_now.length !== 0 && data.sell_close.length == 0){
        data.sell_now.forEach(function(product_sell_now){
          var html2 = buildHTML2(product_sell_now);
          $('#item-now').append(html2);
        })
        $('#item-close').remove();
        $('#past-transaction-contents').append(none_content_close);
        }
      else {
        $('#item-now').remove();
        $('#transaction-contents').append(none_content_now);
        $('#item-close').remove();
        $('#past-transaction-contents').append(none_content_close);
      }
    })
  });
  $('#mypage_sell_close').on("click", function(){
    var url = location.href;
    $.ajax({
      url: url,
      type: "GET",
      dataType: "json"
    })
    .done(function(data){
      $('.l-main, .l-chapter, .signup4-main, .logout-content').remove();
      var html = buildHTML();
      $('.l-container').append(html);
      $('#past-tab').click();
      var none_content_now = `<div class= "none-content"><p>取引中の商品がありません</p></div>`
      var none_content_close = `<div class= "none-content"><p>過去に取引した商品がありません</p></div>`
      if (data.sell_now.length !== 0 && data.sell_close.length !== 0){
        data.sell_now.forEach(function(product_sell_now){
          var html2 = buildHTML2(product_sell_now);
          $('#item-now').append(html2);
        })
        data.sell_close.forEach(function(product_sell_close){
          var html2 = buildHTML2(product_sell_close);
          $('#item-close').append(html2);
        })}
      else if (data.sell_now.length == 0 && data.sell_close.length !== 0){
        $('#item-now').remove();
        $('#transaction-contents').append(none_content_now);
        data.sell_close.forEach(function(product_sell_close){
          var html2 = buildHTML2(product_sell_close);
          $('#item-close').append(html2);
        })}
      else if (data.sell_now.length !== 0 && data.sell_close.length == 0){
        data.sell_now.forEach(function(product_sell_now){
          var html2 = buildHTML2(product_sell_now);
          $('#item-now').append(html2);
        })
        $('#item-close').remove();
        $('#past-transaction-contents').append(none_content_close);
        }
      else {
        $('#item-now').remove();
        $('#transaction-contents').append(none_content_now);
        $('#item-close').remove();
        $('#past-transaction-contents').append(none_content_close);
      }
    })
  });
});
