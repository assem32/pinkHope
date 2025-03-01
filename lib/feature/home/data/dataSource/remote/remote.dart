import 'package:breastnew/core/Api.dart';

class Remote {
  final ApiService apiService;
  Remote(this.apiService);

  Future<dynamic> predict(data)async{
    var resp = await apiService.post(endPoint: 'predict',data: data);
    return resp;
  }

}