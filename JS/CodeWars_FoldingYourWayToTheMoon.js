function foldTo(distance) {
    let folds = 0;
    let tickness = 0.0001;
    
    if(distance != '' && distance <=0) {
        return null;
    }else{
        while(tickness < distance){
        tickness = tickness * 2;
        folds +=1;
        } 
    return folds;
    }
}