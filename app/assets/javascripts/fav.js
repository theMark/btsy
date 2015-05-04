
// Have to do the var ready thing beacuse of turbolinks
var ready;
ready = function() {

  // Add a favorite
  function addFav(e) {
    console.log($(this));
    e.preventDefault();
    var id = $(this).data('id');
    var url = '/listings/' + id + '/favorite';
    $.ajax({
      url: url,
      type: 'put',
      success: function(){
        $('#fav-' + id)
          .closest('a')
          .addClass('active')
          .off('click')
          .on('click', removeFav)
        ;
        console.log("success in add function");
      },
      error: function() {
        console.log("error in add function");
      }
    });
  }

  // Remove a favorite
  function removeFav(e) {
    console.log($(this));
    e.preventDefault();
    var id = $(this).data('id');
    var url = '/listings/' + id + '/unfavorite';
    $.ajax({
      url: url,
      type: "post",
      dataType: "json",
      data: {"_method":"delete"},
      success: function(){
        $('#fav-' + id)
          .closest('a')
          .removeClass('active')
          .off('click')
          .on('click', addFav)
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
   $('a.fav-link').each( function() {
    var status = $(this).hasClass('active');
    if (status) {
      $(this).on('click', removeFav);
    } else {
      $(this).on('click', addFav);
    }
    // console.log(status)
   });
  }

  // Lets get the 'favorites' party started
  attachFavHandler();


};

$(document).ready(ready);
$(document).on('page:load', ready);
