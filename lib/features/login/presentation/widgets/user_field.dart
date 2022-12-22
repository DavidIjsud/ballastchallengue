import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController? emailController;
  final String? emailError;

  const EmailField({Key? key, this.emailController, this.emailError})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ingrese su usuario',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10.0),
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                disabledBorder: InputBorder.none,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'admin',
                errorText: emailError,
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                prefixText: ' ',
                suffixStyle: const TextStyle(color: Colors.green)),
          ),
        ],
      ),
    );
  }
}
