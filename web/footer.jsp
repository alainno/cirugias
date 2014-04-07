</div>
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins.js"></script>
${masScripts}
<%
	String[] scripts = request.getParameterValues("masScripts");
	if(scripts != null){
	for(int i=0;i<scripts.length;i++){ %>
	<script src="<%=scripts[i]%>"></script>
<% }} %>
</body>
</html>