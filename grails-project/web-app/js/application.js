var Ajax;
if (Ajax && (Ajax != null)) {
	Ajax.Responders.register({
	  onCreate: function() {
        if($('spinner') && Ajax.activeRequestCount>0)
          Effect.Appear('spinner',{duration:0.5,queue:'end'});
	  },
	  onComplete: function() {
        if($('spinner') && Ajax.activeRequestCount==0)
          Effect.Fade('spinner',{duration:0.5,queue:'end'});
	  }
	});
}

function replaceQuery(_this) {
    _this.value = "";
    _this.style.color = "black";
}

function teamAjaxOnClick(_this, teamId, matchId) {
    new Ajax.Updater(
    {
        success: 'teamList'+ teamId,
        failure:'message'
    },
            _this.href,
    {
        asynchronous:true,
        evalScripts:true,
        parameters:'team.id=' + teamId + '&match.id=' + matchId,
        on500: showMessages
    });
    return false;
}

function showMessages() {
    $('message').show();
}

var Popup = {
    open: function(options)
    {
        this.options = {
            url: '#',
            width: 300,
            height: 300,
            windowName: ''
        }
        Object.extend(this.options, options || {});
        return window.open(this.options.url, this.options.windowName, 'width='+this.options.width+',height='+this.options.height);
    }
};

function highlightStar(_this) {
    var trimPosition = _this.src.lastIndexOf("/");
    _this.src = _this.src.substring(0, trimPosition + 1) + 'star_icon_highlight.png';
}

function dimStar(_this) {
    var trimPosition = _this.src.lastIndexOf("/");
    var filename = 'star_icon' + (_this.alt == "*" ? '' : '_gray') + '.png';
    _this.src = _this.src.substring(0, trimPosition + 1) + filename;
}