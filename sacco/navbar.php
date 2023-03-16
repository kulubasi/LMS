
<style>
</style>
<nav id="sidebar" class='mx-lt-5 bg-white' >
	
		<div class="sidebar-list">

				<a href="index.php?page=home" class="nav-item nav-home"><span class='icon-field'><i class="fa fa-home"></i></span> Home</a>
				<a href="index.php?page=loans" class="nav-item nav-loans"><span class='icon-field'><i class="fa fa-file-invoice-dollar"></i></span> Loans</a>	
				<a href="index.php?page=payments" class="nav-item nav-payments"><span class='icon-field'><i class="fa fa-money-bill"></i></span> Payments</a>
				<a href="index.php?page=borrowers" class="nav-item nav-borrowers"><span class='icon-field'><i class="fa fa-user-friends"></i></span> Borrowers</a>
				<a href="index.php?page=plan" class="nav-item nav-plan"><span class='icon-field'><i class="fa fa-list-alt"></i></span> Loan Plans</a>	
				<a href="index.php?page=loan_type" class="nav-item nav-loan_type"><span class='icon-field'><i class="fa fa-th-list"></i></span> Loan Types</a>		
				<?php if($_SESSION['login_type'] == 1): ?>
				<a href="index.php?page=users" class="nav-item nav-users"><span class='icon-field'><i class="fa fa-users"></i></span> Users</a>
				<?php endif; ?>
				<a class="nav-item nav-users" data-bs-toggle="modal" data-bs-target="#notificationModal"><span class='icon-field'><i class="fa fa-users"></i></span> Notifications</a>

				<a href="ajax.php?action=logout" class="nav-item nav-users"><span class='icon-field'><i class="fa fa-lock"></i></span> Logout</a>
				
		</div>

</nav>

	<div class="modal fade" id="notificationModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">Send Notification</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form method="POST" action="newnot.php">
			  <div class="mb-3">
			    <label for="exampleInputEmail1" class="form-label">To </label>
			    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter valid Email address">
			    
			  </div>
			  <div class="mb-3">
			    <label for="exampleInputPassword1" class="form-label">Message</label>
			    <input type="text" name="msg" class="form-control" id="exampleInputPassword1" placeholder="Enter message">
			  </div>
			  
			  <button type="submit" name="sendnoti" class="btn btn-primary">Send</button>
			</form>
	      </div>
	      
	    </div>
	  </div>
	</div>
<script>
	$('.nav-<?php echo isset($_GET['page']) ? $_GET['page'] : '' ?>').addClass('active')
</script>
