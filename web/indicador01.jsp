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
				<th>Mes</th>
				<th>Intervenciones</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Enero 2012</td>
				<td>20</td>
			</tr>
			<tr>
				<td>Febrero 2012</td>
				<td>21</td>
			</tr>
			<tr>
				<td>Marzo 2012</td>
				<td>22</td>
			</tr>
			<tr>
				<td>...</td>
				<td>...</td>
			</tr>
		</tbody>
	</table>
</div>
<jsp:include page="footer.jsp"/>
