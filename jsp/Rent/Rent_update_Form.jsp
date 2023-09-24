<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<html lang="en">
  <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      
        <!-- Font online-->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
      
<!--        Animate.css-->
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
                
                                
        <link rel="stylesheet" href="main.css" >
        
        <!-- Google JQuery CDN -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        
        <script src="form.js"></script>
<style>
  * {
    margin: 0;
    padding: 0;
}

html{
    width: 100%;
    height: 100vh;
}

body {
    background: #e5e5e5;
    width: 100%;
    text-align: center;
    font-family: 'Open Sans', sans-serif;
    font-weight: 600;
    letter-spacing: 1px;
}

.panel{
    width: 450px;
    max-width: 90%;
    height: 750px;
    background:url('https://picsum.photos/1000/1500?image=827')  #fff;
    background-repeat:no-repeat;
    background-position: top center;
    background-size: cover;
    margin:5% auto 0px;
    margin-top: 30px;
}




.shadow1{
  -webkit-box-shadow:  0 20px 15px -15px rgba(119, 119, 119, 0.85);
     -moz-box-shadow:  0 20px 15px -15px rgba(119, 119, 119, 0.85);
          box-shadow:  0 40px 30px -30px rgba(119, 119, 119, 0.85);
}


form{
    height: 700px;
    padding: 50px;
}

.panel-switch{
    text-align: center;
    margin-top: 30px;
}

.panel-switch button{
    display: inline-block;
    width: 100px;
    height: 40px;
    background: #f03699;
    margin: 0px 10px 5px;
    border: none;
    color: #fff;
    font-family: 'Open Sans', sans-serif;
    text-transform: uppercase;
    font-weight: 600;
    letter-spacing: 2px;
    font-size: 0.8em;
    
    transition: background-color 0.2s , color:0.2s , opacity:0.2s;
}

.panel-switch button:active{
    background: #b52773;
    color: #c9c9c9;
}

.active-button{
    opacity: 0.5;
}

button , .button , a {
    cursor: pointer;
}

form h1{
    color: #fff;
    font-family: 'Open Sans', sans-serif;
    text-transform: uppercase;
    font-weight: 600;
    letter-spacing: 4px;
    margin: 5px 0;
    font-size: 1.7em;
}

fieldset{
    border: none;
}

.animate1 , .animate2 , .animate3 , .animate4{
    -webkit-animation-duration: 2s;
    -moz-animation-duration: 2s;
}

.animate1
{
    -webkit-animation-delay: 0.2s;
    -moz-animation-delay: 0.2s;
}

.animate2
{
    -webkit-animation-delay: 0.7s;
    -moz-animation-delay: 0.7s;
}

.animate3
{
    -webkit-animation-delay: 1.1s;
    -moz-animation-delay: 1.1s;
}

.animate4
{
    -webkit-animation-delay: 1.5s;
    -moz-animation-delay: 1.5s;
}

.animate5
{
    -webkit-animation-delay: 2.2s;
    -moz-animation-delay: 2.2s;
}

@-webkit-keyframes fadeInUp {
  from {
    opacity: 0;
    -webkit-transform: translate3d(0, 100%, 0);
    transform: translate3d(0, 100%, 0);
  }

  to {
    opacity: 1;
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0);
  }
}

@keyframes fadeInUp {
  from {
    opacity: 0;
    -webkit-transform: translate3d(0, 100%, 0);
    transform: translate3d(0, 100%, 0);
  }

  to {
    opacity: 1;
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0);
  }
}

fieldset input{
    background: rgba(255, 255, 255, 0.2);
    border: none;
    border-radius: 5em;
    height: 20px;
    width: 80%;
    margin: 10px 0;
    padding: 5px;
    text-indent: 10px;
    color: #fff;
    font-weight: 600;
}

fieldset input::placeholder {
    color: #c7c6c6;
}


fieldset input:focus {
    outline:;
    border: 1px solid rgba(0, 0, 0, 0.2);
    border-radius: 5em;
    margin: 9px 0;
}

.login_form{
    position: relative;
    bottom:0;
    width: 70%;
    height: 4em;
    margin-top: 20px;
    border: none;
    border-radius: 10em;
    background: #f03699;
    color: #fff;
    font-family: 'Open Sans', sans-serif;
    text-transform: uppercase;
    font-weight: 600;
    letter-spacing: 2px;
    z-index: 1;
    
    transition: background-color 0.2s , color:0.2s;
}

#login-form-submit:active{
    background: #b52773;
    color: #c9c9c9;
}

p , a{
    margin: 0;
    padding: 0;
}

a{
    color: #898787;
    font-size: 0.7em;
    text-decoration: none;
}

.hidden{
    display: none;
}

/*MEDIA QUERIES     */

@media (max-height:800px) {

    body{
        max-height: 100vh;
    }

  .panel{
        width: 450px;
        max-width: 90%;
        background-size: cover;
        margin: 1% auto;
    }
    
}

@media (max-width:500px) {

    html, body{
        background:url(https://picsum.photos/3695/5543?image=827)  #fff;
        background-repeat:no-repeat;
        background-position: top center;
        background-size: cover;
        height: 100vh;
        margin: 0px;
        padding: 0px;
        position: fixed;
    }
    
    .panel{
        background: none;
        box-shadow: none;
    }
    
    
    form{
        padding: 50px;
    }

    .panel-switch{
        margin-top: 30px;
    }

    .panel-switch button{
        display: inline-block;
        width: 80px;
        margin: 0px 10px 50px;
        font-weight: 600;
        font-size: 0.7em;
    }
    
    form h1{
        font-size: 1.5em;
    }
    
    .login_form{
        bottom:0;
        width: 70%;
        margin-top: 100px;
    }
    
}
</style>
    </head>
    <body>
        <div>
           <div class="panel shadow1">
                <form class="login-form" method="post" action="Rent_update_Pro.jsp">
                    <h1 class="animated fadeInUp animate1" id="title-login">대여 정보 수정</h1>
                
                    <h5>수정하려는 대여 정보를 입력하세요</h5>
                    <br>
                  
                    <h1 class="animated fadeInUp animate1 hidden" id="title-signup"></h1>
                    <fieldset id="login-fieldset">
                        <input class="login animated fadeInUp animate2" name="car_rent_id" type="textbox"  required   placeholder="대여ID" value="" >
                        <input class="login animated fadeInUp animate3" name="car_id" type="text" required placeholder="캠핑카ID" value="">
                        <input class="login animated fadeInUp animate3" name="cus_driver_license_id" type="text" required placeholder="고객 운전면허증ID" value="">
                        <input class="login animated fadeInUp animate3" name="rent_start_date" type="text" onfocus="(this.type='date')" required placeholder="대여 시작일" value="">
                        <input class="login animated fadeInUp animate3" name="rent_end_date" type="text" onfocus="(this.type='date')" required placeholder="대여 종료일" value="">
                        <input class="login animated fadeInUp animate3" name="rent_period" type="text" required placeholder="대여기간" value="">
                        <input class="login animated fadeInUp animate3" name="price" type="text" required placeholder="청구비용" value="">
                        <input class="login animated fadeInUp animate3" name="price_deadline" type="text" onfocus="(this.type='date')" required placeholder="납입기한" value="">
                        <input class="login animated fadeInUp animate3" name="add_price" type="text" required placeholder="추가비용" value="">
                        <input class="login animated fadeInUp animate3" name="add_contents" type="text" required placeholder="추가사항" value="">
                    </fieldset>
                    <input type="submit" class="login_form button animated fadeInUp animate4" action="Rent_update_Pro.jsp" value="입력완료">

                </form>
            </div>
        </div>
        <script src="form.js"></script>
    </body>
</html>