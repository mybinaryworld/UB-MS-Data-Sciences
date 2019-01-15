Q2_b('square.png' , 2) ;  %This image matrix has a rank of 2
Q2_b('UB.png' , [2 ,20 , 50, 80, 120]) ; %This image matrix has a rank of 244, for each color
Q2_b('futurama.png' , [50 , 100, 300, 600, 800]) ; %This image matrix has a rank of 1000, for each color




%For 'square.png', the image has no information and all the pixels has the
%same value i.e the information is repeated on each pixel. This is also
%confirmed by the fact that it has a rank=2 and thus can be represented using
%only two singular values. We can verify this seeing the image too.

%For 'UB.png', the image is fairly informative but most of the pixels
%appear to have similar information and its rank is 244 for each color.
%From the image we can see that low rank approximation with rank =50 gives
%visually indistinguishabe image from the original one. This is because the
%50 significant singular values are able to retain most of the important
%characteristics of the image.

%For 'futurama.png', we can see that the image is very colorful and has
%more information i.e its pixels have different information. Thus, we can
%infer that it should have more singular values with significant
%magnitude. But still, we can see that the image with low rank
%approximation with rank = 600 is indistinguishable from the original
%image. That means, even including just 600 singular values, the image is
%able to incorporate most the image information.