(function () {

  var global = (function () { return this; })();

  // stub location and document that mocha uses
  global.location = {};
  global.location.href = '';
  global.document = {}
  global.document.getElementById = function () { return false; };

}());
