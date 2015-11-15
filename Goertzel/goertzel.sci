function Y = goertzel(X,INDVEC,DIM)
    funcprot(0);
    if(argn(2)<1|argn(2)>4)
        error('Incorrect number of input arguments.');
    else
        if(argn(2)<3|isempty(DIM))
            D
