$(document).ready(function(){
  $('#search').keyup(function() {
    // Ajax call that parses search value
    $.ajax({
      type: "GET",
      url: '/search',
      data: { search: $(this).val() },
      dataType: "script"

    });
  });
});