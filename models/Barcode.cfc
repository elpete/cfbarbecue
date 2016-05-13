component {

    property name="imageHandler" inject="javaloader:net.sourceforge.barbecue.BarcodeImageHandler";
    property name="byteOutputStream" inject="java:java.io.ByteArrayOutputStream";
    property name="wirebox" inject="wirebox";
    property name="barcode";

    variables.defaultOptions = {
        resolution = 300,
        barWidth = 2,
        drawingText = false,
        drawingQuietSection = true,
        font = { name = "Arial", style = "Italic", size = 10 },
        foregroundColor = "##000000",
        backgroundColor = "##FFFFFF"
    };

    function generate() {
        if ( ! structKeyExists( variables, "barcode" ) ) {
            throw( "No barcode to generate!" );
        }

        variables.byteOutputStream.reset();
        imageHandler.writeJPEG( variables.barcode, variables.byteOutputStream );
        return ImageNew( variables.byteOutputStream.toByteArray() );
    }

    function toImage() {
        cfimage( action = "writeToBrowser", source = generate() );
    }

    function code128( required string data, struct options = variables.defaultOptions ) {
        variables.barcode = wirebox.getInstance(
            dsl = "javaloader:net.sourceforge.barbecue.linear.code128.Code128Barcode"
        ).init( arguments.data );

        variables.barcode.setResolution( options.resolution );
        variables.barcode.setBarWidth( options.barWidth );
        variables.barcode.setDrawingText( options.drawingText );
        variables.barcode.setDrawingQuietSection( options.drawingQuietSection );

        var font = wirebox.getInstance( dsl = "java:java.awt.Font" );
        font.init( options.font.name, font[ options.font.style ], options.font.size );
        variables.barcode.setFont( font );

        var Color = wirebox.getInstance( dsl = "java:java.awt.Color" );
        variables.barcode.setForeground( Color.decode( options.foregroundColor ) );
        variables.barcode.setBackground( Color.decode( options.backgroundColor ) );
        
        return this;
    }
}