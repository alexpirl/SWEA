% Listare camere conectate
camList = webcamlist;
disp('Camere detectate:');
disp(camList);

% Alege camerele (modifică indexii dacă ordinea nu este corectă)
cam_st = webcam(1);   % camera stanga
cam_dr = webcam(2);   % camera dreapta

% Optional: seteaza rezoluția
cam_st.Resolution = '1280x720';
cam_dr.Resolution = '1280x720';
% Creeaza folderele daca nu exista
folder_st = 'camera_stanga';
folder_dr = 'camera_dreapta';

if ~exist(folder_st, 'dir')
    mkdir(folder_st);
end

if ~exist(folder_dr, 'dir')
    mkdir(folder_dr);
end

pause(1); % stabilizare

% Captura aproape simultana
img_st = snapshot(cam_st);
img_dr = snapshot(cam_dr);

% Timpul curent pt nume de fișier unic
timestamp = datestr(now,'yyyymmdd_HHMMSS_FFF');

% Salvare imagini
file_st = fullfile(folder_st, ['stanga_' timestamp '.jpg']);
file_dr = fullfile(folder_dr, ['dreapta_' timestamp '.jpg']);

imwrite(img_st, file_st);
imwrite(img_dr, file_dr);

fprintf('Salvat: %s\n', file_st);
fprintf('Salvat: %s\n', file_dr);

% Inchidere camere
clear cam_st cam_dr;

disp('Captura realizata si salvata cu succes!');
