<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-2.0.2.min.js"></script>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>Insert title here</title>
<style>
body,html{width:100%;height:100%;padding:0;margin:0;}
.clearfix:after {
    content: '';
    display: table;
    clear: both;
}
#main{
   background-color: BurlyWood;
   float: right;
   height:200px;
    width: 75%;
}
#sidebar{
   background-color: IndianRed;
   width:25%;
   float: left;
   height:200px;
   overflow-y: hidden;
}

#dragbar{
   background-color:black;
   height:100%;
   float: right;
   width: 3px;
   cursor: col-resize;
}
#ghostbar{
    width:3px;
    background-color:#000;
    opacity:0.5;
    position:absolute;
    cursor: col-resize;
    z-index:999}
    </style>
<script>
var i = 0;
var dragging = false;
   $('#dragbar').mousedown(function(e){
       e.preventDefault();
       
       dragging = true;
       var main = $('#main');
       var ghostbar = $('<div>',
                        {id:'ghostbar',
                         css: {
                                height: main.outerHeight(),
                                top: main.offset().top,
                                left: main.offset().left
                               }
                        }).appendTo('body');
       
        $(document).mousemove(function(e){
          ghostbar.css("left",e.pageX+2);
       });
       
    });

   $(document).mouseup(function(e){
       if (dragging) 
       {
           var percentage = (e.pageX / window.innerWidth) * 100;
           var mainPercentage = 100-percentage;
           
           $('#console').text("side:" + percentage + " main:" + mainPercentage);
           
           $('#sidebar').css("width",percentage + "%");
           $('#main').css("width",mainPercentage + "%");
           $('#ghostbar').remove();
           $(document).unbind('mousemove');
           dragging = false;
       }
    });
</script>

</head>
<body>
<div class="clearfix">
<div id="sidebar">
     <span id="position"></span>
    <div id="dragbar"></div>
    sidebar
</div>
<div id="main">
    main
</div>
</div>
<div id="console"></div>
</body>
</html>