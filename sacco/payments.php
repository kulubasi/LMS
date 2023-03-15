<?php include 'db_connect.php' ?>

<div class="container-fluid">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-header">
				<large class="card-title">
					<b>Payment List</b>
					<button class="btn btn-primary  col-md-2 float-right" type="button" id="new_payments"><i class="fa fa-plus"></i> New Payment</button>
					<button onclick="printDiv()" class="btn btn-success  col-md-2 float-right" type="button" id="print_payment" style="margin-right: 10px;" ><i class="fa fa-print"></i> Print</button>
				</large>
				    
			</div>
			<div class="card-body" id="loan_listing">
				<table class="table table-bordered" id="loan-list">
					<colgroup>
						<col width="10%">
						<col width="25%">
						<col width="25%">
						<col width="20%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th class="text-center">#</th>
							<th class="text-center">Loan Reference No</th>
							<th class="text-center">Payee</th>
							<th class="text-center">Amount</th>
							<th class="text-center">Penalty</th>
							<th class="text-center">Action</th>
						</tr>
					</thead>
					<tbody>
						<?php
							
							$i=1;
							
							$qry = $conn->query("SELECT p.*,l.ref_no,concat(b.lastname,', ',b.firstname,' ',b.middlename)as name, b.contact_no, b.address from payments p inner join loan_list l on l.id = p.loan_id inner join borrowers b on b.id = l.borrower_id  order by p.id asc");
							while($row = $qry->fetch_assoc()):
								

						 ?>
						 <tr>
						 	
						 	<td class="text-center"><?php echo $i++ ?></td>
						 	<td>
						 		<?php echo $row['ref_no'] ?>
						 	</td>
						 	<td>
						 		<?php echo $row['payee'] ?>
						 		
						 	</td>
						 	<td>
						 		<?php echo number_format($row['amount'],2) ?>
						 		
						 	</td>
						 	<td class="text-center">
						 		<?php echo number_format($row['penalty_amount'],2) ?>
						 	</td>
						 	<td class="text-center">
						 			<button class="btn btn-primary edit_payment" type="button" data-id="<?php echo $row['id'] ?>"><i class="fa fa-edit"></i></button>
						 			<button class="btn btn-danger delete_payment" type="button" data-id="<?php echo $row['id'] ?>"><i class="fa fa-trash"></i></button>
						 	</td>

						 </tr>

						<?php endwhile; ?>
					</tbody>
				</table>
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
            var loan_listing = document.getElementById("loan_listing").innerHTML;
            var a = window.open('', '', 'height=500, width=500');
            a.document.write('<html>');
            a.document.write('<body > <h1>PAYMENT LIST <br>');
            a.document.write(loan_listing);
            a.document.write('</body></html>');
            a.document.close();
            a.print();
        }
    </script>

<script>
	$('#loan-list').dataTable()
	$('#new_payments').click(function(){
		uni_modal("New Payment","manage_payment.php",'mid-large')
	})
	$('.edit_payment').click(function(){
		uni_modal("Edit Payment","manage_payment.php?id="+$(this).attr('data-id'),'mid-large')
	})
	$('.delete_payment').click(function(){
		_conf("Are you sure to delete this data?","delete_payment",[$(this).attr('data-id')])
	})
function delete_payment($id){
		start_load()
		$.ajax({
			url:'ajax.php?action=delete_payment',
			method:'POST',
			data:{id:$id},
			success:function(resp){
				if(resp==1){
					alert_toast("Payment successfully deleted",'success')
					setTimeout(function(){
						location.reload()
					},1500)

				}
			}
		})
	}
</script>