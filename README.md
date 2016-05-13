# CFBarbecue

A simple wrapper around Barbecue - a Java library for creating Barcodes

## Examples

```bash
box install cfbarbecue
```

```cfc
// returns a cfimage
image = wirebox.getInstance( dsl = "Barcode@cfbarbecue" ).code128('Hello World!').generate();

// writes an image to the browser
wirebox.getInstance( dsl = "Barcode@cfbarbecue" ).code128('Hello Again!').toImage();
```