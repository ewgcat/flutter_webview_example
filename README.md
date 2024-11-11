# flutter_webview_example

## solved displays only the webview background and no content on Android[https://github.com/flutter/flutter/issues/155137]

在WebViewClientHostApiImpl的类WebViewClientHostApiImp类中添加

```
@Override
public void onReceivedSslError(WebView view, SslErrorHandler handler, SslError error) {
  if(view!=null){
    Context context = view.getContext();
    new AlertDialog.Builder(context)
            //此处展示弹窗，弹窗样式自定义，提示文案不要雷同，由产品提供
            .setMessage("您访问的网站证书无效或过期。您想继续访问吗？")
            .setPositiveButton("继续", new DialogInterface.OnClickListener() {
              @Override
              public void onClick(DialogInterface dialogInterface, int i) {
                handler.proceed();
              }
            })
            .setNegativeButton("取消", new DialogInterface.OnClickListener() {
              @Override
              public void onClick(DialogInterface dialogInterface, int i) {
                handler.cancel();
              }
            })
            .create()
            .show();
  }
}
```

