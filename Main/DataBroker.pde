import processing.core.PApplet;
import java.util.ArrayList;

class DataBroker {

    ArrayList<Data> dataList = new ArrayList<Data>();

    String[] ROWS;
    String[] HEADERS;

    DataBroker() {
    }

    void loadData() {
        ROWS = loadStrings("https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv?fbclid=IwAR1QrkDCJdrxTmOXlPJFfTlXEzQWeyJ2gj_YJNc6SYh4pgikN3V2NYaxFEA");
        HEADERS = ROWS[0].split(",");
        for (int j = 2991; j < 2992; j++) {
            String[] CELLS = ROWS[j].split(",");
            for (int i = 4; i < CELLS.length; i++) {
                String D = CELLS[i];
                //println(CELLS.length);
                if (D.length() == 0) D = "0";
                dataList.add(new Data(CELLS[2], D, HEADERS[i]));
                //println("Land: " + CELLS[1] + " årstal: " + HEADERS[i] + " døde: " + D);
            }
        }
    }

        public float getData(String topic, String land) {
            float D = 0;
            for(int i = 0; i < dataList.size(); i++){
                if(land.equalsIgnoreCase(dataList.get(i).land) && topic.equalsIgnoreCase(dataList.get(i).topic) ){
                    D = Float.parseFloat(dataList.get(i).amount);

                }
            }
            return D;
        }


    }
