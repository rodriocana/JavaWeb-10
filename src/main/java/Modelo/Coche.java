/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.util.ArrayList;

/**
 *
 * @author Rodri
 */
public class Coche {

    private int cod_coche;
    private String modelo;
    private String color;
    private String rutaimagen;
    private int precio;
    
     private ArrayList<Coche> coches;

    private int codigo_usuario; // FK 

    public Coche(int cod_coche, String modelo, String color, int precio, String rutaimagen) {
        this.cod_coche = cod_coche;
        this.modelo = modelo;
        this.color = color;
        this.precio = precio;
        this.rutaimagen = rutaimagen;
    }

    public Coche() {

    }

    public ArrayList<Coche> getCoches() {
        return coches;
    }

    public void setCoches(ArrayList<Coche> coches) {
        this.coches = coches;
    }
    
    

    public String getRutaimagen() {
        return rutaimagen;
    }

    public void setRutaimagen(String rutaimagen) {
        this.rutaimagen = rutaimagen;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    
    
    public int getCodigo_usuario() {
        return codigo_usuario;
    }

    public void setCodigo_usuario(int codigo_usuario) {
        this.codigo_usuario = codigo_usuario;
    }

    public int getCod_coche() {
        return cod_coche;
    }

    public void setCod_coche(int cod_coche) {
        this.cod_coche = cod_coche;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
}
