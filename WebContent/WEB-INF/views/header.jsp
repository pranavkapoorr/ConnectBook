<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <script type="text/javascript" src="<c:url value="/js/jquery.js"/>" ></script>
     <script type="text/javascript" src="<c:url value="/js/bootstrap.min.js"/>" ></script> 
<script type="text/javascript">
    $(document).ready(function(){
       
            $.ajax(
                                    {
                                        url:'friendajax.jsp',
                                        type: 'POST',
                                        data: {
                                            'status1':1
                                          },
                                 
                                   success: function (reslt) {
                        $("#friend").html(reslt);
                         $(".fa-user").popover({
                              
            content:  $("#friendbell").html(),
             html: true
         });  
                    },
                    error: function (e) {
                        $("#friend").html("Error in start Ajax" + e);
                    }
        });
         $(".searchbox").keyup(function(){
               var a=$(this).val();
               if(a.length===2)
               {
                   $.ajax(
                                    {
                                        url:'searchajax.jsp',
                                        type: 'POST',
                                        data: {
                                            'search':a
                                                 },
                                 
                                   success: function (reslt) {
                        $("#searchresult").html(reslt);
                    },
                    error: function (e) {
                        $("#searchresult").html("Error in Ajax" + e);
                    }
               
           });
       } 
       
        });
         $(".fa-caret-down").popover({
            content:$("#settings").html(),
             html: true
         });  
          $(".fa-bell").popover({
            content:$("#notificationbell").html(),
             html: true
         });  
          $(".fa-comments").popover({
            content:$("#messagebell").html(),
             html: true
             
         });  
    
});
    
    
</script>
<style>
    .affix {
      top:0;
      width: 100%;
      z-index: 9999 !important;
  }
</style>

<nav  class="navbar navbar-default " data-spy="affix" data-offset-top="1">
      <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
            <a class="navbar-brand icon-brand fa fa-facebook-square" href="UserHome"></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <form class="navbar-form navbar-left" role="search">
            <div class="form-group">
              <div class="search dropdown">
                <input type="text" class="form-control searchbox dropdown-toggle" role="combobox" data-toggle="dropdown" aria-expanded="false" aria-haspopup="true" placeholder="Search peoples, places and more">
                <span class="fa fa-search"></span>
                <ul style="width: 400px;background-color:white;appearance:pull-down-menu;" class="dropdown-menu"><div id="searchresult" class="well-sm" > 
                    </div></ul> 
              </div> 
            </div>
          </form>
          <ul class="nav navbar-nav navbar-right">
              <li><a href="feed">Home</a></li>
            <li class="dropdown"><a  class="fa fa-user , dropdown-toggle"  data-toggle="dropdown" tabindex="0" data-trigger="focus" data-placement="bottom" role="button" aria-haspopup="true" aria-expanded="false" alt="resquest"></a>
                <div id="friendbell" class="popover-content" style="display: none">
                    <div > <div class="thumbnail thumbnail-post"> <div  class="caption"> Friend Requests</div></div>
                    <div class="thumbnail thumbnail-post">  <div id="friend" class="fa caption"></div></div>
                    <div > <div class="thumbnail thumbnail-post"> <div  class="caption"><a href="friendreq.jsp">View all</a></div></div>
                    </div>  </div></div>
            </li>
            <li class="dropdown"><a  class="fa fa-comments , dropdown-toggle" data-toggle="dropdown" tabindex="0" data-trigger="focus" data-placement="bottom" role="button" aria-haspopup="true" aria-expanded="false" alt="inbox"></a>
                <div id="messagebell" class=" popover-content" hidden>
                    <div class="container-fluid">     <div class="links-post">  <a href="#">Groups</a></div>
                    <div class="links-post"> <a href="#">Pages</a></div>
                    
                   <a href="#">Configuration</a>
                   <a href="messages">See all</a><br>
                    <a href="#">Help</a>
                    </div></div>
            </li>
            <li class="dropdown"><a  class="fa fa-bell " data-toggle="dropdown" role="button" tabindex="0" data-trigger="focus" data-placement="bottom" aria-haspopup="true" aria-expanded="false" alt="notifications"></a>
                <ul id="notificationbell" class="popover-content" hidden>
                <li><a href="#">Groups</a></li>
                <li><a href="#">Pages</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Configuration</a></li>
                <li><a href="logout">Logout</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Help</a></li>
              </ul>
            </li>
            <li  class="dropdown">
                <a  class="fa fa-caret-down" data-toggle="dropdown" title="Popover Header" tabindex="0" data-trigger="focus" data-placement="bottom"   alt="settings" role="button" aria-haspopup="true" aria-expanded="false"></a>
               <ul id="settings"class="popover-content" hidden>
                <li><a href="#">Groups</a></li>
                <li><a href="#">Pages</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="#"><span class="glyphicon glyphicon-wrench"></span>Settings</a></li>
                <li><a href="logout">Logout</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="help">Help</a></li>
              </ul>
            </li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
</nav> 