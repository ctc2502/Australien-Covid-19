import processing.core.PApplet;
import java.util.ArrayList;

    DataBroker DB = new DataBroker();
    Graph G = new Graph();

    InputField country = new InputField(1450, -100, 400, 35);
    InputField topic = new InputField(1200, 175, 400, 35);

    ArrayList<InputField> textboxes = new ArrayList<InputField>();
    
    PFont Bahn;
    PImage noAus;
    PImage logo;
    boolean send = false;
    
    String msg;
    PVector msgPOS = new PVector(1920/2, 1080/2);
    
    float fyld = 0;

    public void settings() {
        //size(1000, 1000);
        fullScreen();
       
    }

    public void setup() {
        super.setup();
        println("Commands:");
        DB.loadData();
        
        textboxes.add(topic);
        textboxes.add(country);
        
        noAus = loadImage("noAUSY.png");
        noAus.resize(1920, 1080);
        
        logo = loadImage("Kangroove.png");
        logo.resize(3490/21, 1838/21);
        
        Bahn = createFont("BAHNSCHRIFT.TTF", 16);
        textFont(Bahn);
        
    }

    public void draw() {
        clear();
        background(250, 213, 160);
        
        
        
        G.DRAW(DB,country,topic);
        image(noAus, 0, 0);
        G.display(topic.X, topic.Y);


        //Felter bliver tegnet
        noStroke();
        fill(46,49,105);
        rect(1210, 185, 400, 35);
        for (InputField t : textboxes) {
            t.DRAW();
        }
        
        noStroke();
        fill(50);
        rect(1150, 300, 800, 150);

        //WOW ANIMATION
        if (send) {
            fill(255);
            /*if (msgPOS.x > width/2-100) {
                msgPOS.x = msgPOS.x-10;
            } */
            pushMatrix();
            translate(-msgPOS.x*6+930, -msgPOS.y*6-100);
            scale(7);
            fill(252, 238, 33);
            text(msg, (msgPOS.x - textWidth(msg)), msgPOS.y);
            popMatrix();
        }
        
        
       
    }

    public void keyPressed() {
        super.keyPressed();
        for (InputField t : textboxes) {
            if (t.KEYPRESSED(key, keyCode)) {
                msgPOS.x = width/2;
                send = true;
                msg = round((DB.getData(topic.Text,country.Text)))+"";
                fyld=1;
            }
        }
    }

    public void mousePressed() {
        super.mousePressed();
        for (InputField t : textboxes) {
            t.PRESSED(mouseX, mouseY);
        }
    }
