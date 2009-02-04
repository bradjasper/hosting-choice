String.prototype.trim = function() {
	return this.replace(/^\s+|\s+$/g,"");
}
String.prototype.ltrim = function() {
	return this.replace(/^\s+/,"");
}
String.prototype.rtrim = function() {
	return this.replace(/\s+$/,"");
}

$(document).ready(function() {

    $('[class=visit]').each(function() {
        var url = $(this).attr('href');
        var name = $(this).attr('name');
        $(this).attr('href', url+'?note='+name);
    });

    $('#errors').fadeIn(1500);
    $('#success').fadeIn(1500);

    read_more = function(link) {
        $('.dotdots').fadeOut(400, function() {
            $(this).remove();
        });
        $('.read').fadeOut(400, function() {
            $(this).remove();
            $('.more').fadeIn(500, function() {
                $(this).show();
            });
        });

    }

    /* Add Tools to each Comment */
    $('.comment .meta').each(function() {
        var comment_id = $(this).parent().attr('id').split('-')[1];
        $(this).html($(this).html()+'\
            <span class="tools">\
                <a href="/comment/helpful/'+comment_id+'.html">This review was helpful</a> or\
                <a href="/comment/report/'+comment_id+'.html">Report abuse</a>\
            </span>\
            <div class="clear"></div>');
    });

    /* Hover Effect for tools on comments. Brings up "I liked this" links */
    $('.tools a').livequery(function() {
        var par = $(this).parent();

        $(this).ajaxify({
            method: 'POST',
            onComplete: function(opt) {
                par.html('<strong>Thanks!</strong>');
                par.fadeOut(5000, function() {
                    $(this).remove();
                });

                if ($(this).attr('link').match('report')) {
                    var grand = $(par).parent().parent()
                    grand.fadeOut(1500, function() {
                        $(this).remove();
                    });
                }
            }
        });
    });

    $('.comment').hover(
        function(){ $(this).find(".tools").show() },
        function(){ $(this).find(".tools").hide() });


    /* Set default items for star ratings (comment error) */
    var types = ['features', 'support', 'uptime']
    for (key in types) {
        var name = 'id_rating_' + types[key];
        var val_name = name+'_val'

        var curvalue = $('#'+val_name).val()
        if (curvalue < 0) {
            curvalue = 0;
        }

        $('#'+name).rating(val_name, {maxvalue: 5, curvalue: curvalue});

    }

});

