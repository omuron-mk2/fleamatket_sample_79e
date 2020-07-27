$(function(){
  var form = $("#charge_form");
  Payjp.setPublicKey("pk_test_c45b8051ee7b985365246a2f");
  $("#card_token").on("click",function(e){
    e.preventDefault();
    console.log("hoge");

    var card = {
      number: $("#card_number").val(),
      cvc: $("#cvc").val(),
      exp_month: $("#exp_month").val(),
      exp_year: $("#exp_year").val()
    };

    Payjp.createToken(card,function(status,response){
      form.find("input[type=submit]").prop("disabled", true);
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