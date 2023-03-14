<?php include 'db_connect.php' ?>

<div class="container-fluid">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-header">
				<large class="card-title">
					<b>Borrower List</b>
				</large>
				<!-- <button class="btn btn-primary col-md-2 float-right" type="button" id="new_borrower"><i class="fa fa-plus"></i> New Borrower</button> -->
				<button onclick="printDiv()" class="btn btn-success  col-md-2 float-right" type="button" id="print_payment" style="margin-right: 10px;" ><i class="fa fa-print"></i> Print</button>
				<button type="button" class="btn btn-primary float-right" data-bs-toggle="modal" data-bs-target="#exampleModal" style="margin-right: 10px;"><i class="fa fa-plus"></i>New Borrower</button>
			</div>


			<div class="card-body" id="borrower">
				<table class="table table-bordered" id="borrower-list">
					<colgroup>
						<col width="10%">
						<col width="35%">
						<col width="30%">
						<col width="15%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th class="text-center">#</th>
							<th class="text-center">Borrower</th>
							<th class="text-center">Current Loan</th>
							<th class="text-center">Next Payment Schedule</th>
							<th class="text-center">Action</th>
						</tr>
					</thead>
					  
					<tbody>
						<?php
						$i = 1;
							$qry = $conn->query("SELECT * FROM borrowers order by id desc");
							while($row = $qry->fetch_assoc()):

						 ?>
						 <tr>
						 	
						 	<td class="text-center"><?php echo $i++ ?></td>
						 	<td>
						 		<p>Name :<b><?php echo ucwords($row['lastname'].", ".$row['firstname'].' '.$row['middlename']) ?></b></p>
						 		<p>Address :<b><?php echo $row['address'] ?></b></p>
						 		<p>Contact # :<b><?php echo $row['contact_no'] ?></b></p>
						 		<p>Email :<b><?php echo $row['email'] ?></b></p>
						 		<p>Tax ID :<b><?php echo $row['tax_id'] ?></b></p>
						 		<p>Borrower Image:<a href="assets/uploads/<?= ($row['upload_img']); ?>" target="_blank"><?= ($row['upload_img']); ?></a></p>
						 		
						 	</td>
						 	<td class="">None</td>
						 	<td class="">N/A</td>
						 	<td class="text-center">
						 			<button class="btn btn-primary edit_borrower" type="button" data-id="<?php echo $row['id'] ?>"><i class="fa fa-edit"></i></button>
						 			<button class="btn btn-danger delete_borrower" type="button" data-id="<?php echo $row['id'] ?>"><i class="fa fa-trash"></i></button>
						 	</td>

						 </tr>

						<?php endwhile; ?>
					</tbody>
				</table>
			</div>
		</div>

		<!-- My form -->
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <form method="post" enctype="multipart/form-data" action="newborr.php">
			        	<div class="row">
			        		<div class="col-xs-6 col-md-4">
								<label>First Name.</label>
								<input type="text" name="fname" class="form-control" required>
							</div>
							<div class="col-xs-6 col-md-4">
								<label>Middle Name.</label>
								<input type="text" name="mname" class="form-control">
							</div>

							<div class="col-xs-6 col-md-4">
								<label>Last Name.</label>
								<input type="text" name="lname" class="form-control" required>
							</div>
							<div class="col-xs-6 col-md-6">
								<label>Address.</label>
								<input type="text" name="address" class="form-control" required>
							</div>
							<div class="col-xs-6 col-md-6">
								<label>Telephone Contact</label>
								<input type="text" name="contact" class="form-control" required>
							</div>
							<div class="col-xs-6 col-md-12">
								<label>Email</label>
								<input type="email" name="email" class="form-control" required>
							</div>
							
							<div class="col-12">
								<label>Upload your photo.</label>
								<input type="file" name="upload_img" class="form-control" required>
							</div>

							<div class="col-12">
								<br>
								<label>Tax ID</label>
								<input type="text" name="taxid" class="form-control" >
							</div>
							
						</div>
						<div class="row">
							<div class="col-12">
								<input type="submit" class="btn btn-secondary form-control" value="Save" name="newbor">
							</div>
						</div>
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			        <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
			      </div>
			    </div>
			  </div>
			</div>
	</div>
</div> 
<style>
	td p {
		margin:unset;
	}
	td img {
	    width: 8vw;
	    height: 12vh;
	}
	td{
		vertical-align: middle !important;
	}
</style>	
 <!-- Script to print the content of a div -->
 <script>
        function printDiv() {
            var borrower = document.getElementById("borrower").innerHTML;
            var a = window.open('', '', 'height=500, width=500');
            a.document.write('<html>');
            a.document.write('<body > <h1><center>BORROWERS LIST</center> <br>');
			a.document.write('<hr>');
            a.document.write(borrower);
            a.document.write('</body></html>');
            a.document.close();
            a.print();
        }
    </script>
<script>
	$('#borrower-list').dataTable()
	$('#new_borrower').click(function(){
		uni_modal("New borrower","manage_borrower.php",'mid-large')
	})
	$('.edit_borrower').click(function(){
		uni_modal("Edit borrower","manage_borrower.php?id="+$(this).attr('data-id'),'mid-large')
	})
	$('.delete_borrower').click(function(){
		_conf("Are you sure to delete this borrower?","delete_borrower",[$(this).attr('data-id')])
	})
function delete_borrower($id){
		start_load()
		$.ajax({
			url:'ajax.php?action=delete_borrower',
			method:'POST',
			data:{id:$id},
			success:function(resp){
				if(resp==1){
					alert_toast("borrower successfully deleted",'success')
					setTimeout(function(){
						location.reload()
					},1500)

				}
			}
		})
	}
</script>