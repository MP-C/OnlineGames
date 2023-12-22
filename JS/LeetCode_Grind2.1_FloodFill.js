/*
An image is represented by an m x n integer grid image where image[i][j] represents the pixel value of the image.
You are also given three integers sr, sc, and color. You should perform a flood fill on the image starting from the pixel image[sr][sc].
To perform a flood fill, consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color), and so on. Replace the color of all of the aforementioned pixels with color.
Return the modified image after performing the flood fill.

Input: image = [[1,1,1],[1,1,0],[1,0,1]], sr = 1, sc = 1, color = 2
Output: [[2,2,2],[2,2,0],[2,0,1]]
Explanation: From the center of the image with position (sr, sc) = (1, 1) (i.e., the red pixel), all pixels connected by a path of the same color as the starting pixel (i.e., the blue pixels) are colored with the new color.
Note the bottom corner is not colored 2, because it is not 4-directionally connected to the starting pixel.

*/
/**
 * @param {number[][]} image
 * @param {number} sr
 * @param {number} sc
 * @param {number} color
 * @return {number[][]}
 */
var floodFill = function(image, sr, sc, color) {
    // Initial Condition:
    //console.log("image, sr, sc, color", image, sr, sc, color);
    // image = [ [ 1, 1, 1 ], [ 1, 1, 0 ], [ 1, 0, 1 ] ]; sr=1; scol=1, color=2
    // sr= Starting Row; sc= Starting Colomn
    
    // To garantee that: image are an image || is bigger than a square || in the start position the color is different, so:
    if(image == null || image.length < 1 || image[sr][sc] == color){
        return image;
    }

    // to delare the inicial position
    let initialColor = image[sr][sc];
    //let count=0;
    // to start the recursion
    const fillColor = (image, row, col, color, initialColor) => {
        //the bounderies
        if(row<0 || col<0 || row>=image.length || col>=image.lenght || initialColor != image[row][col]){
            return;
        }
        //count+=1;
        //console.log("count", count);

        image[row][col] = color;
        fillColor(image, row-1, col, color, initialColor); // go left
        //console.log("row", row);
        //console.log("left");
        fillColor(image, row+1, col, color, initialColor); // go right
        //console.log("row", row);
        //console.log("right");
        fillColor(image, row, col-1, color, initialColor); // go down
        //console.log("down");
        //console.log("col", col);
        fillColor(image, row, col+1, color, initialColor); // go up
        //console.log("up");
        //console.log("col", col);
    }
    fillColor(image, sr, sc, color, initialColor);
    return image;
};