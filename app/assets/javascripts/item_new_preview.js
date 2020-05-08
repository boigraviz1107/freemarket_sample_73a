$(function () {
  $('#item_images_attributes_0_image').on('change', function (e) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $("#preview").attr('src', e.target.result);
    }
    reader.readAsDataURL(e.target.files[0]);
  });

  $('#item_images_attributes_1_image').on('change', function (e) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $("#preview1").attr('src', e.target.result);
    }
    reader.readAsDataURL(e.target.files[0]);
  });

  $('#item_images_attributes_2_image').on('change', function (e) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $("#preview2").attr('src', e.target.result);
    }
    reader.readAsDataURL(e.target.files[0]);
  });
});