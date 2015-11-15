function D=dftmtx(n)
// Developed by: Ankur Mallick
// Input arguments: Positive Integer n
// Output arguments: DFT matrix D of size nxn such that D*x=fft(x) for any vector x of length n
//Example for validation:
//a=(1:256)';
//n=length(a);
//D=dftmtx(n);
//y1=fft(a);
//y2=D*a;
//disp(norm(y1-y2));
//Output: 9.576D-12 
      D=fft(eye(n,n),-1,n,1)
endfunction
