import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:td2_2223/models/task.dart';
import 'package:td2_2223/viewmodels/taskviewmodel.dart';

class MyCustomFormModification extends StatefulWidget {
  final int taskId;

  const MyCustomFormModification({super.key, required this.taskId});

  @override
  MyCustomFormModificationState createState() {
    return MyCustomFormModificationState();
  }
}

class MyCustomFormModificationState extends State<MyCustomFormModification> {
  @override
  void initState() {
    super.initState();

    if (widget.taskId != null) {
      // Get the task from the provider using the task ID
      Task task = context.read<TaskViewModel>().getTaskById(widget.taskId);

      // Set the initial values of the form fields to the values of the task
      titrecontroller.text = task.title;
      nbhourscontroller.text = task.nbhours.toString();
      difficultycontroller.text = task.difficulty.toString();
      tagscontroller.text = task.tags.join(', ');
      descriptioncontroller.text = task.description;
    }
  }

  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _ageHasError = false;
  bool _genderHasError = false;

  TextEditingController titrecontroller = TextEditingController();
  TextEditingController nbhourscontroller = TextEditingController();
  TextEditingController difficultycontroller = TextEditingController();
  TextEditingController tagscontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();

  void _onChanged(dynamic val) => debugPrint(val.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Builder Example')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FormBuilder(
                key: _formKey,
                // enabled: false,
                onChanged: () {
                  _formKey.currentState!.save();
                  // debugPrint(_formKey.currentState!.value.toString());
                },
                autovalidateMode: AutovalidateMode.disabled,
                initialValue: const {
                  'movie_rating': 5,
                  'best_language': 'Dart',
                  'age': '8',
                  'gender': 'Female',
                  'languages_filter': ['Dart']
                },
                skipDisabled: true,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 15),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: 'title',
                      controller: titrecontroller,
                      decoration: InputDecoration(
                        labelText: 'title',
                        suffixIcon: _ageHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: Colors.green),
                      ),
                      onChanged: (val) {
                        setState(() {
                          _ageHasError = !(_formKey
                                  .currentState?.fields['title']
                                  ?.validate() ??
                              false);
                        });
                      },
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                    ),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: 'nbhours',
                      controller: nbhourscontroller,
                      decoration: InputDecoration(
                        labelText: 'nbhours',
                        suffixIcon: _ageHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: Colors.green),
                      ),
                      onChanged: (val) {
                        setState(() {
                          _ageHasError = !(_formKey
                                  .currentState?.fields['nbhours']
                                  ?.validate() ??
                              false);
                        });
                      },
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                      ]),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                    ),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: 'difficulty',
                      controller: difficultycontroller,
                      decoration: InputDecoration(
                        labelText: 'difficulty',
                        suffixIcon: _ageHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: Colors.green),
                      ),
                      onChanged: (val) {
                        setState(() {
                          _ageHasError = !(_formKey
                                  .currentState?.fields['difficulty']
                                  ?.validate() ??
                              false);
                        });
                      },
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                      ]),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                    ),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: 'tags',
                      controller: tagscontroller,
                      decoration: InputDecoration(
                        labelText: 'tags',
                        suffixIcon: _ageHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: Colors.green),
                      ),
                      onChanged: (val) {
                        setState(() {
                          _ageHasError = !(_formKey.currentState?.fields['tags']
                                  ?.validate() ??
                              false);
                        });
                      },
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                    ),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: 'description',
                      controller: descriptioncontroller,
                      decoration: InputDecoration(
                        labelText: 'description',
                        suffixIcon: _ageHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: Colors.green),
                      ),
                      onChanged: (val) {
                        setState(() {
                          _ageHasError = !(_formKey
                                  .currentState?.fields['description']
                                  ?.validate() ??
                              false);
                        });
                      },
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                    )
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          context.read<TaskViewModel>().editTask(Task.editTask(
                              widget.taskId,
                              titrecontroller.text,
                              tagscontroller.text,
                              int.parse(nbhourscontroller.text),
                              int.parse(nbhourscontroller.text),
                              descriptioncontroller.text));
                          Navigator.pop(context);
                        }
                      },
                      child: const Text(
                        'Modifier',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        _formKey.currentState?.reset();
                      },
                      child: Text(
                        'Reset',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
