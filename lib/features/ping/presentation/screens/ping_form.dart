import 'package:flutter/material.dart';

import '../../../../core/assets/app_assets.dart';
import '../../../../presentation/widgets/button/button_widget.dart';
import '../../../../presentation/widgets/form/custom_text_field_widget.dart';
import '../../../../presentation/widgets/info_card_widget.dart';
import '../../../../presentation/widgets/navigation_bar/navigation_bar_widget.dart';

class PingForm extends StatefulWidget {
  const PingForm({Key? key}) : super(key: key);

  @override
  State<PingForm> createState() => _PingFormState();
}

class _PingFormState extends State<PingForm> {
  late final TextEditingController _hostController;
  late final TextEditingController _numberOfPaquetsController;
  late final TextEditingController _ttlController;
  late final TextEditingController _packetSizeController;
  late final TextEditingController _timeOutController;

  late final GlobalKey _formKey;

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();

    /// Init TextEdditingController
    _hostController = TextEditingController();
    _numberOfPaquetsController = TextEditingController();
    _ttlController = TextEditingController();
    _packetSizeController = TextEditingController();
    _timeOutController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      // bottomNavigationBar: BottomNavigationBar(items: const [
      //   BottomNavigationBarItem(
      //       label: '', icon: Image(image: AssetImage(AppAssets.pingImage))),
      //   BottomNavigationBarItem(
      //       label: '',
      //       icon: Image(image: AssetImage(AppAssets.tracerouteImage)))
      // ]),
      body: SafeArea(
        child: Row(
          children: [
            const NavigationBarWidget(),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Form(
                  key: _formKey,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Ping',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const InfoCardWidget(
                              label:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit'),
                          const SizedBox(
                            height: 25,
                          ),
                          ..._buildListItems()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildListItems() {
    return [
      CustomTextFieldWidget(
          textEditingController: _hostController,
          label: 'Adresse IP/ Host',
          placeholder: 'Lorem ipsum dolor sit amet elit'),
      const SizedBox(
        height: 15,
      ),
      _buildThreeTextField(),
      const SizedBox(
        height: 15,
      ),
      CustomTextFieldWidget(
          textInputType: TextInputType.number,
          textEditingController: _timeOutController,
          label: 'Temps mort',
          placeholder: 'Lorem ipsum dolor sit amet'),
      const SizedBox(
        height: 25,
      ),
      _buildActions()
    ];
  }

  Row _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ButtonWidget(
            function: _handleReset,
            label: 'Reinitialiser',
            buttonType: ButtonType.grey,
          ),
        ),
        const SizedBox(
          width: 7,
        ),
        Expanded(
          child: ButtonWidget(
            function: _handleTriggerPing,
            label: 'Effectuer',
            buttonType: ButtonType.blue,
          ),
        )
      ],
    );
  }

  Row _buildThreeTextField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: CustomTextFieldWidget(
              textInputType: TextInputType.number,
              textEditingController: _numberOfPaquetsController,
              label: 'N°. packets',
              placeholder: 'Lorem ipsum'),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          flex: 1,
          child: CustomTextFieldWidget(
              textInputType: TextInputType.number,
              textEditingController: _ttlController,
              label: 'TTL',
              placeholder: 'ex: 21'),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          flex: 2,
          child: CustomTextFieldWidget(
              textInputType: TextInputType.number,
              textEditingController: _packetSizeController,
              label: 'N°. packets',
              placeholder: 'ex: 28'),
        ),
      ],
    );
  }

  void _handleReset() {
    //TODO
  }
  void _handleTriggerPing() {
    //TODO
  }
}
