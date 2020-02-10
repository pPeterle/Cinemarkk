import 'package:flutter/material.dart';

class LoginInput extends StatelessWidget {
  final String label;
  final Function(String) onTextChanged;
  final bool obscureText;

  const LoginInput({Key key, this.label, this.onTextChanged, this.obscureText = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            label,
            style:
                TextStyle(color: Color.fromRGBO(98, 98, 100, 1), fontSize: 18),
          ),
          SizedBox(height: 8),
          TextField(
            onChanged: onTextChanged,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white),
            obscureText: obscureText,
            decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.white),
                ),
                hoverColor: Colors.white,
                focusColor: Colors.white,
                fillColor: theme.scaffoldBackgroundColor),
          )
        ],
      ),
    );
  }
}
