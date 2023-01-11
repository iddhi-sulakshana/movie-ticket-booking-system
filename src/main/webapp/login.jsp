<% //redirect
	String role = (String) session.getAttribute("logRole");
	if (role == "admin") {
		response.sendRedirect("mDashboard.jsp");
	}
	if (role == "user") {
		response.sendRedirect("uDashboard.jsp");
	}
%>
<%@include file="./header.jsp" %>
	<link rel="stylesheet" href="./css/login.css">
	<title>Login / Signup</title>
<%@include file="./nav.jsp" %>
	<!-- Body area -->
	<div class="mainFrame">
		<div class="wrapper">
			<div class="title-text">
				<div class="title login">Login</div>
				<div class="title signup">Signup</div>
			</div>
			<div class="form-container">
				<div class="slide-controls">
					<input type="radio" name="slide" id="login" checked>
					<input type="radio" name="slide" id="signup">
					<label for="login" class="slide login">Login</label>
					<label for="signup" class="slide signup">Signup</label>
					<div class="slider-tab"></div>
				</div>
				<div class="form-inner">
					<form name="logInForm" action="loginServlet" class="login" method="post">
						<div class="field">
							<input class="npt" name="email" type="text" placeholder="Email Address" required>
						</div>
						<div>
							<% String messageE = (String) session.getAttribute("loginEmailError");
								if(messageE != null) {
									out.print("<p style='color:red; font-size: 13px;'>" + messageE + "</p>");
									session.removeAttribute("loginEmailError");
								} %>
						</div>
						<div class="field">
							<input type="password" name="password" placeholder="Password" required>
						</div>
						<div>
							<% String messageP = (String) session.getAttribute("loginPasswordError");
								if(messageP != null) {
									out.print("<p style='color:red; font-size: 13px;'>" + messageP + "</p>");
									session.removeAttribute("loginPasswordError");
								} %>
						</div>
						<div class="field btn">
							<div class="btn-layer"></div>
							<input type="submit" value="Login">
						</div>
						<div class="signup-link">don't have an account?<a href="" style="color: #0000FF;"> Signup Now</a></div>
					</form>
					<form name="signInForm" action="#" class="signup" method="post">
						<div class="field">
							<input type="text" placeholder="Full Name" required>
						</div>
						<div class="field">
							<input type="text" placeholder="Email" required>
						</div>
						<div class="field">
							<input type="text" placeholder="Phone" required>
						</div>
						<div class="field">
							<input type="password" placeholder="Password" required>
						</div>
						<div class="field">
							<input type="password" placeholder="Confirm password" required>
						</div>
						<div class="field btn">
							<div class="btn-layer"></div>
							<input type="submit" value="Signup">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		const loginText = document.querySelector(".title-text .login");
		const loginForm = document.querySelector("form.login");
		const loginBtn = document.querySelector("label.login");
		const signupBtn = document.querySelector("label.signup");
		const signupLink = document.querySelector("form .signup-link a");
		signupBtn.onclick = (() => {
			loginForm.style.marginLeft = "-50%";
			loginText.style.marginLeft = "-50%";
		});
		loginBtn.onclick = (() => {
			loginForm.style.marginLeft = "0%";
			loginText.style.marginLeft = "0%";
		});
		signupLink.onclick = (() => {
			signupBtn.click();
			return false;
		});

	</script>
<%@include file="./footer.jsp" %>