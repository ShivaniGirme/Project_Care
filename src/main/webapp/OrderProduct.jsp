<%@page import="care.dto.Product"%>
<%@page import="care.dto.User"%>
<%@page import="care.dao.UserCRUD"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OrderProduct</title>
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
.container {
	margin-top: 50px;
	padding-left: 120px;
	width: 100%;
	border-radius: 5px;
}
.payment-form {
        display: none;
        padding-left: 220px;
        width: 550px
    }
    .form1{
    margin-right: 25px;
    width: 300px
    }
    .form2{
    margin-left: 25px;
     width: 300px}
.input-box {
	margin-top:10px;
	margin-bottom:10px;
    width: 100%; /* You can adjust the width as per your preference */
}
.title{
margin-top: 30px;
}

 button{
 margin-top:10px;
 margin-left:100px;
  border-radius: 15.5px;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0;
  background: #ff9a9c;
  font-size: 18px;
  color: #fff;
  width: 150px;
  height: 50px;
  transition: box-shadow 0.3s, transform 0.3s; /* Transition effect for smooth animation */
        }
        button:hover {
    box-shadow: 0px 0px 3px 2px rgba(0,0,0,0.2); /* Add shadow on hover */
    transform: scale(1.1); /* Scale the button slightly on hover */
     color: #ff9a9c; /* Change text color to background color */
    background: #fff; /* Change background color to text color *
}
</style>
</head>
<body class="homepage">
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



<div class="container">
	<%Product product=(Product)request.getAttribute("pro"); %>
	
<form action="placeOrder" method="post">
 <div style="display: flex;">
    <div class="form1">
	    <label>PRODUCT NAME:</label>
	    <input class="input-box" type="text" name="name" value=<%=product.getName()%> readonly="readonly"><br>
	    <label>PRICE:</label>
	    <input class="input-box" type="text" id="price"  name="price" value=<%=product.getPrice()%> readonly="readonly"> <br>
	   	<label>DESCRIPTION:</label> 
	    <input class="input-box" type="text" name="discription" value=<%=product.getDiscription()%> readonly="readonly"> <br>
	    <label>MFG Date:</label>
	    <input class="input-box" type="text" name="mfg" value=<%=product.getMgfDate()%> readonly="readonly"><br>
	    <label>EXP Date:</label>
	    <input class="input-box" type="text" name="exp" value=<%=product.getExpDate()%> readonly="readonly"><br>
	    <label>QUANTITY:</label>
	    <input class="input-box" id="quantity" type="number" name="qty" min="1" required="required"><br>
	    <label>Payable Amount :</label>
	    <input class="input-box" type="text" name="pam" id="result" readonly><br>
	    <input class="input-box" type="text" name="oid" value=<%=product.getUserId()%> hidden>
	    <input class="input-box" type="text" name="bid" value=<%=user.getUserId()%> hidden>
	    <input class="input-box" type="text" name="pid" value=<%=product.getProductId()%> hidden><br>
	    
	    <label>
        <input type="radio" name="payment-option" value="cash-on-delivery">
        Cash on Delivery
	   </label>
	   <label>
	       <input type="radio" name="payment-option" value="payed-online">
	       Pay Online
	   </label>
    
    </div>
    
    
    <div class="form2">
	     <label for="name">Full Name: </label> 
	     <input class="input-box" type="text" name="bname" id="bname" value="<%=user.getFirstName()+' '+user.getLastName()%>" readonly="readonly"> 
	     <br>
	     <label for="tel">Phone Number:</label> 
	     <input class="input-box" type="text" name="phone" id="phone" value="<%=user.getPhone()%>" readonly="readonly"> 
	     <br>
	     <label for="tel">Email:</label> 
	     <input class="input-box" type="text" name="email" id="email" value="<%=user.getEmail()%>" readonly="readonly"> 
	     <br>
	     <label for="address">Billing Address:  </label> 
	   	 <input class="input-box" type="text" name="address" id="address" placeholder="Enter address" required> 
	   	 <br>
	     <label for="city"> City:  </label> 
	     <input class="input-box" type="text" name="city" id="city" placeholder="Enter city"  required>
	     <br>
	     <label for="state"> State: </label> 
	     <input class="input-box" type="text" name="state" id="state" placeholder="Enter state" required> 
	     <br>
	     <label for="zip"> Zip Code: </label> 
	     <input class="input-box" type="text" name="zip" id="zip" placeholder="123 456" maxlength="6" pattern="[0-9]{6}" required>    
    </div> 
 </div>
    
</div>
 
    <div class="payment-form" id="payment-form" style="display: none;">
        <!-- Your payment form fields go here -->
        <div class="col"> 
            <h3 class="title">Payment</h3> 

            <div class="inputBox"> 
                <label for="name"> 
                    Card Accepted: 
                </label> 
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTg9KOvY1S8ZJsDkrj1yqhmhbdtrAJ51xNyoF1PIQso2pTQ7t-GsJnzo-krVxnWnEYf7w&usqp=CAU"
                    alt="credit/debit card image" style="width: 200px; height: 32px;"> 
            </div> 

            <div class="inputBox"> 
                <label  for="cardName"> 
                    Name On Card: 
                </label> 
                <input class="input-box" type="text" id="cardName"
                    placeholder="Enter card name"
                    > 
            </div> 

            <div class="inputBox"> 
                <label for="cardNum"> 
                    Credit Card Number: 
                </label> 
                <input class="input-box" type="text" id="cardNum"
                    placeholder="1111-2222-3333-4444"
                    maxlength="19" > 
            </div> 
		<div class="flex" style="display: flex;"> 
            <div class="inputBox"> 
                <label for="">Exp Month:</label> 
                <select name="" id="month"> 
                    <option value="">Choose month</option> 
                    <option value="January">January</option> 
                    <option value="February">February</option> 
                    <option value="March">March</option> 
                    <option value="April">April</option> 
                    <option value="May">May</option> 
                    <option value="June">June</option> 
                    <option value="July">July</option> 
                    <option value="August">August</option> 
                    <option value="September">September</option> 
                    <option value="October">October</option> 
                    <option value="November">November</option> 
                    <option value="December">December</option> 
                </select> 
            </div> 

            
                <div class="inputBox"> 
                    <label for="">Exp Year:</label> 
                    <select name="" id="year"> 
                        <option value="">Choose Year</option> 
                        <option value="2023">2023</option> 
                        <option value="2024">2024</option> 
                        <option value="2025">2025</option> 
                        <option value="2026">2026</option> 
                        <option value="2027">2027</option> 
                    </select> 
                </div>
               </div> 
             

                <div class="inputBox" style="margin-top: 20px"> 
                    <label for="cvv">CVV</label> 
                    <input class="input-box" type="text" id="cvv"
                        placeholder="123" maxlength="3" pattern="[0-9]{3}"> 
                </div> 
           
        </div> 
        <button id="confirm-online-order">Confirm Order</button>
    </div>

    <button id="confirm-order" style="display: none;margin-left: 280px">Confirm Order</button>
</form>
<script>

const quantityInput = document.getElementById('quantity');
const priceInput = document.getElementById('price');
const resultInput = document.getElementById('result');


function updateResult() {
    const quantity = parseFloat(quantityInput.value);
    const price = parseFloat(priceInput.value);
    const result = quantity * price;

   
    resultInput.value = isNaN(result) ? '' : result.toFixed(2);
}

quantityInput.addEventListener('input', updateResult);
priceInput.addEventListener('input', updateResult);



    // Add event listener to radio buttons
    document.querySelectorAll('input[name="payment-option"]').forEach((radio) => {
        radio.addEventListener('change', function() {
            const paymentForm = document.getElementById('payment-form');
            const confirmOrderButton = document.getElementById('confirm-order');

            if (this.value === 'payed-online') {
                // Show the payment form if "Pay Online" is selected
                paymentForm.style.display = 'block';
                confirmOrderButton.style.display = 'none'; // Hide the Confirm Order button for online payment

                // Make the fields required when "Cash on Delivery" is selected
                document.getElementById('cardName').setAttribute('required', 'required');
                document.getElementById('cardNum').setAttribute('required', 'required');
                document.getElementById('month').setAttribute('required', 'required');
                document.getElementById('year').setAttribute('required', 'required');
                document.getElementById('cvv').setAttribute('required', 'required');
                
            } else if(this.value === 'cash-on-delivery') {
                // Hide the payment form otherwise
                paymentForm.style.display = 'none';
                confirmOrderButton.style.display = 'block'; // Show the Confirm Order button for cash on delivery

               
                // Make the fields not required when "Pay Online" is selected
                document.getElementById('cardName').removeAttribute('required');
                document.getElementById('cardNum').removeAttribute('required');
                
                document.getElementById('month').removeAttribute('required');
                document.getElementById('year').removeAttribute('required');
                
                document.getElementById('cvv').removeAttribute('required');
            }
        });
    });

    let cardNumInput = 
        document.querySelector('#cardNum') 

    cardNumInput.addEventListener('keyup', () => { 
        let cNumber = cardNumInput.value 
        cNumber = cNumber.replace(/\s/g, "") 

        if (Number(cNumber)) { 
            cNumber = cNumber.match(/.{1,4}/g) 
            cNumber = cNumber.join(" ") 
            cardNumInput.value = cNumber 
        } 
    });
</script>


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