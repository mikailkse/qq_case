import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/components/textformfield/custom_text_form_field.dart';

class SearchView extends StatelessWidget {
  static const routeName = 'searchView';
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: context.paddingLow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTextFormField(),
                const SizedBox(height: 20),
                GridView.builder(
                  itemCount: 20,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3 / 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) => const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
