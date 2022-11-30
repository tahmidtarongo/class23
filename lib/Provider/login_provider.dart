import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Repositories/login_repo.dart';

final logInProvider = ChangeNotifierProvider((ref) => LogInRepo());
