function color_blocks=get_color_blocks(im_grey)
% GET_COLORED_BLOCKS  Devuelve imagenes limpias con los blocks asociados a cada color
%   color_blocks = color_blocks(im_grey)
%   
%   color_blocks: lista con 5 imagenes, cada una con los blocks de cada
%   color, sin letras. En el siguiente orden:
%       AZUL
%       MARRON
%       VERDE
%       ROSA
%       AMARILLO
%   im_grey: imagen original en escala de grises.

%***Rango de los diferentes colores, encontrado analizando el histograma de la***
%imagen de muestra.
range_black = [0 110];
range_blue = [120 130];
range_brown = [135 144];
range_gris = [150 163];
range_green = [190 194];
range_pink = [199 203];
range_yellow = [216 220];

%Genero blocks blue
im_black = im_grey > range_black(2);
im_blue = im_grey > range_blue(2);
blocks_blue = im_black - im_blue;

%Genero blocks brown
im_brown = im_grey > range_brown(2);
blocks_brown = im_blue - im_brown;

%Genero elementos grises
im_gris = im_grey > range_gris(2);
blocks_gris = im_brown - im_gris;

%Genero blocks green
im_green = im_grey > range_green(2);
blocks_green = im_gris - im_green;

%Genero blocks pink
im_pink = im_grey > range_pink(2);
blocks_pink = im_green - im_pink;

%Genero blocks yellow
im_yellow = im_grey > range_yellow(2);
blocks_yellow = im_pink - im_yellow;

%******* Operacion de cierre y apertura **********

%Cierre
%Una letra no es mucho más que 18*18, tomamos un elemento estructural de ese tamaño
%para eliminarlas
S = ones(18,18);

blocks_blue_closed = iclose(blocks_blue, S);
blocks_brown_closed = iclose(blocks_brown, S);
blocks_green_closed = iclose(blocks_green, S);
blocks_pink_closed = iclose(blocks_pink, S);
blocks_yellow_closed = iclose(blocks_yellow, S);

%Apertura
%Un bloque tiene approx 85x85, tomamos un elemento estructural de un poco mas de 75%
S = ones(65,65);

blocks_blue_clean = iopen(blocks_blue_closed, S);
blocks_brown_clean = iopen(blocks_brown_closed, S);
blocks_green_clean = iopen(blocks_green_closed, S);
blocks_pink_clean = iopen(blocks_pink_closed, S);
blocks_yellow_clean = iopen(blocks_yellow_closed, S);

color_blocks = [blocks_blue_clean blocks_brown_clean blocks_green_clean blocks_pink_clean blocks_yellow_clean];
