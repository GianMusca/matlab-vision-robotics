function corners = get_squares_coord(img)
% GET_SQUARES_COORD  Devuelve coordenadas de los vertices superior izquierdo e
%   inferior derecho todos los cuadrados de una imagen.
%   corners = get_squares_coord(img)
%   
%   -img: imagen, idealmente con el ruido filtrado, pero un poco de ruido
%   no tiene impedimentos.
%   -corners: matriz con vertices del segmento en formato 2x2 |x1 x2|
%                                                             |y1 y2|

im_thres = imono(img)>0.9;

% Se obtienen los blobs de un área mínima en la imagen.
% Se tomó el área promedio de un bloque para no tomar al posible ruido.
blobs = iblobs(im_thres, 'area', [5000,10000]);
n = size(blobs);
n = n(2);

%Se inicializa el vector de matrices de coordenadas.
corners = zeros(2,2,n);

%Para cada uno de los blobs:
for i = 1:n
    %Obtenemos el centroide
    centx = blobs(i).uc;
    centy = blobs(i).vc;
    %Aproximamos al blob como un rectángulo perfecto porque sabemos que, más
    %allá de deformaciones durante el filtrado, los blobs son rectángulos
    base = sqrt(blobs(i).area)/2;
    corners(:,:,i) = [int32(centx-base) int32(centx+base); int32(centy-base) int32(centy+base)];
end