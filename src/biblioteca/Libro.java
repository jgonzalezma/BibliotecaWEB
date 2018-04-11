package biblioteca;

import java.util.ArrayList;
import java.util.Iterator;

public class Libro {
	private int id;
	private String autor;
	private String titulo;
	private ArrayList<Prestamo> prestamos;

	public Libro() {

	}

	public Libro(int id, String autor, String titulo) {
		this.id = id;
		this.autor = autor;
		this.titulo = titulo;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAutor() {
		return autor;
	}

	public void setAutor(String autor) {
		this.autor = autor;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public ArrayList<Prestamo> getPrestamos() {
		return prestamos;
	}

	public void setPrestamos(ArrayList<Prestamo> prestamos) {
		this.prestamos = prestamos;
	}
	public boolean estaPrestado(){
		Iterator<Prestamo> i = this.prestamos.iterator();
		Prestamo prestamo;
		
		while(i.hasNext()){
			prestamo = i.next();
			if(!prestamo.isEntregado()){
				return true; //el libro NO ESTA DISPONIBLE porque esta prestado
			}
		}return false; //el libro ESTA DISPONIBLE porque no esta prestado
	}
	public boolean estaDisponible(){
		Iterator<Prestamo> i = this.prestamos.iterator();
		Prestamo prestamo;
		
		while(i.hasNext()){
			prestamo = i.next();
			if(!prestamo.isEntregado()){
				
				return false;
			}
		}
		//todos los prestamos estan entregados
		return true;
	}

}
