import 'package:csc_picker/csc_picker.dart';
import 'package:csc_picker/model/select_status_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kisaan_app/view_models/location_modal_sheet_vm.dart';
import 'package:provider/provider.dart';

class CustomModalSheet extends StatefulWidget {
  const CustomModalSheet({super.key});

  @override
  State<CustomModalSheet> createState() => _CustomModalSheetState();
}

class _CustomModalSheetState extends State<CustomModalSheet> {
  String countryVal = "Pakistan";
  String? stateVal;
  String? cityVal;
  @override
  Widget build(BuildContext context) {
    LocationModalViewModel _viewModel =
        Provider.of<LocationModalViewModel>(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          title: Text(
            "Location",
            style: TextStyle(color: Colors.black),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              iconSize: 30,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.clear,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                //   controller: loginPasswordController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color: Colors.black,
                    )),
                    focusedBorder: OutlineInputBorder(),
                    hintText: "Search City, area or neighbourhood"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {},
              horizontalTitleGap: 0.0,
              leading: Icon(
                Icons.my_location_rounded,
                color: Colors.blue,
              ),
              title: Text(
                "Use Current Location",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                "Enable Location",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "CHOOSE CITY",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CSCPicker(
                    defaultCountry: CscCountry.Pakistan,
                    layout: Layout.vertical,
                    onCountryChanged: (value) {
                      _viewModel.countryVal = value;
                    },
                    onStateChanged: (value) {
                      _viewModel.stateVal = value;
                    },
                    onCityChanged: (value) {
                      _viewModel.cityVal = value;
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
