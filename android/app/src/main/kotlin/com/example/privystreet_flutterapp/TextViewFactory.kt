package com.example.privystreet_flutterapp

import android.content.Context
import android.widget.TextView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MessageCodec
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class TextViewFactory(var message: BinaryMessenger?) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {

    override fun create(p0: Context?, p1: Int, p2: Any?): PlatformView {
       return FlutterTextView(p0,message,p1)
    }

}