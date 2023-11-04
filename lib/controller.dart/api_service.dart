import 'package:flutter/cupertino.dart';
import 'package:foxy_app/model/model.dart';
import 'package:http/http.dart' as http;

class ApiProvider extends ChangeNotifier {
  List<User> _userData = [];
  List<User> get userData => _userData;

  Future<void> fetchData() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      if (response.statusCode == 200) {
        var jsonData = response.body;
        final userList = userFromJson(jsonData);
        _userData = userList;
        notifyListeners();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  List<User> searchUsers(String keyword) {
    List<User> searchResults = [];
    for (var user in _userData) {
      if (user.name.toLowerCase().contains(keyword.toLowerCase()) ||
          user.username.toLowerCase().contains(keyword.toLowerCase())) {
        searchResults.add(user);
      }
    }

    return searchResults;
  }

//   void getData ()async{
//    var product = await ApiService.fetchData();
//  productList = product;
//    notifyListeners();
//   }

}
