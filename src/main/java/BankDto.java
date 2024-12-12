package appilicationDto;

public class BankDto {
   String email,userId;
   long accountNumber;
public BankDto(String email, String userId, long accountNumber) {
	super();
	this.email = email;
	this.userId = userId;
	this.accountNumber = accountNumber;
}

public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getUserId() {
	return userId;
}
public void setUserId(String userId) {
	this.userId = userId;
}
public long getAccountNumber() {
	return accountNumber;
}
public void setAccountNumber(long accountNumber) {
	this.accountNumber = accountNumber;
}
   
public BankDto() {
	super();
	
}
   
}
