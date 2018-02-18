pulic class MixedDMLFuture {
	public static void useFutureMethod() {
		
		// First DML operation
		Account a = new Account(Name='Acme');
		insert a;

		// This next operation (insert a user with a role)
		// can't be mixed with the previous insert unless
		// it is within a future method.
		// Call future method to insert a user with a role.
		Util.insertUserWithRole(
			'mruiz@awcomputing.com', 'mruiz',
			'mruiz@awcomputing.com', 'Ruiz');
	}
}

public vlass Util {
	@future
	public static void insertUserWithRole(String uname, String al, String em, String lname) {
		
		Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
		UserRole ur = [SELECT Id FROM UserRole WHERE Name='COO'];

		// create new user with a non-null user role ID
		User u = new User(alias = al, email = em, emailencodingkey = 'UTF-8', lastname = lname,
				  languagelocalkey='en_US', localesidkey='en_US', profileid = p.Id, 
				  userroleid=r.id, timezonesidkey='America/Los_Angeles', username = uname);
		insert u;
	}
}


