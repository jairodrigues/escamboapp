//= require bootstrap_sb_admin_base_v2
//= require notify
//= require bootbox

$.rails.allowAction = function(element) {
  var message = element.attr('data-confirm');
  if (!message) { return true; }

  var opts = {
    title: "Confirmação",
    message: message,
    buttons: {
        confirm: {
            label: 'Sim',
            className: 'btn-success'
        },
        cancel: {
            label: 'Não',
            className: 'btn-danger'
        }
    },
    callback: function(result) {
      if (result) {
        element.removeAttr('data-confirm');
        element.trigger('click.rails')
      }
    }
  };

  bootbox.confirm(opts);

  return false;
}