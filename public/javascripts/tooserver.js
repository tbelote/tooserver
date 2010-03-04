function updatePage() {
	var r = new Ajax.Request('/monitor/json', {
  		onSuccess: function(transport, json) {
	    	var len = json.length
			for (var i = 0; i < len; i++) {
				var key = json[i][0]
				var id = key.split(' ')[1]
				var value = json[i][1]
				var div = document.getElementById(id)
				//alert("id: "+id+" div: "+div)
				if (div.innerHTML != value) {
					div.innerHTML = value
					var e = new Effect.Highlight(div)
				}
			}
  		}, method: "get"
	});
}

function onLoad() {
	setInterval(updatePage, 12000)	
}