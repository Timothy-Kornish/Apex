Account[] accts = new List<Account>();

for(Integer i = 0; i < 3; i++) {
	Account a = new Account(Name = 'Acme' + i, BillingCity = 'San Francisco');
	accts.add(a);
}

Account accountToTupdate;

try {
	insert accts;

	// update account Acme2
	accountToUpdate = [SELECT BillingCity FROM Account WHERE Name = 'Acme2' and BillingCity = 'San Francisco' LIMIT 1];
	
	// Update Billing city
	accountToUpdate.BillingCity = 'New York';
	update accountToUpdate;
} catch (DmlException e) {
	System.debug('An unexprected error has occurred: ' + e.getMessage());
}

// verify that the billing city was updated
Account afterUpdate = [SELECT BillingCity FROM Account WHERE Id=:accountToUpdate.Id];

System.assertEquals('New York', afterUpdate.BillingCity);

try {
	Account acct = new Account(Name = 'SFDC Account');
	insert acct;

	Id acctID = acct.ID;

	// add a contact to this account
	Contact con = new Contact(FirstName='Joe', LastName='Smith', Phone='415.555.1212', AccountId=acctID);
	insert con;

} catch (DmlException e) {
	System.debug('An unexpected error has occured: ' + e.getMessage());
}

try {
	// query for the contact, which has been associated with an account.
	Contact queriedContact = [SELECT Account.Name FROM Contact WHERE FirstName = 'Joe' AND LastName = 'Smith' LIMIT 1];

	//update the contact's phone number
	queriedContact.Phone = '415.555.1213';

	// update the related account industry
	queriedContact.Account.Industry = 'Technology';

	// Make two seperate calls
	// 1. This call is to update the contact's phone
	update queriedContact;

	//2. This call is to update the related account's Industry field.
	update queriedContact.Account;

} catch (Exception e) {
	System.debug('An unexpected error has occured: ' + e.getMessage());
}


