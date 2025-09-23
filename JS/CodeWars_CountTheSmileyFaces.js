// AFTER REFACTURING
// return the total number of smiling faces in the array

function countSmileys(arr) {
    // A expressão regular para um "smiley face"
    const regex = /[:;][-~]?[)D]/; 
    let countSmileys = 0;
  
    if (arr) {
      for (let i = 0; i < arr.length; i++) {
        if (regex.test(arr[i])) {
          countSmileys++;
        }
      }
    }
  
    return countSmileys;
  }
  
  
  //  First attempt
  /*
  function countSmileys(arr) {
    if (!arr || arr.length === 0) {
        return 0;
      }
  
      let countSmile = 0;
      const eyes = [':', ';'];
      const nose = ['-', '~'];
      const mouth = [')', 'D'];
  
      for (let i = 0; i < arr.length; i++) {
        const face = arr[i];
  
        if (face.length === 2) {
          if (faceWithOUTNose(face, eyes, mouth)) {
            countSmile++;
          }
        } else if (face.length === 3) {
          if (faceWithNose(face, eyes, nose, mouth)) {
            countSmile++;
          }
        }
      }
    return countSmile;
  }

  function faceWithNose(face, eyes, nose, mouth) {
    const hasValidEyes = eyes.includes(face[0]);
    const hasValidNose = nose.includes(face[1]);
    const hasValidMouth = mouth.includes(face[2]);

    return hasValidEyes && hasValidNose && hasValidMouth;
  }

  function faceWithOUTNose(face, eyes, mouth) {
    const hasValidEyes = eyes.includes(face[0]);
    const hasValidMouth = mouth.includes(face[1]);

    return hasValidEyes && hasValidMouth;
  }
*/