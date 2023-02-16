/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package footwear_factory;

/**
 *
 * @author arvin
 */
public class Footwear_Factory {

    /**
     * @param args the command line arguments
     */
    
    private static final Footwear_Factory instance = new Footwear_Factory();
    public static Footwear_Factory getInstance() {
        return instance;
    }
    
    public Integer currentUserID;

    public Integer getCurrentUserID() {
        return currentUserID;
    }

    public void setCurrentUserID(Integer currentUserID) {
        this.currentUserID = currentUserID;
    }

    
    public static void main(String[] args) {
        // TODO code application logic here
        mainScreen initScreen = new mainScreen();
        initScreen.setVisible(true);
    }
    
}
