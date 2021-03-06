function y = kalman_filter2(data)
len = length(data);
A = [1 0.1; 0 1];    % 状态方程的系数矩阵
q = [10e-7, 0; 0, 10e-7];  % predict noise convariance, const
p = [10e-6, 0; 0, 10e-6];  % initial estimated error convariance
g = 0;    % 卡尔曼增益
H = [1, 0];    % 观测方程系数矩阵
r = 10e-7;  % measure error convariance, const

x = [data(1); data(2) - data(1)];
% measure predict opt q p
result = zeros(len, 3);
result(1,:) = [x(1), x(1), x(1)];
for i = 2:len
    result(i, 1) = data(i);
    % predict
    x = A * x ;
    result(i, 2) = x(1);
    p = A * p * A' + q;
    %result(i, 5) = p;
    
    % measurement
    g = H * p / (H * p * H' + r);
    % result(i, 4) = g;
    x = x + g'*(data(i) - H*x);
    result(i, 3) = x(1);
    p = (1 - g*H') * p;
    % result(i, 6) = p;
    
end
y = result;



if 0
data = [ 179.00, 174.00, 174.00, 174.00, 174.00, 174.00, 174.00, 174.00, 174.00, ...
174.00, 180.00, 181.00, 181.00, 181.00, 181.00, 185.00, 185.00, 185.00, 185.00, ...
185.00, 187.00, 187.00, 187.00, 187.00, 187.00, 187.00, 187.00, 187.00, 187.00, ...
193.00, 193.00, 193.00, 193.00, 193.00, 193.00, 253.00, 237.00, 186.00, 169.00, ...
181.00, 181.00, 185.00, 174.00, 181.00, 177.00, 175.00, 174.00, 174.00, 174.00, ...
174.00, 174.00, 174.00, 174.00, 174.00, 174.00, 174.00, 174.00, 174.00, 174.00, ...
174.00, 148.00, 138.00, 88.00, 88.00, 88.00, 88.00, 88.00, 88.00, 88.00, 50.00, ...
50.00, 50.00, 47.00, 47.00, 47.00, 47.00, 47.00, 47.00, 32.00, 31.00, 28.00, ...
27.00, 27.00, 27.00, 27.00, 27.00, 22.00, 22.00, 22.00, 22.00, 22.00, 22.00 ];
end
end
