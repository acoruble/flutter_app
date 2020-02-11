import 'package:flutter/material.dart';
import 'package:flutter_app/models/company.dart';
import 'package:flutter_app/stores/company_store.dart';
import 'package:flutter_app/stores/location_store.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';

class MapTab extends StatelessWidget {
  MapController _mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Observer(builder: (context) {
        return Stack(
          children: <Widget>[
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                center: LatLng(47.475819, -0.603992),
                zoom: 10,
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                  keepBuffer: (2),
                ),
                _getMarkers(context)
              ],
            ),
            Positioned(
              bottom: 10,
              left: 20,
              child: RawMaterialButton(
                onPressed: () {
                  Provider.of<LocationStore>(context, listen: false).init();
                  print('location');
                },
                fillColor: Colors.white,
                shape: CircleBorder(),
                child: Icon(
                  Icons.my_location,
                  size: 25,
                ),
                constraints: BoxConstraints.expand(height: 45, width: 45),
              ),
            ),
          ],
        );
      }),
    );
  }

  MarkerLayerOptions _getMarkers(BuildContext context) {
    List<Marker> markers = [];
    CompanyStore companyStore = Provider.of<CompanyStore>(context);
    LocationStore locationStore = Provider.of<LocationStore>(context);
    companyStore.companies.forEach((company) {
      markers.add(Marker(
          point: company.address.position,
          builder: (context) => InkWell(
            child: Icon(
              Icons.place,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('detailscompany',
                  arguments: {'company': company});
            },
          )
          ));
    });
    markers.add(Marker(
        point: locationStore.location,
        builder: (context) => Icon(
              Icons.my_location,
              color: Colors.red,
            )));

    return MarkerLayerOptions(markers: markers);
  }
}