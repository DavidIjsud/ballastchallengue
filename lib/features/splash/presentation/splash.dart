import 'package:flutter/material.dart';
import 'package:pokemonballastlane/features/login/presentation/login.dart';
import 'package:pokemonballastlane/features/searchlist/presentation/search_list.dart';
import 'package:pokemonballastlane/shared/constants/success_consts.dart';
import 'package:pokemonballastlane/shared/preferences/preferences.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      isUserAlreadyLogged();
    });
    super.initState();
  }

  Future<void> isUserAlreadyLogged() async {
    String? isLogged = await Provider.of<Preferences>(context, listen: false)
        .obtainStringValue(isLoggedKey);
    if (isLogged != null && isLogged.isNotEmpty && isLogged == isLoggedValue) {
      navigateToListProducts();
    } else {
      navigateToLogin();
    }
  }

  navigateToListProducts() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return const ListProducts();
    }));
  }

  navigateToLogin() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return const LoginScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
