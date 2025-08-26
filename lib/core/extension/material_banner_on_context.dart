import 'package:archtech/core/utils/text_manager.dart';
import 'package:flutter/material.dart';

extension ShowMessenger on BuildContext {
  dynamic clearMaterialBanners() =>
      ScaffoldMessenger.of(this).clearMaterialBanners();
  hideCurrentMaterialBanner() =>
      ScaffoldMessenger.of(this).hideCurrentMaterialBanner();
  ScaffoldFeatureController<MaterialBanner, MaterialBannerClosedReason>
      showMaterial(MaterialBanner materialBanner) =>
          ScaffoldMessenger.of(this).showMaterialBanner(materialBanner);
  ScaffoldFeatureController<MaterialBanner, MaterialBannerClosedReason>
      showSessionExpiredMaterialBanner() =>
          ScaffoldMessenger.of(this).showMaterialBanner(_sessionExpired(this));
}

MaterialBanner _sessionExpired(BuildContext context) => const MaterialBanner(
      content: Padding(
        padding: EdgeInsetsDirectional.all(16),
        child: Row(
          spacing: 16,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.symmetric(vertical: 8),
              child: Icon(
                Icons.warning,
              ),
            ),
            Flexible(
              child: TextManger(
                'Your session has been expired, please login again',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      leadingPadding: EdgeInsetsDirectional.all(0),
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      padding: EdgeInsetsDirectional.all(0),
      margin: EdgeInsetsDirectional.all(0),
      actions: [SizedBox.shrink()],
      backgroundColor: Colors.white,
      elevation: 1,
    );
