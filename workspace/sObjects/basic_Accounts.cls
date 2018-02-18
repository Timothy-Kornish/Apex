Account a = new Account(Name = 'Acme', BillingCity = 'San Francisco');
insert a;

sObject s = [SELECT Id, Name FROM Account WHERE Name = 'Acme' LIMIT 1];
 
// this is allowed
ID id = s.Id;

// this will produce an error
String x = s.Name;

// this will produce an error in API version 26.0 and earlier
s.Id = [SELECT Id FROM Account WHERE Name = 'Acme' LIMIT 1];

Account convertedAccount = (Account)s;
convertedAccount.Name = 'Acme2';

update convertedAccount;
Contact sal = new Contact(FirstName = 'Sal', Account = convertedAccount);

// If your code creates a new account using name, a business account is created. 
// If your code uses LastName, a person account is created
