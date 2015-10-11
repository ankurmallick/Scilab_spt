function [b,a,N,M] = eqtflength(b,a)
//Modifies the input vector to give output vectors of the same length
//Calling Sequence
//[b,a] = eqtflength(b,a)
//[b,a,N,M] = eqtflength(b,a)
//Parameters
//b
//Vector matrix or n-dimensional array (intended to be the numerator coefficients of the filter transfer function)
//a
//Vector matrix or n-dimensional array (intended to be the denominator coefficients of the filter transfer function)
//Description
//[b,a] = eqtflength(b,a)
//Makes the numerator coefficients 'b' and the denominator coefficients 'a' of the filter transfer function have the
//same length by appending the required number of zeros and removing common trailing zeros
//Intended to be used with discrete time filter transfer functions expressed as negative powers of z
//[b,a,N,M] = eqtflength(b,a)
//Returns the order of the numerator and denominator in N and M respectively
//Example
//a  =
// 
//    1.  
//    2.
//b  =
// 
//    1.  
//    2.  
//    3.
//[b,a,N,M]=eqtflength(b,a)
// M  =
// 
//    1.  
// N  =
// 
//    2.  
// a  =
// 
//    1.    2.    0.  
// b  =
// 
//    1.    2.    3.
//Author
//Ankur Mallick
    if(argn(2)~=2)
        error('Incorrect number of input arguments');
    elseif(length(a)==0|max(abs(a))==0)
        error('Dividing by zero not allowed');
    else
        a=a(:)';
        b=b(:)';
        a=[a,zeros(1,max(0,length(b)-length(a)))];
        b=[b,zeros(1,max(0,length(a)-length(b)))];
        M=length(a(a~=0));
        N=length(b(b~=0));
        n=max(M,N);
        M=M-1;
        N=N-1;
        a=a(1:n);
        b=b(1:n);
    end
endfunction
