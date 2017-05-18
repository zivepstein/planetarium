%editable parameters
unique_frames = 2332;
duplication = 3;
scale = 1;
zenith_rate = 0.75;

%fixed parameters
confscale = 1.5;
canvas = imread('black_canvas.jpg');
canvas_size = size(canvas);
r = canvas_size(1)/2;
angles = csvread('angles_2017-05-01.csv');
yaws = angles(:,2);
pitches = angles(:,1);

index = 0;
for i = 1:unique_frames
    local_canvas = canvas;
    file_name = strcat('images-f/image',sprintf('%03d',i+4),'.jpg');
    I = imread(file_name);
%     imshow(I);
    yaw = yaws(i);
    pitch = pitches(i);
    t = @(x) x(:,1).*-pi/15; %10 is good too
    f = @(x) [x(:,1).*cos(t(x))+x(:,2).*sin(t(x)),-x(:,1).*sin(t(x))+x(:,2).*cos(t(x))];
    g = @(x, unused) f(x);
    tform = maketform('custom', 2, 2, [], g, []);
    IM = imtransform(I, tform, 'UData', [-1 1], 'VData', [-1 1], ...
       'XData', [-1*confscale confscale], 'YData', [-1*confscale confscale]);
    dimz_b = size(IM);
    IM =  imresize(IM,1920/dimz_b(2));
    reshaped_image = flipdim(IM ,2);
    scale_value = scale*((2-2*zenith_rate)*((1/2)+(90-pitch)/180) + 2*zenith_rate-1);
    reshaped_image = imresize(reshaped_image, scale_value);
    dimz = size(reshaped_image);
    yshift = 2*r - dimz(1) - round((r- dimz(1)/2)*pitch/90);
    xshift = r - dimz(2)/2;
    local_canvas(1+yshift:dimz(1)+yshift,1+xshift:dimz(2)+xshift,:) =  reshaped_image;
    rot_canvas = imrotate(local_canvas,yaw);
    size_rot_canvas = size(rot_canvas);
    pad = 1+round((size_rot_canvas(1)-2*r)/2);
    crop_canvas = rot_canvas(pad:pad+2*r-1, pad:pad+2*r-1,:);
    for j = 1:duplication
        index = index + 1;
        out_name = strcat('lizard-scenFscal1d3/lizard_',sprintf('%04d',index),'.jpg');
        imwrite(crop_canvas, out_name); %(1:4096,1:4096,:)
    end
    %imshow(local_canvas);
end

