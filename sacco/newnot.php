<?php
      // session_start();
      
      require "vendor/autoload.php";
      use PHPMailer\PHPMailer\PHPMailer;
      use PHPMailer\PHPMailer\SMTP;

      if (isset($_POST['sendnoti'])){

        $em=$_POST['email'];
        $msg=$_POST['msg'];
        

        // insert into database

          $mail = new PHPMailer(true);
          $mail->isSMTP();
          $mail->SMTPAuth = true;

          $mail->Host = "mail.dscmuni.com";
          $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
          $mail->Port = 587;

          $mail->Username = "support@dscmuni.com";
          $mail->Password = "Mawarich@2023";

          $mail->setFrom("support@dscmuni.com", "Sacco Notifications");
          $mail->addAddress($em);

          $mail->Subject = "Sacco Notification";
          $mail->Body    =$msg;
          // $mail->IsHTML(true);
          
          
          $mail->send();
          echo '<script type="text/javascript">alert("Notification has been sent successfully ");window.location=\'index.php\';</script>'; 
        
        
            
          
        

      }
     

      ?>