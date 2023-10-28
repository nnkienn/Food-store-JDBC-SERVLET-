<%@page import="com.prj.model.ProductModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="com.prj.main.User"%>
<%@page import="com.prj.main.Product"%>

<%@page import="com.prj.*"%>
<%@page import="com.prj.connection.*"%>
<%@page import="java.util.List"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
	}

ProductModel pd = new ProductModel(DbCon.getConnection());
List<Product> products = pd.getAllProduct();

%>


<html>
<%@include file="includes/head.jsp"%>

<body>
	<%@include file="includes/Navbar.jsp"%>

	<div id="page-content" class="page-content">
		<div class="banner">
			<div class="jumbotron jumbotron-bg text-center rounded-0"
				style="background-image: url('assets/img/bg-header.jpg');">
				<div class="container">
					<h1 class="pt-5">Shopping Page</h1>
					<p class="lead">Save time and leave the groceries to us.</p>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="shop-categories owl-carousel mt-5">
						<div class="item">
							<a href="shop.jsp">
								<div
									class="media d-flex align-items-center justify-content-center">
									<span class="d-flex mr-2"><i class="sb-bistro-carrot"></i></span>
									<div class="media-body">
										<h5>Vegetables</h5>
										<p>Freshly Harvested Veggies From Local Growers</p>
									</div>
								</div>
							</a>
						</div>
						<div class="item">
							<a href="shop.jsp">
								<div
									class="media d-flex align-items-center justify-content-center">
									<span class="d-flex mr-2"><i class="sb-bistro-apple"></i></span>
									<div class="media-body">
										<h5>Fruits</h5>
										<p>Variety of Fruits From Local Growers</p>
									</div>
								</div>
							</a>
						</div>
						<div class="item">
							<a href="shop.jsp">
								<div
									class="media d-flex align-items-center justify-content-center">
									<span class="d-flex mr-2"><i class="sb-bistro-roast-leg"></i></span>
									<div class="media-body">
										<h5>Meats</h5>
										<p>Protein Rich Ingridients From Local Farmers</p>
									</div>
								</div>
							</a>
						</div>
						<div class="item">
							<a href="shop.jsp">
								<div
									class="media d-flex align-items-center justify-content-center">
									<span class="d-flex mr-2"><i class="sb-bistro-fish-1"></i></span>
									<div class="media-body">
										<h5>Fishes</h5>
										<p>Protein Rich Ingridients From Local Farmers</p>
									</div>
								</div>
							</a>
						</div>
						<div class="item">
							<a href="shop.jsp">
								<div
									class="media d-flex align-items-center justify-content-center">
									<span class="d-flex mr-2"><i
										class="sb-bistro-french-fries"></i></span>
									<div class="media-body">
										<h5>Frozen Foods</h5>
										<p>Protein Rich Ingridients From Local Farmers</p>
									</div>
								</div>
							</a>
						</div>
						<div class="item">
							<a href="shop.jsp">
								<div
									class="media d-flex align-items-center justify-content-center">
									<span class="d-flex mr-2"><i class="sb-bistro-appetizer"></i></span>
									<div class="media-body">
										<h5>Packages</h5>
										<p>Protein Rich Ingridients From Local Farmers</p>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<section id="most-wanted" class="gray-bg">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h2 class="title">most-wanted</h2>
						<div class="product-carousel owl-carousel">

							<%				
    							for (Product p : products) {
							%>
							<div class="item">
								<div class="card card-product">
									<div class="card-ribbon">
										<div class="card-ribbon-container right">
											<span class="ribbon ribbon-primary">SPECIAL</span>
										</div>
									</div>
									<div class="card-badge">
										<div class="card-badge-container left">
											<span class="badge badge-default"> Until 2018 </span> <span
												class="badge badge-primary"> <%= p.getRegular()%>%
												OFF
											</span>
										</div>
										<img src="assets/img/frozen.jpg" alt="Card image"
											class="card-img-top">
									</div>
									<div class="card-body">
										<h4 class="card-title">
										<a href="detail-product?id=<%=p.getId() %>"><%= p.getTitle() %></a>
										</h4>
										<div class="card-price">
											<span class="reguler"><%= p.getRegular() + p.getRegular() * p.getDiscount() * 0.1 %>
												$</span> <span class="discount"><%= p.getRegular() %> $</span>
										</div>
										<a href="add-to-cart" class="btn btn-block btn-primary">
											Add to Cart </a>
									</div>
								</div>
							</div>
							<% }  %>


						</div>
					</div>
				</div>
			</div>
		</section>

		<section id="vegetables" class="gray-bg">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h2 class="title">Vegetables</h2>
						<div class="product-carousel owl-carousel">

							<%				
    							for (Product p : products) {
        							if (p.getType().equals("vegetables")) {
							%>
							<div class="item">
								<div class="card card-product">
									<div class="card-ribbon">
										<div class="card-ribbon-container right">
											<span class="ribbon ribbon-primary">SPECIAL</span>
										</div>
									</div>
									<div class="card-badge">
										<div class="card-badge-container left">
											<span class="badge badge-default"> Until 2018 </span> <span
												class="badge badge-primary"> <%= p.getRegular()%>%
												OFF
											</span>
										</div>
										<img src="assets/img/frozen.jpg" alt="Card image"
											class="card-img-top">
									</div>
									<div class="card-body">
										<h4 class="card-title">
										<a href="detail-product?id=<%=p.getId() %>"><%= p.getTitle() %></a>
										</h4>
										<div class="card-price">
											<span class="reguler"><%= p.getRegular() + p.getRegular() * p.getDiscount() * 0.1 %>
												$</span> <span class="discount"><%= p.getRegular() %> $</span>
										</div>
										<a href="add-to-cart" class="btn btn-block btn-primary">
											Add to Cart </a>
									</div>
								</div>
							</div>
							<% } } %>


						</div>
					</div>
				</div>
			</div>
		</section>

		<section id="meats" class="gray-bg">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h2 class="title">meats</h2>
						<div class="product-carousel owl-carousel">

							<%				
    							for (Product p : products) {
        							if (p.getType().equals("meats")) {
							%>
							<div class="item">
								<div class="card card-product">
									<div class="card-ribbon">
										<div class="card-ribbon-container right">
											<span class="ribbon ribbon-primary">SPECIAL</span>
										</div>
									</div>
									<div class="card-badge">
										<div class="card-badge-container left">
											<span class="badge badge-default"> Until 2018 </span> <span
												class="badge badge-primary"> <%= p.getRegular()%>%
												OFF
											</span>
										</div>
										<img src="assets/img/frozen.jpg" alt="Card image"
											class="card-img-top">
									</div>
									<div class="card-body">
										<h4 class="card-title">
											<a href="detail-product.jsp"><%= p.getTitle() %></a>
										</h4>
										<div class="card-price">
											<span class="reguler"><%= p.getRegular() + p.getRegular() * p.getDiscount() * 0.1 %>
												$</span> <span class="discount"><%= p.getRegular() %> $</span>
										</div>
										<a href="detail-product.jsp" class="btn btn-block btn-primary">
											Add to Cart </a>
									</div>
								</div>
							</div>
							<% } } %>


						</div>
					</div>
				</div>
			</div>
		</section>

		<section id="fishes" class="gray-bg">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h2 class="title">fishes</h2>
						<div class="product-carousel owl-carousel">

							<%				
    							for (Product p : products) {
        							if (p.getType().equals("fishes")) {
							%>
							<div class="item">
								<div class="card card-product">
									<div class="card-ribbon">
										<div class="card-ribbon-container right">
											<span class="ribbon ribbon-primary">SPECIAL</span>
										</div>
									</div>
									<div class="card-badge">
										<div class="card-badge-container left">
											<span class="badge badge-default"> Until 2018 </span> <span
												class="badge badge-primary"> <%= p.getRegular()%>%
												OFF
											</span>
										</div>
										<img src="assets/img/frozen.jpg" alt="Card image"
											class="card-img-top">
									</div>
									<div class="card-body">
										<h4 class="card-title">
											<a href="detail-product.jsp"><%= p.getTitle() %></a>
										</h4>
										<div class="card-price">
											<span class="reguler"><%= p.getRegular() + p.getRegular() * p.getDiscount() * 0.1 %>
												$</span> <span class="discount"><%= p.getRegular() %> $</span>
										</div>
										<a href="detail-product.jsp" class="btn btn-block btn-primary">
											Add to Cart </a>
									</div>
								</div>
							</div>
							<% } } %>


						</div>
					</div>
				</div>
			</div>
		</section>


	</div>


	<%@include file="includes/footer.jsp"%>

</body>
</html>
