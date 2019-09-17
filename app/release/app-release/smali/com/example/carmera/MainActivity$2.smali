.class Lcom/example/carmera/MainActivity$2;
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

    .line 82
    iput-object p1, p0, Lcom/example/carmera/MainActivity$2;->this$0:Lcom/example/carmera/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 85
    iget-object p1, p0, Lcom/example/carmera/MainActivity$2;->this$0:Lcom/example/carmera/MainActivity;

    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-static {p1, v0}, Landroid/support/v4/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result p1

    if-eqz p1, :cond_0

    .line 86
    iget-object p1, p0, Lcom/example/carmera/MainActivity$2;->this$0:Lcom/example/carmera/MainActivity;

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p1, v0, v1}, Landroid/support/v4/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    goto :goto_0

    .line 89
    :cond_0
    iget-object p1, p0, Lcom/example/carmera/MainActivity$2;->this$0:Lcom/example/carmera/MainActivity;

    invoke-static {p1}, Lcom/example/carmera/MainActivity;->access$100(Lcom/example/carmera/MainActivity;)V

    :goto_0
    return-void
.end method
