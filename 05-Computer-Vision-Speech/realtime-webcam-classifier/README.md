# Real-Time Webcam Classifier

> A trained CNN running live against webcam frames, with predictions overlaid on the video stream.

![OpenCV](https://img.shields.io/badge/OpenCV-5C3EE8?style=flat-square&logo=opencv&logoColor=white)
![Keras](https://img.shields.io/badge/Keras-D00000?style=flat-square&logo=keras&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)

---

## Problem Statement

A model evaluated on a static test set and a model running against a live camera are different
things. Real-time inference introduces constraints that batch evaluation never surfaces:

- Preprocessing has to fit inside the frame budget (~33ms at 30fps)
- Input arrives in the camera's format and resolution, not the training set's
- Lighting, framing, and motion blur are nothing like the curated training distribution
- The capture device is a resource that must be released properly

This project takes a trained classifier and puts it behind a webcam to see what survives.

## Approach

```
┌─────────────────┐
│  cv2.VideoCapture(0)  │  open capture device
└────────┬────────┘
         │  ┌──────── loop per frame ────────┐
         ▼  ▼                                │
    read frame                               │
         ▼                                   │
    resize to model input shape               │
         ▼                                   │
    img_to_array + normalise                 │
         ▼                                   │
    model.predict()                          │
         ▼                                   │
    map index → class name                   │
         ▼                                   │
    cv2.putText overlay + imshow             │
         │                                   │
         └──── 'q' pressed? ─── no ──────────┘
                   │ yes
                   ▼
         release capture + destroyAllWindows
```

## Key Features

- Live webcam capture with per-frame inference
- Preprocessing pipeline matching the training-time transformation exactly — the single most
  common source of degraded live accuracy
- Class-index-to-label mapping for human-readable output
- Prediction overlaid directly onto the video feed with `cv2.putText`
- Clean shutdown: capture released and windows destroyed on exit
- Model loaded once outside the loop rather than per frame

## Technologies

| Layer | Tools |
|---|---|
| Capture & display | OpenCV (`VideoCapture`, `putText`, `imshow`) |
| Inference | Keras (`load_model`, `img_to_array`) |
| Arrays | NumPy |

## How to Run

```bash
pip install opencv-python tensorflow numpy
jupyter notebook notebooks/camera.ipynb
```

You'll need a trained `.h5` model in `models/` and the class-name list updated to match its output
ordering. Press **`q`** in the video window to quit.

> Requires a physical webcam. Won't run in a headless environment or most cloud notebooks.

## What I Learned

**Train/inference preprocessing mismatch is the classic bug.** My first version normalised
differently at inference than during training, and accuracy collapsed in a way that looked like a
model problem. The preprocessing function should be written once and shared by both paths — not
reimplemented.

**Live input is nothing like the test set.** A model at high test accuracy became noticeably
unreliable against a webcam: different lighting, off-centre framing, motion blur, and backgrounds
the training set never contained. It's the most direct demonstration of distribution shift I've
built.

**Resource cleanup is not optional.** Forgetting `cap.release()` leaves the camera locked and the
kernel needing a restart — a lesson learned the tedious way, several times.

---

*Course: Deep Learning · Project extension*

[← Back to Computer Vision & Speech](../README.md)
