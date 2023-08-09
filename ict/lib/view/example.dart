import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ict/model/place.dart';
import 'package:ict/repository/place_repository.dart';
import 'package:ict/view_model/place_view_model.dart';
import 'package:provider/provider.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<PlaceViewModel>().getData("진구");
    });
  }

  @override
  Widget build(BuildContext context) {
    PlaceViewModel placeViewModel = Provider.of<PlaceViewModel>(context);

    return ListView.builder(
        itemCount: placeViewModel.data.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          Place data = placeViewModel.data[index];
          return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: Colors.black.withOpacity(0.5), width: 1)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.name.toString(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text("locate: (${data.locate?[0]}, ${data.locate?[1]})"),
                      Text("address: ${data.address.toString()}"),
                      Text("category: ${data.category.toString()}"),
                      Text("phoneNumber: ${data.phoneNumber.toString()}"),
                      Text("homepageUrl: ${data.homepageUrl.toString()}"),
                      Text("operatingHours: ${data.operatingHours.toString()}"),
                    ],
                  )
                ],
              ));
        });
  }
}
