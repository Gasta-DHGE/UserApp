import 'package:flutter/material.dart';
import 'package:gasta_user_app/dependency_provider.dart';
import 'package:gasta_user_app/pages/debug_page.dart';
import 'package:gasta_user_app/pages/login_page.dart';
import 'package:gasta_user_app/pages/signup_page.dart';

// ignore: must_be_immutable
class PageManager extends StatefulWidget with ChangeNotifier {
  final List<Widget> _pages = [];
  late Widget _currentPage;

  PageManager({super.key}) {
    _pages.add(LoginPage(this));
    _pages.add(SignupPage());
    _pages.add(DebugPage());

    _currentPage = _pages.first;
    notifyListeners();

    DependencyProvider.instance.authenticationService.addListener(() {
      if (DependencyProvider.instance.authenticationService.user == null) {
        changePage<LoginPage>();
      } else {
        changePage<DebugPage>();
      }
    });
  }

  @override
  State<StatefulWidget> createState() => _PageManager();

  void changePage<T>({bool resetPage = false}) {
    _currentPage = _pages.firstWhere((element) => element.runtimeType == T);
    notifyListeners();
  }
}

class _PageManager extends State<PageManager> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: widget, builder: (context, child) => widget._currentPage);
  }
}
