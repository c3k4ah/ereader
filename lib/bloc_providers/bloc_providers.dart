import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

import '../dependency_injection/injection.dart';
import '../features/section/presentation/manager/article_bloc.dart';

List<SingleChildWidget> get blocProviders => [
      BlocProvider(
        lazy: false,
        create: (context) => getIt<ArticleBloc>(),
      ),
    ];
