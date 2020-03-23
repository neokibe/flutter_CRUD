import 'package:flutter/material.dart';
import 'package:flutter_firestore_crud/data/firestore_service.dart';
import 'package:flutter_firestore_crud/data/model/members.dart';
import 'package:flutter_firestore_crud/data/shared/date_formats.dart';
import 'package:flutter_firestore_crud/presentation/pages/input_date_field.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';

class AddNotePage extends StatefulWidget {
  final Note note;
  const AddNotePage({Key key, this.note,}) : super(key: key);
  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _firstNameController;
  TextEditingController _lastNameController;
  TextEditingController _genderController;
  TextEditingController _dobController;
  TextEditingController _medicalAidNameController;
  TextEditingController _medicalAidNumberController;
  TextEditingController _doctorNameController;
  TextEditingController _doctorNumberController;

//  TextEditingController _descriptionController;
  FocusNode _descriptionNode;
  String selectedGender;
  DateTime selectedDate;




  @override
  void initState() {

    _firstNameController =
        TextEditingController(text: isEditMote ? widget.note.firstName : '');
    _lastNameController =
        TextEditingController(text: isEditMote ? widget.note.lastName : '');
    _genderController =
        TextEditingController(text: isEditMote ? widget.note.gender : '');
    _dobController =
        TextEditingController(text: isEditMote ? widget.note.dob : '');
    _medicalAidNameController =
        TextEditingController(text: isEditMote ? widget.note.medicalAidName : '');
    _medicalAidNumberController =
        TextEditingController(text: isEditMote ? widget.note.medicalAidNumber : '');
    _doctorNameController =
        TextEditingController(text: isEditMote ? widget.note.doctorName : '');
    _doctorNumberController =
        TextEditingController(text: isEditMote ? widget.note.doctorNumber : '');


    super.initState();
    selectedDate = _dobController.text != null &&
        _dobController.text.isNotEmpty
        ? responseDateFormat.parse(_genderController.text)
        : DateTime.now();
    selectedGender = _genderController.text != null &&
        _genderController.text.isNotEmpty
        ? _genderController.text
        : null;
    super.initState();

//        TextEditingController(text: isEditMote ? widget.note.description : '');
   _descriptionNode = FocusNode();
  }

  get isEditMote => widget.note != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMote ? 'Edit Member' : 'Add Member'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                textInputAction: TextInputAction.next,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_descriptionNode);
                },
                controller: _firstNameController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "This field cannot be empty";
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "First Name",
                  border: OutlineInputBorder(),
                ),
              ),

              TextFormField(
                textInputAction: TextInputAction.next,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_descriptionNode);
                },
                controller: _lastNameController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "This field cannot be empty";
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Last Name",
                  border: OutlineInputBorder(),
                ),
              ),

              DropdownButton<String>(
                isExpanded: true,
                hint: Text("Select Gender"),
                value: selectedGender,
                items: <String>['F', 'M', 'O'].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (selected) {
                  _genderController.text = selected;
                  setState(() {
                    selectedGender = selected;
                  });
                  FocusScope.of(context).unfocus();
                },
              ),

              InputDateField(
                labelText: 'Date of Birth',
               valueText: new DateFormat.yMMMd().format(selectedDate),
                //valueStyle: valueStyle,
                onPressed: () {
                  _selectDate(context);
                  FocusScope.of(context).unfocus();
                },
              ),

              TextFormField(
                textInputAction: TextInputAction.next,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_descriptionNode);
                },
                controller: _medicalAidNameController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "This field cannot be empty";
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Medical Aid Name",
                  border: OutlineInputBorder(),
                ),
              ),

              TextFormField(
                textInputAction: TextInputAction.next,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_descriptionNode);
                },
                controller: _medicalAidNumberController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "This field cannot be empty";
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Medical Aid Number",
                  border: OutlineInputBorder(),
                ),
              ),

              TextFormField(
                textInputAction: TextInputAction.next,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_descriptionNode);
                },
                controller: _medicalAidNumberController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "This field cannot be empty";
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Medical Aid Number",
                  border: OutlineInputBorder(),
                ),
              ),

              TextFormField(
                textInputAction: TextInputAction.next,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_descriptionNode);
                },
                controller: _doctorNameController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "This field cannot be empty";
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Doctor Name",
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_descriptionNode);
                },
                controller: _doctorNumberController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "This field cannot be empty";
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Doctor Number",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10.0),
//              TextFormField(
//                focusNode: _descriptionNode,
//                controller: _descriptionController,
//                maxLines: 4,
//                decoration: InputDecoration(
//                  labelText: "description",
//                  border: OutlineInputBorder(),
//                ),
//              ),
              const SizedBox(height: 20.0),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text(isEditMote ? "Update" : "Save"),
                onPressed: () async {
                  if (_key.currentState.validate()) {
                    try {
                      if (isEditMote) {
                        Note note = Note(
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text,
                          gender: _genderController.text,
                          dob: _dobController.text,
                          medicalAidName: _medicalAidNameController.text,
                          medicalAidNumber: _medicalAidNumberController.text,
                          doctorName: _doctorNameController.text,
                          doctorNumber: _doctorNumberController.text,
                          id: widget.note.id,
                        );
                        await FirestoreService().updateNote(note);
                      } else {
                        Note note = Note(
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text,
                          gender: _genderController.text,
                          dob: _dobController.text,
                          medicalAidName: _medicalAidNameController.text,
                          medicalAidNumber: _medicalAidNumberController.text,
                          doctorName: _doctorNameController.text,
                          doctorNumber: _doctorNumberController.text,
                        );
                        await FirestoreService().addNote(note);
                      }
                      Navigator.pop(context);
                    } catch (e) {
                      print(e);
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }


  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: new DateTime(1930, 8),
        lastDate: new DateTime(2021));
    if (picked != null && picked != selectedDate) {
      _handleDateChange(picked);
    }
  }

  void _handleDateChange(DateTime newValue) {
    print("Selected Date: ${newValue.toIso8601String()}");
    setState(() {
      selectedDate = newValue;
    });

    _dobController.text = newValue.toIso8601String();
  }



}
