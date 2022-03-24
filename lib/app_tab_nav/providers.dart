import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'app_view_data.dart';

class AppProviders {
  static List <SingleChildWidget>providers = [
    ChangeNotifierProvider(create: (_)=> AppViewData()),
  ]; 
  
}

