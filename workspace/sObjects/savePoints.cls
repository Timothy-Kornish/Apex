Account a = new Account(Name = 'xxx');
insert a;

System.assertEquals(null, [SELECT AccountNumber FROM Account WHERE Id =:a.Id].AccountNumber);

// create a savepoint while AccountNumber is null
SavePoint sp = Database.setSavePoint();

// change the account number
a.AccountNumber = '123';
update a;
System.assertEquals('123', [SELECT AccountNumber FROM Account WHERE Id =:a.Id].AccountNumber);

// rollback to previous savepoint with null account number
Database.rollback(sp);

System.assertEquals(null, [SELECT AccountNumber FROM Account WHERE Id =:a.Id].AccountNumber);
