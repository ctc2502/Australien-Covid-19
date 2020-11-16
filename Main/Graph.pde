
class Graph {
    public color riskyRed = color(193,39,45);
    public color yeasyYellow = color(251, 176, 59);
    
    public void DRAW(DataBroker DB, InputField country, InputField topic){
        pushMatrix();
        scale((float) 1);
        translate(0, 0);
        //for (int i = 0; i < 46; i++) {
            String topicString = topic.Text;
            country.Text = "Australia";
                //stroke(193,39,45);
                fill( (fyld > -500) ? yeasyYellow : riskyRed);
                
                if (fyld > -DB.getData(topicString,country.Text)/100) {
                fyld = fyld - 10;
                } else if (fyld < -DB.getData(topicString,country.Text)/100) {
                fyld = fyld + 10;
                }
                rect(0,1062,1920, fyld);
                //println(fyld);
                //println(DB.getData(topicString,country.Text));
            if (keyCode == ENTER) {
            
            //println(i);
            }
            fill(0,0,0);
        //}

        popMatrix();
    }

    public void display(int x, int y) {
        int d = day();
        int m = month();
        int yr = year();
        
        String s = String.valueOf(d) + " / " + String.valueOf(m) + " / " + String.valueOf(yr);
        
        strokeWeight(5);
        textSize(32);
        fill(255);
        text("Type in a command and click 'ENTER'",x,y-10);
        fill(252, 238, 33);
        textSize(16);
        text("Latest updated: " + s, x, y+65);
        
        
        textSize(32);
        fill(252, 238, 33);
        text("Relevant Topics [Command] ", x,y+350);
        fill(255);
        textSize(25);
        text("Covid-19 Cases nationwide [total_cases]", x+20,y+390);
        text("Covid-19 Deaths nationwide [total_deaths]", x+20,y+425);
        
        textSize(32);
        fill(252, 238, 33);
        text("Feautured Topics [Command] ", x,y+500);
        fill(255);
        textSize(25);
        text("Victims over 65-year old [aged_65_older]", x+20, y+540);
        text("Victims over 70-year old [aged_70_older]", x+20, y+575);
        
        textSize(32);
        fill(252, 238, 33);
        text("Other users also typed [Command] ", x,y+650);
        fill(255);
        textSize(25);
        text("The population of Australia [population]", x+20, y+690);
        text("Gross Domestic Product per capita [gdp_per_capita]", x+20, y+725);
        text("Population density [population_density]", x+20, y+760);
        text("The median age of victims to Covid-19 [median_age]", x+20, y+795);
        
        image(logo, 1700, 985);
        fill(50);
        textSize(16);
        text("Provided by", 1600, 1050);
        }
        
    }
