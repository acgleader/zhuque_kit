package me.zhuque.moba.zhuque_kit;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.ActivityResultListener;
import me.zhuque.sdktool.SDKPlugin;

/**
 * ZhuqueKitPlugin
 */
public class ZhuqueKitPlugin implements FlutterPlugin, ActivityAware, ActivityResultListener, MethodCallHandler {
//    public static final String TAG = "YSDK:";

//    private static class ZhuqueScene {
//        static final int SCENE_QQ = 0;
//        static final int SCENE_QZONE = 1;
//    }
//
//    private static class ZhuqueRetCode {
//        // 网络请求成功发送至服务器，并且服务器返回数据格式正确
//        // 这里包括所请求业务操作失败的情况，例如没有授权等原因导致
//        static final int RET_SUCCESS = 0;
//        // 网络异常，或服务器返回的数据格式不正确导致无法解析
//        static final int RET_FAILED = 1;
//        static final int RET_COMMON = -1;
//        static final int RET_USERCANCEL = -2;
//    }

    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private MethodChannel channel;
    private Context applicationContext;
    private ActivityPluginBinding activityPluginBinding;

    private Zhuque tencent;

    private boolean antiAddictLogEnable;

    // --- FlutterPlugin

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        channel = new MethodChannel(binding.getBinaryMessenger(), "me.zhuque.moba/zhuque_kit");
        channel.setMethodCallHandler(this);
        applicationContext = binding.getApplicationContext();
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
        channel = null;
        applicationContext = null;
    }

    // --- ActivityAware

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        activityPluginBinding = binding;
        activityPluginBinding.addActivityResultListener(this);
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity();
    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
        onAttachedToActivity(binding);
    }

    @Override
    public void onDetachedFromActivity() {
        activityPluginBinding.removeActivityResultListener(this);
        activityPluginBinding = null;
    }

    // --- ActivityResultListener

    @Override
    public boolean onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
//        switch (requestCode) {
//            case Constants.REQUEST_LOGIN:
//                return Zhuque.onActivityResultData(requestCode, resultCode, data, loginListener);
//            case Constants.REQUEST_QQ_SHARE:
//            case Constants.REQUEST_QZONE_SHARE:
//                return Zhuque.onActivityResultData(requestCode, resultCode, data, shareListener);
//            default:
//                break;
//        }
        return false;
    }

    // --- MethodCallHandler

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        // AndroidUserSDK
        if ("login".equals(call.method)) {
            SDKPlugin.getInstance().login();
            result.success(null);
        } else if ("loginWithoutRealnameAuth".equals(call.method)) {
            SDKPlugin.getInstance().loginWithoutRealnameAuth();
            result.success(null);
        } else if ("logout".equals(call.method)) {
            SDKPlugin.getInstance().logout();
            result.success(null);
        } else if ("getChannelID".equals(call.method)) {
            int channelId = SDKPlugin.getInstance().getChannelID();
            result.success(channelId);
        } else if ("getUid".equals(call.method)) {
            String uid = SDKPlugin.getInstance().getUid();
            result.success(uid);
        } else if ("showAgreementWithLicence".equals(call.method)) {
            SDKPlugin.getInstance().showAgreementWithLicence();
            result.success(null);
        } else if ("showAgreementWithPrivacy".equals(call.method)) {
            SDKPlugin.getInstance().showAgreementWithPrivacy();
            result.success(null);
        } else {
            result.notImplemented();
        }
    }
}
