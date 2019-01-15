function approx_img_mat = Q2_a(img , p)
    img_mat = double(imread(img));
    
    if ndims(img_mat) == 3
        [u_r, s_r, v_r] = svd(img_mat(:,:,1));
        [u_g, s_g, v_g] = svd(img_mat(:,:,2));
        [u_b, s_b, v_b] = svd(img_mat(:,:,3));

        r = uint8(u_r(:,1:p)*s_r(1:p,1:p)*v_r(:,1:p)');
        g = uint8(u_g(:,1:p)*s_g(1:p,1:p)*v_g(:,1:p)');
        b = uint8(u_b(:,1:p)*s_b(1:p,1:p)*v_b(:,1:p)');
        approx_img_mat = cat(3,r,g,b);
    else
        [U, S, V] = svd(img_mat);
        approx_img_mat = U(:,1:p)*S(1:p,1:p)*V(:,1:p)';
    end
end