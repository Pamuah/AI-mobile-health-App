import 'package:flutter/material.dart';

class AddMedicationScreen extends StatefulWidget {
  static const routeName = '/add-medication';

  const AddMedicationScreen({super.key});

  @override
  State<AddMedicationScreen> createState() => _AddMedicationScreenState();
}

class _AddMedicationScreenState extends State<AddMedicationScreen> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
                const Divider(
                  height: 12,
                  thickness: 0.005,
                ),
                Text(
                  "Add Medication",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                    color: color.secondary,
                  ),
                ),
                const Divider(
                  height: 15,
                  thickness: 0.005,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text("Medication Name"),
                  ),
                ),
                const Divider(
                  height: 20,
                  thickness: 0.005,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text("Duration"),
                  ),
                ),
                const Divider(
                  height: 15,
                  thickness: 0.005,
                ),
                Text(
                  "Timings",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: color.secondary,
                  ),
                ),
                const Divider(
                  height: 15,
                  thickness: 0.005,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      height: 70,
                      width: 70,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: color.primary,
                      ),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Icon(
                              Icons.sunny,
                              color: color.secondary,
                              size: 30,
                            ),
                          ),
                          Icon(
                            Icons.cloud,
                            color: color.secondary,
                            size: 40,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      height: 70,
                      width: 70,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: color.primary,
                      ),
                      child: Icon(
                        Icons.sunny,
                        color: color.secondary,
                        size: 40,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      height: 70,
                      width: 70,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: color.primary,
                      ),
                      child: Icon(
                        Icons.mode_night_outlined,
                        color: color.secondary,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 20,
                  thickness: 0.005,
                ),
                Text(
                  "Notification",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: color.secondary,
                  ),
                ),
                const Divider(
                  height: 15,
                  thickness: 0.005,
                ),
                const SizedBox(
                  width: 700,
                  height: 300,
                  child: TimePickerDialog(
                    initialTime: TimeOfDay(hour: 10, minute: 00),
                  ),
                ),
                const Divider(
                  height: 15,
                  thickness: 0.005,
                ),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Done",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: color.secondary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
