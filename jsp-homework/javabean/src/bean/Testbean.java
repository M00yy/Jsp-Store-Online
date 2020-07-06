package bean;

public class Testbean {
	private String username;
	private String pass;
	private int age;
	
	public void setUsername(String name){
		this.username = name;
	}
	public void setPassword(String pass){
		this.pass = pass;
	}
	public String getUsername(){
		return this.username;
	}
	public String getPassword(){
		return this.pass;
	}
	public int getAge(){
		return this.age;
	}
	public void setAge(int age){
		this.age = age;
	}
}
