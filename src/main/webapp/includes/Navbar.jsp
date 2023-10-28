
<div class="page-header">
	<nav
		class="navbar fixed-top navbar-expand-md navbar-dark bg-transparent"
		id="page-navigation">
		<div class="container">
			<a href="index.jsp" class="navbar-brand"> <img
				src="assets/img/logo/logo.png" alt="">
			</a>

			<!-- Toggle Button -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarcollapse" aria-controls="navbarCollapse"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarcollapse">
				<!-- Navbar Menu -->
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="shop.jsp" class="nav-link">Shop</a>

						<%if(auth == null){ %></li>
					<li class="nav-item"><a href="register.jsp" class="nav-link">Register</a>
					</li>
					<li class="nav-item"><a href="login.jsp" class="nav-link">Login</a>
					</li>
					<%}; %>
					<%if(auth != null){ %>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="javascript:void(0)"
						id="navbarDropdown" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
							<div class="avatar-header">
								<img src="assets/img/logo/avatar.jpg">
							</div> John Doe
					</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="transaction.jsp">Transactions
								History</a> <a class="dropdown-item" href="setting.jsp">Settings</a>

							<a class="dropdown-item" href="Log-out">Logout</a>


						</div></li>
					<% } %>

					<li class="nav-item dropdown"><a href="javascript:void(0)"
						class="nav-link dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <i
							class="fa fa-shopping-basket"></i> <span
							class="badge badge-primary">5</span>
					</a>
						<div class="dropdown-menu shopping-cart">
							<ul>
								<li>
									<div class="drop-title">Your Cart</div>
								</li>
								
								<li class="d-flex justify-content-between pl-3 pr-3 pt-3">
									<a href="cart.jsp" class="btn btn-secondary">View Cart</a> <a
									href="checkout.jsp" class="btn btn-primary">Checkout</a>
								</li>
							</ul>
						</div></li>
				</ul>
			</div>

		</div>
	</nav>
</div>