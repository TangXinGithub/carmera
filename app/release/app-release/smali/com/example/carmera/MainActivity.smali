.class public Lcom/example/carmera/MainActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "MainActivity.java"


# static fields
.field public static final CHOOSE_PHOTO:I = 0x2

.field public static final TAKE_PHOTO:I = 0x1


# instance fields
.field private imageUri:Landroid/net/Uri;

.field private picture:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/example/carmera/MainActivity;)Landroid/net/Uri;
    .locals 0

    .line 41
    iget-object p0, p0, Lcom/example/carmera/MainActivity;->imageUri:Landroid/net/Uri;

    return-object p0
.end method

.method static synthetic access$002(Lcom/example/carmera/MainActivity;Landroid/net/Uri;)Landroid/net/Uri;
    .locals 0

    .line 41
    iput-object p1, p0, Lcom/example/carmera/MainActivity;->imageUri:Landroid/net/Uri;

    return-object p1
.end method

.method static synthetic access$100(Lcom/example/carmera/MainActivity;)V
    .locals 0

    .line 41
    invoke-direct {p0}, Lcom/example/carmera/MainActivity;->openAlbum()V

    return-void
.end method

.method private displayImage(Ljava/lang/String;)V
    .locals 2

    if-eqz p1, :cond_0

    .line 238
    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 239
    iget-object v1, p0, Lcom/example/carmera/MainActivity;->picture:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 241
    invoke-virtual {p0}, Lcom/example/carmera/MainActivity;->getExternalCacheDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/example/carmera/MainActivity;->copyFile(Ljava/lang/String;Ljava/lang/String;)Z

    .line 243
    invoke-virtual {p0, p0}, Lcom/example/carmera/MainActivity;->isGrantExternalRW(Landroid/app/Activity;)Z

    .line 244
    new-instance p1, Landroid/content/Intent;

    const-string v0, "com.example.broadcasttest.my_broadcast"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/4 v0, 0x3

    .line 245
    invoke-virtual {p1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 247
    invoke-virtual {p0, p1}, Lcom/example/carmera/MainActivity;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    const-string v0, "failed to get image"

    .line 250
    invoke-static {p0, v0, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :goto_0
    return-void
.end method

.method private getImagePath(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 226
    invoke-virtual {p0}, Lcom/example/carmera/MainActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p1

    move-object v3, p2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    const/4 p2, 0x0

    if-eqz p1, :cond_1

    .line 228
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p2, "_data"

    .line 229
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    .line 231
    :cond_0
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    :cond_1
    return-object p2
.end method

.method private handleImageBeforeKitKat(Landroid/content/Intent;)V
    .locals 1

    .line 218
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    const/4 v0, 0x0

    .line 219
    invoke-direct {p0, p1, v0}, Lcom/example/carmera/MainActivity;->getImagePath(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 220
    invoke-direct {p0, p1}, Lcom/example/carmera/MainActivity;->displayImage(Ljava/lang/String;)V

    return-void
.end method

.method private handleImageOnKitKat(Landroid/content/Intent;)V
    .locals 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .line 194
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    .line 195
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "handleImageOnKitKat: uri is "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TAG"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    invoke-static {p0, p1}, Landroid/provider/DocumentsContract;->isDocumentUri(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 198
    invoke-static {p1}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    .line 199
    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v2

    const-string v3, "com.android.providers.media.documents"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string p1, ":"

    .line 200
    invoke-virtual {v0, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    aget-object p1, p1, v0

    .line 201
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "_id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 202
    sget-object v0, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p0, v0, p1}, Lcom/example/carmera/MainActivity;->getImagePath(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :goto_0
    move-object v1, p1

    goto :goto_1

    .line 203
    :cond_0
    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object p1

    const-string v2, "com.android.providers.downloads.documents"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    const-string p1, "content://downloads/public_downloads"

    .line 204
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-static {v0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {p1, v2, v3}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object p1

    .line 205
    invoke-direct {p0, p1, v1}, Lcom/example/carmera/MainActivity;->getImagePath(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 207
    :cond_1
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v2, "content"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 209
    invoke-direct {p0, p1, v1}, Lcom/example/carmera/MainActivity;->getImagePath(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 210
    :cond_2
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v2, "file"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 212
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 214
    :cond_3
    :goto_1
    invoke-direct {p0, v1}, Lcom/example/carmera/MainActivity;->displayImage(Ljava/lang/String;)V

    return-void
.end method

.method private openAlbum()V
    .locals 2

    .line 133
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.GET_CONTENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "image/*"

    .line 134
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const/4 v1, 0x2

    .line 135
    invoke-virtual {p0, v0, v1}, Lcom/example/carmera/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method


# virtual methods
.method public copyFile(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4

    .line 273
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "/userimg.png"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 274
    invoke-virtual {p0, p0}, Lcom/example/carmera/MainActivity;->isGrantExternalRW(Landroid/app/Activity;)Z

    const/4 v0, 0x0

    .line 276
    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 277
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v3, "--Method--"

    if-nez v2, :cond_0

    :try_start_1
    const-string p1, "copyFile:  oldFile not exist."

    .line 278
    invoke-static {v3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    .line 280
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v2

    if-nez v2, :cond_1

    const-string p1, "copyFile:  oldFile not file."

    .line 281
    invoke-static {v3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    .line 283
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->canRead()Z

    move-result v1

    if-nez v1, :cond_2

    const-string p1, "copyFile:  oldFile cannot read."

    .line 284
    invoke-static {v3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    .line 294
    :cond_2
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 295
    new-instance p1, Ljava/io/FileOutputStream;

    invoke-direct {p1, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    const/16 p2, 0x400

    .line 296
    new-array p2, p2, [B

    :goto_0
    const/4 v2, -0x1

    .line 298
    invoke-virtual {v1, p2}, Ljava/io/FileInputStream;->read([B)I

    move-result v3

    if-eq v2, v3, :cond_3

    .line 299
    invoke-virtual {p1, p2, v0, v3}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_0

    .line 301
    :cond_3
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    .line 302
    invoke-virtual {p1}, Ljava/io/FileOutputStream;->flush()V

    .line 303
    invoke-virtual {p1}, Ljava/io/FileOutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const/4 p1, 0x1

    return p1

    :catch_0
    move-exception p1

    .line 306
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    return v0
.end method

.method public isGrantExternalRW(Landroid/app/Activity;)Z
    .locals 3

    .line 314
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x1

    const/16 v2, 0x17

    if-lt v0, v2, :cond_0

    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-virtual {p1, v0}, Landroid/app/Activity;->checkSelfPermission(Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "android.permission.READ_EXTERNAL_STORAGE"

    .line 317
    filled-new-array {v2, v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0, v1}, Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V

    const/4 p1, 0x0

    return p1

    :cond_0
    return v1
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    const/4 v0, 0x1

    const/4 v1, -0x1

    if-eq p1, v0, :cond_2

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    if-ne p2, v1, :cond_3

    .line 177
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x13

    if-lt p1, p2, :cond_1

    .line 179
    invoke-direct {p0, p3}, Lcom/example/carmera/MainActivity;->handleImageOnKitKat(Landroid/content/Intent;)V

    goto :goto_0

    .line 182
    :cond_1
    invoke-direct {p0, p3}, Lcom/example/carmera/MainActivity;->handleImageBeforeKitKat(Landroid/content/Intent;)V

    goto :goto_0

    :cond_2
    if-ne p2, v1, :cond_3

    .line 167
    :try_start_0
    invoke-virtual {p0}, Lcom/example/carmera/MainActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    iget-object p2, p0, Lcom/example/carmera/MainActivity;->imageUri:Landroid/net/Uri;

    invoke-virtual {p1, p2}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p1

    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 168
    iget-object p2, p0, Lcom/example/carmera/MainActivity;->picture:Landroid/widget/ImageView;

    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 170
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_3
    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongThread"
        }
    .end annotation

    .line 52
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f09001c

    .line 53
    invoke-virtual {p0, p1}, Lcom/example/carmera/MainActivity;->setContentView(I)V

    const p1, 0x7f070087

    .line 54
    invoke-virtual {p0, p1}, Lcom/example/carmera/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    const v0, 0x7f070029

    .line 55
    invoke-virtual {p0, v0}, Lcom/example/carmera/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    const v1, 0x7f07005e

    .line 56
    invoke-virtual {p0, v1}, Lcom/example/carmera/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/example/carmera/MainActivity;->picture:Landroid/widget/ImageView;

    .line 57
    new-instance v1, Lcom/example/carmera/MainActivity$1;

    invoke-direct {v1, p0}, Lcom/example/carmera/MainActivity$1;-><init>(Lcom/example/carmera/MainActivity;)V

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 82
    new-instance p1, Lcom/example/carmera/MainActivity$2;

    invoke-direct {p1, p0}, Lcom/example/carmera/MainActivity$2;-><init>(Lcom/example/carmera/MainActivity;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 0

    const/4 p2, 0x1

    if-eq p1, p2, :cond_0

    goto :goto_0

    .line 141
    :cond_0
    array-length p1, p3

    const/4 p2, 0x0

    if-lez p1, :cond_1

    aget p1, p3, p2

    if-nez p1, :cond_1

    .line 142
    invoke-direct {p0}, Lcom/example/carmera/MainActivity;->openAlbum()V

    goto :goto_0

    :cond_1
    const-string p1, "You denied the permission"

    .line 144
    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :goto_0
    return-void
.end method
