function Q2_b(img , rank_array)
    a_size = size(rank_array);
    figure
    subplot(2, 3, 1) ;
    imshow(img);
    xlabel('Original Image')
    for i=2:a_size(2)+1
        approx_image_mat = Q2_a(img, rank_array(i-1));
        subplot(2, 3, i) ;
        imshow(approx_image_mat);
        xlabel(['Rank = ', num2str(rank_array(i-1))])
    end 
