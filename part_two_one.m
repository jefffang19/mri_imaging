% part 2.1

low_pass_filter(1:224, 1:216)=0;
low_pass_filter(53:171, 51:165)=1;
%plot low pass filter
figure
subplot(1,3,1)
imshow(low_pass_filter)
title('low pass filter')

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
k_space = k_space.*low_pass_filter;

X = ifft2(k_space);
subplot(1,3,3)
imshow(abs(X), [])
title('filtered magnitude image')