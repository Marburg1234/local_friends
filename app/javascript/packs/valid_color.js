$(function() {
  // 制限した文字数を超えると文字色を赤くするJavascriptを実装する
  // 最初に各フィールドの最大文字数を設定(これはクラス名を使っている nameLimitはname_limitのこと)
  const maxLengths = {
    nameLimit: 25, // 名前の最大文字数
    introduction: 300, // 自己紹介の最大文字数
    topic: 100 // 好きな話題の最大文字数
  };

  // すべての対象フィールドを取得
  // 名前はfamily_nameとfirst_nameで同じ文字数制限なので複数扱えるquerySelectorAllで記述する
  const nameFields = document.querySelectorAll('.name_limit'); // 名前のフィールド クラス名で紐づけてしている
  // 下の2つは1か所のみなのでquerySelectorで記述している
  const introductionField = document.querySelector('.introduction'); // 自己紹介フィールド クラス名で紐づけ
  const topicField = document.querySelector('.topic'); // 好きな話題フィールド クラス名で紐づけ


// 以下は、実際の発火 addEventListener('input')で監視してもらって、inputが最大文字数を超えると赤くするというメソッドを記述している

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
