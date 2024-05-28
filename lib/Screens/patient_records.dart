import 'package:ai_mhealth_app/widgets/updated_textfield.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PatientRecords extends StatefulWidget {
  static const routeName = '/patient-records';
  const PatientRecords({super.key});

  @override
  State<PatientRecords> createState() => _PatientRecordsState();
}

class _PatientRecordsState extends State<PatientRecords> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController extraConditionsController = TextEditingController();

  bool? diabetesCheck = false;
  bool? hypertensionCheck = false;
  bool? asthmaCheck = false;
  bool? hivCheck = false;
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        centerTitle: true,
        title: Text(
          'Patient Records',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color.secondary),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UpdatedTextfield(
                    hintText: 'Patrick',
                    controller: firstNameController,
                    contentPadding: const EdgeInsets.only(top: 5, left: 16.0),
                    height: 55,
                    width: MediaQuery.of(context).size.width * 0.4,
                    text: 'First Name'),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: UpdatedTextfield(
                      hintText: 'Amuah',
                      controller: surnameController,
                      contentPadding: const EdgeInsets.only(top: 5, left: 16.0),
                      height: 55,
                      width: MediaQuery.of(context).size.width * 0.4,
                      text: 'Surname'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UpdatedTextfield(
                      hintText: 'dd-mm-yy',
                      controller: dobController,
                      contentPadding: const EdgeInsets.only(top: 5, left: 16.0),
                      height: 55,
                      width: MediaQuery.of(context).size.width * 0.5,
                      text: 'Date Of Birth'),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: UpdatedTextfield(
                        hintText: 'M/F',
                        controller: genderController,
                        contentPadding:
                            const EdgeInsets.only(top: 5, left: 16.0),
                        height: 55,
                        width: MediaQuery.of(context).size.width * 0.3,
                        text: 'Gender'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UpdatedTextfield(
                      hintText: 'eg. O+',
                      controller: bloodGroupController,
                      contentPadding: const EdgeInsets.only(top: 5, left: 16.0),
                      height: 55,
                      width: MediaQuery.of(context).size.width * 0.25,
                      text: 'Blood Group'),
                  UpdatedTextfield(
                      hintText: 'eg 180cm',
                      controller: heightController,
                      contentPadding: const EdgeInsets.only(top: 5, left: 16.0),
                      height: 55,
                      width: MediaQuery.of(context).size.width * 0.25,
                      text: 'Height'),
                  UpdatedTextfield(
                      hintText: 'eg 85kg',
                      controller: weightController,
                      contentPadding: const EdgeInsets.only(top: 5, left: 16.0),
                      height: 55,
                      width: MediaQuery.of(context).size.width * 0.25,
                      text: 'Weight'),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
              child: Text(
                'Check the box if you have any of the following Health Condition',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 239, 104, 104)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 7.0),
                            child: Text(
                              'Diabetes',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: color.secondary),
                            ),
                          ),
                          Checkbox(
                              value: diabetesCheck,
                              activeColor: color.secondary,
                              onChanged: (newbool) {
                                setState(() {
                                  diabetesCheck = newbool!;
                                });
                              }),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 7.0),
                            child: Text(
                              'Hypertension',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: color.secondary),
                            ),
                          ),
                          Checkbox(
                              value: hypertensionCheck,
                              activeColor: color.secondary,
                              onChanged: (newbool) {
                                setState(() {
                                  hypertensionCheck = newbool!;
                                });
                              }),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 7.0),
                            child: Text(
                              'Asthma',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: color.secondary),
                            ),
                          ),
                          Checkbox(
                              value: asthmaCheck,
                              activeColor: color.secondary,
                              onChanged: (newbool) {
                                setState(() {
                                  asthmaCheck = newbool!;
                                });
                              }),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 7.0),
                            child: Text(
                              'HIV/AIDs',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: color.secondary),
                            ),
                          ),
                          Checkbox(
                              value: hivCheck,
                              activeColor: color.secondary,
                              onChanged: (newbool) {
                                setState(() {
                                  hivCheck = newbool!;
                                });
                              }),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            UpdatedTextfield(
                hintText: '',
                controller: surnameController,
                contentPadding: const EdgeInsets.only(top: 5, left: 16.0),
                height: 70,
                width: MediaQuery.of(context).size.width,
                text: 'Any Other Health Condition'),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: UpdatedTextfield(
                  hintText: 'eg. 0545595932',
                  controller: surnameController,
                  contentPadding: const EdgeInsets.only(top: 5, left: 16.0),
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  text: 'Contact'),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: SizedBox(
                height: 55, //
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Proceed To AI',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: color.secondary,
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
