/*Sketch from G06
 Group mumbers:JiaShuo Chang,JinHao Zhang,TianShuo Wang,YaXin Huang, Yi Su
 */


void setup() {
  smooth();
  size=75;
  textSize(size);
  text="";
  size(2200, 1300);
  background(255);
  strokeWeight(5);
  /*The basic setup.*/
  pen1=loadImage("pen1.jpg");
  pen2=loadImage("pen2.jpg");
  eraser1=loadImage("eraser1.jpg");
  eraser2= loadImage("eraser2.jpg");
  rectangle1=loadImage("rectangle1.jpg");
  rectangle2=loadImage("rectangle2.jpg");
  ellipse1=loadImage("ellipse1.jpg");
  ellipse2=loadImage("ellipse2.jpg");
  triangle1=loadImage("triangle1.jpg");
  triangle2=loadImage("triangle2.jpg");
  word1=loadImage("word1.jpg");
  word2=loadImage("word2.jpg");
  delete1=loadImage("delete1.jpg");
  delete2=loadImage("delete2.jpg");
  save1=loadImage("save1.jpg");
  save2=loadImage("save2.jpg");
  picture1=loadImage("picture1.jpg");
  picture2=loadImage("picture2.jpg");
  /*Load all the pictures of buttons*/
}

void draw() {

  fill(240);
  noStroke();
  rect(0, 0, 2200, 300);
  m1=mouseX/3+2*pmouseX/3;
  n1=mouseY/3+2*pmouseY/3;
  m2=2*mouseX/3+pmouseX/3;
  n2=2*mouseY/3+pmouseY/3;
  if (rectangle) {
    if (rectangle&&i!=1&&i!=2) {
      i=1;
    }
    if (i==1&&mouseY>300&&mouseX>0&&mousePressed) {
      rectx1=mouseX;
      recty1=mouseY;
      i=2;
    }
    /*record the starting points of the rectangle*/
    if (i==2&&mousePressed) {
      rectx2=mouseX;
      recty2=mouseY;
    }
    /*record the terminal points of the rectangle*/

    if (i==2&&!mousePressed) {
      i=1;
      Rect temp=new Rect(rectx1, rectx2, recty1, recty2);
      rectLst.add(temp);
    }
    stroke(0);
    noFill();
    for (Rect t : rectLst) {
      rect(t.RectX1, t.RectY1, t.RectX2-t.RectX1, t.RectY2-t.RectY1);
    }
    /*recalls all the data stored*/
  }
  /*draw rectangle*/

  if (ellipse) {
    if (ellipse&&1!=3&&i!=4) {
      i=3;
    }
    if (i==3&&mouseX>0&&mouseY>300&&mousePressed) {
      ex1=mouseX;
      ey1=mouseY;
      i=4;
    }
    /*record the starting points of the ellipse*/

    if (i==4&&mousePressed) {
      ex2=mouseX;
      ey2=mouseY;
    }
    /*record the terminal points of the ellipse */
    if (i==4&&!mousePressed) {
      i=3;
      Ellipse temp=new Ellipse(ex1, ey1, ex2, ey2);
      ELst.add(temp);
    }
    stroke(0);
    noFill();
    for (Ellipse t : ELst) {
      ellipse(t.EX1, t.EY1, t.EX2-t.EX1, t.EY2-t.EY1);
    }
    /*recalls all the data stored */
  }
  /*draw ellipse */


  if (triangle) {
    if (triangle&&i!=5&&i!=6) {
      i=5;
    }
    if (i==5&&mouseX>0&&mouseY>300&&mousePressed) {
      tx1=mouseX;
      ty1=mouseY;
      i=6;
    }
    /* record the starting points of the triangle */
    if (i==6&&mousePressed) {
      tx2=mouseX;
      ty2=mouseY;
    }
    /*record the terminal points of the triangle */
    if (i==6&&!mousePressed) {
      i=5;
      Triangle temp=new Triangle(tx1, ty1, tx2, ty2);
      TLst.add(temp);
    }
    stroke(0);
    noFill();
    for (Triangle t : TLst) {
      triangle(t.TX1, t.TY1, t.TX2, t.TY2, 2*t.TX1-t.TX2, t.TY2);
    }
    /*recalls all the data stored */
  }
  /*draw triangle */
  stroke(0);
  line(0, 300, 2200, 300);
  rect(220, 220, 260, 60);
  line(250, 250, 450, 250);
  ellipse(c, 250, 30, 30);
  rect(1020, 5, 60, 291);

  for (int i=1; i<=256; i++)
    for (int j=1; j<=256; j++) {
      stroke(i, j, B);
      /*represent R and G with the coordinate of point1*/
      point(720+i, 20+j);
      /*draw 256*256 points and form the palette with these points*/
    }
  for (int i=1; i<=256; i++) {
    stroke(R, G, i);
    /*represent B with the y-coordinate of point2*/
    point(1050, 20+i);
  }
  stroke(0);
  ellipse(1050, B+20, 30, 30);
  ellipse(R+720, G+20, 15, 15);
  /* draw the whole palette*/
  println(mouseX);
  println(mouseY);
  fill(0);
  text(text, Xtext, Ytext);
  for (Text t : textLst) {
    text(t.stR, t.textX, t.textY);
  }
  /* Print all the strings which are stored on the display window. */

  fill(0);
  textSize(30);
  text("thin", 161, 258);
  text("thick", 500, 258);
  fill(255);
  if (mouseX>250 && mouseX<450 && mousePressed==true &&mouseY>220 && mouseY<260) {
    rect(220, 220, 260, 60);
    line(250, 250, 450, 250);
    ellipse(mouseX, 250, 30, 30);
    c=mouseX;
    /*use c to determine the thickness of line and eraser*/
  }
  stroke(0);

  if (mouseY>30 && mouseY<110 && mouseX>155 && mouseX<235 && mousePressed==true) {
    pen=true;
    eraser=false;
    ellipse=false;
    colour=false;
    delete=false;
    save=false;
    triangle=false;
    word=false;
    rectangle=false;
    picture=false;
  }
  /* If the "pen" button is pressed,the pen function can be used */

  if (mouseY>300 && mousePressed==true && mouseButton==LEFT && pen==true) {
    strokeWeight(c/20); // change the thickness of pen
    stroke(R, G, B);
    line(pmouseX, pmouseY, m1, n1);
    line(m1, n1, m2, n2);
    line(m2, n2, mouseX, mouseY);
    strokeWeight(5);
  }
  /* make a pen*/
  if (mouseY>30 && mouseY<110 && mouseX>440 &&mouseX<520 && mousePressed==true) {
    pen=false;
    eraser=true;
    ellipse=false;
    colour=false;
    delete=false;
    save=false;
    triangle=false;
    word=false;
    rectangle=false;
    picture=false;
  }
  /* If the "eraser" button is pressed,the eraser function can be used */

  if (mouseY>30 && mouseY<110 && mouseX>600 &&mouseX<680 && mousePressed==true) {
    pen=false;
    eraser=false;
    ellipse=false;
    colour=false;
    delete=false;
    save=false;
    triangle=false;
    word=false;
    rectangle=true;
    picture=false;
  }
  /* If the "rectangle" button is pressed,the rectangle function can be used */

  if (mouseY>120 && mouseY<200 && mouseX>600 &&mouseX<680 && mousePressed==true) {
    pen=false;
    eraser=false;
    ellipse=true;
    colour=false;
    delete=false;
    save=false;
    triangle=false;
    word=false;
    rectangle=false;
    picture=false;
  }
  /* If the "ellipse" button is pressed,the ellipse function can be used */

  if (mouseY>210 && mouseY<290 && mouseX>600 &&mouseX<680 && mousePressed==true) {
    pen=false;
    eraser=false;
    ellipse=false;
    colour=false;
    delete=false;
    save=false;
    triangle=true;
    word=false;
    rectangle=false;
    picture=false;
  }
  /* If the "triangle" button is pressed,the triangle function can be used */

  if (mouseY>30 && mouseY<110 && mouseX>300 &&mouseX<380 && mousePressed==true) {
    pen=false;
    eraser=false;
    ellipse=false;
    colour=false;
    delete=false;
    save=false;
    triangle=false;
    word=true;
    rectangle=false;
    picture=false;
  }
  /* If the "word" button is pressed,the typing function can be used */

  if (mouseY>30 && mouseY<110 && mouseX>40 &&mouseX<120 && mousePressed==true) {
    pen=false;
    eraser=false;
    ellipse=false;
    colour=false;
    delete=false;
    save=true;
    triangle=false;
    word=false;
    rectangle=false;
    picture=false;
  }
  /* If the "save" button is pressed,the save function can be used */

  if (mouseY>120 && mouseY<200 && mouseX>40 &&mouseX<120 && mousePressed==true) {
    pen=false;
    eraser=false;
    ellipse=false;
    colour=false;
    delete=false;
    save=false;
    triangle=false;
    word=false;
    rectangle=false;
    picture=true;
  }
  /* If the "picture" button is pressed,the picture function can be used */

  if (mouseY>210 && mouseY<290 && mouseX>40 &&mouseX<120 && mousePressed==true) {
    pen=false;
    eraser=false;
    ellipse=false;
    colour=false;
    delete=true;
    save=false;
    triangle=false;
    rectangle=false;
    picture=false;
  }
  /* If the "delete" button is pressed,the delete function can be used */

  if (pen) {
    image(pen1, 155, 30);
  } else {
    image(pen2, 155, 30);
  }
  if (eraser) {
    image(eraser1, 440, 30);
  } else {
    image(eraser2, 440, 30);
  }
  if (rectangle) {
    image(rectangle1, 600, 30);
  } else {
    image(rectangle2, 600, 30);
  }
  if (ellipse) {
    image(ellipse1, 600, 110);
  } else {
    image(ellipse2, 600, 110);
  }
  if (triangle) {
    image(triangle1, 600, 200);
  } else {
    image(triangle2, 600, 200);
  }
  if (word) {
    image(word1, 300, 30);
  } else {
    image(word2, 300, 30);
  }
  if (save) {
    image(save1, 40, 30);
  } else {
    image(save2, 40, 30);
  }
  if (delete) {
    image(delete1, 40, 210);
  } else {
    image(delete2, 40, 210);
  }
  if (picture) {
    image(picture1, 40, 120);
  } else {
    image(picture2, 40, 120);
  }
  /* Using two form of the picture to let the user know which button is pressed */

  if (mouseY>300 && mousePressed==true && mouseButton==LEFT && eraser==true) {
    noStroke();
    fill(255);
    ellipse(mouseX, mouseY, c/5, c/5);
  }
  /* make a eraser*/

  if (mouseX>1020 && mouseX<1080 && mousePressed==true &&mouseY>20 && mouseY<276) {
    rect(1020, 5, 60, 291);
    for (int i=1; i<=256; i++) {
      stroke(R, G, i);
      point(1050, 20+i);
    }
    stroke(0);
    ellipse(1050, mouseY, 30, 30);
    B=mouseY-20;
  }
  if (mouseX>720 && mouseX<976 && mousePressed==true &&mouseY>20 && mouseY<276)
  {
    for (int i=1; i<=256; i++)
      for (int j=1; j<=256; j++) {
        stroke(i, j, B);
        point(720+i, 20+j);
        R=mouseX-720;
        G=mouseY-20;
      }
    stroke(0);
    ellipse(R+720, G+20, 15, 15);
  }
  /* palette again*/

  if (save) {
    save("1.jpg");
    save=false;
  }
  /*If the save button is pressed, save the display window as a jpg. called 1*/

  if (delete) {
    background(255);
    delete=false;
  }
  /*If the delete button is pressed, clean the display window*/

  if (loadedImage != null&& picture == true)
    /*Determines whether the picture is selected*/
  {
    if (mousePressed && (mouseButton == LEFT)) {
      if (!drag) {
        background(255);
        drag = true;
        px = mouseX;
        py = mouseY;
      }
      /*Trackiing mouse position*/

      else {
        background(255);
        image(loadedImage, px, py, mouseX - px, mouseY - py);
      }
    } else drag = false;
  }
}

void  mouseClicked() {
  if (word) {
    Text temp = new Text(Xtext, Ytext, text);
    textLst.add(temp);
    Xtext=mouseX;
    Ytext=mouseY;
    text="";
  }
  /* When typing function can be used, each time the mouse is clicked, create an object and store the object into "textLst" and clean the "text" to be ready to store the new string. */
  if (picture) {
    openFile();
  }
}

void keyPressed() {
  String press=str(key);
  int textlength=text.length();
  fill(0);
  if (keyPressed==true&&key!=CODED&&key!=BACKSPACE) {
    text=text+press;
  }
  if (key==BACKSPACE) {
    text=text.substring(0, textlength-1);
    background(255);
  }
  println(text);
}
/* Using the "key" to store the typing action.By calculating the length of a string to implementing the backspace function. */

void loadGraph(File selected) {
  if (selected != null) {
    loadedImage = loadImage(selected.getAbsolutePath());
  }
}

void openFile() {
  selectInput("Select a picture to load", "loadGraph");
  /*Open the computer file and select the image we need.*/
}


/*Reference
 1.Make: Getting Started with Processing, Ben Fry and Casey,2015
 2.Learning Processing, Gabe Duarte, YouTube,https://youtube.com/playlist?list=PLzJbM9-DyOZyMZzVda3HaWviHqfPiYN7e
 3.Procreate, Savage Interactive Pty Ltd., https://procreate.art/cn
 4.Canva, Beijing Canva Information Technology Co., LTD, https://www.canva.cn/
 */
