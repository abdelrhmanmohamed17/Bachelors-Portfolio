# 04 — Computer Vision & Speech

Image processing fundamentals, real-time inference, and audio pipelines — the projects where a
model has to run against live input rather than a static test set.

---

## Projects

### [OpenCV Image Processing Toolkit](opencv-image-processing/)
A reference implementation covering image loading, resizing, ROI cropping, colour-space
conversion, channel filtering, and grayscale persistence — framed around OpenCV's representation of
images as NumPy arrays, which is what makes arbitrary pixel manipulation possible.

`OpenCV` `NumPy`

### [Real-Time Webcam Classifier](realtime-webcam-classifier/)
Captures webcam frames, preprocesses each to the trained model's input shape, runs inference, and
overlays the predicted class label live. The interesting constraint here is latency: preprocessing
has to fit inside the frame budget.

`OpenCV` `Keras`

### [Arabic Speech Recognition](arabic-speech-recognition/) *(team project)*
A multi-phase speech system: data collection and preparation → model training → evaluation →
deployment behind a FastAPI service. Includes an Arabic text-to-speech dataset pipeline that turns
raw sources into a structured, model-ready corpus.

`TensorFlow` `FastAPI` `Audio preprocessing`

---

## Skills Demonstrated

- OpenCV image manipulation: geometric transforms, colour spaces, channel-wise filtering
- Real-time video capture and frame-by-frame inference
- Model input preprocessing under latency constraints
- Audio dataset collection, cleaning, and structuring
- Serving a trained model over HTTP with FastAPI
- Multi-phase project execution across a team

---

[← Back to portfolio root](../README.md)
