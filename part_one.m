% part 1.1
k_space_data = load('K_space_data.mat');
figure
subplot(1,2,1)
imshow(abs(k_space_data.K_space_slice18), [])
title('k-space')

% part 1.2
X = ifft2(k_space_data.K_space_slice18);
subplot(1,2,2)
imshow(abs(X), [])
title('magnitude image')