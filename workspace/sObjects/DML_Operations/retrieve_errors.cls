Account[] accounts = new List<Account> { new Account(Name='Account1'), new Account() };

Database.SaveResult[] srList = Database.insert(accounts, false);

// Iterate through each returned result
for (Database.SaveResult sr : srList) {
	if(!sr.isSuccess()) {
		// operation failed, print all errors
		for(Database.Error err : sr.getErrors()) {
			System.debug('The following error has occured.');
			System.debug(err.getStatusCode() + ': ' + err.getMessage());
			System.debug('Fields that affectd this error: ' + err.getFields());
		}
	}
}
