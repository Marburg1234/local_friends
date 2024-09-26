// ページ上部に戻るJavascript

  // ページの読み込み時に実行
$(document).on('turbolinks:load', function() {
  // スクロールした際の処理
  $(window).scroll(function() {
    if ($(this).scrollTop() > 100) {
      $('#top_back').fadeIn();
    } else {
      $('#top_back').fadeOut();
    }
  });

  // トップに戻るボタンがクリックされたとき
  $('#scroll-top').click(function(event) {
    event.preventDefault();
    $('html, body').animate({ scrollTop: 0 }, 500);
  });
});