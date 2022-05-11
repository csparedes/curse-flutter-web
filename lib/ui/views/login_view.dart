import 'package:admin_web_movil/providers/auth_provider.dart';
import 'package:admin_web_movil/providers/login_form_provider.dart';
import 'package:admin_web_movil/router/router.dart';
import 'package:admin_web_movil/ui/buttons/custom_outline_buttom.dart';
import 'package:admin_web_movil/ui/buttons/link_text.dart';
import 'package:admin_web_movil/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(
        builder: (context) {
          final formLoginProvider =
              Provider.of<LoginFormProvider>(context, listen: false);
          return Container(
            margin: const EdgeInsets.only(top: 100),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 370),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: formLoginProvider.formKey,
                  child: Column(
                    children: [
                      // Email
                      TextFormField(
                        validator: (value) {
                          if (!EmailValidator.validate(value ?? '')) {
                            return 'El correo ingresado es inválido';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          formLoginProvider.email = value;
                        },
                        autofocus: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                            hint: 'Ingrese su correo',
                            label: 'Email',
                            icon: Icons.email_outlined),
                        // textInputAction: TextInputAction.continueAction,
                      ),

                      const SizedBox(height: 20),

                      // Password
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Ingrese la contraseña';
                          }
                          if (value.length < 6) {
                            return 'La contraseña debe tener mínimo 6 caracteres';
                          }
                          return null;
                        },
                        onChanged: (value) =>
                            formLoginProvider.password = value,
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                            hint: '*********',
                            label: 'Contraseña',
                            icon: Icons.lock_outline_rounded),
                      ),

                      const SizedBox(height: 20),
                      CustomOutlinedButton(
                        onPressed: () {
                          if (formLoginProvider.validate()) {
                            authProvider.login(
                              formLoginProvider.email,
                              formLoginProvider.password,
                            );
                          }
                        },
                        text: 'Ingresar',
                      ),

                      const SizedBox(height: 20),
                      LinkText(
                        text: 'Nueva cuenta',
                        onPressed: () {
                          Navigator.pushNamed(
                              context, Flurorouter.registerRoute);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
