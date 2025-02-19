#!/bin/sh

TMPDIR="/tmp"
GLGLFW_PATH="`pwd`/../glfw/src"

cd $TMPDIR
git clone --depth 1 https://gitlab.freedesktop.org/wayland/wayland.git
git clone --depth 1 https://gitlab.freedesktop.org/wayland/wayland-protocols.git

cd $TMPDIR
cd wayland

rm -f "$GLGLFW_PATH"/wayland-client-protocol.h
rm -f "$GLGLFW_PATH"/wayland-client-protocol-code.h

wayland-scanner private-code ./protocol/wayland.xml "$GLGLFW_PATH"/wayland-client-protocol-code.h
wayland-scanner client-header ./protocol/wayland.xml "$GLGLFW_PATH"/wayland-client-protocol.h

cd $TMPDIR
cd wayland-protocols

rm -f "$GLGLFW_PATH"/wayland-xdg-shell-client-protocol.h
rm -f "$GLGLFW_PATH"/wayland-xdg-shell-client-protocol-code.h
rm -f "$GLGLFW_PATH"/wayland-xdg-decoration-client-protocol.h
rm -f "$GLGLFW_PATH"/wayland-xdg-decoration-client-protocol-code.h
rm -f "$GLGLFW_PATH"/wayland-viewporter-client-protocol.h
rm -f "$GLGLFW_PATH"/wayland-viewporter-client-protocol-code.h
rm -f "$GLGLFW_PATH"/wayland-relative-pointer-unstable-v1-client-protocol.h
rm -f "$GLGLFW_PATH"/wayland-relative-pointer-unstable-v1-client-protocol-code.h
rm -f "$GLGLFW_PATH"/wayland-pointer-constraints-unstable-v1-client-protocol.h
rm -f "$GLGLFW_PATH"/wayland-pointer-constraints-unstable-v1-client-protocol-code.h
rm -f "$GLGLFW_PATH"/wayland-idle-inhibit-unstable-v1-client-protocol.h
rm -f "$GLGLFW_PATH"/wayland-idle-inhibit-unstable-v1-client-protocol-code.h

wayland-scanner private-code ./stable/xdg-shell/xdg-shell.xml "$GLGLFW_PATH"/wayland-xdg-shell-client-protocol-code.h
wayland-scanner client-header ./stable/xdg-shell/xdg-shell.xml "$GLGLFW_PATH"/wayland-xdg-shell-client-protocol.h

wayland-scanner private-code ./unstable/xdg-decoration/xdg-decoration-unstable-v1.xml "$GLGLFW_PATH"/wayland-xdg-decoration-client-protocol-code.h
wayland-scanner client-header ./unstable/xdg-decoration/xdg-decoration-unstable-v1.xml "$GLGLFW_PATH"/wayland-xdg-decoration-client-protocol.h

wayland-scanner private-code ./stable/viewporter/viewporter.xml "$GLGLFW_PATH"/wayland-viewporter-client-protocol-code.h
wayland-scanner client-header ./stable/viewporter/viewporter.xml "$GLGLFW_PATH"/wayland-viewporter-client-protocol.h

wayland-scanner private-code ./unstable/relative-pointer/relative-pointer-unstable-v1.xml "$GLGLFW_PATH"/wayland-relative-pointer-unstable-v1-client-protocol-code.h
wayland-scanner client-header ./unstable/relative-pointer/relative-pointer-unstable-v1.xml "$GLGLFW_PATH"/wayland-relative-pointer-unstable-v1-client-protocol.h

wayland-scanner private-code ./unstable/pointer-constraints/pointer-constraints-unstable-v1.xml "$GLGLFW_PATH"/wayland-pointer-constraints-unstable-v1-client-protocol-code.h
wayland-scanner client-header ./unstable/pointer-constraints/pointer-constraints-unstable-v1.xml "$GLGLFW_PATH"/wayland-pointer-constraints-unstable-v1-client-protocol.h

wayland-scanner private-code ./unstable/idle-inhibit/idle-inhibit-unstable-v1.xml "$GLGLFW_PATH"/wayland-idle-inhibit-unstable-v1-client-protocol-code.h
wayland-scanner client-header ./unstable/idle-inhibit/idle-inhibit-unstable-v1.xml "$GLGLFW_PATH"/wayland-idle-inhibit-unstable-v1-client-protocol.h
