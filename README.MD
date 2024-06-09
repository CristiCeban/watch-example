# Expo watch integration

This is a demo application for testing the integration of the https://github.com/CristiCeban/react-native-watch-connectivity expo plugin.
It uses the concept of expo [plugin](https://docs.expo.dev/config-plugins/plugins-and-mods/). At step [prebuild](https://docs.expo.dev/workflow/prebuild/) `npx expo prebuild` a native folder is generated based on the expo configuration.
React-native-watch-connectivity registers a build plugin and dynamically generates all the xcode infrastructure (watch target, build configuration, etc.). You can put watch files in a `watch` folder, and it will copy these files and link these files to the `watch` target. It only supports `.watchkitapp` for now, no complications app.

run `yarn test-plugin` to test it
This will run internally some commands, including `yarn prebuild` -> and it will generate the `ios` and `android` folder. Open the `ios` folder in xcode and build the application. If you have a paired Apple Watch, this app will automatically install on your watch/show up in the watch app on your iPhone.
This repo includes a very simple app that will send text from the iPhone to the watch and display it.

You can see small example in `watch_integration.mp4`
