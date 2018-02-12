@isTest
private class HelloWorldTestClass {
  @isTest
  static void validateHelloWorld() {
    Book book = new Book(Name='Behind the Cloud', price = 100);

    System.debug('Price before inserting new book: ' + book.price);

    // insert book into database and gives it an Id, activates trigger
    insert book;

    // Retrieve the new Book;
    book = [SELECT price FROM Book WHERE Id =:book.Id];
    System.debug('Price after trigger fired: ' + book.price);

    //Test that the trigger correctly updated the Price
    System.assertEquals(90, book.price);
  }
}
