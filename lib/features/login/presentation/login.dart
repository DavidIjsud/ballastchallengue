import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemonballastlane/features/login/presentation/bloc/login_bloc.dart';
import 'package:pokemonballastlane/features/login/presentation/widgets/login_button.dart';
import 'package:pokemonballastlane/features/login/presentation/widgets/password_field.dart';
import 'package:pokemonballastlane/features/login/presentation/widgets/register_button.dart';
import 'package:pokemonballastlane/features/login/presentation/widgets/user_field.dart';
import 'package:pokemonballastlane/features/searchlist/presentation/search_list.dart';
import 'package:pokemonballastlane/shared/constants/success_consts.dart';
import 'package:pokemonballastlane/shared/preferences/preferences.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController, _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xfff4f4f4),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 40.0),
                    EmailField(
                      emailController: _emailController,
                    ),
                    PasswordField(
                      passwordController: _passwordController,
                      passwordError: '',
                    ),
                    BlocConsumer<LoginBloc, LoginState>(builder: (_, state) {
                      return SizedBox(
                        width: double.maxFinite,
                        child: LoginButton(onPressed: () {
                          context.read<LoginBloc>().add(OnLogin(
                                password: _passwordController.text,
                                user: _emailController.text,
                              ));
                        }),
                      );
                    }, listener: (_, state) {
                      if (state is LoginSuccess) {
                        Provider.of<Preferences>(context, listen: false)
                            .savePreferences(isLoggedKey, isLoggedValue);
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return const ListProducts();
                        }));
                      }
                    }),
                    const SizedBox(
                      width: double.maxFinite,
                      child: RegisterButton(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
