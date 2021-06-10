import 'package:flutter/material.dart';
import 'package:net_dio_provider/viewmodels/create_view_model.dart';
import 'package:net_dio_provider/views/view_of_create.dart';

import 'package:provider/provider.dart';

class CreatePage extends StatefulWidget {
  static final String id = "create_page";
  @override
  _CreaState createState() => _CreaState();
}

class _CreaState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Create post'),
      ),
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider(
        create: (context) => CreateViewModel(),
        builder: (context, child) => Consumer<CreateViewModel>(
            builder: (context, model, child) => viewOfCreate(context, model)),
      ),
    );
  }
}
