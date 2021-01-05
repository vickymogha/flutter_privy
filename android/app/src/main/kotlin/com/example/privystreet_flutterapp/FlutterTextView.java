package com.example.privystreet_flutterapp;

import android.content.Context;
import android.graphics.Color;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;

public class FlutterTextView implements PlatformView, MethodChannel.MethodCallHandler {


    private final TextView textView;
    private final MethodChannel methodChannel;
    LinearLayout layout;

    FlutterTextView(Context context, BinaryMessenger messenger, int id) {
        layout = new LinearLayout(context);
        layout.setLayoutParams(new ViewGroup.LayoutParams(400, ViewGroup.LayoutParams.WRAP_CONTENT));
        textView = new TextView(context);
        textView.setBackgroundColor(Color.GREEN);
        textView.setLayoutParams(new ViewGroup.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        layout.addView(textView);
        methodChannel = new MethodChannel(messenger, "samples.flutter.dev/textview_" + id);
        methodChannel.setMethodCallHandler(this);
    }

    @Override
    public View getView() {
        return layout;
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        switch (methodCall.method) {
            case "setText":
                setText(methodCall, result);
                break;
            default:
                result.notImplemented();
        }

    }

    private void setText(MethodCall methodCall,  MethodChannel.Result result) {
        String text = (String) methodCall.arguments;
        textView.setText(text);
        textView.measure(View.MeasureSpec.makeMeasureSpec(400,
                View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(0,
                        View.MeasureSpec.UNSPECIFIED));
        result.success(textView.getMeasuredHeight());
    }



    @Override
    public void dispose() {}
}
