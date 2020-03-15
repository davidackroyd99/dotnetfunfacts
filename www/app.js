var app = new Vue({
    el: '#app',
    data: {
        facts: [],
        tags: [],
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
        }
    }
});
