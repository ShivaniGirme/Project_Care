<%@page import="care.dto.User"%>
<%@page import="care.dao.UserCRUD"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>EditProfile</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="author" content="TemplatesJungle">
<meta name="keywords" content="ecommerce,fashion,store">
<meta name="description"
	content="Beauty Store Bootstrap 5 HTML CSS Template">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="icomoon/icomoon.css">
<link rel="stylesheet" type="text/css" href="css/vendor.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<link rel="stylesheet" type="text/css" href="style.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Lora:wght@400;500&family=Prata&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	


<style type="text/css">
@font-face {
  font-family: "ElMessiri-SemiBold";
  src: url("../fonts/el_messiri/ElMessiri-SemiBold.ttf"); }
@font-face {
  font-family: "Montserrat-Regular";
  src: url("../fonts/montserrat/Montserrat-Regular.ttf"); }
@font-face {
  font-family: "Montserrat-SemiBold";
  src: url("../fonts/montserrat/Montserrat-SemiBold.ttf"); }
* {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box; }

body {
  color: #999;
  font-size: 12px;
  margin: 0; }

p, h1, h2, h3, h4, h5, h6, ul {
  margin: 0; }

img {
  max-width: 100%; }

ul {
  padding-left: 0;
  margin-bottom: 0; }

a {
  text-decoration: none;
  color: #ff9a9c;
  transition: all 0.3s ease; }
  a:hover {
    text-decoration: none;
    color: #fe4447; }

:focus {
  outline: none; }

.wrapper {
  min-height: 100vh;
  display: flex;
  align-items: center;
  background-color: #F6E7E5;
  background-size: cover; }

.inner {
  max-width: 850px;
  margin: auto;
  margin-top:40px;
  background: #fff;
  display: flex;
  box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
  -webkit-box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
  -moz-box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
  -ms-box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
  -o-box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2); }

.image-holder {
	margin-top: 50px;
  width: 50%;
  padding-right: 15px; }

form {
  width: 50%;
  height: 600px;
  padding-top: 77px;
  padding-right: 60px;
  padding-left: 15px; }

h3 {
  font-size: 35px;
  font-family: "ElMessiri-SemiBold";
  text-align: center;
  margin-bottom: 27px;
  color: #ff9a9c; }

.form-holder {
  padding-left: 24px;
  position: relative; }
  .form-holder:before {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    content: "";
    width: 10px;
    height: 10px;
    border-radius: 50%;
    border: 2px solid #ff9a9c;
    position: absolute;
    left: 1px;
    top: 50%;
    transform: translateY(-50%); }
 

.form-control {
  display: block;
  width: 100%;
  border-radius: 23.5px;
  height: 47px;
  padding: 0 24px;
  color: #808080;
  font-size: 16px;
  border: none;
  background: #f7f7f7;
  margin-bottom: 25px; }
  .form-control::-webkit-input-placeholder {
    font-size: 13px;
    color: #808080;
    text-transform: uppercase;
    font-family: "Montserrat-Regular"; }
  .form-control::-moz-placeholder {
    font-size: 13px;
    color: #808080;
    text-transform: uppercase;
    font-family: "Montserrat-Regular"; }
  .form-control:-ms-input-placeholder {
    font-size: 13px;
    color: #808080;
    text-transform: uppercase;
    font-family: "Montserrat-Regular"; }
  .form-control:-moz-placeholder {
    font-size: 13px;
    color: #808080;
    text-transform: uppercase;
    font-family: "Montserrat-Regular"; }

@-webkit-keyframes hvr-wobble-horizontal {
  16.65% {
    -webkit-transform: translateX(8px);
    transform: translateX(8px); }
  33.3% {
    -webkit-transform: translateX(-6px);
    transform: translateX(-6px); }
  49.95% {
    -webkit-transform: translateX(4px);
    transform: translateX(4px); }
  66.6% {
    -webkit-transform: translateX(-2px);
    transform: translateX(-2px); }
  83.25% {
    -webkit-transform: translateX(1px);
    transform: translateX(1px); }
  100% {
    -webkit-transform: translateX(0);
    transform: translateX(0); } }
@keyframes hvr-wobble-horizontal {
  16.65% {
    -webkit-transform: translateX(8px);
    transform: translateX(8px); }
  33.3% {
    -webkit-transform: translateX(-6px);
    transform: translateX(-6px); }
  49.95% {
    -webkit-transform: translateX(4px);
    transform: translateX(4px); }
  66.6% {
    -webkit-transform: translateX(-2px);
    transform: translateX(-2px); }
  83.25% {
    -webkit-transform: translateX(1px);
    transform: translateX(1px); }
  100% {
    -webkit-transform: translateX(0);
    transform: translateX(0); } }
button {
  letter-spacing: 2px;
  border: none;
  width: 133px;
  height: 47px;
  margin-right: 19px;
  border-radius: 23.5px;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0;
  background: #ff9a9c;
  font-size: 15px;
  color: #fff;
  text-transform: uppercase;
  font-family: "Montserrat-SemiBold";
  -webkit-transform: perspective(1px) translateZ(0);
  transform: perspective(1px) translateZ(0);
  box-shadow: 0 0 1px rgba(0, 0, 0, 0); }
  button:hover {
    -webkit-animation-name: hvr-wobble-horizontal;
    animation-name: hvr-wobble-horizontal;
    -webkit-animation-duration: 1s;
    animation-duration: 1s;
    -webkit-animation-timing-function: ease-in-out;
    animation-timing-function: ease-in-out;
    -webkit-animation-iteration-count: 1;
    animation-iteration-count: 1; }


.form-login {
  display: flex;
  align-items: center;
  margin-left: 23px; }

@media (max-width: 767px) {
  .inner {
    display: block; }

  .image-holder {
    width: 100%;
    padding-right: 0; }

  form {
    width: 100%;
    padding: 0px 15px 70px; }

  .wrapper {
    background: none; } }

</style>
</head>
<body>
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
    <defs>
      <symbol xmlns="http://www.w3.org/2000/svg" id="instagram"
			viewBox="0 0 15 15">
        <path fill="none" stroke="currentColor"
			d="M11 3.5h1M4.5.5h6a4 4 0 0 1 4 4v6a4 4 0 0 1-4 4h-6a4 4 0 0 1-4-4v-6a4 4 0 0 1 4-4Zm3 10a3 3 0 1 1 0-6a3 3 0 0 1 0 6Z" />
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="facebook"
			viewBox="0 0 15 15">
        <path fill="none" stroke="currentColor"
			d="M7.5 14.5a7 7 0 1 1 0-14a7 7 0 0 1 0 14Zm0 0v-8a2 2 0 0 1 2-2h.5m-5 4h5" />
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="twitter"
			viewBox="0 0 15 15">
        <path fill="currentColor"
			d="m14.478 1.5l.5-.033a.5.5 0 0 0-.871-.301l.371.334Zm-.498 2.959a.5.5 0 1 0-1 0h1Zm-6.49.082h-.5h.5Zm0 .959h.5h-.5Zm-6.99 7V12a.5.5 0 0 0-.278.916L.5 12.5Zm.998-11l.469-.175a.5.5 0 0 0-.916-.048l.447.223Zm3.994 9l.354.353a.5.5 0 0 0-.195-.827l-.159.474Zm7.224-8.027l-.37.336l.18.199l.265-.04l-.075-.495Zm1.264-.94c.051.778.003 1.25-.123 1.606c-.122.345-.336.629-.723 1l.692.722c.438-.42.776-.832.974-1.388c.193-.546.232-1.178.177-2.006l-.998.066Zm0 3.654V4.46h-1v.728h1Zm-6.99-.646V5.5h1v-.959h-1Zm0 .959V6h1v-.5h-1ZM10.525 1a3.539 3.539 0 0 0-3.537 3.541h1A2.539 2.539 0 0 1 10.526 2V1Zm2.454 4.187C12.98 9.503 9.487 13 5.18 13v1c4.86 0 8.8-3.946 8.8-8.813h-1ZM1.03 1.675C1.574 3.127 3.614 6 7.49 6V5C4.174 5 2.421 2.54 1.966 1.325l-.937.35Zm.021-.398C.004 3.373-.157 5.407.604 7.139c.759 1.727 2.392 3.055 4.73 3.835l.317-.948c-2.155-.72-3.518-1.892-4.132-3.29c-.612-1.393-.523-3.11.427-5.013l-.895-.446Zm4.087 8.87C4.536 10.75 2.726 12 .5 12v1c2.566 0 4.617-1.416 5.346-2.147l-.708-.706Zm7.949-8.009A3.445 3.445 0 0 0 10.526 1v1c.721 0 1.37.311 1.82.809l.74-.671Zm-.296.83a3.513 3.513 0 0 0 2.06-1.134l-.744-.668a2.514 2.514 0 0 1-1.466.813l.15.989ZM.222 12.916C1.863 14.01 3.583 14 5.18 14v-1c-1.63 0-3.048-.011-4.402-.916l-.556.832Z" />
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="pinterest"
			viewBox="0 0 15 15">
        <path fill="none" stroke="currentColor"
			d="m4.5 13.5l3-7m-3.236 3a2.989 2.989 0 0 1-.764-2V7A3.5 3.5 0 0 1 7 3.5h1A3.5 3.5 0 0 1 11.5 7v.5a3 3 0 0 1-3 3a2.081 2.081 0 0 1-1.974-1.423L6.5 9m1 5.5a7 7 0 1 1 0-14a7 7 0 0 1 0 14Z" />
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="youtube"
			viewBox="0 0 15 15">
        <path fill="currentColor"
			d="m1.61 12.738l-.104.489l.105-.489Zm11.78 0l.104.489l-.105-.489Zm0-10.476l.104-.489l-.105.489Zm-11.78 0l.106.489l-.105-.489ZM6.5 5.5l.277-.416A.5.5 0 0 0 6 5.5h.5Zm0 4H6a.5.5 0 0 0 .777.416L6.5 9.5Zm3-2l.277.416a.5.5 0 0 0 0-.832L9.5 7.5ZM0 3.636v7.728h1V3.636H0Zm15 7.728V3.636h-1v7.728h1ZM1.506 13.227c3.951.847 8.037.847 11.988 0l-.21-.978a27.605 27.605 0 0 1-11.568 0l-.21.978ZM13.494 1.773a28.606 28.606 0 0 0-11.988 0l.21.978a27.607 27.607 0 0 1 11.568 0l.21-.978ZM15 3.636c0-.898-.628-1.675-1.506-1.863l-.21.978c.418.09.716.458.716.885h1Zm-1 7.728a.905.905 0 0 1-.716.885l.21.978A1.905 1.905 0 0 0 15 11.364h-1Zm-14 0c0 .898.628 1.675 1.506 1.863l.21-.978A.905.905 0 0 1 1 11.364H0Zm1-7.728c0-.427.298-.796.716-.885l-.21-.978A1.905 1.905 0 0 0 0 3.636h1ZM6 5.5v4h1v-4H6Zm.777 4.416l3-2l-.554-.832l-3 2l.554.832Zm3-2.832l-3-2l-.554.832l3 2l.554-.832Z" />
      </symbol>
      

      <symbol xmlns="http://www.w3.org/2000/svg" id="heart"
			viewBox="0 0 24 24">
        <path fill="currentColor"
			d="M20.16 4.61A6.27 6.27 0 0 0 12 4a6.27 6.27 0 0 0-8.16 9.48l7.45 7.45a1 1 0 0 0 1.42 0l7.45-7.45a6.27 6.27 0 0 0 0-8.87Zm-1.41 7.46L12 18.81l-6.75-6.74a4.28 4.28 0 0 1 3-7.3a4.25 4.25 0 0 1 3 1.25a1 1 0 0 0 1.42 0a4.27 4.27 0 0 1 6 6.05Z" />
      </symbol>
      
    </defs>
  </svg>
	<div class="preloader text-white fs-6 text-uppercase overflow-hidden"></div>

	<nav
		class="navbar navbar-expand-lg text-uppercase fs-6 py-3 px-0 px-md-3 border-bottom align-items-center">
		<div class="container-fluid">
			<div
				class="row justify-content-between align-items-center w-100 py-2">

				<div class="col-auto">
					<a class="navbar-brand" href="index.html"> <img
						src="images/main-logo.png" alt="logo">
					</a>
				</div>

				<div class="col-auto">
					<button class="navbar-toggler" type="button"
						data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
						aria-controls="offcanvasNavbar">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="offcanvas offcanvas-end" tabindex="-1"
						id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
						<div class="offcanvas-header">
							<h5 class="offcanvas-title" id="offcanvasNavbarLabel">Menu</h5>
							<button type="button" class="btn-close text-reset"
								data-bs-dismiss="offcanvas" aria-label="Close"></button>
						</div>

						<div class="offcanvas-body">
							<ul
								class="navbar-nav justify-content-end  flex-grow-1 gap-5 pe-3">
								<li class="nav-item"><a class="nav-link"
									href="buyerHomePage.jsp">Home</a></li>
								<li class="nav-item"><a class="nav-link"
									href="allProduct2.jsp">Products</a></li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" id="dropdownShop"
									data-bs-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">Shop by Category</a>
									<ul class="dropdown-menu list-unstyled"
										aria-labelledby="dropdownShop">
										<li><a href="#" class="dropdown-item item-anchor">Skin
												care</a></li>
										<li><a href="#" class="dropdown-item item-anchor">Make-Up
												Products</a></li>
										<li><a href="#" class="dropdown-item item-anchor">Beauty
												Products</a></li>
									</ul></li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" id="dropdownBlog"
									data-bs-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">Services</a>
									<ul class="dropdown-menu list-unstyled"
										aria-labelledby="dropdownBlog">
										<li><a href="#" class="dropdown-item item-anchor">Studio</a>
										</li>
										<li><a href="#" class="dropdown-item item-anchor">Makeup
												Artist</a></li>
									</ul></li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" id="dropdownPages"
									data-bs-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">Profile</a>
									<ul class="dropdown-menu list-unstyled"
										aria-labelledby="dropdownPages">
										<li><a href="profile.jsp"
											class="dropdown-item item-anchor">Your Profile </a></li>
										<li><a href="#" class="dropdown-item item-anchor">Orders</a>
										</li>
										<li><a href="changePassword.jsp" class="dropdown-item item-anchor">Change
												Password</a></li>
										<li><a href="#" class="dropdown-item item-anchor">Logout</a>
										</li>
									</ul></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="col-auto">
					<ul class="list-unstyled d-flex m-0 mt-3 mt-xl-0">
						<li><a href="wishlist.html" class="text-uppercase mx-3">
								<svg width="24" height="24" viewBox="0 0 24 24">
                  <use xlink:href="#heart"></use>
                </svg>
						</a></li>
						<li><a href="#" class="mx-3"> <i class="fa fa-sign-out"
								aria-hidden="true" style="font-size: 25px;"></i>
						</a></li>

					</ul>
				</div>

			</div>

		</div>
	</nav>
	
	<%
	HttpSession httpSession = request.getSession();
	System.out.println(httpSession);
	String email = (String) httpSession.getAttribute("session");
	System.out.println(email);
	UserCRUD userCRUD = new UserCRUD();
	User user = userCRUD.getAllUserInfoByEmail(email);
	System.out.println(user.getUserId());
	%>

<div class="wrapper">
			<div class="inner">
				<div class="image-holder">
					<img src="images/registration-form-4.jpg" alt="">
				</div>
				<form action="update" method="post">
					<h3>Edit Profile</h3>
					<div class="form-holder">
						<input type="text" name="id" hidden="true" value="<%=user.getUserId()%>" />
						<input type="text" class="form-control"required value="<%=user.getFirstName()%>" name="fName" placeholder="Enter your FirstName"  pattern="[a-zA-Z]+">
					</div>
					<div class="form-holder">
						<input type="text" class="form-control"  required  name="lName"
                    value="<%=user.getLastName()%>" placeholder="Enter your LastName" pattern="[a-zA-Z]+">
					</div>
					<div class="form-holder">
						<input type="text" class="form-control" required  name="email" value="<%=user.getEmail()%>" placeholder="Enter your Email" pattern="[a-z0-9._-]+@gmail\.com$">
					</div>
					<div class="form-holder">
						<input type="text" class="form-control" required  name="phone" value="<%=user.getPhone()%>" placeholder="Enter your Phone" pattern="[6-9]{1}[0-9]{9}">
					</div>
					<div class="form-holder">
						<input type="text" class="form-control" required  name="address" value="<%=user.getAddress()%>" placeholder="Enter your Address">
					</div>
		
					
					<div class="form-login">
						<a href="profile.jsp"> <button>Edit</button></a>
					</div>
				</form>
			</div>
		</div>





	<script src="js/jquery.min.js"></script>
	<script src="js/plugins.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
	<script src="js/script.js"></script>

</body>
</html>