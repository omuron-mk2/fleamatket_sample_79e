$(function(){
  var form = $("#charge_form");
  Payjp.setPublicKey("pk_test_87b7fc67028f90b331f87b22");
  $("#card_token").on("click",function(e){
    e.preventDefault();

    var card = {
      number: $("#card_number").val(),
      cvc: $("#cvc").val(),
      exp_month: $("#exp_month").val(),
      exp_year: $("#exp_year").val()
    };

    Payjp.createToken(card,function(status,response){
      form.find("input[type=submit]").prop("disabled", false);
      if(status == 200){
        $("#card_number").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name");
        var payjphtml = `<input type="hidden" name="payjpToken" value=${response.id}>`
        form.append(payjphtml);
        document.inputForm.submit();
      }else{
        alert("カード情報が正しくありません。");
      }
    });
  });
});