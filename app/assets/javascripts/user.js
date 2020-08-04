$(function() {
  let tabs = $(".User_item");

  function tabSwitch() {
    $(".Active").removeClass("Active");
    $(this).addClass("Active");
    const index = tabs.index(this);
    $(".User_items__Contents__Content").removeClass("Show").eq(index).addClass("Show");
  }

  tabs.click(tabSwitch);
});

$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#user_profile_image").change(function(){
    readURL(this);
  });
 });