function templates = get_templates()
% GET_TEMPLATES  Devuelve imagenes limpias con los bloques asociados a cada color
%   templates = get_templates()
%   
%   templates: lista con 27 imagenes de 15x15, cada una letra
%       las letras son extraídas del archivo de base.

%Cargamos imagen de template de muestra
im=iread('template.jpg');
im_d=idouble(im);

imgrey_d=imono(im_d);   %imagen en escala de grises, double

%********** LETRAS **********
% Letra A
templateA = imgrey_d(90:104,932:946);
A = 1 - templateA ;

% Letra B
templateB = imgrey_d(114:128,932:946);
B = 1 - templateB ;

% Letra C
templateC = imgrey_d(136:150,932:946);
C = 1 - templateC ;

% Letra D
templateD = imgrey_d(160:174,932:946);
D = 1 - templateD ;

% Letra E
templateE = imgrey_d(182:196,932:946);
E = 1 - templateE ;

% Letra F
templateF = imgrey_d(206:220,932:946);
F = 1 - templateF ;

% Letra G
templateG = imgrey_d(229:243,933:947);
G = 1 - templateG ;

% Letra H
templateH = imgrey_d(252:266,932:946);
H = 1 - templateH ;

% Letra I
templateI = imgrey_d(275:289,931:945);
I = 1 - templateI ;

% Letra J
templatJ = imgrey_d(298:312,932:946);
J = 1 - templatJ ;

% Letra K
templatK = imgrey_d(320:334,933:947);
K = 1 - templatK ;

% Letra L
templatL = imgrey_d(343:357,932:946);
L = 1 - templatL ;

% Letra M
templatM = imgrey_d(366:380,934:948);
M = 1 - templatM ;

% Letra N
templatN = imgrey_d(390:404,932:946);
N = 1 - templatN ;

% Letra Ñ
templatNIE = imgrey_d(411:425,933:947);
NIE = 1 - templatNIE;

% Letra O
templateO = imgrey_d(435:449,933:947);
O = 1 - templateO ;

% Letra P
templateP = imgrey_d(459:473,932:946);
P = 1 - templateP ;

% Letra Q
templateQ = imgrey_d(482:496,933:947);
Q = 1 - templateQ ;

% Letra R
templateR = imgrey_d(505:519,933:947);
R = 1 - templateR ;

% Letra S
templateS = imgrey_d(528:542,932:946);
S = 1 - templateS ;

% Letra T
templateT = imgrey_d(551:565,932:946);
T = 1 - templateT ;

% Letra U
templateU = imgrey_d(573:587,933:947);
U = 1 - templateU ;

% Letra V
templateV = imgrey_d(596:610,933:947);
V = 1 - templateV ;

% Letra W
templateW = imgrey_d(619:633,935:949);
W = 1 - templateW ;

% Letra X
templateX = imgrey_d(643:657,933:947);
X = 1 - templateX ;

% Letra Y
templateY = imgrey_d(666:680,933:947);
Y = 1 - templateY ;

% Letra Z
templateZ = imgrey_d(688:702,933:947);
Z = 1 - templateZ ;

templates = [A B C D E F G H I J K L M N NIE O P Q R S T U V W X Y Z];
