$(function(){

  var imageCount = $(".sell-main__container__inner__form__upload-box").data('image_count');
  var imageList = [];
  var imageNum = 0;

  function addPreviewToUpload(image, index) {

    const container = `<div 
                    class="sell-main__container__inner__form__upload-box__dropbox__container__items__item">
                        <figure class="sell-main__container__inner__form__upload-box__dropbox__container__items__item__figure">
                          <img src="${image}" id="image-${index}"/>
                        </figure>
                        <div class="sell-main__container__inner__form__upload-box__dropbox__container__items__item__button" id="upButton-${index}">
                          <a class="sell-main__container__inner__form__upload-box__dropbox__container__items__item__button__edit" data-id="${index}">編集</a>
                          <a class="sell-main__container__inner__form__upload-box__dropbox__container__items__item__button__destroy" data-id="${index}">削除</a>
                        </div>
                      </div>`

    const upload = `<div class="sell-main__container__inner__form__upload-box__dropbox__upload">
                      <div class="sell-main__container__inner__form__upload-box__dropbox__upload__wrap">
                        <pre class="sell-main__container__inner__form__upload-box__dropbox__upload__wrap--visible">
                          ドラッグアンドドロップ
                          またはクリックしてファイルをアップロード
                        </pre>
                      </div>
                    </div>`

    $(".sell-main__container__inner__form__upload-box__dropbox__upload").empty();
    $(".sell-main__container__inner__form__upload-box__dropbox__upload").css("display", "none");
    $(".sell-main__container__inner__form__upload-box__dropbox__container").append(container);
    $(".sell-main__container__inner__form__upload-box__dropbox").append(upload);
    if (imageCount == 10) {
      $(".sell-main__container__inner__form__upload-box__dropbox__upload__wrap").css("display", "none");
    }
  }

  // 画像の軽量化処理
  function resizeImage(base64, callback) {

    const MIN_SIZE = 800;
    var canvas = document.createElement('canvas');
    var ctx = canvas.getContext('2d');
    var image = new Image();

    image.crossOrigin = "Anonymous";

    image.onload = function(){

      var dstWidth = 0;
      var dstHeight = 0;

      if (this.width > this.height) {
        dstWidth = MIN_SIZE;
        dstHeight = this.height * MIN_SIZE / this.width;
      } else {
        dstHeight = MIN_SIZE;
        dstWidth = this.width * MIN_SIZE / this.height;
      }
      canvas.width = dstWidth;
      canvas.height = dstHeight;
      ctx.drawImage(this, 0, 0, this.width, this.height, 0, 0, dstWidth, dstHeight);
      callback(canvas.toDataURL());
    };
    image.src = base64;
  };

  // base64からblobへ変換
  function base64ToBlob(base64){
    const TYPE = "image/jpeg";
    var bin = atob(base64.split(',')[1]);
    var buffer = new Uint8Array(bin.length);
    for (let i = 0; i < bin.length; i++){
      buffer[i] = bin.charCodeAt(i);
    }
    const blob = new Blob([buffer.buffer], { type: TYPE });
    return blob;
  }

  function manageFiles(files) {

    var fileLength = files.length;
    imageCount += fileLength;

    readImages();

    function readImages() {
      return new Promise(async function (resolve) {
        for (let i = 0; i < fileLength; i++){
          await readImage(files[i]);
        }
        resolve();
      });
    }

    function readImage(file) {
      return new Promise(function (resolve) {
        var reader = new FileReader();
        reader.onload = function () {
          resizeImage(reader.result, function (image) {
            imageList.push(image);
            addPreviewToUpload(image, imageList.length - 1);
            resolve();
          });
        }
        reader.readAsDataURL(file);
      });
    }
  }

  // ドラッグ＆ドロップ
  $(document).on('dragover', '.sell-main__container__inner__form__upload-box__dropbox__upload__wrap', function (e) {
    e.preventDefault();
    e.stopPropagation();
  });

  // ドロップ
  $(document).on('drop', '.sell-main__container__inner__form__upload-box__dropbox__upload__wrap', function (e) {
    e.preventDefault();
    e.stopPropagation();
    var files = e.originalEvent.dataTransfer.files;
    manageFiles(files);
  });

  // 出品
  $(document).on('turbolinks:load', function() { 

    $('#new_product').on('submit', function(e){

      e.preventDefault();

      if ($('#product_grand_child_category_id').is(':visible')) {
        $("#product_grand_child_category_id").attr("name", "product[category_id]");
      } else if ($('#product_child_category_id').is(':visible')) {
        $("#product_child_category_id").attr("name", "product[category_id]");
      } else if ($('#product_category_id').is(':visible')) {
        $("#product_category_id").attr("name", "product[category_id]");
      }

      var formData = new FormData($(this).get(0));
      var url = $(this).attr('action');

      imageList.forEach(function(image){
        var blob = base64ToBlob(image);
        formData.append("images_attributes[image][]", blob,  "image" + imageNum  + ".jpg")
        imageNum++;
      });

      $.ajax({
        url: url,
        type: "POST",
        data: formData,
        contentType: false,
        processData: false,
        dataType: 'json',
      })
      .done(function(){
        location.href = "/products";
      })
      .fail(function(){
        alert('出品に失敗しました');
      });
    });
  });
});
