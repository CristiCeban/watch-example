import { Alert, Button, StyleSheet, Text, TextInput, View } from "react-native";
import {
  getIsWatchAppInstalled,
  getReachability,
  sendMessage,
  transferUserInfo,
} from "react-native-watch-connectivity";

import { StatusBar } from "expo-status-bar";
import { useState } from "react";

async function sendMessageToWatch(message: Record<string, string>) {
  const isInstalled = await getIsWatchAppInstalled();
  if (!isInstalled) {
    Alert.alert(
      "Watch App Not Installed",
      "Please install the watch app to use this feature"
    );
    return;
  }

  const reachable = await getReachability();
  if (reachable) {
    sendMessage(message);
    return;
  }

  transferUserInfo(message);
}

export default function App() {
  const [text, onChangeText] = useState("");

  return (
    <View style={styles.container}>
      <Text>Open up App.tsx to start working on your app!</Text>
      <TextInput
        style={styles.input}
        onChangeText={onChangeText}
        value={text}
        placeholder="type your text here to send to watch"
      />
      <Button
        title="Send to Watch"
        onPress={() => sendMessageToWatch({ text })}
      />
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
  input: {
    height: 40,
    margin: 12,
    borderWidth: 1,
    padding: 10,
  },
});
