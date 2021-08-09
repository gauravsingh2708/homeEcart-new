import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homeecart/app/theme/theme.dart';

class Rewards extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimens.sixTeen, vertical: Dimens.fifty),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Refer a Friend', style: Styles.boldBlack16.copyWith(
                  color: ColorsValue.primaryColor),),
              Dimens.boxHeight5,
              Text('And you can both save 25', style: Styles.black12,),
              Dimens.boxHeight15,
              Row(
                children: [
                  Icon(Icons.error_outline, size: Dimens.twenty,
                    color: ColorsValue.primaryColor,),
                  Text('  How it works', style: Styles.black18.copyWith(
                      color: ColorsValue.primaryColor,
                      fontSize: Dimens.fourteen),)
                ],
              ),
              _buildStepper(StepperType.vertical)

            ],
          ),
        ),
      );

  int currentStep = 0;

  CupertinoStepper _buildStepper(StepperType type) {
    final canCancel = currentStep > 0;
    final canContinue = currentStep < 3;
    return CupertinoStepper(
      type: type,
      currentStep: currentStep,
      // onStepTapped: (step) => setState(() => currentStep = step),
      // onStepCancel: canCancel ? () => setState(() => --currentStep) : null,
      // onStepContinue: canContinue ? () => setState(() => ++currentStep) : null,
      steps: [
          _buildStep(
            title: const Text('Step'),
            isActive: true,
            state: StepState.indexed,
          ),
        _buildStep(
          title: const Text('Step'),
          isActive: true,
          state: StepState.indexed,
        ),
        _buildStep(
          title: const Text('Step'),
          isActive: true,
          state: StepState.indexed,
        ),    _buildStep(
          title: const Text('Step'),
          isActive: true,
          state: StepState.indexed,
        ),


      ],
    );
  }

  Step _buildStep({
    @required Widget title,
    StepState state = StepState.indexed,
    bool isActive = false,
  }) => Step(
        title: title,
        subtitle: const Text('Subtitle'),
        state: state,
        isActive: isActive,
        content:  Container()
      );
}
