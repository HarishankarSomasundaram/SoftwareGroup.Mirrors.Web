define(["require"], {
    draw: function () {
        size = this.context.getDashletSize();
        $('#scc-container').width(size.w);
        $('#scc-container').height(size.h);
        // Set up the chart
        $('#scc-container').highcharts({

            chart: {
                type: 'column',
                marginTop: 80,
                marginRight: 40
            },

            title: {
                text: 'Total fruit consumption, grouped by gender'
            },

            xAxis: {
                categories: ['Apples', 'Oranges', 'Pears', 'Grapes', 'Bananas']
            },

            yAxis: {
                allowDecimals: false,
                min: 0,
                title: {
                    text: 'Number of fruits'
                }
            },

            tooltip: {
                headerFormat: '<b>{point.key}</b><br>',
                pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
            },

            plotOptions: {
                column: {
                    stacking: 'normal',
                    depth: 40
                }
            },

            series: [{
                name: 'John',
                data: [5, 3, 4, 7, 2],
                stack: 'male'
            }, {
                name: 'Joe',
                data: [3, 4, 4, 2, 5],
                stack: 'male'
            }, {
                name: 'Jane',
                data: [2, 5, 6, 2, 1],
                stack: 'female'
            }, {
                name: 'Janet',
                data: [3, 0, 4, 4, 3],
                stack: 'female'
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