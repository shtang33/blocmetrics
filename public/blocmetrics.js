function blocmetrics(name) {
  
  var _bm_event = {
    name: name
  }

  var _bm_request = new XMLHttpRequest();
  _bm_request.open("POST", "http://localhost:3000/api/events", true);
  _bm_request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  // #5
  _bm_request.onreadystatechange = function() {

  };
  
  _bm_request.send(jQuery.param(_bm_event));
}

  blocmetrics("page view");

  blocmetrics("comment");



  