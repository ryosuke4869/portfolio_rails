$('#post_desk_images').on('change', function (e) {
  if (e.target.files.length > 5) {
    // 画像の数が5枚より多い場合の処理...
  } else {
    // 画像の数が5枚以下の場合の処理...
    let reader = new Array(5);
    // 画像選択を二回した時、一回目より数が少なかったりすると画面上に残るので初期化
    for (let i = 0; i < 5; i++) {
      $(`#preview_${i}`).attr('src', "");
    }
    // 画像がアップロードされたとき
    for (let i = 0; i < e.target.files.length; i++) {
      reader[i] = new FileReader(); // 画像読み込み
      reader[i].onload = finisher(i, e); // 下記の関数使用で格納
      reader[i].readAsDataURL(e.target.files[i]); // 画像ファイルからURLを取得

      // onloadは別関数で準備しないとfor文内では使用できないので、関数を準備。
      function finisher(i, e) {
        return function (e) {
          $(`#preview_${i}`).attr('src', e.target.result);
          // プレビューの表示有無を設定
          $('.preview-area').show();
          $('#nophoto').hide();
        }
      }
    }
  }
});
