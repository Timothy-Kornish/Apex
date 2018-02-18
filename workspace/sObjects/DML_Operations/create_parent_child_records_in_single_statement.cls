public class ParentChildSample {
	
	public static void insertParentChild() {
		Date dt = Date.today();
		dt = dt.addDays(7);
		Opportunity newOpportunity = new Opportunity(Name='OpportunityWithAccountInsert', StageName='Prospecting', CloseDate=dt);

		// create the parent reference
		// Used only for foreign key reference
		// and doesn't contain any other fields
		Account accountReference = new Account(MyExtID__c='SAP111111');
		newOpportunity.Account = accountReference;

		// create the Account object to insert
		// Same as above but has Name field
		// Used for the insert
		Account parentAccount = new Account(Name='Hallie', MyExtID__c='SAP111111');

		// create the account and opportunity
		Database.SaveResult[] results = Database.insert(new sObject[] { parentAccount, newOpportunity});

		// chech results
		for (Integer i = 0; i < results.size(); i++) {
			if (results[i].isSuccess()) {
				System.debug('Successfully created ID: ' + results[i].getId());
			} else {
				System.debug('    The error reported was: ' + results[i].getErrors()[0].getMessage() + '\n\);
			}
		}
	}
}
