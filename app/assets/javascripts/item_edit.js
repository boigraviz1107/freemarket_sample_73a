window.addEventListener('load', function () {
  let selectArea = document.querySelector(".productBody__main__form__category__field");
  let parents = document.querySelector("#parentsArea");

  function addSelector(data, id = "") {
    let select = document.createElement("select");
    data.forEach(el => {
      let option = document.createElement("option");
      option.setAttribute("value", el.id);
      option.appendChild(document.createTextNode(el.name));
      select.appendChild(option);
    });
    select.id = `item_category_child${id}`
    if (select.id === 'item_category_child__children') {
      select.name = 'item[category_id]'
    }
    selectArea.appendChild(select);
  }

  if (location.pathname.includes("edit")) {
    let categoryId = document.querySelector("#category_id").value;
    $.ajax({
      url: '/item/parent_category',
      type: 'POST',
      data: { 'id': categoryId },
      dataType: 'json',
    })
    .done((data) => {
      parents.value = data.rootId
      $.ajax({
        url: '/item/category',
        type: 'POST',
        data: { 'id': data.rootId },
        dataType: 'json',
      })
        .done((dataTwo) => {
          addSelector(dataTwo);
          document.querySelector("#item_category_child").value = data.parentId
          $.ajax({
            url: '/item/category',
            type: 'POST',
            data: { 'id': data.parentId },
            dataType: 'json',
          })
          .done((dataThree) => {
            addSelector(dataThree, "__children");
            document.querySelector("#item_category_child__children").value = categoryId
          })
            .fail((dataThree) => {
              window.alert("error")
          })
        })
        .fail((dataTwo) => {
          window.alert("error")
        })
    })
    .fail((data) => {
      window.alert("error")
    })
  }
});