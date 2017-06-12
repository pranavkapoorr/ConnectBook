  $(document).ready(function (){
      
  $(document).on("click",".hitlike",function(r){   //to apply click on dynamically created items
              r.preventDefault();
              var postid=this.id;
              var userliked=this.name;
             
       $.ajax(
                                    {
                                        url:'likedislike.jsp',
                                        type: 'POST',           ////for like
                                        data: {
                                            'postid':postid,       //posting on wall
                                            'userliked': userliked   //sending other username to be used as user1 in posttable
                                            },
                                 
                                   success: function (reslt) {
                                      
                                     
                                         { showtimeline1(u21);}
                                          
                                         
                                        
                                     
                        
                    },
                    error: function (e) {
                        alert("error due to "+ e);
                    }
        });
    });
    $(document).on("click",".hitdislike",function(r){   //to apply click on dynamically created items
              r.preventDefault();
              var postid=this.id;
              var userdisliked=this.name;
       $.ajax(
                                    {
                                        url:'likedislike.jsp',          //for dislike
                                        type: 'POST',
                                        data: {
                                            'postid':postid,       //posting on wall
                                            'userdisliked': userdisliked   //sending other username to be used as user1 in posttable
                                            },
                                 
                                   success: function (reslt) {
                                    {
                                         
                                         showtimeline1(u21);
                                     }
                       
                    },
                    error: function (e) {
                        alert("error due to "+ e);
                    }
        });
    });
    $(document).on("click",".hitunlike",function(r){   //to apply click on dynamically created items
              r.preventDefault();
              var postid=this.id;
              var userunliked=this.name;
       $.ajax(
                                    {
                                        url:'likedislike.jsp',          //for unlike
                                        type: 'POST',
                                        data: {
                                            'postid':postid,       //posting on wall
                                            'userunliked': userunliked   //sending other username to be used as user1 in posttable
                                            },
                                 
                                   success: function (reslt) {
                                   {
                                        
                                         showtimeline1(u21);
                                     }
                        
                    },
                    error: function (e) {
                       alert("error due to "+ e);
                    }
        });
    });
    $(document).on("click",".hitundislike",function(r){   //to apply click on dynamically created items
              r.preventDefault();
              var postid=this.id;
              var userundisliked=this.name;
       $.ajax(
                                    {
                                        url:'likedislike.jsp',          //for undislike
                                        type: 'POST',
                                        data: {
                                            'postid':postid,       //posting on wall
                                            'userundisliked': userundisliked   //sending other username to be used as user1 in posttable
                                            },
                                 
                                   success: function (reslt) {
                                      {
                                        
                                         showtimeline1(u21);
                                     }
                       
                    },
                    error: function (e) {
                       alert("error due to "+ e);
                    }
        });
    });
    $(document).on("click",".removefromtimeline",function(){   //to apply click on dynamically created items caret
              
              var postid=this.id;
              var removex="";
      $.ajax(
                                    {
                                        url:'likedislike.jsp',          //for deleting posts
                                        type: 'POST',
                                        data: {
                                            'postid':postid,       //posting on wall
                                            'removex':removex   //sending other var to access in jsp
                                            },
                                 
                                   success: function (reslt) {
                                     {
                                        
                                         showtimeline1(u21);
                                     }
                       
                    },
                    error: function (e) {
                        alert("Error in start Ajax" + e);
                    }
        });
    });
  });