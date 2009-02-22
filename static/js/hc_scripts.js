jQuery.fn.rating=function(divid,options){if(divid==null)return;var settings={divid:divid,maxvalue:5,curvalue:0};if(options){jQuery.extend(settings,options);};jQuery.extend(settings,{cancel:(settings.maxvalue>1)?true:false});var container=jQuery(this);jQuery.extend(container,{averageRating:settings.curvalue,divid:settings.divid});for(var i=0;i<=settings.maxvalue;i++){var size=i
if(i==0){if(settings.cancel==true){var div='<div class="cancel"><a href="#0" title="Cancel Rating">Cancel Rating</a></div>';container.append(div);}}
else{var div='<div class="star"><a href="#'+i+'" title="Give it '+i+'/'+size+'">'+i+'</a></div>';container.append(div);}}
var stars=jQuery(container).children('.star');var cancel=jQuery(container).children('.cancel');stars.mouseover(function(){event.drain();event.fill(this);}).mouseout(function(){event.drain();event.reset();}).focus(function(){event.drain();event.fill(this)}).blur(function(){event.drain();event.reset();});stars.click(function(){if(settings.cancel==true){settings.curvalue=stars.index(this)+1;var rating=jQuery(this).children('a')[0].href.split('#')[1]
$('#'+divid).val(rating)
return false;}
else if(settings.maxvalue==1){settings.curvalue=(settings.curvalue==0)?1:0;$(this).toggleClass('on');var rating=jQuery(this).children('a')[0].href.split('#')[1]
$('#'+divid).val(rating)
return false;}
return true;});if(cancel){cancel.mouseover(function(){event.drain();jQuery(this).addClass('on')}).mouseout(function(){event.reset();jQuery(this).removeClass('on')}).focus(function(){event.drain();jQuery(this).addClass('on')}).blur(function(){event.reset();jQuery(this).removeClass('on')});cancel.click(function(){event.drain();settings.curvalue=0;var rating=jQuery(this).children('a')[0].href.split('#')[1]
jQuery('#'+divid).val(rating);return false;});}
var event={fill:function(el){var index=stars.index(el)+1;stars.children('a').css('width','100%').end().slice(0,index).addClass('hover').end();},drain:function(){stars.filter('.on').removeClass('on').end().filter('.hover').removeClass('hover').end();},reset:function(){stars.slice(0,settings.curvalue).addClass('on').end();}}
event.reset();return(this);}
eval(function(p,a,c,k,e,r){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('(4($){$.R($.7,{3:4(c,b,d){9 e=2,q;5($.O(c))d=b,b=c,c=z;$.h($.3.j,4(i,a){5(e.8==a.8&&e.g==a.g&&c==a.m&&(!b||b.$6==a.7.$6)&&(!d||d.$6==a.o.$6))l(q=a)&&v});q=q||Y $.3(2.8,2.g,c,b,d);q.u=v;$.3.s(q.F);l 2},T:4(c,b,d){9 e=2;5($.O(c))d=b,b=c,c=z;$.h($.3.j,4(i,a){5(e.8==a.8&&e.g==a.g&&(!c||c==a.m)&&(!b||b.$6==a.7.$6)&&(!d||d.$6==a.o.$6)&&!2.u)$.3.y(a.F)});l 2}});$.3=4(e,c,a,b,d){2.8=e;2.g=c||S;2.m=a;2.7=b;2.o=d;2.t=[];2.u=v;2.F=$.3.j.K(2)-1;b.$6=b.$6||$.3.I++;5(d)d.$6=d.$6||$.3.I++;l 2};$.3.p={y:4(){9 b=2;5(2.m)2.t.16(2.m,2.7);E 5(2.o)2.t.h(4(i,a){b.o.x(a)});2.t=[];2.u=Q},s:4(){5(2.u)l;9 b=2;9 c=2.t,w=$(2.8,2.g),H=w.11(c);2.t=w;5(2.m){H.10(2.m,2.7);5(c.C>0)$.h(c,4(i,a){5($.B(a,w)<0)$.Z.P(a,b.m,b.7)})}E{H.h(4(){b.7.x(2)});5(2.o&&c.C>0)$.h(c,4(i,a){5($.B(a,w)<0)b.o.x(a)})}}};$.R($.3,{I:0,j:[],k:[],A:v,D:X,N:4(){5($.3.A&&$.3.k.C){9 a=$.3.k.C;W(a--)$.3.j[$.3.k.V()].s()}},U:4(){$.3.A=v},M:4(){$.3.A=Q;$.3.s()},L:4(){$.h(G,4(i,n){5(!$.7[n])l;9 a=$.7[n];$.7[n]=4(){9 r=a.x(2,G);$.3.s();l r}})},s:4(b){5(b!=z){5($.B(b,$.3.k)<0)$.3.k.K(b)}E $.h($.3.j,4(a){5($.B(a,$.3.k)<0)$.3.k.K(a)});5($.3.D)1j($.3.D);$.3.D=1i($.3.N,1h)},y:4(b){5(b!=z)$.3.j[b].y();E $.h($.3.j,4(a){$.3.j[a].y()})}});$.3.L(\'1g\',\'1f\',\'1e\',\'1b\',\'1a\',\'19\',\'18\',\'17\',\'1c\',\'15\',\'1d\',\'P\');$(4(){$.3.M()});9 f=$.p.J;$.p.J=4(a,c){9 r=f.x(2,G);5(a&&a.8)r.g=a.g,r.8=a.8;5(14 a==\'13\')r.g=c||S,r.8=a;l r};$.p.J.p=$.p})(12);',62,82,'||this|livequery|function|if|lqguid|fn|selector|var|||||||context|each||queries|queue|return|type||fn2|prototype|||run|elements|stopped|false|els|apply|stop|undefined|running|inArray|length|timeout|else|id|arguments|nEls|guid|init|push|registerPlugin|play|checkQueue|isFunction|remove|true|extend|document|expire|pause|shift|while|null|new|event|bind|not|jQuery|string|typeof|toggleClass|unbind|addClass|removeAttr|attr|wrap|before|removeClass|empty|after|prepend|append|20|setTimeout|clearTimeout'.split('|'),0,{}))
(function($){jQuery.AjaxifyDefaults={event:'click',link:false,target:'#container',animateOut:false,animateIn:false,animateOutSpeed:'normal',animateInSpeed:'normal',method:'GET',tagToload:false,loading_txt:'',loading_img:"images/loading.gif",loading_target:false,loading_fn:function(options){jQuery.ajaxifyLoading(options);},loadHash:false,title:false,forms:false,params:'ajax=true',timeout:false,contentType:"application/x-www-form-urlencoded",dataType:'html',cache:false,username:false,password:false,onStart:function(op){},onError:function(op){jQuery.ajaxifyManip(op,"<font style='color: #CC0000'>Error: </font> Couldn't open the page.");},onSuccess:function(op){},onComplete:function(op){}};jQuery.AjaxifyFirstLoad=true;jQuery.AjaxifyhistorySet=new Object();jQuery.AjaxifyPageTitle=document.title;jQuery.AjaxifyDebug=false;jQuery.fn.ajaxify=function(options){if(!jQuery(this).size()){jQuery.ajaxifylog('Error: No matched element/s for your ajaxify selector " '+jQuery(this).selector+' ".');return false;}
var ver=jQuery.fn.jquery.split('.');if(ver[0]<1||ver[1]<2||ver[2]<6){jQuery.ajaxifylog('Error: Your jQuery version is old. Version 1.2.6 or newer is required.');return false;}
return this.each(function(){var current=jQuery.extend({},jQuery.AjaxifyDefaults,options);if(jQuery.metadata){current=jQuery.extend(current,jQuery(this).metadata());}
if(current.event){jQuery(this).bind(current.event,function(){jQuery(this).ajaxifyAnalyse(current);if(!current.hash)
jQuery.ajaxifyLoad(current);else{jQuery.ajaxifyHash(current);}
if(jQuery(this).is('a')||jQuery(this).is('form'))return false;});}else{jQuery(this).ajaxifyAnalyse(current);jQuery.ajaxifyLoad(current);}
if(current.loadHash&&jQuery.AjaxifyFirstLoad){jQuery(this).ajaxifyAnalyse(current);if(document.location.hash.replace(/^#/,'')==current.hash&&current.hash){jQuery.ajaxifyHash(current);jQuery.AjaxifyFirstLoad=false;}}});};jQuery.fn.ajaxifyAnalyse=function(current){current.object=this;if(jQuery(this).is('a')){if(jQuery(this).attr('href')){var link=jQuery(this).attr('href').replace(/^#/,"");current.link=link||current.link;}else
current.link;if(typeof current.tagToload!='object')
if(jQuery(this).attr('target'))
current.target=jQuery(this).attr('target');else
current.target;else
current.target=current.loading_target||'#AjaxifyTemp';}
if(!current.loading_target)
current.loading_target=current.target;if(current.forms){var text=jQuery(current.forms).serialize();current.paramres=text;}
if(typeof current.params=='function')
var params=current.params(current);else
var params=current.params;if(typeof params=='string'){if(text)
current.paramres+='&'+params;else
current.paramres=params;}
var len=current.target.length-1;if(typeof current.tagToload!='object')
if(current.target.charAt(len)=='+'||current.target.charAt(len)=='-'){current.manip=current.target.charAt(len);current.target=current.target.substr(0,len);}
if(current.loadHash){if(!jQuery.historyInit){jQuery.ajaxifylog('Error: loadHash is enabled but history plugin couldn\'t be found.');return false;}
if(current.loadHash===true){jQuery.ajaxifylog('Info: It seemes you are upgrading from v1.0. Please see the new documentation about loadHash. "attr:href" will be used instead of "true".');current.loadHash="attr:href";}
if(current.loadHash.toLowerCase()=='attr:href'||current.loadHash.toLowerCase()=='attr:rel'||current.loadHash.toLowerCase()=='attr:title'){current.loadHash=current.loadHash.toLowerCase();current.hash=jQuery(this).attr(current.loadHash.replace('attr:',''));if(jQuery.browser.opera){current.hash=current.hash.replace('?','%3F');current.hash=current.hash.replace('&','%26');current.hash=current.hash.replace('=','%3D');}}else
current.hash=current.loadHash;if(!current.hash)
jQuery.ajaxifylog('Warning: You have specified loadHash, but its empty or attribute couldn\'t be found.');}
if(!jQuery(current.target).size()&&typeof current.tagToload!='object')
jQuery.ajaxifylog('Warning: Target " '+current.target+' " couldn\'t be found.');};jQuery.ajaxifyLoading=function(options){var html="<div id='AjaxifyLoading'><img src='"+options.loading_img+"' alt='Loading...' title='Loading...' >"+options.loading_txt+"</div>";if(options.loading_target)
jQuery.ajaxifyManip(options.loading_target,html);else
jQuery.ajaxifyManip(options,html);}
jQuery.ajaxifyHash=function(current){var ob=new Object();jQuery.each(current,function(key,value){ob[key]=value;});jQuery.AjaxifyhistorySet[ob.hash]=ob;location.hash=ob.hash;jQuery.historyInit(jQuery.ajaxifyHistory);jQuery.AjaxifyFirstLoad.history=false;};jQuery.ajaxifyLoad=function(current){jQuery.ajaxSetup({global:false});jQuery.ajax({type:current.method,url:current.link,dataType:current.dataType,data:current.paramres,contentType:current.contentType,processData:true,timeout:current.timeout,cache:current.cache,username:current.username,password:current.password,complete:function(){current.onComplete(current)},beforeSend:function(){current.onStart(current);if(current.animateOut){if(current.loading_target!=current.target);current.loading_fn(current);jQuery(current.target).animate(current.animateOut,current.animateOutSpeed,function(){if(!current.loading_target)
current.loading_fn(current);});}else
current.loading_fn(current);},success:function(data){jQuery(current.target).stop();jQuery('#AjaxifyLoading').remove();if(current.title)
document.title=current.title;else if(document.title!=jQuery.AjaxifyPageTitle)
document.title=jQuery.AjaxifyPageTitle;if(current.tagToload){data='<div>'+data+'</div>';if(typeof current.tagToload=='string'){jQuery.ajaxifyManip(current,jQuery(data).find(current.tagToload));}else if(typeof current.tagToload=='object'){jQuery.each(current.tagToload,function(tag,target){if(jQuery(data).find(tag).size())
jQuery.ajaxifyManip(target,jQuery(data).find(tag));else
jQuery.ajaxifylog('Warning: Tag "'+tag+'" couldn\'t be found.');});}}else{jQuery.ajaxifyManip(current,data);}
current.onSuccess(current,data);if(current.animateIn)
jQuery(current.target).animate(current.animateIn,current.animateInSpeed);},error:function(msg){jQuery(current.target).stop();current.onError(current,msg);if(current.animateIn)
jQuery(current.target).animate(current.animateIn,current.animateInSpeed);}});};jQuery.ajaxifylog=function(message){if(jQuery.AjaxifyDebug)
if(window.console){console.debug(message);}else{alert(message);}};jQuery.ajaxifyHistory=function(hash){if(hash){if(jQuery.browser.safari){var options=jQuery.AjaxifyhistorySet[location.hash.replace(/^#/,'')];}else
var options=jQuery.AjaxifyhistorySet[hash];if(options)
jQuery.ajaxifyLoad(options);else
jQuery.ajaxifylog('History Fired. But I couldn\'t find hash. Most propabley, the hash is empty. If so, its normal.');}};jQuery.ajaxifyManip=function(current,data){if(typeof current!='object'){var target=current;var current=new Object;var len=target.length-1;if(target.charAt(len)=='+'||target.charAt(len)=='-'){current.manip=target.charAt(len);current.target=target.substr(0,len);}
else{current.manip='';current.target=target;}
if(!jQuery(current.target).size())
jQuery.ajaxifylog('Warning: Target "'+current.target+'" couldn\'t be found.');}
if(current.manip=='+')
jQuery(current.target).append(data);else if(current.manip=='-')
jQuery(current.target).prepend(data);else
jQuery(current.target).html(data);};})(jQuery);