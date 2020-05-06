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
    $('#item_images_attributes_0_image').change(function(){
      //選択したfileのオブジェクトをpropで取得
      var file = $('input[type="file"]').prop('files')[0];
  
      //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
      var fileReader = new FileReader();
  
      
      //読み込みが完了すると、srcにfileのURLを格納
      fileReader.onloadend = function() {
        var src = fileReader.result
        var html= `<img src="${src}" width="100" height="95">`
        //image_box__container要素の前にhtmlを差し込む
        
        $('#img_file').after(html);
        var num = $('.img_file').length + 1 + i
        if (num == 5){
          $('#img_file').css('display', 'none')   
        }
      }
      fileReader.readAsDataURL(file);
    });
  });
  
