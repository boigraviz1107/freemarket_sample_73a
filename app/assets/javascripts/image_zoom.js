window.addEventListener('load', function () {
  let images = document.querySelectorAll(".imageZoomPreview");

  function zoomImage(e,className) {
    let imageAddTarget = document.querySelector(className);
    imageAddTarget.classList.add("relative");
    let addImageArea = document.createElement("div");
    addImageArea.classList.add("addImageArea");
    addImageArea.classList.add("effect");
    addImageArea.id = "addImageArea";
    let image = document.createElement("img");
    image.id = ("imgArea");
    image.src = e.target.currentSrc;
    addImageArea.appendChild(image);
    setTimeout(() => { addImageArea.classList.remove("effect") }, 10);
    imageAddTarget.appendChild(addImageArea);
    let outArea = document.querySelector("#addImageArea");
    outArea.addEventListener('click', () => {
      imageAddTarget.removeChild(outArea);
      imageAddTarget.classList.toggle("relative");
    });
  }

  images.forEach((image,i) => image.addEventListener('click', (e) => {
      if (i === 0) { return false }
      zoomImage(e,".showMain");
    })
  );

  let imageZoom = document.querySelectorAll(".imageZoom");
  imageZoom.forEach(image => {
    image.addEventListener('click',e => {
      if (image.src === "") { return false }
      zoomImage(e, ".productBody")
    })
  });
});