var solution = function(firstArray, secondArray) {
    const squaredDifferences = firstArray.map((num, index) => Math.pow(num - secondArray[index], 2));
    const averageSquaredDifference = squaredDifferences.reduce((total, diff) => total + diff, 0) / firstArray.length;
    return averageSquaredDifference;
};