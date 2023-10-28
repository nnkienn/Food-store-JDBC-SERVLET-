<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@include file="includes/head.jsp"%>

<body>

	<div id="page-content" class="page-content">
		<div class="banner">
			<div class="jumbotron jumbotron-bg text-center rounded-0"
				style="background-image: url('assets/img/bg-header.jpg');">
				<div class="container">
					<h1 class="pt-5">Register Page</h1>
					<p class="lead">Save time and leave the groceries to us.</p>

					<% String message = (String) request.getAttribute("message"); %>

					<% if (message != null) { %>
					<p class="lead"><%= message %></p>

					<% } %>
					<div class="card card-login mb-5">
						<div class="card-body">
							<form class="form-horizontal" method="post"
								action="register-user">
								<div class="form-group row mt-3">
									<div class="col-md-12">
										<input class="form-control" name="name" type="text"
											required="" placeholder="Full Name">
									</div>
								</div>
								<div class="form-group row mt-3">
									<div class="col-md-12">
										<input class="form-control" name="email" type="email"
											required="" placeholder="Email">
									</div>
								</div>


								<div class="form-group row">
									<div class="col-md-12">
										<input class="form-control" name="password" type="password"
											required="" placeholder="Password">
									</div>
								</div>

								<div class="form-group row">
									<div class="col-md-12">
										<div class="checkbox">
											<input id="checkbox0" type="checkbox" name="terms"> <label
												for="checkbox0" class="mb-0">I Agree with <a
												href="terms.html" class="text-light">Terms & Conditions</a>
											</label>
										</div>
									</div>
								</div>
								<div class="form-group row text-center mt-4">
									<div class="col-md-12">
										<button type="submit"
											class="btn btn-primary btn-block text-uppercase">Register</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
