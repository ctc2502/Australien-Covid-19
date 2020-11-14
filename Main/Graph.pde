
class Graph {

    public void DRAW(DataBroker DB, InputField country, InputField year){
        pushMatrix();
        scale((float) 1);
        translate(0, 0);
        //for (int i = 0; i < 46; i++) {
            String yearString = year.Text;
            country.Text = "Australia";
                stroke(193,39,45);
                fill(193,39,45);
                rect(0,1060,1920, -DB.getData(yearString,country.Text)/30);
                //println(DB.getData(yearString,country.Text));
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
        text("Type in command",x,y-10);
    }
}
