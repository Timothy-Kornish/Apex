Database.DMLOptions dml = new Database.DMLOptions();
dml.DuplicateRuleHeader.AllowSave = true;

Account duplicateAccount new Account(Name ='dupe');
Database.SaveResult sr = Database.insert(duplicateAccount, dml);
if (sr.isSuccess()) {
	System.debug('Duplicate account has een inserted into SalesForce!');
}

