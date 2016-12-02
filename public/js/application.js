$(document).ready(function() {
  $('form#add-pro').submit(function(event){
  	event.preventDefault();

  	var url = $(this).attr("action");
  	var data = $(this).serialize();
  	var input = $(this).find('#user_input');

  	$.post(url,data,function(response){
		  $('#pros').append(response);
		  input.val("");
  	});

  });

  $('form#add-con').submit(function(event){
    event.preventDefault();

    var url = $(this).attr("action");
    var data = $(this).serialize();
    var input = $(this).find('#user_input');

    $.post(url,data,function(response){
      $('#cons').append(response);
      input.val("");
    });

  });

  $('a#delete').click(function(event){
  	event.preventDefault();
  	var url = $(this).attr("href");
  	var list = $(this).closest('li');
  	$.get(url,function(response){
  		list.remove();
  	});
  });





  $('form#result').submit(function(event){
  	event.preventDefault();
  	var url = $(this).attr("action");

  	$.get(url,function(response){
      $('#button').val("See Result Again");
      $('.bar-container').show();
      $('#pro-bar').show();
      $('#con-bar').show();
  		$('.result-box').empty();
		  $('.result-box').append(response.result);
      $('#pro-bar').css('width',response.pros_percentage);
      $('#pro-bar').text("Pros "+ response.pros_percentage);
      $('#con-bar').css('width',response.cons_percentage);
      $('#con-bar').text("Cons "+ response.cons_percentage);


  	});

  });


  $('#user_input').keypress(function(event){
    if(event.keyCode==13){
      $(this).find('#submit').click();
    }
  });

  $('.reset').submit(function(event){
    event.preventDefault();
    var url = $(this).attr("action");
    $.ajax({
      url:url,
      type:"delete"
    })
    .done(function(){
    $('.bar-container').hide();
    $('#pros').text("");
    $('#cons').text("");
    $('.result-box').empty();
    $('form.see-result').find('#button').val("See Result");
    });

  });


});
	