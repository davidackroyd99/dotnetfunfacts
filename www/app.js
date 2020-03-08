var app = new Vue({
    el: '#app',
    data: {
        facts: [],
        currentFact: 0
    },
    created: function() {
        fetch("generated/data/index.json", {credentials: 'same-origin'})
            .then(response => response.json())
            .then(data => {
                this.facts = data.facts;
            });
    },
    methods: {
        setCurrentFact: function(id) {
            this.currentFact = id;
            console.log(id);
        }
    }
});
