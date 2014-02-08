$(document).ready(function() {



  $('.image-container').mouseenter(function(e){
    $(e.currentTarget.children[1]).show();
  })

  $('.image-container').mouseleave(function(e){
    $(e.currentTarget.children[1]).hide();
  })

  $('.image-delete').click(function(e){
    console.log($(e.currentTarget).parent());
    $photoContainer = $(e.currentTarget).parent();
    $photoContainer.remove();
    photoId = $photoContainer.data("photo-id");
    $.ajax({
      url: '/photos/' + photoId,
      type: "DELETE"
    })
  })



  var username = $('#user_data').data('username');

  $('#notes_button').click(function(){
    // set notes button jQuery object
    var $btn = $(this);
    $btn.button('loading');

    var resetButton = function(){$btn.button('reset')}

    $dataField = $('#notes_field');

    var postObject = getPostObject($dataField, 'text', 'notes');

    sendPostRequest(postObject, function(){
      window.setTimeout(resetButton, 1000) // Add pause for effect
    });

  });

  // Returns a block of information to pass to sendPostRequest().
  // Pass in the information field jQuery object and name of the field
  function getPostObject($fieldObject, colName, routeName){

    var data = {};
    data[colName] = $fieldObject.val()

    // url for post request
    var url = '/' + username + '/' + routeName;

    // Data to send to server
    var dataPost = {
        username: username,
        data: data
    };

    return {url: url, dataPost: dataPost};
  }

  // Send post request
  function sendPostRequest(args, callback){
    $.post(args.url, args.dataPost, function(response){
    }).done(callback());
  }

});