component {
    this.title = "cfbarbecue";
    this.author = "O.C. Tanner";
    this.description = "CFML wrapper around the Barbecue Java library for printing barcodes";
    this.dependencies = [ "cbjavaloader" ];

    function configure() {

    }

    function onLoad() {
        controller.getWireBox().getInstance( "loader@cbjavaloader" )
            .appendPaths( modulePath & "/lib" );
    }
}