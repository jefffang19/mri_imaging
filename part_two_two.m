
% part 2.2
% hamming window
Hs = hamming(224);
Hp = hamming(216);

hamming_window = Hs * Hp.';
figure
subplot(1,3,1)
imshow(hamming_window)
title('hamming window')

%plot origin magnnitude image
k_space_data = load('K_space_data.mat');
k_space = k_space_data.K_space_slice18;

X = ifft2(k_space);
subplot(1,3,2)
imshow(abs(X), [])
title('original magnitude image')

%plot filtered magnnitude image
% apply filter
k_space = k_space_data.K_space_slice18;
k_space = k_space.*hamming_window;

X = ifft2(k_space);
subplot(1,3,3)
imshow(abs(X), [])
title('filtered magnitude image')