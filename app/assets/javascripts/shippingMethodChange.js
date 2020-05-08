window.addEventListener("load", function () {
  let methodArea = document.querySelector("#item_shipper");
  let shippingArea = document.querySelector(".productBody__main__form__method");
  let shippingArea_buyer = document.querySelector(".productBody__main__form__method__field__buyer");
  let shippingArea_exhibitor = document.querySelector(".productBody__main__form__method__field__exhibitor");

  methodArea.onchange = function() {
    console.log(methodArea.value);
    if(methodArea.value === 'true') {
      console.log(shippingArea)
      shippingArea_buyer.disabled = false
      shippingArea_exhibitor.disabled = true
      shippingArea.style.display = 'block';
      shippingArea_exhibitor.style.display = 'block';
      shippingArea_buyer.style.display = 'none';
    } else if(methodArea.value === 'false') {
      shippingArea_exhibitor.disabled = false
      shippingArea_buyer.disabled = true
      shippingArea.style.display = 'block';
      shippingArea_buyer.style.display = 'block';
      shippingArea_exhibitor.style.display = 'none';
    } else {
      shippingArea.style.display = 'none';
    }
  }


  // let shippingArea = document.querySelector(".productBody__main__form__method");
  // let methodArea = document.querySelector("#item_shipper");
  // let exhibitorArea = document.querySelector(".productBody__main__form__method__field__exhibitor");
  // let buyerArea = document.querySelector(".productBody__main__form__method__field__buyer");
  // methodArea.onchange = function() {
  //   console.log(methodArea.value);
  //   if(methodArea.value == 'true') {
  //     exhibitorArea.style.display = 'block';
  //   } else if(methodArea.value == 'false'){
  //     buyerArea.style.display = 'block';
  //   } else {
  //     shippingArea.style.display = 'none';
  //   }
  // }

  // let shippingArea = $(".productBody__main__form__method");
  // let methodArea = $("#item_shipper");
  // let exhibitorArea = $(".productBody__main__form__method__field__exhibitor");
  // let buyerArea = $(".productBody__main__form__method__field__buyer");
  // $('methodArea').change = function() {
  //   console.log(methodArea.value);
  //   if( methodArea.value == 'true') {
  //     exhibitorArea.css('display') == 'block'
  //   } else if(methodArea.value == 'false') {
  //     buyerArea.css('display') == 'block'
  //   } else {
  //     shippingArea.css('display') == 'none'
  //   }
  // }

})