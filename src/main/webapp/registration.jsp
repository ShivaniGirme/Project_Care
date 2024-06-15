<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registration</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  
<style type="text/css">

@import
    url('https://fonts.googleapis.com/css2?family=Anton&family=Montserrat:wght@100;400&family=Poppins:wght@300&display=swap')
    ;

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body {
    display: flex;
    justify-content: center;
    align-items: center;
    background: linear-gradient(135deg, #F6E7E5, #F6E7E5); 
    /*background-image: url("https://i.pinimg.com/736x/85/34/e4/8534e4be3014b3848424babbf85e7b6c.jpg");
    background-repeat: no-repeat;
    background-size: cover;*/
}


.container {
    max-width: 700px;
    width: 100%;
/*    background: #fff;*/
    padding: 20px 30px;
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
}

.container form .user-details {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    margin: 20px 0 12px 0;
}

form .user-details .input-box {
    margin-bottom: 15px;
    width: calc(100%/ 2 - 20px);
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

.user-details .input-box input:focus, .user-details .input-box input:valid
    {
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
    background: linear-gradient(135deg, #f26886, #f2acbb);
}

form .button input:hover {
    background: linear-gradient(-135deg, #f26886, #f2acbb);
}

.form-forgot1 {
    display: block;
    text-align: left;
    margin-bottom: 2rem;
    font-size:  0.948rem;
    font-weight: bolder;
    color: black;
    font-weight: 500;
    transition: .5;
    padding: 0px;
    text-decoration: none;
}
.form-forgot1:hover{
    color: #12192C;
    transition: .5s;
}


@media ( max-width :584px) {
    .container {
        max-width: 100%;
    }
    form .user-details .input-box {
        margin-bottom: 15px;
        width: 100%;
    }
    form .gender-details .category {
        width: 100%;
    }
    .container form .user-details {
        max-height: 300px;
        overflow-y: scroll;
    }
    .user-details::-webkit-scrollbar {
        width: 0;
    }
}

.rdobtn {
    margin-right: 40px;
}
</style>

</head>

<body>
<div style="display: flex;">


    <div class="container">
        <%
        String message = (String) request.getAttribute("message");
        if (message != null) {
        %>
        <h2>
            <%=message%>
        </h2>
        <%
        }
        %>
        <div style="display: flex;">
            <!-- <div class="title"> &nbsp; </div> -->
            <div class="title">Registration</div>
        </div>

        <form action="register" method="post" enctype="multipart/form-data">
            <div class="user-details">
                <div class="input-box">
                    <span class="details">First Name</span> <input type="text"
                        placeholder="First_Name" required name="firstName"
                        pattern="[a-zA-Z]+">
                </div>
                <div class="input-box">
                    <span class="details">Last Name</span> <input type="text"
                        placeholder="Last_Name" required name="lastName"
                        pattern="[a-zA-Z]+">
                </div>
                <div class="input-box">
                    <span class="details">Email</span> <input type="email"
                        placeholder="Enter your email" required name="email"
                        pattern="[a-z0-9._-]+@gmail\.com$">
                </div>
                <div class="input-box">
                    <span class="details">Phone Number</span> <input type="text"
                        placeholder="Enter your number" required name="phone"
                        pattern="[6-9]{1}[0-9]{9}">
                </div>
               
                <div class="input-box">
                    <span class="details">Password</span> <input type="password"
                        placeholder="Enter your password" required name="password">
                </div>
                <div class="input-box">
                    <span class="details">Confirm Password</span> <input
                        type="password" placeholder="Confirm your password" required
                        name="confirmpassword">
                </div>
                 <div class="input-box" style="width: 300px;">
                    <span class="details">Address</span> <input type="text"
                        placeholder="Enter your Address" required name="address">
                </div>
                <div class="input-box mb-3" style="width: 300px;height: 50px;">
                    <span class="details form-label">Upload Profile Photo</span> <input
                        type="file" name="file" required="required" class="form-control"><br>
                </div>

                <div>
                    <label for="inputEmail4">Role : </label> <input type="radio"
                        name="inlineRadioOptions" value="Owner" required> <label
                        class="rdobtn">Owner</label> <input type="radio"
                        name="inlineRadioOptions" value="Buyer" required> <label
                        class="rdobtn">Buyer</label>
                </div>
            </div>
            <div style="display: flex;">
                <div class="button" style="margin-right: 50px; width: 500px;">
                    <input type="reset" name="Register" value="Cancel">
                </div>
                <div class="button" style="width: 500px;">
                    <input type="submit" name="Register" value="Register">
                </div>
            </div>
            <a href="login.jsp" class="form-forgot1">Already a User? Login here!</a>
        </form>
    </div>
    
    
<div style="margin-top: 100px;">
    	<img alt="" src="https://media.istockphoto.com/id/638736248/photo/lets-clean-the-face-before-make-up.jpg?s=612x612&w=0&k=20&c=bDiPYGKPLxPMd3Vj29XHl9Gjd0wq_3VO9FRhemIKlSo=" style="height: 450px">
    </div>


</div>
</body>

</html>