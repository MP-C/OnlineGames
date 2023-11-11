function gridMap(fn,a) {
    return a.map((array1) =>array1.map((obj) => fn(obj)))
}