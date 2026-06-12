# CommonShimmer
A clean and smooth shimmer loading effect widget for Flutter. Build with basic Flutter widgets `ShaderMask`

## Usage Example

```dart
CommonShimmer(
  height: 180,
  width: 300,
  children: [
    ShimmerBox(height: 20, width: 180),
    const SizedBox(height: 12),
    ShimmerBox(height: 20, width: 220),
    const SizedBox(height: 20),
    ShimmerBox(height: 45),
  ],
),
```

### ShimmerBox Widget

```dart
ShimmerBox(height: 16, width: 140),           // Normal box
ShimmerBox(isCircle: true, height: 60),       // Circle
ShimmerBox(isChip: true, width: 90),          // Chip style
```
### Parameters

- **`children:`** List of widgets to show with shimmer effect (required)

- **`height:`** Height of the shimmer container

- **`width:`** Width of the shimmer container

- **`baseColor:`** Base background color

- **`moveColor:`** The moving highlight color

### Purpose
Used to show beautiful loading states for cards, lists, and other UI elements across the app.
