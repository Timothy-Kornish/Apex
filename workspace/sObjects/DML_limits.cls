// Bad Example which calls an update for every iteration in loop
// DML limit of 150 statements per Apex transaction

for(Contact badCon : conList) {
	if (badCon.Department == 'Finance') {
		badCon.Description__c = 'New Description';
	}
	update badCon;
}

// Good example: update whole list in one statement 
// rather than update in each iteration of loop

List<Contact> updatedList = new List<Contact>();

for(Contact con : conList) {
	if (con.Department == 'Finance') {
		con.Description == 'New Description';
		updatedList.add(con);
	}
}

update updatedList;

//the total number of rows that can be processed by DML operations in a single transaction is 10,000.
