void setup() {
  
  background(30);
  size(1024, 480);
  
  
  strokeWeight(2);
  //stroke(40,40,200);
  
  fill(30);
  
  
  PImage img;
  img = loadImage("man2.png");
  
  
  int horizon_height = 195;
  
  float street_distance = 2.4;

  
 // city_horizontal_streets(8, 50);
  
  
  street_lines(horizon_height,0.2, 80, 1);
  
  //
  
  street_lines(horizon_height, street_distance, 240, 4);
  
  
  int hatch_distance =8;
  
  bg(hatch_distance);
  
  city_horizontal_streets(45, 240);
  
  
  
  
  
  
  
  //draw_skyline();
  
  hill();
  
  image(img, 180, 105, img.width/5, img.height/5);
  
  
  
  
  
  

  
  
 

  
  
    //stroke(220, 20,20);

  
  

  
  
}
  
 void draw() {
   
   if (keyPressed == true) {
  
  int d = day();    // Values from 1 - 31
  int m = month();  // Values from 1 - 12
  int y = year();   // 2003, 2004, 2005, etc.
  
  
  
  String[] list = split(str(y), "0");
  
  
  String mstr;
  
  if (m < 10) {
    
    mstr = "0"+str(m);
    
  } else {
    mstr = str(m); 
  }
  
  String today = list[1]+mstr+str(d);
  
  
  save("lightsoverla_b"+today+".png"); 
  
  }
  
} 



void bg(int hatch_distance) {
  
  
 
  
  stroke(120,40,100);
  
  for(int i=0; i<width / hatch_distance + 100; i++) { 

      line( i * hatch_distance, 0, (i*hatch_distance)-198, 198); 

  }
  
  //rect(0,200, 1280, 480);
   
  
}


void street_lines(int horizon_height, float street, int blue, int sw) {
  
  
  
  
  
  int delta = 25;
  
  int delta_distort = -35;
  
  strokeWeight(sw);
  
    for(int i=0; i<100; i++) { 
    
    int increment = int(street*90);
    
    if (i > 20) {
      strokeWeight(1); 
    }
    
   //line(width/2 +delta,horizon_height, width/2 +delta_distort+ increment * i,  480);
   
   //line(width/2 +delta, horizon_height, width/2 +delta_distort - increment * i,  480);
   
   
   PVector origin = new PVector(width/2 +delta, horizon_height);
   PVector destination = new PVector(width/2 +delta_distort - increment * i,  480);
   
   PVector destination2 = new PVector(width/2 +delta_distort + increment * i,  480);
   
    destination.sub(origin);
      
    destination.normalize();  
      
    destination.mult(5);
    
    
    destination2.sub(origin);
      
    destination2.normalize();  
      
    destination2.mult(5);
   
    for (int j=0; j < 100; j++) {
      

      //stroke(180, 80,255);
      stroke(int(random(150,140)),int(random(150,140)), int(random(210,blue)));
     
      
      float px = destination.x * j;
      float py = destination.y * j;
      
      point(origin.x + px, origin.y + py);
      
      
      float px2 = destination2.x * j;
      float py2 = destination2.y * j;
      
      point(origin.x + px2, origin.y + py2);
      
      //print(destination.x);
      
      
      
    }
  }
  
   //float increment = 0;
    //for(int i=0; i<height-200 / street; i++) {
    
      //increment = 0.5 +increment ;
      
      //strokeWeight(2);
   //stroke(20,20,110);
    //line(0,189 + int((increment * i ) + (increment * i)) , 1024, 189 + int((increment * i ) + (increment * i)));
    
  //}
  
  noStroke();
  rect(0, 0, 1280, 200); 
  
}


void hill() {
  
  noStroke();
  
    fill(20);
    
      
  int pos = 250;
  
  int lastx = 0;
  int lasty = pos;

  
  
  int vanishing_x = width / 2;
  
  PVector vanishing = new PVector(vanishing_x, 200);
  
  
  
  
  
  int altura_edificio = 105;
  
  
  int base_edificio_x = 330;
  
  
  //rect(10, base_edificio_x - altura_edificio -100, 150, 150);
  rect(100, base_edificio_x - altura_edificio, 100, altura_edificio);
  
  
  //rect(0, base_edificio_x, 550,10);
  
  
  //fill(255,255,120);
  
  
  
  //punto
  
  PVector  punto_origen = new PVector(200, base_edificio_x - altura_edificio);
  
  
  stroke(255,0,0);
  //line(punto_origen.x, punto_origen.y, vanishing.x, vanishing.y);
  noStroke();
  
  //float diag = sqrt((vanishing.x - punto_origen.x ) + (vanishing.x - punto_origen.x ), (vanishing.y - punto_origen.y) * (vanishing.y - punto_origen.y));
  
  
  // soh cah toa
  
  float op = vanishing.y - punto_origen.y;
  float ad =  int((width/2) - 200);
  
  
  println(ad);
  float ang = tan((op * 1.0)/ (ad * 1.0)); 
  
  println(ang);
  int new_ad = 100;
  
  // ang = tan(op / ad)
  
  // atan(ang) = op / ad
  
  // op = atan(ang) * ad;
  
 float new_op = tan(ang) * new_ad;
  
  
  
  println(new_op);
  
  
  
  int largo_caja = new_ad;
   
//fill(255,255,150);
  
  beginShape();
  
  vertex(200, base_edificio_x - altura_edificio);  // punto
  vertex(200 + largo_caja, base_edificio_x - altura_edificio + new_op);
  vertex(200 + largo_caja, base_edificio_x);
  
  
  vertex(200, base_edificio_x);
  
  
  
 
  
  endShape(CLOSE);
  
  
   fill(20);
   beginShape();
  
  
  vertex(200 + largo_caja, base_edificio_x - altura_edificio + new_op);
  vertex(200, base_edificio_x - altura_edificio);
  vertex(100, base_edificio_x - altura_edificio);
   vertex(217, base_edificio_x - altura_edificio + new_op);
  
  
  
  
  
  
  
  
  endShape(CLOSE);
  
  
  
  
  
  fill(20);
  beginShape();
  
  
  
  for(int i=0; i<500; i++) { 
    
    int r =( int( random(3) ) - 1 ) * 3;
    
    //println(r);
    
    //line(i * 4, lasty + r + int(i* 0.04), lastx, lasty);
    
    vertex(lastx, lasty);
    
    lastx = i* 4;
    lasty = lasty + r + int(i*0.015);
    
   
  }
  vertex(0, height);
  endShape(CLOSE);
  
  
  
}



void city_horizontal_streets(int step, int blue) {
  
  
  
    //stroke(20,20,110);
  //stroke(90);
  
  
  int end_line = 800;
  
  int dist_observador_del_plano = 382;
  
  int obsx = end_line + dist_observador_del_plano;
  
  
  int obsy = 202;
  
  line(obsx -2, obsy-2, obsx +3, obsy+3);
  line(obsx-2, obsy + 3, obsx+3, obsy-2);
  
  int altura = 432;
  
  int baseline_y = height - altura;
  
  
  strokeWeight(4);
  
  
 
  line(end_line, baseline_y + altura, 100, baseline_y + altura);
  
  //int step = 45;
  
  int vertical_x = 800;
  
  int distance = (vertical_x-100)/ step;
  
  float op_acumulator = 0;
  
  for(int i=0; i<distance; i++) {
    
    // marcas
    //line(100 + i* step, 200 + altura, 100 + i *step, 205 + altura);
    
    //stroke(150,150,150);
    
    
    //lineas proyeccion
    //line(100 + i* step, 200 + altura, obsx, obsy);
    
    //soh cah toa
    
    float ad = dist_observador_del_plano + (step * (distance -i));
    float op = altura;
    
    float ang = tan(op / ad);
    
    
    float ad_small = (step * (distance -i));
    
    // ang = tan(op / ad)
    
    // atan(ang) = op / ad
    
    // atan(ang) * ad = op
    
    // op = ad * atan(ang)
    
    float op_small = ad_small * abs(atan(ang));
    
    //println(op_small);
   
   
    //stroke(240, 100,100);   
    if (i%2 == 0) {
    
        
        draw_skyline(distance - i, int(baseline_y + altura - op_small));
    
    }
    //line(0,baseline_y + altura - op_small,width,  baseline_y + altura - op_small);
    
    strokeWeight(2);
    for (int j=0; j<width / 3 ; j++) {
      
      
      if ( j % 3 == 0) {
        
        
        
        stroke(int(random(80,140)),int(random(80,140)), int(random(200,blue)));
      point(j * 3, baseline_y + altura - op_small);
      
       //ellipseMode(CENTER);
        //fill(160,40,40);
         // ellipse(j * 2, baseline_y + altura - op_small, (1 / op_small) * 160, (1 / op_small) * 160);
      
      }
    }
    

    //println(degrees(ang));
    
  }
  
}
   
 
 
void draw_skyline(int n, int levely) {
  
  
  
   
    
    int level_skyline = levely;
    int original_level_skyline = level_skyline;
    
    int min_delta= 3;
    
    int size = 40;
    
    int largo = width + (min_delta * size);
    
    if (largo  > 10  ){ 
    
      
      
      //println(largo);
      
      
      
      int margin = 0;
      
      for(int i=0; i<largo ; i++) {
        
        stroke(180, 180, int(random(200,255)), 90);
        
        int step = 90 / n;
        
        int rand_step = int(random(1,2));
        
        
        float rand_building = random(0,1);
        
        
        
           int randy = int(random(0,step));
       
        
        if (rand_building > 0.80) {
           randy = int(random(0,step * n / 3));
        } 
        
        //int randy = int(random(0,step));
        
        if (i % rand_step == 0) {
          
          line((i*step) + min_delta + margin, original_level_skyline, (i*step) + min_delta + margin, level_skyline - randy); 
          
          //level_skyline = level_skyline - randy;
          
          line((i*step)+min_delta + margin, level_skyline - randy, ((i+1)*step) + margin, level_skyline - randy);
          
          //int randy2 = int(random(0,100)) -50;
          
          line(((i+1)*step) + margin, level_skyline - randy, ((i+1)*step) + margin, original_level_skyline);
          
          line(((i+1)*step) + margin, original_level_skyline, ((i+1)*step) + min_delta + margin, original_level_skyline);
          
        } else {
          
          int randy2 = int(random(0,10)) - 5;
          
          original_level_skyline = original_level_skyline + randy2;
          
          
          line((i*step) +min_delta + margin, original_level_skyline - randy2, (i*step) +min_delta + margin ,original_level_skyline);
          
          line((i*step) +min_delta + margin, original_level_skyline, ((i+1)*step) + min_delta + margin, original_level_skyline);
          
        }
        
      
      }
    
    }
    
    
  
}

