// DML Statement

// Create the list of sObjects to insert
List<Account> acctList = new List<Account>();
acctList.add(new Account(Name = 'Acme1'));
acctList.add(new Account(Name = 'Acme2'));

// DML statement
insert acctList;


// equivalent of the above using Database class methods

// Create the list of sObjects to insert
List<Account> accounts = new List<Account>();
accounts.add(new Account(Name = 'Acme1'));
accounts.add(new Account(Name = 'Acme2'));

// DML statement
Database.SaveResult[] srList = Database.insert(accounts, false);
// false means if an error occurs, the remainder of the DML operations will go on and can succeed
// true means if an error occurs, all remaining sOjects won't be processed, and exception is thrown

// Iterate through each returned result
for (Database.SaveResult sr : srList) {
	if (sr.isSuccess()) {
		// Operation was successful, so get the ID of the record that was processed
		System.debug'Successfully inserted account. Account ID: ' + sr.getId());
	} else {
		for (Database.Error err : sr.getErrors()) {
			System.debug('The following error has occured:');
			System.debug(err.getStatucCode() + ': ' + err.getMessage());
			System.debug('Account fields that affected this error: ' + err.getFields());
		}
	}
}
