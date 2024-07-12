<?php
    session_start();
    $random_alpha = md5(rand());
    $captcha_code = substr($random_alpha, 0, 5);
    $_SESSION["captcha_code"] = $captcha_code;
    $target_layer = imagecreatetruecolor(200,40);
    $captcha_background = imagecolorallocate($target_layer, 0, 0, 0);
    imagefill($target_layer,0,0,$captcha_background);
    $captcha_text_color = imagecolorallocate($target_layer,rand(0,255), rand(0,250), rand(0,300));
    // for($i=0;$i<10;$i++) {
    //     imagestring($target_layer,0,rand()%50,200,rand()%50,$line_color);
    // }
    imagestring($target_layer, 5, 5, 5, $captcha_code, $captcha_text_color);
    // $line_color = imagecolorallocate($target_layer, 64,64,64); 
    // for($i=0;$i<10;$i++) {
    //     imageline($target_layer,0,rand()%50,200,rand()%50,$line_color);
    // }
    // $pixel_color = imagecolorallocate($target_layer, 0,0,255);
    // for($i=0;$i<1000;$i++) {
    //     imagesetpixel($target_layer,rand()%200,rand()%50,$pixel_color);
    // }  
    header("Content-type: image/jpeg");
    imagejpeg($target_layer);

?>