import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ConnectedPage extends StatefulWidget {
  @override
  _ConnectedPageState createState() => _ConnectedPageState();
}

class _ConnectedPageState extends State<ConnectedPage> {
  final LatLng targetLocation = LatLng(6.9271, 79.8612);

  Color _videocamButtonColor = Colors.grey.shade300;
  Color _micButtonColor = Colors.grey.shade300;

  void _toggleVideocamButtonColor() {
    setState(() {
      _videocamButtonColor = _videocamButtonColor == Colors.grey.shade300
          ? Colors.lightGreen.shade300
          : Colors.grey.shade300;
    });
  }

  void _toggleMicButtonColor() {
    setState(() {
      _micButtonColor = _micButtonColor == Colors.grey.shade300
          ? Colors.lightGreen.shade300
          : Colors.grey.shade300;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
            onSelected: (String result) {
              // Handle status change
              print("Status changed to $result");
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Available',
                child: Text('Available'),
              ),
              const PopupMenuItem<String>(
                value: 'Away',
                child: Text('Away'),
              ),
              const PopupMenuItem<String>(
                value: 'Personal',
                child: Text('Personal'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: targetLocation,
                zoom: 16.0,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('targetLocation'),
                  position: targetLocation,
                  icon: BitmapDescriptor.defaultMarker,
                ),
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Colors.black),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Connected',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.circle, color: Colors.green),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'ETA - 4 min',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: _toggleVideocamButtonColor,
                          child: Container(
                            decoration: BoxDecoration(
                              color: _videocamButtonColor,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              iconSize: 30.0, // Increase icon size
                              icon: Icon(Icons.videocam),
                              onPressed: () {
                                // Add your onPressed logic here
                              },
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: _toggleMicButtonColor,
                          child: Container(
                            decoration: BoxDecoration(
                              color: _micButtonColor,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              iconSize: 30.0, // Increase icon size
                              icon: Icon(Icons.mic),
                              onPressed: () {
                                // Add your onPressed logic here
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
