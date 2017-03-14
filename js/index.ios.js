'use strict';

import {AppRegistry} from 'react-native';
import Navigator from 'native-navigation';

const RNStuff = require('./RNStuff');

Navigator.registerScreen('RNStuff', () => RNStuff);
Navigator.registerScreen(
  'SharedElementToScreen',
  () => require('./screens/SharedElementToScreen')
);
Navigator.registerScreen(
  'SharedElementFromScreen',
  () => require('./screens/SharedElementFromScreen')
);
Navigator.registerScreen(
  'ScreenOne',
  () => require('./screens/NavigationExampleScreen'),
  {
    initialConfig: {
      // title: 'FooBar',
    },
  }
);

Navigator.registerScreen(
  'TabScreen',
  () => require('./screens/TabScreen'),
  {
    mode: 'tabs',
  }
);

// AppRegistry.registerComponent('RNStuff', () => RNStuff);
