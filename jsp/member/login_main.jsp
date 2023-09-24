<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>로그인</title>
<link href="login.css" rel="stylesheet" type="text/css">
<style>
  body{

    background-image: url("camp.png");
}
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
  }
  
  li {
  float: left;
  }
  
  li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  }
  
  li a:hover:not(.active) {
  background-color: #111;
  }
  
  .active {
  background-color: #04AA6D;
  }

.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 13px 30px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 12px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 5px;
  position: absolute; 
    top: 91px;
    left: 460px;
        font-weight: bold;
}


table {
  width: 1000px;
  text-align: center;
  border: 1px solid #fff;
  border-spacing: 1px;
  font-family: 'Cairo', sans-serif;
margin: auto;
}

caption {
  font-weight: bold;
}

table td {
  padding: 10px;
  background-color: #eee;
}

table th {
  background-color: #333;
  color: #fff;
  padding: 10px;
}

img {
  width: 90px;
  height: 90px;
}

.view,
.update,
.delete {
  border: none;
  padding: 5px 10px;
  color: #fff;
  font-weight: bold;
}


.update {
  background-color: #03A9F4;
border-radius: 5px;
}

.delete {
  background-color: #E91E63;
border-radius: 5px;
}

.tablefoot {
  padding: 0;
  border-bottom: 3px solid #009688;
}

.nav-bar{
position: fixed;
width: 200px;

}

.search {
position: absolute;
width: 300px;
top: 120px;
left: 860px;
}
.search_btn{
position:absolute;
width: 70px;
top: 0px;
left: 305px;
}

    :root {
        /* COLORS */
        --white: #e9e9e9;
        --gray: #333;
        --blue: #0367a6;
        --lightblue: #008997;
      
        /* RADII */
        --button-radius: 0.7rem;
      
        /* SIZES */
        --max-width: 758px;
        --max-height: 420px;
      
        font-size: 16px;
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
          Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
      }
      
      body {
  			background-image: url("camp.png");
        align-items: center;
        background-color: var(--white);
        background: url('camp.png');
        background-attachment: fixed;
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        display: grid;
        height: 100vh;
        place-items: center;
      }
      
      .form__title {
        font-weight: 300;
        margin: 0;
        margin-bottom: 1.25rem;
      }
      
      .link {
        color: var(--gray);
        font-size: 0.9rem;
        margin: 1.5rem 0;
        text-decoration: none;
      }
      
      .container {
        background-color: var(--white);
        border-radius: var(--button-radius);
        box-shadow: 0 0.9rem 1.7rem rgba(0, 0, 0, 0.25),
          0 0.7rem 0.7rem rgba(0, 0, 0, 0.22);
        height: var(--max-height);
        max-width: var(--max-width);
        overflow: hidden;
        position: relative;
        width: 100%;
      }
      
      .container__form {
        height: 100%;
        position: absolute;
        top: 0;
        transition: all 0.6s ease-in-out;
      }
      
      .container--signin {
        left: 0;
        width: 50%;
        z-index: 2;
      }
      
      .container.right-panel-active .container--signin {
        transform: translateX(100%);
      }
      
      .container--signup {
        left: 0;
        opacity: 0;
        width: 50%;
        z-index: 1;
      }
      
      .container.right-panel-active .container--signup {
        animation: show 0.6s;
        opacity: 1;
        transform: translateX(100%);
        z-index: 5;
      }
      
      .container__overlay {
        height: 100%;
        left: 50%;
        overflow: hidden;
        position: absolute;
        top: 0;
        transition: transform 0.6s ease-in-out;
        width: 50%;
        z-index: 100;
      }
      
      .container.right-panel-active .container__overlay {
        transform: translateX(-100%);
      }
      
      .overlay {
        background-color: var(--lightblue);
        background: url('back.jpg');
        background-attachment: fixed;
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        height: 100%;
        left: -100%;
        position: relative;
        transform: translateX(0);
        transition: transform 0.6s ease-in-out;
        width: 200%;
      }
      
      .container.right-panel-active .overlay {
        transform: translateX(50%);
      }
      
      .overlay__panel {
        align-items: center;
        display: flex;
        flex-direction: column;
        height: 100%;
        justify-content: center;
        position: absolute;
        text-align: center;
        top: 0;
        transform: translateX(0);
        transition: transform 0.6s ease-in-out;
        width: 50%;
      }
      
      .overlay--left {
        transform: translateX(-20%);
      }
      
      .container.right-panel-active .overlay--left {
        transform: translateX(0);
      }
      
      .overlay--right {
        right: 0;
        transform: translateX(0);
      }
      
      .container.right-panel-active .overlay--right {
        transform: translateX(20%);
      }
      
      .btn {
        background-color: var(--blue);
        background-image: linear-gradient(90deg, var(--blue) 0%, var(--lightblue) 74%);
        border-radius: 20px;
        border: 1px solid var(--blue);
        color: var(--white);
        cursor: pointer;
        font-size: 0.8rem;
        font-weight: bold;
        letter-spacing: 0.1rem;
        padding: 0.9rem 4rem;
        text-transform: uppercase;
        transition: transform 80ms ease-in;
      }

      .btn1 {
    
        cursor: pointer;
        font-size: 0.8rem;
        font-weight: bold;
        letter-spacing: 0.1rem;
        padding: 0.9rem 4rem;
        text-transform: uppercase;
        transition: transform 80ms ease-in;
        position: absolute; 
    		top: 650px;
    		left: 670px;
      }
      
      .form > .btn {
        margin-top: 1.5rem;
      }
      
      .btn:active {
        transform: scale(0.95);
      }
      
      .btn:focus {
        outline: none;
      }
      
      .form {
        background-color: var(--white);
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        padding: 0 3rem;
        height: 100%;
        text-align: center;
      }
      
      .input {
        background-color: #fff;
        border: none;
        padding: 0.9rem 0.9rem;
        margin: 0.5rem 0;
        width: 100%;
      }
      
      @keyframes show {
        0%,
        49.99% {
          opacity: 0;
          z-index: 1;
        }
      
        50%,
        100% {
          opacity: 1;
          z-index: 5;
        }
      }
</style>
</head>
<body>
  <span class="btn1"><a href="insertMemberForm.jsp">관리자 등록</a></span>

    <div class="container right-panel-active">
  <!-- Sign In -->
  <div class="container__form container--signup">
    <form class="form" id="form1" action="sessionLoginPro.jsp">
      <h2 class="form__title">관리자</h2>
      <input type="text" name="id" placeholder="ID" class="input" />
      <input type="Password" name="passwd" placeholder="Password" class="input" />
      <button class="btn" onclick="location.href='Rent_com_Select.jsp'">Sign In</button>
      
    </form>
    
  </div>

  <!-- Overlay -->
  <div class="container__overlay">
    <div class="overlay">
      <div class="overlay__panel overlay--right">
        <button class="btn" id="signUp">Sign Up</button>
      </div>
    </div>
    
</body>

</html>