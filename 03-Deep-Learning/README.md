# 02 — Deep Learning

Neural architectures, built two ways: from first principles with manual backpropagation, and from
the top down with transfer learning on pretrained backbones.

This is the largest category in the portfolio and the one that best represents where my interest
sits. Most projects here are structured as controlled comparisons — same data, same training
budget, different architecture — so the result is a *ranking* rather than a single number.

---

## Projects

### [CNN Architecture Comparison](cnn-architecture-comparison/)
Three architectures trained on identical image data: a hand-designed CNN with batch normalization
and dropout, a transfer-learned VGG16, and a ResNet. Isolates the effect of depth and pretrained
features on accuracy.

`TensorFlow` `Keras` `VGG16` `ResNet` `ImageDataGenerator`

### [Multi-Output CNN — Animal + Colour](multi-output-cnn-animal-color/)
A single network with two output heads predicting animal class and coat colour from one forward
pass. **98.85% colour accuracy, 79.22% animal accuracy.** The gap between the two heads is the
interesting part.

`TensorFlow` `Keras` `Multi-task learning`

### [MNIST Neural Network from Scratch](mnist-neural-network-from-scratch/)
Forward and backward propagation implemented manually — no high-level training loop. Sweeps
activation functions, hidden-layer widths, and learning rates with plotted convergence curves for
each configuration.

`NumPy` `PyTorch` `MNIST`

### [CIFAR-10 & CIFAR-100 Classifiers](cifar-cnn-classifiers/)
The same convolutional architecture applied to both the 10-class and 100-class CIFAR benchmarks,
showing how performance degrades as label granularity increases tenfold.

`TensorFlow` `Keras` `OpenCV`

### [Regularization & Augmentation Ablation](regularization-augmentation-study/)
A controlled study of L1 regularization, L2 regularization, dropout, and data augmentation applied
to the same base network, quantifying each technique's effect on the train/validation gap.

`Keras` `scikit-learn`

---

## Skills Demonstrated

- Convolutional architecture design: conv/pool stacks, batch normalization, dropout, dense heads
- Transfer learning with frozen and fine-tuned pretrained backbones (VGG16, ResNet)
- Multi-task learning with shared encoders and task-specific loss weighting
- Manual implementation of forward/backward propagation and gradient descent
- Data augmentation pipelines with `ImageDataGenerator`
- Training instrumentation: checkpointing, early stopping, learning-curve diagnostics
- Regularization ablation and overfitting diagnosis

---

[← Back to portfolio root](../README.md)
