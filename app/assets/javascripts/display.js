(function() {
  "use strict";
  window.Screenorama = window.Screenorama || {};

  function Display(options) {
    this.$el = options.el;
    this.$message = options.message;

    this.lastRequestedAtUrl = options.lastRequestedAtUrl;
    this.dataSource = options.dataSource;

    this.delay = 15000;

    this.updateLastRequestedAt();
    this.updateDisplay();
  }

  Display.prototype.updateLastRequestedAt = function updateLastRequestedAt(){
    $.ajax({
      method: 'POST',
      url: this.lastRequestedAtUrl,
      data: { update: 1 },
    });

    setTimeout( $.proxy(this.updateLastRequestedAt, this), this.delay);
  }

  Display.prototype.updateDisplay = function updateDisplay(){
    $.ajax({
      method: 'GET',
      dataType: 'json',
      url: this.dataSource,
    }).done( $.proxy(function(data){
      if (data.url != null && data.url != this.$el.attr('src')) {
        this.$el.attr('src', data.url);
        this.$message.hide();
      }
    }, this));

    setTimeout( $.proxy(this.updateDisplay, this), this.delay);
  }

  Screenorama.Display = Display;
}());
