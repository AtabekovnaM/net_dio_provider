import 'package:flutter/material.dart';
import 'package:net_dio_provider/viewmodels/update_view_model.dart';



Widget viewOfUpdate(BuildContext context, UpdateViewModel model) {
  return Stack(
    children: [
      Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: model.titleController,
              decoration: InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.only(right: 15, left: 15),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: model.bodyController,
              decoration: InputDecoration(
                labelText: "Body",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.only(
                    right: 15, top: 15, bottom: 50, left: 15),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 30,),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(15),
              ),
              child: FlatButton(
                child: Text('Update Post', style: TextStyle(color: Colors.white, fontSize: 20),),
                onPressed: () {
                  model.apiUpdatePost(context);
                },
              ),
            ),
          ],
        ),
      ),

      model.isLoading ? Center(child: CircularProgressIndicator()) : SizedBox.shrink(),
    ],
  );
}