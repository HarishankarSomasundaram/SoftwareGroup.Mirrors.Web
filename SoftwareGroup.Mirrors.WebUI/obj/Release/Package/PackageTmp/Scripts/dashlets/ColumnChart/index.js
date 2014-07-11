﻿define(["require", "http://code.highcharts.com/highcharts.js"], {
    draw: function () {
        size = this.context.getDashletSize();        
        $('#cc-container').width(size.w);
        $('#cc-container').height(size.h);
        // Set up the chart
        var chart = new Highcharts.Chart({
            chart: {
                renderTo: 'cc-container',
                type: 'column',
                margin: 75
            },
            title: {
                text: 'Chart rotation demo'
            },
            subtitle: {
                text: 'Test options by dragging the sliders below'
            },
            plotOptions: {
                column: {
                    depth: 25
                }
            },
            series: [{
                data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
            }]
        });       
    },

    resize: function () {
        this.draw();
    },

    initialize: function (context, viewNode) {
        this.draw();
    }
})