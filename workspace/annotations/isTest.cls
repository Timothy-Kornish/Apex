// @isTest with no parameters

@isTest
private class MyTestClass {
	
	//Methods for testing

	@isTest static void test1() {
		// Implement test code
	}

	@isTest static void test2() {
		// implement test code
	}
}

@isTest
public class TestUtil {
	public static void createTestAccounts() {
		// create some test accounts
	}

	public static void createTestContacts() {
		// create some test contacts
	}
}

// @isTest(SeeAllData=true) all methods have full access

@isTest(SeeAllData=true)
public class TestDataAccessClass {
	
	// This test accesses an existing account.
	// It also creates and accesses a new test account.
	@isTest
	static void myTestMethod1() {
		// wuery an existing account in the organization
		Account a = [SELECT Id, Name FROM Account WHERE Name='Acme' LIMIT 1];
		System.assert(a != null);

		// create a test account based on the queried account
		Account testAccount = a.clone();
		testAccount.Name = 'Acme Test';
		insert testAccount;

		// query the test account that was inserted
		Account testAccount2 = [SELECT Id, Name FROM Account WHERE Name='Acme Test' LIMIT 1];
		System.assert(testAccount2 != null);
	}

	@isTest
	static void myTestMethod2() {
		// can access all data in the organization
	}
}

// here only specified methods have full access

@isTest
private class ClassWithDifferentDataAccess {
	
	// test method that has access to all data
	@isTest(SeeAllData=true)
	static void testWithAllDataAccess() {
		// can query all data in organization
	}

	// test method that has access to only the data it creates 
	// and organization setup and metadata objects
	@isTest
	static void testWithOwnDataAccess() {
		
		User u = [SELECT UserName, Email FROM User LIMIT 1];
		System.debug('UserName: ' + u.UserName);
		System/debug('Email: ' + u.Email);

		Account a = new Account(Name = 'Test Account');
		insert a;

		Account insertedAccount = [SELECT Id, Name FROM Account WHERE Name='Test Account'];
		System.assert(insertedAccount != null);
	}
}

// @isTest(OnInstall=true), what tests are executed during package installation

@isTest
private class OnInstallClassTest {
	
	// this test method will be executed during the installation of the package
	@isTest(OnInstall=true)
	static void test1() {
		// some test code for installation
	}

	// these test are excluded from running during the installation of a package
	
	@isTest
	static void test2() {
		// some test code
	}

	@isTest
	static void test3() {
		// some test code
	}
}

// @isTest(isParallel=true) allows test to run in parallel and aren't restricted by the default limits
// on number of concurrent tests



