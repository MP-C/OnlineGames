function getCount(str) {
    return str.split('').reduce((acc, ch) => ch=='a'|| ch=='e' ||ch=='i' || ch=='o' || ch=='u'? acc + 1: acc, 0)
}