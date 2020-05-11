window.addEventListener("load", function () {
  let tabs = document.getElementsByClassName("content__notifi__group__list");
  tabsAry = Array.prototype.slice.call(tabs);

  function tabSwitch() {
    document.getElementsByClassName("is_active")[0].classList.remove("is_active");
    this.classList.add("is_active");
    document.getElementsByClassName("is_showing")[0].classList.remove("is_showing");
    const index = tabsAry.indexOf(this);
    document.getElementsByClassName("content__notifi__sub")[index].classList.add("is_showing");
  }

  tabsAry.forEach(function (value) {
    value.addEventListener("click", tabSwitch);
  });
});