var FriendChooser = Class.create({

    options: undefined,
    $updateElement: undefined,
    chosen: [],

    initialize: function(options) {
        this.options = options;
        this.$updateElement = $(options.listDiv);
        this.chosen = [];
    },

    toggle: function(_this, friend) {
        var found = this.findFriend(friend);
        if (!found && (this.chosen.length < this.options.maxFriends)) {
            this.chosen.push(friend);
            this.setFriendChosen(_this);
            this.onChange();
        } else {
            for (i = 0; i < found.length; i++) {
                this.removeFriend(found[i]);
                this.setFriendNotChosen(_this);
                this.onChange();
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
            /* TODO Que cada nombre sea un link para borrarlo de la lista */
            var $friendDiv = new Element('div', { 'class': 'playerLine'})
                    .update(this.chosen[i].name);
            chosenDiv.appendChild($friendDiv);
        }
        this.$updateElement.update(chosenDiv);
    },

    removeFriend: function(index) {
        this.chosen.splice(index, 1);
    },

    onChange: function() {
        if (typeof this.options.onChange == 'function') {
            this.options.onChange(this.chosen);
        }
    }
});

