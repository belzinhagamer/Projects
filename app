import React, { useRef, useState } from 'react';
import { View, Button, StyleSheet, Alert } from 'react-native';
import { RNCamera } from 'react-native-camera';
import Share from 'react-native-share';
import RNFS from 'react-native-fs';

const CameraApp = () => {
  const cameraRef = useRef(null);
  const [recording, setRecording] = useState(false);

  const startRecording = async () => {
    if (cameraRef.current) {
      try {
        setRecording(true);
        const { uri } = await cameraRef.current.recordAsync();
        setRecording(false);
        Alert.alert('Gravação concluída', 'O vídeo foi gravado com sucesso!');
        saveAndShareVideo(uri);
      } catch (error) {
        console.error('Erro ao gravar vídeo:', error);
        setRecording(false);
      }
    }
  };

  const stopRecording = () => {
    if (cameraRef.current && recording) {
      cameraRef.current.stopRecording();
    }
  };

  const saveAndShareVideo = async (uri) => {
    try {
      const newPath = `${RNFS.DocumentDirectoryPath}/video.mp4`;
      await RNFS.moveFile(uri, newPath);
      Alert.alert('Vídeo salvo', 'O vídeo foi salvo no álbum!');
      Share.open({ url: `file://${newPath}` });
    } catch (error) {
      console.error('Erro ao salvar ou compartilhar vídeo:', error);
    }
  };

  return (
    <View style={styles.container}>
      <RNCamera
        ref={cameraRef}
        style={styles.preview}
        type={RNCamera.Constants.Type.back}
        captureAudio={true}
      />
      <View style={styles.buttonContainer}>
        {recording ? (
          <Button title="Parar" onPress={stopRecording} color="red" />
        ) : (
          <Button title="Gravar" onPress={startRecording} />
        )}
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  preview: {
    flex: 1,
    justifyContent: 'flex-end',
    alignItems: 'center',
    width: '100%',
  },
  buttonContainer: {
    flexDirection: 'row',
    justifyContent: 'center',
    margin: 20,
  },
});

export default CameraApp;
