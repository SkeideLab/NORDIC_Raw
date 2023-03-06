% go through phase images in folder
% specify all phase images in one path using wildcard *
imgs_path='/<path>/sub-test1/ses-pilot/func/sub-test1_ses-pilot_task-task1_run-*_part-phase_bold.nii.gz'

phase_imgs=dir(imgs_path)
disp(phase_imgs)
[filepath,name,ext]=fileparts(imgs_path)
ARG.DIROUT=strcat(filepath,'/')

%iterate through all images
for k=1:numel(phase_imgs)

    % get name of phase img
    phase_img=strcat(phase_imgs(k).folder,'/',phase_imgs(k).name)

    % find corresponding mag image
    mag_img=erase(phase_img,'_part-phase')

    % find name of nordic out image: delete acq part and replace with acq-nordic
    [startIndex,endIndex]=regexp(mag_img,'_acq-[a-zA-Z0-9]*_')
    nordic_img_path=strcat(mag_img(1:startIndex-1),'_acq-NORDIC_',mag_img(endIndex+1:end))
    % cut off extension and path
    [filepath,nordic_img_nii,ext]=fileparts(nordic_img_path)
    [filepath,nordic_img,ext]=fileparts(nordic_img_nii)
    disp(nordic_img)

    % call nordic
    ARG.temporal_phase=1;
    ARG.phase_filter_width=10;
    NIFTI_NORDIC(mag_img,phase_img,nordic_img,ARG)
end




% call nordic
