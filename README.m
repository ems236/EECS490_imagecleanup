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


% Problem 2.i: Linear contrast enhancement
% Implementation: Full range linear scaling
% M-file name: contrastLinearScaled.m
% Usage: new_image = contrastLinearScaled(img)% sets new bounds to 0, 255
% Output image: rose_dark_linear.raw, rose_mid_linear.raw, rose_light_linear.raw 
% Output plots: rose_dark_hist.png, rose_mid_hist.png, rose_light_hist.png,
%   rose_dark_linear_hist.png, rose_mid_linear_hist.png,
%   rose_light_linear_hist.png, rose_dark_linear_transfer.png,
%   rose_mid_linear_transfer.png, rose_light_linear_transfer.png,
dark = readraw(inputDir + "rose_dark.raw");
mid = readraw(inputDir + "rose_mid.raw");
bright = readraw(inputDir + "rose_bright.raw");

f7 = figure;
disp("Running linear scaling...");

darkScaled = contrastLinearScaled(dark);
imshow(darkScaled);
writeraw(darkScaled, outputDir + "rose_dark_linear.raw");
saveas(f7,  outputDir + "rose_dark_linear.png");

f8 = figure;
bar(histFor(dark, 1));
title("Original Dark Rose");
saveas(f8,  outputDir + "rose_dark_hist.png");

f9 = figure;
bar(histFor(darkScaled, 1));
title("Linearly Scaled Dark Rose");
saveas(f9,  outputDir + "rose_dark_linear_hist.png");

f10 = figure;
[xvals, yvals] = linearTransferFunc(dark);
plot(xvals, yvals);
title("Dark Rose Linear Scaling Transfer Function");
saveas(f10,  outputDir + "rose_dark_linear_transfer.png");

f11 = figure;
midScaled = contrastLinearScaled(mid);
imshow(midScaled);
writeraw(midScaled, outputDir + "rose_mid_linear.raw");
saveas(f11,  outputDir + "rose_mid_linear.png");

f12 = figure;
bar(histFor(mid, 1));
title("Original Mid Rose");
saveas(f12,  outputDir + "rose_mid_hist.png");

f13 = figure;
bar(histFor(midScaled, 1));
title("Linearly Scaled Mid Rose");
saveas(f13,  outputDir + "rose_mid_linear_hist.png");

f14 = figure;
[xvals, yvals] = linearTransferFunc(mid);
plot(xvals, yvals);
title("Mid Rose Linear Scaling Transfer Function");
saveas(f14,  outputDir + "rose_mid_linear_transfer.png");

f15 = figure;
brightScaled = contrastLinearScaled(bright);
imshow(brightScaled);
writeraw(brightScaled, outputDir + "rose_bright_linear.raw");
saveas(f15,  outputDir + "rose_bright_linear.png");

f16 = figure;
bar(histFor(bright, 1));
title("Original Bright Rose");
saveas(f16,  outputDir + "rose_bright_hist.png");

f17 = figure;
bar(histFor(brightScaled, 1));
title("Linearly Scaled Bright Rose");
saveas(f17, outputDir + "rose_bright_linear_hist.png");

f18 = figure;
[xvals, yvals] = linearTransferFunc(bright);
plot(xvals, yvals);
title("Bright Rose Linear Scaling Transfer Function");
saveas(f18, outputDir + "rose_bright_linear_transfer.png");

% Problem 2.ii: Histogram Equalization contrast enhancement
% Implementation: Histogram Equalization with uniform cdf
% M-file name: contrastHistogramEqualized.m
% Usage: new_image = contrastHistogramEqualized(img)
% Output image: rose_dark_histEq.raw, rose_mid_histEq.raw, rose_light_histEq.raw 
% Output plots: rose_dark_histEq_hist.png, rose_mid_histEq_hist.png, rose_light_histEq_hist.png,
%   rose_dark_histEq_transfer.png, rose_mid_histEq_transfer.png,
%   rose_histEq_linear_transfer.png,

disp("Running histogram equalization...");
f19 = figure;
darkHistEq = contrastHistogramEqualized(dark);
imshow(darkHistEq);
writeraw(darkHistEq, outputDir + "rose_dark_histEq.raw");
saveas(f19,  outputDir + "rose_dark_histEq.png");

f20 = figure;
bar(histFor(darkHistEq, 1));
title("Histogram Equalized Dark Rose");
saveas(f20, outputDir + "rose_dark_histEq_hist.png");

f21 = figure;
[xvals, yvals] = histogramTransferFunc(dark);
plot(xvals, yvals);
title("Dark Rose Histogram Equalization Transfer Function");
saveas(f21, outputDir + "rose_dark_histEq_transfer.png");

f22 = figure;
midHistEq = contrastHistogramEqualized(mid);
imshow(midHistEq);
writeraw(midHistEq, outputDir + "rose_mid_histEq.raw");
saveas(f22,  outputDir + "rose_mid_histEq.png");

f23 = figure;
bar(histFor(midHistEq, 1));
title("Histogram Equalized Mid Rose");
saveas(f23, outputDir + "rose_mid_histEq_hist.png");

f24 = figure;
[xvals, yvals] = histogramTransferFunc(mid);
plot(xvals, yvals);
title("Mid Rose Histogram Equalization Transfer Function");
saveas(f24, outputDir + "rose_mid_histEq_transfer.png");

f25 = figure;
brightHistEq = contrastHistogramEqualized(bright);
imshow(brightHistEq);
writeraw(brightHistEq, outputDir + "rose_bright_histEq.raw");
saveas(f25,  outputDir + "rose_bright_histEq.png");

f26 = figure;
bar(histFor(brightHistEq, 1));
title("Histogram Equalized Mid Rose");
saveas(f26, outputDir + "rose_bright_histEq_hist.png");

f27 = figure;
[xvals, yvals] = histogramTransferFunc(bright);
plot(xvals, yvals);
title("Bright Rose Histogram Equalization Transfer Function");
saveas(f27, outputDir + "rose_bright_histEq_transfer.png");
end

% Problem 3: Histogram Equalization contrast enhancement
% Implementation: Histogram Equalization with uniform cdf
% M-file name: contrastHistogramEqualized.m
% Usage: new_image = contrastHistogramEqualized(img)
% Output image: rose_dark_histEq.raw, rose_mid_histEq.raw, rose_light_histEq.raw 
% Output plots: rose_dark_histEq_hist.png, rose_mid_histEq_hist.png, rose_light_histEq_hist.png,
%   rose_dark_histEq_transfer.png, rose_mid_histEq_transfer.png,
%   rose_histEq_linear_transfer.png,