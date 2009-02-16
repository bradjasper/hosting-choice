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

    bg_store = {}

    var pageTracker = _gat._getTracker("UA-6961171-1");
    var conversions = {
        'adwords': function(){
            var image = new Image(1,1);
            image.src = "http://www.googleadservices.com/pagead/conversion/1070629377/?value=3.5&amp;label=sGrlCNeHjAEQgYTC_gM&amp;guid=ON&amp;script=0";
            return;
        },
        '7search': function(){
            var image = new Image(1,1);
            image.src = "http://conversion.7search.com/conversion/v1/?advid=155680&urlid=&type=purchase&value=1&noscript=1";
            return;
        }
    }

    $.localScroll();

    $('#hide_all').live('click', function() {
        $(this).text('Show All Features');
        $('.hide').each(function() {
            $(this).fadeOut(1500);
        });
        $(this).attr('id', 'show_all');
    });

    $('#show_all').live('click', function() {
        $(this).text('Hide All Features');
        $('.hide').each(function() {
            $(this).fadeIn(1500);
        });
        $(this).attr('id', 'hide_all');
    });



    $('[class=see_more] a').click(function() {
        $(this).fadeOut(500);
        $('.hidden').each(function() {
            $(this).fadeIn(1500);
        });
    });
        
    $('[class=visit]').each(function() {
        var url = $(this).attr('href');
        var name = $(this).attr('name');
        var session = $.cookie('sessionid');
        $(this).attr('href', url+'?note='+name+'&sid='+session);
        $(this).click(function() {
            pageTracker._trackPageview(url);
            conversions['adwords']();
            conversions['7search']();
        });
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

