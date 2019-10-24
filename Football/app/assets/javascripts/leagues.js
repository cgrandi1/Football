// $(function () {
//     console.log('leagues.js is loaded...')
//     listenForClick()
// });



// $(function () {
//     $(".js-more").on("click", function(e) {
//      e.preventDefault();
//         let id = $(this).data("id");
//         $.get(`/users/${id}/leagues/cost`, function(cost){
//             $.get(`users/${id}/leagues/people_in_league`, function(people_in_league){
//                 var texting = "<p>" + cost + "</p><p>" + people_in_league + "</p>";
//                 $('#leagues').text(texting);
//             }); 
//         });
//     });
// });

$(function () {
  $(".js-more").on("click", function(e) {
   e.preventDefault();
      let id = $(this).data("id");
      $.get(`/users/${id}/leagues.json`, function(data){
        let leagues = data
        for(l = 0; l< leagues.length; l++){
          console.log(leagues)
          $('#leagues').append(`<p> This league cost's: ${leagues[l].cost} <br> This league has ${leagues[l].people_in_league} people <br> You have ${leagues[l].teams} amount of teams </p>`)
        }
      });
  });
});


//we need an id for each button.
//we need to select that button, attach an event listener
//when clicked send a request to the show action
//use the response to append the league to the DOM

//add leagues on page
//get /"users/id/leagues/leage/new"
//when clicked, get the form
//create the league and append it on the page


  $(function () {
    $('form').submit(function(event) {
      event.preventDefault();
 
      var values = $(this).serialize();
 
      var posting = $.post('/leagues', values);
 
      posting.done(function(data) {
        console.log(data)
        $("#legaueName").text(data["name"]);
        $("#leagueCost").text(data["cost"]);
        $("#leaguePeopel_In_League").text(data["people_in_league"]);
        $('#productResult').append(`<p> Name: ${data.name}`)
      });
    });
  });

  $(function(){
    $(document).ready(function(data){
      

    }

  })

  $(function () {
    $(".js-next").on("click", function(event) {
        event.preventDefault();
        var nextId = parseInt($(".js-next").attr("data-id")) + 1;
        $.get("/leagues/" + nextId + ".json", function(data) {
            $(".leagueName").text(data["name"]);
            $(".leagueCost").text(data["cost"]);
            $(".leaguePeopleInLeague").text(data["people_in_league"]);
            $(".js-next").attr("data-id", data["id"]);
      });
    });
  });


class League {
    constructor(obj) {
        this.id = obj.id
        this.name = obj.name
        this.cost = obj.cost
        this.people_in_league = obj.people_in_league 
        
    };
};

