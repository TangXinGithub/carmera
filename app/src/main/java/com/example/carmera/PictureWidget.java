package com.example.carmera;

import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProvider;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Environment;
import android.support.v4.content.FileProvider;
import android.widget.RemoteViews;

import java.io.File;
import java.io.FileInputStream;

/**
 * Implementation of App Widget functionality.
 */
public class PictureWidget extends AppWidgetProvider {

    static void updateAppWidget(Context context, AppWidgetManager appWidgetManager,
                                int appWidgetId) {

        CharSequence widgetText = context.getString(R.string.appwidget_text);
        // Construct the RemoteViews object
        RemoteViews views = new RemoteViews(context.getPackageName(), R.layout.picture_widget);

        //创建图片？
        File pathp= context.getExternalCacheDir();//路径

        Bitmap bitmap1=BitmapFactory.decodeFile(pathp.getAbsolutePath()+"/userimg.png");//难道这种方法就可以？
     //   bitmap= Bitmap.createBitmap(imageUri)
        if (bitmap1==null)System.out.println("bitmap为空？？");
        views.setImageViewBitmap(R.id.imageview1, bitmap1);//外部图片用这个函数，否则不更新,图片太大也不不更新

        // Instruct the widget manager to update the widget
        appWidgetManager.updateAppWidget(appWidgetId, views);
    }

    @Override
    public void onUpdate(Context context, AppWidgetManager appWidgetManager, int[] appWidgetIds) {
        // There may be multiple widgets active, so update all of them
        for (int appWidgetId : appWidgetIds) {
            updateAppWidget(context, appWidgetManager, appWidgetId);
        }
    }

    @Override
    public void onEnabled(Context context) {
        // Enter relevant functionality for when the first widget is created
    }

    @Override
    public void onDisabled(Context context) {
        // Enter relevant functionality for when the last widget is disabled
    }
}

