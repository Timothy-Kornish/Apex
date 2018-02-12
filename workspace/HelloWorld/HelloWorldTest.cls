@isTest
private class HelloWorldTestClass {
  @isTest
  static void validateHelloWorld() {
    Book__c book = new Book__c(Name='Behind the Cloud', Price__c = 100);

    System.debug('Price before inserting new book: ' + book.Price__c);

    // insert book into database and gives it an Id, activates trigger
    insert book;

    // Retrieve the new Book;
    book = [SELECT Price__c FROM Book__c WHERE Id =:book.Id];
    System.debug('Price after trigger fired: ' + book.Price__c);

    //Test that the trigger correctly updated the Price
    System.assertEquals(90, book.Price__c);
  }
}
