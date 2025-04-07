function criarGrafico(id, valores) {
  new Chart(document.getElementById(id), {
    type: 'bar',
    data: {
      labels: ['01/04', '02/04', '03/04', '04/04'],
      datasets: [{
        label: '',
        data: valores,
        backgroundColor: ['#f9f2e0', '#f2b946', '#c5facc', '#78c2ad']
      }]
    },
    options: {
      responsive: false,
      maintainAspectRatio: false,
      plugins: {
        legend: { display: false },
        title: { display: false }
      },
      scales: {
        x: {
          ticks: { color: '#fff', font: { size: 10 } },
          grid: { display: false }
        },
        y: {
          beginAtZero: true,
          ticks: { color: '#fff', font: { size: 10 } }
        }
      }
    }
  });
}

window.onload = function () {
  criarGrafico('graficoAgua', [8, 12, 16, 20]);
  criarGrafico('graficoEnergia', [8, 17, 11, 7]);
  criarGrafico('graficoLixo', [18, 13, 18, 6]);
  criarGrafico('graficoTransporte', [19, 10, 5, 21]);
};
