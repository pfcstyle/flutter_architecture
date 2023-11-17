import 'package:flutter_architecture/shared/models/models.dart';
import 'package:flutter_architecture/shared/models/response.dart';
import 'package:flutter_architecture/shared/exceptions/app_exception.dart';

import 'data/user_map.dart';

final AppException ktestAppException =
    AppException(message: '', statusCode: 0, identifier: '');

final User ktestUser = User.fromJson(const {});

final User ktestUserFromMap = User.fromJson(ktestUserMap);

final Response ktestUserResponse =
    Response(statusMessage: 'message', statusCode: 1, data: {});
