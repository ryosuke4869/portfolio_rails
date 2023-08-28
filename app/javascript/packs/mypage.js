document.addEventListener('turbolinks:load', function() {
  $('.tab').on('click', function() {
    $('.tab, .panel').removeClass('active');
    $(this).addClass('active');

    var index = $('.tab').index(this);
    $('.panel').eq(index).addClass('active');
  });
});
// chart
var ctx = document.getElementById("myRaderChart");
var myRadarChart = new Chart(ctx, {
  type: 'radar',
  data: {
    labels: ["投稿数", "いいねした数", "いいねされた数", "保存した投稿数", "登録したアイテム数"],
    datasets: [{
        label: '',
        data: [ gon.rader_post,
                gon.rader_likes,
                gon.rader_post_by_liked,
                gon.rader_bookmarks,
                gon.rader_post_items
              ],
        backgroundColor: 'RGBA(255,133,27,0.6)',
        borderColor: 'RGBA(255,133,27,1)',
        borderWidth: 1,
        pointBorderColor: 'RGBA(255,240,35,0.0)',
        pointBackgroundColor: 'rgba(0, 0, 0, 0)',
        scaleLineColor: 'RGBA(255,255,255,0.7)'
    }]
  },
  options: {
    scale:{
      ticks:{
          display: false,
          fontColor: 'RGBA(255,255,255,0.7)',
          suggestedMin: 0,
          suggestedMax: 50,
          stepSize: 10,
          callback: function(value, index, values){
              return  value
          }
      },
      gridLines: {         // 補助線（目盛の線）
          display: true,
          color: 'RGBA(255,255,255, 0.3)'
      },
      angleLines: {        // 軸（放射軸）
          display: true,
          color: 'RGBA(255,255,255, 0.3)'
      },
    },
    legend: {
        display: false
    }
  }
});
