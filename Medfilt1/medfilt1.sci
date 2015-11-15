function y = medfilt1(x,n,blksz,DIM)
    funcprot(0);
    if(argn(2)<1|argn(2)>4)
        error('Incorrect number of input arguments.');
    else
        
    y=zeros(x)
    x1=[0, x, 0];
    for i=2:length(x)+1
        y(i)=median([x1(i-1),x1(i),x1(i+1)])
    end
endfunction
