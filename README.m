% EECS490 Homework Assignment #1
% June 17, 2020
% Name: Ellis Saupe
% NetworkID / email: ems236@case.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instructions: All source images are assumed to be in a folder at the
% relative path provided.  All output images are written to the folder
% provided
% 
%  Arguments: string path to source image directory,
%  string path to output image/plot directory

%  run the readme from terminal / cmd: 
%  matlab -r "README "..\srcImages\" "..\destImages\""
%
% Problem 1.1: Color to Gray-Scale
% Implementation: Pixel level brightness transformation
% M-file name: toGrayScale.m
% Usage: new_image = toGrayScale(img)
% Output image: library_gray.raw
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function []=README(inputDir, outputDir)
disp("Running toGrayScale...");
f1 = figure;
title("Gray-Scale Conversion");
library_color = readraw_color(inputDir + "library_color.raw");
Gray = toGrayScale(library_color);
imshow(Gray);
disp(outputDir);
writeraw(Gray, outputDir + "library_gray.raw");
disp("writing to " + outputDir + "library_gray.raw");
saveas(f1, outputDir + "library_gray.png");

% Problem 1.2: Adding watermark
% Implementation: Overwritting pixels where watermark is below a whiteness threshold
% M-file name: toGrayScale.m
% Usage: new_image = waterMarkedCenterBW(BWimg, BWwatermark)
%        or new_image = waterMarkedCenterColor(ColorImg, colorWatermark)
% Output image: library_color_marked.raw and library_gray_marked.raw
f2 = figure;
title("Colored Watermark");
disp("Running waterMarkedCenterColor...");
toMark = readraw_color(inputDir + "library_color.raw");
mark = readraw_color(inputDir + "cwru_logo_color.raw");

marked = waterMarkedCenterColor(toMark, mark);
imshow(marked);
writeraw_color(marked, outputDir + "library_color_marked.raw");
disp("writing to " + outputDir + "library_color_marked.raw");
saveas(f2, outputDir + "library_color_marked.png");

f3 = figure;
title("Black and White Watermark");
disp("Running waterMarkedCenterBW...");
mark = readraw(inputDir + "cwru_logo_gray.raw");
toMark = toGrayScale(toMark);

marked = waterMarkedCenterBW(toMark, mark);
imshow(marked);
writeraw(marked, outputDir + "library_gray_marked.raw");
saveas(f3, outputDir + "library_gray_marked.png");
disp("writing to " + outputDir + "library_gray_marked.raw");

% Problem 1.3: Creating image negative
% Implementation: Pixel level transform -- (-1 * amplitude) mod 255
% M-file name: negativeImg.m
% Usage: new_image = negativeImg(img)
% Output image: jet_negative.raw
% Output plots: jet_histogram.png, jet_negative_histogram.png
f4 = figure;
title("Negative Image");
disp("Running negativeImg...");
jet = readraw_color(inputDir + "F-16.raw");
negJet = negativeImg(jet);
imshow(negJet);
writeraw_color(negJet, outputDir + "jet_negative.raw");
saveas(f4, outputDir + "jet_negative.png");

f5 = figure;
title("Original Histogram");
jetHist = histFor(jet, 3);
jetChart = bar(jetHist);
jetChart(1).FaceColor = "r";
jetChart(2).FaceColor = "g";
jetChart(3).FaceColor = "b";

saveas(f5, outputDir + "jet_histogram.png");

f6 = figure;
title("Negative Histogram");
negHist = histFor(negJet, 3);
negChart = bar(negHist);
negChart(1).FaceColor = "r";
negChart(2).FaceColor = "g";
negChart(3).FaceColor = "b";

saveas(f6,  outputDir + "jet_histogram.png");

disp("writing to " + outputDir + "jet_negative.raw");
disp("writing plots to " + outputDir + "jet_histogram.png and jet_negative_histogram.png");

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% %%