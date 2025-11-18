import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_add_button.dart';
import 'package:note_app/widgets/custom_text_field.dart';

class AddNoteButtomSheet extends StatelessWidget {
  const AddNoteButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(child: AddButtomForm()),
    );
  }
}

class AddButtomForm extends StatefulWidget {
  const AddButtomForm({
    super.key,
  });

  @override
  State<AddButtomForm> createState() => _AddButtomFormState();
}

class _AddButtomFormState extends State<AddButtomForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          CustomTextFormField(
            hintText: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            hintText: "Content",
            maxLines: 6,
            onSaved: (value) {
              content = value;
            },
          ),
          SizedBox(
            height: 120,
          ),
          CustomAddButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
