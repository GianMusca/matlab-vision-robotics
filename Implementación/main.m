%% Preparación del espacio de trabajo.
clear all close all clc

%Carga de imagen.
imgrey_d = iread('PROBAME_G3.jpg', 'grey');  %imagen en escala de grises, double

%Tamaño de imagen.
size_img = size(imgrey_d);
fila = size_img(1);
columna = size_img(2);

%% Imagenes de cuadrados por cada color.
%se obtiene una matriz que contiene 5 imágenes. Cada una tiene un filtrado
%de los cuadrados de cada color.
%El orden de los colores es en base a su nivel en escala de grises.
color_blocks = get_color_blocks(imgrey_d);

%% Iteracion por cada color identificando letras en cuadrados
%Se obtienen los templates de cada letra, en base a una imagen de base.
templates = get_templates();
colors = ["Blue", "Brown", "Green", "Pink", "Yellow"];  %Array auxiliar

for i = 0:length(colors)-1
    
    fprintf('%s: ', colors(i+1))    %Color iterado
    
    %Identificación de coordenadas de cuadrados por color
    img = color_blocks(:, i * columna+1:(i+1) * columna);   %Se analiza un solo color
    corners = get_squares_coord(img);   %coordenadas de cuadrados del color
    squares_num = size(corners);        %cantidad de cuadrados por color
    
    %Identificación de letras
    for j = 1: squares_num(3)
        %Se analiza un solo cuadrado del color
        img_square = get_square(imgrey_d, corners(:,:,j));
        %Detección de la letra más probable en el cuadrado
        letter = find_letter(double(img_square), templates, double(imgrey_d));
        fprintf(letter)
    end
    fprintf('\n')
end