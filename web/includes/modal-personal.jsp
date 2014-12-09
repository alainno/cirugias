<div class="modal" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">Nuevo Personal</h4>
            </div>
            <div class="modal-body">
                <form name="form1" action="Ajax?v=guardarPersonal" method="post" class="form-horizontal form-modal">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Nombre del personal</label>
                        <div class="col-sm-6">
                            <input type="text" name="nombre" id="text1" value="" class="form-control input-sm" required="" />
                            <input type="hidden" id="input-target" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-6 col-sm-offset-4">
                            <button type="submit" class="btn btn-primary btn-sm" data-loading-text="Cargando...">Guardar</button>
                            <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancelar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>