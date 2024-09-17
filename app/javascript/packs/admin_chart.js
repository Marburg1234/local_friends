  var ctx = document.getElementById('chart')

  var chart = new Chart(ctx, {
    type: 'pie',
    data: {
      labels: ['こうげき', 'ぼうぎょ', 'すばやさ', 'とくこう', '回避率'],
      datasets: [{

        data: [40, 30, 80, 300, 20],
        backgroundColor: [
          'rgb(255, 99, 132)',
          'rgb(54, 162, 235)',
          'rgb(255, 205, 86)',
          'rgb(123, 88, 200)',
          'rgb(68, 118, 124)'
          ],
          borderColor: [
          'rgba(255, 99, 132, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(255, 206, 86, 1)'
          ],
          hoverOffset: 4
      }]
    },
  });