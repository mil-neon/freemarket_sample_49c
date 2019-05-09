$(function () {

  var changeFlg = false;
  const PROMPT = `<option value="">---</option>`;
  const BILL_RECIPIENT = "着払い(購入者負担)";
  const INCLUDE_POSTAGE = "送料込み(出品者負担)";

  $(document).on('change', '#product_category_id', function () {

    var id = $(this).val();

    $("#product_category_id").attr("name", "product[category_id]");
    $("#product_child_category_id").attr("name", "");
    $("#product_grand_child_category_id").attr("name", "");
    $("#grand_child_category").css("display", "none");

    if (!id) {
      $("#product_child_category_id").html(PROMPT);
      $("#product_grand_child_category_id").html(PROMPT);
      $("#child_category").css("display", "none");
      return false;
    }

    $("#product_child_category_id").html(PROMPT);
    $("#product_grand_child_category_id").html(PROMPT);
    $("#child_category").css("display", "block");

    $.ajax({
      type: "GET",
      url: "/category",
      data: { id: id },
      dataType: "json",
    })
    .done(function (response) {
      response.forEach(function (category) {
        var childCategory = `<option value="${category.id}">${category.name}</option>`;
        $("#product_child_category_id").append(childCategory);
      });
    });
  });

  $(document).on('change', '#product_child_category_id', function () {

    var id = $(this).val();

    if (id) {
      $("#product_category_id").attr("name", "");
      $("#product_child_category_id").attr("name", "product[category_id]");
      $("#product_grand_child_category_id").attr("name", "");
      $("#product_grand_child_category_id").html(PROMPT);
    } else {
      $("#product_category_id").attr("name", "product[category_id]");
      $("#product_child_category_id").attr("name", "");
      $("#product_grand_child_category_id").attr("name", "");
      $("#grand_child_category").css("display", "none");
      return false;
    }

    $.ajax({
      type: "GET",
      url: "/category",
      data: { id: id },
      dataType: "json",
    })
    .always(
      function () {
        $("#grand_child_category").css("display", "none");
      }
    ).done(
      function (response) {
        response.forEach(function (category) {
          $("#grand_child_category").css("display", "block");
          var grandChildCategory = `<option value="${category.id}">${category.name}</option>`;
          $("#product_grand_child_category_id").append(grandChildCategory);
        });
      }
    );
  });

  $(document).on('change', '#product_grand_child_category_id', function () {

    var id = $(this).val();

    if (id) {
      $("#product_category_id").attr("name", "");
      $("#product_child_category_id").attr("name", "");
      $("#product_grand_child_category_id").attr("name", "product[category_id]");
    } else {
      $("#product_category_id").attr("name", "");
      $("#product_child_category_id").attr("name", "product[category_id]");
      $("#product_grand_child_category_id").attr("name", "");
    }
  });

  $(document).on('change', '#product_shipping_feeh', function () {

    var id = $(this).val();

    if (id === BILL_RECIPIENT) {
      $("#shipping_method").css("display", "block");

      const BR = `<option value="未定">未定</option>
                  <option value="クロネコヤマト">クロネコヤマト</option>
                  <option value="ゆうパック">ゆうパック</option>
                  <option value="ゆうメール">ゆうメール</option>`

      $("#product_shipping_method").html(PROMPT);
      $("#product_shipping_method").append(BR);
      changeFlg = true;

    } else if (id === INCLUDE_POSTAGE) {
      $("#shipping_method").css("display", "block");

      if (changeFlg) {

        const IP = `<option value="未定">未定</option>
                    <option value="らくらくメルカリ便">らくらくメルカリ便</option>
                    <option value="ゆうメール">ゆうメール</option>
                    <option value="レターパック">レターパック</option>
                    <option value="普通郵便(定形、定形外)">普通郵便(定形、定形外)</option>
                    <option value="クロネコヤマト">クロネコヤマト</option>
                    <option value="ゆうパック">ゆうパック</option>
                    <option value="クリックポスト">クリックポスト</option>
                    <option value="ゆうパケット">ゆうパケット</option>`

        $("#product_shipping_method").html(PROMPT);
        $("#product_shipping_method").append(IP);
      }
    } else {
      $("#shipping_method").css("display", "none");
    }
  });
})
