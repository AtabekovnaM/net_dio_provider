import 'package:flutter/material.dart';
import 'package:net_dio_provider/model/post_model.dart';
import 'package:net_dio_provider/viewmodels/update_view_model.dart';
import 'package:net_dio_provider/views/view_of_update.dart';


import 'package:provider/provider.dart';

class UpdatePage extends StatelessWidget {

  static final String id = "update_page";
  final UpdateViewModel model = UpdateViewModel();
  final Post post;

  UpdatePage({this.post});

  @override
  Widget build(BuildContext context) {
    model.getOldPost(post);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Update post'),
      ),
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider(
        create: (context) => model,
        child: Consumer<UpdateViewModel>(
          builder: (context, model, child) => viewOfUpdate(context, model),
        ),
      ),
    );
  }
}