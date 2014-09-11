// helpers
// TODO: put in separate file
function formatTime(time) {
  var format = ((time.getHours() > 0) ? time.getHours() + "hr " : "") +
    time.getMinutes() + "min " +
    time.getSeconds() + "sec";
  return format;
}

function setDynamicTimer(dealQuery) {
  setInterval(setTimes, 1000);

  function setTimes() {
    var now = new Date();
    $(dealQuery).each(function () {
      var timeLeft = new Date($(this).data("time")) - now;

      // the deal is expired
      if (timeLeft < 0) {
        $(this).find('.days-val, .days-tag, .day-val, .day-tag, .hour-val, .hour-tag, .min-val, .min-tag, .sec-val, .sec-tag').hide();
        $(this).find('.expired-tag').show();
        return $(this).addClass('expired');
      }

      var sec = Math.floor(timeLeft / 1000) % 60;
      var min = Math.floor(timeLeft / 60000) % 60;
      var hour = Math.floor(timeLeft / 3600000) % 60;
      var day = Math.floor(timeLeft / 62400000);


      if (day > 1) {
        $(this).find('.day-val, .day-tag').hide();
        $(this).find('.days-val').show();
        $(this).find('.days-val').html(day);
        $(this).find('.hour-val').html(hour);
        $(this).find('.min-val').html(min);
        $(this).find('.sec-tag').hide();
      } else if (day == 1) {
        $(this).find('.days-val, .days-tag').hide();
        $(this).find('.day-val').show();
        $(this).find('.day-val').html(day);
        $(this).find('.hour-val').html(hour);
        $(this).find('.min-val').html(min);
        $(this).find('.sec-tag').hide();
      } else {
        $(this).find('.days-val, .days-tag, .day-val, .day-tag').hide();
        if (hour == 0)
          $(this).find('.hour-val, .hour-tag').hide();
        else
          $(this).find('.hour-val, .hour-tag').show();
        $(this).find('.hour-val').html(hour);
        $(this).find('.min-val').html(min);
        $(this).find('.sec-val').html(sec);
        $(this).find('.sec-tag').show();
      }
    });
  }

  $(dealQuery).find('.expired-tag').hide();
  setTimes();
}

$(document).ready(function() {
  // dynamic deal timers
//  setDynamicTimer(".deal-time");

  $("#navicon").click(function(){
    $(".header-nav").slideToggle("slow");
    return false;	
  });

  if ($("#dealvan").length > 0) {
    $("#dealvan").datepicker({
      defaultDate: "null",
      changeMonth: true,
      numberOfMonths: 1,
      dateFormat: "dd-mm-yy",
      onClose: function( selectedDate ) {
        $("#dealtot").datepicker( "option", "minDate", selectedDate );
      }
    });
  }
  
  if ($("#dealtot").length > 0) {
    $("#dealtot").datepicker({
      defaultDate: "+1w",
      changeMonth: true,
      numberOfMonths: 1,
      dateFormat: "dd-mm-yy",
      onClose: function( selectedDate ) {
        $("#dealvan").datepicker( "option", "maxDate", selectedDate );
      }
    });
  }
  
  if ($("#dealdate").length > 0) {
    $("#dealdate").datepicker({
      defaultDate: "null",
      changeMonth: true,
      numberOfMonths: 1,
      dateFormat: "dd-mm-yy"
    });
  }
  
  $(".showpassword").each(function(index,input) {
    var $input = $(input);
      $(".showpasswordcheckbox").click(function() {
        var change = $(this).is(":checked") ? "text" : "password";
        var rep = $("<input type='" + change + "' />")
          .attr("id", $input.attr("id"))
          .attr("name", $input.attr("name"))
          .attr("class", $input.attr("class"))
          .val($input.val())
          .insertBefore($input);
        $input.remove();
        $input = rep;
      })
  });

  $( "#dialog-form" ).dialog({
    autoOpen: false,
    height: 'auto',
    width: 300,
    modal: true,
    resizable: false,
    draggable: false
  });
  $("#loginlink").click(function() {
    $("#dialog-form").dialog("open");
  });
  $("#changeloginlink").click(function() {
    $("#dialog-form").dialog("open");
  }); 
  $(".dialog-cancel-link").click(function() {
    $("#dialog-form").dialog("close");
  });

  $(".printlink").click(function(){
    window.print();
    return false;
  });
  
});
