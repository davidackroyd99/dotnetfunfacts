var app = new Vue({
    el: '#app',
    data: {
        facts: [],
        currentFact: ''
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
            this.currentFact = url;
            history.pushState(null, '', url);
        }
    }
});
