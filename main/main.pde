float r=0; // radius
float t=0; // angle
float x=0; // abscisse
float y=0; // ordinate
float s=0; // sin
boolean drawSizeMode = false;
boolean bicolorMode = true;

// Concerning IHM
boolean overAngleIncrease = false;
boolean overAngleDecrease = false;
boolean overRadiusIncrease = false;
boolean overRadiusDecrease = false;
boolean overDrawSizeModeButtonOn = false;
boolean overDrawSizeModeButtonOff = false;
boolean overBicolorModeOn = false;
boolean overBicolorModeOff = false;
int b=0; // background color;

int k=0; // bicolor system


float st= 0.165; // angle variation (change)
float ss=0.001; // sin variation (change)
int size=30; // size of the drawing


void setup() {
  size(1000, 800);
  background(0);
  frameRate(300);
}

void draw() {
  
    // Angle variation
    t += st;
    
    // Radius Variation
    s+=ss;
    r=map(sin(s),-1,1,-(width-200)/2 + 40 ,(width-200)/2 - 40);
    
    // Polar to Cartesian conversion
    x = 200 + r * cos(t);
    y = r * sin(t);
  
  
    noStroke();
    println(k);
    // Bicolor drawing
    
    textSize(25);
    fill(230);
    textAlign(CENTER);
    text("Color Mode", 100, 580);
    if(bicolorMode)
    {
    textSize(20);
    text("On", 100, 610);
    }else{
    textSize(20);
    text("Off", 100, 610);
    }
    
    rect(0,620,80,80);
    overBicolorModeOn = overBicolorModeOnButton(0, 620, 80, 80);
    fill(0);
    text("On", 40, 665);
    
    fill(230);
    rect(120,620,80,80);
    overBicolorModeOff = overBicolorModeOffButton(120, 620, 80, 80);
    fill(0);
    text("Off", 160, 665);
    
    if(bicolorMode)
    {
      if(k==0)
        k = 1;
      else k=0;
      fill((int) map(k,0,1,255,0),b,(int) map(k,0,1,255,0));
    }else{
      fill(255); // Monochrome Mode
    }
    
    // Drawing size Variation    
    
    if(drawSizeMode)
    {
      ellipse(x+(width-200)/2, y+height/2, size*sin(s),size*sin(s)); // drawing size depending on sin(s)
    }else{
      ellipse(x+(width-200)/2, y+height/2, size,size); // normal drawing size
    }
    
    textSize(25);
    fill(230);
    textAlign(CENTER);
    text("Size Mode", 100, 400);
    if(drawSizeMode)
    {
    textSize(20);
    text("On", 100, 430);
    }else{
    textSize(20);
    text("Off", 100, 430);
    }
    
    rect(0,440,80,80);
    overDrawSizeModeButtonOn = overDrawSizeModeOnButton(0, 440, 80, 80);
    fill(0);
    text("On", 40, 485);
    fill(230);
    
    rect(120,440,80,80);
    overDrawSizeModeButtonOff = overDrawSizeModeOffButton(120, 440, 80, 80);
    fill(0);
    text("Off", 160, 485);
    
    // Angle Variation
    textSize(25);
    fill(230);
    textAlign(CENTER);
    text("Angle Variation", 100, 40);
    
    textSize(20);
    text(st, 100, 70);
    
    rect(0,80,80,80);
    overAngleIncrease = overAngleIncreaseButton(0, 80, 80, 80);
    fill(0);
    text("+0.001", 40, 120);
    fill(230);
    
    rect(120,80,80,80);
    overAngleDecrease = overAngleDecreaseButton(120, 80, 80, 80);
    fill(0);
    text("-0.001", 160, 120);
    
    // Radius Variation
    textSize(25);
    fill(230);
    textAlign(CENTER);
    text("Radius Variation", 100, 220);
    
    textSize(20);
    text(ss, 100, 250);
    
    rect(0,260,80,80);
    overRadiusIncrease = overRadiusIncreaseButton(0, 260, 80, 80);
    fill(0);
    text("+0.001", 40, 300);
    fill(230);
    
    rect(120,260,80,80);
    overRadiusDecrease = overRadiusDecreaseButton(120, 260, 80, 80);
    fill(0);
    text("+0.001", 160, 300);
}

void mousePressed() {
  if (overAngleIncrease) {
    st=st+0.001;
    background(b);
  }
  
  if (overAngleDecrease) {
    st=st-0.001;
    background(b);
  }
  
  if (overRadiusIncrease) {
    ss=ss+0.001;
    background(b);
  }
  
  if (overRadiusDecrease) {
    ss=ss-0.001;
    background(b);
  }
  
  if (overDrawSizeModeButtonOn) {
    drawSizeMode=true;
    background(b);
  }
  
  if (overDrawSizeModeButtonOff) {
    drawSizeMode=false;
    background(b);
  }
  
  if (overBicolorModeOn) {
    bicolorMode=true;
    background(b);
  }
  
  if (overBicolorModeOff) {
    bicolorMode=false;
    background(b);
  }
  
}

boolean overAngleIncreaseButton(int x, int y, int w, int h)  {
  if (mouseX >= x && mouseX <= x+w && 
      mouseY >= y && mouseY <= y+h) {
    return true;
  } else {
    return false;
  }
}

boolean overAngleDecreaseButton(int x, int y, int w, int h)  {
  if (mouseX >= x && mouseX <= x+w && 
      mouseY >= y && mouseY <= y+h) {
    return true;
  } else {
    return false;
  }
}

boolean overRadiusIncreaseButton(int x, int y, int w, int h)  {
  if (mouseX >= x && mouseX <= x+w && 
      mouseY >= y && mouseY <= y+h) {
    return true;
  } else {
    return false;
  }
}

boolean overRadiusDecreaseButton(int x, int y, int w, int h)  {
  if (mouseX >= x && mouseX <= x+w && 
      mouseY >= y && mouseY <= y+h) {
    return true;
  } else {
    return false;
  }
}

boolean overDrawSizeModeOnButton(int x, int y, int w, int h)  {
  if (mouseX >= x && mouseX <= x+w && 
      mouseY >= y && mouseY <= y+h) {
    return true;
  } else {
    return false;
  }
}

boolean overDrawSizeModeOffButton(int x, int y, int w, int h)  {
  if (mouseX >= x && mouseX <= x+w && 
      mouseY >= y && mouseY <= y+h) {
    return true;
  } else {
    return false;
  }
}

boolean overBicolorModeOnButton(int x, int y, int w, int h)  {
  if (mouseX >= x && mouseX <= x+w && 
      mouseY >= y && mouseY <= y+h) {
    return true;
  } else {
    return false;
  }
}

boolean overBicolorModeOffButton(int x, int y, int w, int h)  {
  if (mouseX >= x && mouseX <= x+w && 
      mouseY >= y && mouseY <= y+h) {
    return true;
  } else {
    return false;
  }
}
