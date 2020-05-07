$(function(){


  $('.wrapper__main__payInfo__inner__payMethods__cards__card').click(function(){
    var card_id = $(this).find('input').val();
    // console.log(card_id);
    $('#order_card_id').val(card_id);
    $('.wrapper__main__payInfo__inner__payMethods__cards__card').removeClass('red');
    $(this).addClass('red');
    $('.wrapper__main__payInfo__inner__form__area__submit').prop('disabled', false);
  });

  
})