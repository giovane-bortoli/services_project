import 'dart:developer';
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:services_project/features/auth/controller/user_information_store.dart';
import 'package:services_project/features/auth/services/user/user_auth.dart';
import 'package:services_project/features/kebab_menu/controller/currency_list_store.dart';
import 'package:services_project/main.dart';
import 'package:services_project/shared/Widgets/custom_text_form_field.dart';
import 'package:services_project/shared/Widgets/loading_widget.dart';
import 'package:services_project/shared/Widgets/snack_bar.dart';
import 'package:services_project/shared/Widgets/status_bar_widget.dart';
import 'package:services_project/shared/client/custom_errors/handle_error.dart';
import 'package:services_project/shared/theme/font_theme.dart';
import 'package:services_project/shared/utils/app_colors.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

UserInformationStore userStore = UserInformationStore();
final currencyListStore = getIt<CurrencyListStore>();

class _LoginViewState extends State<LoginView> {
  late final ReactionDisposer reactionErrorFirebase;
  @override
  void initState() {
    flushBarErroFirebase();
    userStore.passwordVisible == false;
    super.initState();
  }

  void flushBarErroFirebase() {
    reactionErrorFirebase = reaction((_) => userStore.errorFirebase, (_) {
      userStore.errorFirebase
          ? CustomSnackBar.errorSnackBar(context,
              message: userStore.messageFirebaseError ?? '')
          : null;
    });
  }

  @override
  void dispose() {
    reactionErrorFirebase();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(context),
    );
  }

  Widget content(context) {
    return IntrinsicHeight(
      child: Observer(builder: (context) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const StatusBarWidget(),
              _currencyTitle(),
              _loginField(),
              _passWordField(),
              _loginButton(),
            ],
          ),
        );
      }),
    );
  }

  Widget _currencyTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Text(
        'Currency App',
        style: CustomTextTheme.textTheme.headline4,
      ),
    );
  }

  Widget _loginField() {
    final userStore = Provider.of<UserInformationStore>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: CustomTextFormField(
        onChanged: (value) {
          userStore.setEmail(value);
        },
        label: const Text('Login'),
      ),
    );
  }

  Widget _passWordField() {
    final userStore = Provider.of<UserInformationStore>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: CustomTextFormField(
        obscureText: !userStore.passwordVisible,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              if (userStore.passwordVisible == false) {
                userStore.setPasswordVisible(true);
              } else {
                userStore.setPasswordVisible(false);
              }
            },
            icon: Icon(userStore.passwordVisible
                ? Icons.visibility
                : Icons.visibility_off),
          ),
        ),
        onChanged: (value) {
          userStore.setPassword(value);
        },
        label: const Text('Password'),
      ),
    );
  }

  Widget _loginButton() {
    final userStore = Provider.of<UserInformationStore>(context, listen: false);

    return Container(
      width: 150,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: ElevatedButton(
          child: userStore.isLoading == true
              ? LoadingOverlay.loading
              : const Text('Login'),
          onPressed: () async {
            userStore.setIsLoading(true);
            try {
              currencyListStore.loadCurrencyList();
              final result = await userStore.loginUser(
                email: userStore.email,
                password: userStore.password,
              );
              if (result.runtimeType == UserCredential) {
                Navigator.popAndPushNamed(context, '/favoriteCurrencyView');
              }
            } catch (e) {
              await HandleError.getErrorMessageView(e, context);
            }
            userStore.setIsLoading(false);
          },
        ),
      ),
    );
  }
}
