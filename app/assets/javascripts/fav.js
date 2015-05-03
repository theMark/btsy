
// Have to do the var ready thing beacuse of turbolinks
var ready;
ready = function() {

  // Add a favorite
  function addFav() {
    var id = $(this).data('id');
    var url = '/listings/' + id + '/favorite';
    console.log(url + " put url");
    $.ajax({
      url: url,
      type: 'put',
      // data: {'id': 2},
      success: function(){
        $('this')
          .addClass('active')
          .unbind('click')
          .bind('click', removeFav)
        ;
        console.log("success in add function");
      },
      error: function() {
        console.log("error in add function");
      }
    });
  }

  // Remove a favorite
  function removeFav() {
    var id = $(this).data('id');
    var url = '/listings/' + id + '/unfavorite';
    console.log(url + " post/delete url");
    $.ajax({
      url: url,
      type: "post",
      dataType: "json",
      data: {"_method":"delete"},
      success: function(){
        $('this')
          .removeClass('active')
          .unbind('click')
          .bind('click', addFav)
        ;
      console.log("success in remove function")
      },
      error: function() {
        console.log("error in remove function")
      }
    });
  }

  // Attach the add or remove event handler to favorite links
  function attachFavHandler() {
   $('a#fav').each( function() {
    var status = $(this).hasClass('active');
    if (status) {
      $(this).bind('click', removeFav);
      console.log("cheese true");
    } else {
      $(this).bind('click', addFav);
      console.log("cheese false");
    }
    console.log(status)
   });
  }

  // Lets get the 'favorites' party started
  attachFavHandler();


};

$(document).ready(ready);
$(document).on('page:load', ready);
