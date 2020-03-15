var app = new Vue({
    el: '#app',
    data: {
        facts: [],
        tags: [],
        selectedTags: [],
        currentFact: window.location.hash.substr(1)
    },
    created: function() {
        fetch("generated/data/index.json", {credentials: 'same-origin'})
            .then(response => response.json())
            .then(data => {
                this.facts = data.facts;

                for(let i = 0; i < this.facts.length; i++) {
                    for(let j = 0; j < this.facts[i].metadata.tags.length; j++) {
                        if(!this.tags.includes(this.facts[i].metadata.tags[j]))
                            this.tags.push(this.facts[i].metadata.tags[j]);
                    }
                }
            });
    },
    methods: {
        setCurrentFact: function(url) {
            if(this.currentFact != url) {
                this.currentFact = url;
            }
            else {
                this.currentFact = '';
            }

            window.location.hash = url;
        },
        selectTag: function(tag) {
            if(!this.selectedTags.includes(tag)) {
                this.selectedTags.push(tag);
            }
            else {
                this.selectedTags.splice(this.selectedTags.indexOf(tag), 1);
            }
        },
        clearTags: function() {
            this.selectedTags = [];
        },
        getFacts: function() {
            if(this.selectedTags.length == 0) {
                return this.facts;
            }
            else {
                let taggedFacts = [];

                for(let i = 0; i < this.facts.length; i++) {
                    let addToCollection = true;

                    for(let j = 0; j < this.selectedTags.length; j++) {
                        if(!this.facts[i].metadata.tags.includes(this.selectedTags[j])) {
                            addToCollection = false;
                            break;
                        }
                    }

                    if(addToCollection) {
                        taggedFacts.push(this.facts[i]);
                    }
                }

                return taggedFacts;
            }
        }
    }
});
