import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:ymgk_final_project/feature/home/cubit/home_view_model.dart';

class ApplicationBlocProvider {
  static ApplicationBlocProvider? _instace;

  static ApplicationBlocProvider get instance {
    _instace = ApplicationBlocProvider._init();
    return _instace!;
  }

  ApplicationBlocProvider._init();
  List<SingleChildWidget> dependItems = [
    BlocProvider(create: (context) => HomeViewModel(),)
  ];
}
