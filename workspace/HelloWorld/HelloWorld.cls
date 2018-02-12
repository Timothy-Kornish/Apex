public class Book {

  Integer Price;
  String Name;

  public Book__c() {}

  public Book__c(String Name, Integer Price) {
    this.Name = Name;
    this.Price = Price;

  }

}

public class MyHelloWorld {
  public static void applyDiscount(Book__c[] books) {
    for (Book__c book : books) {
      book.Price__c *= 0.9;
    }
  }
}
