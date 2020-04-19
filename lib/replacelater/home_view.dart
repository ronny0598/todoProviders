import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/core/enums/viewstate.dart';
import 'package:provider_architecture/core/models/post.dart';
import 'package:provider_architecture/core/models/user.dart';
import 'package:provider_architecture/core/viewmodels/home_model.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';
import 'package:provider_architecture/ui/shared/text_styles.dart';
import 'package:provider_architecture/ui/shared/ui_helpers.dart';
import 'package:provider_architecture/ui/widgets/postlist_item.dart';

import 'package:provider_architecture/ui/widgets/todo_widget.dart';
import 'package:provider_architecture/ui/widgets/todo_dialog.dart';
import 'package:provider_architecture/core/viewmodels/todos.dart';
import 'package:scoped_model/scoped_model.dart';

import 'base_view.dart';


class HomeView extends StatelessWidget {
  Todos model;
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      //onModelReady: (model) => model.getPosts(Provider.of<User>(context).id),
        builder: (context, model, child) {
          this.context = context;
          //this.model = todosModel;
          return Scaffold(
            appBar: AppBar(
              title: Text("Todos Model"),
            ),
            body: _buildTodosContent(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _buildDialogForNewTodo();
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          );
        }
    );
  }


//  Widget getPostsUi(List<Post> posts) => ListView.builder(
//      itemCount: posts.length,
//      itemBuilder: (context, index) => PostListItem(
//        post: posts[index],
//        onTap: () {
//          Navigator.pushNamed(context, 'post', arguments: posts[index]);
//        },
//      )
//  );


  _buildTodosContent() {
    if (model == null || model.todos.isEmpty) {
      return _buildPlaceholderText();
    }
    return ListView.builder(
      itemCount: model.todosCount,
      itemBuilder: (context, index) {
        return TodoItem(model.todos[index], model);
      },
    );
  }

  _buildPlaceholderText() {
    return Container(
      margin: const EdgeInsets.all(
        20,
      ),
      child: Center(
        child: Text("Todo list",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Future<Null> _buildDialogForNewTodo() async {
    await showDialog(
      context: context,
      builder: (context) {
        return TodoDialog(model);
      },
    );
  }
}
