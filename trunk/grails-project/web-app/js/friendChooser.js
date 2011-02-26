/* Esto es una porqueria porque por ahora puede usarse una sola "instancia" a la vez */
var friendChooser;
document.observe("dom:loaded", function() {
    friendChooser = new FriendChooser({listDiv: 'chosenFriends', chosenClass: 'fbFriendChosen'});
});

var FriendChooser = Class.create({

    options: undefined,
    $updateElement: undefined,
    chosen: [],

    initialize: function(options) {
        this.options = options;
        this.$updateElement = $(options.listDiv);
        this.chosen = [];
        //this.update();
    },

    toggle: function(_this, friend) {
        var found = this.findFriend(friend);
        if (!found) {
            this.chosen.push(friend);
            this.setFriendChosen(_this);
        } else {
            for (i = 0; i < found.length; i++) {
                this.removeFriend(found[i]);
                this.setFriendNotChosen(_this);
            }
        }
        this.updateList();
    },

    findFriend: function(friend) {
        var returnArray = [];
        for (i = 0; i < this.chosen.length; i++) {
            if (this.chosen[i].id == friend.id) {
                returnArray.push(i);
            }
        }
        if (returnArray.length < 1) {
            return false
        }
        return returnArray;
    },

    setFriendChosen: function(element) {
        element.addClassName(this.options.chosenClass);
    },

    setFriendNotChosen: function(element) {
        element.removeClassName(this.options.chosenClass);
    },

    updateList: function() {
        var chosenDiv = new Element('div');
        for (i = 0; i < this.chosen.length; i++) {
            var $friendDiv = new Element('div', { 'class': 'playerLine'})
                    .update(this.chosen[i].name);
            chosenDiv.appendChild($friendDiv);
        }
        this.$updateElement.update(chosenDiv);
    },


    update: function() {
        if (!this.$clickClass || !this.options)
            return;
        this.$clickClass = $$('.' + options.clickClass);
        this.$clickClass.observe(click, toggle);
    },

    removeFriend: function(index) {
        this.chosen.splice(index, 1);
    }
});

