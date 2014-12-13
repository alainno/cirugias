<jsp:include page="header.jsp"/>
<h1>Nro. de Intervenciones Quirúrgicas</h1>
<form role="form" class="form-inline" action="" method="get">
	<div class="form-group">
		<label class="control-label">Especialidad</label>
		<select name="select1" id="select1" class="form-control input-sm">
			<option value="">- Todos -</option>
		</select>
		<label class="control-label ml10">Del</label>
		<input type="text" name="text1" id="text1" value="2012" class="input-sm form-control" />
		<label class="control-label">Al</label>
		<input type="text" name="text1" id="text1" value="2014" class="input-sm form-control" />
	</div>
</form>
<div class="content content-table">
	<table class="table table-hover">
		<thead>
			<tr>
				<th>Año</th>
				<th>Mes</th>
				<th>Intervenciones</th>
			</tr>
		</thead>
		<tbody>
			${tabla}
		</tbody>
	</table>
</div>
<jsp:include page="footer.jsp"/>
