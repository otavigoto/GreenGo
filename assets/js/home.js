const dadosPorPeriodo = {
  1: {
    labels: ['Água', 'Lixo', 'Transporte', 'Energia'],
    valores: [92, 85, 78, 88]
  },
  7: {
    labels: ['Água', 'Lixo', 'Transporte', 'Energia'],
    valores: [85, 90, 75, 80]
  },
  30: {
    labels: ['Água', 'Lixo', 'Transporte', 'Energia'],
    valores: [70, 88, 65, 72]
  },
  365: {
    labels: ['Água', 'Lixo', 'Transporte', 'Energia'],
    valores: [60, 75, 55, 68]
  }
};

const backgroundColors = ['#f9f2e0', '#f2b946', '#144d3a', '#78c2ad'];
const borderColors = [
  'rgba(54, 162, 235, 1)',
  'rgba(75, 192, 192, 1)',
  'rgba(255, 206, 86, 1)',
  'rgba(153, 102, 255, 1)'
];

let chart;

function criarGrafico(periodo) {
  const ctx = document.getElementById('graficoGeral').getContext('2d');
  const dados = dadosPorPeriodo[periodo];

  if (chart) {
    chart.destroy();
  }

  chart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: dados.labels,
      datasets: [{
        label: 'Pontuação',
        data: dados.valores,
        backgroundColor: backgroundColors,
        borderColor: borderColors,
        borderWidth: 1
      }]
    },
    options: {
      responsive: true,
      scales: {
        y: {
          beginAtZero: true,
          max: 100
        }
      }
    }
  });
}

function atualizarGrafico() {
  const periodo = document.getElementById('periodo').value;
  criarGrafico(periodo);
}
window.onload = () => criarGrafico(7);

