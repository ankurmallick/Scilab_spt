function y=diric(x,n)
// Developed by: Ankur Mallick
// Input arguments: Vector x, Positive Integer n
// Output arguments: Vector y of the same size as x where y=D(x), D is the Dirichlet function
//Example for validation:
//x=[-5:1:5,2*%pi*50];
//n=5;
//b=diric(x,5);
//disp(b);
////Output:
//column 1 to 6
// 
//  - 0.0221637  - 0.1196575    0.1880711  - 0.2279162    0.2496622    1.  
// 
//         column  7 to 12
// 
//    0.2496622  - 0.2279162    0.1880711  - 0.1196575  - 0.0221637    1.
    if(n<0)
        error('Requires n to be a positive integer.');
    else
        y=zeros(x);
        M=modulo(x,2*%pi); //To identify the elements in x that are integer multiples of 2*pi
        k=x(M==0)./(2*%pi); //The corresponding integers which when multiplied by 2*pi give the above elements of x
        y(M==0)=(-1)^(k*(n-1));
        s1=n*sin(x(M~=0)/2); //Denominator of Dirichlet function for non-integer multiples of 2*pi
        s2=sin(n*x(M~=0)/2); //Numerator of Dirichlet function for non-integer multiples of 2*pi
        y(M~=0)=s2./s1;
    end
endfunction
