// deleted records last in recycle bin for 15 days where they can be restored, afterwards they are permanently deleted

// Example)

Account[] doomedAccounts = [SELECT Id, Name FROM Account Name = 'DotCom'];

try {
	delete doomedAccounts;
} catch (DmlException e) {
	System.debug('An error has occurred: ' + e.getMessage());
}

// deleting operation supports cascading deletes,

// deleting parent deletes child as well


// restoring deleted records

Account a = new Account(Name = 'Universal Containers');
insert a;
insert (new Contact(LastName='Carter', AccountId = a.Id));
delete a;

Account savedAccts = [SELECT Id, Name FROM Account WHERE Name = 'Universal Containers' ALL ROWS];

try {
	undelete savedAccounts;
} catch (DmlException e) {
	System.debug(e.getMessage());
}



