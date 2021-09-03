import 'package:get/get.dart';
import 'package:spectrum_kids/model/book.dart';
import 'package:spectrum_kids/repository/api_repo.dart';

class BooksController extends GetxController {

  var books = Book().obs;

  BooksController(String userId) {
    getBooks(userId);
  }

  getBooks(String userId) async {
    var list = await ApiRepo().getBooks();
    if (list != null) {
      books.value = list;
      update();
    } else {
      books.value = Book(data:[]);
    }
  }
}
