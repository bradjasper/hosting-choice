import os, sys

try:
    base_dir = sys.argv[1]
except IndexError:
    print "You must enter a base directory as an argument"
else:
    base_file = "hc"

    files = {
        'css': ('css/reset.css', 'css/style.css'),
        'js': ('js/jquery/jquery.js', 'js/jquery/rating/rating.js',
            'js/jquery/ajaxify/jquery.livequery.pack.js',
            'js/jquery/ajaxify/jquery.ajaxify.js',
            'js/jquery/ajaxify/jquery.history.fixed.js',
            'js/jquery/ajaxify/jquery.metadata.min.js')}

    for type in ['css']:

        tmp_files = ' '.join(map(lambda x: os.path.join(base_dir, x), files[type]))

        
        real_file = os.path.join(base_dir, type, base_file+"."+type)
        os.system("cat %s | tr -d '\015\032' > %s" % (tmp_files, real_file))
