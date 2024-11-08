%% get_square.m
%
%   En este archivo se define la función que encuentra y devuellve la
%   iamgen del sectro deseado
%
%   Recibe:
%       -img: imagen 
%       -corners: Los vertices del segmento en matriz de 2x2 |x1 x2|
%                                                            |y1 y2|     
%                                                                
%   Devuelve:
%       -im_square: imagen del segmento recortado
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function img_square = get_square(img, corners)

x1 = corners(1,1);
x2 = corners(1,2);
y1 = corners(2,1);
y2 = corners(2,2);


img_square = img(y1:y2,x1:x2);
end