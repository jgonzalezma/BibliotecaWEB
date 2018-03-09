package biblioteca;

import java.util.Comparator;

public class TitulosComparator implements Comparator<Libro> {

	@Override
	public int compare(Libro l1, Libro l2) {
		return l1.getTitulo().compareToIgnoreCase(l2.getTitulo());
	}
}
