window.addEventListener("load", function () {
  let tabss = document.getElementsByClassName("content__deal__group__list");
  tabsArys = Array.prototype.slice.call(tabss);

  function tabSwitch() {
    document.getElementsByClassName("active")[0].classList.remove("active");
    this.classList.add("active");
    document.getElementsByClassName("showing")[0].classList.remove("showing");
    const index = tabsArys.indexOf(this);
    document.getElementsByClassName("content__deal__sub")[index].classList.add("showing");
  }

  tabsArys.forEach(function (value) {
    value.addEventListener("click", tabSwitch);
  });

  $(document).ready($("#user_nickname").focus());
  $(document).ready($("#account_post_num").focus());

});