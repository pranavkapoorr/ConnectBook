
     var timeoutID;
 
function setup() {
    this.addEventListener("mousemove", resetTimer, false);
    this.addEventListener("mousedown", resetTimer, false);
    this.addEventListener("keypress", resetTimer, false);
    this.addEventListener("DOMMouseScroll", resetTimer, false);
    this.addEventListener("mousewheel", resetTimer, false);
    this.addEventListener("touchmove", resetTimer, false);
    this.addEventListener("MSPointerMove", resetTimer, false);
 
    startTimer();
}
setup();
 
function startTimer() {
    // wait 2 seconds before calling goInactive
    timeoutID = window.setTimeout(goInactive, 2000);
}
 
function resetTimer(e) {
    window.clearTimeout(timeoutID);
 
    goActive();
}
 
function goInactive() {
    alert("inactive");
             $.ajax({
                                     url:'tracksession.jsp',        //removing from session table
                                        type: 'POST',
                                        data: {
                                            'removeactivestatus':offline
                                          },
                                 
                                   success: function (reslt) {
                      alert(reslt);
                                              },
                                   error: function (e) {
                                alert("error in activestatus offline"+ e);
                                                  }
                       
                }); 
                // do something
}
 
function goActive() {
    alert("active");
    $.ajax({
                                     url:'tracksession.jsp',        //adding from session table
                                        type: 'POST',
                                        data: {
                                            'addactivestatus':online
                                          },
                                 
                                   success: function (reslt) {
                                       alert(reslt);
                                              },
                                   error: function (e) {
                                alert("error in activestatus offline"+ e);
                                                  }
                       
                });   // do something// do something
         
    startTimer();
}
