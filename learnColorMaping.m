function [ A, b ] = learnColorMaping( im1, im2 )
%LEARNCOLORMAPING used to learn a color mapping
%   function [ A, b ] = learnColorMaping( im1, im2 )
%   imL: low quality image pixels, N-by-3, Lab in sequence
%   imH: high quality image pixels, N-by-3, Lab in sequence
%   im1 and im2 are registered so that pixels are corresponding
%   c = AQj+b,where Qj=(L^2,a^2,b^2,La,Lb,ab,L,a,b)

[rows, ~] = size(im1);
Q = zeros(rows, 10);
C = zeros(rows, 3);

row = 1;
for r = 1:rows
    [l,a,b] = im1(r,:);
    Q(row, :) = [l^2,a^2,b^2,l*a,l*b,a*b,l,a,b, 1];
    C(row, :) = im2(r,:);
    row = row + 1;
end

res = (Q\C)';
A = res(:, 1:9);
b = res(:, 10)';

end