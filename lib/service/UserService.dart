import 'package:dio/dio.dart';
import 'package:siagro/models/User.dart';

class UserService {
  final dio = Dio();

  createUser({User user}) async {
    Response response = await dio.get('');
    return response.data;
  }

  getUser({User user}) async {
    Response response = await dio.put('');
    return response.data;
  }

  updateUser({User user}) async {
    Response response = await dio.delete('');
    return response.data;
  }

  deleteUser({User user}) async {
    Response response = await dio.delete('');
    return response.data;
  }

  findUser({User user}) async {
    Response response = await dio.get('');
    return response.data;
  }
}
