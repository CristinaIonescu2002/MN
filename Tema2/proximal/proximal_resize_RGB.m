function out = proximal_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img astfel încât aceasta save fie de dimensiune p x q.
    % Imaginea img este colorata.
    % =========================================================================

    % TODO: Extrage canalul rosu al imaginii.
    rosu=img(:,:,1);
    % TODO: Extrage canalul verde al imaginii.
    verde=img(:,:,2);
    % TODO: Extrage canalul albastru al imaginii.
    albastru=img(:,:,3);
    % TODO: Aplica functia proximal pe cele 3 canale ale imaginii.
    r_resize=proximal_resize(rosu,p,q);
    v_resize=proximal_resize(verde,p,q);
    a_resize=proximal_resize(albastru,p,q);
    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.
    out(:,:,1)=r_resize;
    out(:,:,2)=v_resize;
    out(:,:,3)=a_resize;
endfunction
