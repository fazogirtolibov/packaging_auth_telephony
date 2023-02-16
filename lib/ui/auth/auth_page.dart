import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_db/bloc/auth_cubit/auth_cubit.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pagenation/ui/auth/sms_page.dart';
import 'package:sms_autofill/sms_autofill.dart';

// ignore: must_be_immutable
class TelegramAuthPage extends StatelessWidget {
  TelegramAuthPage({Key? key}) : super(key: key);

  var maskFormatter = MaskTextInputFormatter(
      mask: '+###  ## ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  String? signature;

  @override
  Widget build(BuildContext context) {
    SmsAutoFill().getAppSignature.then((signature) {
      this.signature = signature;
    });
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.isDone) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SmsVerificationPage(),
              ));
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            backgroundColor: Colors.white,
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: context.read<AuthCubit>().state.isLoading
                  ? const Padding(
                      padding: EdgeInsets.all(14),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
            ),
            body: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 120,
                    ),
                    const Text(
                      "Your phone number",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 400,
                      child: TextField(
                        inputFormatters: [maskFormatter],
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          context
                              .read<AuthCubit>()
                              .checkNumber(value, signature ?? '');
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Phone number"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
