// Example 1)


// can merge up to 3 records of the same sObject type

// Insert new accounts
List<Account> ls = new ls<Account> { new Account(Name = 'Acme Inc.'), new Account(Name = 'Acme') };

insert ls;

// Queries to get the inserted accounts

Account masterAccount = [SELECT Id, Name FROM Account WHERE Name = 'Acme Inc.' LIMIT 1];
Account mergeAccount = [SELECT Id, Name FROM Account WHERE Name = 'Acme' LIMIT 1];

// add a contact to the account to be merged
Contact c = new Contact(FistName = 'Joe', LastName = 'Merged');
c.AccountId = mergeAccount.Id;

insert c;

try {
	merge masterAccount mergeAccount;
} catch (DmlException e) {
	System.debug('An unexpected error has occured: ' + e.getMessage());
}

// once the account is merged with the master account
// the related contact should be moved to the master record

masterAccount = [SELECT Id, Name, (SELECT FirstName, LastName FROM Contacts) FROM Account WHERE Name = 'Acme Inc.' LIMIT 1];

System.assert(masterAccount.getSObject('Contacts').size() > 0);
System.assertEquals('Joe', masterAccount.getSObjects('Contacts')[0].get('FirstName'));
System.assertEquals('Merged', masterAccount.getSObjects('Contacts')[0].get('LastName'));

// verify that the merge record got deleted
Account[] result = [SELECT Id, Name FROM Account WHERE Id=:mergeAccount.Id];
System.assertEquals(0, result.size());



// Example 2)

// create master account
Account master = new Account(Name='Account1');
insert master;

// create duplicate accounts
Account[] duplicates = new Account[] {
	// Duplicate Account
	new Account(Name='Account1, Inc.'),
	// second duplicate accuont
	new Account(Name='Account1') };

insert duplicates;

// create child contact and associate it with first account
Contact c = new Contact(FirstName='Joe', LastName='Smith', accountId=duplicates[0].Id);
insert c;

// get the account contact relation ID, which is created when a contact is created on "Account1, Inc."

AccountContactRelation resultActRel = [SELECT Id FROM AccountContactRelation WHERE ContactId=:c.Id LIMIT 1];

// merge accounts into master
Database.MergeResult[] results = Database.merge(master, duplicates, false);

for (Database.MergeResult res : results) {

	if(res.isSuccess() {
		// get the master ID from the result and validate it
		System.debug('Master record ID: ' + res.getId());
		System.assertEquals(master.Id, res.getId());

		// get the IDs of the merged records and display them
		List<Id> mergedIds = res.getMergedRecordIds();
		System.debug('IDs of merged records: ' + mergedIds);

		// get the Id of the reparented record and validate that this the contact ID
		System.debug("Reparented record ID: ' + res.getUpdatedRelatedIds());

		// Make sure there are two IDS (contact ID and account contact relationID); the order isn't defined
		System.assertEquals(2, res.getUpdatedRelatedIds().size());
		Boolean flag1 = false;
		Boolean flag2 = false;

		// Because the order of the Ids isn't defined, the ID can be at index 0 or 1 of the array
		if ( resultAcrel.id == res.getUpdatedRelatedIds()[0] || 
		     resultAcrel.id == res.getUpdatedRelatedIds()[1]) {
		        flag1 = true;
		}

		if (c.id == res.getUpdatedRelatedIds()[0] || c.id == res.getUpdatedRelatedIds()[1]) {
			flag2 = true;
		}

		System.assertEquals(flag1, true);
		System.assertEquals(flag2, true);
	} else {
		for (Database.Error err : res.getErrors()) {
			System.debug(err.getMessage());
		}
	}
}
