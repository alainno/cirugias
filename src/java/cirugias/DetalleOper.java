/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cirugias;

import java.io.Serializable;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Nino
 */
public class DetalleOper{
	String idDetalleOper;
	String idDetalleInterv;
	Paciente paciente;
	String interAntOper;
	String fechaIniOper;
	String horaIniOper;
	String fechaFinOper;
	String horaFinOper;
	SalaOper salaOper;
	String operHoraIni;
	String operHoraFin;
	SalaRecup salaRecup;
	String recupFechaIni;
	String recupFechaFin;
	String recupHoraIni;
	String recupHoraFin;
	String protocoloOperat;
	Cie diagPre;
	Cie diagPost;
	String descEnvio;
	String obsEnvio;
	String patologia;
	String patologiaEspec;
	Complicacion comp;
	String compEspec;
	CondEgreso condEgr;
	String condEspec;
	
	List detaProcs;
	
	public DetalleOper(){
	}

	public void get() throws SQLException, ParseException{
		String sql = "SELECT * FROM detalle_operacion WHERE IdDetalleOper=? LIMIT 1";
		List<String> data = Arrays.asList(this.idDetalleOper);
		db.ejecutar(sql, data);
		Map<String,String> row = db.results.get(0);
		
		this.idDetalleInterv = row.get("IdDetalleInterv");
		
		Paciente pac = new Paciente(null);
		pac.idPaciente = row.get("IdPaciente");
		pac.get();
		this.paciente = pac;
		
		this.interAntOper = row.get("InterAntOper");
		this.fechaIniOper = row.get("FechaIniOper");
		this.horaIniOper = row.get("HoraIniOper");
		this.fechaFinOper = row.get("FechaFinOper");
		this.horaFinOper = row.get("HoraFinOper");
		
		SalaOper salao = new SalaOper();
		salao.idSalaOper = row.get("IdSalaOper");
		salao.get();
		this.salaOper = salao;
		
		this.operHoraIni = row.get("OperHoraIni");
		this.operHoraFin = row.get("OperHoraFin");
		
		SalaRecup salar = new SalaRecup();
		salar.idSalaRecup = row.get("IdSalaRecup");
		salar.get();
		this.salaRecup = salar;
		
		this.recupFechaIni = row.get("RecupFechaIni");
		this.recupHoraIni = row.get("RecupHoraIni");
		this.recupFechaFin = row.get("RecupFechaFin");
		this.recupHoraFin = row.get("RecupHoraFin");
		
		DetalleProcs detaproc = new DetalleProcs();
		detaproc.idDetalleOper = this.idDetalleOper;
		this.detaProcs = detaproc.getDetalleProcs();
		
		this.protocoloOperat = row.get("ProtocoloOperat");
		
		Cie diag_pre = new Cie();
		diag_pre.idCie = row.get("IdDiagPre");
		diag_pre.get();
		this.diagPre = diag_pre;
		
		Cie diag_post = new Cie();
		diag_post.idCie = row.get("IdDiagPost");
		diag_post.get();
		this.diagPost = diag_post;
		
		this.descEnvio = row.get("DescEnvio");
		this.obsEnvio = row.get("ObsEnvio");
		this.patologia = row.get("Patologia").equals("1") ? "SI" : "NO";;
		this.patologiaEspec = row.get("PatologiaEspec");
		
		Complicacion compli = new Complicacion();
		compli.idComp = row.get("IdComp");
		compli.get();
		this.comp = compli;
		this.compEspec = row.get("CompEspec");
		
		CondEgreso conde = new CondEgreso();
		conde.idCondEgr = row.get("IdCondEgr");
		conde.get();
		this.condEgr = conde;
		this.condEspec = row.get("CondEspec");
	}
	
	/////////////////
	public String getIdDetalleOper() {
		return idDetalleOper;
	}

	public void setIdDetalleOper(String idDetalleOper) {
		this.idDetalleOper = idDetalleOper;
	}

	public String getIdDetalleInterv() {
		return idDetalleInterv;
	}

	public void setIdDetalleInterv(String idDetalleInterv) {
		this.idDetalleInterv = idDetalleInterv;
	}

	public Paciente getPaciente() {
		return paciente;
	}

	public void setPaciente(Paciente paciente) {
		this.paciente = paciente;
	}

	public String getInterAntOper() {
		return interAntOper;
	}

	public void setInterAntOper(String interAntOper) {
		this.interAntOper = interAntOper;
	}

	public String getFechaIniOper() {
		return fechaIniOper;
	}

	public void setFechaIniOper(String fechaIniOper) {
		this.fechaIniOper = fechaIniOper;
	}

	public String getHoraIniOper() {
		return horaIniOper;
	}

	public void setHoraIniOper(String horaIniOper) {
		this.horaIniOper = horaIniOper;
	}

	public String getFechaFinOper() {
		return fechaFinOper;
	}

	public void setFechaFinOper(String fechaFinOper) {
		this.fechaFinOper = fechaFinOper;
	}

	public String getHoraFinOper() {
		return horaFinOper;
	}

	public void setHoraFinOper(String horaFinOper) {
		this.horaFinOper = horaFinOper;
	}

	public SalaOper getSalaOper() {
		return salaOper;
	}

	public void setSalaOper(SalaOper salaOper) {
		this.salaOper = salaOper;
	}

	public String getOperHoraIni() {
		return operHoraIni;
	}

	public void setOperHoraIni(String operHoraIni) {
		this.operHoraIni = operHoraIni;
	}

	public String getOperHoraFin() {
		return operHoraFin;
	}

	public void setOperHoraFin(String operHoraFin) {
		this.operHoraFin = operHoraFin;
	}

	public SalaRecup getSalaRecup() {
		return salaRecup;
	}

	public void setSalaRecup(SalaRecup salaRecup) {
		this.salaRecup = salaRecup;
	}

	public String getRecupFechaIni() {
		return recupFechaIni;
	}

	public void setRecupFechaIni(String recupFechaIni) {
		this.recupFechaIni = recupFechaIni;
	}

	public String getRecupFechaFin() {
		return recupFechaFin;
	}

	public void setRecupFechaFin(String recupFechaFin) {
		this.recupFechaFin = recupFechaFin;
	}

	public String getRecupHoraIni() {
		return recupHoraIni;
	}

	public void setRecupHoraIni(String recupHoraIni) {
		this.recupHoraIni = recupHoraIni;
	}

	public String getRecupHoraFin() {
		return recupHoraFin;
	}

	public void setRecupHoraFin(String recupHoraFin) {
		this.recupHoraFin = recupHoraFin;
	}

	public String getProtocoloOperat() {
		return protocoloOperat;
	}

	public void setProtocoloOperat(String protocoloOperat) {
		this.protocoloOperat = protocoloOperat;
	}

	public Cie getDiagPre() {
		return diagPre;
	}

	public void setDiagPre(Cie diagPre) {
		this.diagPre = diagPre;
	}

	public Cie getDiagPost() {
		return diagPost;
	}

	public void setDiagPost(Cie diagPost) {
		this.diagPost = diagPost;
	}

	public String getDescEnvio() {
		return descEnvio;
	}

	public void setDescEnvio(String descEnvio) {
		this.descEnvio = descEnvio;
	}

	public String getObsEnvio() {
		return obsEnvio;
	}

	public void setObsEnvio(String obsEnvio) {
		this.obsEnvio = obsEnvio;
	}

	public String getPatologia() {
		return patologia;
	}

	public void setPatologia(String patologia) {
		this.patologia = patologia;
	}

	public String getPatologiaEspec() {
		return patologiaEspec;
	}

	public void setPatologiaEspec(String patologiaEspec) {
		this.patologiaEspec = patologiaEspec;
	}

	public Complicacion getComp() {
		return comp;
	}

	public void setComp(Complicacion comp) {
		this.comp = comp;
	}

	public String getCompEspec() {
		return compEspec;
	}

	public void setCompEspec(String compEspec) {
		this.compEspec = compEspec;
	}

	public CondEgreso getCondEgr() {
		return condEgr;
	}

	public void setCondEgr(CondEgreso condEgr) {
		this.condEgr = condEgr;
	}

	public String getCondEspec() {
		return condEspec;
	}

	public void setCondEspec(String condEspec) {
		this.condEspec = condEspec;
	}

	public List getDetaProcs() {
		return detaProcs;
	}

	public void setDetaProcs(List detaProcs) {
		this.detaProcs = detaProcs;
	}
}
