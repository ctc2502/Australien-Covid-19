
class Graph {

    public void DRAW(DataBroker DB, InputField country, InputField year){
        pushMatrix();
        scale((float) 1);
        translate(0, 0);
        //for (int i = 0; i < 46; i++) {
            String yearString = year.Text;
            country.Text = "Australia";
                stroke( (year.Text.equalsIgnoreCase(yearString)) ? 0xffffff00 : 255);
                fill( (year.Text.equalsIgnoreCase(yearString)) ? 0xffffff00 : 255);
                //println(DB.getData(yearString,country.Text));
                rect(100,height-55,10, -DB.getData(yearString,country.Text));
            if (keyCode == ENTER) {
            
            //println(i);
            }
            fill(0,0,0);
        //}

        popMatrix();
    }

    public void display(int x, int y) {
        strokeWeight(5);
        textSize(32);
        fill(255);
        text("Country",x,y-10);
        text("Type in command",x,y+90);
    }
}
