window.addEventListener('load', function () {
  let selectArea = document.querySelector(".productBody__main__form__category__field");
  let parents = document.querySelector("#parentsArea");
  // methods
  function addSelector(data,id = "") {
    let select = document.createElement("select");
    let noOption = document.createElement("option");
    noOption.setAttribute("value", "");
    noOption.appendChild(document.createTextNode("選択してください"));
    select.appendChild(noOption);
    data.forEach(el => {
      let option = document.createElement("option");
      option.setAttribute("value", el.id);
      option.appendChild(document.createTextNode(el.name));
      select.appendChild(option);
    });
    select.id = `item_category_child${id}`
    if (select.id === 'item_category_child__children') {
      select.name ='item[category_id]'
    }
    selectArea.appendChild(select);
  }

  parents.onchange = function () {
    if (selectArea.childElementCount === 2) {
      selectArea.removeChild(selectArea.lastChild);
    } else if(selectArea.childElementCount === 3) {
      selectArea.removeChild(selectArea.lastChild);
      selectArea.removeChild(selectArea.lastChild);
    }
    $.ajax({
      url: '/item/category',
      type: 'POST',
      data: { 'id': parents.value },
      dataType: 'json',
    })
    .done((data) => {
      addSelector(data);
      let children = document.querySelector("#item_category_child");
      children.onchange = function () {
        if (selectArea.childElementCount === 3) {
          selectArea.removeChild(selectArea.lastChild);
        }
        $.ajax({
          url: '/item/category',
          type: 'POST',
          data: { 'id': children.value },
          dataType: 'json',
        })
        .done((dataTwo) => {
          addSelector(dataTwo, "__children");
        })
        .fail((dataTwo) => {
          window.alert("選択してください")
        })
      }
    })
    .fail((data) => {
      window.alert("error")
    });
  }
});