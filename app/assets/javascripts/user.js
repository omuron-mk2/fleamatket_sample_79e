$(function () {
  // タブのDOM要素を取得し、変数で定義
  let tabs = $(".User_item");
  // tabsを配列に変換する
  tabsAry = Array.prototype.slice.call(tabs);

  // クラスの切り替えをtabSwitch関数で定義
  function tabSwitch() {
    // 全てのactiveクラスのうち、最初の要素を削除（"[0]は、最初の要素の意味"）
    $(".Active").removeClass("Active");

    // クリックしたタブにactiveクラスを追加
    // ②`this.`の後に、classListを使用してactiveクラスを追加しよう
    $(this).addClass("Active");

    // コンテンツの全てのshowクラスのうち、最初の要素を削除
    // ③`document.getElementsByClassName('show')[0].`の後に、showクラスを削除しよう
    $(".Show").removeClass("Show");

    // 何番目の要素がクリックされたかを、配列tabsから要素番号を取得
    const index = tabs.index(this);

    // クリックしたcontentクラスにshowクラスを追加する
    // ④`document.getElementsByClassName("content")[index].`の後に、showクラスを追加しよう
    $(".User_items__Contents__Content").removeClass("Show").eq(index).addClass("Show");
  }

  // タブメニューの中でクリックイベントが発生した場所を探し、下で定義したtabSwitch関数を呼び出す
  tabsAry.forEach(function (value) {
    // ①`value.`の後に、イベントリスナーでクリックイベントが発生した時に、tabSwitch関数を呼び出す処理を書きましょう。
    value.addEventListener("click", tabSwitch);
  });
});