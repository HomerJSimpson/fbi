$(function() {
	$.ajax({
		url: "https://query.yahooapis.com/v1/public/yql",
		dataType: "jsonp",
		data: {
			q : 'select * from html where url="http://www.fbi.gov/wanted/kidnap/@@wanted-group-listing" and\n'
			       + "xpath='//*[@id=\"content\"]/div/div'",
			format : 'json'
		},
		success : function(data) {
			console.dir(data);
		}
	});
});
