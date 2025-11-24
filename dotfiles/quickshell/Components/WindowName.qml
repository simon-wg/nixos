import QtQuick
import Quickshell.Hyprland
import qs.Singletons

Text {
    color: "white"
    text: {
        var title = Hyprland.activeToplevel?.title;
        return title?.length > 50 ? title?.substring(0, 47) + "..." : (title || "");
    }
    font: FontManager.symbolFont
}
