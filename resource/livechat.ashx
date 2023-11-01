window["onlinehelpmain"] = (function (bundleJsName) {
	window["OnlineHelpAPI"] = window["OnlineHelpAPI"] || {};
	var api = window["OnlineHelpAPI"];
	api.call = function (name) {
		return (new Function('return ' + name)).call();
	};
	api.chat_buttons = api.chat_buttons || [];
	window["brandingNameLowerCase"] = "onlinehelp";
	window["brandingName"] = "OnlineHelp";
	window.chatWindowInit && window.chatWindowInit();
	return function (main, standby, vue, others) {
		api.main = main;
        api.standby = standby;
		api.vue = vue;
		api.others = others;

		var iframe = document.createElement('iframe');
		iframe.style.display = 'none';
		iframe.id = "onlinehelp-iframe";
		iframe.title = "onlinehelp-iframe";
		document.body.appendChild(iframe);
		var innerDoc = iframe.contentDocument;
		innerDoc.open();
		var prefix = vue + '/visitorside/js/';
		try {
			var names = JSON.parse(bundleJsName);
			if (Array.isArray(names)) {
				var src = '';
				if (names.length >= 1) {
					for(var i = 0; i < names.length; i += 1) {
						src = src + '<script src="' + prefix + names[i] + '" defer type="module"></script>';
					}
				}
				innerDoc.write('<!doctype html><head>' + src + '</head><body></body>');
			}
		} catch(e) {
			var src = prefix + bundleJsName;
			innerDoc.write('<!doctype html><head><script src="' + src + '" async type="text/javascript" charset="utf-8"></script></head><body></body>');
		}
		innerDoc.close();
	};
}('["common.453e2304.js","vendor.e5de6554.js","bundle.5c19e1fb.js"]'));
window["onlinehelpmain"]('https://chat.livehelp100service.com','https://chat.livehelp100service.com','https://vue.livelyhelp.chat');
delete window["onlinehelpmain"];