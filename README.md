# Vehicle Number Plate Detection  

## Overview  
This is a **MATLAB-based application** that detects and extracts vehicle number plates from images using **image processing techniques**. The system processes an input image, isolates the number plate, and identifies the characters using template matching.  

## Features  
- **Preprocessing:** Converts the image to grayscale and applies edge detection.  
- **Number Plate Localization:** Identifies and extracts the number plate region.  
- **Character Segmentation:** Isolates individual characters from the plate.  
- **Character Recognition:** Uses **template matching** to recognize letters and numbers.  
- **Visualization:** Displays intermediate image processing steps.
## How It Works  
1. Loads an input image.  
2. Converts the image to **grayscale** and applies **edge detection**.  
3. Extracts the **largest bounding box**, assuming it is the number plate.  
4. Segments individual characters.  
5. Matches characters against pre-stored templates.  
6. Outputs the detected number plate.  
