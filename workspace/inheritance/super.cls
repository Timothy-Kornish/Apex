public virtual class SuperClass {
	public String mySalutation;
	public String myFirstName;
	public String myLastName;

	public SuperClass() {	
		this('Mr.', 'Carl', 'Vonderburg');
	}

	public SuperClass(String salutaion, String firstName, String lastName) {
		this.mySalutation = salutation;
		this.myFirstName = firstName;
		this.myLastName = lastName;
	}

	public virtual void printName() {
		System.debug('My name is ' + this.mySalutation + ' ' + this.myLastName);
	}

	public virtual String getFirstName() {
		return this.myFirstName;
	}
}

public class SubClass extends SuperClass {
	
	public SubClass () {
		super('Madam', 'Brenda', 'Clapentrap');
	}

	public override void printName() {
		super.printName();
		System.debug('But you can call me ' + super.getFirstName);
	}
}
