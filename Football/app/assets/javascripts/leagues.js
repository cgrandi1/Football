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
        url: 'http://localhost3000/users/:id/leagues'
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

let comments = prompt("Hello")
document.getElementById("review").innerHTML = comments;



static newLeagueForm(){
    return (
        <strong>New League Comment</strong>
            <form>
                <input id="league-name" type="text" name="name" ></input><br>
                <input id="text" name="content"></input><<br>
                <input id="submit"></input>
                
            </form>
        )

});





