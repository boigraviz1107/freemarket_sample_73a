$(function () {
  let imagesArea = document.querySelectorAll(".productBody__main__form__image__box__form__set__field");
  // Methods
  // 画像の追加
  function addImage(idName, en) {
    var reader = new FileReader();
    reader.onload = e => $(`#preview${idName}`).attr('src', e.target.result)
    reader.readAsDataURL(en.target.files[0]);
  }
  // 画像の削除
  function removeImage(idNum) {
    $(`#preview${idNum}`).attr("src", "");
    $(`#item_images_attributes_${idNum}_image`).val("");
  }

  // exec
  imagesArea.forEach((image, i) => image.onchange = e => addImage(i, e));
  for(let i = 0; i < 3; i++) { $(`#item_image_delete${i}`).on('click',() => removeImage(i) ); }
});