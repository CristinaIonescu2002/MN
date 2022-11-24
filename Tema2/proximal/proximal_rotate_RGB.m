function out = proximal_rotate_RGB(img, rotation_angle)
    % =========================================================================
    % Aplica Interpolarea Proximala pentru a roti o imagine RGB cu un unghi dat.
    % =========================================================================
    
    % TODO: Extrage canalul rosu al imaginii.
    rosu=img(:,:,1);
    % TODO: Extrage canalul verde al imaginii.
    verde=img(:,:,2);
    % TODO: Extrage canalul albastru al imaginii.
    albastru=img(:,:,3);
    % TODO: Aplica rotatia pe fiecare canal al imaginii.
    r_rotate=proximal_rotate(rosu,rotation_angle);
    v_rotate=proximal_rotate(verde,rotation_angle);
    a_rotate=proximal_rotate(albastru,rotation_angle);
    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.
    out(:,:,1)=r_rotate;
    out(:,:,2)=v_rotate;
    out(:,:,3)=a_rotate;
endfunction