/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.beans.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.GregorianCalendar;
//import static org.apache.derby.iapi.reference.ClassName.ResultSet;

/**
 *
 * @author Rodri
 */
public class Usuario {

     int numero;
    String nombre;
    float sueldo;
    static GregorianCalendar fechaalta;
     String password;
     int precioTotalCoches;

    static String imagen;
    
    private ArrayList<Coche> coches;

    
public Usuario(int numero, String nombre, float sueldo, String fechaalta, String imagen, int precioTotalCoches) {
    this.numero = numero;
    this.nombre = nombre;
    this.sueldo = sueldo;
    this.imagen = imagen;
    this.precioTotalCoches = precioTotalCoches;

    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            this.fechaalta = new GregorianCalendar();
            this.fechaalta.setTime(dateFormat.parse(fechaalta));
        } catch (Exception e) {
            e.printStackTrace();
        }

}

    //constructor vacio
    public Usuario() {

    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getNombre() {
        return nombre;
    }
    
    

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public float getSueldo() {
        return sueldo;
    }

    public void setSueldo(float sueldo) {
        this.sueldo = sueldo;
    }

    static public String getFechaalta() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        return dateFormat.format(Usuario.fechaalta.getTime()); //return dateFormat.format(this.fechaalta.getTime());
    }

    public void setFechaalta(GregorianCalendar fechaAlta) {
        this.fechaalta = fechaalta;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getPrecioTotalCoches() {
        return precioTotalCoches;
    }

    public void setPrecioTotalCoches(int precioTotalCoches) {
        this.precioTotalCoches = precioTotalCoches;
    }

    public static String getImagen() {
        return imagen;
    }

    public static void setImagen(String imagen) {
        Usuario.imagen = imagen;
    }

    public ArrayList<Coche> getCoches() {
        return coches;
    }

    public void setCoches(ArrayList<Coche> coches) {
        this.coches = coches;
    }

   
}
