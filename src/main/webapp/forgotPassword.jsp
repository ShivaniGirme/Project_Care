<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Anton&family=Montserrat:wght@100;400&family=Poppins:wght@300&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body {
    display: flex;
    height: 100vh;
    justify-content: center;
    align-items: center;
    /* background: linear-gradient(135deg, #71b7e6, #9b59b6); */
    background-image: url("https://i.pinimg.com/originals/43/77/7a/43777aabdfd50ec9184e63cb07919f62.gif");
    background-repeat: no-repeat;
    background-size: cover;
}

.container {
    max-width: 700px;
    width: 100%;
    background: #fff;
    padding: 25px 30px;
    border-radius: 5px;
}

.container .title {
    font-size: 25px;
    font-weight: 500;
    position: relative;
}

.container .title::before {
    content: '';
    position: absolute;
    left: 0;
    bottom: 0;
    height: 3px;
    width: 30px;
    background: linear-gradient(135deg, #d49696, #9b59b6);
}

.container form .user-details {
    /* display: flex; */
    flex-wrap: wrap;
    justify-content: space-between;
    margin: 20px 0 12px 0;


}

form .user-details .input-box {
    margin-bottom: 17px;
    width: calc(300% / 2 - 20px);
}

.user-details .input-box .details {
    display: block;
    font-weight: 500;
    margin-bottom: 5px;
}

.user-details .input-box input {
    height: 45px;
    width: 100%;
    outline: none;
    border-radius: 5px;
    border: 1px solid #ccc;
    padding-left: 15px;
    font-size: 16px;
    border-bottom-width: 2px;
    transition: all 0.3s ease;
}

.user-details .input-box input:focus,
.user-details .input-box input:valid {
    border-color: #9b59b6;
}

form .button {
    height: 45px;
    margin: 20px 0;
}

form .button input {
    height: 100%;
    width: 100%;
    outline: none;
    color: white;
    border: none;
    font-size: 18px;
    font-weight: 500;
    border-radius: 5px;
    letter-spacing: 1px;
    background: linear-gradient(135deg, #d49696, #9b59b6);
    cursor: pointer;

}

form .button input:hover{
    background: linear-gradient(-135deg, #d49696, #9b59b6);
}

@media(max-width:584px){
    .container{
        max-width: 100%;
    
    }

    form .user-details .input-box{
        margin-bottom: 15px;
        width: 100%;
    }
     form .gender-details .category{
        width: 100%;

     }

     .container form .user-details{
        max-height: 300px;
        overflow-y:scroll;
     }

     .user-details::-webkit-scrollbar{
        width: 0;
     }
}
    </style>
</head>

<body>
    <div class="container">
        <div style="display: flex;">
            <div class="title">Forgot&nbsp; &nbsp; </div>
            <div class="title">Password</div>
        </div>
		<br>
        <form action="forgotPassword">
        <%
			String message = (String) request.getAttribute("usermessage");
			if (message != null) {
			%>
			<h6>
				<%=message%>
			</h6>
			<%
			}
			%>
            <div class="user-details" style="display: flex;">
                <div>
                    <div class="input-box">
                        <span class="details">Email Id</span>
                        <input name="email" type="text" placeholder="Enter your Email id" required>
                    </div>
                    <div class="input-box">
                        <span class="details">New Password</span>
                        <input name="password" type="password" placeholder="Enter your password" required>
                    </div>
    
                    <div class="input-box">
                        <span class="details">Confirm Password</span>
                        <input name="confirmpassword" type="password" placeholder="Enter your password" required>
                    </div>
                </div>

                <div>
                    <img src="https://media.istockphoto.com/id/1312684240/photo/face-of-young-woman-with-red-nails-lipstick-and-long-brown-hair-model-with-fashion-makeup.jpg?s=612x612&w=0&k=20&c=VdHX6Rt3qfkqCfv2eJJoS4SJgoBn4qlCTh4mNwvvI-s=" alt="" height="220px" style="margin-top: 30px" >
                </div>
            </div>
           <div style="display: flex; " >
            <div class="button" style="margin-right: 50px; width: 100px;">
               <a href="login.jsp"> <input type="button" value="Cancel"></a>
            </div>
            <div class="button" style="width: 100px;">
               <a href="login.jsp"> <input type="submit" value="Update"></a>
            </div>
           </div>      
        </form>
    </div>
</body>

</html>