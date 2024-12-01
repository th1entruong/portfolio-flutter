import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_dev/consts/data.dart';
import 'package:portfolio_dev/providers/current_state.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CurrentState currentState =
        Provider.of<CurrentState>(context, listen: false);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  colors: [Colors.blue, Colors.black]),
            ),
          ),
          SvgPicture.asset(
            "assets/images/BG_Blue.svg",
            height: size.height,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height - 100,
                    child: Consumer<CurrentState>(builder: (context, _, __) {
                      return DeviceFrame(
                        device: currentState.currenDevice,
                        screen: Container(
                          color: Colors.red,
                          child: const Center(
                            child: Text(
                              "Dinh Thien",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(
                    devices.length,
                    (index) => Selector<CurrentState, DeviceInfo>(
                        selector: (context, provider) => provider.currenDevice,
                        builder: (context, _, __) {
                          return CustomButton(
                            height: 40,
                            width: 40,
                            borderRadius: 100,
                            backgroundColor: Colors.black87,
                            onPressed: () {
                              currentState
                                  .cahngeSelectedDevice(devices[index].device);
                            },
                            animate: true,
                            isThreeD: true,
                            pressed: currentState.currenDevice ==
                                    devices[index].device
                                ? Pressed.pressed
                                : Pressed.notPressed,
                            shadowColor: Colors.white54,
                            child: Center(
                              child: Icon(
                                devices[index].data,
                                color: Colors.white70,
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
