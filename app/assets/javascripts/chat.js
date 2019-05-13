$(document).on('turbolinks:load', function(){
  var buildChatHTML = function(chat) {
    if (chat.seller_id === chat.user_id) {
      var html = `<li class="product-detail__comments__box__contents__lists__comment">
                    <a class="product-detail__comments__box__contents__lists__comment__user" href="/">
                      <figure class="product-detail__comments__box__contents__lists__comment__user__figure">
                        <img class="product-detail__comments__box__contents__lists__comment__user__figure__image" src="../assets/member_no_member.png">
                        <figcaption class="product-detail__comments__box__contents__lists__comment__user__figure__user-name">
                          ${chat.nickname}
                        </figcaption>
                      </figure>
                      <div class="product-detail__comments__box__contents__lists__comment__user__seller">
                        出品者
                      </div>
                    </a>
                    <div class="product-detail__comments__box__contents__lists__comment__body">
                      <div class="product-detail__comments__box__contents__lists__comment__body__text">
                        <pre>${chat.comment}</pre>
                      </div>
                      <div class="product-detail__comments__box__contents__lists__comment__body__time">
                        <time class="product-detail__comments__box__contents__lists__comment__body__time__icons">
                          <i class="far fa-clock product-detail__comments__box__contents__lists__comment__body__time__icons__icon">
                          </i>
                          <span class="product-detail__comments__box__contents__lists__comment__body__time__icons__date">
                            0秒前
                          </span>
                        </time>
                      </div>
                      <i class="fab fa-affiliatetheme product-detail__comments__box__contents__lists__comment__body__comment-icon">
                      </i>
                    </div>
                  </li>`
      return html
    } else {
      var html = `<li class="product-detail__comments__box__contents__lists__comment">
                    <a class="product-detail__comments__box__contents__lists__comment__user" href="/">
                      <figure class="product-detail__comments__box__contents__lists__comment__user__figure">
                        <img class="product-detail__comments__box__contents__lists__comment__user__figure__image" src="../assets/member_no_member.png">
                        <figcaption class="product-detail__comments__box__contents__lists__comment__user__figure__user-name">
                          ${chat.nickname}
                        </figcaption>
                      </figure>
                    </a>
                    <div class="product-detail__comments__box__contents__lists__comment__body">
                      <div class="product-detail__comments__box__contents__lists__comment__body__text">
                        <pre>${chat.comment}</pre>
                      </div>
                      <div class="product-detail__comments__box__contents__lists__comment__body__time">
                        <time class="product-detail__comments__box__contents__lists__comment__body__time__icons">
                          <i class="far fa-clock product-detail__comments__box__contents__lists__comment__body__time__icons__icon">
                          </i>
                          <span class="product-detail__comments__box__contents__lists__comment__body__time__icons__date">
                            0秒前
                          </span>
                        </time>
                      </div>
                      <i class="fab fa-affiliatetheme product-detail__comments__box__contents__lists__comment__body__comment-icon">
                      </i>
                    </div>
                  </li>`
      return html
    }
  };
  $('.product-detail__comments__box__comment__form').submit(function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var productId = $(".product-detail__comments__box__comment__form__button__comment").data('id');
    $.ajax({
      url: "/products/" + String(productId) + "/chats",
      type: "POST",
      data: formData,
      datatype: "json",
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildChatHTML(data);
      $('.product-detail__comments__box__comment__form')[0].reset();
      $('.product-detail__comments__box__comment__form__button__comment').removeAttr('disabled');
      if (data.comment !== "") {
      $('.product-detail__comments__box__contents__lists').append(html);
      return false
      }
    })
  });
});
