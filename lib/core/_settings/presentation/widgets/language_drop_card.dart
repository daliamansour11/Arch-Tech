import 'package:archtech/config/locale/locale.dart';
import 'package:archtech/core/_constants/images_constants.dart';
import 'package:archtech/core/_settings/presentation/bloc/locale_cubit.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageDropCard extends StatelessWidget {
  const LanguageDropCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorManger.greyDivider),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.all(16),
        child: Column(
          children: [
            const Row(
              spacing: 8,
              children: [
                Icon(
                  Icons.keyboard_arrow_up_sharp,
                  color: Colors.grey,
                ),
                TextManger(
                  'ChooseLanguage',
                  style: TextStyleManager.bodyMediumGrey,
                )
              ],
            ),
            const FractionallySizedBox(
              widthFactor: 1.1,
              child: Divider(
                thickness: 1,
                color: ColorManger.greyDivider,
              ),
            ),
            ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                      height: 8,
                    ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: AppLocalesUtils.getAppLocales.length,
                itemBuilder: (context, index) {
                  final locale = AppLocalesUtils.getAppLocales[index];
                  return InkWell(
                    onTap: () {
                      context.read<LocaleCubit>().changeLocale(locale);
                    },
                    borderRadius: BorderRadius.circular(8),
                    overlayColor:
                        const WidgetStatePropertyAll(ColorManger.cardFill),
                    child: BlocBuilder<LocaleCubit, AppLocale>(
                      builder: (context, state) {
                        final bool isSelected = state.code == locale.code;
                        return DecoratedBox(
                          decoration: isSelected
                              ? const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  color: ColorManger.cardFill,
                                )
                              : const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.symmetric(
                                horizontal: 12, vertical: 16),
                            child: Row(spacing: 16, children: [
                              if (index <
                                  AppLocalesUtils.getAppLocales.length - 1)
                                CountryFlag.fromLanguageCode(
                                  locale.code,
                                  height: 24,
                                  width: 40,
                                ),
                              if (index ==
                                  AppLocalesUtils.getAppLocales.length - 1)
                                const SizedBox(
                                  height: 24,
                                  width: 40,
                                  child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  ImagesConstantsAsset
                                                      .china)))),
                                ),
                              TextManger(
                                locale.name,
                                style: TextStyleManager.bodyMediumGrey,
                              )
                            ]),
                          ),
                        );
                      },
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
