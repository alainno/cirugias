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
class DetalleOper {
	String IdDetalleOper;
	String IdDetalleInterv;
	Paciente paciente;
	String InterAntOper;
	String FechaIniOper;
	String HoraIniOper;
	String FechaFinOper;
	String HoraFinOper;
	SalaOper salaOper;
	String OperHoraIni;
	String OperHoraFin;
	SalaRecup salaRecup;
	String RecupFechaIni;
	String RecupFechaFin;
	String RecupHoraIni;
	String RecupHoraFin;
	String ProtocoloOperat;
	Cie diagPre;
	Cie diagPost;
	String DescEnvio;
	String ObsEnvio;
	String Patologia;
	String PatologiaEspec;
	Complicacion comp;
	String CompEspec;
	CondEgreso condEgr;
	String CondEspec;

	public void get() throws SQLException, ParseException{
		String sql = "SELECT * FROM detalle_operacion WHERE IdDetalleOper=? LIMIT 1";
		List<String> data = Arrays.asList(this.IdDetalleOper);
		db.ejecutar(sql, data);
		Map<String,String> row = db.results.get(0);
		
		this.IdDetalleInterv = row.get("IdDetalleInterv");
		
		Paciente paciente = new Paciente(null);
		paciente.idPaciente = row.get("IdPaciente");
		paciente.get();
		this.paciente = paciente;
	}
	
	/////////////////
	public String getIdDetalleOper() {
		return IdDetalleOper;
	}

	public void setIdDetalleOper(String IdDetalleOper) {
		this.IdDetalleOper = IdDetalleOper;
	}

	public String getIdDetalleInterv() {
		return IdDetalleInterv;
	}

	public void setIdDetalleInterv(String IdDetalleInterv) {
		this.IdDetalleInterv = IdDetalleInterv;
	}

	public Paciente getPaciente() {
		return paciente;
	}

	public void setPaciente(Paciente paciente) {
		this.paciente = paciente;
	}

	public String getInterAntOper() {
		return InterAntOper;
	}

	public void setInterAntOper(String InterAntOper) {
		this.InterAntOper = InterAntOper;
	}

	public String getFechaIniOper() {
		return FechaIniOper;
	}

	public void setFechaIniOper(String FechaIniOper) {
		this.FechaIniOper = FechaIniOper;
	}

	public String getHoraIniOper() {
		return HoraIniOper;
	}

	public void setHoraIniOper(String HoraIniOper) {
		this.HoraIniOper = HoraIniOper;
	}

	public String getFechaFinOper() {
		return FechaFinOper;
	}

	public void setFechaFinOper(String FechaFinOper) {
		this.FechaFinOper = FechaFinOper;
	}

	public String getHoraFinOper() {
		return HoraFinOper;
	}

	public void setHoraFinOper(String HoraFinOper) {
		this.HoraFinOper = HoraFinOper;
	}

	public SalaOper getSalaOper() {
		return salaOper;
	}

	public void setSalaOper(SalaOper salaOper) {
		this.salaOper = salaOper;
	}

	public String getOperHoraIni() {
		return OperHoraIni;
	}

	public void setOperHoraIni(String OperHoraIni) {
		this.OperHoraIni = OperHoraIni;
	}

	public String getOperHoraFin() {
		return OperHoraFin;
	}

	public void setOperHoraFin(String OperHoraFin) {
		this.OperHoraFin = OperHoraFin;
	}

	public SalaRecup getSalaRecup() {
		return salaRecup;
	}

	public void setSalaRecup(SalaRecup salaRecup) {
		this.salaRecup = salaRecup;
	}

	public String getRecupFechaIni() {
		return RecupFechaIni;
	}

	public void setRecupFechaIni(String RecupFechaIni) {
		this.RecupFechaIni = RecupFechaIni;
	}

	public String getRecupFechaFin() {
		return RecupFechaFin;
	}

	public void setRecupFechaFin(String RecupFechaFin) {
		this.RecupFechaFin = RecupFechaFin;
	}

	public String getRecupHoraIni() {
		return RecupHoraIni;
	}

	public void setRecupHoraIni(String RecupHoraIni) {
		this.RecupHoraIni = RecupHoraIni;
	}

	public String getRecupHoraFin() {
		return RecupHoraFin;
	}

	public void setRecupHoraFin(String RecupHoraFin) {
		this.RecupHoraFin = RecupHoraFin;
	}

	public String getProtocoloOperat() {
		return ProtocoloOperat;
	}

	public void setProtocoloOperat(String ProtocoloOperat) {
		this.ProtocoloOperat = ProtocoloOperat;
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
		return DescEnvio;
	}

	public void setDescEnvio(String DescEnvio) {
		this.DescEnvio = DescEnvio;
	}

	public String getObsEnvio() {
		return ObsEnvio;
	}

	public void setObsEnvio(String ObsEnvio) {
		this.ObsEnvio = ObsEnvio;
	}

	public String getPatologia() {
		return Patologia;
	}

	public void setPatologia(String Patologia) {
		this.Patologia = Patologia;
	}

	public String getPatologiaEspec() {
		return PatologiaEspec;
	}

	public void setPatologiaEspec(String PatologiaEspec) {
		this.PatologiaEspec = PatologiaEspec;
	}

	public Complicacion getComp() {
		return comp;
	}

	public void setComp(Complicacion comp) {
		this.comp = comp;
	}

	public String getCompEspec() {
		return CompEspec;
	}

	public void setCompEspec(String CompEspec) {
		this.CompEspec = CompEspec;
	}

	public CondEgreso getCondEgr() {
		return condEgr;
	}

	public void setCondEgr(CondEgreso condEgr) {
		this.condEgr = condEgr;
	}

	public String getCondEspec() {
		return CondEspec;
	}

	public void setCondEspec(String CondEspec) {
		this.CondEspec = CondEspec;
	}
	
	
}
