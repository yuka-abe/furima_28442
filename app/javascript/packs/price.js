$(function(){
  
  $('#item-price').on('input', function(){  //入力のたびに発火する
    let data = $('#item-price').val();   // val()でフォームのvalueを取得(数値)
    let profit = Math.round(data * 0.9)    // 手数料計算を行う
    let fee = (data - profit)              //入力した数値から計算結果
    $('#add-tax-price').html(fee)
    $('#profit').html(profit)
    $('#price').val(profit)                //計算結果を格納用フォームに追加
    if(profit == '') {
      $('#add-tax-price').html('');
      $('#profit').html('');
    }
  })
})