//Testing for logical errors (no exception handling required)
a=[rand(1,2), -rand(1,2), 1+2*%i] ;
disp(a);
disp(db2mag(a));

//Output
//    0.5664249    0.4826472  - 0.3321719  - 0.5935095    1. + 2.i  
// 
// 
//         column 1 to 4
// 
//    1.0673854    1.0571396    0.9624793    0.9339519  
// 
//         column 5
// 
//    1.0924055 + 0.2560774i