<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="com.prj.main.Product"%>
<%@page import="com.prj.main.User"%>
<%@page import="com.prj.*"%>
<%@page import="com.prj.connection.*"%>
<%@page import="java.util.List"%>
<%@page import="com.prj.model.ProductModel"%>

<html>
<%@include file="includes/head.jsp"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

String productId = request.getParameter("id");
ProductModel pdm = new ProductModel(DbCon.getConnection());
Product pd = pdm.getProductById(productId);
%>


<body>
	<%@include file="includes/Navbar.jsp"%>

	<div id="page-content" class="page-content">
		<div class="banner">
			<div class="jumbotron jumbotron-bg text-center rounded-0"
				style="background-image: url('assets/img/bg-header.jpg');">
				<div class="container">
					<h1 class="pt-5">
						<%=pd.getTitle()%>
					</h1>
					<p class="lead">Save time and leave the groceries to us.</p>
				</div>
			</div>
		</div>
		<div class="product-detail">
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="slider-zoom">
							<a href="assets/img/meats.jpg" class="cloud-zoom"
								rel="transparentImage: 'data:image/gif;base64,R0lGODlhAQABAID/AMDAwAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==', useWrapper: false, showTitle: false, zoomWidth:'500', zoomHeight:'500', adjustY:0, adjustX:10"
								id="cloudZoom"> <img alt="Detail Zoom thumbs image"
								src="assets/img/meats.jpg" style="width: 100%;">
							</a>
						</div>

						<div class="slider-thumbnail">
							<ul class="d-flex flex-wrap p-0 list-unstyled">
								<li><a href="assets/img/meats.jpg"
									rel="gallerySwitchOnMouseOver: true, popupWin:'assets/img/meats.jpg', useZoom: 'cloudZoom', smallImage: 'assets/img/meats.jpg'"
									class="cloud-zoom-gallery"> <img itemprop="image"
										src="assets/img/meats.jpg" style="width: 135px;">
								</a></li>
								<li><a href="assets/img/fish.jpg"
									rel="gallerySwitchOnMouseOver: true, popupWin:'assets/img/fish.jpg', useZoom: 'cloudZoom', smallImage: 'assets/img/fish.jpg'"
									class="cloud-zoom-gallery"> <img itemprop="image"
										src="assets/img/fish.jpg" style="width: 135px;">
								</a></li>
								<li><a href="assets/img/vegetables.jpg"
									rel="gallerySwitchOnMouseOver: true, popupWin:'assets/img/vegetables.jpg', useZoom: 'cloudZoom', smallImage: 'assets/img/vegetables.jpg'"
									class="cloud-zoom-gallery"> <img itemprop="image"
										src="assets/img/vegetables.jpg" style="width: 135px;">
								</a></li>
								<li><a href="assets/img/frozen.jpg"
									rel="gallerySwitchOnMouseOver: true, popupWin:'assets/img/frozen.jpg', useZoom: 'cloudZoom', smallImage: 'assets/img/frozen.jpg'"
									class="cloud-zoom-gallery"> <img itemprop="image"
										src="assets/img/frozen.jpg" style="width: 135px;">
								</a></li>
							</ul>
						</div>

					</div>
					<div class="col-sm-6">
						<p>
							<strong>Overview</strong><br>
							<%=pd.getOverview()%>
						</p>
						<div class="row">
							<div class="col-sm-6">
								<p>
									<strong>Price</strong> (/Pack)<br> <span class="price">$
										<%=pd.getRegular()%></span> <span class="old-price"> 150.000$</span>
								</p>
							</div>
							<div class="col-sm-6 text-right">
								<p>
									<span class="stock available">In Stock: <%=pd.getStock()%></span>
								</p>
							</div>
						</div>
						<p class="mb-1">
							<strong>Quantity</strong>
						</p>
						<div class="row">
							<div class="col-sm-5">
								<input class="vertical-spin" type="text"
									data-bts-button-down-class="btn btn-primary"
									data-bts-button-up-class="btn btn-primary" value=""
									name="vertical-spin">
							</div>
							<div class="col-sm-6">
								<span class="pt-1 d-inline-block">Pack (250 gram)</span>
							</div>
						</div>

						<button class="mt-3 btn btn-primary btn-lg">
							<a href="add-to-cart?id=<%=pd.getId() %>" class="btn btn-block btn-primary"> Add
								to Cart </a>
						</button>
					</div>
				</div>
			</div>
		</div>


	</div>
	<%@include file="includes/footer.jsp"%>

</body>
</html>
