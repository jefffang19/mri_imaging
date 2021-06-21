% part 1.1
k_space_data = load('K_space_data.mat');
imshow(abs(k_space_data.K_space_slice18), [])

% part 1.2
X = ifft2(k_space_data.K_space_slice18);
imshow(abs(X), [])