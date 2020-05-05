$(function(){

  $('.wrapper__main__payInfo__inner__payMethods__cards__card').click(function(){
    var card_id = $(this).find('input').val();
    // console.log(card_id);
    $('#order_card_id').val(card_id);
    // console.log($('#order_card_id').val());
  });

})