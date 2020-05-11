window.addEventListener("load", function () {
  let methodArea = document.querySelector("#item_shipper");
  let shippingArea = document.querySelector(".productBody__main__form__method");
  let shippingArea_buyer = document.querySelector(".productBody__main__form__method__field__buyer");
  let shippingArea_exhibitor = document.querySelector(".productBody__main__form__method__field__exhibitor");

  function previewShippingMethod(){
    if(methodArea.value === 'true') {
      console.log(shippingArea)
      shippingArea_buyer.disabled = true
      shippingArea_exhibitor.disabled = false
      shippingArea.style.display = 'block';
      shippingArea_exhibitor.style.display = 'block';
      shippingArea_buyer.style.display = 'none';
    } else if(methodArea.value === 'false') {
      shippingArea_exhibitor.disabled = true
      shippingArea_buyer.disabled = false
      shippingArea.style.display = 'block';
      shippingArea_buyer.style.display = 'block';
      shippingArea_exhibitor.style.display = 'none';
    } else {
      shippingArea.style.display = 'none';
    }
  }
  methodArea.onchange = function() {
    previewShippingMethod()
  }
  previewShippingMethod()
})