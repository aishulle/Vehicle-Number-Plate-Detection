close all;
clear all;

[path, file] = uigetfile('*.png', 'Select Image');
og=imread(fullfile(file, path));
im = imread(fullfile(file, path));
imgray = rgb2gray(im);
imbin = imbinarize(imgray);
im = edge(imgray, 'prewitt');

%location of the number plate
Iprops=regionprops(im,'BoundingBox','Area', 'Image');
area = Iprops.Area;
count = numel(Iprops);
maxa= area;
boundingBox = Iprops.BoundingBox;
for i=1:count
   if maxa<Iprops(i).Area
       maxa=Iprops(i).Area;
       boundingBox=Iprops(i).BoundingBox;
   end
end    

im = imcrop(imbin, boundingBox); % crop the number plate area
im = bwareaopen(~im, 500); % remove small or large objects

[h, w] = size(im); % get width and height

% Output
figure;
subplot(2, 2, 1); 
imshow(og);
title('Original Image');

subplot(2, 2, 2); 
imshow(imgray);
title('Grayscale Image');

subplot(2, 2, 3); 
imshow(imbin);
title('Binary Image');

subplot(2, 2, 4); 
imshow(im);
title('Number Plate Image');

% extract the characters from the number plate region
Iprops = regionprops(im, 'BoundingBox', 'Area', 'Image'); % read letter
count = numel(Iprops);
noPlate = ''; %number plate string.

for i = 1:count
    ow = length(Iprops(i).Image(1, :));
    oh = length(Iprops(i).Image(:, 1));
    if ow < (h / 2) && oh > (h / 3)
        letter = Letter_detection(Iprops(i).Image); % Detect the letter corresponding to the binary image
        noPlate = [noPlate letter]; % Append every character.
    end
end

% Display the final number plate output
disp(['Number Plate: ', noPlate]);
