package com.example.echoforge

import android.content.ContentValues
import android.os.Environment
import android.provider.MediaStore
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val channelName = "echoforge/storage"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            channelName
        ).setMethodCallHandler { call, result ->

            when (call.method) {

                "saveAudioToDownload" -> {

                    val fileName =
                        call.argument<String>("fileName")

                    val audioBytes =
                        call.argument<ByteArray>("audioBytes")

                    if (fileName.isNullOrBlank() ||
                        audioBytes == null ||
                        audioBytes.isEmpty()
                    ) {
                        result.error(
                            "INVALID_ARGUMENT",
                            "File name or audio data is missing.",
                            null
                        )
                        return@setMethodCallHandler
                    }

                    try {
                        val values = ContentValues().apply {

                            put(
                                MediaStore.Downloads.DISPLAY_NAME,
                                fileName
                            )

                            put(
                                MediaStore.Downloads.MIME_TYPE,
                                "audio/wav"
                            )

                            put(
                                MediaStore.Downloads.RELATIVE_PATH,
                                Environment.DIRECTORY_DOWNLOADS +
                                    "/EchoForge"
                            )

                            put(
                                MediaStore.Downloads.IS_PENDING,
                                1
                            )
                        }

                        val resolver = contentResolver

                        val uri = resolver.insert(
                            MediaStore.Downloads.EXTERNAL_CONTENT_URI,
                            values
                        )

                        if (uri == null) {
                            result.error(
                                "SAVE_FAILED",
                                "Could not create the audio file.",
                                null
                            )
                            return@setMethodCallHandler
                        }

                        resolver.openOutputStream(uri)?.use { output ->
                            output.write(audioBytes)
                            output.flush()
                        }

                        val completedValues = ContentValues().apply {
                            put(
                                MediaStore.Downloads.IS_PENDING,
                                0
                            )
                        }

                        resolver.update(
                            uri,
                            completedValues,
                            null,
                            null
                        )

                        result.success(uri.toString())

                    } catch (error: Exception) {

                        result.error(
                            "SAVE_FAILED",
                            error.message,
                            null
                        )
                    }
                }

                else -> {
                    result.notImplemented()
                }
            }
        }
    }
}
