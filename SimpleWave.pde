class SimpleWave extends CanvasRoutine {
  color theColor = color(255);
  float nWaves = 1;
  float phase = 0.0;
  float amp = 0.5;
  float bias = 0.5;
  float spread = 0.0;
  float freq = 1.0;
  private float period;
  private int w;
  private int h;

  void reinit() {
    w = pg.width;
    h = pg.height;
    period = 1.0 / h;
  }

  void draw() {
    pg.beginDraw();
    pg.background(0);
    pg.stroke(theColor);
    float drawPhase = phase;
    float ampScaled = amp * w;
    int biasScaled = (int) (bias * w);
    int s = (int) (spread * ampScaled);

    for (int y = 0; y < h; y++) {
      int x = (int) (sineTable[(int) (drawPhase * sineTableSize)] * ampScaled);
      pg.line(biasScaled + x - s, y, biasScaled - x + s, y);

      drawPhase += period * nWaves;
      while (drawPhase >= 1.0) {
        drawPhase -= 1.0;
      }
      while (drawPhase < 0.0) {
        drawPhase += 1.0;
      }
    }

    phase += freq * (1.0 / FRAMERATE) * nWaves;
    while (phase >= 1.0) {
      phase -= 1.0;
    }
    while (phase < 0.0) {
      phase += 1.0;
    }

    pg.endDraw();
  }
}

