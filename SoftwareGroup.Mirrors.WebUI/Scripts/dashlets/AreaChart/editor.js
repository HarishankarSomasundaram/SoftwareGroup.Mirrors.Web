define(["require"], function (require) {
    return {
        initialize: function (context, node) {
            var self = this;
            $(window).trigger('resize');
        }
    }
})