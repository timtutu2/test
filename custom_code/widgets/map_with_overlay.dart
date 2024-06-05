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
import 'dart:convert';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

import 'package:connextion/flutter_flow/flutter_flow_google_map.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;


class MapWithOverlay extends StatefulWidget {
  const MapWithOverlay({
    Key? key,
    this.width,
    this.height,
    this.userLocation,
    this.schoolLocation,
    required this.schoolLocationDoc,
    required this.schoolLocAll,
    required this.items,
  }) : super(key: key);

  final double? width;
  final double? height;
  final LatLng? userLocation;
  final List<LatLng>? schoolLocation;
  final List<SchoolLocRecord> schoolLocationDoc;
  final List<List<LatLng>>? schoolLocAll;
  final List<ItemOnMapStruct> items;

  @override
  State<MapWithOverlay> createState() => _MapWithOverlayState();
}

class _MapWithOverlayState extends State<MapWithOverlay> with TickerProviderStateMixin {
  late gmaps.GoogleMapController _mapController;
  double _zoomLevel = 15.0;
  final Map<String, gmaps.Marker> _markers = {};
//load gif
  List<BitmapDescriptor> _duckFrames = [];
  List<BitmapDescriptor> _buildingsFrames = [];
  final List<String> duckframePaths = [];
  final List<String> buildingsframePaths = [];
  String ducknewpath = 'assets/images/duck/duck-0.png';
  String buildingsnewpath = 'assets/images/buildings/buildings-0.png';
//load gif
  late AnimationController _animationController;
  Set<gmaps.Polygon> _polygons = {};
  Map<String, List<gmaps.LatLng>> _schoollocationfromDoc = {};
  List<List<gmaps.LatLng>> schoolL_All = [];
  
  late Future<void> _loadLocationFuture;
  //for location drop down
  bool _isDropdownVisible = false;
  String _selectedLocation = '光復校區';  //need to change 'not static' by tim
  late Map<String, gmaps.LatLng> _locations= {} ;
  late List<Map<String, dynamic>> data= [];

  @override
  void initState() {
    super.initState();
    print('init');
    _loaddata().then((_) {
      _generateMarkers();
      _loadgifFrames().then((_) {
        _initializeAnimation();
      });
    });
    _loadLocationFuture =_loadloaction();
  }

  //this is the function to load custom map style json
  void changeMapMode(GoogleMapController mapController) {
    getJsonFile("assets/map/map_style.json")
        .then((value) => setMapStyle(value, mapController));
  }
  
  //map change help function
  void setMapStyle(String mapStyle, GoogleMapController mapController) {
    mapController.setMapStyle(mapStyle);
  }
  
  //map change help function
  Future<String> getJsonFile(String path) async {
    ByteData byte = await rootBundle.load(path);
    var list = byte.buffer.asUint8List(byte.offsetInBytes,byte.lengthInBytes);
    return utf8.decode(list);
  }

  Future<void> _loaddata() async{
  await Future.delayed(Duration(milliseconds: 1000));
  print(widget.items.length);
  for (int i = 0; i < widget.items.length; i++) {
    String tempname=widget.items[i].itemName;
    switch(tempname){
      case 'duck':
        var item = {
        'id': (i + 1).toString(), // Convert to string to match your initial structure
        'pic_name': widget.items[i].itemName,
        'position': widget.items[i].itemLoc, // Assuming itemLoc is a LatLng
        'assetPath': 'assets/images/duck/duck.gif' // Set asset path, modify as needed
        };
        data.add(item);
      case 'buildings':
        var item = {
        'id': (i + 1).toString(), // Convert to string to match your initial structure
        'pic_name': widget.items[i].itemName,
        'position': widget.items[i].itemLoc, // Assuming itemLoc is a LatLng
        'assetPath': 'assets/images/buildings/buildings-0.png' // Set asset path, modify as needed
        };
        data.add(item);
    }
  }
  print(data);
}

  Future<void> _loadgifFrames() async {
    //duck
    for (int i = 0; i <= 14; i++) {
      duckframePaths.add('assets/images/duck/duck-$i.png');
    }
    for (String path in duckframePaths) {
      gmaps.BitmapDescriptor _markerIcon = await _getScaledIcon(path, _zoomLevel);
      _duckFrames.add(_markerIcon);
    }
    //buildings
    for (int i = 0; i <= 37; i++) {
      buildingsframePaths.add('assets/images/buildings/buildings-$i.png');
    }
    for (String path in buildingsframePaths) {
      gmaps.BitmapDescriptor _markerIcon = await _getScaledIcon(path, _zoomLevel);
      _buildingsFrames.add(_markerIcon);
    }
  }

  Future<void> _loadloaction() async{ 
    await Future.delayed(Duration(milliseconds: 1000)); //potential change app state
    for(int i=0; i<widget.schoolLocAll!.length; i++){
      schoolL_All.add(convertLatLngList(widget.schoolLocAll![i]));
    }
    //load center
    if (widget.schoolLocationDoc.isNotEmpty) {
    for(int i=0; i<widget.schoolLocationDoc!.length; i++){
      _locations[widget.schoolLocationDoc[i].name]=convertLatLng(widget.schoolLocationDoc[i].center); 
      print('in_cen'); 
      }
    }
    _loadPolygons();
  }

  void _loadPolygons()  {
    if (schoolL_All.isNotEmpty) {
    print('inloadpoly');
    Set<gmaps.Polygon> polygons = {};
    for (int i=0; i<schoolL_All.length; i++) {
      polygons.add(
        gmaps.Polygon(
          polygonId: gmaps.PolygonId('overlayPolygon_$i'),
          points: schoolL_All[i],
          strokeWidth: 2,
          strokeColor: Colors.red,
          fillColor: Colors.red.withOpacity(0.1),
        ),
      );
    }
    setState(() {
      _polygons = polygons;
    });
    }
  }

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
    for(int i = 0; i < data.length; i++){
      String icon_name=data[i]['pic_name'];
      switch (icon_name){
        case 'duck':
          final frameIndex = (_animationController.value * duckframePaths.length).floor() % duckframePaths.length;
          ducknewpath = duckframePaths[frameIndex];
          final newMarker = _markers[i.toString()]!.copyWith(
            iconParam: _duckFrames.isNotEmpty ? await _getScaledIcon(ducknewpath, _zoomLevel) : BitmapDescriptor.defaultMarker,
          );
          setState(() {
            _markers[i.toString()] = newMarker;
          });
          break;
        case 'buildings':
          final frameIndex = (_animationController.value * buildingsframePaths.length).floor() % buildingsframePaths.length;
          buildingsnewpath = buildingsframePaths[frameIndex];
          final newMarker = _markers[i.toString()]!.copyWith(
            iconParam: _buildingsFrames.isNotEmpty ? await _getScaledIcon(buildingsnewpath, _zoomLevel) : BitmapDescriptor.defaultMarker,
          );
          setState(() {
            _markers[i.toString()] = newMarker;
          });
          break;
      }
    }
  }

  void _onMapCreated(gmaps.GoogleMapController controller) {
    _mapController = controller;
    changeMapMode(_mapController);
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
    print(data.length);
    for (int i = 0; i < data.length; i++) {
      gmaps.BitmapDescriptor markerIconGen;
      String tempname=data[i]['pic_name'];
      //print(tempname);
      switch (tempname) {
        case 'duck':
          markerIconGen = _duckFrames.isNotEmpty ? await _getScaledIcon(ducknewpath, _zoomLevel) : BitmapDescriptor.defaultMarker;
          _markers[i.toString()] = gmaps.Marker(
          markerId: gmaps.MarkerId(data[i]['id'].toString()),
          position: convertLatLng(data[i]['position']),
          icon: markerIconGen,
          infoWindow: gmaps.InfoWindow(title: 'Animated Duck Marker'),
          onTap: () {
            _showDuckMarkerBottomSheet();
            },
          );
          print('induck');
        case 'buildings':
          markerIconGen = _buildingsFrames.isNotEmpty ? await _getScaledIcon(buildingsnewpath, _zoomLevel) : BitmapDescriptor.defaultMarker;
          _markers[i.toString()] = gmaps.Marker(
          markerId: gmaps.MarkerId(data[i]['id'].toString()),
          position: convertLatLng(data[i]['position']),
          icon: markerIconGen,
          infoWindow: gmaps.InfoWindow(title: 'Animated Duck Marker'),
          onTap: () {
            _showDuckMarkerBottomSheet();
            },
          );
          print('inbuildings');
      }
      setState(() {});
    }
    print('Markers created');
  }

  //for static
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
        // markerIcon = await _getScaledIcon(data[i]['assetPath'], _zoomLevel);
        // _markers[i.toString()] = gmaps.Marker(
        //   markerId: gmaps.MarkerId(i.toString()),
        //   position: convertLatLng(data[i]['position']),
        //   icon: markerIcon,
        //   infoWindow: gmaps.InfoWindow(title: 'This is a marker'),
        // );
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
                polygons: _polygons.toSet(),
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
