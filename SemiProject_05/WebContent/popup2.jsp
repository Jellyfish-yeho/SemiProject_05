<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>popup2.jsp</title>
<link rel="icon" href="${pageContext.request.contextPath}/images/shuttlecock_main.png" type="image/x-icon" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<style>
     /* The Modal (background) */
     .modal {
     	 	display: none; /* Hidden by default */
      		position: fixed; /* Stay in place */
            z-index: 0; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            position: center;
            margin: 10% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 21%; /* Could be more or less, depending on screen size */                          
        }
    </style>
</head>
<body>
    <script src="https://code.jquery.com/jquery-latest.js"></script> 

    <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
      <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="color: green; font-size: 24pt;">*JOIN US~~*</span></b></span></p>
      <a href="http://www.badmintonmart.com/shop/main/index.php"> <img src="<%=request.getContextPath() %>/images/notice.jpg" class="card-img-top" height=400px width=400px; />
                </a>
    <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                <span class="pop_bt" style="font-size: 13pt;" >
                     3초후 자동으로 사라집니다^^
                </span>
            </div>
      </div>
 
    </div>
        <!--End Modal-->
 
 
    <script type="text/javascript">
      
        jQuery(document).ready(function() {
                $('#myModal').show();
        });
        //팝업 Close 기능
        function close_pop(flag) {
             $('#myModal').hide();
             
        };
        //3초후 자동으로 사라지기 
        setTimeout(function() { $('#myModal').hide();}, 3000)

      </script>

</body>
</html>