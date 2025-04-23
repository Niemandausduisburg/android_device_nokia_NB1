#!/system/bin/sh

log -t navbar_overlay "[WAIT] Sleeping 20s to ensure overlay service is available..."
sleep 20

log -t navbar_overlay "[RUN] Disabling gestural navbar..."
cmd overlay disable com.android.internal.systemui.navbar.gestural

log -t navbar_overlay "[RUN] Enabling 3-button navbar..."
cmd overlay enable com.android.internal.systemui.navbar.threebutton
