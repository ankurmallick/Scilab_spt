function [output]  = cummin(A, dim, direction)
funcprot(0);

[rows, cols] = size(A);

if(~exists('dim','local') & ~exists('direction','local')) then
	
	if(rows==1 | cols==1) then

		output = zeros(rows, cols);
	
		minim = 999999;
	
		for iter = 1:max(size(A))
		
			if(A(iter)<minim) then
				minim = A(iter);
			end	
		
			output(iter) = minim;
		
		end
	
	else
	
		output = zeros(rows, cols);
		
		for i = 1:cols
			minim = 99999;
			for j = 1:rows
				
				if(A(j, i)<minim) then
					minim = A(j,i);
				end
				
				output(j,i) = minim;
			end
		end

	end

elseif (~exists('direction','local') & exists('dim','local')) then

	// 2 means along rows
	// 1 means along columns
	
	if(dim==1) then
	
		output = zeros(rows, cols);
		
		for i = 1:cols
			minim = 99999;
			for j = 1:rows
				
				if(A(j, i)<minim) then
					minim = A(j,i);
				end
				
				output(j,i) = minim;
			end
		end
	
	elseif(dim==2) then
	
		output = zeros(rows, cols);
		
		for i = 1:rows
			minim = 99999;
			for j = 1:cols
				
				if(A(i, j)<minim) then
					minim = A(i, j);
				end
				
				output(i, j) = minim;
			end
		end
		
	end
	
elseif(exists('direction','local') & ~exists('dim','local')) then
	
	output = zeros(rows, cols);
	if(direction == "reverse") then
		
		
		for i = cols:-1:1
			minim = 99999;
			for j = rows:-1:1
				
				if(A(j, i)<minim) then
					minim = A(j,i);
				end
				
				output(j,i) = minim;
			end
		end

	end

elseif(exists('direction','local') & exists('dim','local'))
	output = zeros(rows, cols);
	if(dim==1) then
	
		if(direction=="reverse") then
			output = zeros(rows, cols);
		
			for i = cols:-1:1
				minim = 99999;
				for j = rows:-1:1
				
					if(A(j, i)<minim) then
						minim = A(j,i);
					end
				
					output(j,i) = minim;
				end
			end
		end
	
	elseif(dim==2) then
	
		output = zeros(rows, cols);
		
		for i = rows:-1:1
			minim = 99999;
			for j = cols:-1:1
				
				if(A(i, j)<minim) then
					minim = A(i, j);
				end
				
				output(i, j) = minim;
			end
		end
		
	end

end

endfunction
