public class AccountQueryAction {
	@InvocableMethod(label='Get Account Names' description='Returns the list of account names
 	corresponding to the specified account IDs.')
   	public static List<String> getAccountNames(List<ID> ids) {
      		List<String> accountNames = new List<String>();
           	List<Account> accounts = [SELECT Name FROM Account WHERE Id in :ids];
	        for (Account account : accounts) {
	        	accountNames.add(account.Name);
		}
		return accountNames;	       
	}
}

public class AccountInsertAction {
	
	@InvocableMethod(label = 'Insert Accounts' description = 'Inserts the accounts specified and 
				returns the IDs of the new accounts.')
	public static List<ID> insertAccounts(List<Account> accounts) {
		Database.SaveResult[] results = Database.insert(accounts);
		List<ID> accountIds = new List<ID>();

		for(Database.SaveResult result : results) {
			if (result.isSuccess()) {
				accountIds.add(result.getId());
			}
		}
		return accountIds;
	}
}
