(function($) {
  $(document).ready(function() {
    $('.service-item a').click(function(e) {
      e.preventDefault();
      $('.right-pane').load($(this).attr('href') + '?no_layout=true');
    });
  });
})(jQuery);
