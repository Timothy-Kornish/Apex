public class Book {

  Integer price;
  String Name;

  public Book() {}

  public Book(String Name, Integer price) {
    this.Name = Name;
    this.price = price;

  }

}

public class MyHelloWorld {
  public static void applyDiscount(Book[] books) {
    for (Book book : books) {
      book.price *= 0.9;
    }
  }
}
