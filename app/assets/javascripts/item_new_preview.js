$(function () {
  function addImage(idName, en) {
    var reader = new FileReader();
    reader.onload = e => $(`#preview${idName}`).attr('src', e.target.result)
    reader.readAsDataURL(en.target.files[0]);
  }
  let imagesArea = document.querySelectorAll(".productBody__main__form__image__box__form__set__field");
  imagesArea.forEach((image, i) => image.onchange = e => addImage(i, e));

  $(document).on('click', '#item_image_delete0', function () {
    $("#preview0").attr("src", "");
    $("#item_images_attributes_0_image").val("");
  });

  $(document).on('click', '#item_image_delete1', function () {
    $("#preview1").attr("src", "");
    $("#item_images_attributes_1_image").val("");
  });

  $(document).on('click', '#item_image_delete2', function () {
    $("#preview2").attr("src", "");
    $("#item_images_attributes_2_image").val("");
  });
});