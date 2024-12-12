package appilicationDto;

public class UserDto {
	String firstName,lastName,email,password,userID,gender,address;
	int age,id,balance;
	long phone,accountNumber;
	public UserDto(String firstName, String lastName, String email, String password, String userID, int age, int id,
			long phone, long accountNumber,int balance) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.userID = userID;
		this.age = age;
		this.id = id;
		this.phone = phone;
		this.accountNumber = accountNumber;
		this.balance=balance;
	}

	
	
	public UserDto(String firstName, String lastName, String email, String userID, int age, int id, long phone,
			long accountNumber) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.userID = userID;
		this.age = age;
		this.id = id;
		this.phone = phone;
		this.accountNumber = accountNumber;
	}



	



	public UserDto(String firstName, String lastName, String email, String userID, String gender, String address,
			int age, int id, long phone, long accountNumber) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.userID = userID;
		this.gender = gender;
		this.address = address;
		this.age = age;
		this.id = id;
		this.phone = phone;
		this.accountNumber = accountNumber;
	}



	public int getBalance() {
		return balance;
	}



	public void setBalance(int balance) {
		this.balance = balance;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getUserID() {
		return userID;
	}



	public void setUserID(String userID) {
		this.userID = userID;
	}



	public long getAccountNumber() {
		return accountNumber;
	}



	public void setAccountNumber(long accountNumber) {
		this.accountNumber = accountNumber;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	
	

	


	public UserDto() {
		super();
		// TODO Auto-generated constructor stub
	}



	@Override
	public String toString() {
		return "UserDto [firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", password="
				+ password + ", userID=" + userID + ", gender=" + gender + ", address=" + address + ", age=" + age
				+ ", id=" + id + ", phone=" + phone + ", accountNumber=" + accountNumber + "]";
	}
	
	

}
