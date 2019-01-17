function   [X,Y,W,H,c] = face_detector(image)

%module 1
   p_image = face_processor(image);
    
    
    %load the average face
     ave_face = load('data/pattern');
     face_pattern = ave_face.new_pattern;

%module 2
    %call boxsanner to box the face
    [X,Y,W,H,c] = boxsanner(p_image,face_pattern);
end