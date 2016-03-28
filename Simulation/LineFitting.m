function [a,b,r] = LineFitting(X, Y)

[Xd1,Xd2] = size(X);
[Yd1,Yd2] = size(Y);

%输入参数判定
%输入参数，必须是同规模的行向量
if Xd1 ~= 1 %X是否为行向量
    disp('Error !');
end

if Yd1 ~= 1 %Y是否为行向量
    disp('Error !');
end

if Xd2 ~= Yd2 %X和Y 元素个数是否相同
    disp('Error !');
end

meanX = mean(X);
meanY = mean(Y);

sigmax = 0;
for i=1:Xd2
    sigmax = sigmax + (X(1,i)-meanX)^2;
end
sigmax = sqrt(sigmax);

sigmay = 0;
for i=1:Yd2
    sigmay = sigmay + (Y(1,i)-meanY)^2;
end
sigmay = sqrt(sigmay);

sigmaw = 0;
for i=1:Yd2
    sigmaw = sigmaw + (X(1,i)-meanX)*(Y(1,i)-meanY);
end

r = sigmaw/(sigmax * sigmay);
b = sigmaw/sigmax^2;
a = meanY - b*meanX;

