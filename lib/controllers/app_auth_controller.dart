import 'dart:html';

import 'package:bbback/model/response.dart';
import 'package:conduit/conduit.dart';
import 'package:bbback/model/user.dart';

class AppAuthController extends ResourceController {
  AppAuthController(this.managedContext);

  final ManagedContext managedContext;

  @Operation.post()
  Future<Response> signIn(@Bind.body() User user) async {
    if (user.password == null && user.userName == null) {
      return Response.badRequest(
        body:
            ModelResponse(message: 'Поля "password" и "userName" обязательны!'),
      );
    }
    try{
      //поиск пользователей по имени в бд
      final qFindUser = Query<User>(managedContext)
      ..where((element)=>element.userName).equalTo(user.userName)
      ..returningProperties((element) => [element.id, element.salt, element.hashPassword, ],);

      final findUser = await qFindUser.fetchOne();
    }
  }
}
