# OpenCV Image Processing Toolkit

> A reference implementation of the preprocessing operations that sit in front of every vision
> model.

![OpenCV](https://img.shields.io/badge/OpenCV-5C3EE8?style=flat-square&logo=opencv&logoColor=white)
![NumPy](https://img.shields.io/badge/NumPy-013243?style=flat-square&logo=numpy&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)

---

## Problem Statement

Every computer vision pipeline begins with the same handful of operations, and getting them wrong
silently corrupts everything downstream. This toolkit implements each one explicitly, framed around
the fact that makes them all possible: **OpenCV represents images as NumPy arrays**, so any
manipulation you can express as array indexing or arithmetic is available to you.

## Operations Covered

### Loading & Display
Reading from disk, displaying in a window, and handling the key-press/window-destroy lifecycle
correctly.

### Geometric Transforms
- **Resizing** — with the interpolation-method trade-off between speed and quality
- **ROI cropping** — via direct array slicing, `image[y:y+h, x:x+w]`, which is the clearest
  demonstration that an image really is just an array

### Colour Space Conversion
- BGR → Grayscale (note: OpenCV loads as **BGR**, not RGB — the source of most colour bugs when
  mixing OpenCV with Matplotlib or Keras)
- Colour-space transforms and their use cases

### Channel Filtering
Isolating and suppressing individual colour channels through direct array operations to build
colour filters.

### Persistence
Writing processed images back to disk in a chosen format.

## Key Features

- Each operation implemented and explained independently
- Explicit treatment of the NumPy-array representation underlying every operation
- Before/after display for every transform
- BGR vs. RGB ordering documented where it matters
- Written as a reference to return to, not a one-off script

## Technologies

| Layer | Tools |
|---|---|
| Vision | OpenCV (`cv2`) |
| Arrays | NumPy |

## How to Run

```bash
pip install opencv-python numpy
jupyter notebook notebooks/opencv-toolkit.ipynb
```

Place a test image in `assets/` and update the path in the first cell.

> **Note:** `cv2.imshow()` opens a native window and won't render inline in Jupyter. For inline
> display, convert BGR → RGB and use `matplotlib.pyplot.imshow()`.

## What I Learned

**BGR vs. RGB will cost you a day at some point.** OpenCV loads images as BGR for historical
reasons; almost everything else assumes RGB. The failure mode is quiet — images look wrong in a way
that's easy to attribute to something else, and models trained on channel-swapped data just perform
slightly worse for no visible reason.

**Interpolation method is a real choice.** Downscaling with `INTER_AREA` and upscaling with
`INTER_CUBIC` produce visibly better results than the default, and it's a one-argument change that
most tutorials skip entirely.

**Understanding images as arrays makes everything else obvious.** Once cropping is just slicing and
filtering is just channel arithmetic, you stop looking up OpenCV functions for operations you can
write directly in NumPy.

---

*Course: Deep Learning · OpenCV section*

[← Back to Computer Vision & Speech](../README.md)
