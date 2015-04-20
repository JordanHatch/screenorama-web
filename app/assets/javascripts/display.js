(function() {
  "use strict";
  window.Screenorama = window.Screenorama || {};

  function Display(options) {
    this.$el = options.el;
    this.lastRequestedAtUrl = options.lastRequestedAtUrl;

    this.delay = 15000;

    this.updateLastRequestedAt();
  }

  Display.prototype.updateLastRequestedAt = function updateLastRequestedAt(){
    $.ajax({
      method: 'POST',
      url: this.lastRequestedAtUrl,
      data: { update: 1 },
    });

    setTimeout( $.proxy(this.updateLastRequestedAt, this), this.delay);
  }

  Screenorama.Display = Display;
}());
