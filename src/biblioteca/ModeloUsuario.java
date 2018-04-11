package biblioteca;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

public class ModeloUsuario extends Conector {

	public ArrayList<Usuario> selectAll() {
		// Crear arraylist
		ArrayList<Usuario> listaUsuarios = new ArrayList<Usuario>();
		// Ejecutar la consulta
		try {

			Statement st = conexion.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM usuarios");
			while (rs.next()) {
				// Recorrer el resultset y rellenar el arraylist
				Usuario u = new Usuario(rs.getInt("id"), rs.getString("nombre"), rs.getString("apellido"),
						rs.getInt("edad"), rs.getString("dni"), rs.getDate("fechaNacimiento"), rs.getString("password"),
						rs.getString("rol"));
				listaUsuarios.add(u);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// Devolver arraylist
		return listaUsuarios;
	}

	public static Usuario select(int id) {
		// crear usuario
		Usuario usuario = new Usuario();

		// ejecutar consulta
		try {
			Statement st = conexion.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM usuarios WHERE id= " + id);
			while (rs.next()) {
				usuario.setId(rs.getInt("id"));
				usuario.setNombre(rs.getString("nombre"));
				usuario.setApellido(rs.getString("apellido"));
				usuario.setEdad(rs.getInt("edad"));
				usuario.setDni(rs.getString("dni"));
				usuario.setPassword(rs.getString("password"));
				usuario.setRol(rs.getString("rol"));
				usuario.setImagen(rs.getString("imagen"));
				usuario.setFechaNacimineto(rs.getDate("FechaNacimiento"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// devolver usuario
		return usuario;

	}

	public void delete(int id) {
		try {
			Statement st = conexion.createStatement();
			st.execute("DELETE FROM usuarios WHERE id = " + id);
			st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<Usuario> selectPorNombre(String nombre) {
		// Crear lista de usuarios
		ArrayList<Usuario> listaUsuarios = new ArrayList<Usuario>();
		try {
			Statement st = conexion.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM usuarios WHERE nombre= " + nombre);
			while (rs.next()) {
				// Recorrer el resultset y rellenar el arraylist
				Usuario u = new Usuario(rs.getInt("id"), rs.getString("nombre"), rs.getString("apellido"),
						rs.getInt("edad"), rs.getString("dni"), rs.getDate("fechaNacimiento"), rs.getString("password"),
						rs.getString("rol"));
				listaUsuarios.add(u);
			}
			// devolver lista

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listaUsuarios;
	}

	public Usuario selectPorDni(String dni) {
		// Crear lista de usuarios
		Usuario usuario = null;
		try {
			Statement st = conexion.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM usuarios WHERE dni =('" + dni + "')");
			rs.next();
			usuario = new Usuario(rs.getInt("id"), rs.getString("nombre"), rs.getString("apellido"), rs.getInt("edad"),
					rs.getString("dni"), rs.getDate("fechaNacimiento"), rs.getString("password"), rs.getString("rol"));
		} catch (SQLException e) {
			System.out.println("Error, prueba otra vez");
		}
		return usuario;
	}

	public ArrayList<Usuario> selectMenoresEdad() {
		// Crear arraylist
		ArrayList<Usuario> listaUsuarios = new ArrayList<Usuario>();
		// Ejecutar la consulta
		try {
			Statement st = conexion.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM usuarios WHERE (edad<18)");
			while (rs.next()) {
				// Recorrer el resultset y rellenar el arraylist
				Usuario u = new Usuario(rs.getInt("id"), rs.getString("nombre"), rs.getString("apellido"),
						rs.getInt("edad"), rs.getString("dni"), rs.getDate("fechaNacimiento"), rs.getString("password"),
						rs.getString("rol"));
				listaUsuarios.add(u);
			}

		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return listaUsuarios;
	}

	public ArrayList<Usuario> selectContieneApellido(String apellido) {
		// Crear arraylist
		ArrayList<Usuario> listaUsuarios = new ArrayList<Usuario>();
		// Ejecutar la consulta
		try {
			Statement st = conexion.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM usuarios WHERE apellido LIKE '%" + apellido + "%'");
			while (rs.next()) {
				// Recorrer el resultset y rellenar el arraylist
				Usuario u = new Usuario(rs.getInt("id"), rs.getString("nombre"), rs.getString("apellido"),
						rs.getInt("edad"), rs.getString("dni"), rs.getDate("fechaNacimiento"), rs.getString("password"),
						rs.getString("rol"));
				listaUsuarios.add(u);
			}

		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return listaUsuarios;
	}

	public void update(Usuario usuario) {
		try {
			PreparedStatement pst = super.conexion.prepareStatement(
					"UPDATE usuarios SET nombre = ? apellido = ?, edad = ?, dni = ?, fechaNacimiento = ?, password = ?, rol = ?, imagen = ? WHERE id = ?");
			pst.setString(1, usuario.getNombre());
			pst.setString(2, usuario.getApellido());
			pst.setInt(3, usuario.getEdad());
			pst.setString(4, usuario.getDni());
			pst.setDate(5, dateToSql(usuario.getFechaNacimineto()));
			pst.setString(6, usuario.getPassword());
			pst.setString(7, usuario.getRol());
			pst.setString(8, usuario.getImagen());
			pst.setInt(9, usuario.getId());
			pst.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void insert(Usuario usuario) {
		try {
			PreparedStatement pst = super.conexion.prepareStatement(
					"INSERT INTO usuarios (nombre, apellido, edad, dni, fechaNacimiento, password, rol) values (?,?,?,?,?,?,?)");
			pst.setString(1, usuario.getNombre());
			pst.setString(2, usuario.getApellido());
			pst.setInt(3, usuario.getEdad());
			pst.setString(4, usuario.getDni());
			pst.setDate(5, dateToSql(usuario.getFechaNacimineto()));
			pst.setString(6, usuario.getPassword());
			pst.setString(7, usuario.getRol());
			pst.setString(8, usuario.getImagen());
			pst.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public java.sql.Date dateToSql(Date fechaNac) {
		Date utilDate = fechaNac;
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

		return sqlDate;
	}
	// devuelve el usuario y contraseña
	/*
	 * public Usuario get(String dni, String contrasena) { PreparedStatement
	 * pst; try { pst = super.conexion.
	 * prepareStatement("select * from usuarios where dni = ?, contrasena = ?");
	 * pst.setString(1, dni); pst.setString(2, contrasena); ResultSet rs =
	 * pst.executeQuery(); if(rs.next()){ Usuario usuario = new Usuario();
	 * usuario.setNombre(rs.getString("nombre"));
	 * usuario.setApellido(rs.getString("apellido"));
	 * usuario.setDni(rs.getString("dni")); usuario.setFechaNacimineto(sqlDate);
	 * usuario.setPassword(rs.getString("password"));
	 * 
	 * } } catch (SQLException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } return null; }
	 */
}
