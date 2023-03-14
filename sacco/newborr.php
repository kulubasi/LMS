<?php
      // session_start();
      include("db_connect.php");
      require "vendor/autoload.php";
      use PHPMailer\PHPMailer\PHPMailer;
      use PHPMailer\PHPMailer\SMTP;

      if (isset($_POST['newbor']) && isset($_FILES['upload_img']) ){
        $img_name=$_FILES['upload_img']['name'];
        $img_size=$_FILES['upload_img']['size'];
        $tmp_name=$_FILES['upload_img']['tmp_name'];
        $error=$_FILES['upload_img']['error'];

        $fn=$_POST['fname'];
        $mn=$_POST['mname'];
        $ln=$_POST['lname'];
        $address=$_POST['address'];
        $contact=$_POST['contact'];
        $email=$_POST['email'];
        $taxid=$_POST['taxid'];
        

        if ($error === 0) {
          if ($img_size>500000000 ) {
            $em="Sorry your file is too large";
            header("Location:index.php?error=$em");
          }
          else{
            $img_ex= pathinfo($img_name,PATHINFO_EXTENSION);
            $img_ex_lc=strtolower($img_ex);
            $allowed_ex=array("jpg","png","jpeg");

            if (in_array($img_ex_lc, $allowed_ex)) {
              $new_img_name=uniqid("IMG-",true).'.'.$img_ex_lc;
              $img_upload_path="assets/uploads/".$new_img_name;
              move_uploaded_file($tmp_name, $img_upload_path);

             

              // insert into database

              $sql = "INSERT INTO borrowers (firstname,middlename,lastname,contact_no,upload_img,address,email,tax_id) VALUES ('".$fn."', '".$mn."','".$ln."','".$contact."','".$new_img_name."','".$address."','".$email."', '".$taxid."' )";

                $mail = new PHPMailer(true);
                $mail->isSMTP();
                $mail->SMTPAuth = true;

                $mail->Host = "mail.dscmuni.com";
                $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
                $mail->Port = 587;

                $mail->Username = "support@dscmuni.com";
                $mail->Password = "Mawarich@2023";

                $mail->setFrom("support@dscmuni.com", "Sacco Borrower Management");
                $mail->addAddress($email);

                $mail->Subject = "Borrower Profile";
                $mail->Body    ="Hey ".$fn." ".$mn." ".$ln." Your Borrower profile has been created successfully with contact".$contact ;
                // $mail->IsHTML(true);

              if (mysqli_query($conn, $sql)) {
                
                
                $mail->send();
                echo '<script type="text/javascript">alert("Borrower added successfully ");window.location=\'index.php\';</script>'; 
              } 
              else {
                echo "Error: " . $sql . "<br>" . mysqli_error($conn);
              }

            }


            // nyok
            else{
              $em="You cant upload files of this type. Please upload .jpg, .png, .jpeg file types ";
              header("Location:index.php?error=$em");

            }
          }
        }

      }
      else{
          $em="anknown ERROR occurred";
          header("Location:index.php?error=$em");
        }


      ?>