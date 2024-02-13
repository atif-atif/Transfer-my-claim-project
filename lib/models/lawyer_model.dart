import 'package:flutter/material.dart';
import 'package:lawyer/utils/asset_path.dart';

class LawyerModel {
  final String image;
  String? title;
  final String? location;
  final String? winRatio;
  GestureTapCallback? onTap;
  // GestureTapCallback? onRemove;

  LawyerModel({
    required this.image,
    this.title = 'Shah Rasool',
    this.location = "Burewala",
    this.winRatio = "71%",
    this.onTap,
    // this.onRemove,
  });
}

List<LawyerModel> lawyerContent = [
  LawyerModel(
    image: AssetPath.doctor,
    onTap: () {},
    title: 'Shah Rasool',
    location: 'Burewala',
    winRatio: '71%',
  ),
  LawyerModel(
    image: AssetPath.doctor,
    onTap: () {},
    title: 'Kamran',
    location: 'lahore',
    winRatio: '71%',
  ),
  LawyerModel(
    image: AssetPath.doctor,
    onTap: () {},
    title: 'Shah Rasool',
    location: 'vehari',
    winRatio: '71%',
  ),
  LawyerModel(
    image: AssetPath.doctor,
    onTap: () {},
    title: 'Shah Rasool',
    location: 'islamabad',
    winRatio: '71%',
  ),
  LawyerModel(
    image: AssetPath.doctor,
    onTap: () {},
    title: 'Shah Rasool',
    location: 'Burewala',
    winRatio: '71%',
  ),
];
