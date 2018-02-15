global class CustomIterable implements Iterator<Account> {
	
	List<Account> accs {get; set;}

	Integer i {get; set;}

	public CustomIterable() {
		accs = [SELECT Id, Name, NumberOfEmployees, FROM Account WHERE Name = 'false'];
		i = 0;
	}

	global boolean hasNext() {
		if (i >= accs.size()) {
			return false;
		} else {
			return true;
		}
	}

	global Account next() {
		// 8 will be the arbitraty max size of the list
		if (i == 8) {
			return null;
		}
		i++;
		return accs[i - 1];
	}
}

global class Example implements Iterable<Account> {
	global Iterator<Account> Iterator() {
		return new CustomIterable();
	}
}

// batch job that uses an iterator
global class BatchClass implements Database.batchable<Account> {
	
	global Iterable<Account> start (Database.batchableContext info) {
		return new Example();
	}

	global void execute(Database.batchableContext info, List<Account> scope) {
		List<Account> accsToUpdate = new List<Account>();

		for(Account a : scope) {
			a.Name = 'True';
			a.NumberOfEmployees = 69;
			accsToUpdate.add(a);
		}
		
		update accsToUpdate;
	}
	global void finish(Database.batchableContext info) {}
}

