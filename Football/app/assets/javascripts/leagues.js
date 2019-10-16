$(function () {
    console.log('posts.js is loaded...')
    listenForClick()
});

function listenForclick(){
    $('button#league-data').on('click', function(event) {
        event.preventDefault()
        getLeagues()
    })
};

function getLeagues() {
    %.ajax({
        url: 'http://localhost3000/leagues'
        method: 'get'
        datatype: 'json'

    }).done(function(data) {
        console.log(data)
        let myLeague = new League(data[0])
        let myLeagueHTML = myLeague.leagueHTML()
        $('div#ajax-leagues').html(myLeagueHTML)
        document.getElementById('ajax-leagues').innerHTML += myLeagueHTML
    });
}

class League {
    constructor(obj) {
        this.id = obj.id
        this.name = obj.name
        this.cost = obj.cost
        this.people_in_league = obj.people_in_league    
        
    }
}