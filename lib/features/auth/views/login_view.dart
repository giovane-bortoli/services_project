import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:services_project/features/auth/controller/user_information_store.dart';
import 'package:services_project/shared/Widgets/custom_text_form_field.dart';
import 'package:services_project/shared/Widgets/snack_bar.dart';
import 'package:services_project/shared/Widgets/status_bar_widget.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(context),
    );
  }

  Widget content(context) {
    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const StatusBarWidget(),
          loginField(),
          passWordField(),
          loginButton(),
        ],
      ),
    );
  }

  Widget loginField() {
    final userStore = Provider.of<UserInformationStore>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(top: 150),
      child: CustomTextFormField(
        onChanged: (value) {
          userStore.setEmail(value);
        },
        label: const Text('Login'),
      ),
    );
  }

  Widget passWordField() {
    final userStore = Provider.of<UserInformationStore>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: CustomTextFormField(
        onChanged: (value) {
          userStore.setPassword(value);
        },
        label: const Text('Password'),
      ),
    );
  }

  Widget loginButton() {
    final userStore = Provider.of<UserInformationStore>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
          onPressed: () {
            userStore.validateFields();
            if (!userStore.hasErrorEmail == false) {
              CustomSnackBar.errorSnackBar(context, message: 'Erro ao logar!');
            } else {
              try {
                userStore
                    .loginUser(
                        email: userStore.email, password: userStore.password)
                    .then((value) {
                  return !userStore.errorFirebase
                      ? Navigator.popAndPushNamed(context, '/home')
                      : null;
                });
              } catch (e) {
                userStore.messageFirebaseError = e.toString();
              }
            }
          },
          child: const Text('Login')),
    );
  }
}
