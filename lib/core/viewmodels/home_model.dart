import 'package:compound/core/models/post.dart';
import 'package:compound/core/enums/viewstate.dart';
import 'package:compound/core/services/api.dart';
import 'package:compound/locator.dart';

import 'base_model.dart';

class HomeModel extends BaseModel {
  Api _api = locator<Api>();

  List<Post> posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    posts = await _api.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}