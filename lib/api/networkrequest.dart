
import 'dart:io';
import 'dart:convert';
import 'dart:ui';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
class NetworkRequest{


  static final NetworkRequest _instance = NetworkRequest._internal();
  factory NetworkRequest() => _instance;
  NetworkRequest._internal();


  Future<dynamic> AllSections() async {
    HttpClient client = new HttpClient();
    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    String url ='http://mamnoon.somee.com/Api/CategoriesApi/Get';
    // print(id);
    Map map ={
      "pageNumber": 1,
      "pageSize": 10,
      "filter": "",
      "orderByValue": [

      ]
    };


    try{
      HttpClientRequest request = await client.getUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
     // request.headers.set('Authorization', 'Bearer $token');
     // request.add(convert.utf8.encode(convert.json.encode(map)));
      HttpClientResponse response = await request.close();
      String reply = await response.transform(convert.utf8.decoder).join();
      print("Ok");
      print(reply);
     // print("http://mamnoon.somee.com/Images/${snapshot.data['imageName']}"),
      var jsonResponse = convert.jsonDecode(reply);
      return jsonResponse;


    }catch(v){

      print(v);
    }


  }
  Future<dynamic> SlideImage() async {
    HttpClient client = new HttpClient();
    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    String url ='http://mamnoon.somee.com/Api/AdsApi/Get';

    try{
      HttpClientRequest request = await client.getUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      // request.headers.set('Authorization', 'Bearer $token');
      // request.add(convert.utf8.encode(convert.json.encode(map)));
      HttpClientResponse response = await request.close();
      String reply = await response.transform(convert.utf8.decoder).join();
      print("Ok");
      print(reply);
      // print("http://mamnoon.somee.com/Images/${snapshot.data['imageName']}"),
      var jsonResponse = convert.jsonDecode(reply);
      return jsonResponse;


    }catch(v){

      print(v);
    }


  }
  Future<dynamic> favoritesResponse(UserId) async {//String phone, String password,String tokenUser
    List<dynamic> _result;
    bool status = false;

    try {
      final response = await http.get(
        Uri.parse("http://mamnoon.somee.com/Api/OrderApi/Favorites?UserId=$UserId"),

      );
      print('login result response: ' + response.body+ 'response.statusCode  '+ "${response.statusCode}" );

      if (response.statusCode == 200) {
        try {
          _result = jsonDecode(response.body);
          return _result;

        } catch (error) {
          print("login error api" + error.toString());
          return "خطأ في التسجيل";
          throw Exception("login error api");
        }
      }
    } catch (error) {
      print('ERROR: ' + error.toString());
      return "خطأ في التسجيل";
      // throw CustomException(error.toString());
      rethrow;
    }

  }
  Future<dynamic> OrderResponse(UserId) async {//String phone, String password,String tokenUser
    List<dynamic> _result;
    bool status = false;

    try {
      final response = await http.get(
        Uri.parse("http://mamnoon.somee.com/Api/OrderApi/Orders?UserId=$UserId"),

      );
      print('login result response: ' + response.body+ 'response.statusCode  '+ "${response.statusCode}" );

      if (response.statusCode == 200) {
        try {
          _result = jsonDecode(response.body);
          return _result;

        } catch (error) {
          print("login error api" + error.toString());
          return "خطأ في التسجيل";
          throw Exception("login error api");
        }
      }
    } catch (error) {
      print('ERROR: ' + error.toString());
      return "خطأ في التسجيل";
      // throw CustomException(error.toString());
      rethrow;
    }

  }
  Future<dynamic> R() async {
    Map map ={
      "phoneNumber": "0594102511",
      "userName": "R",
    };
    HttpClient client = new HttpClient();
    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    String url ='http://mamnoon.somee.com/Api/accountApi/register?';

    try{
      HttpClientRequest request = await client.getUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      // request.headers.set('Authorization', 'Bearer $token');
      request.add(convert.utf8.encode(convert.json.encode(map)));
      HttpClientResponse response = await request.close();
      print(response.statusCode);
      print("response.statusCode");
      String reply = await response.transform(convert.utf8.decoder).join();
      print("Ok");
      print(reply);
      // print("http://mamnoon.somee.com/Images/${snapshot.data['imageName']}"),
      var jsonResponse = convert.jsonDecode(reply);
      return jsonResponse;


    }catch(v){

      print(v);
    }


  }
  Future<dynamic> RegisterWithName(String PhoneNumberUser,String NameUser) async {//String phone, String password,String tokenUser
    Map _result;
    bool status = false;

    try {
      final response = await http.post(
          Uri.parse(  "http://mamnoon.somee.com/Api/accountApi/register?phoneNumber=$PhoneNumberUser&userName=$NameUser"),
        body: {'phoneNumber':PhoneNumberUser,'userName':"$NameUser",},
      );
      print('login result response: ' + response.body+ 'response.statusCode  '+ "${response.statusCode}" );

      if (response.statusCode == 200) {
        try {
          _result = jsonDecode(response.body);
          return _result;

        } catch (error) {
          print("login error api" + error.toString());
          return "خطأ في التسجيل";
          throw Exception("login error api");
        }
      }
    } catch (error) {
      print('ERROR: ' + error.toString());
      return "خطأ في التسجيل";
      // throw CustomException(error.toString());
      rethrow;
    }

  }
  Future<dynamic> LoginWithPhone(String PhoneNumberUser) async {//String phone, String password,String tokenUser
    Map _result;
    bool status = false;

    try {
      final response = await http.post(
        Uri.parse("http://mamnoon.somee.com/Api/accountApi/Login?phoneNumber=$PhoneNumberUser"),
        body: {'phoneNumber':PhoneNumberUser,},
      );
      print(PhoneNumberUser);
      print('login result response: ' + response.body+ 'response.statusCode  '+ "${response.statusCode}" );
      print("3");
      if (response.statusCode == 200) {
        print("2");
          _result = jsonDecode(response.body);
          print(_result);
          print("1");
          return _result;


      }
    } catch (error) {
      print('ERROR: ' + error.toString());
      return "خطأ في التسجيل";
      // throw CustomException(error.toString());
      rethrow;
    }

  }
  Future<dynamic> AddF(id,idUser) async {//String phone, String password,String tokenUser
    var _result;
    bool status = false;

    try {
      final response = await http.post(
        Uri.parse("http://mamnoon.somee.com/Api/OrderApi/Favorites?UserId=$idUser&PostId=$id"),
        body: {'UserId':'$idUser'
      ,'PostId':'$id'},
      );

      print('login result response: ' + response.body+ 'response.statusCode  '+ "${response.statusCode}" );
      print("3");
      if (response.statusCode == 200) {
        print("2");
       // _result = jsonDecode(response.body);
        print(_result);
        print("1");
        return response.body;


      }
    } catch (error) {
      print('ERROR: ' + error.toString());
      return "خطأ في التسجيل";
      // throw CustomException(error.toString());
      rethrow;
    }

  }
  Future<dynamic> AddOder(id,idUser) async {//String phone, String password,String tokenUser
    var _result;
    bool status = false;


      final response = await http.post(
        Uri.parse("http://mamnoon.somee.com/Api/OrderApi/Orders?UserId=$idUser&PostId=$id"),
        body: {'UserId':'$idUser','PostId':'$id'},
      );

      print('login result response: ' + response.body+ 'response.statusCode  '+ "${response.statusCode}" );
      print("3");
      if (response.statusCode == 200) {
        print("2");
       // _result = jsonDecode(response.body);
        print(_result);
        print("1");
        return response.body;


      }


  }
  Future<dynamic> RestaurantsApi(var id) async {//String phone, String password,String tokenUser
    List<dynamic> _result;
    bool status = false;
print(id);
print("RestaurantsApi");
    try {
      final response = await http.get( //get
        Uri.parse(  "http://mamnoon.somee.com/Api/StoresApi/GetStoreForCategories?id=$id"),//Api/RestaurantsApi/Get?

      );
      print('login result response: RestaurantsApi ' + response.body+ 'response.statusCode  '+ "${response.statusCode}" );

      if (response.statusCode == 200) {
        try {
          _result = jsonDecode(response.body);

          print("22");
          print(_result);
          return _result;
        } catch (error) {
          print("login error api" + error.toString());
          return "خطأ في التسجيل";
          throw Exception("login error api");
        }
      }
    } catch (error) {
      print('ERROR: ' + error.toString());
      return "خطأ في التسجيل";
      // throw CustomException(error.toString());
      rethrow;
    }

  }
  Future<dynamic> mealsApi() async {//String phone, String password,String tokenUser
    List<dynamic> _result;
    bool status = false;

    try {
      final response = await http.get(
        Uri.parse(  "http://mamnoon.somee.com/Api/productsApi/Get?"),

      );
      print('login result response:mealsApi ' + response.body+ 'response.statusCode  '+ "${response.statusCode}" );

      if (response.statusCode == 200) {
        try {
          _result = jsonDecode(response.body);

          print("22");
          print(_result);
          return _result;
        } catch (error) {
          print("login error api" + error.toString());
          return "خطأ في التسجيل";
          throw Exception("login error api");
        }
      }
    } catch (error) {
      print('ERROR: ' + error.toString());
      return "خطأ في التسجيل";
      // throw CustomException(error.toString());
      rethrow;
    }

  }
  Future<dynamic> search(String searchWord) async {//String phone, String password,String tokenUser
    List<dynamic> _result;
    bool status = false;
print(searchWord);
    print("22222222");
    try {
      final response = await http.get(
        Uri.parse(  "http://mamnoon.somee.com/Api/ProductsApi/search?search=$searchWord"),

      );
      print('login result response:mealsApi ' + response.body+ 'response.statusCode  '+ "${response.statusCode}" );

      if (response.statusCode == 200) {
        try {
          _result = jsonDecode(response.body);

          print("22");
          print(_result);
          return _result;
        } catch (error) {
          print("login error api" + error.toString());
          return "خطأ في التسجيل";
          throw Exception("login error api");
        }
      }
    } catch (error) {
      print('ERROR: ' + error.toString());
      return "خطأ في التسجيل";
      // throw CustomException(error.toString());
      rethrow;
    }

  }
  Future<dynamic> SpecialItem() async {//String phone, String password,String tokenUser
    List<dynamic> _result;
    bool status = false;
    print("222SpecialItem");
    try {
      final response = await http.get(
        Uri.parse(  "http://mamnoon.somee.com/Api/productsApi/feature"),

      );
      print('login result response:SpecialItem ' + response.body+ 'response.statusCode  '+ "${response.statusCode}" );

      if (response.statusCode == 200) {
        try {
          _result = jsonDecode(response.body);

          print("22SpecialItem");
          print(_result);
          return _result;
        } catch (error) {
          print("login error api" + error.toString());
          return "خطأ في التسجيل";
          throw Exception("login error api");
        }
      }
    } catch (error) {
      print('ERROR: ' + error.toString());
      return "خطأ في التسجيل";
      // throw CustomException(error.toString());
      rethrow;
    }

  }
  Future<dynamic> RR() async {//String phone, String password,String tokenUser
    var _result;
    bool status = false;

    try {
      final response = await http.post(
        Uri.parse("http://mamnoon.somee.com/Api/accountApi/register?phoneNumber=0594102511&userName=R"),

        body: {
          "phoneNumber":"0594102511",
          "userName":"R"
        },
      );
      print('login result response: ' + response.body+ 'response.statusCode  '+ "${response.statusCode}" );

      if (response.statusCode == 200) {
        try {
          _result = jsonDecode(response.body);

          print("response  22");
          print(_result);
          return _result;
        } catch (error) {
          print("login error api" + error.toString());
          return "خطأ في التسجيل";
          throw Exception("login error api");
        }
      }
    } catch (error) {
      print('ERROR: ' + error.toString());
      return "خطأ في التسجيل";
      // throw CustomException(error.toString());
      rethrow;
    }

  }
  Future<dynamic> CancelOrder(id) async {//String phone, String password,String tokenUser
    var _result;
    bool status = false;

    try {
      final response = await http.delete(
        Uri.parse("http://mamnoon.somee.com/Api/OrderApi/RemoveOrders?id=$id"),

        body: {
          "id":"$id",

        },
      );
      print('login result response: ' + response.body+ 'response.statusCode  '+ "${response.statusCode}" );

      if (response.statusCode == 200) {
        try {
          _result = jsonDecode(response.body);

          print("response  22");
          print(_result);
          return _result;
        } catch (error) {
          print("login error api" + error.toString());
          return "خطأ في التسجيل";
          throw Exception("login error api");
        }
      }
    } catch (error) {
      print('ERROR: ' + error.toString());
      return "خطأ في التسجيل";
      // throw CustomException(error.toString());
      rethrow;
    }

  }
  Future<dynamic> CancelFavorite(id) async {//String phone, String password,String tokenUser
    var _result;
    bool status = false;

    try {
      final response = await http.delete(
        Uri.parse("http://mamnoon.somee.com/Api/OrderApi/RemoveFavorites?id=$id"),

        body: {
          "id":"$id",

        },
      );
      print('login result response: ' + response.body+ 'response.statusCode  '+ "${response.statusCode}" );

      if (response.statusCode == 200) {
        try {
          _result = jsonDecode(response.body);

          print("response  22");
          print(_result);
          return _result;
        } catch (error) {
          print("login error api" + error.toString());
          return "خطأ في التسجيل";
          throw Exception("login error api");
        }
      }
    } catch (error) {
      print('ERROR: ' + error.toString());
      return "خطأ في التسجيل";
      // throw CustomException(error.toString());
      rethrow;
    }

  }
  Future<dynamic> PostRestauranId(var id) async {//String phone, String password,String tokenUser
   var _result;
    bool status = false;
print("id: $id");
    try {
      final response = await http.post(
        Uri.parse(  "http://mamnoon.somee.com/Api/productsApi/PostRestauranId?id=$id"),
        body: {'id':"$id",},
      );
      print('login result response: ' + response.body+ 'response.statusCode  '+ "${response.statusCode}" );

      if (response.statusCode == 200) {
        try {
          _result = jsonDecode(response.body);

          print("response  22");
          print(_result);
          return _result;
        } catch (error) {
          print("login error api" + error.toString());
          return "خطأ في التسجيل";
          throw Exception("login error api");
        }
      }
    } catch (error) {
      print('ERROR: ' + error.toString());
      return "خطأ في التسجيل";
      // throw CustomException(error.toString());
      rethrow;
    }

  }
}



