window.addEventListener('load', function () {
  const target = document.querySelector("#incremental");
  const targetPoint = document.querySelector(".headerInner__nav__leftItems__category");

  target.addEventListener('mouseover', (e) => {
    e.stopPropagation();
    setTimeout(() => {
      if (document.querySelector(".parentsArea")) {
        targetPoint.removeChild(document.querySelector(".parentsArea"))
      }
      $.ajax({
        url: '/category/parents',
        type: 'POST',
        dataType: 'json',
      })
      .done((data) => {
        let categoriesArea = document.createElement("ul");
        categoriesArea.classList.add("parentsArea");
        data.forEach((el, i) => {
          let aCategory = document.createElement("a");
          aCategory.classList.add("aParent");
          if (i === 0) {
            aCategory.classList.add("aParentFixArea");
          }
          aCategory.id = data[i].id
          aCategory.href = `/categories/${data[i].id}`
          aCategory.textContent = data[i].name
          let list = document.createElement("li");
          list.appendChild(aCategory);
          categoriesArea.appendChild(list);
        });
        targetPoint.appendChild(categoriesArea);
        categoriesArea.addEventListener('mouseleave',(e)=> {
          e.stopPropagation();
          targetPoint.removeChild(document.querySelector(".parentsArea"))
        });
        let parentCategories = document.querySelectorAll(".aParent");
        parentCategories.forEach(function (pc) {
          pc.addEventListener('mouseover', (e) => {
            e.stopPropagation();
            setTimeout(() => {
              $.ajax({
                url: '/category/children',
                type: 'POST',
                data: { id: pc.id },
                dataType: 'json',
              })
                .done((dataTwo) => {
                  if (document.querySelector(".childrenArea")) {
                    $(".childrenArea").remove();
                  }
                  let categoriesChildrenArea = document.createElement("ul");
                  categoriesChildrenArea.classList.add("childrenArea");
                  dataTwo.forEach((el, i) => {
                    let aCategory = document.createElement("a");
                    aCategory.classList.add("aChild");
                    if (i === 0) {
                      aCategory.classList.add("aChildFixArea");
                    }
                    aCategory.id = dataTwo[i].id
                    aCategory.href = `/categories/${dataTwo[i].id}`
                    aCategory.textContent = dataTwo[i].name
                    let list = document.createElement("li");
                    list.appendChild(aCategory);
                    categoriesChildrenArea.appendChild(list);
                  });
                  pc.appendChild(categoriesChildrenArea);
                  let Children = document.querySelectorAll(".aChild");
                  Children.forEach(function (cc) {
                    cc.addEventListener('mouseover', (e) => {
                      e.stopPropagation();
                      setTimeout(() => {
                        $.ajax({
                          url: '/category/children',
                          type: 'POST',
                          data: { id: cc.id },
                          dataType: 'json',
                        })
                          .done((dataThree) => {
                            if (document.querySelector(".groundChildrenArea")) {
                              $(".groundChildrenArea").remove();
                            }
                            let categoriesGroundChildrenArea = document.createElement("ul");
                            categoriesGroundChildrenArea.classList.add("groundChildrenArea")
                            dataThree.forEach((el, i) => {
                              let aGroundChildCategory = document.createElement("a");
                              aGroundChildCategory.classList.add("aGroundChild");
                              aGroundChildCategory.id = dataThree[i].id
                              aGroundChildCategory.href = `/categories/${dataThree[i].id}`
                              aGroundChildCategory.textContent = dataThree[i].name
                              let list = document.createElement("li");
                              list.appendChild(aGroundChildCategory);
                              categoriesGroundChildrenArea.appendChild(list);
                            });
                            cc.appendChild(categoriesGroundChildrenArea);
                            let groundChild = document.querySelectorAll(".aGroundChild");
                            groundChild.forEach(function (gc) {
                              gc.addEventListener('mouseover', (e) => {
                                e.stopPropagation();
                              });
                            });
                          });
                      },200);
                    });
                  });
                });
            },200)
          });
        });
      })
      .fail((data) => {
        alert("error")
      })
    },200)
  })
});