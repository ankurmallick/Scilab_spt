function w=bartlett(L)
//Generates a Bartlett window
//Calling Sequence
//w=bartlett(L)
//Parameters
//L: A positive integer describing the length of the bartlett window
//Description
//w=bartlett(L) returns an L-point Bartlett window in a column vector w
//Examples
//w=bartlett(4)
// w  =
// 
//    0.         
//    0.6666667  
//    0.6666667  
//    0.
//Authors
//Ankur Mallick
//Bibliography
//[1] Oppenheim, Alan V., Ronald W. Schafer, and John R. Buck. Discrete-Time Signal Processing. Upper Saddle River, NJ: Prentice Hall, 1999.
    funcprot(0);
    if(argn(2)~=1)
        error('Incorrect number of input arguments.');
    elseif(~isscalar(L)|L<=0|round(L)~=L)
        //Only positive integer L (not complex or real numbers nor vectors)
        error('L must be a positive integer')
    elseif(L==1)
        w=1; //Trivial case
    else
        N=L-1;
        w1=2*(0:1:N/2)/N;
        w2=2-2*(floor(N/2)+1:1:N)/N; //floor used to adjust for odd/even
        w=[w1, w2]';
    end
endfunction
