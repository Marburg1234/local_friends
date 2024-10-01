$(function() {
  // 各フィールドの最大文字数を設定
  const maxLengths = {
    nameLimit: 25, // 名前の最大文字数
    introduction: 300, // 自己紹介の最大文字数
    topic: 100 // 好きな話題の最大文字数
  };

  // すべての対象フィールドを取得
  const nameFields = document.querySelectorAll('.name_limit'); // 名前のフィールド
  const introductionField = document.querySelector('.introduction'); // 自己紹介フィールド
  const topicField = document.querySelector('.topic'); // 好きな話題フィールド

  console.log("ここまで読み込み済み");

  // 名前フィールドの処理
  nameFields.forEach(function(field) {
    field.addEventListener('input', function() {
      if (field.value.length > maxLengths.nameLimit) {
        field.style.color = 'red'; // 赤色に変更
      } else {
        field.style.color = ''; // 元の色に戻す
      }
    });
  });

  // 自己紹介フィールドの処理
  if (introductionField) {
    introductionField.addEventListener('input', function() {
      if (introductionField.value.length > maxLengths.introduction) {
        introductionField.style.color = 'red'; // 赤色に変更
      } else {
        introductionField.style.color = ''; // 元の色に戻す
      }
    });
  }

  // 好きな話題フィールドの処理
  if (topicField) {
    topicField.addEventListener('input', function() {
      if (topicField.value.length > maxLengths.topic) {
        topicField.style.color = 'red'; // 赤色に変更
      } else {
        topicField.style.color = ''; // 元の色に戻す
      }
    });
  }
});
