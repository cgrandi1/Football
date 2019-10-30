// $(function () {
//     console.log('leagues.js is loaded...')
//     listenForClick()
// });



// $(function () {
//   $(".create-league").on("click", function(e){
//     e.preventDefault();
//     let id = $(this).data("id");
//     $.get(`/users/${id}/leagues/new.json`)
//   });
// });

$(function () {
  $(".js-more").on("click", function(e) {
   e.preventDefault();
      let id = $(this).data("id");
      $.get(`/users/${id}/leagues.json`, function(data){
        let leagues = data
        for(l = 0; l< leagues.length; l++){
          console.log(leagues)
          $('#leagues').append(`<p> League Name: ${leagues[l].name} <br> This league cost's: ${leagues[l].cost} <br> This league has ${leagues[l].people_in_league} people </p>`)
        }
      });
  });
});

// $(function(){
//   $(".show-league").on("click", function(e){
//     e.preventDefault();
//     let id = $(this).data("id");
//     $.get(`/leagues/${id}.json`)

//   });
// });



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
        $("#legaueName").text(data["name"]);
        $("#leagueCost").text(data["cost"]);
        $("#leaguePeopel_In_League").text(data["people_in_league"]);
        $('#productResult').append(`<p> Name: ${data.name}`)
      });
    });
  });



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
      this.name = obj.name;
      this.cost = obj.cost;
      this.people_in_league = obj.people_in_league; 
      this.created_at = obj.created_at;
      this.user_id = obj.user_id
        
    };
};

League.prototype.showLi = function () {
  let c = `<li> This League was created on ${this.created_at}.</li>`
  $('#created-at').append(c)
};

// let p = new League();
// console.log(p)

// var p = new League();
// console.loge(p)

