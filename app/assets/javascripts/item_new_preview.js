// / / $(function(){
  //   $('#item_images_attributes_0_image').change(function(e){
  //     //ファイルオブジェクトを取得する
  //     var file = e.target.files[0];
  //     var reader = new FileReader();
   
  //     //画像でない場合は処理終了
  //     if(file.type.indexOf("image") < 0){
  //       alert("画像ファイルを指定してください。");
  //       return false;
  //     }
  //     //アップロードした画像を設定する
  //     reader.onload = (function(file){
  //       return function(e){
  //         $("#preview").attr("src", e.target.result);
  
  //       };
  //     })(file);
  //     reader.readAsDataURL(file);  
  //   });
  
  //   $('#item_images_attributes_1_image').change(function(e){
  //     //ファイルオブジェクトを取得する
  //     var file = e.target.files[0];
  //     var reader = new FileReader();
   
  //     //画像でない場合は処理終了
  //     if(file.type.indexOf("image") < 0){
  //       alert("画像ファイルを指定してください。");
  //       return false;
  //     }
   
  //     //アップロードした画像を設定する
  //     reader.onload = (function(file){
  //       return function(e){
  //         $("#preview").attr("src", e.target.result);
  
  //       };
  //     })(file);
  //     reader.readAsDataURL(file);  
  //   });
  
  //   $('#item_images_attributes_2_image').change(function(e){
  //     //ファイルオブジェクトを取得する
  //     var file = e.target.files[0];
  //     var reader = new FileReader();
   
  //     //画像でない場合は処理終了
  //     if(file.type.indexOf("image") < 0){
  //       alert("画像ファイルを指定してください。");
  //       return false;
  //     }
   
  //     //アップロードした画像を設定する
  //     reader.onload = (function(file){
  //       return function(e){
  //         $("#preview").attr("src", e.target.result);
         
  //       };
  //     })(file);
  //     reader.readAsDataURL(file);  
  //   });
  
  // });
  
  $(function(){
    var dataBox = new DataTransfer();
    //querySelectorでfile_fieldを取得
    var file_field = document.querySelector('input[type=file]')
    //fileが選択された時に発火するイベント
    $('#img_file').change(function(){
      //選択したfileのオブジェクトをpropで取得
      var file = $('input[type="file"]').prop('files')[0];

      // $.each(this.files, function(i, file){
        var img_count = 1;
        $(file).each(function(i){
          if (img_count > 5){
            return false
          }
          if (num == 5){
          $('#img_file').css('display', 'none')   
          }

        })

        //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
        var fileReader = new FileReader();

        dataBox.items.add(file)
        file_field.files = dataBox.files

        var num = $('#image-box__container').length + 1 + file 
        fileReader.readAsDataURL(file);
        
        fileReader.onloadend = function() {
          //読み込みが完了すると、srcにfileのURLを格納
          var src = fileReader.result
          var html= `<div class="productBody__main__form__image__box" id="image-box__container">
                      <div class="productBody__main__form__image__box__form__set">
                        <label class="productBody__main__form__image__box__form__set__label" for="item_images_attributes_0_image">
                          <input class="productBody__main__form__image__box__form__set__field" style="display: none" type="file" name="item[images_attributes][0][image]" id="item_images_attributes_0_image">
                            <img src="${src}" width="100" height="95">
                        </label></div>
                      </div>
                      <div class='item-image__operetion'>
                        <div class='item-image__operetion--delete'>削除</div>
                      </div>                      
                    </div>`                  
          //image_box__container要素の前にhtmlを差し込む
          // $('#img_file').css('display', 'none') 
          $('#img_file').after(html);
          

          
          
        }
        // var prevContent = $('#img_file').val("");
        // $(prevContent).append(html);

        $(document).on("click", '.item-image__operetion--delete', function(){
          //プレビュー要素を取得
          var target_image = $(this).parent().parent()
          //プレビューを削除
          target_image.remove();
          //inputタグに入ったファイルを削除
          file_field.val("")
        });  
      }) 

    
  });
// });