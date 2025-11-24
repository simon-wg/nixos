import QtQuick

Rectangle {
    id: root
    required property var fillLayout
    property list<color> colors: ["black"]
    anchors.fill: fillLayout
    gradient: Gradient {
        id: grad
        orientation: Gradient.Horizontal
    }
    z: -1

    Component.onCompleted: updateGradient()
    onColorsChanged: updateGradient()

    Component {
        id: stopComponent
        GradientStop {}
    }

    function updateGradient() {
        grad.stops = [];

        var newStops = [];
        for (var i = 0; i < colors.length; i++) {
            var stop = stopComponent.createObject(grad, {
                position: colors.length > 1 ? i / (colors.length - 1) : 0,
                color: colors[i]
            });
            newStops.push(stop);
        }

        grad.stops = newStops;
    }
}
