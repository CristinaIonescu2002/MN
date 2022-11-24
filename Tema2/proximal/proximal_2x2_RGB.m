function out = proximal_2x2_RGB(img, STEP = 0.1)
    % ==============================================================================================
    % Aplica Interpolare Proximala pe imaginea 2 x 2 definita img cu puncte intermediare echidistante.
    % img este o imagine colorata RGB -Red, Green, Blue.
    % =============================================================================================

    % TODO: Extrage canalul rosu al imaginii.
    rosu=img(:,:,1);
    % TODO: Extrage canalul verde al imaginii.
    verde=img(:,:,2);
    % TODO: Extrage canalul albastru al imaginii.
    albastru=img(:,:,3);
    % TODO: Aplic? functia proximal pe cele 3 canale ale imaginii.
    r_2x2=proximal_2x2(rosu,STEP);
    v_2x2=proximal_2x2(verde,STEP);
    a_2x2=proximal_2x2(albastru,STEP);
    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.
    out(:,:,1)=r_2x2;
    out(:,:,2)=v_2x2;
    out(:,:,3)=a_2x2;
endfunction
