function y=uencode(u,n,v,signflag)
//Performs uniform quantization of the input into 2^n levels
//Calling Sequence
//y=uencode(u,n,v,'signflag')
//Parameters
//u
//A vector, matrix or n-dimensional array
//n
//An integer between 2 and 32
//v
//A positive real scalar 
//'signflag'
//A string which can take only 2 values 'signed' or 'unsigned'
//Description
//Uniformly quantizes the input vector or n-dimensional array u into 2^n levels in the interval [-v,v]
//If v is not specified, its default value is 1
//'signflag' is a string that determines the nature of the quantization
//If signflag='unsigned' then y contains unsigned integers in the range [0,2^n-1] corresponding to the 2^n levels
//If signflag='unsigned' then y contains signed integers in the range [-2^(n-1),2^(n-1)-1] corresponding to the 2^n levels
//The  size of the integers in y in bits(8,16, or 32) depends on the value of n
//If the input lies beyond +/- v it is saturated
//Example
//y=uencode(-1:0.5:1,3)
// y  =
// 
//  0  2  4  6  7 
//Author
//Ankur Mallick
//See also
//udecode
//floor
    if(argn(2)<4)
        signflag='unsigned';
        if(argn(2)<3)
            v=1;
        end
    end
    if(argn(2)>4|argn(2)<2)
        error('Incorrect number of input arguments.');
    elseif(signflag~='signed'&signflag~='unsigned')
        error('Sign flag must be signed or unsigned');
    elseif(size(v)>1|abs(v)~=v)
        error('Peak value must be a positive real scalar');
    elseif(size(n)>1|round(n)~=n|n<2|n>32)
        error('n must be an integer between 2 and 32')
    else
        y=zeros(u);
        L=2*v/(2^n);
        y=floor((u+v)/L);
        y(y<0)=0;
        y(y>(2^n-1))=2^n-1;
        if(signflag=='signed')
            y=y-2^(n-1);
            if(n>=2&n<=8)
                y=int8(y);
            elseif(n>=9&n<=16)
                y=int16(y);
            else
                y=int32(y);
            end
        else
            if(n>=2&n<=8)
                y=uint8(y);
            elseif(n>=9&n<=16)
                y=uint16(y);
            else
                y=uint32(y);
            end
        end
    end
endfunction
