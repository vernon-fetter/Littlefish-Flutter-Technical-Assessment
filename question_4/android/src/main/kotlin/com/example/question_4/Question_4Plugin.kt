package com.example.question_4

import android.content.Context
import android.net.ConnectivityManager
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class Question_4Plugin : FlutterPlugin, MethodCallHandler, EventChannel.StreamHandler {
    private lateinit var applicationContext: Context
    private lateinit var connectivityManager: ConnectivityManager
    private lateinit var eventChannel: EventChannel

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        applicationContext = flutterPluginBinding.applicationContext
        connectivityManager = applicationContext.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager

        val methodChannel = MethodChannel(flutterPluginBinding.binaryMessenger, "question_4")
        methodChannel.setMethodCallHandler(this)

        eventChannel = EventChannel(flutterPluginBinding.binaryMessenger, "question_4/connectivity_events")
        eventChannel.setStreamHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "checkConnectivity") {
            val isConnected = checkConnectivity()
            result.success(isConnected)
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {}

    private fun checkConnectivity(): Boolean {
        val networkInfo = connectivityManager.activeNetworkInfo
        return networkInfo != null && networkInfo.isConnected
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        val connectivityChangeListener = ConnectivityChangeListener(events)
        applicationContext.registerReceiver(connectivityChangeListener, ConnectivityChangeIntentFilter())
    }

    override fun onCancel(arguments: Any?) {}

    private inner class ConnectivityChangeListener(private val events: EventChannel.EventSink?) :
        android.content.BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: android.content.Intent?) {
            val isConnected = checkConnectivity()
            events?.success(isConnected)
        }
    }
}

private fun ConnectivityChangeIntentFilter(): android.content.IntentFilter {
    val intentFilter = android.content.IntentFilter()
    intentFilter.addAction(android.net.ConnectivityManager.CONNECTIVITY_ACTION)
    return intentFilter
}
