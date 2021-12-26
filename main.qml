import QtQuick 2.12
import QtQuick.Window 2.12
import QtQml 2.0

Window {
    visible: true
    width: 640
    height: 640
    color: "black"
    title: "Blobby"

    Timer {
        id: timer
        interval: 500
        repeat: true
        onTriggered: {
            canvas.requestPaint()
        }
    }

    Canvas {
        id: canvas
        // canvas size
        anchors.fill: parent
        // handler to override for drawing
        onPaint: {
            // get context to draw with
            var ctx = getContext("2d")
            ctx.reset()
            // setup the stroke
            ctx.lineWidth = 4
            ctx.strokeStyle = "white"
            // setup the fill
            ctx.fillStyle = "white"
            // begin a new path to draw
            ctx.beginPath()
            const r = width / 8;
            const center = width / 2;

            var startX, startY;
            for ( var angle = 0; angle <= Math.PI * 2; angle += 0.1 ) {
                const offset = ( Math.random() * -25 ) + 50
                const x = ( center + offset ) + r * Math.cos(angle)
                const y = ( center + offset ) + r * Math.sin(angle)

                if ( angle !== 0 ) {
                    ctx.lineTo(x, y)
                } else {
                    startX = x
                    startY = y
                }
                ctx.moveTo(x, y)
            }

            ctx.closePath()
            // fill using fill style
            ctx.fill()
            // stroke using line width and stroke style
            ctx.stroke()
        }
    }

    Component.onCompleted: {
        timer.start()
    }

}
