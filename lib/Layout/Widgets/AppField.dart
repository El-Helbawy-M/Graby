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
          (label != null)
              ? Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Text(
                    label,
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              : SizedBox(),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            child: Row(
              children: [
                (label == 'رقم الهاتف')
                    ? Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text('+2', style: TextStyle(color: Colors.grey)),
                      )
                    : SizedBox(),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MiniInputField extends StatelessWidget {
  const MiniInputField({this.onChanged, this.inputType});
  final onChanged, inputType;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        child: SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextFormField(
              onChanged: onChanged,
              keyboardType: inputType,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none),
                ),
                hintText:
                    (inputType == TextInputType.text) ? 'ء ب ج' : '1 2 3 4',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
