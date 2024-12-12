<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.form {
  display: flex;
  flex-direction: column;
  gap: 10px;
  max-width: 350px;
  background-color: #fff;
  padding: 20px;
  border-radius: 20px;
  position: relative;
}

.title {
  font-size: 28px;
  color: royalblue;
  font-weight: 600;
  letter-spacing: -1px;
  position: relative;
  display: flex;
  align-items: center;
  padding-left: 30px;
}

.title::before,.title::after {
  position: absolute;
  content: "";
  height: 16px;
  width: 16px;
  border-radius: 50%;
  left: 0px;
  background-color: royalblue;
}

.title::before {
  width: 18px;
  height: 18px;
  background-color: royalblue;
}

.title::after {
  width: 18px;
  height: 18px;
  animation: pulse 1s linear infinite;
}

.message, .signin {
  color: rgba(88, 87, 87, 0.822);
  font-size: 14px;
}

.signin {
  text-align: center;
}

.signin a {
  color: royalblue;
}

.signin a:hover {
  text-decoration: underline royalblue;
}

.flex {
  display: flex;
  width: 100%;
  gap: 6px;
}

.form label {
  position: relative;
}

.form label .input {
  width: 100%;
  padding: 10px 10px 20px 10px;
  outline: 0;
  border: 1px solid rgba(105, 105, 105, 0.397);
  border-radius: 10px;
}

.form label .input + span {
  position: absolute;
  left: 10px;
  top: 15px;
  color: grey;
  font-size: 0.9em;
  cursor: text;
  transition: 0.3s ease;
}

.form label .input:placeholder-shown + span {
  top: 15px;
  font-size: 0.9em;
}

.form label .input:focus + span,.form label .input:valid + span {
  top: 30px;
  font-size: 0.7em;
  font-weight: 600;
}

.form label .input:valid + span {
  color: green;
}

.submit {
  border: none;
  outline: none;
  background-color: royalblue;
  padding: 10px;
  border-radius: 10px;
  color: #fff;
  font-size: 16px;
  transform: .3s ease;
}

.submit:hover {
  background-color: rgb(56, 90, 194);
}

@keyframes pulse {
  from {
    transform: scale(0.9);
    opacity: 1;
  }

  to {
    transform: scale(1.8);
    opacity: 0;
  }
}</style>
</head>
<body>
	<center>
		<form class="form" action="register" method="post">
		    <p class="title">Register </p>
		    <h5 class="message">Signup now </h5>
		        <div class="flex">
		        <label>
		            <input required placeholder="" type="text" class="input" name="firstname">
		            <span>Firstname</span>
		        </label>
		
		        <label>
		            <input required placeholder="" type="text" class="input" name="lastname">
		            <span>Lastname</span>
		        </label>
		    </div>  
		          <label>
		        <input required placeholder="" type="number" class="input" name="phono">
		        <span>Mobile Number</span>
		    </label> 
		    <label>
		        <input required placeholder="" type="number" class="input" name="age">
		        <span>Age</span>
		    </label> 
		    <label>
		  <label > Gender  </label><input type="radio" value="Male"  name="gender" ><label>Male</label> <input type="radio" value="Female"  name="gender" ><label>Female</label> <input type="radio" value="Others"  name="gender" ><label>Others</label>
		  </label>
		    <label>
		        
		        <input required placeholder="" type="text" class="input" name="address">
		        <span>Address</span>
		    </label> 
		    </label>   
		    <label>
		        <input required placeholder="" type="email" class="input" name="email">
		        <span>Email</span>
		    </label> 
		        
		    <label>
		        <input required placeholder="" type="password" class="input" name="password">
		        <span>Password</span>
		    </label>
		    <label>
		        <input required placeholder="" type="password" class="input" name="confirmpassword">
		        <span>Confirm password</span>
		    </label>
		    <label>
		    	<input required placeholder="" type="number" class="input" name="balance">
		    	<span>Initial Balance</span>
		    </label>
		    <button class="submit" type="submit">Submit</button>
		    <p class="signin">Already have an account ? <a href="index.jsp">Signin</a> </p>
		</form>
	</center>
	
	<h1></h1>
</body>
</html>