import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/widgets/add_bottom_form.dart';

class AddNoteButtomSheet extends StatelessWidget {
  const AddNoteButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
          child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          // Will use all states
          // 1- Success State
          if (state is AddNoteSuccessState) {
            Navigator.pop(context);
          }
          // 2- Failure state
          if (state is AddNoteFailureState) {
            print('Failed');
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            // 3- Loading state
              inAsyncCall: state is AddNoteLoadingState ? true : false,
              child: AddButtomForm());
        },
      )),
    );
  }
}
