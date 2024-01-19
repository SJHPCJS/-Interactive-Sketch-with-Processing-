float Xtext;
float Ytext;
float m1;
float m2;
float n1;
float n2;
String text;
int size;
int px,py;
int i=0,rectx1,rectx2,recty1,recty2;
int ex1,ex2,ey1,ey2;
int tx1,tx2,ty1,ty2;
PImage pen1,pen2,eraser1,eraser2,ellipse1,ellipse2,
colour1,colour2,delete1,delete2,save1,save2,triangle1,
triangle2,word1,word2,rectangle1,rectangle2,
picture1,picture2;
PImage loadedImage;
int c=250;int d;int R,G,B;
Boolean pen=false;
Boolean eraser=false;
Boolean ellipse=false;
Boolean colour=false;
Boolean delete=false;
Boolean save=false;
Boolean triangle=false;
Boolean word=false;
Boolean rectangle=false;
Boolean picture=false;
Boolean drag;
ArrayList<Rect>rectLst=new ArrayList<Rect>();
ArrayList<Ellipse>ELst=new ArrayList<Ellipse>();
ArrayList<Triangle>TLst=new ArrayList<Triangle>();
ArrayList<Text>textLst = new ArrayList<Text>();
