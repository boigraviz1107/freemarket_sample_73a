window.addEventListener('load', () => {
  // variable
  let priceArea = document.querySelector("#item_price");
  let feeArea = document.querySelector(".productBody__main__form__fee__box2");
  let profitArea = document.querySelector(".productBody__main__form__profit__box2");

  // method
  function changePrice() {
    let value = priceArea.value;
    if (value < 300){
      feeArea.textContent = "ー"
      profitArea.textContent = "ー";
    }else if (value !== "") {
      fee = Math.floor(value / 10);
      feeArea.textContent = fee.toLocaleString();
      profitArea.textContent = (value - fee).toLocaleString();
    }
  }

  // exec
  changePrice();
  priceArea.onchange = () => changePrice();
  priceArea.addEventListener('keyup', () => changePrice());
});
