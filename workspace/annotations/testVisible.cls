public class TestVisibleExample {
	
	//private member variable
	@TestVisible
	private static Integer recordNumber = 1;

	// private method
	@TestVisible
	private static void updateRecord(String name) {
		// do something to update record
	}
}

@isTest 
private class TestVisibleExampleTest {
	
	@isTest
	static void test1() {
		// Access private variable annotated with TestVisible
		Integer i = TestVisibleExample.recordNumber;
		System.assertEquals(1, i);

		// Access private method annotated with TestVisible
		TestVisibleExample.updateRecord('RecordNameHere');

		// perform some verification
	}
}

