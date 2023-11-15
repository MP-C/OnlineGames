const quarterOf = (month) => {
    // 1m 2m 3m 1S
    // 4m 5m 6m, 2S
    // 7m 8m 9m, S3
    //10m 11m 12m, S4
    const result = Math.ceil(month/3)
    return result;
}    