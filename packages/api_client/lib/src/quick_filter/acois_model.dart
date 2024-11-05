import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AcoisModel extends Equatable {
  const AcoisModel({
    required this.image,
    required this.mode,
    this.rotation,
  });

  final Image image;
  final String mode;
  final double? rotation;

  @override
  List<Object?> get props => <Object?>[
    image,
    mode,
    rotation,
  ];
}
