function y = medfilt1(x,n,blksz,DIM)
    funcprot(0);
    if(argn(2)<4|isempty(DIM))
        DIM=find(size(x)>1,1); //First non-singleton dimension
    end
    if(DIM>ndims(x))
        error('Invalid Dimensions');
    end
    perm=[DIM, 1:DIM-1, DIM+1:ndims(x)];
    x=permute(x,perm); //Makes DIM the leading dimension
    S=size(x);
    if(argn(2)<3|isempty(blksz))
        blksz=S(1); //Default Value of block size
    else
        blksz=blksz(:);
    end
    if(argn(2)<2|isempty(n))
        n=3; //Default value of n
    end
    x1=matrix(x,1,prod(S));
    T=[type(x1), type(blksz'), type(DIM)]; //all inputs should be of type double
    if(~and(T==1))
        error('Invalid data type');
    end
    y=zeros(x);
    L=floor(n/2);
    U=ceil((N/2)-1);
    //Implementing Median Filtering
    for i=1:prod(S(2:length(S)))
        x1=x(:,i)
        X=[zeros(1,L); x1; zeros(1,U)];
         
    end
    iperm(perm)=1:length(perm);
    Y=permute(Y,iperm); //Converting Y to the original shape of x
endfunction
endfunction
