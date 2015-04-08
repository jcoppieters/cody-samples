$(document).ready(function() {

  var $form = $("form");

  if ($form.length > 0) {
    $form.validate();

    $("form #submitter").click(function() {
      $("form #request").val("send");
      $form.submit();
    });
  }
});