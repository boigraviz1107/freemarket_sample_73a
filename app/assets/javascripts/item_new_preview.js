$(function () {
  function addImage(idName, en) {
    var reader = new FileReader();
    reader.onload = e => $(`#preview${idName}`).attr('src', e.target.result)
    reader.readAsDataURL(en.target.files[0]);
  }
  let imagesArea = document.querySelectorAll(".productBody__main__form__image__box__form__set__field");
  imagesArea.forEach((image, i) => image.onchange = e => addImage(i, e));
});


