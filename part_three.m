k_space_data = load('K_space_data.mat');
X = ifft2(k_space_data.K_space_slice18);

% create Brain ROI
BW = imbinarize(abs(X),0.09);
se = strel('line',11,90);
BW = imdilate(BW,se);
BW = imdilate(BW,se);
BW = imdilate(BW,se);
BW = imdilate(BW,se);

figure
subplot(1,2,1)
imshow(abs(X))
title('origin image')
subplot(1,2,2)
imshow(abs(BW))
title('roi')

signal = mean(abs(X) .* BW, 'all');
noise = std(abs(X) .* (1 - BW),0, 'all');

% origin image
signal/noise

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% low pass filter
low_pass_filter(1:224, 1:216)=0;
low_pass_filter(53:171, 51:165)=1;
% apply filter
k_space = k_space_data.K_space_slice18;
k_space = k_space.*low_pass_filter;
X = ifft2(k_space);

signal = mean(abs(X) .* BW, 'all');
noise = std(abs(X) .* (1 - BW),0, 'all');

% origin image
signal/noise

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
Hs = hamming(224);
Hp = hamming(216);

hamming_window = Hs * Hp.';
% apply filter
k_space = k_space_data.K_space_slice18;
k_space = k_space.*hamming_window;
X = ifft2(k_space);

signal = mean(abs(X) .* BW, 'all');
noise = std(abs(X) .* (1 - BW),0, 'all');

% origin image
signal/noise