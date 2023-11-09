function fuelPrice(litres, pricePerLitre) {
    console.log('inicio');
    let finalPrice = 0;
    console.log('inicio1');
    
    if (litres <2) {
        console.log ('maior q 2 litros e menor q 4');
      return parseFloat((finalPrice = litres * pricePerLitre).toFixed(2));
    } else if (litres >= 2 && litres < 4) {
        console.log ('maior q 2 litros e menor q 4');
        const discount = (litres*0.05);
        console.log (discount)
        return parseFloat((finalPrice = litres * pricePerLitre - discount).toFixed(2));
        
    } else if (litres >= 4 && litres < 6) {
        console.log ('maior q 4 litros');
        const discount = (litres*0.10);
        return parseFloat((finalPrice = litres*pricePerLitre - discount).toFixed(2));
    } else if (litres >= 6 && litres < 8) {
        console.log ('maior q6 litros');
        const discount = (litres*0.15);
        return parseFloat((finalPrice = litres*pricePerLitre - discount).toFixed(2));
    } else if (litres >= 8 && litres < 10) {
        console.log ('maior q8 litros');
        const discount = (litres*0.20);
        return parseFloat((finalPrice = litres*pricePerLitre - discount).toFixed(2));
    } else if (litres >=10) {
        console.log ('maior q8 litros');
        const discount = (litres*0.25);
        return parseFloat((finalPrice = litres*pricePerLitre - discount).toFixed(2));
    }
}