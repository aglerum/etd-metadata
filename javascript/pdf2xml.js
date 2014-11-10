// This converts PDFs in a folder to XML then saves to the same folder as the source PDFs
// 1. Open Adobe Acrobat Action Wizard and enter these parameters
// 2. Start with: [the folder where the source PDFs are]
// 3. Steps: Execute JavaScript. Enter this script into Options 

var filename = this.documentFileName + ".xml";
this.saveAs(filename, "com.adobe.acrobat.xml-1-00");

// 4. Save to: Don’t Save Changes.
