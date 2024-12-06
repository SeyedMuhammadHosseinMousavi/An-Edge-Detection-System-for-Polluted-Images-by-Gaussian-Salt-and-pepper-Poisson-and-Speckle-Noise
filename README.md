## An Edge Detection System for Polluted Images by Gaussian, Salt and pepper, Poisson and Speckle Noises

### Link to the paper:
- https://www.researchgate.net/publication/318494610_An_Edge_Detection_System_for_Polluted_Images_by_Gaussian_Salt_and_pepper_Poisson_and_Speckle_Noises_DOI_ITCT04_151
- DOI: http://dx.doi.org/10.13140/RG.2.2.19572.04486
### Please cite:
- Mousavi, S. Muhammad Hossein, and Marwa Kharazi. "An edge detection system for polluted images by gaussian, salt and pepper, poisson and speckle noises." 4th National Conference on Information Technology, Computer & TeleCommunication. 2017.

# Edge Detection System for Polluted Images by Gaussian, Salt and Pepper, Poisson, and Speckle Noises

This repository contains the implementation and detailed explanation of the paper titled **"An Edge Detection System for Polluted Images by Gaussian, Salt and Pepper, Poisson, and Speckle Noises"** authored by S. Muhammad Hossein Mousavi and Marwa Kharazi.

---

## 📜 Paper Summary

Edge detection is one of the most critical tasks in image processing, image analysis, and object recognition. However, traditional edge detection methods (e.g., Canny, Sobel, Prewitt) perform poorly on noisy images. This paper introduces a novel edge detection system that is robust against common types of noise such as:
- Gaussian Noise
- Salt and Pepper Noise
- Poisson Noise
- Speckle Noise

The proposed method combines noise reduction, edge sharpening, and post-processing to achieve accurate edge detection even in noisy environments.

---

## 🚀 Proposed Methodology

The proposed system is divided into several key phases:

### 1. **Channel Decomposition and Smoothing**
- **Input**: An RGB image.
- **Process**:
  - The image is split into its three constituent channels: Red (R), Green (G), and Blue (B).
  - A **Median Filter** is applied to each channel to reduce noise without altering the true edge positions.
- **Output**: A smoothed RGB image with reduced noise.

---

### 2. **Edge Sharpening**
- **Input**: Smoothed RGB image.
- **Process**:
  - The smoothed image is converted to grayscale.
  - An **Unsharp Mask Filter** is applied to enhance the edges. This involves subtracting a blurred version of the image from the original, then adding a weighted combination of the original and the sharpened versions.
- **Output**: A grayscale, sharpened image with enhanced edges.

---

### 3. **Custom Edge Detection Filter**
- **Input**: Sharpened grayscale image.
- **Process**:
  - A **3x3 edge detection filter** is applied to the image:
    ```
    [ 0,  1,  0]
    [ 1, -4,  1]
    [ 0,  1,  0]
    ```
  - This filter detects the differences in pixel intensity, highlighting the edges while suppressing noise.
- **Output**: An edge-detected grayscale image.

---

### 4. **Thresholding**
- **Input**: Edge-detected image.
- **Process**:
  - A thresholding operation is performed to convert the image into a binary edge map.
  - All pixel values below the threshold are set to `0`, and those above the threshold are set to `255`.
- **Output**: A binary image highlighting the edges.

---

### 5. **Post-Processing**
- **Input**: Binary edge map.
- **Process**:
  - Morphological operations are applied to remove residual noise and artifacts.
  - **Edge Thinning** is performed using skeletonization to ensure clean and thin edges.
- **Output**: A refined, thinned binary edge map.
![method](https://github.com/user-attachments/assets/bf0b8512-3f21-44a9-a6e1-9cbd9b370359)

---

## 📊 Validation and Evaluation

The system's performance is validated using the following metrics:
1. **Mean Squared Error (MSE)**:
   - Measures the error between the edge-detected noisy image and the reference edge-detected clean image.
   - Lower MSE indicates better performance.

2. **Peak Signal-to-Noise Ratio (PSNR)**:
   - Measures the similarity between the noisy and clean edge-detected images.
   - Higher PSNR (closer to 50) indicates better performance.

3. **Structural Similarity Index (SSIM)**:
   - Evaluates the structural similarity between the noisy and clean images.
   - SSIM ranges from 0 to 1, where values closer to 1 indicate better similarity.
![2](https://github.com/user-attachments/assets/a16d703d-1cd9-4a23-8e71-8108a77a72bd)

---

## 🔬 Key Results

The proposed system is compared with traditional edge detection operators (e.g., Sobel, Prewitt, Canny). Results demonstrate that the proposed method outperforms these operators in terms of robustness against noise and accuracy of edge detection.

### Visual Validation
- The method was tested on a human brain image with the following noise types:
  - **Gaussian Noise**: Mean = 0, Std. Dev. = 0.05.
  - **Salt & Pepper Noise**: Density = 0.1.
  - **Poisson Noise**: Applied directly.
  - **Speckle Noise**: Variance = 0.1.

### Statistical Results
| Metric | Best Noise Type | Value |
|--------|-----------------|-------|
| **MSE** | Salt & Pepper  | 0.019 |
| **PSNR** | Salt & Pepper | 23.88 |
| **SSIM** | Poisson       | 0.9615 |

![res](https://github.com/user-attachments/assets/a12f809a-3980-4303-af47-99fe5b5f5439)

---

## 💡 Advantages

1. **Noise Robustness**: Works effectively on noisy images with minimal sensitivity to noise.
2. **Edge Preservation**: Maintains the true positions of edges.
3. **Multi-Noise Support**: Handles various types of noise, making it suitable for diverse applications.

---

## 🛠️ Future Work

- Extend the system for feature extraction from images.
- Apply the method to real-world noisy datasets for broader validation.

---

## 📖 References

1. **Canny Edge Detection**: Canny, John. "A computational approach to edge detection." IEEE Transactions on Pattern Analysis and Machine Intelligence 6 (1986): 679-698.
2. **PSNR and SSIM**: Wang, Zhou, et al. "Image quality assessment: from error visibility to structural similarity." IEEE transactions on image processing 13.4 (2004): 600-612.
3. **Unsharp Masking**: Gonzalez, Rafael C., Richard E. Woods, and S. Eddins. "Digital Image Processing Using MATLAB, Prentice Hall." Upper Saddle River, NJ (2003).

For a full list of references, refer to the original paper.

---

