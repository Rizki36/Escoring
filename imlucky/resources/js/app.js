require('jquery');
require('popper.js');
require('./bootstrap');
require('pace');
require('perfect-scrollbar');
require('@coreui/coreui');
require('chart.js');
require('bootstrap-select');

window.Swal = require('sweetalert2');
window.inputmask = $.inputmask = require('inputmask/dist/jquery.inputmask');
window.Crud = require('./crud');
window.Chart = $.Chart = require('chart.js/dist/Chart.bundle');

window.chartColors = {
    red: 'rgb(255, 99, 132)',
    orange: 'rgb(255, 159, 64)',
    yellow: 'rgb(255, 205, 86)',
    green: 'rgb(75, 192, 192)',
    blue: 'rgb(54, 162, 235)',
    purple: 'rgb(153, 102, 255)',
    grey: 'rgb(201, 203, 207)'
};
