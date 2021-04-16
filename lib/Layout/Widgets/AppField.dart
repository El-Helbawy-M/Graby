import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({this.inputType, this.label, this.onChanged});
  final label, inputType, onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Text(
              label,
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Row(
            children: [
              (label == 'رقم الهاتف')
                  ? Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        '+2',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    )
                  : SizedBox(),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  child: SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextFormField(
                        obscureText: (label == 'أدخال رمز المرور' ||
                                label == 'الرقم السري')
                            ? true
                            : false,
                        textDirection: (label != 'رقم الهاتف')
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        onChanged: onChanged,
                        keyboardType: inputType,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
