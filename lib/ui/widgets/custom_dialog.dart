
import 'package:flutter/material.dart';

customDialog(context,heading,dateTime,dialogImage,description){
  return showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Column(
                                            children: [
                                              Text(
                                                  heading,
                                                  style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.deepOrangeAccent),
                                                  maxLines: 2,
                                                  textAlign: TextAlign.justify),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            width: 70,
                                            child: IconButton(
                                                onPressed: () {
                                                   Navigator.pop(context);
                                                },
                                                icon: Icon(Icons.close)))
                                      ],
                                    ),
                                    Divider(),
                                    Text(dateTime),
                                    Image.asset(
                                      'assets/icons/logo.png',
                                      height: 250,
                                    ),
                                    Text(
                                        description),
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('OK')))
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
}