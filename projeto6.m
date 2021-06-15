%% Projeto 06
% *Autor:* Marlon da Silva Rogério

%% Referências
% *GONZALEZ, R. C.*, WOODS, R. E. Processamento de Imagens Digitais. 
% Editora Edgard Blucher, ISBN São Paulo, 2000.
% *Support MathWorks*, 2021. Disponível em: <https://www.mathworks.com/help/>.
% Acesso em: 31 de maio. de 2021.

close all; clear; clc;

%% 0.1 Sobre Cores:
placa_pare = imread('stop.jpeg');
figure;
imshow(placa_pare);
title('Placa "Pare"');

%% 0.2 Red Green Blue
rgb = imread('rgb.png');
figure;
imshow(rgb);
title('Red Green Blue"');

%% 0.3 RGB Diagrama
rgb_diagrama = imread('rgb-diagram.png');
figure;
imshow(rgb_diagrama);
title('Red Green Blue - Diagrama"');

%% 0.4 HSV
hsv = imread('hsv.jpeg');
figure;
imshow(hsv);
title('Hue Saturation Value - Diagrama"');


%% 1 Processamento de Imagens Coloridas (Proposição)
% 1.1 Utilizando a imagem da lua de Jupiter,
% *(Fig0642(a)(jupiter_moon_original).tif)*:
% 1.2 segmente as regiões de ‘cor avermelhada’;
% 1.3 visualize e comente.

%% 2 Processamento de Imagens Coloridas (Aplicação)
RGB = im2double(imread('Fig0628(b)(jupiter-Io-closeup).tif'));
HSV = rgb2hsv(RGB);
RGBgray =rgb2gray(RGB);
figure;
subplot(1,3,1);
imshow(RGB, []);
title('Imagem RGB');
subplot(1,3,2);
imshow(HSV, []);
title('Imagem HSV');
subplot(1,3,3);
imshow(RGBgray, []);
title('Imagem RGBgray');

matiz = HSV(:,:,1);
saturacao = HSV(:,:,2);
intensidade = HSV(:,:,3);

figure;
subplot(1,3,1);
imshow(matiz, []);
title('Matiz');
subplot(1,3,2);
imshow(saturacao, []);
title('Saturação');
subplot(1,3,3);
imshow(intensidade, []);
title('Intecidade');

%% 
% *Binalização da satução*
img_binaria = double(im2bw(saturacao, 0.35));
figure;
imshow(img_binaria);
title('Imagem binária da saturação');

%%
% *Máscara da matiz da saturação para cor vermelha*
mascara = matiz.*img_binaria;
figure;
imshow(mascara);
title('Máscara de saturação pela matiz');
%%
% *Limiarização da máscara*
[M, N,~] = size(RGB);
vetor_mn=zeros(M,N);
vetor_mn(mascara>0.5) = 1;
figure;
imshow(vetor_mn);
title('Limiarização para regiões de intensidade de cor vermelha');

%% 
% *Netivo da imagem resultante*
negativo = imcomplement(vetor_mn);
figure;
imshow(negativo);
title('Negativo da Imagem');
