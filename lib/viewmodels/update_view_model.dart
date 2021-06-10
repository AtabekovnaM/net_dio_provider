import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:net_dio_provider/model/post_model.dart';
import 'package:net_dio_provider/services/dio_service.dart';



class UpdateViewModel extends ChangeNotifier {
  bool isLoading = false;
  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  var _post = Post();

  void getOldPost(Post post) {
    _post = post;
    titleController.text = _post.title;
    bodyController.text = _post.body;
    notifyListeners();
  }

  Future apiUpdatePost(BuildContext context) async{
    isLoading = true;
    notifyListeners();

    String title = titleController.text.trim().toString();
    String body = bodyController.text.trim().toString();
    Post post = Post(title: title, body: body, userId: _post.userId, id: _post.id);

    var response = await DioService.PUT(DioService.API_UPDATE + _post.id.toString(), DioService.paramsUpdate(post));
    isLoading = false;
    Navigator.pop(context, response);
    notifyListeners();
  }
}