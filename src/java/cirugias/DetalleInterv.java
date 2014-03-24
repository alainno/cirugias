/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cirugias;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Nino
 */
class DetalleInterv {
	String IdDetalleInterv;
	Paciente paciente;
	ServicioHosp servhosp;
	Sala sala;
	Cama cama;
	Intervencion interv;
	Premedicacion premed;
	Anestesico anestesic;
	String cantidad;
	Anestesia anest;
	String iniAnest;
	String finAnest;
	String fechaInterv;
	PersQuir cirujano;
	PersQuir primerAyudante;
	PersQuir segundoAyudante;
	PersQuir instrumentista;
	PersQuir circulante;
	PersQuir anestesiologo;
	PersQuir especialista;
	String errorValidacion;

	public DetalleInterv(Paciente paciente, ServicioHosp servhosp, Sala sala, Cama cama, Intervencion interv, Premedicacion premed, Anestesico anestesic, Anestesia anest, PersQuir cirujano, PersQuir primerAyudante, PersQuir segundoAyudante, PersQuir instrumentista, PersQuir circulante, PersQuir anestesiologo, PersQuir especialista) {
		this.paciente = paciente;
		this.servhosp = servhosp;
		this.sala = sala;
		this.cama = cama;
		this.interv = interv;
		this.premed = premed;
		this.anestesic = anestesic;
		this.anest = anest;
		this.cirujano = cirujano;
		this.primerAyudante = primerAyudante;
		this.segundoAyudante = segundoAyudante;
		this.instrumentista = instrumentista;
		this.circulante = circulante;
		this.anestesiologo = anestesiologo;
		this.especialista = especialista;
	}

	boolean validar() {
		if(!this.cantidad.matches("\\d+(\\.\\d+)?")){
			this.errorValidacion = "Cantidad incorrecta.";
			return false;
		}
		if(!this.iniAnest.matches("^[0-9]{2}:[0-9]{2}$")){
			this.errorValidacion = "Inicio incorrecto.";
			return false;
		}
		if(!this.finAnest.matches("^[0-9]{2}:[0-9]{2}$")){
			this.errorValidacion = "Fin incorrecto.";
			return false;
		}
		if(!this.fechaInterv.matches("^[0-9]{2}/[0-9]{2}/[0-9]{4}$")){
			this.errorValidacion = "Fecha de intervención incorrecta.";
			return false;
		}
		return true;
	}

	public void save() throws SQLException, ParseException {
		
		this.fechaInterv = db.changeFormatDate(this.fechaInterv, "dd/MM/yyyy", "yyyy-MM-dd");
		
		if(this.IdDetalleInterv == null){
			String sql = "INSERT INTO detalle_interv";
			sql += "(IdPaciente,IdServHosp,IdSala,IdCama,IdInterv,IdPremed,IdAnestesic,Cantidad,IdAnest,IniAnest,FinAnest,FechaInterv,IdCirujano,IdPrimerAyudante,IdSegundoAyudante,IdInstrumentista,IdCirculante,IdAnestesiologo,IdEspecialista)";
			sql += " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			List<String> data =  Arrays.asList(this.paciente.idPaciente,this.servhosp.IdServHosp,this.sala.IdSala,this.cama.IdCama,this.interv.IdInterv,this.premed.IdPremed,this.anestesic.IdAnestesic,this.cantidad,this.anest.IdAnest,this.iniAnest,this.finAnest,this.fechaInterv,this.cirujano.IdPersQuir,this.primerAyudante.IdPersQuir,this.segundoAyudante.IdPersQuir,this.instrumentista.IdPersQuir,this.circulante.IdPersQuir,this.anestesiologo.IdPersQuir,this.especialista.IdPersQuir);
			db.ejecutar(sql, data);
			this.IdDetalleInterv = db.insertId;
		} else{
			
		}
	}

	public String getTableByPaciente() throws SQLException, ParseException {
		String sql = "SELECT * FROM detalle_interv di"
				+ " LEFT JOIN serviciohosp sh ON di.IdServHosp = sh.IdServHosp"
				+ " JOIN departhosp dh ON sh.IdDepartHosp = dh.IdDepartH"
				+ " JOIN intervencion i ON di.IdInterv = i.IdInterv"
				+ " WHERE IdPaciente = ?";
		List<String> data =  Arrays.asList(this.paciente.idPaciente);
		db.ejecutar(sql, data);
		String tableContent = "";
		for(Map<String,String> row : db.results){
			tableContent += "<tr>";
			tableContent += "<td>"+db.changeFormatDate(row.get("FechaInterv"),"yyyy-MM-dd","dd/MM/yyyy")+"</td>";
			tableContent += "<td>"+row.get("DescServHosp")+"</td>";
			tableContent += "<td>"+row.get("DescDepartH")+"</td>";
			tableContent += "<td>"+row.get("DescInterv")+"</td>";
			tableContent += "<td><a href=\"Servlet?v=detalleInfoPre&id="+row.get("IdDetalleInterv")+"\" class=\"btn btn-xs btn-success\">Detalles</a></td>";
			tableContent += "</tr>";
		}
		return tableContent;
	}

	public void get() throws SQLException, ParseException {
		String sql = "SELECT * FROM detalle_interv WHERE IdDetalleInterv = ? LIMIT 1";
		List<String> data = Arrays.asList(this.IdDetalleInterv);
		db.ejecutar(sql, data);
		Map<String,String> row = db.results.get(0);
		
		Paciente pac = new Paciente(null);
		pac.idPaciente = row.get("IdPaciente");
		pac.get();
		this.paciente = pac;
		
//		DepartHosp dh = new DepartHosp();
		ServicioHosp sh = new ServicioHosp(null);
		sh.IdServHosp = row.get("IdServHosp");
		sh.get();
		this.servhosp = sh;
		
		Sala s = new Sala();
		s.IdSala = row.get("IdSala");
		s.get();
		this.sala = s;
		
		Cama c = new Cama();
		c.IdCama = row.get("IdCama");
		c.get();
		this.cama = c;
		
		Intervencion tipo = new Intervencion();
		tipo.IdInterv = row.get("IdInterv");
		tipo.get();
		this.interv = tipo;
		
		Premedicacion pm = new Premedicacion();
		pm.IdPremed = row.get("IdPremed");
		pm.get();
		this.premed = pm;
		
		Anestesico anestesico = new Anestesico();
		anestesico.IdAnestesic = row.get("IdAnestesic");
		anestesico.get();
		this.anestesic = anestesico;
		
		this.cantidad = row.get("Cantidad");
		
		Anestesia anestesia = new Anestesia();
		anestesia.IdAnest = row.get("IdAnest");
		anestesia.get();
		this.anest = anestesia;
		
		this.iniAnest = row.get("IniAnest");
		this.finAnest = row.get("FinAnest");
		this.fechaInterv = db.changeFormatDate(row.get("FechaInterv"),"yyyy-MM-dd","dd/MM/yyyy");
		
		PersQuir ciru = new PersQuir();
		ciru.IdPersQuir = row.get("IdCirujano");
		ciru.get();
		this.cirujano = ciru;
		
		PersQuir primerA = new PersQuir();
		primerA.IdPersQuir = row.get("IdPrimerAyudante");
		primerA.get();
		this.primerAyudante = primerA;
		
		PersQuir segundoA = new PersQuir();
		segundoA.IdPersQuir = row.get("IdSegundoAyudante");
		segundoA.get();
		this.segundoAyudante = segundoA;
		
		PersQuir instru = new PersQuir();
		instru.IdPersQuir = row.get("IdInstrumentista");
		instru.get();
		this.instrumentista = instru;
		
		PersQuir circu = new PersQuir();
		circu.IdPersQuir = row.get("IdCirculante");
		circu.get();
		this.circulante = circu;
		
		PersQuir anes = new PersQuir();
		anes.IdPersQuir = row.get("IdAnestesiologo");
		anes.get();
		this.anestesiologo = anes;
		
		PersQuir espec = new PersQuir();
		espec.IdPersQuir = row.get("IdEspecialista");
		espec.get();
		this.especialista = espec;
		
	}
}
