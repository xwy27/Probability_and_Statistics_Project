function matrix = build()
delimiterIn   = '';
headerlinesIn = 0; 
A = importdata('midProduct.txt', delimiterIn, headerlinesIn);
count = 0;
max = 0;
i = 1;
while(i <= size(A,1))
    count = count + 1;
    if max < A(i)
        max = A(i);
    end
    if i + A(i) + 1 > size(A,1)
        break;
    end
    i = i + A(i) + 1;
end
matrix = zeros(count,max+1);
num = 1;
j = 1;
while(j <= size(A,1))
    matrix(num,1) = A(j);
   temp = 2;
   k = j + 1;
   while(k <= j + A(j))
        matrix(num,temp) = A(k);
        temp = temp + 1;
        k = k + 1;
    end
    num = num + 1;
    j = j + A(j) + 1;
end
   
end

