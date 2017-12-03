(function ($) {
  $(document).ready(function() {
    $(document).on('click', '.order-extra-fields .plus-btn', function (e) {
      e.preventDefault();

      var field = $(this).closest('.order-extra-fields').find('.quantity-field');
      var value = parseInt(field.val());

      if (isNaN(value)) {
        field.val(1);
      } else {
        field.val(value + 1);
      }
    });

    $(document).on('click', '.order-extra-fields .minus-btn', function (e) {
      e.preventDefault();

      var field = $(this).closest('.order-extra-fields').find('.quantity-field');
      var value = parseInt(field.val());
      var newValue;

      if (isNaN(value)) {
        newValue = 0;
      } else {
        newValue = value - 1;
      }

      field.val(Math.max(0, newValue));
    });
  });
})(jQuery);
