function [temp_Im]=Thin_HnM(sharp)

% Hit and Miss Morphological Thinning Algorithm
%  clear all
%  I = imread('c:\o\777.jpg');          % Read image
%  I=im2bw(I);
%  I=imcomplement(I);
I=sharp;
I_bw = im2bw(I,graythresh(I));  % Convert image to grayscale
[h, w] = size(I_bw);
temp_Im = I_bw;                 % For iteration purposes
imshow(I_bw);
figure;
%% Structuring elements
Data                            % Load data
%% Hit and Miss algorithm
r = 0;                          % Moving through Kernals
count = 0;                      % Exiting criteria
while 1 == 1
    if r < 8                    % Looping through the structuring elements
        r = r + 1;
    else
        r = 1;
    end
    strel1 = C(:,:,r);          % Structuring element
    idx = idxset(r,:);          % Eliminate 'do not care' terms
    
    HnM = false(h,w);           % definition...
    
    for i = 2:h-1
        for j = 2:w-1
            el1 = temp_Im(i-1:i+1,j-1:j+1);  % Image element
            if el1(5)                   % This is a gamble to save time...
                if isequal(strel1(idx),el1(idx))    % Erosion
                    HnM(i,j) = true;                % Save result
                end
            end
        end
    end

    %% Difference computation
    difference = and(temp_Im,~HnM);     % Set difference (theory)
    
    if isequal(difference,temp_Im)      % No more changes
        count = count + 1;              % Counter ++
    else
        count = 0;                      % Changes between previous and current - reset counter
        temp_Im = difference;           % Replace previous with current
        
        % Output
        % Comment to suppress animation (saves time)
        imshow(temp_Im)
        drawnow
    end
    if count == 8                       % All structuring elements have failed to make a change
        output = temp_Im;
        break                           % Stopping criteria
    end
end
end