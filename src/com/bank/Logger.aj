package com.bank;

import java.util.Calendar;
import java.io.*;

public aspect Logger {
	
	pointcut success() : call(* create*(..) );
    after() : success() {
    	System.out.println("**** User created ****");
    }
    
    pointcut callTransaccion() : call(* moneyMakeTransaction*(..) );
    after() : callTransaccion() {
    	RegistrarTransaccion("Transaccion");
    }
    
    pointcut callRetiro() : call(* moneyWithdrawal*(..) );
    after() : callRetiro() {
    	RegistrarTransaccion("Retiro");
    }
    
    public void RegistrarTransaccion(String operacion) {
        try {
        	Calendar cal = Calendar.getInstance();
            FileWriter f = new FileWriter(new File("src/Log.txt"), true);
            f.write(operacion+ " Hora: " + cal.getTime()+"\r");
            System.out.println(operacion+ " Hora: " + cal.getTime());
            f.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}



