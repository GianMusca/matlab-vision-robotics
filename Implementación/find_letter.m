function letter = find_letter(square, templates, imgrey_d)
% FIND_LETTER  La letra más probable de estar dentro del bloque.
%   letter = find_letter(square, templates, imgrey_d)
%   
%   -letter: letra con mayor probabilidad.
%   -square: coordenadas de un bloque, asumimos que hay una sola letra dentro
%   del bloque.
%   -templates: array de imágenes de template de las letras, ordenadas.
%   -imgrey_d: imagen original en dónde buscar el bloque y la letra. 

%Lista de letras
letras = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','Ñ','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
N = size(letras);

square=imono(square);   %imagen en escala de grises, double

letter = '';
maxvalue = 0;

%Se itera comparando contra todas las letras y quedamos con el máximo pico
for i = 1:N(2)
    Detect=isimilarity(templates(1:15,(i-1)*15 +1: (i)*15),square); % Comparación cuadrado y template de letra(i)
    [max,p] = peak2(Detect, 1, 'npeaks', 1);    % Medimos pico de intensidad contra esa letra
    if max > maxvalue
        letter = letras(i); %En caso de ser la mayor de todas, 
        maxvalue = max;
    end
end

%Caso detección Ñ: agrandamos el tamaño del template para N y Ñ para
%lograr una mejor detección. No vale la pena generalizar la Ñ porque
%queremos mantener el tamaño del template al mínimo para mejorar la
%detección.(Fue la solución que encontramos. Al agrandar todos los templates
%se producian colisiones).

if letter == 'N'
    im=iread('template.jpg');
    im_d=idouble(im);
    imgrey_d=imono(im_d);
    
    % Letra N
    templatN = imgrey_d(389:405,931:947);
    Ntemp = 1 - templatN ;

    % Letra Ñ
    templatNIE = imgrey_d(409:425,932:948);
    NIEtemp = 1 - templatNIE ;
    
    DetectN=isimilarity(Ntemp,square);
    [maxN,pN] = peak2(DetectN, 1, 'npeaks', 1);
    DetectNIE=isimilarity(NIEtemp,square);
    [maxNIE,pNIE] = peak2(DetectNIE, 1, 'npeaks', 1);
    if maxN > maxNIE
        letter = 'N';
    else
        letter = 'Ñ';
    end
end

        
