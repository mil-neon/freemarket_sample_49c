$(function () {

  const PROMPT = `<option value="">---</option>`;

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
      url: "/products/category",
      data: { id: id },
      dataType: "json",
    })
    .done(function (response) {
      response.forEach(function (category) {
        let childCategory = `<option value="${category.id}">${category.name}</option>`;
        $("#product_child_category_id").append(childCategory);
      });
    });
  });

  $(document).on('change', '#product_child_category_id', function () {

    let id = $(this).val();

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
      url: "/products/category",
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
          const grandChildCategory = `<option value="${category.id}">${category.name}</option>`;
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
    }
    else {
      $("#product_category_id").attr("name", "");
      $("#product_child_category_id").attr("name", "product[category_id]");
      $("#product_grand_child_category_id").attr("name", "");
    }
  });
});
