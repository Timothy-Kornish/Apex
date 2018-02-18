// Query an existing account.
Account a = [SELECT Name, Industry FROM Account WHERE Name='Account Example' LIMIT 1];

// write the old values in debug log
System.debug('Account Name before update: ' + a.Name);
System.debug('Account Industry befor update: ' + a.Industry);

// modify the two fields on the sObject
a.Name = 'Account of the Day';
a.Industry = 'Technology';

// persist the changes on the database
update a;

// get a new copy of the accunt from the database
Account a = [SELECT Name, Industry FROM Account WHERE Name='Account of the Day' LIMIT 1];

// verify the updated fields were persisted
System.assertEquals('Account of the Day', a.Name);
System.assertEquals('Technology', a.Industry);

