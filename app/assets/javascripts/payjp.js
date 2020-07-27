$(function(){
  var form = $("#charge_form");
  Payjp.setPublicKey("pk_test_c45b8051ee7b985365246a2f");
  $("#card_token").on("click",function(e){
    e.preventDefault();
    console.log("hoge");
  //↑ここでrailsの処理を止めることでjsの処理を行う
    var card = {
      number: $("#card_number").val(),
      cvc: $("#cvc").val(),
      exp_month: $("#exp_month").val(),
      exp_year: $("#exp_year").val()
    };
   //↑Pay.jpに登録するデータを準備する
    Payjp.createToken(card,function(status,response){
   //↑先ほどのcard情報がトークンという暗号化したものとして返ってくる
      form.find("input[type=submit]").prop("disabled", true);
      if(status == 200){//←うまくいった場合200になるので
        $("#card_number").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name");
       //↑このremoveAttr("name")はデータを保持しないように消している
        var payjphtml = `<input type="hidden" name="payjpToken" value=${response.id}>`
        form.append(payjphtml);
        //↑これはdbにトークンを保存するのでjsで作ったトークンをセットしてる
        document.inputForm.submit();
       //↑そしてここでsubmit！！これでrailsのアクションにいく！もちろん上でトークンをセットしているのでparamsの中には{payjpToken="トークン"}という情報が入っている
      }else{
        alert("カード情報が正しくありません。");
      }
    });
  });
});