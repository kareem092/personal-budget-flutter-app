import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:my_budget/screens/SettingScreen.dart';
// import 'package:my_budget/screens/TransactionsScreen.dart';
// import 'package:my_budget/screens/TransferScreen.dart';
// import 'screens/HomeScreen.dart';
import 'screens/SearchScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(supportedLocales: 
    const [Locale('en'),Locale('ar')], path: 'assets/translations',
    fallbackLocale: const Locale('er'),child: const MyBudgetApp(),)
    );
}

class MyBudgetApp extends StatelessWidget {
 const MyBudgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'My Budget',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: SearchScreen(),
    );
  }
}
