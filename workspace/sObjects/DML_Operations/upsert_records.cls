// upsert means either insert or update a record

Account[] acctsList = [SELECT Id, Name, BillingCity FROM Account WHERE BillingCity = 'Bombay'];

for (Account a : acctsList) {
	a.BillingCity = 'Mumbai';
}

Account newAcct = new Account(Name = 'Acme', BillingCity');
acctsList.add(newAcct);

try {
	upsert acctsList;
} catch (DmlException e) {
	System.debug('Exception: ' + e.getMessage());
}

// Database.upsert method

public class DmlSamples {
	
	public static List<Database.upsertResult> upsertLeads(List<Lead> leads) {
		List<Database.upsertResult> uResults = Database.upsert(leads, false);

		List<Task> tasks = new List<Task>();
		for( Database.upsertResult result : uResults) {
			if (result.isSuccess() && result.isCreated()) {
				tasks.add(new Task(Subject = 'Follow-up', WhoId = result.getId());
			}
		}
		Database.insert(tasks);

		return uResults;
	}
}

@isTest
private class DmlSamplesTest {
	
	@isTest
	public static testMethod void testUpsertLeads() {
		List<Lead> leads = new List<Lead>();

		for (Integer i = 0; i < 100; i++) {
			leads.add(new Lead(LastName = 'testLead', Company = 'testCompany'));
		}

		Test.startTest();

		List<Database.upsertResult> results = DmlSample.upsertLeads(leads);

		Test.stopTest();

		Set<ID> ids = new Set<ID>();
		
		for(Database.upsertResult result : results) {
			System.assert(results.isSuccess());
			ids.ad(result.getId());
		}

		for (Lead l: [SELECT Subject FROM Tasks) FROM Lead WHERE Id In : ids]) {
			System.assertEquals(1, l.tasks.size());
		}
	}
}
