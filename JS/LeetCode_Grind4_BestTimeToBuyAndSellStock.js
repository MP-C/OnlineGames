/*
4)
You are given an array prices where prices[i] is the price of a given stock on the ith day.

You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.

Example 1:
Input: prices = [7,1,5,3,6,4]
Output: 5
Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
*/

var maxProfit = function (prices) {
    let bestBuy = prices[0];
    let maxProfit = 0;
    for (let i = 0; i < prices.length; i++) {
        // Checking for bestBuy value
        if (prices[i] <= bestBuy) {
            bestBuy = prices[i];
            //console.log("bestBuy", bestBuy);
        }
        // Checking for maxProfit value
        if (prices[i] - bestBuy > maxProfit) {
            maxProfit = prices[i] - bestBuy;
            //console.log("maxProfit ", maxProfit);
        }
    }
    return maxProfit;
}


/* Not expected result */
var maxProfit = function (prices) {
    let bestSell, bestBuy = prices[0];
    let maxProfit = 0;
    for (let i = 0; i < prices.length; i++) {
        // Checking for lower buy value
        if (prices[i] <= bestBuy) {
            bestBuy = prices[i];
            console.log("bestBuy", bestBuy);
        }

        // Checking for higher seller value
        if (prices[i] >= bestSell) {
            bestSell = prices[i];
            console.log("bestSell", bestSell);
        }

        // Checking for higher profit value
        if (bestSell - bestBuy >= maxProfit) {
            maxProfit = bestSell - bestBuy;
            console.log("maxProfit ", maxProfit);
        }
    }
    return maxProfit;
}

var maxProfit = function(prices) {
    let bestSell = 0;
    let bestBuy = 0;
    let profit = prices.map((elem, index, array) => {
        if(array[index] > bestSell[index] && elem < bestSell){
            bestSell = elem[index];
        }
        if(array[index] > bestBuy[index] && elem < bestBuy){
            bestBuy = elem[index];
        }
        return bestSell - bestBuy
    })
    return profit;
};

/* Only works to case 2 */
var maxProfit = function(prices) {
    let bestSell = prices[0];
    let bestBuy = prices[0];
    for (let i = 0; i < prices.length; i++) {
        if (prices[i] > bestSell ) {
            bestSell[i] = prices[i];
            bestBuy[i] = 0;
        }
        if (prices[i] < bestBuy ) {
            bestBuy[i] = prices[i];
            bestSell[i] = 0;
        }
    }
    console.log("bestBuy, bestSell", bestBuy,bestSell);
    return bestSell - bestBuy;
}

/* Only get the major difference */
/**
 * @param {number[]} prices
 * @return {number}
 */
var maxProfit = function(prices) {
    var bestBuy = Math.min(...prices);
    var bestSell = Math.max(...prices);
    var profit = bestSell - bestBuy;
    console.log("bestBuy, bestSell, profit" ,bestBuy, bestSell, profit)
};

