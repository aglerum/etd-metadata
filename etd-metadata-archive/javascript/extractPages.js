// This extracts pages 1-2 from a folder of PDFs then saves the new documents to the same folder as the source PDFs
// 1. Open Adobe Acrobat Action Wizard and enter these parameters
// 2. Start with: [the folder where the source PDFs are]
// 3. Steps: Execute JavaScript. Enter this script into Options 

var filename = this.documentFileName.split(".").shift()+"_pages1-2.pdf";
        this.extractPages
         ({
            nStart: 0,
            nEnd: 1,
            cPath : filename
        }); 
        
// 4. Save to: Don’t Save Changes.
