import processing.core.PApplet;
import java.util.ArrayList;

    DataBroker DB = new DataBroker();
    Graph G = new Graph();

    InputField country = new InputField(1450, -100, 400, 35);
    InputField year = new InputField(1450, 175, 400, 35);

    ArrayList<InputField> textboxes = new ArrayList<InputField>();
    
    PFont Bahn;
    PImage noAus;

    boolean send = false;
    String msg;
    String msg2;
    PVector msgPOS = new PVector(1920/2, 1080/2);

    public void settings() {
        //size(1000, 1000);
        fullScreen();
       
    }

    public void setup() {
        super.setup();
        DB.loadData();

        textboxes.add(year);
        textboxes.add(country);
        
        noAus = loadImage("noAUSY.png");
        noAus.resize(1920, 1080);
        
        Bahn = createFont("BAHNSCHRIFT.TTF", 16);
        textFont(Bahn);

    }

    public void draw() {
        clear();
        background(250, 213, 160);
        
        
        
        G.DRAW(DB,country,year);
        image(noAus, 0, 0);
        G.display(year.X, year.Y);


        //Felter bliver tegnet
        noStroke();
        fill(46,49,105);
        rect(1460, 185, 400, 35);
        for (InputField t : textboxes) {
            t.DRAW();
        }
        
        

        //WOW ANIMATION
        if (send) {
            fill(255);
            /*if (msgPOS.x > width/2-100) {
                msgPOS.x = msgPOS.x-10;
            } */
            pushMatrix();
            translate(-msgPOS.x*7+900, -msgPOS.y*7-100);
            scale(8);
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
                msg = round(DB.getData(year.Text,country.Text))+"";
            }
        }
    }

    public void mousePressed() {
        super.mousePressed();
        for (InputField t : textboxes) {
            t.PRESSED(mouseX, mouseY);
        }
    }
