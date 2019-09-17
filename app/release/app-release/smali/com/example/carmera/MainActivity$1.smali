.class Lcom/example/carmera/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/carmera/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/carmera/MainActivity;


# direct methods
.method constructor <init>(Lcom/example/carmera/MainActivity;)V
    .locals 0

    .line 57
    iput-object p1, p0, Lcom/example/carmera/MainActivity$1;->this$0:Lcom/example/carmera/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 60
    new-instance p1, Ljava/io/File;

    iget-object v0, p0, Lcom/example/carmera/MainActivity$1;->this$0:Lcom/example/carmera/MainActivity;

    invoke-virtual {v0}, Lcom/example/carmera/MainActivity;->getExternalCacheDir()Ljava/io/File;

    move-result-object v0

    const-string v1, "output_image.jpg"

    invoke-direct {p1, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 62
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 63
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 65
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 67
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 69
    :goto_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_1

    .line 70
    iget-object v0, p0, Lcom/example/carmera/MainActivity$1;->this$0:Lcom/example/carmera/MainActivity;

    const-string v1, "com.example.cameraalbumtest.fileprovider"

    invoke-static {v0, v1, p1}, Landroid/support/v4/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/example/carmera/MainActivity;->access$002(Lcom/example/carmera/MainActivity;Landroid/net/Uri;)Landroid/net/Uri;

    goto :goto_1

    .line 73
    :cond_1
    iget-object v0, p0, Lcom/example/carmera/MainActivity$1;->this$0:Lcom/example/carmera/MainActivity;

    invoke-static {p1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/example/carmera/MainActivity;->access$002(Lcom/example/carmera/MainActivity;Landroid/net/Uri;)Landroid/net/Uri;

    .line 75
    :goto_1
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.media.action.IMAGE_CAPTURE"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 76
    iget-object v0, p0, Lcom/example/carmera/MainActivity$1;->this$0:Lcom/example/carmera/MainActivity;

    invoke-static {v0}, Lcom/example/carmera/MainActivity;->access$000(Lcom/example/carmera/MainActivity;)Landroid/net/Uri;

    move-result-object v0

    const-string v1, "output"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 77
    iget-object v0, p0, Lcom/example/carmera/MainActivity$1;->this$0:Lcom/example/carmera/MainActivity;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/example/carmera/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method
