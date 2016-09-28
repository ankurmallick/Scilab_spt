function Y = db(X,U,R)
//Modifies the input vector to give output vectors of the same length
//Calling Sequence
//Y = db(X)
//Y = db(X,SignalType)
//Y = db(X,'Voltage',R)
//Y = db(X,R)
//Parameters
//X: Vector matrix or n-dimensional array (Input voltage or power signal)
//U: Input signal type ('Voltage' or 'Power')
//R: Resistance load
//Description
//Y=db(X)
//Converts the elements of X (assumed to be a voltage signal across a resistance
//of 1 ohm) to decibels
//Y=db(X,SignalType)
//Specifies the SignalType of X as 'Voltage' or 'Power' (not case sensitive)
//If type is 'Voltage' the resistance is assumed to be 1 ohm
//If type is 'Power' the elements of X must be non-negative (resistance not used)
//Y=db(X,'Voltage','R') or Y=db(X,R)
//Conversts the elements of voltage signal X across a resistance of R ohm to decibels
//Examples
//X=rand(1,5)
//X  =
// 
//    0.2113249    0.7560439    0.0002211    0.3303271    0.6653811 
//Y=db(X))
//Y  =
// 
//  - 13.500988  - 2.4290603  - 73.106865  - 9.6211161  - 3.5385907 
//Authors
//Ankur Mallick
    if argn(2)==1 then
        U='Voltage';
        R=1;
    elseif argn(2)==2
        if(type(U)~=10)
            R=U;
            U='Voltage';
        else
            R=1;
        end
    end
    if(strcmpi(U,'Voltage')==0)
        Y=10*log10((abs(X).^2)/R);
    elseif(strcmpi(U,'Power')==0)
        if(or(X<0)==1)
            error('Input power signal must be non-negative');
        end
        Y=10*log10(X);
    else
        error('Signal type must be voltage or power');
    end
endfunction
