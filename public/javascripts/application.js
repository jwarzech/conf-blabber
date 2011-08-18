jQuery.ajaxSetup({  
    'beforeSend': function (xhr) {xhr.setRequestHeader("Accept", "text/javascript")}  
});

$(function () {
	if($('#tweets').length > 0) {
		setTimeout(updateTweets, 10000);
	}
});

function updateTweets() {	
	var after = $('#latest_tweet').val();
	$.getScript('/tweets.js?after=' + after);
	setTimeout(updateTweets, 10000);
}