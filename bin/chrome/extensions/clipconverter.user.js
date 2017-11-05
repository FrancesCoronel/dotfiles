// ==UserScript==
// @name        ClipConverter
// @namespace   http://www.clipconverter.cc/
// @version     1.5.1
// @description This userscript assists ClipConverter in fetching download links. 
// @copyright   2015, ClipConverter
// @icon        http://www.clipconverter.cc/images/128.png
// @icon64      http://www.clipconverter.cc/images/appletouchicon.png
// @homepage    http://www.clipconverter.cc/addon
// @updateURL   http://www.clipconverter.cc/extension/clipconverter.meta.js
// @downloadURL http://www.clipconverter.cc/extension/clipconverter.user.js
// @connect-src clipconverter.cc
// @connect-src youtube.com
// @match       *://www.youtube.com/*
// @match       http://www.clipconverter.cc/*
// @run-at      document-end
// @grant       GM_xmlhttpRequest
// ==/UserScript==





if("undefined" == typeof (clipconverter)) {
	var clipconverter = {

        userUrl: 'http://www.clipconverter.cc/?ref=addon&version=151&browser=userscript',
        saveUrl: 'http://www.clipconverter.cc/addonsave?version=151&browser=userscript',
        currentMediaUrl: null,
        currentId: null,
        
		readCookie : function(document, n) {
			var cookiecontent = "";
			if(document.cookie.length > 0) {
				var cookiename = n + '=';
				var cookiebegin = document.cookie.indexOf(cookiename);
				var cookieend = 0;
				if(cookiebegin > -1) {
					cookiebegin += cookiename.length;
					cookieend = document.cookie.indexOf(";", cookiebegin);
					if(cookieend < cookiebegin) {
						cookieend = document.cookie.length;
					}
					cookiecontent = document.cookie.substring(cookiebegin, cookieend);
					return unescape(cookiecontent);
				}
			}
			return false;

		},
		
		getParam : function (document, variable){    
			 var query = document.location.search.substring(1);     
			 var vars = query.split("&");    
			  for (var i=0;i<vars.length;i++) {      
					var pair = vars[i].split("=");     
					if(pair[0] == variable){return pair[1];}  
			   }       return(false);  
		},
				
		init : function() {


			clipconverter.onPageLoad();
			
		},

		addButtons: function(document) {
				var icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyBpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNSBXaW5kb3dzIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjM5NDU0RDIwRDQ1RjExREZBNkU3Q0FCMkU2OUIzNDYwIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjM5NDU0RDIxRDQ1RjExREZBNkU3Q0FCMkU2OUIzNDYwIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6Mzk0NTREMUVENDVGMTFERkE2RTdDQUIyRTY5QjM0NjAiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6Mzk0NTREMUZENDVGMTFERkE2RTdDQUIyRTY5QjM0NjAiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz5hHYvlAAAC9ElEQVR42nxTTUhUURQ+99434+ToODM2jRZDauJikiIoi4qiRdCiRRFEVBgR/cBAtApqUYugXZsKhBYuJCIrCGonSYiCi4JCrIhQkf7U9M2bcd68n/vXec8xgqAL37vnnnvP975zzr2kUChAMCilkEgkQsTj8XrG2B1091Wr1QnHcUBKCcFsWRbYtg2EkJU4+HfEhBB3Xdc9hcEJzjn8bxh/L5A15fv+A8/zDuPSQtxD35LWegLxFO3x/xFk8a8PUeZetIs1Xw7RjoG7cT6DuI/2LYRYTcFQnhcanNIM5taNGz4udSAIP6Jmc9Ca4d51VEKUUjf+KKg0pVcSN39N2pXKCV/KfuReiy4boYgQJayw0JTGcR2QXMWCDiNGwrTzIx9AUQYb341CevglFB1nGxdyAIPamJLnIZ15TX2XGWWriRuR9RLIBVQhkOBUQMDWnS2gVk2LuQ6tpIDI99k5p1Qa85Z+bbW37HhkXr75w8ltWvaS6XlqLs6QxfnnNhet2KmviArLnLkEyhdHiZSZcmtu1sxvB96yYUFPfX7hd2+f9bu23hbMOGh3bR6qtuRAO46m32bfSqVsVKJZ8lgvyKrTLMqVfuwjaMMQYmNHhO/c78nshgwvWsf5UukcUyItE8khqzOvlefq2NcpHdagbXA4vFX+YvGZ5vIYiRoVwqgFhuGDVI3adRuU1HiExIxU4wDEohe5z92IuYD90dhGRcJOSe5fE2apB7ly6I8F5GEXsAPBjIcdv2j2GukkIQ31vbw5ixU0gLnv34DCI7Q5ayrOx3h5eY9yqlnlehSlEuk6GqGk60ZU1WGSyydQFx/lM9Pgf/4IZPUxRDvzEO05ADKWWEsaUqdBeoewWR3guWkNOgWROoFqrjCQfXLmE3jjr0AtW0BYjUDXNJM1caDtecDfE8kia2h+V5+m0dN0fuak/DIxqL5P/zkbFhEJgnwbEXW1txFwUh1wMqMK+44UiDn3EybHH+ObbgjrEVxtgArC+S3AAPFbkuCGsMvQAAAAAElFTkSuQmCC';
				var clipconverterpath = clipconverter.userUrl + "&url=" + encodeURIComponent(document.URL);
                var div_embed = null;
                var spanclass="";
                var buttonclass = "";

				if(document.getElementById('watch-like-dislike-buttons')) {
					var div_embed = document.getElementById('watch-like-dislike-buttons');
					var buttonclass = "yt-uix-button yt-uix-button-text yt-uix-tooltip";
					var spanclass="";
				} else if(document.getElementById('watch-headline-user-info')) {
					var div_embed = document.getElementById('watch-headline-user-info');
					var buttonclass = "yt-uix-button yt-uix-button-default yt-uix-tooltip";
					var spanclass="yt-uix-button-group";
				} else if(document.getElementById('watch8-sentiment-actions')) {
					var div_embed = document.getElementById('watch8-sentiment-actions');
					var buttonclass = "yt-uix-button yt-uix-button-default yt-uix-tooltip";
					var spanclass="yt-uix-button-group";
				}


				var target= '_blank';


				if(div_embed) {
					div_embed.innerHTML = ' <span id="clipconverter" class="' + spanclass + '"><a href="' + clipconverterpath + '" target="' + target + '"><button class="start ' + buttonclass + '" type="button" title="Record video with ClipConverter"><img alt="" class="" style="" src="' + icon + '"> <span class="yt-uix-button-content"><strong>ClipConverter</strong></span></button></a>' + '<a href="' + clipconverterpath + '&format=mp3" target="' + target + '"><button class="' + buttonclass + '" type="button" title="Record audio as MP3">MP3</span></button></a>' + '<a href="' + clipconverterpath + '&format=mp4" target="' + target + '"><button class="end ' + buttonclass + '" type="button" title="Record video as MP4">MP4</span></button></a></span>' + div_embed.innerHTML;
				}
            

            
	
		},

		onPageLoad : function() {
	

			if(document.body && document.domain == 'www.youtube.com') {

					setInterval(clipconverter.check, 1000);
                    clipconverter.check();

				
			

			} else if(document.body && document.domain == 'www.clipconverter.cc') {

	
				var input_browser = document.getElementById('clipconverter_addon_browser');
				var input_version = document.getElementById('clipconverter_addon_version');
				
				if(input_browser && input_version) {
					input_browser.value='Userscript';
					input_version.value='1.5.1';
				}

                window.addEventListener('message', function(event) {

                    if(event.data && event.data.youtube) {
                        var url = "https://www.youtube.com/watch?v=" + event.data.youtube;
                        var request = {};
                        request.url = url;
                        request.method="GET";
                        request.onload = function (response) {
                            if(/<script>var ytplayer(.*?)<\/script>/i.test(response.responseText)) {
                                window.postMessage({'url' : url, 'player': /<script>var ytplayer(.*?)<\/script>/i.exec(response.responseText)[1], 'code': response.status}, "http://www.clipconverter.cc/");
                            } else {
                                window.postMessage({'url' : url, 'error': 'Player not found', 'code': response.status}, "http://www.clipconverter.cc/");
                            }
                        };
                        request.onerror = function (response) {
                            window.postMessage({'url' : url, 'error': 'network error', 'code': -1}, "http://www.clipconverter.cc/");
                        };
                        GM_xmlhttpRequest(request);
                    }

                }, false);

                
                
			}

		},
        
        
        check: function() {
            if(clipconverter.currentMediaUrl != document.URL  && typeof ytplayer != 'undefined' && ytplayer && ytplayer.config &&  ytplayer.config.args && clipconverter.currentId != ytplayer.config.args.video_id) { 
                      // new video detected
                            clipconverter.currentId = ytplayer.config.args.video_id;
                            clipconverter.currentMediaUrl = document.URL;
							clipconverter.addButtons(document);
                            clipconverter.saveUrlMap();
			}
        
        },


    saveUrlMap: function() {
 
        var title = '';
		var urlmap = '';
        var cookie = '';
        var sts = '';
        var channel = '';
		if(typeof ytplayer != 'undefined' && ytplayer && ytplayer.config &&  ytplayer.config.args && ytplayer.config.args.url_encoded_fmt_stream_map) {
			urlmap = ytplayer.config.args.url_encoded_fmt_stream_map;
            
            if(ytplayer.config.args.adaptive_fmts)
                urlmap += "," + ytplayer.config.args.adaptive_fmts;
            
            result = /"sts":(\d+)/.exec(document.body.innerHTML);
            if(result) 
                sts = result[1];
            
            channel = ytplayer.config.args.author;

            title = (document.title);
            if(clipconverter.readCookie(document, "goojf")) {
                cookie = "goojf=" + clipconverter.readCookie(document, "goojf");
            }

            var gm_xhr = {};
            gm_xhr.url = clipconverter.saveUrl;
            gm_xhr.method="POST";
            gm_xhr.headers = {};
            gm_xhr.headers["Content-Type"]="application/x-www-form-urlencoded";
            gm_xhr.data = "urlmap=" + encodeURIComponent(urlmap) + "&title=" + encodeURIComponent(title) + "&cookie=" +  encodeURIComponent(cookie) + "&sts=" +  encodeURIComponent(sts) + "&mediaurl=" +  encodeURIComponent(document.URL) + "&channel=" +  encodeURIComponent(channel);

            gm_xhr.onload = function(response) {
                if(clipconverter.getParam(document, 'clipconverter')=='autostart') {
                    document.location.href = clipconverter.userUrl + "&url=" + encodeURIComponent(document.URL);
                }
            };

            GM_xmlhttpRequest(gm_xhr);
        }
        
    }
    
	};
    
}
clipconverter.init();