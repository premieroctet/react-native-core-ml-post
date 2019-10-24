import React, {useState} from 'react';
import {
	SafeAreaView,
	ScrollView,
	Text,
	NativeModules,
	Button,
} from 'react-native';
import ImagePicker from 'react-native-image-picker';

const App = () => {
	const [label, setLabel] = useState();

	const handleOnPress = () => {
		ImagePicker.showImagePicker({}, async response => {
			if (!response.didCancel) {
				const detectedLabel = await NativeModules.Detector.detect(response.uri);
				setLabel(detectedLabel);
			}
		});
	};

	return (
		<SafeAreaView>
			<ScrollView style={{padding: 20}}>
				<Button title="Pick" onPress={handleOnPress} />
				<Text>{label}</Text>
			</ScrollView>
		</SafeAreaView>
	);
};

export default App;
