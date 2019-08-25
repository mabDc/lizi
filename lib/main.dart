import 'package:flutter/material.dart';
import 'package:lizi/global/config.dart';
import 'package:lizi/pages/home_page.dart';

void main() async {
  
  Config();
  Config().init();
  
  runApp(MaterialApp(
      title: '栗子',
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Config.primaryColor,
      ),
    ));
}



// import 'package:scoped_model/scoped_model.dart';
 
// abstract class ThemeStateModel extends Model {
 
//   int _themeIndex;
//   get themeIndex => _themeIndex;
 
//   void changeTheme(int themeIndex) async {
//     _themeIndex = themeIndex;
//     notifyListeners();
//   }


// @override
// Widget build(BuildContext context) {
//     return ScopedModel<MainStateModel>(
//       model: mainStateModel,
//       child: ScopedModelDescendant<MainStateModel>(
//         builder: (context, child, model) {
//           return  MaterialApp(
//             theme: ThemeData(
//               primaryColor: themeList[model.themeIndex != null ? model.themeIndex : widget.themeIndex]
//             ),
//             home: HomePage(),
//           );
//         },
//       )
//     );
// }
