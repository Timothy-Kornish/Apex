Account a = new Account(Name = 'Acme Plumbing');

insert a;

Contact c = new Contact(Email = 'jplumber@salesforce.com', FirstName = 'Joe', LastName = 'Plumber' accountId=a.Id);

insert c;

Database.DMLOptions dml = new Database.DMLOptions();

dml.EmailHeader.triggerAutoResponseEmail = true;
Case ca = new Case(Subject='Plumbing Problems', contactId=c.Id);
Database.insert(ca, dml);

