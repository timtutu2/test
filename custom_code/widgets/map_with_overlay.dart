// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

import 'package:connextion/flutter_flow/flutter_flow_google_map.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;

List<Map<String, dynamic>> data = [
  {
    'id': '1',
    'position': LatLng(24.789, 120.993),
    'assetPath': 'assets/images/square.png',
  },
  {
    'id': '2',
    'position': LatLng(24.787642, 120.993054),
    'assetPath': 'assets/images/duck.gif',
  },
];

class MapWithOverlay extends StatefulWidget {
  const MapWithOverlay({
    Key? key,
    this.width,
    this.height,
    this.userLocation,
    this.schoolLocation,
    required this.schoolLocationDoc,
    required this.schoolLocAll
  }) : super(key: key);

  final double? width;
  final double? height;
  final LatLng? userLocation;
  final List<LatLng>? schoolLocation;
  final List<SchoolLocRecord> schoolLocationDoc;
  final List<List<LatLng>>? schoolLocAll;

  @override
  State<MapWithOverlay> createState() => _MapWithOverlayState();
}

class _MapWithOverlayState extends State<MapWithOverlay> with TickerProviderStateMixin {
  late gmaps.GoogleMapController _mapController;
  double _zoomLevel = 15.0;
  final Map<String, gmaps.Marker> _markers = {};
  List<BitmapDescriptor> _duckFrames = [];
  late AnimationController _animationController;
  final List<String> framePaths = [];
  Set<gmaps.Polygon> _polygons = {};
  Map<String, List<gmaps.LatLng>> _schoollocationfromDoc = {};
  List<List<gmaps.LatLng>> schoolL_All = [];
  String newpath = 'assets/images/duck-0.png';
  late Future<void> _loadLocationFuture;
  //for location drop down
  bool _isDropdownVisible = false;
  String _selectedLocation = '本部校區';
  late Map<String, gmaps.LatLng> _locations= {} ;

  @override
  void initState() {
    super.initState();
    print('init');
    _loadLocationFuture =_loadloaction();
    _loadDuckFrames().then((_) {
      _initializeAnimation();
    });
    _generateMarkers();
  }

  Future<void> _loadDuckFrames() async {
    for (int i = 0; i <= 14; i++) {
      framePaths.add('assets/images/duck-$i.png');
    }
    for (String path in framePaths) {
      gmaps.BitmapDescriptor _markerIcon =
          await _getScaledIcon(path, _zoomLevel);
      _duckFrames.add(_markerIcon);
    }
  }

  Future<void> _loadloaction() async{ 
    await Future.delayed(Duration(milliseconds: 1200)); //potential change app state
    for(int i=0; i<widget.schoolLocAll!.length; i++){
      schoolL_All.add(convertLatLngList(widget.schoolLocAll![i]));
    }
    print(convertLatLng(widget.schoolLocationDoc[1].center)); 

    if (widget.schoolLocationDoc.isNotEmpty) {
    for(int i=0; i<widget.schoolLocationDoc!.length; i++){
      _locations[widget.schoolLocationDoc[i].name]=convertLatLng(widget.schoolLocationDoc[i].center); 
      print('in_cen'); 
      }
    }
  }

  // Future<void> _loadcenter() async{
  //   await Future.delayed(Duration(milliseconds: 1200));
  //   for(int i=0; i<widget.schoolLocationDoc.length; i++){
  //       print(widget.schoolLocationDoc.length);
  //       _locations[widget.schoolLocationDoc[i].name]=convertLatLng(widget.schoolLocationDoc![i].center); 
  //       print('in_cen'); 
  //   }
  // }

  // Future<void> _loadPolygons() async {
  //   await Future.delayed(Duration(milliseconds: 1000)); // Simulate loading delay
  //   if (_schoollocationfromDoc.isNotEmpty) {
  //     print('inload');
  //     Set<gmaps.Polygon> polygons = {
  //       gmaps.Polygon(
  //         polygonId: gmaps.PolygonId('overlayPolygon'),
  //         points: _schoollocationfromDoc['1']!,
  //         strokeWidth: 2,
  //         strokeColor: Colors.red,
  //         fillColor: Colors.red.withOpacity(0.1),
  //       ),
  //       gmaps.Polygon(
  //         polygonId: gmaps.PolygonId('overlayPolygon2'),
  //         points: _schoollocationfromDoc['0']!,
  //         strokeWidth: 2,
  //         strokeColor: Colors.red,
  //         fillColor: Colors.red.withOpacity(0.1),
  //       ),
  //     };
  //     setState(() {
  //       _polygons = polygons;
  //     });
  //   }
  // }

  void _initializeAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), // Adjust the duration as needed
    )..repeat();

    _animationController.addListener(() {
      setState(() {
        _updateAnimatedMarker();
      });
    });
  }

  Future<void> _updateAnimatedMarker() async {
    final frameIndex = (_animationController.value * framePaths.length).floor() % framePaths.length;
    final newpath = framePaths[frameIndex];
    
    final newMarker = _markers['duck']!.copyWith(
      iconParam: _duckFrames.isNotEmpty 
        ? await _getScaledIcon(newpath, _zoomLevel) 
        : BitmapDescriptor.defaultMarker,
    );

    setState(() {
      _markers['duck'] = newMarker;
    });
  }

  void _onMapCreated(gmaps.GoogleMapController controller) {
    _mapController = controller;
    setState(() {
      _generateMarkers();
    });
  }

  void _onCameraMove(gmaps.CameraPosition position) {
    setState(() {
      _zoomLevel = position.zoom;
      _updateMarkers();
    });
  }

  gmaps.LatLng convertLatLng(LatLng? flutterFlowLatLng) {
    return gmaps.LatLng(
        flutterFlowLatLng!.latitude, flutterFlowLatLng.longitude);
  }

  List<gmaps.LatLng> convertLatLngList(List<LatLng>? flutterFlowLatLngList) {
    List<gmaps.LatLng> temp = [];
    //print(flutterFlowLatLngList!.length);

    for (var i = 0; i < flutterFlowLatLngList!.length; i++) {
      temp.add(gmaps.LatLng(flutterFlowLatLngList[i].latitude,
          flutterFlowLatLngList[i].longitude));
    }
    return temp;
  }

  _generateMarkers() async {
    for (int i = 0; i < data.length; i++) {
      gmaps.BitmapDescriptor markerIconGen;
      if (i == 1) {
         markerIconGen = _duckFrames.isNotEmpty ? await _getScaledIcon(newpath, _zoomLevel) : BitmapDescriptor.defaultMarker;
        _markers['duck'] = gmaps.Marker(
          markerId: gmaps.MarkerId('duck'),
          position: convertLatLng(data[i]['position']),
          icon: markerIconGen,
          infoWindow: gmaps.InfoWindow(title: 'Animated Duck Marker'),
          onTap: () {
            _showDuckMarkerBottomSheet();
          },
        );
      } else {
        gmaps.BitmapDescriptor markerIcon =
            await _getScaledIcon(data[i]['assetPath'], _zoomLevel);
        _markers[i.toString()] = gmaps.Marker(
            markerId: MarkerId(i.toString()),
            position: convertLatLng(data[i]['position']),
            icon: markerIcon,
            infoWindow: InfoWindow(title: 'This is a marker'));
      }
      setState(() {});
    }
    print('Markers created');
  }

  _updateMarkers() async {
    for (int i = 0; i < data.length; i++) {
      gmaps.BitmapDescriptor markerIcon;
      if (i == 1) {
        // markerIcon = _duckFrames.isNotEmpty ? await _getScaledIcon(newpath, _zoomLevel) : BitmapDescriptor.defaultMarker;
        // _markers['duck'] = gmaps.Marker(
        //   markerId: gmaps.MarkerId('duck'),
        //   position: convertLatLng(data[i]['position']),
        //   icon: markerIcon,
        //   infoWindow: gmaps.InfoWindow(title: 'Animated Duck Marker'),
        // );
        //print('in duck update');
      } else {
        markerIcon = await _getScaledIcon(data[i]['assetPath'], _zoomLevel);
        _markers[i.toString()] = gmaps.Marker(
          markerId: gmaps.MarkerId(i.toString()),
          position: convertLatLng(data[i]['position']),
          icon: markerIcon,
          infoWindow: gmaps.InfoWindow(title: 'This is a marker'),
        );
      }
      setState(() {});
    }
    //setState(() {});
    print('update marker');
  }

  Future<gmaps.BitmapDescriptor> _getScaledIcon(String assetPath, double zoom) async {

    double scale = zoom >= 14.5 ? (50 + (zoom - 14.5) / 7 * 450) : 1;

    final byteData = await rootBundle.load(assetPath);
    final imageData = byteData.buffer.asUint8List();

    // final ImageConfiguration imageConfiguration = ImageConfiguration(size: Size(24*scale, 24*scale));
    // return await gmaps.BitmapDescriptor.fromAssetImage(imageConfiguration, assetPath);
    final result = await FlutterImageCompress.compressWithList(
      imageData,
      minWidth: (scale).toInt(),
      minHeight: (scale).toInt(),
      format: CompressFormat.png,
    );

    return gmaps.BitmapDescriptor.fromBytes(result);
  }

  //Action
  void _showDuckMarkerBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Duck Marker Clicked!'),
                ElevatedButton(
                  child: Text('Close'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Move Camera Function
  void _moveCameraToPosition(gmaps.LatLng position) {
    _mapController.animateCamera(
      gmaps.CameraUpdate.newCameraPosition(
        gmaps.CameraPosition(
          target: position,
          tilt: 60,
          zoom: _zoomLevel,
        ),
      ),
    );
  }

  //Build main
  @override
  Widget build(BuildContext context) {
    gmaps.LatLng Startpoint;
    List<gmaps.LatLng> schoolL;
    

    if (widget.userLocation != null) {
      Startpoint = convertLatLng(widget.userLocation);
    } else {
      Startpoint = gmaps.LatLng(24.788, 120.993);
    }

    if (widget.schoolLocation != null || widget.schoolLocation!.isNotEmpty) {
      
      schoolL = convertLatLngList(widget.schoolLocation);
    } else {
      schoolL = [
        gmaps.LatLng(24.789, 120.993),
        gmaps.LatLng(24.788, 120.994),
        gmaps.LatLng(24.787, 120.993),
        gmaps.LatLng(24.788, 120.992),
      ];
    }

    return FutureBuilder<void>(
    future: _loadLocationFuture ,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error loading locations'));
      } else {
          return Stack(
            children: [
              gmaps.GoogleMap(
                onMapCreated: _onMapCreated,
                onCameraMove: _onCameraMove,
                initialCameraPosition: gmaps.CameraPosition(
                  //target: Startpoint, // Center of polygon
                  target: gmaps.LatLng(24.792172, 120.990628),
                  tilt: 60,
                  zoom: _zoomLevel,
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                polygons: {
                    gmaps.Polygon(
                      polygonId: gmaps.PolygonId('overlayPolygon'),
                      points: schoolL_All[0],
                      strokeWidth: 2,
                      strokeColor: Colors.red,
                      fillColor: Colors.red.withOpacity(0.1),
                    ),
                    gmaps.Polygon(
                      polygonId: gmaps.PolygonId('overlayPolygon2'),
                      points: schoolL_All[1],
                      strokeWidth: 2,
                      strokeColor: Colors.red,
                      fillColor: Colors.red.withOpacity(0.1),
                    ),
                  },
                //polygons: _polygons.toSet(),
                markers: _markers.values.toSet(),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Column(
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        _isDropdownVisible = !_isDropdownVisible;
                      });
                    },
                    child: Icon(Icons.location_on),
                  ),
                  if (_isDropdownVisible)
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: DropdownButton<String>(
                        value: _selectedLocation,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedLocation = newValue!;
                            _moveCameraToPosition(_locations[_selectedLocation]!);
                          });
                        },
                        items: _locations.keys.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      }
    );
  }
}
