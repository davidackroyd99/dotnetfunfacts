var app = new Vue({
    el: '#app',
    data: {
        facts: [],
        currentFact: window.location.hash.substr(1)
    },
    created: function() {
        fetch("generated/data/index.json", {credentials: 'same-origin'})
            .then(response => response.json())
            .then(data => {
                this.facts = data.facts;
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
