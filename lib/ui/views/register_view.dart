import 'package:admin_web_movil/providers/register_form_provider.dart';
import 'package:admin_web_movil/router/router.dart';
import 'package:admin_web_movil/ui/buttons/custom_outline_buttom.dart';
import 'package:admin_web_movil/ui/buttons/link_text.dart';
import 'package:admin_web_movil/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => RegisterFormProvider(),
        child: Builder(
          builder: ((context) {
            final registerFormProvider =
                Provider.of<RegisterFormProvider>(context);
            return Container(
              margin: const EdgeInsets.only(top: 50),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 370),
                  child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      key: registerFormProvider.registerKey,
                      child: Column(
                        children: [
                          // Nombre
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Ingrese un nombre';
                              }
                              return null;
                            },
                            onChanged: (value) =>
                                registerFormProvider.name = value,
                            style: const TextStyle(color: Colors.white),
                            decoration: CustomInputs.loginInputDecoration(
                                hint: 'Ingrese su nombre',
                                label: 'Nombre',
                                icon: Icons.supervised_user_circle_sharp),
                          ),

                          const SizedBox(height: 20),

                          // Email
                          TextFormField(
                            validator: (value) {
                              if (!EmailValidator.validate(value ?? '')) {
                                return 'El email es incorrecto';
                              }
                              return null;
                            },
                            onChanged: (value) =>
                                registerFormProvider.email = value,
                            style: const TextStyle(color: Colors.white),
                            decoration: CustomInputs.loginInputDecoration(
                                hint: 'Ingrese su correo',
                                label: 'Email',
                                icon: Icons.email_outlined),
                          ),

                          const SizedBox(height: 20),

                          // Password
                          TextFormField(
                            validator: (value) {
                              if (value!.length < 6) {
                                return 'La contraseña debe tener mínimo 6 caracteres';
                              }
                              return null;
                            },
                            onChanged: (value) =>
                                registerFormProvider.password = value,
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
                              registerFormProvider.validate();
                            },
                            text: 'Crear cuenta',
                          ),

                          const SizedBox(height: 20),
                          LinkText(
                            text: 'Ir al login',
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, Flurorouter.loginRoute);
                            },
                          )
                        ],
                      )),
                ),
              ),
            );
          }),
        ));
  }
}
