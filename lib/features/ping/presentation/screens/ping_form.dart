import 'package:flutter/material.dart';
import 'package:trace_in_mobile_app/core/exceptions/network/connection_timed_out_exception.dart';

import '../../../../core/exceptions/network/no_connection_exception.dart';
import '../../../../core/extensions/string_validators/string_validators_extension.dart';
import '../../../../core/utils/text_field_validators.dart';
import '../../../../dependency_inversion.dart';
import '../../../../presentation/widgets/button/button_widget.dart';
import '../../../../presentation/widgets/form/custom_text_field_widget.dart';
import '../../../../presentation/widgets/functions/show_snackbar.dart';
import '../../../../presentation/widgets/info_card_widget.dart';
import '../../domain/entities/ping_info.dart';
import '../../domain/usescases/get_ping_info_usescase.dart';
import '../../domain/usescases/params/get_ping_info_params.dart';
import 'ping_info_results_table.dart';

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

  late final GlobalKey<FormState> _formKey;

  late final List<TextEditingController> _fieldsControllers;

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey();

    /// Init TextEdditingController
    _hostController = TextEditingController();
    _numberOfPaquetsController = TextEditingController();
    _ttlController = TextEditingController();
    _packetSizeController = TextEditingController();
    _timeOutController = TextEditingController();

    _fieldsControllers = [];

    _fieldsControllers.addAll([
      _hostController,
      _numberOfPaquetsController,
      _ttlController,
      _packetSizeController,
      _timeOutController
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
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
                            "Le ping permet de déterminer l'état du réseau et de divers hôtes étrangers ou simplement permet de verifier l'existence d'une machine sur un reseau"),
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
    );
  }

  List<Widget> _buildListItems() {
    return [
      CustomTextFieldWidget(
          validator: TextFieldValidators.isHost,
          textEditingController: _hostController,
          label: 'Adresse IP/ Host',
          placeholder: 'Ex: google.com, 172.177.44.5'),
      const SizedBox(
        height: 15,
      ),
      _buildThreeTextField(),
      const SizedBox(
        height: 15,
      ),
      CustomTextFieldWidget(
          validator: TextFieldValidators.isNumber,
          textInputType: TextInputType.number,
          textEditingController: _timeOutController,
          label: 'Temps mort',
          placeholder: 'Temps mort en ms'),
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
            willLoad: false,
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
            willLoad: true,
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
              validator: TextFieldValidators.isNumber,
              textInputType: TextInputType.number,
              textEditingController: _numberOfPaquetsController,
              label: 'N°. packets',
              placeholder: 'ex: 15, 25'),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          flex: 1,
          child: CustomTextFieldWidget(
              validator: TextFieldValidators.isNumber,
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
              validator: TextFieldValidators.isNumber,
              textInputType: TextInputType.number,
              textEditingController: _packetSizeController,
              label: 'Taille Paquet',
              placeholder: 'ex: 28'),
        ),
      ],
    );
  }

  void _handleReset() {
    _formKey.currentState!.reset();
  }

  void _handleTriggerPing() async {
    if (_formKey.currentState!.validate()) {
      // Retrieve values
      final _params = GetPingInfoParams(
          host: _hostController.text,
          packetSize: int.tryParse(_packetSizeController.text) ?? 40,
          packetsNu: int.tryParse(_numberOfPaquetsController.text) ?? 5,
          timeOut: int.tryParse(_timeOutController.text) ?? 2000,
          ttl: int.tryParse(_ttlController.text) ?? 21);

      final _result = (await getIt.get<GetPingInfoUsescase>().trigger(_params))
          .fold((error) => error, (pingInfos) => pingInfos);
      debugPrint(_result.toString());
      if (_result is List<PingInfo>) {
        showModalBottomSheet(
            context: context,
            builder: (_) => PingInfoResultsTable(
                  hostEntered: _hostController.text.isIpAdress() != true
                      ? _hostController.text
                      : null,
                  pingInfos: _result,
                ));
      } else if (_result is NoConnectionException) {
        showNetworkErrorSnackBar(context, noConnectionMessage);
      } else if (_result is ConnectionTimedOutException) {
        showNetworkErrorSnackBar(context, connectionTimedOutMessage);
      } else {
        showNetworkErrorSnackBar(context, unknowMessage);
      }
    }
  }
}
