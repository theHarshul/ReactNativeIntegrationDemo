'use strict';

import React from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  Navigator,
  TouchableOpacity,
  NativeModules,
  TextInput,
} from 'react-native';

const { RNStuffManager } = NativeModules;

class RNStuff extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      identifier: props.identifier,
      currentRating: props.currentRating,
      text:'placheolder'
    }
  }

    _renderScene(route, navigator) {
        return (
          <View style={styles.content}>
            <Text style={styles.welcome}>We're live from React Native!!!</Text>
              <TextInput
               style={{height: 40, fontSize : 20, borderColor: 'gray', borderWidth: 1, textAlign: 'center'}}
               value={this.state.identifier}
               onChangeText={(identifier) => this.setState({identifier})}
             />
          </View>
        );
      }

_renderNavTitle(route, navigator, index, navState) {
  return <Text style={styles.navBarTitleText}>{route.title}</Text>;
}

_renderNavLeftItem(route, navigator, index, navState) {
  return (
    <TouchableOpacity
      onPress={() => {
        RNStuffManager.dismissPresentedViewController(this.props.rootTag);
      }}
      style={styles.navBarLeftButton}>
      <Text style={[styles.navBarText, styles.navBarButtonText]}>
        Cancel
      </Text>
    </TouchableOpacity>
  );
}

_renderNavRightItem(route, navigator, index, navState) {
  return (
    <TouchableOpacity
      onPress={() => {
          RNStuffManager.save(
            this.props.rootTag,
            this.state.identifier,
            this.state.identifier
          );
        }}
      style={styles.navBarRightButton}>
      <Text style={[styles.navBarText, styles.navBarButtonText]}>
        Save
      </Text>
    </TouchableOpacity>
  );
}

render() {
  return (
    <Navigator
      debugOverlay={false}
      style={styles.container}
      initialRoute={{title: 'Menu'}}
      renderScene={this._renderScene.bind(this)}
      navigationBar={
        <Navigator.NavigationBar
          routeMapper={{
            LeftButton: this._renderNavLeftItem.bind(this),
            RightButton: this._renderNavRightItem.bind(this),
            Title: this._renderNavTitle.bind(this),
          }}
          style={styles.navBar}
        />
      }
    />
  );
}

}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  content: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  welcome: {
    fontSize: 30,
    color: 'black',
  },
  navBar: {
    backgroundColor: 'red',
  },
  navBarText: {
    fontSize: 16,
    marginVertical: 10,
  },
  navBarTitleText: {
    color: 'white',
    fontWeight: '500',
    marginVertical: 9,
  },
  navBarLeftButton: {
    paddingLeft: 10,
  },
  navBarRightButton: {
    paddingRight: 10,
  },
  navBarButtonText: {
    color: 'white',
  },
});
module.exports = RNStuff;
