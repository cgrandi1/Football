// $(function () {
//     console.log('leagues.js is loaded...')
//     listenForClick()
// });



$(function () {
    $(".js-more").on("click", function(e) {
     e.preventDefault();
        let id = $(this).data("id");
        $.get(`/users/${id}/leagues/cost`, function(cost){
            $.get(`users/${id}/leagues/people_in_league`, function(people_in_league){
                var texting = "<p>" + cost + "</p><p>" + people_in_league + "</p>";
                $("#body-" + id).text(texting);
            }); 
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
      });
    });
  });


  $(document).ready(function(){
      var comment = []
      for(var i=0; i<comment.length;i++){
          render(comment[i])
          
      };

    function render(data){
      $('#container').append(data)
    };

    $('addComment').click(function(){
      $.post(function(){
        var addObj= {
            "date": $('#date').val(),
            "body": $('#bodyText').val()
        }
        console.log(addObj);
        comment.push(addObj);
        render(addObj);
      });
    });

  // $(function(){
  //   $('.addComment').on("click", function(data){
  //     $('#container').append(data)
  
  //   })
  // })
  
// class League {
//     constructor(obj) {
//         this.id = obj.id
//         this.name = obj.name
//         this.cost = obj.cost
//         this.people_in_league = obj.people_in_league 
        
//     };
// };

