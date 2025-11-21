import 'package:flutter/material.dart';
import 'package:social_media_app/models/bio_model.dart';
import 'package:social_media_app/services/bio_service.dart';

class BioProvider extends ChangeNotifier {
  BioModel? bioModel;

  Future<void> editBio({required String bio, required int userId}) async {
    bioModel = await BioService.editBio(bio: bio, userId: userId);

    notifyListeners();
  }
}
